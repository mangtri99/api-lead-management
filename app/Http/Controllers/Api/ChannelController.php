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
        $channels = Channel::query();
        if($request->leads == 'true' || $request->leads == true){
            $channels->with('leads')->withCount('leads');
        }

        $channels = $channels->get();

        return SuccessResource::collection($channels);
    }
}
