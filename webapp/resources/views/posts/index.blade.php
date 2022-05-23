@extends('layouts.app')

@section('content')
    <h1>Posts</h1>
    @if (count($posts) > 1)
        @foreach ($posts as $item)
            <div class="well">
            <h3><a href="/posts/{{$item->id}}">{{$item -> title}}</a></h3>
            <p>{{$item -> body}}</p>
            <small>Written on {{$item -> created_at}}</small>
            </div>           
        @endforeach
    @else
        No posts found.   
    @endif

@endsection