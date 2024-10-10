<?php
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\AuthApiController;
use App\Http\Controllers\API\DashboardApiController;
use App\Http\Controllers\API\LeadApiController;
use App\Http\Controllers\API\TaskApiController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
// ApiRoute::group(['namespace' => 'App\Http\Controllers\Front'], function () {
//     ApiRoute::get('purchased-module', ['as' => 'api.purchasedModule', 'uses' => 'HomeController@installedModule']);
// });
Route::post('register',[AuthApiController::class,'register'] );
Route::post('login',[AuthApiController::class,'login']);

Route::middleware('auth:sanctum')->group( function () {

    Route::post('reset_password', [AuthApiController::class, 'reset_password']);
    Route::get('lead-list',[LeadApiController::class,'getLeads']);
    Route::get('get-pendingandconfirm-lead',[LeadApiController::class,'getPendingDetails']);
    Route::get('get-lead-agent/{id}',[LeadApiController::class,'getLeadAgent']);
    Route::post('add-new-lead',[LeadApiController::class,'add_new_lead']);
    Route::post('update-lead-profile/{id}',[LeadApiController::class,'update_lead']);
    Route::post('add-follow-up',[LeadApiController::class,'add_follow_up']);
    Route::get('lead-details/{id}',[LeadApiController::class,'getLeadDetails']);
    Route::post('update-followup-status/{id}',[LeadApiController::class,'update_followup_status']);
    Route::post('followup-view-status/{id}',[LeadApiController::class,'viewStatusUpdate']);

     // task
     Route::get('get-tasks/{id}',[TaskApiController::class,'get_tasks']);
     Route::post('update_task_status/{id}',[TaskApiController::class,'update_task_status']);
     Route::post('start-timer',[TaskApiController::class,'start_timer']);
     Route::post('stop-timer/{id}/{task_id}', [TaskApiController::class, 'stop_timer']);
     Route::get('task-timer-details/{id}',[TaskApiController::class,'task_timer_details']);

  

});
