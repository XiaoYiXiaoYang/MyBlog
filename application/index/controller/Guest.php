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
class Guest extends Controller
{
    public function add()
    {
        if(request()->isPost()){
    		$data=[
    			'nickname'=>input('inpName'),
    			'content'=>input('txaArticle'),
    			'guest_time'=>date('Y-m-d H:i:s'),
    			'reply'=>'0',

    		];
    		if(\think\Db::name('guest')->insert($data)){
    			return $this->success('留言成功,正在跳转','Guest/lists');
    		}else{
    			return $this->success('留言提交失败','Guest/lists');
    		}
    		
    	}
 	
    	return view();
    }
    public function lists(){
    	$guestres=\think\Db::name('guest')->select();
    	$this->assign('guestres',$guestres);
        return $this->fetch('guestlist');
    }
}