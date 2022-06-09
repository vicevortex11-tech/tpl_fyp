<?php

namespace App\Http\Controllers;

use App\Team;

class TableController extends Controller
{

    public function index()
    {
        $teams = Team::all()->sortByDesc('points');

        return view('pages.table', compact('teams'));
    }

}
