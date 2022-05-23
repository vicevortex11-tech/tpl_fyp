@extends('layouts.app')

@section('content')
    <div class="well">
        <h1>{{$post->title}}</h1>
        <p>{{$post -> body}}</p>
        <small>Written on {{$post -> created_at}}</small>
    </div>

@endsection