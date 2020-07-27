<?php
namespace app\assets;

use yii\web\AssetBundle;

class RubricAsset extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web';
    public $css = [
        'css/rubric-list.css',
    ];
    public $js = [
        'js/rubric-list.js',
    ];
    public $depends = [
        'app\assets\AppAsset',
    ];
}