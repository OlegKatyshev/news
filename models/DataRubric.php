<?php
namespace app\models;
use app\models\Rubric;

class DataRubric
{
    static function group(array $rubrics, $label){

        $result = [];

        if(!empty($rubrics)){
            foreach ($rubrics as $rubric){

                if(array_key_exists( $rubric[$label], $result) && is_array($rubric)){
                    array_push($result[$rubric[$label]], $rubric);
                }
                else{
                    $result[$rubric[$label]] = [$rubric];
                }
            }
        }
        return $result;
    }

    static function getIdChildRubric($id){

        $ids = [];
        $flag = true;

        while($flag) {

            $id = Rubric::find()->select('id')
                ->where(['parent_id' => $id])
                ->column();

            if(!empty($id)){
                $ids = array_merge($ids, $id);
            }
            else{
                $flag = false;
            };
        }
        return $ids;
    }


}