<?php
namespace app\controllers;

use yii\web\Controller;
use app\models\Rubric;
use app\models\DataRubric;


class NewsController extends Controller
{
    public function actionIndex()
    {
        //Получаем данные рубрик для меню и групируем рубрики по родительскому id
        $rubrics = Rubric::find()->asArray()->all();
        $rubrics = DataRubric::group($rubrics,'parent_id');


        return $this->render('index',[
            'rubrics' => $rubrics
        ]);
    }

    public function actionGetNews($id){

        // Приведение типа к int искл необходимость подготовленного запроса
        $id = (int) $id;
        $rubrics=[];

        if($id){

            //Получаем id дочерних рубрик в не зависимости от их вложенности
            $childRubric = DataRubric::getIdChildRubric($id);
            array_push($childRubric, $id);

            $rubrics = Rubric::find()
                ->select(
                    [
                        'rubric_id' => 'rubric.id',
                        'rubric_name'=>'rubric.name',
                        'topic'=>'news.topic',
                        'text'=>'news.text'
                    ]
                )
                ->innerJoinWith('news')
                ->where(['rubric.id'=>$id])
                ->orWhere(['rubric.parent_id'=>$childRubric])
                ->asArray()
                ->all();

        }
        echo json_encode($rubrics);
        exit;
    }
}