<?php 
	$this->load->view('partial/header.php');
?>
<div class="container content-remoter">
	<div class="row">
		<?php 
			foreach ($equipments->result() as $equipment) {
		?>
		<div id="edivide_<?php echo $equipment->eid; ?>" class="box-remoter bg-black">
			<p><?php echo $equipment->ename; ?></p>
			<p><?php echo $equipment->eid; ?></p>
		</div>
		<?php	}
		?>
		<div class="box-remoter bg-black">
			<p>ម.ត្រជាក់</p>
			<p>5</p>
		</div>
		<div class="box-remoter bg-black">
			<p>ម.ត្រជាក់</p>
			<p>6</p>
		</div>
	</div>
	<p class="clearfix"></p>
	<input type="text" class="entry" id="lamp_entry" name="entry-remote">
</div>
<script type="text/javascript">
	$(document).ready(function(){
		//entry start 
        $("#lamp_entry").focus();
        $(document).on("click","body",function(){
            $('#lamp_entry').focus();
            $('#lamp_entry').val('');
        });

        var timer = 0;
        $(document).on("keyup","#lamp_entry",function(even){
        	event.preventDefault();
            if (timer) {
                clearTimeout(timer);
            }
            timer = setTimeout(after_press, 1500); 
        });

        function after_press(){
            var index_lamp = $("#lamp_entry").val();
            if(index_lamp.length>0){
                   if(index_lamp=='1'){
                        Update_on(1);
                   }else if(index_lamp=='2'){
                        Update_off(1);
                   }else if(index_lamp=='3'){
                        Update_on(2);
                   }else if(index_lamp=='4'){
                        Update_off(2);
                   }else if(index_lamp=='5'){
                        Update_on(3);
                   }else if(index_lamp=='6'){
                        Update_off(3);
                   }else if(index_lamp=='7'){
                        Update_on(4);
                   }else if(index_lamp=='8'){
                        Update_off(4);
                   }
                }
                $('#lamp_entry').focus();
                $('#lamp_entry').val('');
        }

        function Update_on(eid){
        	$.ajax({
        		url:'<?php echo base_url("manages/update_entry"); ?>',
        		type:'POST',
        		data:{
        			id:eid,
        			status:1
        		},
        		dataType:'json',
        		success:function(data){
        			if(data.status){
        				//alert(data.status);
        			}else{
        				$.notify(data.message,'error');
        			}
        		}
        	});
        }
         function Update_off(eid){
        	$.ajax({
        		url:'<?php echo base_url("manages/update_entry"); ?>',
        		type:'POST',
        		data:{
        			id:eid,
        			status:0
        		},
        		dataType:'json',
        		success:function(data){
        			if(data.status){
        				//alert(data.status);
        			}else{
        				$.notify(data.message,'error');
        			}
        		}
        	});
        }
  //entry end 
  
		setInterval(function(){ get_isremoter(); }, 100);
		function get_isremoter(){
			$.ajax({
				url:'<?php echo base_url("manages/get_remoter"); ?>',
				type:'post',
				dataType:'json',
				success:function(data){
					if(data.status){
						var tmp = data.message;
						var output = tmp.split(",");
						$('.box-remoter').removeClass('bg-white');
						$('.box-remoter').addClass('bg-black');
						$.each(output, function( i, val ) {
						  $('#edivide_'+val).removeClass('bg-black');
						  $('#edivide_'+val).addClass('bg-white');
						});
					}else{
						$('.box-remoter').removeClass('bg-white');
						$('.box-remoter').addClass('bg-black');
					}
				}
			});
		}
	});
</script>
<?php 
	$this->load->view('partial/footer.php');
?>