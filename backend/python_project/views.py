from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.decorators import api_view
from .database import pokedex

# Create your views here.
# request handler


def myapp(request):
    return render(request, "main.html", {
        "name": "Flutter Mapp"
    })

@api_view(['GET','POST'])

def getData(request):
    data = pokedex
    return Response(data)

