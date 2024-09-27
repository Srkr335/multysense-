<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\User;
use App\Helper\Files;
use Intervention\Image\Facades\Image;
use App\Http\Controllers\API\BaseController as BaseController;

class AuthApiController extends BaseController
{
    public function register(Request $request)

    {

        $validator = Validator::make($request->all(), [

            'name' => 'required',

            'email' => 'required|email',

            'password' => 'required',

            'c_password' => 'required|same:password',

        ]);

   

        if($validator->fails()){

            return $this->sendError('Validation Error.', $validator->errors());       

        }

   

        $input = $request->all();

        $input['password'] = bcrypt($input['password']);

        $user = User::create($input);

        $success['token'] =  $user->createToken('MyApp')->plainTextToken;

        $success['name'] =  $user->name;

   

        return $this->sendResponse($success, 'User register successfully.');

    }

   

    /**

     * Login api

     *

     * @return \Illuminate\Http\Response

     */

    public function login(Request $request)

    {

        if(auth()->attempt(['email' => $request->email, 'password' => $request->password])){ 

            $user = auth()->user(); 

            $success['token'] =  $user->createToken('MyApp')->plainTextToken; 

            $success['name'] =  $user->name;
            $success['user_id'] =  $user->id;
            $success['email'] =  $user->email;
            $success['mobile'] =  $user->mobile;
            $success['image'] =  $user->image;

            return $this->sendResponse($success, 'User login successfully.');

        } 

        else{ 

            return $this->sendError('Unauthorised.', ['error'=>'Unauthorised']);

        } 

    }
    public function reset_password(Request $request)
    {
        $request->validate([
            'token' => 'required',
            'email' => 'required|email',
            'password' => 'required|min:8|confirmed',
        ]);
        return $request->all();
    }
}
