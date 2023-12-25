<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\LeadRequest;
use App\Http\Resources\ErrorResource;
use App\Http\Resources\SuccessResource;
use App\Models\Lead;
use Exception;
use Illuminate\Http\Request;

class LeadController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $perPage = $request->per_page ? (int) $request->per_page : 10;
        $queryDateStart = $request->date_start ? $request->start_date : null;
        $queryDateEnd = $request->date_end ? $request->end_date : null;

        $leads = Lead::when($request->search, function ($query) use ($request) {
            // Filter by search in fullname, email and lead number
            $query->where('fullname', 'like', '%' . $request->search . '%')
                ->orWhere('email', 'like', '%' . $request->search . '%')
                ->orWhere('lead_number', 'like', '%' . $request->search . '%');
        })
        // filter by date range
            ->when($queryDateStart && $queryDateEnd, function ($query) use ($queryDateStart, $queryDateEnd) {
                $query->whereBetween('created_at', [$queryDateStart, $queryDateEnd]);
            })
        // filter by status
            ->when($request->status, function ($query) use ($request) {
                $query->where('status_id', $request->status);
            })
        // filter by branch
            ->when($request->branch, function ($query) use ($request) {
                $query->where('branch_id', $request->branch);
            })
        // Handle sort and order query params
            ->when($request->sort, function ($query) use ($request) {
                $query->orderBy($request->sort, $request->order ?? 'asc'); // default order is asc
            }, function ($query) {
                // default sort by created_at in desc order
                $query->orderBy('created_at', 'desc');
            })->with([
            'branch',
            'status',
            'probability',
            'type',
            'channel',
            'media',
            'source',
        ])->paginate($perPage);

        return SuccessResource::collection($leads);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(LeadRequest $request)
    {
        try {
            $data = $request->validated();
            // 2 Capital Letters + Unix Timestamp
            $createLeadNumber = strtoupper(substr($data['fullname'], 0, 2)) . time();
            // apend lead number to data
            $data['lead_number'] = $createLeadNumber;
            $lead = Lead::create($data);
            return new SuccessResource($lead);
        } catch (Exception $e) {
            return response()->json(
                new ErrorResource($e)
                , 500);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(Lead $lead)
    {
        try {
            return new SuccessResource($lead);
        } catch (Exception $e) {
            return response()->json(
                new ErrorResource($e)
                , 500);
        }
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(LeadRequest $request, Lead $lead)
    {
        try {
            $data = $request->validated();
            $lead->update($data);
            return new SuccessResource([]);
        } catch (Exception $e) {
            return response()->json(
                new ErrorResource($e)
                , 500);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Lead $lead)
    {
        try {
            $lead->delete();
            return new SuccessResource([]);
        } catch (Exception $e) {
            return response()->json(
                new ErrorResource($e)
                , 500);
        }
    }
}
