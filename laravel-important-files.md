courses_and_movies cat routes/web.php app/Models/Movie.php app/Models/Course.php app/Http/Controllers/MovieController.php app/Http/Controllers/CourseController.php resources/views/movies/index.blade.php resources/views/courses/in
dex.blade.php
<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\MovieController;
use App\Http\Controllers\CourseController;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/movies', [MovieController::class, 'index'])->name('movies.index');
Route::get('/courses', [CourseController::class, 'index'])->name('courses.index');
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Movie extends Model
{
    protected $table = 'movies';
    protected $fillable = [
        'title',
        'director',
        'actors',
        'rating'
    ];
    public $timestamps = false;
}
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Course extends Model
{
    protected $table = 'courses';
    protected $fillable = [
        'class_name',
        'teacher',
        'classroom',
        'start_time',
        'end_time'
    ];

    public $timestamps = false;
}
<?php

namespace App\Http\Controllers;
use App\Models\Movie;
use Illuminate\Http\Request;

class MovieController extends Controller
{
    public function index() {
        $movies = Movie::orderBy('rating', 'desc')->get();

        return view('movies.index', compact('movies'));
    }
}
<?php

namespace App\Http\Controllers;
use App\Models\Course;
use Illuminate\Http\Request;

class CourseController extends Controller
{
    public function index()
    {
        $courses = Course::orderBy('start_time', 'asc')->get();
        return view('courses.index', compact('courses'));
    }
}
@extends('layouts.app')

@section('title', 'Movies')

@section('content')
    @foreach($movies as $movie)
        <table>
            <thead>
                <tr>
                    <th>Title</th>
                    <th>Director</th>
                    <th>Actors</th>
                    <th>Rating</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>{{$movie->title}}</td>
                    <td>{{$movie->director}}</td>
                    <td>{{$movie->actors}}</td>
                    <td>{{$movie->rating}}</td>
                </tr>
            </tbody>
        </table>
    @endforeach
@endsection
@extends('layouts.app')

@section('title', 'Movies')

@section('content')
    @foreach($courses as $course)
        <table>
            <thead>
                <tr>
                    <th>Course Title</th>
                    <th></th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>{{$course->class_name}}</td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    @endforeach
@endsection

