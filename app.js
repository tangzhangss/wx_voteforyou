//app.js
App({
  globalData:{
    userinfo:null,
    userid:null,
    host:"https://www.iamguao.work",
  },
  //用户登录
  userLogin: function (userinfo) {
    wx.showLoading({
      title: '登陆中...',
    })
    //处理userinfo中的表情
    userinfo.nickName = this.fliteremoji(userinfo.nickName);
    //全局变量
    this.globalData.userInfo = userinfo;
    var that = this;
    //登录注册_没有用户的id
    wx.login({
      success: function (res) {
        if (res.code) {
          //发起网络请求
          wx.request({
            url: that.globalData.host + "/wx_graduation_voteforyou/",
            data: {
              "scene": "vote_login",
              'code': res.code,
              "userinfo": that.globalData.userInfo
            },
            success: function (e) {
              //返回userid 用户评论
              that.globalData.userid = e.data;
              wx.hideLoading();
            }
            , fail: function () {
              wx.hideLoading();

              wx.showToast({
                title: '登陆失败!',
                duration: 2000,
              })
            }
          });
        } else {


          wx.hideLoading();

          wx.showToast({
            title: '登陆失败!',
            duration: 2000,
          })
        }

      },
      fail: function () {
        wx.hideLoading();
      }
    });
  },
    //process 处理时间
    processTime:function(e){
      var time = new Date(e).toLocaleString().replace(/:\d{1,2}$/," ");
      time = time.replace(/^\d{4}\//," ");
      time = time.replace(/\//,"-");
     // console.log(time);
      return time;
    },

    fliteremoji:function(str){
      str = str.replace(/\uD83C[\uDF00-\uDFFF]|\uD83D[\uDC00-\uDE4F]/g, "");

      return str;
    }
})