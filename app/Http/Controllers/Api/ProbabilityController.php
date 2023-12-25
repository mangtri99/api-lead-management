<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\SuccessResource;
use App\Models\Probability;
use Illuminate\Http\Request;

class ProbabilityController extends Controller
{
    public function index(Request $request)
    {
        $types = Probability::with('leads')->get();

        return SuccessResource::collection($types);
    }
}
