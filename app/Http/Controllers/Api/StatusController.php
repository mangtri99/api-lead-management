<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\SuccessResource;
use App\Models\Status;

class StatusController extends Controller
{
    public function index()
    {
        $statuses = Status::withCount('leads')->get();

        return SuccessResource::collection($statuses);
    }
}
