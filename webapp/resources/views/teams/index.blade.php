@extends('layouts.app')

@section('content')
  <div class="jumbotron">
      <h1>Teams</h1>
      <p>This example is a quick exercise to illustrate how the default, static navbar and fixed to top navbar work. It includes the responsive CSS and HTML, so it also adapts to your viewport and device.</p>
      <p>
        <a class="btn btn-lg btn-primary" href="#" role="button">View navbar docs &raquo;</a>
      </p>
  </div>
  <hr>
  <div class="jumbotron">
      @if (count($teams) > 0)
          @foreach ($teams as $item)
              <div class="well">
              <h3>{{$item -> name}}</h3>
              <p>{{$item -> abb}}</p>
              <small>Coached by:{{$item -> coach_id}}</small>
              </div>           
          @endforeach
      @else
          No teams found.
      @endif
  </div>


@endsection