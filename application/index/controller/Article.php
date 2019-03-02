<?php
// namespace app\index\controller;

// class Article extends Basic
// {
//     public function index()
//     {
    	
//         $id=input('id');
//         $article = db('article')->where('article_id',$id)->find();
//         $catenameRes = db('cate')->where('cate_id',$article['cate_id'])->find();
       
//         $this->assign('article',$article);//模板赋值
//  		$this->assign('catenameRes',$catenameRes);//模板赋值
//         return view('article');
//     }

namespace app\index\controller;
use think\Controller;
class Article extends Controller
{

    public function lists()
    {
    	$id=input('id');//在文章列表页点击进入获取传过来的文章的id值
    	db('article')->where('article_id', $id)->setInc('read_times',1);//阅读量字段自增1，setInc第二个参数为空则默认自增1
        //根据文章id联表查询该文章的栏目名称，获取该文章的信息
    	$article=\think\Db::name('article')->alias('a')->join('cate c','c.cate_id = a.cate_id','LEFT')->field('a.keywords,a.title,a.author,a.like_nums,a.content,a.publish_date,a.read_times,a.article_id,a.cate_id,c.catename,a.pic')->find($id);
        
        //使用limit方法查询该栏目的上一篇文章的id值
    	$prev= \think\Db::name('article')->where('article_id','<',$id)->where('cate_id','=',$article['cate_id'])->order('article_id desc')->limit(1)->value('article_id');

        //使用limit方法查询该栏目的下一篇文章的id值
    	$next= \think\Db::name('article')->where('article_id','>',$id)->where('cate_id','=',$article['cate_id'])->order('article_id asc')->limit(1)->value('article_id');
    	

    	$this->assign('article',$article);
    	$this->assign('prev',$prev);
    	$this->assign('next',$next);
        return $this->fetch('article');
    }
 
}
