<?php

namespace App;

use App\Observers\LeadObserver;
use App\Scopes\CompanyScope;
use App\Traits\CustomFieldsTrait;
use Illuminate\Notifications\Notifiable;

class Lead extends BaseModel
{
    use Notifiable;
    use CustomFieldsTrait;

    protected $table = 'leads';
    protected $appends = ['email'];

    protected static function boot()
    {
        parent::boot();

        static::observe(LeadObserver::class);

        static::addGlobalScope(new CompanyScope);
    }

    public function lead_source()
    {
        return $this->belongsTo(LeadSource::class, 'source_id');
    }

    public function lead_agent()
    {
        return $this->belongsTo(LeadAgent::class, 'agent_id');
    }

    public function lead_status()
    {
        return $this->belongsTo(LeadStatus::class, 'status_id');
    }

    public function follow()
    {
        return $this->hasMany(LeadFollowUp::class,'lead_id');
    }
    public function nextFollow()
    {
        return $this->hasMany(LeadFollowUp::class,'lead_id')->where('next_follow_up_date','>=',\Carbon\Carbon::now())
        ->select('lead_follow_up.*','lead_follow_up.next_follow_up_date', 'lead_follow_up.created_at as followup_created_at','lead_follow_up.remark as next_folloup_remark')
        ->orderBy('next_follow_up_date','asc');
    }

    public function files()
    {
        return $this->hasMany(LeadFiles::class);
    }

    public function category()
    {
        return $this->belongsTo(LeadCategory::class, 'category_id');
    }

    public function client()
    {
        return $this->belongsTo(User::class, 'client_id');
    }

    public function currency()
    {
        return $this->belongsTo(Currency::class, 'currency_id');
    }

    public function getEmailAttribute($value)
    {
        return $this->client_email;
    }

    public function getNameAttribute($value)
    {
        return $this->client_name;
    }

    public function routeNotificationForMail()
    {
        return $this->client_email;
    }


    public function agent()
{
    return $this->belongsTo(LeadAgent::class, 'agent_id');
}

public function company()
{
    return $this->belongsTo(Company::class, 'company_id');
}


}
