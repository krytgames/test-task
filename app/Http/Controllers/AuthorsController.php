<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Author;
use RuntimeException;

class AuthorsController extends Controller
{
    public function authorsList()
    {
        $returnData = 
        [
            'error'=>'',
            'messages'=>[],
            'data'=>[]
        ];
        $items = Author::query()->simplePaginate(50);
        $returnData['data'] = $items;

        return response()->json($returnData, 200);
    }

    public function createAuthor(Request $request)
    {
        $request->validate(
        [
            'fullName'=>'required|string|max:255',
            'email'=>'required|email|unique:authors,email|max:255',
            'avatar'=>'file|mimes:jpg,png,pdf|max:1024'
        ]);

        $returnData = 
        [
            'error'=>'',
            'messages'=>[],
            'id'=>0
        ];

        $newAuthor = new Author();
        $newAuthor->fullName = $request->input('fullName');
        $newAuthor->email = $request->input('email');
        $newAuthor->avatar_image = $request->file('avatar');

        if(!$newAuthor->save())
        {
            throw new RuntimeException('Unknown error when saving the author');
        }

        $returnData['messages'] = ['Author created'];
        $returnData['id'] = $newAuthor->id;
        return response()->json($returnData, 200);
    }
}
