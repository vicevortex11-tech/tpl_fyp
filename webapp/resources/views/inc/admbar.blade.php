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
        <li><a href="/home">Dashboard</a></li>
        <li><a href="#">User Management</a></li>
        <li><a href="#">Teams & Stadiums</a></li>
        <li><a href="#">Players & Coaches</a></li>
        <li><a href="#">Games & Goals</a></li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
             Dropdown
          </a>
    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
    <li><a class="dropdown-item" href="#">Action</a></li>
    <li><a class="dropdown-item" href="#">Another action</a></li>
    <li><hr class="dropdown-divider"></li>
    <li><a class="dropdown-item" href="#">Something else here</a></li>
    </ul>
        </li>       
      </ul>

      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">User</a></li>
        <li><a href="#">Logout</a></li>
      </ul>
    </div>
  </div>
</nav>
<br>
<br>