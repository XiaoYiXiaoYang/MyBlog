<?php
//新增文章的验证器

namespace app\admin\validate;

use think\Validate;

class Article extends Validate
{
    protected $rule = [
        'title' => 'require|max:25|unique:article',
];
    protected $message =[
        'title.require' =>'栏目名称必须',
        'title.max' => '栏目名称不能大于5个字符',
        'title.unique'  =>'栏目名称不能重复',
];

}
 