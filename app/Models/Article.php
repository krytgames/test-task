<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

class Article extends Model
{
    protected $table = 'articles';

    public function categories(): BelongsToMany
    {
        return $this->belongsToMany(Category::class, 'articles_categories', 'articleID', 'categoryID');
    }

    public function author(): HasOne
    {
        return $this->hasOne(Author::class, 'id', 'authorID');
    }
}
