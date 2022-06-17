@extends('layouts.app')

@section('content')

<div class="jumbotron">
    <h1>Fixtures & Results</h1>
    <p>This example is a quick exercise to illustrate how the default, static navbar and fixed to top navbar work. It includes the responsive CSS and HTML, so it also adapts to your viewport and device.</p>
    <p>
      <a class="btn btn-lg btn-primary" href="#" role="button">Teams &raquo;</a>
    </p>
  </div>
<div class="jumbotron">
        <div class="row">
            <div>
                <h1>Fixtures</h1>
                <table class="table">
                    <tr>
                        <th>Start</th>
                        <th>Teams</th>
                    </tr>
                    <tr>
                        <td colspan="2">No games.</td>
                    </tr>                   
                </table>
                <hr>
                <h1>Results</h1>
                <table class="table">
                    <tr>
                        <th>Start</th>
                        <th>Teams</th>
                        <th>Result</th>
                    </tr>
                    <tr>
                        <td colspan="3">No results.</td>
                    </tr>                   
                </table>
            </div>
        </div>
    </div>
@endsection