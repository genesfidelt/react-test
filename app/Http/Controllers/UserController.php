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

    }

    public function registration()
    {

    }

    protected function createNewToken($token)
    {

    }
}