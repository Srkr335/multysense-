<?php

namespace App\Imports;

use App\Lead;
use Maatwebsite\Excel\Concerns\ToModel;
// use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

class LeadsImport implements ToModel, WithHeadingRow
{
    /**
     * @param array $row
     *
     * @return \Illuminate\Database\Eloquent\Model|null
     */
    protected $requestData;
    protected $leadStatus;
    public function __construct($requestData,$leadStatus)
    {
        $this->requestData = $requestData;
        $this->leadStatus = $leadStatus;
    }
    public function model(array $row)
    {
        try {
            $contactId = null;
            if (!empty($row['email']) && !empty($row['phone_number'])) {
                $contactExist = Lead::where('mobile', $row['phone_number'])
                    ->orwhere('client_email', $row['email'])
                    ->first();
                if ($contactExist === null) {
                    $lead = new Lead();
                    $lead->client_name = $row['name'];
                    $lead->mobile = $row['phone_number'];
                    $lead->agent_id = (int)$this->requestData['agent_id'];
                    $lead->status_id = (int)$this->leadStatus['id'];
                    $lead->column_priority = 0;
                    $lead->client_email = $row['email'];
                    $lead->save();
                    $contactId = $lead->id;
                } else {
                    $contactId = $contactExist->id;
                }
            } else {
                $contactExist = Lead::where('mobile', $row['phone_number'])->first();
                if ($contactExist === null) {
                    $lead = new Lead();
                    $lead->client_name = $row['name'];
                    $lead->mobile = $row['phone_number'];
                    $lead->agent_id = (int)$this->requestData['agent_id'];
                    $lead->status_id = (int)$this->leadStatus['id'];
                    $lead->column_priority = 0;
                    $lead->save();
                    $contactId = $lead->id;
                } else {
                    $contactId = $contactExist->id;
                }
            }
        } catch (\Exception $e) {
            \Log::error('Lead import failed: ' . $e->getMessage());
        }
    }
}