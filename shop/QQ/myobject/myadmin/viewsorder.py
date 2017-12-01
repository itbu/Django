from django.shortcuts import render

from myweb.models import Types,Goods,Orders,Detail,Users

#===================订单管理===========================================


# 浏览订单
def ordersindex(request):
    ob = Orders.objects.all()
    # for ov in ob:
    #     ty=Users.objects.get(id=ov.uid)
    #     ov.ordername=ty.username
    context={'orders':ob}
    return render(request,"myadmin/orders/index.html",context)


#订单详情页面
def ordersedit(request,gid):
    ob = Detail.objects.filter(orderid=gid)
    context={'Detail':ob}
    return render(request,"myadmin/orders/edit.html",context)

# 修改订单状态
def amendedicts(request,oid):
    ob=Orders.objects.get(id=oid)
    print(ob.status)
    print('================')
    context={'status':ob}
    return render(request,'myadmin/orders/amend.html',context)

#执行订单编辑
def amendinserts(request,oid):
    ob=Orders.objects.get(id=oid)
    ob.status=request.POST['status']
    ob.save()
    context={'info':'状态修改成功!'}
    return render(request,'myadmin/info.html',context)
