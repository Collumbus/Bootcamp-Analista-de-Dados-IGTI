# importando libs da api do twitter
from tweepy import OAuthHandler
from tweepy import Stream
from tweepy.streaming import StreamListener

# importando chaves de acesso da api do twitter
from credentials import *

import socket
import json

class TweetListener(StreamListener):
    # construtor
    def __init__(self, csocket):
        self.client_socket = csocket
        self.count = 0
        self.limit = 30
    
    def on_data(self, data):
        try:
            # lê os tweets
            msg = json.loads(data)
            self.count += 1
            if self.count <= self.limit:
                # retorna a quantidade de tweets lidos
                print(msg['text'].encode('utf-8'))
                # envia a mensagem para o socket
                self.client_socket.send(msg['text'].encode('utf-8'))
            return True
        except BaseException as e:
            print(f'Error on_data: {str(e)}')
        return True

    def on_error(self, status):
        print(status)
        return True

# define como os dados deven ser eniviados
def sendData(c_socket):
    auth = OAuthHandler(consumer_key, consumer_secret)
    auth.set_access_token(access_token, access_token_secret)
    
    # define o tipo de conexão
    twitter_stream = Stream(auth, TweetListener(c_socket))
    # define filtro de busca a ser utilizado
    twitter_stream.filter(track=['Covid'])

if __name__ == "__main__":
    # Cria ojeto socket (protocolo IPV6, TCP)
    s= socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    host = '127.0.0.1'
    port = 9995
    s.bind((host, port))

    print(f'Listening on port: {str(port)}')

    # aguarda a conexão
    s.listen(5)
    # estabelece a conexão
    c, addr = s.accept()

    print(f'Received request from: {str(addr)}')

    sendData(c)