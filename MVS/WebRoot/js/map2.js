/** 地图控件部分 **/
	    var terminal=[104.067475,30.654737];
		var map = new AMap.Map('container', {
			resizeEnable: true,
			zoom:18,
			isHotspot: true,
			keyboardEnable:true,
			center:terminal
 		});
		map.plugin(["AMap.MapType"],function(){
			//地图类型切换
			var type= new AMap.MapType({
			defaultType:0 //使用2D地图
			});
			map.addControl(type);
		});
		//var hhj_satation=new Array();
		
		map.plugin(["AMap.ToolBar"],function(){
			//加载工具条
			var tool = new AMap.ToolBar({autoPosition:true});
			map.addControl(tool);    
		});
		map.setCenter(terminal);
		var route2;
		//拖曳导航路径
		function Dragroute(path,satations,isadd){
			console.log("enter route-----");
			map.plugin("AMap.DragRoute",function(){
				route = new AMap.DragRoute(map, path, AMap.DrivingPolicy.LEAST_FEE,{
						midMarkerOptions:{
							visible :false,	
						},
						startMarkerOptions:{
							visible :false,	
						},
						endMarkerOptions:{
							visible :false,	
						},
						polyOptions :{
							strokeColor:'#cc9',
							//strokeOpacity:0.5
						}
					}); 
				//构造拖拽导航类，传入参数分别为：地图对象，初始路径，驾车策略
				route.search(); //查询导航路径并开启拖拽导航
				//当路径完成时的事件
				console.log("enter serach-----");
				AMap.event.addListener(route,'complete',function(e){
					//alert("OK");
					//alert(e.data.routes[0].steps[0].action);
					console.log("enter complete-----");
				    var r=e.data.routes[0].steps;
				    
					for(i=0;i<r.length;i++){
					     //各路段描述
						console.log(e.data.routes[0].steps[i].instruction );
						//目标路程
						console.log(e.data.routes[0].distance);
						//预计时间
						console.log(e.data.routes[0].time);
						console.log("enter complete-----");
					}
					AMap.event.addListener(route,'addway',function(e){
						alert("dd");
					});	
					//参考这个格式
					if(isadd!=1){
					$('#result').css("display","inline");
					$('#addroute').css("display","none");
					var trs=document.getElementById("routenumber");
					trs.innerHTML="线路"+satations[0].route;
					var tds=document.getElementById("time-distance").getElementsByTagName("td");
					tds[0].innerHTML=e.data.routes[0].time/60+"分钟";
					tds[1].innerHTML=e.data.routes[0].distance/1000+"千米";
					var s_e=document.getElementById("start-end");
					s_e.innerHTML=satations[0].name+"-----"+satations[satations.length-1].name;
					//alert();
					}
					else{
						$('#result').css("display","none");
						$('#addroute').css("display","inline");
						$("#addroute-start input").val(e.data.origin);
						//$("#addroute-start input").val(e.data.orgin);
						$("#addroute-end input").val(e.data.destination);
						var tt=document.getElementById("addroute-time");
						tt.innerHTML=e.data.routes[0].time/60+"分钟";
						var dd=document.getElementById("addroute-distance");
						dd.innerHTML=e.data.routes[0].distance/1000+"千米";	
						$('#addroute-sbm').bind('click',function(){
							var rrr=$("#addroute-number").val();
							var rr=document.getElementById("addroute").getElementsByTagName('selected');
							var rn=rr.value;
							for(var i=0;i<satations.length;i++){
								satations[i].number=hhj_satation.length+1;
								satations[i].route=rrr;
								hhj_satation[hhj_satation.length]=(satations[i]);
								console.log("----提交成功-------");
							}
						});
						$('#addroute-quit').bind('click',function(){
							$('#addroute').css("display","none");
							map.clearMap();
						});
					}
					route2=route;
					//route2.destroy();
				});
			});
		}	
		/*信息框
			参数为pos:位置，content:htmldom*/
			//var pos=([116.303843,39.983412]);
			//info(pos,document.getElementById('info'));
		var info2=new AMap.InfoWindow({offset:{x:0,y:-15}});	
		function info(position,content){
			//var info2=new AMap.InfoWindow({offset:{x:0,y:-15}});	
			info2.setContent(content);
			//alert(pos);
			info2.open(map,position);
			if(info2.getIsOpen()){
				//alert('OK');
			}
			else {
				info2.open();	
			}
		}
		//测距
		function RanginTool(){
			map.plugin(["AMap.RangingTool"],function(){ 
				 var ruler = new AMap.RangingTool(map); 
				 ruler.turnOn( ); 
			});
		}

		
		/*//多聚点图
		//聚点图，传入data数据,经纬度
		// 测试数据
		var path = new Array();
   		//path.push([116.303843, 39.983412]);
		path[0]={pos:[116.303843, 39.983412],
				 name:"1"};
		path[1]={pos:[116.321354, 39.896436],
				 name:"1"};
    	path[2]={pos:[116.407012, 39.992093],
				 name:"1"};
		path[3]={pos:[116.368904, 39.923423],
				 name:"1"};
		//markers(path);	*/
		function staffmarker(data){
			//console.log(data);
			//console.log([data.longitude,data.latitude]);
			var marker=new AMap.Marker({
				  position: [data.longti,data.lati],
				  title: data.name,	  
				  raiseOnDrag:true,
				  map: map,
				  icon:"icons/staff.png",
				  zIndex:100
			});
			setListener(marker,data)
		}
		function testmarker(data){
			var marker=new AMap.Marker({
				  position: data,
				  raiseOnDrag:true,
				  map: map,
				  icon:"icons/staff.png",
				  zIndex:100
			});
			//setListener(marker,data)
		}
		function satationsmarker(data){
			var marker=new AMap.Marker({
				  position:[data.longitude,data.latitude],
				  title: data.name,	  
				  raiseOnDrag:true,
				  map: map,
				  icon:"icons/satationOnRoute.svg",
				  zIndex:100
			});
			console.log(data.lineId);
			if(data.lineId==null||data.lineId==""){
				marker.setIcon('icons/satations.svg');
				//alert("OK");
			}
			setListener(marker,data)
			return marker;
		}
		
	
		function satationsmarker2(data){
			var marker=new AMap.Marker({
				  position:[data.longitude,data.latitude],
				  title: data.name,	  
				  raiseOnDrag:true,
				  map: map,
				  icon:"icons/satationOnRoute.svg",
				  zIndex:100
			});
			console.log(data.lineId);
			if(data.lineId==null||data.lineId==""){
				marker.setIcon('icons/satations.svg');
				//alert("OK");
			}
			var conten=SatationContent(data);
			AMap.event.addListener(marker, 'click',function (e){
				//data=marker.getPosition(); 
				marker.setDraggable(false);
				var conten=SatationContent(data);
				info(marker.getPosition(),conten);	
			});
			return marker;
		}
		function markers(data){
			
			var markers = []; //province见Demo引用的JS文件
			if(!data.length){
				markers[0]=setmarker(data,markers);
				markers.push(marker);
			}
			for (var i = 0; i < data.length; i += 1) {
				//console.log("testmar"+data[i]+"  "+i+data[i].lng);
				markers[i]=setmarker(data[i],markers);
				markers.push(marker);
			}
		}
		/***缩小**/
		function SatationContent(data) {  //信息窗体内容
			var s = [];
			s.push("名称：" + data.name);
			s.push("地址：" + data.address);
			s.push("路线："+ data.lineName);
			s.push("人数："+ data.peoNum);
			s.push("停留："+ data.delay);
			s.push('<div>');
			return s.join("<br>");
   		 }
		 function setmarker(data,markers){
			
				marker = new AMap.Marker({
				  position: [data.longitude,data.latitude],
				  title: data.name,	  
				  raiseOnDrag:true,
				  map: map
				});
				setListener(marker,data);
			 	
				return marker;
				//地图绑定鼠标右击事件——弹出右键菜单
				
		}
		function setListener(marker,data){
				var flag=0;
				map.on('click',function(){
					info2.close();
				});
			    var conten=SatationContent(data);
				AMap.event.addListener(marker, 'click',function (e){
					//data=marker.getPosition(); 
					marker.setDraggable(false);
					if(flag==1){
						console.log("移动成功");
						flag=0;
						//marker.hide();
						//satationSuit(marker.getPosition().getLng(),marker.getPosition().getLat(),data);
						var satation_search=new AMap.PlaceSearch({
							keywords :name, //搜索关键字为“超市”的poi
							city:'成都',
							citylimit:true,
							pageSize:10,
							//panel:'panel'
						});
						satation_search.searchNearBy("", marker.getPosition(),1000,function(status,result){
							//data.longitude=lng;
						//	console.log(data);
							data.longitude=marker.getPosition().getLng();
							data.latitude=marker.getPosition().getLat();
							data.address=result.poiList.pois[0].name;
							//marker.hide();
							 var json=JSON.stringify(data);
							 satationsmarker(data);
							 Editdata(json);
							  marker.hide();
							//marker.hide();
						});
						console.log("匹配成功");
					}
					else{
					var conten=SatationContent(data);
					info(marker.getPosition(),conten);	
					}
				});
				var ss=data;
				AMap.event.addListener(marker, 'rightclick',function(e){
					//info();
					info2.close(); 
					marker.setDraggable(false);
					var contextMenu=new AMap.ContextMenu();
					contextMenu.addItem("移动", function() {
						marker.setDraggable(true);
						flag=1;
						
					},0);
					contextMenu.addItem("删除", function() {
						
						var message=confirm("确认删除");
					
						if(message==true){
							marker.hide();
						//document.getElementById('delsatationnum').innerHTML=data.siteId;//console.log(document.getElementById('delsatationnum').innerHTML);
							DelsatationD(data.siteId);}else {}
						
				
						
					}, 1);
					console.log("OK-----右键点击"+ss);
					contextMenu.addItem("修改", function(){EditSatation(ss,marker);}, 2); 
					/*@contextMenu.addItem("查看路线", function() {
						var path = [];
						for(var i=0;i<markers.length;i++){
							console.log(markers[i]);
								path.push(markers[i].getPosition());
							} 		
						Dragroute(path);
					}, 3);*/
					contextMenu.open(map, marker.getPosition());
					contextMenuPositon = marker.getPosition();
				
				});	
		}
		
		
		
		
		
	//地图热点
	var placeSearch = new AMap.PlaceSearch();  //构造地点查询类
    var infoWindow2=new AMap.AdvancedInfoWindow({closeWhenClickMap:true});
    // map.on('hotspotclick', function(result) {
    map.on(' ', function(result) {
        placeSearch.getDetails(result.id, function(status, result) {
            if (status === 'complete' && result.info === 'OK') {
                placeSearch_CallBack(result);
            } 
        });
    });
	//回调函数
    function placeSearch_CallBack(data) { //infoWindow.open(map, result.lnglat);
        var poiArr = data.poiList.pois;
        var location = poiArr[0].location; 
        infoWindow2.setContent(createContent(poiArr[0]));
        infoWindow2.open(map,location);
    }
    function createContent(poi) {  //信息窗体内容
        var s = [];
        s.push('<div class="info-title">'+poi.name+'</div><div class="info-content">'+"地址：" + poi.address);
        s.push("电话：" + poi.tel);
        s.push("类型：" + poi.type);
		s.push("监控摄像头：无");
        s.push('<div>');
        return s.join("<br>");
    }	
	//地图绑定鼠标右击事件——弹出右键菜单
	
	function route2(lngLat1,lngLat2,type){	//传入路径经纬度,type表示类型0驾车，1步行，2公交
		var driving = new AMap.Driving({
			map: map,
			panel: "panel"
		}); 
		// 根据起终点经纬度规划驾车导航路线
		driving.search(lngLat1,lngLat2);
	}
	function Editdata(Data){
		$.ajax({ 
			type:"post",
			url: "servlet/ManageSiteServlet",
			data:{
					type:2,
					json:Data
			}, 
			error: function(request) {
	            //document.getElementById("p2"). innerHTML = '修改失败，请重新修改';
				
			},
			success: function(request){
				$("#w-modal-close").css("display","inline");
				$(".modal-body").html("修改成功");
					$("#load_modal").modal('show');
					var list = eval('(' + request + ')');
				 	sitelist = list.sitelist;
					var tab='<thead class="fixedThead"><tr><th>#</th><th>站点名称</th><th>站点地址</th><th>站点人数</th><th>站点所属线路</th></tr></thead><tbody class="scrollTbody">';
					for(var i=0;i<sitelist.length;i++){
						satationsmarker(sitelist[i]);
						if(sitelist[i].name=="0")
							continue;
						tab=tab+'<tr id="'+i+'"><td>'+(i+1)+'</td><td>'+sitelist[i].name+'</td><td>'+sitelist[i].address+'</td><td>'+sitelist[i].peoNum+'</td><td>'+sitelist[i].lineId+'</td></tr>';
						}
					alert(tab);
					tab=tab+'</tbody>';
					$("#site_table").html(tab);
					$("#site_table td").click(function() {
		 			$("tr").each(function() {
		 				$(this).css('background-color','white');
		 			})
		 				map.clearMap();
		             var  tr=$(this).parent().attr("id");
		               satationsmarker(sitelist[tr]);
		               map.setCenter([sitelist[tr].longitude,sitelist[tr].latitude]);
		               $("#"+tr).css('background-color','red');
		        
		           
		            });
		    
	      }});
	}
	function Addsitedata(Data){
		$.ajax({ 
			type:"post",
			url: "servlet/ManageSiteServlet",
			data:{
					type:4,
					json:Data
			}, 
			error: function(request) {
	            //document.getElementById("p2"). innerHTML = '修改失败，请重新修改';
	         },
			success: function(request){
				$("#w-modal-close").css("display","inline");
				$(".modal-body").html("添加成功");
				$("#load_modal").modal('show');
				var list = eval('(' + request + ')');
			 	sitelist = list.sitelist;
				var tab='<thead class="fixedThead"><tr><th>#</th><th>站点名称</th><th>站点地址</th><th>站点人数</th><th>站点所属线路</th></tr></thead><tbody class="scrollTbody">';
				for(var i=0;i<sitelist.length;i++){
					satationsmarker(sitelist[i]);
					tab=tab+'<tr id="'+i+'"><td>'+(i+1)+'</td><td>'+sitelist[i].name+'</td><td>'+sitelist[i].address+'</td><td>'+sitelist[i].peoNum+'</td><td>'+sitelist[i].lineId+'</td></tr>';
				}
				tab=tab+'</tbody>';
				$("#site_table").html(tab);
				$("#site_table td").click(function() {
	 			$("tr").each(function() {
	 				$(this).css('background-color','white');
	 			})
	 				map.clearMap();
	             var  tr=$(this).parent().attr("id");
	               satationsmarker(sitelist[tr]);
	               map.setCenter([sitelist[tr].longitude,sitelist[tr].latitude]);
	               $("#"+tr).css('background-color','red');
	        
	           
	            });
		    
	      }});
	}
	function DelsatationD(id){
		$.ajax({ 
			type:"post",
			url: "servlet/ManageSiteServlet",
			data:{
					type:3,
					sizeId:id
			}, 
			error: function(request) {
	            //document.getElementById("p2"). innerHTML = '修改失败，请重新修改';
	         },
			success: function(request){
				$("#w-modal-close").css("display","inline");
				$(".modal-body").html("删除成功");
					$("#load_modal").modal('show');
				var list = eval('(' + request + ')');
			 	sitelist = list.sitelist;
				var tab='<thead class="fixedThead"><tr><th>#</th><th>站点名称</th><th>站点地址</th><th>站点人数</th><th>站点所属线路</th></tr></thead><tbody class="scrollTbody">';
				for(var i=0;i<sitelist.length;i++){
				
					satationsmarker(sitelist[i]);
					tab=tab+'<tr id="'+i+'"><td>'+(i+1)+'</td><td>'+sitelist[i].name+'</td><td>'+sitelist[i].address+'</td><td>'+sitelist[i].peoNum+'</td><td>'+sitelist[i].lineId+'</td></tr>';
				}
				tab=tab+'</tbody>';
				$("#site_table").html(tab);
				$("#site_table td").click(function() {
	 			$("tr").each(function() {
	 				$(this).css('background-color','white');
	 			})
	 				map.clearMap();
	             var  tr=$(this).parent().attr("id");
	               satationsmarker(sitelist[tr]);
	               map.setCenter([sitelist[tr].longitude,sitelist[tr].latitude]);
	               $("#"+tr).css('background-color','red');
	        
	           
	            });
		    
	      }});
	}
	function exitclick(){
		map.on('click',function(){});
	}