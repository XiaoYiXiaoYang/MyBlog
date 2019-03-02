<?php

namespace app\admin\controller;
use think\Controller;

class Cate extends Basic
{
    public function add()
    {
    	if(request()->isPost()){
    		//dump(input('post.')); die;
    		$data = input('post.');

    		//验证
    		$validate = new \app\admin\validate\Cate;
    		if(!$validate->check($data)){
    			$this->error($validate->getError());
    		}
    		//1、使用 Db 类的 insert 方法向数据库提交数据
    		//$add = \think\Db::name("cata")->insert($data);

    		//2、使用助手函数添加
    		$add = db("cate")->insert($data);
    		
    		//dump($add); die;  //输出返回值信息

    		//添加成功
    		if ($add){
    			$this->success("添加栏目成功",'catelist');
    		} else {
    			$this->error("添加栏目失败",'catelist');
    		}
    		
    	}
        return view();
    }

    public function del()
    {
        //获取模板传过来的id
        $id=input('id');
        //使用助手函数进行删除操作和判断
        if(db('cate')->delete($id)){
            return $this->success('删除栏目成功','catelist');
        }else{
            return $this->error('删除栏目失败','catelist');
        }

    }

    public function edit()
    {
        //获取修改的信息
        $id=input('id');
        $cates = db('cate')->where('cate_id',$id)->find();
        $this->assign('cates',$cates);//模板赋值

        if (request()->isPost()) {
         $data=[
                'cate_id'=>input('id'),
                'catename'=>input('catename'),
                'cate_keywords'=>input('cate_keywords'),
                'cate_description'=>input('cate_description'),
            ];
       
         $validate = new \app\admin\validate\Cateedit;  
         if(!$validate->check($data)){
            $this->error($validate->getError());
        }

        //2、使用助手函数更新
        $update = db("cate")->update($data);
        if ($update) {
            $this->success("更新栏目成功",'catelist');
        } else {
            $this->error("更新栏目失败",'catelist');
        } 
    }       
        return view();
    }
    
    public function catelist(){
        $cataRes = db('cate')->select();
        $this->assign('cataRes',$cataRes);

        return view();
    }
}
