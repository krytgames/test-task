<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use Symfony\Component\Routing\Exception\InvalidParameterException;

use App\Models\Category;
use RuntimeException;

class CategoriesController extends Controller
{
    public function createCategory(Request $request)
    {
        $request->validate(
        [
            'name'=>'required|string|unique:categories,name',
            'parentID'=>'exists:categories,id|min:0'
        ]);

        $returnData = 
        [
            'error'=>'',
            'messages'=>[],
            'id'=>0
        ];

        $newCategory = new Category();
        $newCategory->name = $request->input('name');
        $newCategory->parentID = $request->input('parentID');
        if(!$newCategory->save())
        {
            throw new RuntimeException('Unknown error when saving the category');
        }

        $returnData['messages'] = ['Category created'];
        $returnData['id'] = $newCategory->id;
        return response()->json($returnData, 200);
    }
}
