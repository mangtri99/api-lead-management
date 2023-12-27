<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\SuccessResource;
use App\Models\Status;
use Illuminate\Http\Request;

class StatusController extends Controller
{
    public function index(Request $request)
    {
        $statuses = Status::query();
        if($request->leads == 'true' || $request->leads == true){
            $statuses->with('leads')->withCount('leads');
        }
        $statuses = $statuses->get();

        return SuccessResource::collection($statuses);
    }
}
