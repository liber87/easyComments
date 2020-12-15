<?php
$config = array(
	 array(			
		'id'=>'-1',
		'name'=>'Комментарии',
		'fields' => 
		array(									
			'date'=>array('name'=>'Время','type'=>'date','sortable'=>true,'width'=>100),	
			'uid'=>array('name'=>'Пользователь','type'=>'text','width'=>150),	
			'name'=>array('name'=>'Имя','type'=>'text','width'=>150),	
			'email'=>array('name'=>'Email','type'=>'text','width'=>150),	
			'comment'=>array('name'=>'Комментарий','type'=>'text-break','width'=>500),				
			'visible'=>array('name'=>'<i class="fa fa-eye" aria-hidden="true"></i>','type'=>'checkbox','width'=>40,'align'=>'center'),
		),			
		'prepare'=>'prepare.Comments',
		'afterPrepare'=>'afterPrepare.Comments',
		'oneTable'=>'comments',
		'orderBy'=>'id desc',		 
		'tplName'=>'comments',
		'button'=>'@CODE: ',
		'search'=>'[+txt_search+]',
		'allowed_fields'=>'name,email,comment'
		
	),
	array(			
		'id'=>'-1',
		'name'=>'Комментарии',
		'fields' => 
		array(									
			'date'=>array('name'=>'Время','type'=>'date','sortable'=>true,'width'=>100),	
			'uid'=>array('name'=>'Пользователь','type'=>'text','width'=>150),	
			'name'=>array('name'=>'Имя','type'=>'text','width'=>150),	
			'email'=>array('name'=>'Email','type'=>'text','width'=>150),	
			'comment'=>array('name'=>'Комментарий','type'=>'text-break','width'=>500),				
			'visible'=>array('name'=>'<i class="fa fa-eye" aria-hidden="true"></i>','type'=>'checkbox','width'=>40,'align'=>'center'),
			'pid'=>array('name'=>'<i class="fa fa-pencil" aria-hidden="true"></i>','type'=>'text','width'=>40,'align'=>'center')
		),			
		'prepare'=>'prepare.Comments',
		'afterPrepare'=>'afterPrepare.Comments',
		'oneTable'=>'comments',
		'orderBy'=>'id desc',		 
		'tplName'=>'comments',
		'button'=>'@CODE: ',
		'search'=>'[+txt_search+]',
		'allowed_fields'=>'name,email,comment'
		
	) 
);
