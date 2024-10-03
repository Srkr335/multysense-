<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class BaseController extends Controller
{
    public function sendResponse($result, $message, $code = 200)

    {

    	$response = [

            'success' => true,

            'data'    => $result,

            'message' => $message,

            'status' => $code

        ];



        return response()->json($response, 200);

    }



    /**

     * return error response.

     *

     * @return \Illuminate\Http\Response

     */

    public function sendError($error, $errorMessages = [], $code = 404)

    {

    	$response = [

            'success' => false,

            'message' => $error,

            'status' => $code

        ];



        if(!empty($errorMessages)){

            $response['data'] = $errorMessages;

        }



        return response()->json($response, $code);

    }
}
