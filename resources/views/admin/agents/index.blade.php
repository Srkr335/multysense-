@extends('layouts.app')

@section('page-title')
<div class="row bg-title">

<!-- .page title -->
<div class="col-lg-8 col-md-5 col-sm-6 col-xs-12 bg-title-left">
    <h4 class="page-title"><i class="{{ $pageIcon }}"></i> {{ __($pageTitle) }}
        <span class="text-info b-l p-l-10 m-l-5">{{ $totalAgents }}</span> 
        <span class="font-12 text-muted m-l-5"> @lang('modules.dashboard.totalAgents')</span>
    </h4>
</div>
<!-- /.page title -->
<!-- .breadcrumb -->
<div class="col-lg-4 col-sm-6 col-md-7 col-xs-12 text-right bg-title-right">
    <a href="" data-toggle="modal" data-target="#exampleModal"
    class="btn btn-outline btn-success btn-sm">@lang('modules.lead.addNewAgent') <i class="fa fa-plus"
                                                                                       aria-hidden="true"></i></a>
    <ol class="breadcrumb">
        <li><a href="{{ route('admin.dashboard') }}">@lang('app.menu.home')</a></li>
        <li class="active">{{ __($pageTitle) }}</li>
    </ol>
</div>
<!-- /.breadcrumb -->
</div>
@endsection

@push('head-script')
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.13/css/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.1.1/css/responsive.bootstrap.min.css">
    <link rel="stylesheet" href="//cdn.datatables.net/buttons/1.2.2/css/buttons.dataTables.min.css">

    <link rel="stylesheet" href="{{ asset('plugins/bower_components/bootstrap-datepicker/bootstrap-datepicker.min.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('plugins/daterange-picker/daterangepicker.css') }}" />

    <style>
    .filter-section::-webkit-scrollbar {
    display: block !important;
    }
    </style>

@endpush
@section('filter-section')
<div class="row"  id="ticket-filters">
    
    <form action="" id="filter-form">
        <div class="col-xs-12">
            <h5 >@lang('app.selectDateRange')</h5>
            <div class="form-group">
                <div id="reportrange" class="form-control reportrange">
                    <i class="fa fa-calendar"></i>&nbsp;
                    <span></span> <i class="fa fa-caret-down pull-right"></i>
                </div>

                <input type="hidden" class="form-control" id="start-date" placeholder="@lang('app.startDate')"
                       value=""/>
                <input type="hidden" class="form-control" id="end-date" placeholder="@lang('app.endDate')"
                       value=""/>
            </div>
        </div>

        <div class="col-xs-12">
            <div class="form-group">
                <h5 >@lang('app.client')</h5>
                <select class="form-control select2" name="client" id="client" data-style="form-control">
                    <option value="all">@lang('modules.client.all')</option>
                </select>
            </div>
        </div>
        <div class="col-md-12">
            <div class="form-group">
                <h5>@lang('app.category')</h5>
                <select class="form-control select2" name="category_id" id="category_id"
                        data-style="form-control">
                    <option value="all">@lang('modules.client.all')</option>
                </select>
            </div>
        </div>
        <div class="col-md-12">
            <div class="form-group">
                <h5>@lang('modules.productCategory.subCategory')</h5>
                <select class="form-control select2" name="sub_category_id" id="sub_category_id"
                        data-style="form-control">
                    <option value="all">@lang('modules.client.all')</option>
                </select>
            </div>
        </div>

        <div class="col-md-12">
            <div class="form-group">
                <h5>@lang('modules.logTimeSetting.project')</h5>
                <select class="form-control select2" name="project_id" id="project_id"
                        data-style="form-control">
                    <option value="all">@lang('modules.client.all')</option>
                </select>
            </div>
        </div>
        <div class="col-md-12">
            <div class="form-group">
                <h5>@lang('modules.contracts.contractType')</h5>
                <select class="form-control select2" name="contract_type_id" id="contract_type_id"
                        data-style="form-control">
                    <option value="all">@lang('modules.client.all')</option>
                </select>
            </div>
        </div>
        <div class="col-md-12">
            <div class="form-group">
                <h5>@lang('modules.stripeCustomerAddress.country')</h5>
                <select class="form-control select2" name="country_id" id="country_id"
                        data-style="form-control">
                    <option value="all">@lang('modules.client.all')</option>
                </select>
            </div>
        </div>
        <div class="col-xs-12">
            <div class="form-group p-t-10">
                <button type="button" id="apply-filters" class="btn btn-success col-md-6"><i class="fa fa-check"></i> @lang('app.apply')</button>
                <button type="button" id="reset-filters" class="btn btn-inverse col-md-5 col-md-offset-1"><i class="fa fa-refresh"></i> @lang('app.reset')</button>
            </div>
        </div>
    </form>
</div>
@endsection
@section('content')

    <div class="row">
 
        <div class="col-xs-12">
            <div class="white-box">
                

                <div class="table-responsive">
                    {!! $dataTable->table(['class' => 'table table-bordered table-hover toggle-circle default footable-loaded footable']) !!}
                </div>
            </div>
        </div>
    </div>
    <!-- .row -->

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Lead Agent</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="{{ route('admin.agents.store')}}" method="post" enctype="multipart/form-data">
        <input type="hidden" name="_token" value="{{ csrf_token() }}">
        <div class="modal-body">
          <div class="form-group">
            <label for="agent_name">Agent Name</label>
            <!-- <select class="select2 form-control" data-placeholder="@lang('modules.tickets.chooseAgents')" id="agent_id" name="agent_id">
                                                <option value="">@lang('modules.tickets.chooseAgents')</option>
                                                @foreach($employees as $employee)
                                                @foreach($agents as $agent)
                                                @if($employee->id != $agent->user_id)
                                                <option value="{{$employee->id}}">{{$employee->name}}</option>
                                                @endif
                                                @endforeach
                                                @endforeach
                                            </select> -->
                                            <select class="select2 form-control" data-placeholder="@lang('modules.tickets.chooseAgents')" id="agent_id" name="agent_id">
                                                <option value="">@lang('modules.tickets.chooseAgents')</option>
                                                @php
                                                $agentIds = $agents->pluck('user_id')->toArray();
                                                @endphp

                                                @foreach($employees as $employee)
                                                @if(!in_array($employee->id, $agentIds))
                                                    <option value="{{ $employee->id }}">{{ $employee->name }}</option>
                                                @endif
                                                @endforeach
                                            </select>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary">Save</button>
        </div>
      </form>
    </div>
  </div>
</div>

@endsection
<!-- Modal -->
<div class="modal fade" id="addAgentModal" tabindex="-1" aria-labelledby="addAgentModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addAgentModalLabel">@lang('modules.lead.addNewAgent')</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- Content for adding a new agent form goes here -->
                <form id="addAgentForm" action="{{ route('admin.clients.store') }}" method="POST">
                    @csrf
                    <!-- Example input -->
                    <div class="mb-3">
                        <label for="agentName" class="form-label">Agent Name</label>
                        <input type="text" class="form-control" id="agentName" name="name" required>
                    </div>
                    <!-- Add other form fields as needed -->
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="submit" form="addAgentForm" class="btn btn-success">Save</button>
            </div>
        </div>
    </div>
</div>



@push('footer-script')
    <script src="{{ asset('plugins/bower_components/datatables/jquery.dataTables.min.js') }}"></script>
    <script src="//cdn.datatables.net/1.10.13/js/dataTables.bootstrap.min.js"></script>
    <script src="//cdn.datatables.net/responsive/2.1.1/js/dataTables.responsive.min.js"></script>
    <script src="//cdn.datatables.net/responsive/2.1.1/js/responsive.bootstrap.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.0.3/js/dataTables.buttons.min.js"></script>
    <script src="{{ asset('plugins/bower_components/bootstrap-datepicker/bootstrap-datepicker.min.js') }}"></script>

    <script src="{{ asset('js/datatables/buttons.server-side.js') }}"></script>
    <script src="{{ asset('plugins/bower_components/moment/moment.js') }}"></script>
    <script type="text/javascript" src="{{ asset('plugins/daterange-picker/daterangepicker.js') }}"></script>
    {!! $dataTable->scripts() !!}
   @endpush