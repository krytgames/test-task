<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\UploadedFile;
use Illuminate\Database\Eloquent\Casts\Attribute;

class Author extends Model
{
    protected $table = 'authors';
    public $timestamps = false;
    protected $hidden = ['avatarPath'];
    protected $appends = ['avatarURL'];

    public function getAvatarURLAttribute()
    {
        if($this->avatarPath == null){return '';}
        
        return url($this->avatarPath);
    }

    public function setAvatarImageAttribute(UploadedFile|null $image)
    {
        if($image == null){return;}

        $filename = uniqid().'.'.$image->extension();
        $this->avatarPath = $image->storeAs('images', $filename);
    }
}
