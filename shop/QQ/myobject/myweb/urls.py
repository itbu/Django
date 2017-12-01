
from django.conf.urls import url
from . import views,viewsusers,viewsorders

urlpatterns = [


    #===========商品展示==================
    url(r'^$',views.index, name='index'), #网站首页
    url(r'^list$',views.list, name='list'), #商品列表页
    url(r'^detail/(?P<gid>[0-9]+)$',views.detail, name='detail'), #商品详情


     #===========会员模块==================
     
    # 登录
    url(r'^login$', viewsusers.login, name="login"),  #  登陆页
    url(r'^dologin$', viewsusers.dologin, name="dologin"),
    url(r'^logout$', viewsusers.logout, name="logout"),
    url(r'^verify$', viewsusers.verify, name="verify"), #验证码


    # 注册
    url(r'^register$', viewsusers.register,name='register'), 
    url(r'^registeradd$', viewsusers.registeradd,name='registeradd'), 
    url(r'^registerinsert$', viewsusers.registerinsert,name='registerinsert'), 

     
    #===========购物车模块================


    #购物车路由
    url(r'^shopcart$', viewsorders.shopcart,name='shopcart'), #  购物车页
    url(r'^shopcartadd/(?P<gid>[0-9]+)$', viewsorders.shopcartadd,name='shopcartadd'), #  添加购物车
    url(r'^shopcartdel/(?P<gid>[0-9]+)$', viewsorders.shopcartdel,name='shopcartdel'), #  删除购物车中一件
    url(r'^shopcartclear$', viewsorders.shopcartclear,name='shopcartclear'), #  清空购物车
    url(r'^shopcartchange$', viewsorders.shopcartchange,name='shopcartchange'), #  更改购物车商品数量
     

     #===========订单模块==================


    #订单详情页
    url(r'^ordersform$', viewsorders.ordersform,name='ordersform'), #浏览订单
    url(r'^ordersconfirm$', viewsorders.ordersconfirm,name='ordersconfirm'), #订单确认
    url(r'^ordersinsert$', viewsorders.ordersinsert,name='ordersinsert'), #执行订单添加
    # 订单信息
    url(r'^order$', viewsorders.order,name='order'), 
    url(r'^orderstatus$', viewsorders.orderstatus,name='orderstatus'), 

  

]
