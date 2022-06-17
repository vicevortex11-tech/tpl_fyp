<!-- Fixed navbar -->
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">{{config('app.name','TPLIS')}}</a>
    </div>
    <div id="navbar" class="navbar-collapse collapse">
      <ul class="nav navbar-nav">
        <li><a href="/home">Home</a></li>
        <li><a href="/table">Standings</a></li>
        <li><a href="/fixtures">Fixtures</a></li>
        <li><a href="/teams">Teams</a></li>
        <li><a href="/players">Players</a></li>
        <li><a href="/posts">Blog</a></li>
        <li><a href="/about">About</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="/login">Login</a></li>
      </ul>
    </div>
  </div>
</nav>
<br>
<br>