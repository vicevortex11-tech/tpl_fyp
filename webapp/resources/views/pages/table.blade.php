@extends('layouts.app')

@section('content')

    <div class="jumbotron">
        <h1>Standings</h1>
        <p>This example is a quick exercise to illustrate how the default, static navbar and fixed to top navbar work. It includes the responsive CSS and HTML, so it also adapts to your viewport and device.</p>
        <p>
        <a class="btn btn-lg btn-primary" href="/fixtures" role="button">Fixtures &raquo;</a>
        </p>
    </div>
 
    <div class="jumbotron">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">   
                <table class="table">
                    <tr>
                        <th>No</th>
                        <th>Team</th>
                        <th>Points</th>
                        <th>Won</th>
                        <th>Draw</th>
                        <th>Lost</th>
                        <th>GF</th>
                        <th>GA</th>
                        <th>GD</th>
                    </tr>
                    <tr>
                        <td colspan="9">No data</td>
                    </tr>                       
                </table>    
            </div>
        </div>
    </div>

@endsection