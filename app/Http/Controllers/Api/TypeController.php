<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\SuccessResource;
use App\Models\Type;
use Illuminate\Http\Request;

class TypeController extends Controller
{
    public function index(Request $request)
    {
        $types = Type::query();
        if($request->leads == 'true' || $request->leads == true){
            $types->with('leads')->withCount('leads');
        }
        $types = $types->get();

        return SuccessResource::collection($types);
    }
}
