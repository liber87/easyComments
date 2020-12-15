//<?php
/**
 * cmultiTV
 *
 * cmultiTV
 *
 * @category	snippet
 * @internal	@modx_category Comments
 * @internal	@installset base
 * @internal	@overwrite true
 * @internal	@properties 
 */

$arr = array();
$docid = (isset($docid)) ? (int) $docid : $modx->documentIdentifier;
if ($id) $add = ' and `uidc`="'.$modx->db->escape($id).'"';
$res = $modx->db->query('Select `content`,`date` from '.$modx->getFullTableName('comments').' where `visible`=1 and `pid` = '.$docid.$add);
while ($row = $modx->db->getRow($res)) {
	$tarr = json_decode($row['content'],1);
	if (isset($dateFormat)) $row['date'] = date($dateFormat,$row['date']);
	$arr[] = array_merge($row,$tarr);
}
$json = json_encode($arr, JSON_UNESCAPED_UNICODE);
$params['fromJson'] = $json;
return $modx->runSnippet('multiTV',$params);
