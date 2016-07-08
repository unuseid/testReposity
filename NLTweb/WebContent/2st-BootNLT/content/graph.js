"use strict";

jQuery(document).ready(function() {
	
	
	 $('#test_btn').on('click', function(event) {
		 alert('Hello World');  
	  });

  var data = [0];
  /* Graph Related Variables */
  var color = d3.scale.category10();
  color.domain(['Sensor']);
  var series = color.domain().map(function(name){
    return {
      name : 'Sensor',
      values : data
    };
  });
  var Alertcount =0;
  var MAX_DATA = 60;
  var x = null;
  var y = null;
  var line = null;
  var graph = null;
  var xAxis = null;
  var yAxis = null;
  var ld = null;
  var path = null;
  var recent_ri = 0;
  //INPBskFxg4YREap9Aa9_3JGVJBc=
  function createGraph(id) {
    color.domain('Sensor');
    var width = document.getElementById("graph").clientWidth;
    var height = document.getElementById("graph").clientHeight;
    var margin = {top: 10, right: 50, bottom: 20, left: 10};

    width = width - margin.left - margin.right;
    height = height - margin.top - margin.bottom;

    // create the graph object
    graph = d3.select(id).append("svg")
      .attr("width", width + margin.left + margin.right)
      .attr("height", height + margin.top + margin.bottom)
      .append("g")
      .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

    x = d3.scale.linear()
      .domain([0, MAX_DATA])
      .range([width, 0]);
    y = d3.scale.linear()
      .domain([
        d3.min(series, function(l) { return d3.min(l.values, function(v) { return v*0.75; }); }),
        d3.max(series, function(l) { return d3.max(l.values, function(v) { return v*1.25; }); })
      ])
      .range([height, 0]);
    //add the axes labels
    graph.append("text")
        .attr("class", "axis-label")
        .style("text-anchor", "end")
        .attr("x", 20)
        .attr("y", height)
        .text('Date');



    line = d3.svg.line()
      .x(function(d, i) { return x(i); })
      .y(function(d) { return y(d); });

    xAxis = graph.append("g")
      .attr("class", "x axis")
      .attr("transform", "translate(0," + height + ")")
      .call(d3.svg.axis().scale(x).orient("bottom"));

    yAxis = graph.append("g")
      .attr("class", "y axis")
      .attr("transform", "translate(" + width + ",0)")
      .call(d3.svg.axis().scale(y).orient("right"));

    ld = graph.selectAll(".series")
      .data(series)
      .enter().append("g")
      .attr("class", "series");

    // display the line by appending an svg:path element with the data line we created above
    path = ld.append("path")
      .attr("class", "line")
      .attr("d", function(d) { return line(d.values); })
      .style("stroke", function(d) { return color(d.name); });
  }

  function updateGraph() {
    // static update without animation
    y.domain([
      d3.min(series, function(l) { return d3.min(l.values, function(v) { return v*0.75; }); }),
      d3.max(series, function(l) { return d3.max(l.values, function(v) { return v*1.25; }); })
    ]);
    yAxis.call(d3.svg.axis().scale(y).orient("right"));

    path
      .attr("d", function(d) { return line(d.values); })
  }

  function getData(container, cb) {
    var url = '/data/' + container;
    $.get(url, function(data, status){
      if(status == 'success'){
        var value = data.con;
        var ri = parseInt(data.ri.slice(2, data.ri.length));
        if(ri > recent_ri){
          recent_ri = ri;
        }
        if(value <= 10 && Alertcount==0){toastr.error('전력 생성량 너무 낮음!! 보조배터리 사용 권장합니다 CMD1');}
        Alertcount++;
        if(Alertcount ==10){Alertcount=0;}
        cb(null, value);
      }
      else {
        console.log('[Error] /data API return status :'+status);
        cb({error: status}, null);
      }
    });
  }

  function displayData() {
    $('#temp_value')[0].innerText = data[0];
    $('#temp_time')[0].innerText = new Date().toLocaleString();
  }
  function insertNewData(value){
    if(data.length == MAX_DATA){
      data.pop();
    }
    data.splice(0,0,value);  
  }

  function initToastOptions(){
    toastr.options = {
      "closeButton": true,
      "debug": false,
      "newestOnTop": false,
      "progressBar": true,
      "positionClass": "toast-bottom-full-width",
      "preventDuplicates": false,
      "onclick": null,
      "showDuration": "3000",
      "hideDuration": "10000",
      "timeOut": "2000",
      "extendedTimeOut": "1000",
      "showEasing": "swing",
      "hideEasing": "linear",
      "showMethod": "fadeIn",
      "hideMethod": "fadeOut"
    }
  }
//여기서부터
 
  initToastOptions();
  graphStart();
  createGraph('#graph');  
  setInterval(function(){
    insertNewData(Math.ceil(Math.random() * 30)+20);
    displayData();
    updateGraph();
  }, 1000);alert('Hello World');
  //여기까지에서 문제 발생
  $('#ac_on_btn').on('click', function(event) {
    $.post('/control', {cmd:'on'}, function(data,status){
      toastr.success('보조 배터리 사용');
      console.log(data);
    });
    alert('Hello World');
  });
  $('#ac_off_btn').on('click', function(event) {
    $.post('/control', {cmd:'off'}, function(data,status){
      toastr.info('Aircon Off');
      console.log(data);
    });
  });
  
  
  
  
  
  var current_watt_for_graph = 0;



  function graphStart(){

  	    var n = 60,    // x 축 범위를 위한 변수 
  	    random = d3.random.normal(0, 0), 
  	    data = d3.range(n).map(random);   // 0~0 으로 x축(60) 범위를 초기화 한다. 



  	var margin = {top: 20, right: 20, bottom: 20, left: 40},    // 그래프 상하좌우 공백
  	    width = 500 - margin.left - margin.right,                      // 그래프 x 크기
  	    height = 280 - margin.top - margin.bottom;                 // 그래프 y 크기 



  	var x = d3.scale.linear()              // 그래프의 너비에 맞추어 x  축을 0~59로 나눈다.
  	    .domain([0, n - 1])
  	    .range([0, width]);



  	var y = d3.scale.linear()             // 그래프의 높이에 맞추어 0~100으로 나눈다.
  	    .domain([0, 100])
  	    .range([height, 0]);




  	var line = d3.svg.line()               // svg 라인이 설정되는(그려지는) 방법을 알려준다. 
  	    .x(function(d, i) { return x(i); })
  	    .y(function(d, i) { return y(d); });

   

     // div id 가 "graph_pane" 인것에 svg 형식의 그래프 그려준다.

  	var svg = d3.select("#graph_pane").append("svg")    
  	    .attr("width", width + margin.left + margin.right)       // 너비 설정
  	    .attr("height", height + margin.top + margin.bottom) // 높이 설정
  	  .append("g")                                                             //  그룹 "g"  속성  추가 
  	    .attr("transform", "translate(" + margin.left + "," + margin.top + ")");  // 변환(transform) 속성 설정 



  	svg.style("fill", "#000000")    // 그래프 색상 설정 



  	svg.append("defs").append("clipPath")   // clipPath  설정 (보여지길 원하는 사이즈 설정, 이외는 버림) 
  	    .attr("id", "clip")
  	  .append("rect")  // rect 설정 
  	    .attr("width", width)
  	    .attr("height", height);



  	svg.append("g")   // x 축에 대한 그룹 엘리먼트 설정 
  	    .attr("class", "x axis")
  	    .attr("transform", "translate(0," + y(0) + ")")
  	    .call(d3.svg.axis().scale(x).orient("bottom"));



  	svg.append("g")  // y 축에 대한 그룹 엘리먼트 설정 
  	    .attr("class", "y axis")
  	    .call(d3.svg.axis().scale(y).orient("left"));



  	

  	var path = svg.append("g") 
  	    .attr("clip-path", "url(#clip)")
  	  .append("path")    // 실제 데이터가 그려질 패스에 대한 설정 
  	    .datum(data)
  	    .attr("class", "line")
  	    .attr("d", line);





   	path    // 실제 데이터가 그려질 패스에 대한 스타일 설정 
          .style('stroke-width', 1)
          .style('stroke', 'yellow');



  	tick();  



  	function tick() {



  	  // 새로운 데이터를 뒤에 추가한다. (ajax 를 통해 1초에 한번씩 가장 최신 데이터를 가져온것을 넣어줌)

//  	  data.push(current_watt_for_graph);
  	data.push( Math.ceil(Math.random() * 30)+20);
  	  



  	  // 라인을 PATH 방식으로 그리자!!!   

  	  path

  	      .attr("d", line)

  	      .attr("transform", null)    // 기존 변환 행렬을 초기화하고  

  	      .transition()                 // 변환 시작

  	      .duration(1000)          // 1초동안 애니매이션하게 설정

  	      .ease("linear")           // ease 보간을 리니어로 처리한다.(https://github.com/mbostock/d3/wiki/Transitions#d3_ease)

  	      .attr("transform", "translate(" + x(-1) + ",0)")   //  변환행렬 설정   # 패스를 다시 그리는 방식이                                                                                     //  아니라 좌표를 변환함으로써 출렁거리는것을 막는다. 

  	      .each("end", tick);    //tick 함수 계속 호출 

  		 

  	  //가장 오래된 데이터를 제거한다.

  	  data.shift();



  	}

  }

});
