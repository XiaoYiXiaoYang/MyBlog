<?php
/*
namespace app\index\controller;
use think\Controller;
class Index extends Controller
{
    public function index()
    {
        return $this->fetch();
    }
}
*/

namespace app\index\controller;
use think\Controller;
class Author extends Controller
{
    public function index()
    {
        return $this->fetch('author');

    }
}