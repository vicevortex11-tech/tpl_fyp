@extends('layouts.app')

@section('content')
<div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <h1>Fixtures</h1>

                <table class="table">
                    <tr>
                        <th>Start</th>
                        <th>Teams</th>
                    </tr>
                        <tr>
                                <td>Start tyme</td>
                                <td>Home team - Away team</td>
                        </tr>
                    
                        <tr>
                            <td colspan="2">No games.</td>
                        </tr>
                   
                </table>

                <hr />

                <h1>Results</h1>

                <table class="table">
                    <tr>
                        <th>Start</th>
                        <th>Teams</th>
                        <th>Result</th>
                    </tr>
                    
                        <tr>
                            <td>start_time</td>
                            <td>team1 - team2</td>
                            <td>8 : 2</td>
                        </tr>
                    
                        <tr>
                            <td colspan="3">No results.</td>
                        </tr>
                   
                </table>
            </div>
        </div>
    </div>
@endsection