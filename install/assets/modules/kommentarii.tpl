/**
 * Комментарии
 *
 * Комментарии
 *
 * @category	module
 * @internal	@modx_category Comments
 * @internal	@installset base
 * @internal	@properties 
 * @internal	@guid 09466629bb032b3aac1fdbd7c681f3b5
 * @internal	@shareparams 1
 * @internal	@overwrite true
 */
if ($_GET['cid']) $_GET['txt_search'] = 'pid = '.$_GET['cid'];
else $_GET['txt_search'] = 'visible = 0';
if (!class_exists('easyCollection')) {
	include(MODX_BASE_PATH.'assets/plugins/easyCollection/classes/easyCollection.class.php');
}
$ec = new easyCollection($modx);	
if (isset($_GET['cid'])) $num = 0;
else $num = 1;
$ec->setCurrentConfigName('comments',0);			
$ec->getTable();		
