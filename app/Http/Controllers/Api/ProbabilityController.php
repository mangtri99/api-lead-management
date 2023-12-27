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
        $probabilities = Probability::query();
        if($request->leads == 'true' || $request->leads == true){
            $probabilities->with('leads')->withCount('leads');
        }

        $probabilities = $probabilities->get();

        return SuccessResource::collection($probabilities);
    }
}
