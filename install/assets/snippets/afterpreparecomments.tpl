//<?php
/**
 * afterPrepare.Comments
 *
 * afterPrepare.Comments
 *
 * @category	snippet
 * @internal	@modx_category Comments
 * @internal	@installset base
 * @internal	@overwrite true
 * @internal	@properties 
 */

if (isset($data['visible'])) return $data;
$data['date'] = strtotime($data['date']);
$comment = array('name'=>$data['name'],'email'=>$data['email'],'comment'=>$data['comment']);
$data['content'] = json_encode($comment, JSON_UNESCAPED_UNICODE);
unset($data['name']);
unset($data['email']);
unset($data['comment']);
return $data;
