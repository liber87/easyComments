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
echo '<html>
	<head>					
		<link rel="stylesheet" type="text/css" href="media/style/default/style.css"> 		
	</head>
	<body>';
		if ($_GET['cid']) $_GET['txt_search'] = 'pid = '.$_GET['cid'];
		else $_GET['txt_search'] = 'visible = 0';
		include(MODX_BASE_PATH.'assets/plugins/easyCollection/classes/easyCollection.class.php');
		$ec = new easyCollection($modx);	
		if (isset($_GET['cid'])) $num = 0;
		else $num = 1;
		$ec->setCurrentConfig($num,-1,'comments');			
		$ec->getTable();		
	echo '</body>
</html>';
