@extends('layouts.app')

@section('page-title')
<div class="row bg-title">

<!-- .page title -->

<!-- /.page title -->
<!-- .breadcrumb -->
<div class="col-lg-4 col-sm-6 col-md-7 col-xs-12 text-right bg-title-right">
    <a href="" data-toggle="modal" data-target="#exampleModal"
    class="btn btn-outline btn-success btn-sm">@lang('modules.lead.addNewAgent') <i class="fa fa-plus"
                                                                                       aria-hidden="true"></i></a>
   
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
                <form id="addAgentForm" action="#" method="POST">
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
    {{-- <script>
              var agentId = "{{ $id }}";

$('#agents-table').DataTable({
    processing: true,
    serverSide: true,
    ajax: '/admin/agents/' + agentId + '/correspondingleads',
    columns: [
        { data: 'client_name', title: 'Client Name' },
        { data: 'company_name', title: 'Company Name' },
        { data: 'value', title: 'Lead Value' },
        { data: 'next_follow_up', title: 'Next Follow-up' },
        { data: 'call_status', title: 'Call Status' },
        { data: 'action', title: 'Action', orderable: false, searchable: false }
    ],
    error: function (xhr) {
        console.error('Error:', xhr.responseText);
    }
});
        </script> --}}
   @endpush