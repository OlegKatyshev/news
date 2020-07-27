<?php
    if(!empty($rubrics) && is_array($rubrics)){
       echo $this->render('rubric' , [ 'rubrics' =>$rubrics] );
    }
?>
