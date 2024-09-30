<?php
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\AuthApiController;
use App\Http\Controllers\API\DashboardApiController;
use App\Http\Controllers\API\LeadApiController;
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
    Route::get('get_dashboard_data/{id}',[DashboardApiController::class,'getDashboardData']);
    Route::post('add_new_lead',[LeadApiController::class,'add_new_lead']);
    Route::get('lead-list',[LeadApiController::class,'getLeads']);
    Route::get('get-pendingandconfirm-lead',[LeadApiController::class,'getPendingDetails']);


});
