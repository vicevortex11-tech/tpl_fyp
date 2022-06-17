@extends('layouts.app')

@section('content')

    <div class="jumbotron">
        <h1>Players</h1>
        <p>This example is a quick exercise to illustrate how the default, static navbar and fixed to top navbar work. It includes the responsive CSS and HTML, so it also adapts to your viewport and device.</p>
        <p>
        <a class="btn btn-lg btn-primary" href="#" role="button">More &raquo;</a>
        </p>
    </div>
    <hr>
    <div class="jumbotron">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <table class="table">
                    <tr>
                        <th>Name</th>
                        <th>Jersey</th>
                        <th>Position</th>
                        <th>Birth date</th>
                    </tr>                    
                    <tr>
                        <td colspan="4">No players.</td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
        
@endsection