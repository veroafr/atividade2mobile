# Organizador de Tarefas

Um aplicativo Flutter simples para gerenciar uma lista de tarefas, ideal para praticar conceitos básicos de Dart e Flutter usando VS Code.

---

## 🎯 Objetivo do Projeto

Crie um aplicativo de lista de tarefas com os seguintes requisitos:

- Uma classe para criar o modelo de **Tarefa** (`Task`), com `title` e `description`.  
- Um array que contenha a lista de objetos do tipo `Task`.  
- A tela inicial deve apresentar a lista de tarefas, criada dinamicamente com `ListView.builder`.  
- Cada item dentro do `ListView` deve ser exibido em um **Widget próprio** (não usar `ListTile`), contendo pelo menos um `IconButton` para excluir a tarefa da lista.  
- Um `FloatingActionButton` que, ao ser acionado, abre um **modal** com `TextField`s para título e descrição, e um botão para adicionar a nova tarefa ao array geral.  
- A tela deve se adaptar dinamicamente ao adicionar ou remover tarefas, mostrando apenas aquelas que de fato permanecem na lista.  
- Se não existirem tarefas (por exemplo, no primeiro carregamento), exibir uma **imagem** que represente o array vazio (pode ser uma imagem pesquisada na internet).  
- Um vídeo do funcionamento do aplicativo está disponível para consulta.  
- **Entrega e apresentação individual** do trabalho.

---

## 📋 Funcionalidades

- 🆕 Adicionar nova tarefa com título e descrição  
- 🗑️ Remover tarefa individual  
- 🖼️ Tela “vazia” com imagem e mensagem quando não há tarefas  
- 📱 Layout responsivo e clean, usando `ListView.builder` e `showModalBottomSheet`

---

## 🛠️ Tecnologias

- Flutter SDK  
- Dart  
- VS Code com extensão Flutter

---

## 🚀 Pré-requisitos

- Flutter instalado (>= 3.0.0)  
- VS Code instalado  
- Extensão Flutter e Dart no VS Code  
- Conexão com a internet (para carregar imagem de placeholder)

---
## 🎬 Vídeo de Demonstração

[![Demonstração do App]](https://youtu.be/3nVM6sIhzoA)

