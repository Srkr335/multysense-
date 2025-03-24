<?php

namespace App\Http\Controllers\Admin;

use App\User;
use App\LeadAgent;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use App\Http\Controllers\Controller;
use Yajra\DataTables\Facades\DataTables;
use App\DataTables\Admin\AgentsDataTable;
use App\DataTables\Admin\AgentCorrespondingDataTable;

class ManageAgentsController extends AdminBaseController
{
    public function __construct()
    {
        parent::__construct();
        $this->pageIcon = __('icon-people');
        $this->pageTitle = 'app.agent';
        $this->middleware(function ($request, $next) {
            abort_if(!in_array('leads', $this->user->modules), 403);
            return $next($request);
        });
    }
    public function index(AgentsDataTable $dataTable)
    {
        $this->agents = LeadAgent::with('userDetails')->get();
        // dd( $this->agents);
        $this->totalAgents = count($this->agents);
        $this->employees = User::allEmployees();
        return $dataTable->render('admin.agents.index', $this->data);

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $agent = new LeadAgent();
        $agent->user_id = $request->agent_id;
        $agent->save();
        return redirect()->route('admin.agents.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
    public function correspondingleads($id, AgentCorrespondingDataTable $dataTable)
    {
        // Set page title
        $this->pageTitle = 'Corresponding Leads';
        $this->data['pageTitle'] = $this->pageTitle;
    
        try {
            // Pass the ID to DataTable and render the view
            return $dataTable->with('id', $id)->render('admin.agents.corresponding', $this->data);
        } catch (\Exception $e) {
            // Log the error
            Log::error('Error rendering corresponding leads DataTable: ' . $e->getMessage());
    
            // Display a simple error page
        }
    }
}
