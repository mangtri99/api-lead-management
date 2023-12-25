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
        $sources = Source::with('leads')->when($request->has('media'), function ($query) use ($request) {
            $query->where('media_id', $request->media);
        })->get();

        return SuccessResource::collection($sources);
    }
}
