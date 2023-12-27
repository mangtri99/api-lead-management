<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\SuccessResource;
use App\Models\Branch;
use Illuminate\Http\Request;

class BranchController extends Controller
{
    public function index(Request $request)
    {
        $branches = Branch::query();
        if($request->leads == 'true' || $request->leads == true){
            $branches->with('leads')->withCount('leads');
        }
        $branches = $branches->get();

        return SuccessResource::collection($branches);
    }
}
