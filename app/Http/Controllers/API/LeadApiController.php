<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\LeadAgent;
use App\User;
use App\Lead;
use App\LeadFollowUp;
use Carbon\Carbon;
use App\Http\Controllers\API\BaseController as BaseController;
use DB;

class LeadApiController extends BaseController
{
    public function getLeads(Request $request)
    {
        $agent = LeadAgent::where('user_id', auth()->user()->id)->first();
        $agentId = ($agent) ? $agent->id : '';

        if (!auth()->user()->cans('view_lead')) {
            $totalLeads = Lead::where('leads.agent_id', $agentId)->get();
        } else {
            $totalLeads = Lead::all();
        }
        $totalClientConverted = $totalLeads->filter(function ($value, $key) {
            return $value->client_id != null;
        });
        $totalLeadsCount = $totalLeads->count();
        $totalClientConverted = $totalClientConverted->count();

        $pendingLeadFollowUps=[];
        if (auth()->user()->cans('view_lead')) {
        $pendingLeadFollowUps = LeadFollowUp::where(\DB::raw('DATE(next_follow_up_date)'), '<=', Carbon::today()->format('Y-m-d'))
            ->join('leads', 'leads.id', 'lead_follow_up.lead_id')
            ->where('leads.next_follow_up', 'yes')
            ->where('leads.agent_id', $agentId)
            ->count();
        }
        $todaysFollowups = LeadFollowUp::where(\DB::raw('DATE(next_follow_up_date)'),Carbon::today()->format('Y-m-d'))
        ->join('leads', 'leads.id', 'lead_follow_up.lead_id')
        ->where('leads.next_follow_up', 'yes')
        ->where('leads.agent_id', $agentId)->count();
    
        $followupsDetails = LeadFollowUp::join('leads','lead_follow_up.lead_id','leads.id')
        ->where('leads.agent_id', $agentId)
        ->select('lead_follow_up.*', 'leads.*', 'lead_follow_up.created_at as followup_created_at') 
        ->get();
            
        return $this->sendResponse([
            'totalLeads' => $totalLeads,
            'totalLeadsCount' => $totalLeadsCount,
            'totalClientConverted' => $totalClientConverted,
            'pendingLeadFollowUps'=>$pendingLeadFollowUps,
            'todaysFollowups' => $todaysFollowups,
            'followupsDetails' => $followupsDetails,
            'pendingLeadlist' => $pendingLeadlist,
        ], 'Leads fetch successful.');
    }
    public function add_new_lead(Request $request)
    {
        $lead = new Lead();
        
        $lead->client_name = $request->lead_name;
        $lead->client_email = $request->email;
        $lead->mobile = $request->mobile;
        $lead->agent_id = $request->agent_name;
        $lead->save();

        // Return response
        return response()->json([
            'message' => 'Lead created successfully!',
            'lead' => $lead,
        ], 201);
    }
    public function getPendingDetails()
    {
        $agent = LeadAgent::where('user_id', auth()->user()->id)->first();
        $agentId = ($agent) ? $agent->id : '';

        $followupsLeadList = Lead::with('follow')->leftJoin('lead_status', 'leads.status_id', '=', 'lead_status.id')
       ->where('leads.agent_id', $agentId)
       ->get(); 
       return $followupsLeadList;

       $pendingLeadlist = [];
       $confirmedLeadList = [];

       foreach ($followupsLeadList as $lead) {
        if ($lead->type == 'pending' || $lead->type == 'inprocess') {
                $pendingLeadlist[] = $lead;
            } elseif ($lead->type == 'converted') {
             $confirmedLeadList[] = $lead;
             }
          }
          return $this->sendResponse([
            'pendingLeadlist' => $pendingLeadlist,
            'confirmedLeadList' => $confirmedLeadList,
        ], 'Leads fetch successful.');
    }
}
