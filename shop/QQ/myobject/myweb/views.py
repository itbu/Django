from django.shortcuts import render
from django.http import HttpResponse

from myweb.models import Types,Goods

#公共信息加载函数
def loadinfo():
    context={}
    context['type0list'] = Types.objects.filter(pid=0)
    return context

#网站首页
def index(request):
    context = loadinfo()
    alist=Goods.objects.filter()
    if request.GET.get('tid','') !='':
        alist=alist.filter()
    context['goodslist']=alist
    return render(request,"myweb/index.html",context)

#商品列表页
def list(request):
    context = loadinfo()
    list = Goods.objects.filter()
    if request.GET.get('tid','') != '':
        tid = str(request.GET.get('tid',''))
        list = list.filter(typeid__in=Types.objects.only('id').filter(path__contains=','+tid+','))
    context['goodslist'] = list
    return render(request,"myweb/list.html",context)

#商品详情页
def detail(request,gid):
    context = loadinfo()
    ob = Goods.objects.get(id=gid)
    # 累加点击量
    ob.clicknum += 1
    ob.save()
    context['goods'] = ob
    return render(request,"myweb/detail.html",context)
