<?php

namespace App\DataTables\Admin;

use App\Lead;
use App\DataTables\BaseDataTable;
use Yajra\DataTables\Html\Button;
use Yajra\DataTables\Html\Column;
use Carbon\Carbon;


class AgentCorrespondingDataTable extends BaseDataTable
{
    /**
     * Build DataTable class.
     *
     * @param mixed $query Results from query() method.
     * @return \Yajra\DataTables\DataTableAbstract
     */
   public function dataTable($query)
{
    return datatables()->eloquent($query)
        ->addIndexColumn()
        ->editColumn('call_status', function ($row) {
            return $row->call_status == 1
                ? '<span class="badge badge-success" style="display: inline-block; width: 100%; text-align: center;">Called</span>'
                : '<span class="badge badge-danger" style="display: inline-block; width: 100%; text-align: center;">Not Called</span>';
        })

        ->editColumn('next_follow_up', function ($row) {
            return $row->next_follow_up === 'yes'
               ? '<span class="badge badge-success" style="display: inline-block; width: 100%; text-align: center;">Yes</span>'
        : '<span class="badge badge-danger" style="display: inline-block; width: 100%; text-align: center;">No</span>';
        })

       ->editColumn('next_follow_up_date', function ($row) {
    return !empty($row->next_follow_up_date)
        ? \Carbon\Carbon::parse($row->next_follow_up_date)->format('F d, Y')
        : '--';
})

        ->editColumn('remark', function ($row) {
            return $row->next_follow_up === 'yes'
                ? $row->remark ?? '--'
                : '--';
        })
        ->rawColumns(['next_follow_up','next_follow_up_date','remark', 'call_status']);
}



    /**
     * Get query source of dataTable.
     *
     * @param \App\LeadAgent $model
     * @return \Illuminate\Database\Eloquent\Builder
     */
    


public function query(Lead $model)
{
    $id = $this->id; // Access the passed ID using with()

    return $model->join('lead_agents', 'lead_agents.id', '=', 'leads.agent_id')
        ->join('companies', 'lead_agents.company_id', '=', 'companies.id')
        ->leftJoin('lead_follow_up', function ($join) {
            $join->on('lead_follow_up.lead_id', '=', 'leads.id')
                 ->where('lead_follow_up.is_hidden', 0)
                 ->orderBy('lead_follow_up.next_follow_up_date', 'asc');
        })
        ->select(
            'leads.id',
            'leads.client_name',
            'companies.company_name',
            // 'leads.value',
            'leads.next_follow_up',
            'leads.call_status',
            'lead_follow_up.next_follow_up_date',
            'lead_follow_up.remark'
        )
        ->where('leads.agent_id', $id);
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
        ['data' => 'client_name', 'title' => 'Client Name'],
        ['data' => 'company_name', 'title' => 'Company Name'],
        // ['data' => 'value', 'title' => 'Lead Value'],
        ['data' => 'next_follow_up', 'title' => 'Next Follow-up'],
        ['data' => 'next_follow_up_date', 'title' => 'Next Follow-up Date'],
        ['data' => 'remark', 'title' => 'Remark'],
        ['data' => 'call_status', 'title' => 'Call Status'],
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