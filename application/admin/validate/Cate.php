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

namespace app\admin\validate;

use think\Validate;

class Cate extends Validate
{
    protected $rule = [
        'catename' => 'require|max:25|unique:cate',
];
    protected $message =[
        'catename.require' =>'栏目名称必须',
        'catename.max' => '栏目名称不能大于5个字符',
        'catename.unique'  =>'栏目名称不能重复',
];

}
 