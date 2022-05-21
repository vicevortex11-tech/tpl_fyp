<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/home', function () {
    return view('pages.home');
});

Route::get('/table', function () {
    return view('pages.table');
});

Route::get('/clubs', function () {
    return view('pages.clubs');
});

Route::get('/fixtures', function () {
    return view('pages.fixtures');
});

Route::get('/players', function () {
    return view('pages.players');
});

Route::get('/about', function () {
    return view('pages.about');
});

Route::resource('posts','PostsController');