<?php
use app\widgets\Rubric;

use app\assets\RubricAsset;

RubricAsset::register($this);
?>

<div class="row">
    <div class="col-md-4">
        <div id='rubrics' class="rubric-list">
            <?php
                echo Rubric::widget(['data'=>$rubrics])
            ?>
        </div>
    </div>
    <div class="col-md-8" id="app-table"></div>
</div>