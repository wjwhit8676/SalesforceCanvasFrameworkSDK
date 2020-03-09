<html>
<head>
    <script type="text/javascript" src="/sdk/js/canvas-all.js"></script>
</head>
<body>
    <script>

        function loginHandler(e) {
            var uri;
            alert(Sfdc.canvas.oauth.loggedin());
            if (! Sfdc.canvas.oauth.loggedin()) {
                uri = Sfdc.canvas.oauth.loginUrl();
                Sfdc.canvas.oauth.login(
                    {uri : uri,
                        params: {
                            response_type : "token",
                            client_id : "3MVG9OI03ecbG2VqCv2eXuulZtNwN4gAKSwZzJxAb0vrU3kWs.oAnL_FPyitHJ2zJN4gwXjNvW8xNnRGtf6W0",
                            redirect_uri : encodeURIComponent(
                                "https://testcanvasecms.herokuapp.com/sdk/callback.html")
                        }});
            }
            else {
                Sfdc.canvas.oauth.logout();
                login.innerHTML = "Login";
                Sfdc.canvas.byId("oauth").innerHTML = "";
            }
            return false;
        }

        // Bootstrap the page once the DOM is ready.
        Sfdc.canvas(function() {
            // On Ready...
            var login    = Sfdc.canvas.byId("login"),
                loggedIn = Sfdc.canvas.oauth.loggedin(),
                token = Sfdc.canvas.oauth.token()
            login.innerHTML = (loggedIn) ? "Logout" : "Login";
            if (loggedIn) {
                 // Only displaying part of the OAuth token for better formatting.
                Sfdc.canvas.byId("oauth").innerHTML = Sfdc.canvas.oauth.token()
                    .substring(1,40) + "…";
            }
            login.onclick=loginHandler;
        });
    </script>
    <h1 id="header">Canvas OAuth App</h1>
    <div>
        access_token = <span id="oauth"></span>
    </div>
    <div>
        <a id="login" href="#">Login</a><br/>
    </div>
</body>
</html>
