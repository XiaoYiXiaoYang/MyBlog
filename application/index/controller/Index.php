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
class Index extends Controller
{
    public function index()
    {
       
    	 $articleRes = \think\Db::name('article')->alias('a')->join('cate c','a.cate_id = c.cate_id','LEFT')->paginate(5);
         $this->assign('articleRes',$articleRes);

    	// $tagRes = \think\Db::name('article')->select();
    	//  $this->assign('tagRes',$tagRes);

    	 $linkres = \think\Db::name('link')->select();
    	 $this->assign('linkres',$linkres);
        return $this->fetch('index');

    }
}