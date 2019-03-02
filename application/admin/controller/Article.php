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
use think\Controller;

class Article extends Basic
{
    public function add()
    {
    	if(request()->isPost()){
    	//dump(input('post.')); die;
         
    		$data = [
                'cate_id' =>input('cate_id'),
                'author' =>input('author'),
                'title' => input('title'),
                'keywords' => input('keywords'),
                'description' => input('description'),
                'pic' => input('pic'),
                'content' => input('content'),
                'publish_date' => date('Y-m-d H:i:s'),
                'read_times' => 0,
                'like_nums' => 0,
            ];


            $file = request()->file('pic');
            if($file){
                // 移动到框架应用根目录/public/uploads/ 目录下
                $info = $file->move(ROOT_PATH . 'public' . DS . '/static/uploads');
                if($info){ 
                    //拼接文件路径
                    //使用date()方法计算出八位时间，上传到uploads的文件所在的文件名就是这八位时间
                    //使用$info->getFilename()方法获取文件名
                    $data['pic'] = date('Ymd').'/'.$info->getFilename();
                }else{
                    // 上传失败返回错误信息
                    return $this->error($file->getError());
                }
            };

    		//验证
    		$validate = new \app\admin\validate\Article;
    		if(!$validate->check($data)){
    			$this->error($validate->getError());
    		}
    		//1、使用 Db 类的 insert 方法向数据库提交数据
    		//$add = \think\Db::name("cata")->insert($data);

    		//2、使用助手函数添加
    		$add = db("article")->insert($data);
    		
    		//dump($add); die;  //输出返回值信息

    		//添加成功
    		if ($add){
    			$this->success("新增文章成功",'articlelist');
    		} else {
    			$this->error("新增文章失败",'articlelist');
    		}
    		
    	}
        return view();
    }

    public function del()
    {
        //获取模板传过来的id
        $id=input('id');
        //使用助手函数进行删除操作和判断
        if(db('article')->delete($id)){
            return $this->success('删除文章成功','articlelist');
        }else{
            return $this->error('删除文章失败','articlelist');
        }

    }

    public function edit()
    {
        //获取修改的信息
        $id=input('id');
        $article = db('article')->where('article_id',$id)->find();
        $this->assign('article',$article);//模板赋值

        if (request()->isPost()) {
         $data=[
                'article_id' =>input('id'),
                'cate_id' =>input('cate_id'),
                'author' =>input('author'),
                'title' => input('title'),
                'keywords' => input('keywords'),
                'description' => input('description'),
                'pic' => input('pic'),
                'content' => input('content'),
                'publish_date' => date('Y-m-d H:i:s'),
                
            ];
            

        //  $validate = new \app\admin\validate\Article;  
        //  if(!$validate->check($data)){
        //     $this->error($validate->getError());
        // }

        //2、使用助手函数更新
        $update = db("article")->update($data);
        if ($update) {
            $this->success("更新文章成功",'articlelist');
        } else {
            $this->error("更新文章失败",'articlelist');
        } 
    }       
        return view();
    }
    
    public function articlelist(){
         // 分页
         $articleRes = \think\Db::name('article')->alias('a')->join('cate c','c.cate_id = a.cate_id','LEFT')->paginate(3);
         $this->assign('articleRes',$articleRes);


        return view();
    }
}
