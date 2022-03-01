# Bem-Vindo Ao My Comics App
  Este é uma aplicação de listagem de quadrinhos. Para esta listagem foi utilizado a api da marvel: https://developer.marvel.com </br>
  </br>
  A partir de agora irei exeplicar como fazer o projeto funcionar na sua maquina! Ah lembrando que você pode instalar o projeto diretamente em: https://1drv.ms/u/s!AkOyhsYllUs6hQztuYw_xLxtl2O6?e=799sgS
  </br></br>
  
# Requistos necessários para subir a aplicação no seu ambiente.
   Pra que a tudo ocorra bem será necesário ter o flutter na versão 2.0(null safety) para cima. Para chekar a versão do fltuter instatalada atualmente em seu desktop e só digitar o segunte comando:
   <code>flutter doctor</code>.
   
   E é isso, tendo o flutter na versão que recaba suporte ao null safety o seu ambiente está pronto para subir a aplicação.
   
   
# My Commics App
   Ao subir a aplicação ou instalar em seu device, você será redirecionado para tela de identificação do usuário que segue a baixo.

![Screenshot_2022-03-01-18-56-08-591_com example my_comics 1](https://user-images.githubusercontent.com/62258859/156264924-31c1298c-a4d1-4acd-a483-bcb64203238f.png)


É so digitar seu nome que você já ira ser redirecionado para home automaticamente. A vou te avisar de uma coisa após identificado pela primeira vez não será preciso se identificar de novo.

# Home Screen
  Agora vou te apresentar a tela de home da aplicação. apos feita a identificação é pra cá que você ira vir. E já te mostrada todos os comics disponiveis na atualiade. Para realizar essa listagem 
  foi utilizado o pacote http de requisições e o pacote cachded network image para não ocorrer travamentos na hora de renderizar as imagens que são me passadas via API.
  
  Segue a Imagem da tela de home:
![Screenshot_2022-03-01-19-03-19-386_com example my_comics 1](https://user-images.githubusercontent.com/62258859/156265788-6216243a-cdeb-4f87-8ea3-94643d5a6359.png)

Para acessar as informações de cada comics de forma mais detalhadas basta clicar sobre o poster que você irá ser redirecionado para tela de detalhes do comics


# Details Screen
  Chegamos a partde de detalhamento das comics. as informações são passadas para um outra tela atravas das navegações para que não precise realizar uma nova requisição no servidor
  para trazer as informações que já temos ao requisitar do serviço todos os comics disponiveis.
  
  Segue a tela de Detalhes:
    ![Screenshot_2022-03-01-19-03-24-445_com example my_comics 1](https://user-images.githubusercontent.com/62258859/156266158-5fd6cc2c-0335-4173-86ad-26809829d083.png)
  
  Ao clilcar em adiconar ao carrinho as informações necessárias como imagens, title e preço e id do comics serão salvos no banco local para que se renderize no carrinho de compras.
  
  
 # Cart Screen
  Após ter adicioando qualquer quadrinho eu seu carrinho e acessar o seu carrinho que fica no canto superior direito e com um contador que sera contado a quanridade de produtos no banco da aplicação.
  
![Screenshot_2022-03-01-19-03-29-461_com example my_comics 1](https://user-images.githubusercontent.com/62258859/156267248-7f63d4c5-ced0-4495-9ba8-a426dc616cb3.png)

Nessa mesma tela será possivel a exclusão de qualquer um dos quandrinhos, apos realizar essa informação será removida do banco da aplicação. 
Os valores dos comics são somados e subtraidos de acordo com o que é inserido ou removido.


# Observações

  Toda a aplicação foi desenvolvida utilizando o framkework Flutter com Modularização e Injeção de Depência própia do Modular.
  Já o gerenciamento de estado da aplicação foi optativo a utilização do mobX por mais segurança na hora do desenvolvimento. 
  

