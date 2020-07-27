<?php
namespace app\models;

use yii\db\ActiveRecord;
use app\models\Rubric;
use app\models\News;

class Relations extends ActiveRecord
{

    public $id_new;

    public $id_rubric;

    public function rules()
    {
        return [
            [['id_new', 'id_rubric'], 'required'],
            [['id_new', 'id_rubric'], 'integer'],
        ];
    }

    public static function tableName()
    {
        return 'relations';
    }

}