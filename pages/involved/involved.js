
var sliderWidth = 100; // 需要设置slider的宽度，用于计算中间位置
const app = getApp();
Page({
    data: {
        userid:null,//用户id
        tabs: ["我发起的", "我参与的"],
        activeIndex: 0,
        sliderOffset: 0,
        votelist:"",
        sliderLeft: 0,
        icon60: 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHgAAAB4CAMAAAAOusbgAAAAeFBMVEUAwAD///+U5ZTc9twOww7G8MYwzDCH4YcfyR9x23Hw+/DY9dhm2WZG0kbT9NP0/PTL8sux7LFe115T1VM+zz7i+OIXxhes6qxr2mvA8MCe6J6M4oz6/frr+us5zjn2/fa67rqB4IF13XWn6ad83nxa1loqyirn+eccHxx4AAAC/klEQVRo3u2W2ZKiQBBF8wpCNSCyLwri7v//4bRIFVXoTBBB+DAReV5sG6lTXDITiGEYhmEYhmEYhmEYhmEY5v9i5fsZGRx9PyGDne8f6K9cfd+mKXe1yNG/0CcqYE86AkBMBh66f20deBc7wA/1WFiTwvSEpBMA2JJOBsSLxe/4QEEaJRrASP8EVF8Q74GbmevKg0saa0B8QbwBdjRyADYxIhqxAZ++IKYtciPXLQVG+imw+oo4Bu56rjEJ4GYsvPmKOAB+xlz7L5aevqUXuePWVhvWJ4eWiwUQ67mK51qPj4dFDMlRLBZTqF3SDvmr4BwtkECu5gHWPkmDfQh02WLxXuvbvC8ku8F57GsI5e0CmUwLz1kq3kD17R1In5816rGvQ5VMk5FEtIiWislTffuDpl/k/PzscdQsv8r9qWq4LRWX6tQYtTxvI3XyrwdyQxChXioOngH3dLgOFjk0all56XRi/wDFQrGQU3Os5t0wJu1GNtNKHdPqYaGYQuRDfbfDf26AGLYSyGS3ZAK4S8XuoAlxGSdYMKwqZKM9XJMtyqXi7HX/CiAZS6d8bSVUz5J36mEMFDTlAFQzxOT1dzLRljjB6+++ejFqka+mXIe6F59mw22OuOw1F4T6lg/9VjL1rLDoI9Xzl1MSYDNHnPQnt3D1EE7PrXjye/3pVpr1Z45hMUdcACc5NVQI0bOdS1WA0wuz73e7/5TNqBPhQXPEFGJNV2zNqWI7QKBd2Gn6AiBko02zuAOXeWIXjV0jNqdKegaE/kJQ6Bfs4aju04lMLkA2T5wBSYPKDGF3RKhFYEa6A1L1LG2yacmsaZ6YPOSAMKNsO+N5dNTfkc5Aqe26uxHpx7ZirvgCwJpWq/lmX1hA7LyabQ34tt5RiJKXSwQ+0KU0V5xg+hZrd4Bn1n4EID+WkQdgLfRNtvil9SPfwy+WQ7PFBWQz6dGWZBLkeJFXZGCfLUjCgGgqXo5TuSu3cugdcTv/HjqnBTEMwzAMwzAMwzAMwzAMw/zf/AFbXiOA6frlMAAAAABJRU5ErkJggg=='
    },
    //用户登录
    userLogin: function (e) {
      //如果用户拒绝的话 就提示
      if (e.detail.userInfo == null) {

        wx.showModal({
          title: '提示',
          content: '授权失败，不可执行此操作!',
        })
        return;
      }
      var that = this;

      //如果是第一次授权则进行登录，不然就不进行登录操作--可能造成数据更新问题，但是不影响
      if (app.globalData.userid == null) {
        var userinfo = e.detail.userInfo;
        app.userLogin(userinfo);
        //console.log(userinfo);
        setTimeout(()=>{
          that.setData({
            userid:app.globalData.userid,
          });
        }, 2000);
      }

    },
    toVoteDetail: function (e) {
      //跳转投票详情页
      var id = e.currentTarget.id;
      //仅仅我参与模块能提前结束投票
      if (this.data.activeIndex==1){
        wx.navigateTo({
          url: '../detail/detail?id=' + id,
        })
      }else{
        wx.navigateTo({
          url: '../detail/detail?admin=true&id=' + id,
        })
      }
    },
    onLoad: function () {
      var that = this;
      this.setData({
        userid: app.globalData.userid,
      })
      //需要授权才能操作
      if (app.globalData.userid == null) {
        return;
      }
      wx.showLoading({
        title: '加载中...',
      })

        var id = app.globalData.userid;
            //获取投票列表
            wx.request({
              url: app.globalData.host + "/wx_graduation_voteforyou/",
              data: { "scene": "get_vote_list_own", "id": id },
              success: function (res) {
                console.log(res.data);
                //处理时间
                var votelist = res.data;

                for (let i = 0; i < votelist.length; i++) {
                  votelist[i].starttime = app.processTime(votelist[i].starttime);
                  votelist[i].endtime = app.processTime(votelist[i].endtime);
                }
                that.setData({
                  votelist: votelist,
                })
                wx.hideLoading();
              }, fail: function () {
                wx.hideLoading();
              }
            })
    },
    tabClick: function (e) {
      //需要授权才能操作
      if (app.globalData.userid == null) {
        wx.showToast({
          title: '请先登录!',
          duration:2000,
        })
        return;
      }
      
      
      wx.showLoading({
        title: '加载中...',
      })
      var that = this;
      var a = e.currentTarget.id;
      var id = app.globalData.userid;
      if(a == 0){
        //获取投票列表_自己发起
        wx.request({
          url: app.globalData.host + "/wx_graduation_voteforyou/",
          data: { "scene": "get_vote_list_own", "id": id },
          success: function (res) {
            console.log(res.data);
            //处理时间
            var votelist = res.data;

            for (let i = 0; i < votelist.length; i++) {
              votelist[i].starttime = app.processTime(votelist[i].starttime);
              votelist[i].endtime = app.processTime(votelist[i].endtime);
            }
            that.setData({
              votelist: votelist,
            })
            wx.hideLoading();
          }, fail: function () {
            wx.hideLoading();
          }
        })
      }else{
        //获取投票列表_自己参与
        wx.request({
          url: app.globalData.host + "/wx_graduation_voteforyou/",
          data: { "scene": "get_vote_list_join", "id": id },
          success: function (res) {
            console.log(res.data);
            //处理时间
            var votelist = res.data;

            for (let i = 0; i < votelist.length; i++) {
              votelist[i].starttime = app.processTime(votelist[i].starttime);
              votelist[i].endtime = app.processTime(votelist[i].endtime);
            }
            that.setData({
              votelist: votelist,
            })
            wx.hideLoading();
          }, fail: function () {
            wx.hideLoading();
          }
        })
      }
      this.setData({
            sliderOffset: e.currentTarget.offsetLeft,
            activeIndex: e.currentTarget.id
        });
    }
});