<?php

use Illuminate\Support\Facades\Route;

use App\Http\Middleware\ValidateToken;

use App\Http\Controllers\ArticlesController;
use App\Http\Controllers\AuthorsController;
use App\Http\Controllers\CategoriesController;
use App\Http\Controllers\TokensController;


Route::prefix('v1')
->middleware(ValidateToken::class)
->group(function()
{
    Route::get('/articlesByAuthor', [ArticlesController::class, 'articlesByAuthor']);
    Route::get('/articlesByCategory', [ArticlesController::class, 'articlesByCategory']);
    Route::get('/articlesByTitle', [ArticlesController::class, 'articlesByTitle']);
    Route::get('/articlesByIDs', [ArticlesController::class, 'articlesByIDs']);
    Route::post('/createArticle', [ArticlesController::class, 'createArticle']);

    Route::get('/authorsList', [AuthorsController::class, 'authorsList']);
    Route::post('/createAuthor', [AuthorsController::class, 'createAuthor']);

    Route::post('/createCategory', [CategoriesController::class, 'createCategory']);

    Route::post('/createToken', [TokensController::class, 'createToken'])->withoutMiddleware(ValidateToken::class);
});


