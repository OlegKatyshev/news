<?php
namespace app\models;

use yii\db\ActiveRecord;

class Rubric extends ActiveRecord
{
    public $name;

    public $parent_id;

    public function rules()
    {
        return [
            [['name', 'parent_id'], 'required'],
            ['parent_id', 'integer'],
            ['parent_id', 'exist','targetAttribute' => 'id'],
            ['name', 'trim'],
        ];
    }

    public static function tableName()
    {
        return 'rubric';
    }

    public function getNews(){
        return $this->hasMany(News::class, ['id' => 'id_new'])
            ->viaTable('relations', ['id_rubric'=>'id']);
    }
}