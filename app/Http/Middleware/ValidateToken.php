<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use App\Models\Token;

class ValidateToken
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        $APIToken = $request->bearerToken();
        $unathorizedReturnData = 
        [
            'error' => 'Unauthorized',
            'messages' => ['Invalid or non-existing token']
        ];

        if($APIToken == null || !Token::where('value', '=', $APIToken)->exists())
        {
            return response()->json($unathorizedReturnData, 401);
        }

        return $next($request);
    }
}
