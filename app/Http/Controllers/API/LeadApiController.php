<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\LeadAgent;
use App\User;
use App\Lead;
use App\LeadFollowUp;
use App\LeadStatus;
use Carbon\Carbon;
use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\API\BaseController as BaseController;
use DB;

class LeadApiController extends BaseController
{
    public function getLeads(Request $request)
    {
        $agent = LeadAgent::where('user_id', auth()->user()->id)->first();
        $agentId = ($agent) ? $agent->id : '';

        if (!auth()->user()->cans('view_lead')) {
        $totalLeads = Lead::with('nextFollow')->leftjoin('lead_follow_up', 'lead_follow_up.lead_id', 'leads.id')
    ->where('leads.agent_id', $agentId)
    ->select('leads.*', 'lead_follow_up.id as followup_id','leads.created_at as leads_created_at')
    ->groupBy('leads.id');
    // ->orderBy('leads.id', 'DESC');
    if($request->sort)
    {
        $totalLeads = $totalLeads->orderBy('leads.created_at', $request->sort);
    }

if ($request->from_date && $request->to_date) {
    $totalLeads = $totalLeads->whereBetween('leads.created_at', [Carbon::parse($request->from_date)->format('Y-m-d'),Carbon::parse($request->to_date)->format('Y-m-d')]);
}
if ($request->from_date) {
    $totalLeads = $totalLeads->whereDate('leads.created_at', Carbon::parse($request->from_date)->format('Y-m-d'));
}

if ($request->status_id) {
    $totalLeads = $totalLeads->where('leads.status_id', $request->status_id);
}

if ($request->lead_type) {
    $totalLeads = $totalLeads->where('leads.lead_type', $request->lead_type);
}

$totalLeads = $totalLeads->paginate(15);

        } else {
            $totalLeads = Lead::all();
        }
            
        $totalLeadsCount = $totalLeads->count();

        $pendingLeadFollowUps=[];
        if (auth()->user()->cans('view_lead')) {
        $pendingLeadFollowUps = LeadFollowUp::where(\DB::raw('DATE(next_follow_up_date)'), '<=', Carbon::today()->format('Y-m-d'))
            ->join('leads', 'leads.id', 'lead_follow_up.lead_id')
            ->where('leads.next_follow_up', 'yes')
            ->where('leads.agent_id', $agentId)
            ->count();
        }
        $todaysFollowupdetails = LeadFollowUp::where(\DB::raw('DATE(next_follow_up_date)'),Carbon::today()->format('Y-m-d'))
        ->join('leads', 'leads.id', 'lead_follow_up.lead_id')
        ->where('leads.next_follow_up', 'yes')
        ->where('leads.agent_id', $agentId)->get();

        $todaysFollowups = $todaysFollowupdetails->count();
    
        $followupsDetails = LeadFollowUp::join('leads','lead_follow_up.lead_id','leads.id')
        ->where('leads.agent_id', $agentId)
        ->select('lead_follow_up.*', 'leads.*', 'lead_follow_up.created_at as followup_created_at') 
        ->get();
        // $nextFollowupsDetails = LeadFollowUp::join('leads', 'lead_follow_up.lead_id', '=', 'leads.id')
        // ->where('leads.agent_id', $agentId)
        // ->whereDate('lead_follow_up.next_follow_up_date','>=',Carbon::today()) // Filter by current date
        // ->select('lead_follow_up.*', 'leads.*', 'lead_follow_up.created_at as followup_created_at')
        // ->orderBy('lead_follow_up.next_follow_up_date', 'asc')
        // ->get();
        $followupsLeadList = Lead::with('follow')->leftJoin('lead_status', 'leads.status_id', '=', 'lead_status.id')
       ->leftJoin('lead_follow_up', 'leads.id', '=', 'lead_follow_up.lead_id')
       ->where('leads.agent_id', $agentId)
       ->select('leads.*', 'lead_status.type as status_type','lead_follow_up.created_at as followup_created_at') 
       ->groupBy('leads.id')
       ->get(); 


       $pendingLeadlist = [];
       $processLeadlist = [];
       $confirmedLeadList = [];

       foreach ($followupsLeadList as $lead) {
        if ($lead->status_type == 'pending') {
                $pendingLeadlist[] = $lead;
            } 
            elseif($lead->status_type == 'inprocess')
            {
                $processLeadlist[] = $lead;
            }
            elseif ($lead->status_type == 'converted') {
             $confirmedLeadList[] = $lead;
             }
          }

            
        return $this->sendResponse([
            'totalLeads' => $totalLeads,
            'totalLeadsCount' => $totalLeadsCount,
            'pendingLeadFollowUps'=>$pendingLeadFollowUps,
            'todaysFollowups' => $todaysFollowups,
            'followupsDetails' => $followupsDetails,
            'todaysFollowupdetails' => $todaysFollowupdetails,
            'pendingLeadCount' => count($pendingLeadlist), 
            'processLeadCount' => count($processLeadlist), 
            'confirmedLeadCount' => count($confirmedLeadList), 
        ], 'Leads fetch successful.');
    }
    public function add_new_lead(Request $request)
    {

            $leadStatus = LeadStatus::where('default', '1')->first();
        
            $lead = Lead::create([
                'company_name' => $request->company_name,
                'address' => $request->address,
                'client_name' => $request->client_name,
                'status_id' => $leadStatus->id,
                'client_email' => $request->email,
                'mobile' => $request->mobile,
                'note' => $request->feedback,
                'lead_type' => $request->lead_type,
                'next_follow_up' => ($request->next_follow_up) ? $request->next_follow_up : 'yes',
                'value' => ($request->value) ? $request->value : 0,
                'column_priority' => 0,
                'agent_id' => $request->agent_id,
            ]);
        
            return response()->json(['success' => true, 'message' => 'Lead created successfully', 'data' => $lead], 200);
       
    }    
    public function getPendingDetails(Request $request)
    {
        $agent = LeadAgent::where('user_id', auth()->user()->id)->first();
        $agentId = ($agent) ? $agent->id : '';

        $followupsLeadList = Lead::with('follow')->leftJoin('lead_status', 'leads.status_id', '=', 'lead_status.id')
       ->leftJoin('lead_follow_up', 'leads.id', '=', 'lead_follow_up.lead_id')
       ->where('leads.agent_id', $agentId)
       ->select('leads.*', 'lead_status.type as status_type','lead_follow_up.created_at as followup_created_at') 
       ->groupBy('leads.id')
       ->get(); 


       $pendingLeadlist = [];
       $processLeadlist = [];
       $confirmedLeadList = [];

       foreach ($followupsLeadList as $lead) {
        if (isset($request->call_status)) {
            if ($lead->call_status == $request->call_status) {
                if ($lead->status_type == 'pending') {
                    $pendingLeadlist[] = $lead;
                } elseif ($lead->status_type == 'inprocess') {
                    $processLeadlist[] = $lead;
                } elseif ($lead->status_type == 'converted') {
                    $confirmedLeadList[] = $lead;
                }
            }
        } else {
            if ($lead->status_type == 'pending') {
                $pendingLeadlist[] = $lead;
            } elseif ($lead->status_type == 'inprocess') {
                $processLeadlist[] = $lead;
            } elseif ($lead->status_type == 'converted') {
                $confirmedLeadList[] = $lead;
            }
        }
    }    
          return $this->sendResponse([
            'pendingLeadlist' => $pendingLeadlist,
            'processLeadlist' => $processLeadlist,
            'confirmedLeadList' => $confirmedLeadList,
        ], 'Leads fetch successful.');
    }
//     public function getPendingDetails(Request $request)
// {
//     $agentId = LeadAgent::where('user_id', auth()->user()->id)->value('id') ?? '';

//     // Reusable function to fetch and paginate leads by status
//     $getLeadsByStatus = function ($status, $pageKey) use ($agentId, $request) {
//         return Lead::with('follow')
//             ->leftJoin('lead_status', 'leads.status_id', '=', 'lead_status.id')
//             ->where('leads.agent_id', $agentId)
//             ->where('lead_status.type', $status)
//             ->when($request->has('call_status'), function ($query) use ($request) {
//                 $query->where('call_status', $request->call_status);
//             })
//             ->select('leads.*', 'lead_status.type as status_type')
//             ->groupBy('leads.id')
//             ->paginate(10, ['*'], $pageKey, $request->input($pageKey, 1));
//     };

//     // Fetch leads with pagination
//     $pendingLeadlist = $getLeadsByStatus('pending', 'pending_page');
//     $processLeadlist = $getLeadsByStatus('inprocess', 'process_page');
//     $confirmedLeadList = $getLeadsByStatus('converted', 'confirmed_page');

//     return $this->sendResponse([
//         'pendingLeadlist' => $pendingLeadlist,
//         'processLeadlist' => $processLeadlist,
//         'confirmedLeadList' => $confirmedLeadList,
//     ], 'Leads fetch successful.');
// }

    public function update_lead(Request $request,$id)
    {

    $lead = Lead::findOrFail($id);
    $lead->update([
        'company_name' => $request->company_name,
        'address' => $request->address,
        'client_name' => $request->client_name,
        'client_email' => $request->email,
        'mobile' => $request->mobile,
        'note' => $request->feedback,
        'status_id' => $request->lead_status,
        'lead_type' => $request->lead_type,
        'next_follow_up' => ($request->next_follow_up) ? $request->next_follow_up : 'yes',
        'value' => ($request->value) ? $request->value : 0,
        'column_priority' => 0,
    ]);

    return response()->json([
        'message' => 'Lead updated successfully!',
        'data' => $lead,  
    ], 200);
        
    }
    public function add_follow_up(Request $request)
    {
        $nextFollowup = date('Y-m-d H:i:s', strtotime($request->next_followup_date));
        $addFollowup = new LeadFollowUp();
        $addFollowup->lead_id = $request->lead_id;
        $addFollowup->remark = $request->description;
        $addFollowup->next_follow_up_date = $nextFollowup;
        $addFollowup->save();
        $leadStatus = Lead::where('id',$request->lead_id)->update([
            'status_id' => $request->status,
        ]);
        return response()->json([
            'message' => 'FollowUp Added successfully!',
            'data' => $addFollowup,  
            'leadStatus' => $leadStatus,
        ], 200);

    }
    public function getLeadDetails($id)
    {
        $agent = LeadAgent::where('user_id', auth()->user()->id)->first();
        $agentId = ($agent) ? $agent->id : '';
        $leadDetail = Lead::where('leads.agent_id', $agentId)->find($id);
        $leadFollowupDetails = LeadFollowUp::where('lead_id',$id)
        ->select('lead_follow_up.*','lead_follow_up.created_at as followup_created_at')
        ->orderBy('lead_follow_up.id','DESC')
        ->get();
    
        return response()->json([
            'message' => 'Lead Details fetch successful!',
            'data' => $leadDetail, 
             'leadFollowupDetails' =>$leadFollowupDetails,
        ], 200);
        
    }
    public function update_followup_status(Request $request,$id)
    {
        $updateLeadStatus = Lead::findOrFail($id);
        $updateLeadStatus->update([
            'status_id' => $request->lead_status,
        ]);
        return response()->json([
            'message' => 'Lead status updated successful!',
            'data' => $updateLeadStatus, 
        ],200);
    }
    public function getLeadAgent($id)
    {
        $leadAgent = LeadAgent::where('user_id',$id)->first();
        $agentId = $leadAgent->id;
        return response()->json([
            'message' => 'Lead agent fetch successful!',
            'agentId' => $agentId, 
        ],200);

    }
    public function viewStatusUpdate(Request $request,$id)
    {
        $followupHide = LeadFollowUp::where('id',$id)->update([
            'is_hidden' => $request->status,
        ]);
        return response()->json([
            'message' => 'Follwup view status updated successfully!',
            'followupHide' => $followupHide,
        ],200);
    }
    public function updateCallStatus(Request $request)
    {
        $leadId = $request->lead_id;
        $agentId = $request->agent_id;
        $updatecallStatus = Lead::where('id',$leadId)->where('agent_id',$agentId)->first();
        $updatecallStatus->update([
            'call_status' => $request->status,
        ]);
        return response()->json([
            'message' => 'Lead call status updated successful!',
        ],200);
    }
    public function updateNotAnswer(Request $request)
    {
        $leadId = $request->lead_id;
        $agentId = $request->agent_id;
        $updateNotAnswer = Lead::where('id',$leadId)->where('agent_id',$agentId)->first();
        $updateNotAnswer->update([
            'not_answer' => $request->status,
        ]);
        return response()->json([
            'message' => 'Call Not Answer status updated successful!',
        ],200);
    }
    public function search_leads(Request $request)
    {
        $agent = LeadAgent::where('user_id', auth()->user()->id)->first();
        $agentId = ($agent) ? $agent->id : '';
        
        $leads = Lead::with('nextFollow')->leftjoin('lead_follow_up', 'lead_follow_up.lead_id', 'leads.id')
        ->where('leads.agent_id', $agentId)
        ->select('leads.*', 'lead_follow_up.id as followup_id','leads.created_at as leads_created_at')
        ->groupBy('leads.id');

        $name = $request->input('name');
        $mobile = $request->input('phone_number');
        
        if($name)
        {
            $leads->where('client_name', 'like', "%{$name}%");
        }
        if($mobile)
        {
            $leads->where('mobile', 'like', "%{$mobile}%");
        }
        $searchResults = $leads->get();

        return $this->sendResponse([
            'searchResults' => $searchResults,
        ], 'Leads search successful.');
    }
}
