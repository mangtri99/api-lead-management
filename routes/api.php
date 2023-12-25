<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::resource("lead", \App\Http\Controllers\Api\LeadController::class)->except(["create", "edit"])->names("lead");
Route::get("type", [\App\Http\Controllers\Api\TypeController::class,'index'])->name("type.index");
Route::get("channel", [\App\Http\Controllers\Api\ChannelController::class,'index'])->name("channel.index");
Route::get("media", [\App\Http\Controllers\Api\MediaController::class,'index'])->name("media.index");
Route::get("source", [\App\Http\Controllers\Api\SourceController::class,'index'])->name("source.index");
Route::get("branch", [\App\Http\Controllers\Api\BranchController::class,'index'])->name("branch.index");
Route::get("status", [\App\Http\Controllers\Api\StatusController::class,'index'])->name("status.index");
Route::get("probability", [\App\Http\Controllers\Api\ProbabilityController::class,'index'])->name("probability.index");
