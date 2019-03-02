<?php

namespace app\admin\controller;
use think\Controller;

class Guest extends Basic
{
    public function del()
    {
        //获取模板传过来的id
        $id=input('id');
        //使用助手函数进行删除操作和判断
        if(db('guest')->delete($id)){
            return $this->success('删除留言成功','guestlist');
        }else{
            return $this->error('删除留言失败','guestlist');
        }

    }

    public function reply()
    {
        //获取修改的信息
        $id=input('id');
        $guestRes = db('guest')->where('guest_id',$id)->find();
        $this->assign('guestRes',$guestRes);//模板赋值

        if (request()->isPost()) {
         $data=[
                'guest_id'=>input('id'),
                'nickname'=>input('nickname'),
                'content'=>input('content'),
                'guest_time'=>input('guest_time'),
                'reply'=>input('reply'),
            ];
    

        //2、使用助手函数更新
        $update = db("guest")->update($data);
        if ($update) {
            $this->success("回复留言成功",'guestlist');
        } else {
            $this->error("回复留言失败",'guestlist');
        } 
    }       
        return view();
    }
    
    public function guestlist(){
        $guestRes = db('guest')->select();
        $this->assign('guestRes',$guestRes);

        return view();
    }
}
