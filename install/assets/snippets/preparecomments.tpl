//<?php
/**
 * prepare.Comments
 *
 * prepare.Comments
 *
 * @category	snippet
 * @internal	@modx_category Comments
 * @internal	@installset base
 * @internal	@overwrite true
 * @internal	@properties 
 */

if ($data['uid']) $data['uid'] = $modx->db->getValue('Select fullname from '.$modx->getFullTableName('web_user_attributes').' where internalKey='.$data['uid']);
else $data['uid'] = 'гость';
$content = json_decode($data['content'],1);
$data['pid']= '<a href="index.php?a=27&id='.$data['pid'].'" target="main" title="'.$modx->db->getValue('Select `pagetitle` from '.$modx->getFullTableName('site_content').' where id='.$data['pid']).'"><i class="fa fa-pencil" aria-hidden="true"></i></a>';

$data = array_merge($data,$content);
return $data;
