@extends('layouts.app')

@section('content')
    <div class="jumbotron">
        <h1>News</h1>
        <p>This example is a quick exercise to illustrate how the default, static navbar and fixed to top navbar work. It includes the responsive CSS and HTML, so it also adapts to your viewport and device.</p>
        <p>
        <a class="btn btn-lg btn-primary" href="#" role="button">More &raquo;</a>
        </p>
    </div>
    <hr>

    <div class="jumbotron">
        @if (count($posts) > 0)
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
    </div>

@endsection