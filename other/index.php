<?php
header("Content-Type:text/html;Charset=utf-8");
//这是一个工具类，作用是完成对数据库的操作  
class mysqlHelper{
	private $host = "localhost";
    private $username = "test";
    private $password = "188632";
    private $dbname = "wx_votesystem";
	private $conn;
	 
	public function __construct() {  
            $this->conn=mysqli_connect($this->host,$this->username,$this->password,$this->dbname);  
            if (!$this->conn) {  
                mysqli_error($this->conn);  
                die("连接失败".mysqli_error($this->conn));  
            }  
            //设置访问数据库的编码  
            mysqli_query($this->conn, "set names utf8") or die(mysqli_error($this->conn));  
   }  
          
    //执行sql语句，返回的是一个数组  
    public function execute_sql($sql) { 
 
	        $arr = array();  
            $res = mysqli_query($this->conn,$sql) or die(mysqli_error($this->conn));  
              
            //$i=0;  
            while($row=mysqli_fetch_array($res)) {  
                //$arr[$i++]=$row;  
                $arr[]=$row;  
            }  
          
			//这里就可以马上把$res关闭  
            mysqli_free_result($res); 
			
	        //返回数据
            return $arr;        
    }  
	//执行sql语句，返回的是一个结果
    public function execute_sql2($sql) { 
 
	        $arr;  
            $res= mysqli_query($this->conn,$sql) or die(mysqli_error($this->conn));  
              
            $arr = mysqli_fetch_row($res); 
            
			//这里就可以马上把$res关闭  
            mysqli_free_result($res); 
			

	        //返回数据
            return sizeof($arr)>0?$arr[0]:0;        
    }  
    //执行sql语句，插入数据 没有返回值
    public function execute_sql3($sql) { 

         mysqli_query($this->conn,$sql) or die(mysqli_error($this->conn));  
    } 
    //关闭链接
    public function close_connect(){
		  mysqli_close($this->conn);
	}
	
	//关闭自动提交
	public function closeautocommit(){
		$this->conn->autocommit(false);
	}
	//提交事务
	public function commit(){
		$this->conn->commit();
		
	}
	//回滚事务
	public function rollback(){
		$this->conn->rollback();
		
	}
	//打开自动提交
	public function openautocommit(){
		$this->conn->autocommit(TRUE); //开启自动提交功能
	}
}//mysqlHelper end

//图片上传
$upload =  isset($_POST["upload"])?$_POST["upload"]:"";
//echo !empty($upload);
if(!empty($upload)){
	if($upload == "wx_vote_uploadimg"){
	   $userid=$_POST['userid'];//上传者id
	   //$file = $_FILES['file'];
	  // echo json_encode($file);
       
      /*   
	  //获取文件的大小  
       $file_size=$_FILES['file']['size'];
       if($file_size>2*1024*1024) {  
           echo 100;//文件过大..  
           exit();  
       }
	   不限制大小*/
        //判断是否上传成功（是否使用post方式上传）  
      if(is_uploaded_file($_FILES['file']['tmp_name'])) {  
        //把文件转存到你希望的目录（不要使用copy函数）  
        $uploaded_file=$_FILES['file']['tmp_name'];  
        //我们给每个用户动态的创建一个文件夹  
        $user_path=$_SERVER['DOCUMENT_ROOT']."/wx_graduation_voteforyou/uploadfile/img/".$userid;  
        //判断该用户文件夹是否已经有这个文件夹      		
        if(!file_exists($user_path)){	
            mkdir($user_path,0777,true);//必须加上true,多级目录，和java不同	
        }  
        //$move_to_file=$user_path."/".$_FILES['myfile']['name'];  
        $file_true_name=$_FILES['file']['name']; 		
        $move_to_file=$user_path."/".time().rand(1,1000). "_" . $file_true_name; 
        		
        //echo "$uploaded_file   $move_to_file";  
        if(move_uploaded_file($uploaded_file,iconv("utf-8","gb2312",$move_to_file))){  
		    //返回服务器地址
			//echo $move_to_file;
			$move_to_file =substr($move_to_file,strpos($move_to_file,"/wx_graduation_vote"));
            echo $move_to_file;//成功  
			
			
        } else {  
            echo 500;//失败
        }  
      }else {  
        echo 500;//失败
     }  	   
	}
	exit();
}


//创建一数据链接
$mysql = new mysqlHelper();



$req = isset($_GET["scene"])?$_GET["scene"]:"";//场景——跳转
$id = isset($_GET["id"])?$_GET["id"]:"";//场景跳转——详情id


if($req == "vote_login"){ 
	$code = isset($_GET["code"])?$_GET["code"]:"";

    $url = "https://api.weixin.qq.com/sns/jscode2session?appid=wx666d9a39d2780738&secret=7fd0064a2a67539d1d869d2741e84ce5&js_code=" . $code . "&grant_type=authorization_code";
    //$url = "https://api.weixin.qq.com/sns/jscode2session?appid=wxb24d17bf7af92f83&secret=ac05766953f53ff245c3f45a68860e4a&js_code=" . $code . "&grant_type=authorization_code";
    
	
	$curl = curl_init(); // 启动一个CURL会话
    curl_setopt($curl, CURLOPT_URL, $url);
    curl_setopt($curl, CURLOPT_HEADER, 0);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false); // 跳过证书检查
    curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);  // 从证书中检查SSL加密算法是否存在
    $result = curl_exec($curl);     //返回api的json对象
    //关闭URL请求
    curl_close($curl);
	
	$openid = json_decode($result)->openid;//返回json对象_中的openid
	$userinfo = $_GET['userinfo'];
	$user = json_decode($userinfo);
	//echo "opedid:" . $openid;
	//查找数据库判断是否存在
	$sql = "select count(id) from tbl_user where openid = '" . $openid . "'";
	
	$result  = $mysql->execute_sql2($sql);
	//echo $result;
    //不存在 则添加用户
	if($result == 0){
		$sql = "insert tbl_user (id,name,image,openid,gender) values(null," . "'" . $user->nickName . "'," . "'" . $user->avatarUrl . "'," . "'" . $openid . "',"  . $user->gender . ")";
	    $mysql->execute_sql3($sql);
	}else{
		//存在就更新_可能用户名 等信息改动
		$sql = "update tbl_user set name = '" . $user->nickName . "' ,image = '" . $user->avatarUrl . "', gender = "  . $user->gender . "  where openid  = '" . $openid . "'";
		//echo $sql;
	    $mysql->execute_sql3($sql);
	};
	//查询id返回
	$sql = "select id from tbl_user where openid = '" . $openid . "'";
	
	$result  = $mysql->execute_sql2($sql);
		
	header("content-type:text/html; charset=utf-8");
	echo $result;

}else if($req == "wx_vote_save"){
 	 //获取投票信息
	 $votepack = $_GET['votepack'];
	 
	 //json解码
	 $votepack =  json_decode($votepack);
	 
     //获取用户id
	 $userid = $_GET['userid'];
	 
	 $title = $votepack->title;
	 $votedesc = $votepack->text;
	 $endtime = $votepack->endTime;
	 $votetype = $votepack->voteOptionCount;
	 $isanonymous = $votepack->anonymous;
	 $image = $votepack->image;
	 $date =Date("Y-m-d H:i:s");
	 
	 //插入vote表

	 $sql = "insert tbl_vote (title,votedesc,votetype,endtime,isanonymous,userid,starttime,image) values('" .$title . "','" . $votedesc . "'," . $votetype .",'" . $endtime . "'," . $isanonymous . "," .$userid .",'" . $date. "','" .$image ."')";

	 
	 //echo $sql;
	 $mysql->execute_sql3($sql);
	 
	 //查询id返回
	 $sql =" select id from tbl_vote where starttime = '" . $date ."'";
	 $id = $mysql->execute_sql2($sql);
	 //echo $id;
 	 //插入选项
	 $options = $votepack->options;
	 
	 foreach($options as $opt){
        $sql = "insert tbl_voteoption(vdesc,voteid) values ('" . $opt . "'," .$id .")";
        $mysql->execute_sql3($sql);		
	 }
	 
	 //返回选项id
	 echo $id;
	 
}else if($req == "get_vote_list"){//获取投票列表
    
	$sql = "select v.id,v.title,v.starttime,v.endtime,v.isanonymous,v.image,v.end,u.image logo,u.name,u.gender from tbl_vote v left join tbl_user u on v.userid=u.id  where v.vshow = 2 order by  v.id desc ";
	//echo $sql;
	$result  = $mysql->execute_sql($sql);
		
	echo json_encode($result);
}else if($req == "get_vote_list_own"){//获取投票列表_我发起的
	$sql = "select v.id,v.title,v.starttime,v.endtime,v.isanonymous,v.image,v.end,u.image logo,u.name,u.gender from tbl_vote v left join tbl_user u on v.userid=u.id  where userid = " .$id ." order by  v.id desc";
	//echo $sql;
	$result  = $mysql->execute_sql($sql);
		
	echo json_encode($result);
	
}else if($req == "get_vote_list_join"){//获取投票列表_我参与的
    
	$sql = "select v.id,v.title,v.starttime,v.endtime,v.isanonymous,v.image,v.end,u.image logo,u.name,u.gender from tbl_vote v left join tbl_user u on v.userid=u.id  where v.id in (select distinct voteid from tbl_selectdetail where userid = " .$id." order by  v.id desc)";
	//echo $sql;
	$result  = $mysql->execute_sql($sql);
		
	echo json_encode($result);
}else if($req == "get_vote_list_audit"){//获取投票列表_审核
	$sql = "select v.id,v.title,v.starttime,v.endtime,v.isanonymous,v.image,v.end,v.vshow,u.image logo,u.name,u.gender from tbl_vote v left join tbl_user u on v.userid=u.id  where v.vshow = 1";
	//echo $sql;
	$result  = $mysql->execute_sql($sql);
		
	echo json_encode($result);
	
}else if($req =="get_vote_detail"){
	echo json_encode(get_vote_detail_common($id));
}else if($req == "addoption"){
	$option = $_GET['option'];
	$userid = $_GET['userid'];
	$voteid = $_GET['voteid'];
	//json解码
	 $option =  json_decode($option);
	 //选项插入
	 foreach($option as $opt){
        $sql = "insert tbl_selectdetail(voteid,userid,optionid) values (" .$voteid.",". $userid . "," .$opt .")";
        $mysql->execute_sql3($sql);		
	 }
	 //数据跟新
	 
    	
	 echo json_encode(get_vote_detail_common($voteid));
}else if($req == "get_optiondetail"){
	//先把基于此投票的选项查出来
	 $sql = "select id,vdesc from tbl_voteoption where voteid = " . $id;
     $options = $mysql->execute_sql($sql);
	 //储存
	 //遍历查出每个选项+选择用户
	 $result = array();
	 foreach($options as $opt){
	    $res = array();
		$res[] = $opt;
        $sql = "select u.name from tbl_user u left join tbl_selectdetail s on u.id = s.userid where s.optionid = " . $opt['id'];
		//echo $sql;
        $res[] = $mysql->execute_sql($sql);	

        $result[] = $res;		
	 }
	 
	 echo json_encode($result); 
}else if($req == "endvote"){
	
	$sql = "update tbl_vote set end = 2 where id = " .$id;
		//echo $sql;
    $mysql->execute_sql3($sql);
}else if($req == "deletevote"){
	
	$sql = "delete from tbl_vote where id = " .$id;
		//echo $sql;
    $mysql->execute_sql3($sql);
}else if($req =="aduitvote"){
	$sql = "update  tbl_vote set vshow = 2 where id = " .$id;
	//echo $sql;
    $mysql->execute_sql3($sql);
}

function get_vote_detail_common($id){
	//创建一数据链接
    $mysql = new mysqlHelper();

	$result = array();
	
    //获取投票的主题信息
	$sql = "select v.id,v.title,v.votedesc,v.votetype,v.isanonymous,v.endtime,v.end,u.image,u.name from tbl_vote v left join tbl_user u on v.userid=u.id where v.id = " . $id;
	//echo $sql;
	$result[]  = $mysql->execute_sql($sql);
	//获取选项信息,被选择多少次	
	$sql = "SELECT o.id,o.vdesc,COUNT(s.id) sum FROM tbl_voteoption o LEFT JOIN tbl_selectdetail s ON o.id = s.optionid WHERE o.voteid = ". $id." GROUP BY o.id";
	$result[]  = $mysql->execute_sql($sql);
	
	//查询做过投票的用户信息
	
	 $sql = "select  distinct  u.id,u.name,u.image from tbl_user u left join tbl_selectdetail s  on u.id = s.userid where s.voteid = " .$id;
	 $result[] = $mysql->execute_sql($sql);

	$mysql->close_connect();
	return $result;
}

$mysql->close_connect();
?>