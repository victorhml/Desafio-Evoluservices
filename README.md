# Desafio-Evoluservices

## Desafio técnico iOS - Lista de tarefas

O aplicativo permite a criação de uma lista de tarefas que é salva diretamente na memória do dispositivo, permitindo que os dados persistam sempre que o aplicativo for encerrado.

## Tela inicial

Um exemplo da tela inicial vazia e com dados preenchidos:

<kbd>
  <img src="images/01_empty_main.png" width="200"/>
  <img src="images/02_full_main.png" width="200"/>
</kbd>

Para adicionar uma nova tarefa, o usuário deverá clicar no botão "+" no canto superior direito da tela inicial.

## Nova tarefa

Ao clicar para adicionar uma nova tarefa, o usuário encontrará uma tela com dois campos para preencher, o título e a descrição da tarefa, conforme mostrado abaixo:

<kbd>
  <img src="images/03_add_new_task.png" width="200"/>
</kbd>

Para cancelar a criação de tarefas, basta clicar em "Lista de Tarefas" para voltar para a tela inicial.

Para criar uma nova tarefa, o usuário deverá preencher ambos os campos e clicar em "Salvar" que o usuário será redirecionado para a tela inicial já com a nova tarefa sendo exibida na lista.

Caso um dos campos esteja vazio, irá aparecer um alerta informando o erro, conforme mostrado abaixo:

<kbd>
  <img src="images/04_error_title.png" width="200"/>
  <img src="images/05_error_description.png" width="200"/>
</kbd>

## Editar tarefa

Caso haja tarefas salvas, o usuário pode clicar na tarefa que deseja editar e será redirecionado para a tela de detalhes com os campos de título e descrição para poderem ser editados. Na parte inferior será mostrada a data e horário quando foi criada a tarefa.

Exemplo:

<kbd>
  <img src="images/06_edit_task.png" width="200"/>
</kbd>

Após editar a tarefa, basta clicar em "Salvar" que o usuário será redirecionado para a tela inicial e a tarefa já será exibida com suas devidas alterações.

## Deletar tarefa

Para deletar uma tarefa há dois modos, deslizar a célula com a tarefa da esquerda para a direita completamente ou apenas até aparecer o botão "Deletar" e clicar no mesmo.

Exemplo:

<kbd>
  <img src="images/07_delete_task.png" width="200"/>
</kbd>
