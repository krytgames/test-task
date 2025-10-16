<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;

use App\Models\Article;
use App\Models\Category;
use InvalidArgumentException;

class ArticlesController extends Controller
{
    public function articlesByAuthor(Request $request)
    {
        $request->validate(
        [
            'authorID'=>'required|exists:authors,id'
        ]);


        $returnData = 
        [
            'error'=>'',
            'messages'=>[],
            'data'=>[]
        ];

        $items = Article::where('authorID', '=', $request->input('authorID'))
                ->with(['categories', 'author'])
                ->simplePaginate(50);
        $returnData['data'] = $items;
        return $returnData;
    }

    public function articlesByCategory(Request $request)
    {
        $request->validate(
        [
            'categoryID'=>'required|exists:categories,id',
            'includeSubCategories'=>'string'
        ]);


        $returnData = 
        [
            'error'=>'',
            'messages'=>[],
            'data'=>[]
        ];

        $includeSubCategories = $request->input('includeSubCategories', 'N');
        $includeSubCategories = ($includeSubCategories == 'Y' ? true : false);
        $categoryID = $request->input('categoryID');

        if($includeSubCategories)
        {
            $categoriesIDsToQuery = [$categoryID];
            $maxDepthFailsafe = 1000;
            $categoriesToGetSubCategories = [$categoryID];
            while(count($categoriesToGetSubCategories) > 0)
            {
                $items = Category::select('id')->whereIn('parentID', $categoriesToGetSubCategories)->get()->all();
                $categoriesToGetSubCategories = [];
                for($i = 0; $i < count($items); $i++)
                {
                    $currentItem = &$items[$i];
                    $categoriesIDsToQuery[] = $currentItem->id;
                    $categoriesToGetSubCategories[] = $currentItem->id;
                }
                unset($currentItem);

                if($maxDepthFailsafe <= 0){break;}
                $maxDepthFailsafe--;
            }

            $items = Article::whereHas('categories', function ($query) use ($categoriesIDsToQuery) 
            {
                $query->whereIn('id', $categoriesIDsToQuery);
            })->with(['categories', 'author'])->simplePaginate(50);
        }
        else
        {
            $items = Article::whereHas('categories', function ($query) use ($categoryID) 
            {
                $query->where('id', '=', $categoryID);
            })->with(['categories', 'author'])->simplePaginate(50);
        }

        $returnData['data'] = $items;
        return $returnData;
    }

    public function articlesByTitle(Request $request)
    {
        $request->validate(
        [
            'title'=>'required|string|max:255',
            'exact'=>'string'
        ]);

        $returnData = 
        [
            'error'=>'',
            'messages'=>[],
            'data'=>[]
        ];

        $exact = $request->input('exact', 'N');
        $exact = ($exact == 'Y' ? true : false);
        $title = $request->input('title');
        
        if($exact)
        {
            $queryResult = Article::where('title', '=', $title)->with(['categories', 'author'])->get();
        }
        else
        {
            $queryResult = Article::where('title', 'LIKE', '%'.$title.'%')->with(['categories', 'author'])->get();
        }
        $returnData['data'] = $queryResult;
        return response()->json($returnData, 200);
    }

    public function articlesByIDs(Request $request)
    {
        $request->validate(
        [
            'IDs'=>'array',
            'IDs.*'=>'integer|min:0'
        ]);
        
        $returnData = 
        [
            'error'=>'',
            'messages'=>[],
            'data'=>[]
        ];
        
        $IDs = $request->input('IDs');
        $someIDsDoesNotExist = (Article::whereIn('id', $IDs)->count() != count($IDs));
        if($someIDsDoesNotExist){throw new InvalidArgumentException('Some IDs does not exist');}

        $returnData['data'] = Article::whereIn('id', $IDs)->with(['categories', 'author'])->simplePaginate(50);
        return $returnData;
    }

    public function createArticle(Request $request)
    {
        $request->validate(
        [
            'title'=>'required|string|max:255',
            'anonse'=>'required|string|max:255',
            'text'=>'required|string',
            'authorID'=>'required|exists:authors,id|integer|min:0',
            'categoryIDs'=>'array',
            'categoryIDs.*'=>'integer|min:0'
        ]);
        $returnData = 
        [
            'error'=>'',
            'messages'=>[],
            'id'=>0
        ];
        $categoryIDs = $request->input('categoryIDs', []);

        $newArticle = new Article();
        $newArticle->title = $request->input('title');
        $newArticle->anonse = $request->input('anonse');
        $newArticle->text = $request->input('text');
        $newArticle->authorID = $request->input('authorID');
        if(!$newArticle->save())
        {
            $returnData['error'] = 'Unknown';
            $returnData['messages'] = ['Unknown error when saving the article'];
            return response()->json($returnData, 500);
        }

        $notAllCategoriesExists = (Category::whereIn('id', $categoryIDs)->count() != count($categoryIDs));
        if($notAllCategoriesExists){throw new InvalidArgumentException('Not all categories ID exists in database');}

        $batchRecords = [];
        for($i = 0; $i < count($categoryIDs); $i++)
        {
            $currentElement = &$categoryIDs[$i];
            $batchRecords[] = ['articleID'=>$newArticle->id, 'categoryID'=>$categoryIDs[$i]];
        }
        unset($currentElement);

        DB::transaction(function() use ($batchRecords) 
        {
            DB::table('articles_categories')->insert($batchRecords);
        });

        $returnData['messages'] = ['Article created'];
        $returnData['id'] = $newArticle->id;
        return response()->json($returnData, 200);
    }
}
