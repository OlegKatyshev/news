<?php
namespace app\models;

use yii\db\ActiveRecord;

class News extends ActiveRecord
{
    public $topic;

    public $text;

    public function rules()
    {
        return [
            [['topic', 'text'], 'required'],
            [['topic', 'text'], 'trim'],
         ];
    }

    public static function tableName()
    {
        return 'news';
    }
}