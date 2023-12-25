<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\SuccessResource;
use App\Models\Media;
use Illuminate\Http\Request;

class MediaController extends Controller
{

    public function index(Request $request)
    {
        $media = Media::with('leads')->when($request->has('type'), function ($query) use ($request) {
            $query->where('type_id', $request->type);
        })->get();

        return SuccessResource::collection($media);
    }
}
