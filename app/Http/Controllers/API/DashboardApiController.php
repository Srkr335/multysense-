<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\LeadAgent;
use App\User;
use App\Http\Controllers\API\BaseController as BaseController;

class DashboardApiController extends BaseController
{
    public function getDashboardData(Request $request,$id)
    {
        $lead_agent = LeadAgent::join('leads', 'lead_agents.id', '=', 'leads.agent_id')
        ->where('lead_agents.user_id', $id)
        ->get(); 
        $total_lead =  $lead_agent -> count();
        return response()->json([
            'total_lead' => $total_lead,
        ]);
    }
}
