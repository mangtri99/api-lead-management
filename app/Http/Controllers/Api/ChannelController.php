<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\SuccessResource;
use App\Models\Channel;
use Illuminate\Http\Request;

class ChannelController extends Controller
{

    public function index(Request $request)
    {
        $channels = Channel::with([
            'medias.sources', 'leads',
        ])->withCount('leads')->get();

        return SuccessResource::collection($channels);
    }
}
