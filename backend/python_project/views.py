from django.shortcuts import render
from rest_framework.response import Response 
from rest_framework.decorators import api_view
from .database import pokedex
from rest_framework import status


# Create your views here.
# request handler


def myapp(request):
    return render(request, "main.html", {
        "name": "Flutter Mapp"
    })

@api_view(['GET','POST'])

def getData(request):
    if(request.method == 'GET'):
        print(request.data)
        data = pokedex
        return Response(data)
    
    elif(request.method == 'POST'):
        data =request.data
        number = data.get('number')
        
        try:
            parsedNumber = int(number)
            response_data = {
                'pokemon': pokedex[number],
                'status': 'success'
            
            }
            return Response(response_data,
                        status = status.HTTP_200_OK
                        
                            )
        except:
            response_data = {
                'message':'Empty',
                'status':'error'
            }
        return Response(response_data,
                        status = status.HTTP_400_BAD_REQUEST )


