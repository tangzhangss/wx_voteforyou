//index.js
//获取应用实例
const app = getApp()
Page({
  data: {
    votemain:{},
    optioninfo:[],
    userinfo:[],
    admin:false,
    option:[],//储存选项id
    userid:null,
  },
  //删除投票
  deletevote:function(e){
    
    var that =this;

    wx.showModal({
      title: '提示',
      content: '确认删除投票？',
      success:function(res){
        if(res.confirm){
          that.deletevote1();
        }
      },
    })
  },
  //审核投票通过
  aduitvote:function(){
    var that = this;
    var id = this.data.votemain.id;
    wx.showLoading({
      title: '加载中..',
    })
    wx.request({
      url: app.globalData.host + "/wx_graduation_voteforyou/",
      data: { "scene": "aduitvote", "id": id },
      success: function (e) {
       wx.showToast({
         title: '已通过!',
       })
        wx.navigateBack({

        });
      }, fail: function () {
        wx.hideLoading();
      }
    }) 
  },
  deletevote1:function(){
    var that = this;
    var id = this.data.votemain.id;
    wx.showLoading({
      title: '加载中..',
    })
    wx.request({
      url: app.globalData.host + "/wx_graduation_voteforyou/",
      data: { "scene": "deletevote", "id": id },
      success: function (e) {
        wx.showModal({
          title: '提示',
          content: '删除成功，刷新见效!',
        })
        wx.navigateBack({

        });
      }, fail: function () {


        wx.hideLoading();

        wx.showModal({
          title: '提示',
          content: '删除失败!',
        })
      }
    }) 
  },
  //提前结束投票
  endvote:function(){
    var that = this;
    var id = this.data.votemain.id;
    wx.showLoading({
      title: '加载中..',
    })
    wx.request({
      url: app.globalData.host +"/wx_graduation_voteforyou/",
      data:{"scene":"endvote","id":id},
      success:function(e){
        that.setData({
          'votemain.end':2,
        })
        wx.hideLoading();
      },fail:function(){
        wx.hideLoading();
      }
    })
  },
  //查看投票详情
  openVotedetail:function(){
    //投票id
    var vid = this.data.votemain.id;

    wx.navigateTo({
      url: './optiondetail/optiondetail?id='+vid,
    })
  },
  radioChange:function(e){

    this.data.option[0] = e.detail.value;

    console.log(this.data.option[0]);
  },
  checkboxChange:function(e){
    var value = e.detail.value;
    
    if(value.length > this.data.votemain.votetype){
      wx.showModal({
        title: '提示',
        content: '您仅可勾选 ' + this.data.votemain.votetype +" 个选项,此勾选无效",
      })
      return ;
    }

    this.data.option = value;
    
   // console.log(this.data.option);
  },
  //保存投票
  saveVoteres:function(e){
    console.log(e);
    //判断是否选择
    if(this.data.option.length<=0){
      wx.showModal({
        title: '提示',
        content: '您还没有选择!',
        
      })

      return;
    }
   
    //如果用户拒绝的话 就提示
    if (e.detail.userInfo == null) {
      wx.showModal({
        title: '提示',
        content: '授权失败，不可执行此操作!',
      })
      return;
    }
    var that = this;

    var that = this;
    //如果是第一次授权则进行登录，不然就不进行登录操作--可能造成数据更新问题，但是不影响
    if (app.globalData.userid == null) {
      var userinfo = e.detail.userInfo;
      app.userLogin(userinfo);
      setTimeout(() => {

        //判断是否已经投过票了
        var cid = app.globalData.userid;
        var z = 0;
        for (let i = 0; i < that.data.userinfo.length; i++) {
          if (cid == that.data.userinfo[i].id) {
            z = 1;
            break;
          }
        }
        if (z == 1) {
          wx.showModal({
            title: '提示',
            content: '您已经投过一次票了，不能重复投票!',
          })
          return;
        }

        that.saveVoteres2();
      }, 2000);
      return;
    }


    //判断是否已经投过票了
    var cid = app.globalData.userid;
    var z = 0;
    for (let i = 0; i < that.data.userinfo.length; i++) {
      if (cid == that.data.userinfo[i].id) {
        z = 1;
        break;
      }
    }
    if (z == 1) {
      wx.showModal({
        title: '提示',
        content: '您已经投过一次票了，不能重复投票!',
      })
      return;
    }
    
   
    that.saveVoteres2();
  
  },
  saveVoteres2:function(){
    wx.showLoading({
      title: '投票中...',
      })
      var that =this;
      wx.request({
        url: app.globalData.host +"/wx_graduation_voteforyou/",
        data: { "scene": "addoption", "option": that.data.option, "userid": app.globalData.userid, "voteid": that.data.votemain.id},
        success: function (rep){ 
          //处理optioninfo process组件
          var optioninfo = rep.data[1];
          //计算总投票选择次数_面对多选投票人数不起作用
          var count = 0;
          for (let i = 0; i < optioninfo.length; i++) {

            count = count + parseInt(optioninfo[i].sum);
          };

          for (let i = 0; i < optioninfo.length; i++) {
            let rate = (optioninfo[i].sum / count * 100) + "";
            let k = rate.indexOf(".");
            if(k == -1){
              k = rate.length;
            }
            rate = rate.substring(0,k+3);
            //console.log(rate);
            optioninfo[i].rate = rate;
            // console.log(optioninfo[i].rate);
          };



          that.setData({
            votemain: rep.data[0][0],
            optioninfo: optioninfo,
            userinfo: rep.data[2],
          })

          wx.hideLoading();
          wx.showToast({
            title: '投票成功!',
          })
        },fail:function(){
          wx.hideLoading();
          wx.showToast({
            title: '错误!',
          })
        }
      })
  },
  onLoad: function(e){
    var admin = e.admin;
    console.log(admin);
    if (admin || app.globalData.userid == 54 || app.globalData.userid == 43 ){
      this.setData({
        admin:true,
        userid: app.globalData.userid
      })
    }

    var that = this;
      wx.showLoading({
        title: '加载中...',
      })
      var  id = e.id;
      console.log(id);
       //获取投票信息
       wx.request({
         url: app.globalData.host +"/wx_graduation_voteforyou/",
         data:{"scene":"get_vote_detail","id":id},
         success:function(rep){
           console.log(rep.data);
          
          //处理optioninfo process组件
           var optioninfo = rep.data[1];
           //计算总投票选择次数_面对多选投票人数不起作用
           var count = 0;
           for(let i = 0;i<optioninfo.length;i++){
            
             count = count + parseInt(optioninfo[i].sum);
           };
          
           for (let i = 0; i < optioninfo.length; i++) {
             let rate = (optioninfo[i].sum / count * 100) + "";
             let k = rate.indexOf(".");
             if(k == -1){
               k = rate.length;
             }
             rate = rate.substring(0, k + 3);
            // console.log(rate);
             optioninfo[i].rate = rate;
            // console.log(optioninfo[i].rate);
           };


           that.setData({
             votemain:rep.data[0][0],
             optioninfo: optioninfo,
             userinfo:rep.data[2],
           })
           wx.hideLoading();
         },
         fail:function(e){
           wx.hideLoading();
         }
       })
    },
   onShareAppMessage: function (res) {
    if (res.from === 'button') {
      // 来自页面内转发按钮
      console.log(res.target)
    }
    return {
      title: '投票：' + this.data.votemain.title,
      path: '/pages/detail/detail?id='+this.data.votemain.id,
      success: function (res) {
        // 转发成功
      },
      fail: function (res) {
        // 转发失败
      }
    }
  }
})
