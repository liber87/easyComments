//<?php
/**
 * easyComments
 *
 * easyComments
 *
 * @category    plugin
 * @internal    @events OnDocFormRender,OnManagerWelcomeHome
 * @internal    @modx_category Comments
 * @internal    @properties &idModule=MODULE ID;text; &ids=id;text; &templates=templates;text;
 * @internal    @disabled 0
 * @internal    @installset base
 */
if ($modx->event->name=='OnManagerWelcomeHome'){  
	function num_word($value, $words, $show = true) {
		$num = $value % 100;
		if ($num > 19) { 
			$num = $num % 10; 
		}

		$out = ($show) ?   ' ' : '';
		switch ($num) {
			case 1:  $out .= $words[0]; break;
			case 2: 
			case 3: 
			case 4:  $out .= $words[1]; break;
			default: $out .= $words[2]; break;
		}
		return $out;
	}
	
	$unvis = $modx->db->getValue('Select count(*) from '.$modx->getFullTableName('comments').' where visible=0');
	
	if ($unvis>0){
		$widgets['easyComments'] = array(
		'menuindex' =>'-1',
		'id' => 'easyComments',
		'cols' => 'col-sm-12',
		'icon' => 'fa-comments',
		'title' => 'Неопубликованные комментарии',
		'body' => '
		<div class="card-body text-center">
			На вашем сайте имеется <a href="index.php?a=112&id='.$idModule.'" target="main" style="color:#3481bc;">'.$unvis.' '.num_word($unvis, array('неопубликованный', 'неопубликованных', 'неопубликованных')).' '.num_word($unvis, array('комментарий', 'комментария', 'комментариев')).'. Нажмите здесь для управления '.num_word($unvis, array('им', 'ими', 'ими')).'.</a>
		</div>'
		);	
		$modx->event->output(serialize($widgets));	
	}
}
if ($modx->event->name=='OnDocFormRender'){
	if (!isset($ids) && !isset($templates)) return;
	$flag = 0;

	if (isset($templates)){
		$templates_arr = explode(',',$templates);
		foreach($templates_arr as $key => $val) $templates_arr[$key] = trim($val);
		if (in_array($modx->documentObject['template'],$templates_arr)) $flag = true;	
	}

	if (isset($ids)){
		$ids_arr = explode(',',$ids);
		foreach($ids_arr as $key => $val) $ids_arr[$key] = trim($val);
		if (in_array($modx->documentObject['id'],$ids_arr)) $flag = true;
	}



	if ($flag==false) return;

	$all = $modx->db->getValue('Select count(*) from '.$modx->getFullTableName('comments').' where pid='.$modx->documentObject['id']);
	$notvis = $all-$modx->db->getValue('Select count(*) from '.$modx->getFullTableName('comments').' where pid='.$modx->documentObject['id'].' and visible=0');
	echo '
	<style>
	#tabComments{padding:0; height:500px;}
	#openComment{color:white; cursor:pointer;}
	#openComment i{display: inline-block !important;font-size: 14px !important;}
	</style>
	<script>
	modx = parent.modx;
	document.addEventListener("DOMContentLoaded", function(){		
		let parent = document.querySelector("#actions .btn-group");
		let lnk = document.createElement("a");
		lnk.innerHTML = "<i class=\"fa fa-comments\" aria-hidden=\"true\"></i> ('.$notvis.'/'.$all.')";
		lnk.className = "btn btn-warning";
		lnk.id = "openComment";
		parent.append(lnk);
		document.querySelector("#openComment").onclick = function(){';
		if ($all>0) echo '
			modx.popup({
			url: "index.php?a=112&id='.$idModule.'&cid='.$modx->documentObject['id'].'",
			title:"Комментарии",
			draggable:false,
			width: "90%",
			height: "90%",
			hover: 0,
			hide: 0});';

		echo '};
	});
	</script>';
}
