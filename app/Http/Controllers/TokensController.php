<?php

namespace App\Http\Controllers;

use Illuminate\Support\Str;

use App\Models\Token;

class TokensController extends Controller
{
    public function createToken()
    {
        $returnData = 
        [
            'error'=>'',
            'messages'=>[],
            'token'=>''
        ];

        $newToken = Str::orderedUuid();
        Token::create(['value'=>$newToken]);
        
        $returnData['messages'][] = 'token created';
        $returnData['token'] = $newToken;
        return response()->json($returnData, 200);
    }
}
