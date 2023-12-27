<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\SuccessResource;
use App\Models\Source;
use Illuminate\Http\Request;

class SourceController extends Controller
{
    public function index(Request $request)
    {
        $sources = Source::query();
        if($request->leads == 'true' || $request->leads == true){
            $sources->with('leads')->withCount('leads');
        }
        $sources = $sources->get();

        return SuccessResource::collection($sources);
    }
}
