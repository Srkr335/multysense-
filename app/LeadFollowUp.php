<?php

namespace App;

class LeadFollowUp extends BaseModel
{
    protected $table = 'lead_follow_up';
    protected $dates = [ 'created_at'];

    public function lead()
    {
        return $this->belongsTo(Lead::class);
    }

}
