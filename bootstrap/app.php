<?php

use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use Symfony\Component\Routing\Exception\InvalidParameterException;

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__.'/../routes/web.php',
        commands: __DIR__.'/../routes/console.php',
        health: '/up',
    )
    ->withMiddleware(function (Middleware $middleware): void 
    {
        $middleware->validateCsrfTokens(
        [
            'v1/*'
        ]);
    })
    ->withExceptions(function (Exceptions $exceptions): void 
    {
        $exceptions->render(function (ValidationException $e, Request $request) 
        {
            if ($request->is('v1/*')) 
            {
                $returnData = 
                [
                    'error'=>'Invalid parameters',
                    'messages'=>[$e->getMessage()]
                ];
                return response()->json($returnData, 400);
            }
        });
        $exceptions->render(function (Exception $e, Request $request) 
        {
            if ($request->is('v1/*')) 
            {
                $returnData = 
                [
                    'error'=>'Server error',
                    'messages'=>[$e->getMessage()]
                ];
                return response()->json($returnData, 500);
            }
        });
    })->create();
