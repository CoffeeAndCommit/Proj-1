from django.shortcuts import render

# Create your views here.
# request handler


def myapp(request):
    return render(request, "main.html")