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
    public function __construct() {
        $this->middleware('auth:api', ['except' => ['login']]);
    }

    public function log(Request $request)
    {

        return response()->json(['message' => 'works']);
        //restricted
        echo "list";
    }

    public function login(Request $request)
    {
        //allowed
    }

    protected function checkExistingLog()
    {
        
    }
}