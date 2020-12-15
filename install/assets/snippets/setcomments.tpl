//<?php
/**
 * SetComments
 *
 * записываем комментарий в базу
 *
 * @category	snippet
 * @internal	@modx_category Comments
 * @internal	@installset base
 * @internal	@overwrite true
 * @internal	@properties 
 */

if ($FormLister->isSubmitted())
{	
	$params = $FormLister->config->getConfig();
	$visible = ($params['publComment']) ? 1 : 0;
	$comment = array();
	foreach($_POST as $key=>$val) $comment[$key] = $modx->db->escape($val);
	
	$modx->db->insert(
	array('pid'=>$modx->documentIdentifier,
	'uidc'=>$params['id'],
	'aid'=>$modx->db->escape($_POST['aid']),
	'uid'=>$modx->getLoginUserID(),
	'date'=>time(),
	'content'=>json_encode($comment, JSON_UNESCAPED_UNICODE),
	'visible'=>$visible),
	$modx->getFullTableName('comments'));	
}
