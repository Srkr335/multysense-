<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\LeadAgent;
use App\User;
use App\Lead;
use App\LeadFollowUp;
use App\Http\Controllers\API\BaseController as BaseController;

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

        // $pendingLeadFollowUps = LeadFollowUp::where(\DB::raw('DATE(next_follow_up_date)'), '<=', Carbon::today()->format('Y-m-d'))
        //     ->join('leads', 'leads.id', 'lead_follow_up.lead_id')
        //     ->where('leads.next_follow_up', 'yes');
            // return $pendingLeadFollowUps;

        // if (!$this->user->cans('view_lead')) {
        //     $pendingLeadFollowUps = $pendingLeadFollowUps->where('leads.agent_id', $this->user->id);
        // }

        // $this->pendingLeadFollowUps = $pendingLeadFollowUps->count();
        // $this->leadAgents = LeadAgent::with('user')->has('user')->get();

        return response()->json([
            'totalLeads' => $totalLeads,
            'totalLeadsCount' => $totalLeadsCount,
            'totalClientConverted' => $totalClientConverted,
        ]);
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
}
