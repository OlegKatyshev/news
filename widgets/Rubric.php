<?php
namespace app\widgets;

use yii\base\Widget;

class Rubric extends Widget
{
    public $data;

    public function init()
    {
        parent::init();
    }

    private function create($arr, $parentId=0){

        if(empty($arr[$parentId])) return;

        echo "<ul>";
        for($i=0; $i<count($arr[$parentId]); $i++) {

            echo "<li class='rubric-item' ><span class='rb-item-js' data-id='" . $arr[$parentId][$i]['id'] . "' >{$arr[$parentId][$i]['name']}</span>";
                $this->create($arr, $arr[$parentId][$i]['id']);
            echo "</li>";
        }
        echo "</ul>";
    }

    public function run()
    {
        return $this->create($this->data);
    }
}