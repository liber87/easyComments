<html>	
	<head>
		<title>[+pagetitle+]</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width">
		<meta name="theme-color" content="#1d2023">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<link rel="stylesheet" type="text/css" href="media/style/default/css/styles.min.css?v=1611226578">
		<link rel="stylesheet" type="text/css" href="./../assets/lib/easyui/css/easyui.css">
		<link rel="stylesheet" type="text/css" href="./../assets/lib/easyui/css/icon.css">		
		<script type="text/javascript" src="./../assets/lib/easyui/js/jquery.min.js"></script>
		<script type="text/javascript" src="./../assets/lib/easyui/js/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="./../assets/lib/easyui/js/datagrid-detailview.js"></script>
		<script type="text/javascript" src="./../assets/lib/easyui/js/datagrid-dnd.js"></script>
		<script type="text/javascript" src="./../assets/lib/easyui/js/datagrid-filter.js"></script>
		<style>
			.sectionBody td, .sectionBody th{vertical-align:middle;}
			.pagination-info{margin-right: 20px;}
			/*.datagrid-row-selected a{color:white;}*/
			.menu-text i{position: absolute;left: 4px;z-index: 99;top: 8px;}
			.unpub{color: lightgrey; font-style: italic;}
			.deleted{color: #darkred; text-decoration: line-through; font-style: italic;}
			#tabComments{padding:0;}
			
		</style>
	</head>
	<body>
		<table id="dg"  
		class="easyui-datagrid"
		url="/../easyCollection?command=crud&act=getData&key=[+key+]&id=[+id+]&txt_search=[+txt_search+]"
		pageSize="25"
		pageList="[25,50,100]"		
		pagination="true"
		rownumbers="true"
		fitColumns="true" 				
		title=""
		singleSelect="false"
		ctrlSelect="true"
		>
			<thead>
				<tr>
					[+table+]
					<th field="edit" align="center" width="30" destroyFilter="true"></th>
				</tr>
			</thead>
		</table>
		
		
		
		
		<div id="dlg" class="easyui-dialog" style="width:600px;height:720px;padding:10px 20px" closed="true" buttons="#dlg-buttons">		
			<div id="div_form">
				<form id="ff" method="post" novalidate enctype="multipart/form-data">		
					<input type="hidden" name="id" value="">							
					[+form+]
				</form>
			</div>
		</div>	
		<div id="dlg-buttons">	
			<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">Отмена</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="save()">Сохранить</a>
		</div>
		
		<div id="mm-table-once" class="easyui-menu">								
			<div data-action="fastEdit"><i class="fa fa-edit"></i>Редактирование</div>	
			<div data-action="delete"><i class="fa fa-trash"></i>Удалить</div>			
		</div>
		<div id="mm-table-more" class="easyui-menu">					
			<div data-action="delete"><i class="fa fa-trash"></i>Удалить</div>			
		</div>
		
		<script>
		mode = '[+mode+]';			
		[+js+]			
		function timeConverter(UNIX_timestamp){	
			if (!!!UNIX_timestamp) return;
			if (UNIX_timestamp<=0) return;
			var a = new Date(UNIX_timestamp * 1000);			
			var year = a.getFullYear();
			var month = ('0'+(a.getMonth()+1)).slice(-2);
			var date = ('0'+a.getDate()).slice(-2);			
			var time = date + '.' + month + '.' + year;
			return time;
		}

		function getImage(img){			
			return '<img src="./../'+img+'" width="100">';
		}

		function textBreak(txt){			
			if (!!!txt) return;
			return '<span style="display:block;white-space: break-spaces;">'+txt+'</span>';
		}

		function checkbox (val, row, index) 
		{					
			if (val==0) return '<div style="text-align:center;"><input type="checkbox" data-row="'+row.id+'" class="checkbox"></div>';	
			else return '<div style="text-align:center;"><input type="checkbox" checked="checked"  data-row="'+row.id+'" class="checkbox"></div>';
		}

		function save(){
			var $that = $('#ff'),
			formData = new FormData($that.get(0)); 
			$.ajax({
				contentType: false, 
				processData: false, 
				url: '/../easyCollection?&command=crud&act=edit&key=[+key+]&id=[+id+]',
				method: 'post',
				data: formData,
				success: function(result){								
					if (result.success){
						$('#dlg').dialog('close');
						$('#dg').datagrid('reload');   
					} 
					else {$.messager.show({title: 'Error',msg: result.msg});}
				}
			});			
		}  

		function edit_str(row){
			act = 'update';
			if (!row) var row = $('#dg').datagrid('getSelected');				
			console.log($('#ff'));
			$('#ff').form('load',row);						
		} 



		$(window).resize(function() {
			$('#dg').datagrid('resize');
		});

		$(function(){
			if (mode=='table') {
				$('#createChildren').hide();					
			}
			
			var hb = $('body').height();				
			$('#body_table').css({"height":hb});
			
			var dg = $('#dg').datagrid({
				singleSelect: false,
				height:hb,
				dragSelection: true,
				onLoadSuccess: function(){
					if (mode!='table') $(this).datagrid('enableDnd');
					var data = $('#dg').datagrid('getData');						
					$.each(data.rows,function(index,item){  
						if(item.published==0){
							$('.datagrid-btable tr[datagrid-row-index="'+index+'"]').addClass('unpub');
						}
						if(item.deleted==1){
							$('.datagrid-btable tr[datagrid-row-index="'+index+'"]').addClass('deleted');
						}
					});
					
				},					
				onDblClickRow: function(index, row){						
					if (mode=='table'){
						$('#dlg').dialog('open').dialog('setTitle','Редактирование');	
						[+dc+]
						$('#ff').form('load',row);
						} else {							
						$('#edit'+row.id).trigger('click');							
					}
				},				
				onDrop: function(targetRow,sourceRow){						
					var rowsCount = $('#dg').datagrid('getSelections').length;
					var ids = [];
					if (rowsCount>1){							
						$.each(sourceRow,function(index,item){ 
							ids.push(item.id);
						});
					} else ids.push(sourceRow.id);
					
					$.ajax({
						url: '/../easyCollection?command=crud&act=setIndex&key=[+key+]&id=[+id+]',
						method: 'post',												
						data: { ids: ids, index : targetRow.menuindex, parent : targetRow.parent  },
						async: false
					});	
					$('#dg').datagrid('reload');
				},
				onRowContextMenu: function(e,index,row){
					
					if(row==null) {
						$('#dg').datagrid('unselectAll');
						return;
					}
					$('#dg').datagrid('selectRow', index);
					rows = $('#dg').datagrid('getSelections');
					var rowsCount = rows.length;
					var c = 'once';
					if (rowsCount>1) c = 'more';
					
					$('#mm-'+mode+'-'+c).menu('show', {
						left: e.clientX,
						top: e.clientY,
						onClick:function(item){
							var act = $(item.target).data('action');
							switch(act) {
								
								case 'fastEdit': 
								edit_str();
								$('#dlg').dialog('open').dialog('setTitle','Редактирование'); 
								break;
								
								case 'create':
								console.log($('#createChildren'));
								$('#createChildren').trigger('click');
								break;
								
								case 'delete':
								$.messager.confirm('Подтверждение','Вы действительно хотите удалить эти строки?',function(result){
									
									if (result){
										$.each(rows,function(index,item){  
											$.ajax({
												url: '/../easyCollection?command=crud&act=delete&key=[+key+]&id=[+id+]',
												method: 'post',												
												data: { id: item.id },
												async: false
											});															
										});
										$('#dg').datagrid('reload'); 
									}
								});
								break;
								
								
							}
						}
					});
					return false;
				}
				
			});
			
			$(document).on('change','.checkbox',function(){										
				var field = $(this).closest('td').attr('field');
				$.ajax({
					url: '/../easyCollection?command=crud&act=setCheckbox&key=[+key+]&id=[+id+]',
					method: 'post',												
					data: { id: $(this).data('row'), value: Number($(this).prop('checked')), field: field },
					async: false
				});	
				$('#dg').datagrid('reload'); 
			});
			
			if ($('.easyui-datebox').length>0){
				$('.easyui-datebox').datebox({
					formatter : function(date){				
						var y = date.getFullYear();
						var m = date.getMonth()+1;
						var d = date.getDate();
						return (d<10?('0'+d):d)+'.'+(m<10?('0'+m):m)+'.'+y;
					},
					parser : function(s){				
						if (!s) return new Date();
						
						var ss = s.split('.');
						var y = parseInt(ss[2],10);
						var m = parseInt(ss[1],10);
						var d = parseInt(ss[0],10);
						if (!isNaN(y) && !isNaN(m) && !isNaN(d)){
							return new Date(y,m-1,d)
							} else {
							return new Date();
						}
					}								
				});
				
				var c = $('.easyui-datebox').datebox('calendar');							
				c.calendar({firstDay: 1});
			}
			$('#dg').datagrid('resize');
			$(document).on('contextmenu','.datagrid',function(e){	
				e.preventDefault;
				return false;
			});
		});					
		</script>		
	</body>
</html>
