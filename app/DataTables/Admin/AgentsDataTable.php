<?php

namespace App\DataTables\Admin;

use App\LeadAgent;
use App\DataTables\BaseDataTable;
use Yajra\DataTables\Html\Button;
use Yajra\DataTables\Html\Column;

class AgentsDataTable extends BaseDataTable
{
    /**
     * Build DataTable class.
     *
     * @param mixed $query Results from query() method.
     * @return \Yajra\DataTables\DataTableAbstract
     */
    public function dataTable($query)
    {
        return datatables()
            ->eloquent($query)
            ->addColumn('lead_agents', function ($row) {
                $agentIds = explode(',', $row->lead_agents);
    $agentNames = \App\User::whereIn('id', $agentIds)->pluck('name')->toArray();
    return implode('<br>', $agentNames);
            })
            ->addColumn('action', function ($row) {
                return '<div class="btn-group dropdown m-r-10">
                    <button aria-expanded="false" data-toggle="dropdown" class="btn btn-default dropdown-toggle waves-effect waves-light" type="button">
                    <i class="fa fa-gears "></i></button>
                    <ul role="menu" class="dropdown-menu pull-right">
                      <li><a href="' . route('admin.clients.edit', [$row->id]) . '"><i class="fa fa-pencil" aria-hidden="true"></i> ' . trans('app.edit') . '</a></li>
                      <li><a href="' . route('admin.clients.show', [$row->user_id]) . '"><i class="fa fa-search" aria-hidden="true"></i> ' . __('app.view') . '</a></li>
                      <li><a href="javascript:;" data-user-id="' . $row->user_id . '" class="sa-params"><i class="fa fa-times" aria-hidden="true"></i> ' . trans('app.delete') . '</a></li>
                    </ul>
                </div>';
            })
            ->editColumn('name', function ($row) {
                // Check if user ID is available and create link
                if ($row->user_id) {
                    $link = '<a href="'  . route('admin.agents.correspondingleads', [$row->id])  . '">' . ucwords($row->name) . '</a>';
                    return $link;
                }
                return ucwords($row->name);
            })
            ->rawColumns(['name', 'lead_agents', 'action'])
            
            ->addIndexColumn();
    }

    /**
     * Get query source of dataTable.
     *
     * @param \App\LeadAgent $model
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function query(LeadAgent $model)
    {
        $request = $this->request();

        return $model->join('users', 'lead_agents.user_id', '=', 'users.id')
            ->join('companies', 'users.company_id', '=', 'companies.id')
            ->select('lead_agents.id', 'lead_agents.user_id', 'users.name', 'companies.company_name', 'companies.id as company_id');
            
    }

    /**
     * Optional method if you want to use html builder.
     *
     * @return \Yajra\DataTables\Html\Builder
     */
    public function html()
    {
        return $this->builder()
            ->setTableId('agents-table')
            ->columns($this->getColumns())
            ->minifiedAjax()
            ->dom("<'row'<'col-md-6'l><'col-md-6'Bf>><'row'<'col-sm-12'tr>><'row'<'col-sm-5'i><'col-sm-7'p>>")
            ->orderBy(0)
            ->destroy(true)
            ->responsive(true)
            ->serverSide(true)
            ->stateSave(true)
            ->processing(true)
            ->language(__('app.datatable'))
            ->parameters([
                'initComplete' => 'function () {
                   window.LaravelDataTables["agents-table"].buttons().container()
                    .appendTo( ".bg-title .text-right")
                }',
                'fnDrawCallback' => 'function( oSettings ) {
                    $("body").tooltip({
                        selector: \'[data-toggle="tooltip"]\'
                    })
                }',
            ])
            ->buttons(Button::make(['extend' => 'export', 'buttons' => ['excel', 'csv'], 'text' => '<i class="fa fa-download"></i> ' . trans('app.exportExcel') . '&nbsp;<span class="caret"></span>']));
    }

    /**
     * Get columns.
     *
     * @return array
     */
    protected function getColumns()
    {
        return [
            __('app.agentName') => ['data' => 'name', 'name' => 'users.name'],
            // __('modules.client.companyName') => ['data' => 'company_name', 'name' => 'companies.company_name'],
                       Column::computed('action', __('app.action'))
                ->exportable(false)
                ->printable(false)
                ->orderable(false)
                ->searchable(false)
                ->width(150)
                ->addClass('text-center')
        ];
    }

    /**
     * Get filename for export.
     *
     * @return string
     */
    protected function filename()
    {
        return 'agents_' . date('YmdHis');
    }

    public function pdf()
    {
        set_time_limit(0);
        if ('snappy' == config('datatables-buttons.pdf_generator', 'snappy')) {
            return $this->snappyPdf();
        }

        $pdf = app('dompdf.wrapper');
        $pdf->loadView('datatables::print', ['data' => $this->getDataForPrint()]);

        return $pdf->download($this->getFilename() . '.pdf');
    }
}   