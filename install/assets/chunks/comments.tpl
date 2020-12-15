/**
 * comments
 *
 * comments
 *
 * @category	chunk
 * @internal	@modx_category Comments
 * @internal	@installset base
 * @internal	@overwrite true
 */
<div style="margin:30px 0;">
[!cmultiTV?
&docid=`[*id*]`
&display=`5`
&offset=`0`
&noResults=``
&dateFormat=`d.m.Y`
&outerTpl=`@CODE: ((wrapper)) `
&rowTpl=`@CODE:<p>((date)) <b>((name))</b>: ((comment))</p>`	
!]
</div>

[!FormLister?
&formid=`sendComment`
&formTpl=`commentForm`
&reportTpl=`commentReport`
&subject=`На сайте [(site_name)] оставлен комментарий`
&prepare=`SetComments`
&protectSubmit=`0`
&publComment=`1` //Публиковать по умолчанию
&id=`test comment`
!]
