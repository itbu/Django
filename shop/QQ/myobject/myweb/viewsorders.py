from django.shortcuts import render
from django.http import HttpResponse

from django.shortcuts import redirect
from django.core.urlresolvers import reverse

from myweb.models import Types,Goods,Orders,Detail

import time


# ------公共加载函数--------

def loadinfo():
    context={}
    context['type0list'] = Types.objects.filter(pid=0)
    return context

# =================购物车详情页==============

# 购物车页
def shopcart(request):
    context = loadinfo()
    if 'shoplist' not in request.session:
        request.session['shoplist']={}
    return render(request,"myweb/shop/shopcart.html",context)

# 添加
def shopcartadd(request,gid):
    #获取要添加的购物车信息
    goods = Goods.objects.get(id=gid)
    shop = goods.toDict();
    shop['m'] = int(request.POST['m'])

    
    #获取原购物车中的信息
    if 'shoplist' in request.session:
        shoplist = request.session['shoplist']
    else:
        shoplist = {}
    #判断并放置到session中
    if gid in shoplist:
        shoplist[gid]['m'] += shop['m'] #若购物车中已包含要购买的商品，就将购买量加，
    else:
        shoplist[gid] = shop  # 若不存在则将当前商品直接放入购物车shoplist中

    #将购物车信息shoplist放入到session中
    request.session['shoplist'] = shoplist
    return redirect(reverse('shopcart'))


# 删除
def shopcartdel(request,gid):
    #获取购物车中的商品
    shoplist = request.session['shoplist']
    #删除对应的商品
    del shoplist[gid]
    #放回购物车到session中
    request.session['shoplist']=shoplist
    
    return redirect(reverse('shopcart'))


# 清空
def shopcartclear(request):
    context = loadinfo()
    request.session['shoplist'] = {}
    return render(request,"myweb/shop/shopcart.html",context)

    
# 改变
def shopcartchange(request):
    context = loadinfo()
    shoplist = request.session['shoplist']
    #获取信息
    shopid = request.GET['gid']
    num = int(request.GET['num'])
    if num < 1:
        num = 1
    shoplist[shopid]['m'] = num  #更改商品数量
    request.session['shoplist'] = shoplist
    return render(request,"myweb/shop/shopcart.html",context)



#=============订单页面======================

# 生成订单
def ordersform(request):
    #获取药结账的商品id信息
    ids = request.GET.get('gids','')
    if ids == '':
        return HttpResponse("请选择要结账的商品")
    gids = ids.split(',')
    #获取购物车中的商品信息
    shoplist = request.session['shoplist']
    #封装要结帐的商品信息,以及累计总额
    orderlist = {}
    total = 0
    for sid in gids:
        orderlist[sid] = shoplist[sid]
        total += shoplist[sid]['price']*shoplist[sid]['m']  #累计总金额
    request.session['orderlist'] = orderlist
    request.session['total'] = total
    return render(request,"myweb/shop/ordersform.html")


#订单确认
def ordersconfirm(request):
    request.session['linkman'] = request.POST['linkman']
    request.session['address'] = request.POST['address']
    request.session['code'] = request.POST['code']
    request.session['phone'] = request.POST['phone']
    return render(request,"myweb/shop/ordersconfirm.html")


#执行订单添加
def ordersinsert(request):
    #封装订单信息,并执行添加
    orders = Orders()
    orders.uid = request.session['vipuser']['id']
    orders.linkman = request.POST.get('linkman')
    orders.address = request.POST['address']
    orders.code = request.POST['code']
    orders.phone = request.POST['phone']
    orders.addtime = time.time()
    orders.total = request.session['total']
    orders.status = 0
    orders.save()
    #获取订单详情
    orderlist = request.session['orderlist']
    shoplist = request.session['shoplist']
    #便利购物信息,并添加订单详情信息
    for shop in orderlist.values():
        del shoplist[str(shop['id'])]
        detail = Detail()
        detail.orderid = orders.id
        detail.goodsid = shop['id']
        detail.name = shop['goods']
        detail.price = shop['price']
        detail.num = shop['m']
        detail.save()

    del request.session['orderlist']
    del request.session['total']
    request.session['shoplist'] = shoplist
    del request.session['shoplist']
    context = {'info':'订单成功: 订单id号:'+str(orders.id)}
    # return HttpResponse("订单成功:订单id号: "+str(orders.id))
    return render(request,"myweb/shop/info.html",context)

# 订单信息
def order(request):
    context=loadinfo()
    # 获取登录者,所有订单
    orders=Orders.objects.filter(uid=request.session['vipuser']['id'])
    # 遍历订单详情
    for order in orders:
        dlist=Detail.objects.filter(orderid=order.id)
        order.detaillist=dlist
        for detail in dlist:
            goods = Goods.objects.get(id=detail.goodsid)
            detail.picname =goods.picname
    context['orders']=orders
    return render(request,"myweb/shop/order.html",context)


# 订单状态
def orderstatus(request):
    ody = Orders.objects.get(id = request.GET.get('cd'))
    # print(ody.status)
    if ody.status==0:
        ody.status = 3
    if ody.status==1:
        oty.status = 2  
    ody.save()
    return redirect(reverse('order'))





