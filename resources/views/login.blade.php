<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{{ env("APP_NAME") }}</title>
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
</head>
<body>
    <div id="">
        <form action=" {!! url('/login') !!}" method="POST">
        @csrf
            <input name="email" type="text">
            <input name="password" type="password">
            <button type="submit">submit</button>
        </form>
    </div>
    <script src="{{ asset('js/app.js') }}" defer></script>
</body>
</html>