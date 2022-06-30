<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Loanee;
use App\Models\Company;
use App\Models\CapitalHistory;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Validator;
use Cookie;

use App\Http\Controllers\AuthController;

class UserController extends Controller
{
    public function login()
    {
        return view('login');
    }

    public function loginsubmit(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required|string|min:6',
        ]);
        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }
        if (! $token = auth()->attempt($validator->validated())) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }
        return $this->createNewToken($token);
    }

    public function registration()
    {

    }

    protected function createNewToken($token){
        //Cookie::make('access_token', $token, auth()->factory()->getTTL() * 60);
        $cookie = cookie('access_token', $token, 60);
        $cookie = Cookie::get();
        dd($cookie);
        return redirect('/');
    }
}