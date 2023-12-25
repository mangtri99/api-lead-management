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
        $media = Media::with('leads')->withCount('leads')->get();

        return SuccessResource::collection($media);
    }
}
