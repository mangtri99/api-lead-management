<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Probability extends Model
{
    use HasFactory;

    const PENDING = 1;
    const CONVERTED = 2;
    const CANCEL = 3;

    /**
     * Get all of the leads for the Probability
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function leads(): HasMany
    {
        return $this->hasMany(Lead::class);
    }
}
