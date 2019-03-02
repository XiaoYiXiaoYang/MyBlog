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

namespace app\admin\controller;

class Index extends Basic
{
    public function index()
    {
        return view();
    }
}
