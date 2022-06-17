<!doctype html>
<html lang="{{ app()->getLocale() }}">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>{{config('app.name','TPLIS')}}</title>
        <link rel="stylesheet" href="{{ asset('css/app.css') }}">
        <script type="text/javascript"> 
            function display_c(){
                var refresh=1000; // Refresh rate in milli seconds
                mytime=setTimeout('display_ct()',refresh)
            }
            function display_ct() {
                var x = new Date()
                document.getElementById('ct').innerHTML = x;
                display_c();
                document.getElementById('t1').value = x;
            }
        </script>
    </head>
    <body onload=display_ct();> <span id='ct' >
    </span>>
        @include('inc.navbar')
        <div class="container">
        @yield('content')
        </div>

        <div>
        @include('inc.footer')
        </div>

        <!--Scripts-->
        <script src="{{ asset('js/app.js') }}"></script>
        <script src="{{ asset('js/bootstrap.js') }}"></script>
    </body>
</html>
