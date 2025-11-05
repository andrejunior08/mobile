<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
  <title>WhatsApp Acessível</title>
  <style>
    * {
      box-sizing: border-box;
    }
    body {
      font-family: 'Segoe UI', Roboto, sans-serif;
      background-color: #e5ddd5;
      margin: 0;
      display: flex;
      flex-direction: column;
      height: 100vh;
      max-width: 480px;
      margin-left: auto;
      margin-right: auto;
      border: 1px solid #ccc;
      border-radius: 20px;
      overflow: hidden;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    }
    header {
      background-color: #075e54;
      color: white;
      padding: 1rem;
      text-align: center;
      font-size: 1.3rem;
      font-weight: bold;
    }
    .container {
      flex: 1;
      display: flex;
      flex-direction: row;
      height: 100%;
    }
    .contacts {
      width: 40%;
      overflow-y: auto;
      background-color: #fff;
      display: flex;
      flex-direction: column;
      border-right: 1px solid #ccc;
    }
    .contact {
      display: flex;
      align-items: center;
      padding: 12px;
      border-bottom: 1px solid #eee;
      cursor: pointer;
      transition: background 0.2s;
    }
    .contact:hover {
      background-color: #f9f9f9;
    }
    .contact img {
      width: 45px;
      height: 45px;
      border-radius: 50%;
      margin-right: 12px;
    }
    .contact span {
      font-size: 1.1rem;
    }
    .chat-section {
      width: 60%;
      display: flex;
      flex-direction: column;
      background: url('https://i.imgur.com/0ZfS8D5.png') repeat;
      background-size: cover;
    }
    main {
      flex: 1;
      display: flex;
      flex-direction: column;
      overflow-y: auto;
      padding: 1rem;
    }
    .message {
      max-width: 75%;
      margin-bottom: 12px;
      padding: 12px 14px;
      border-radius: 18px;
      font-size: 1rem;
      line-height: 1.4;
      word-wrap: break-word;
      display: inline-block;
    }
    .sent {
      background-color: #dcf8c6;
      align-self: flex-end;
      border-bottom-right-radius: 3px;
    }
    .received {
      background-color: #ffffff;
      align-self: flex-start;
      border-bottom-left-radius: 3px;
    }
    .chat-box {
      display: flex;
      align-items: center;
      gap: 10px;
      padding: 10px;
      background-color: #f0f0f0;
      border-top: 1px solid #ccc;
    }
    input[type="text"] {
      flex: 1;
      padding: 12px 15px;
      border-radius: 25px;
      border: 1px solid #ccc;
      font-size: 1rem;
      background-color: #fff;
    }
    button {
      background-color: #25d366;
      color: white;
      border: none;
      border-radius: 50%;
      width: 50px;
      height: 50px;
      font-size: 1.5rem;
      cursor: pointer;
      display: flex;
      align-items: center;
      justify-content: center;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
      transition: transform 0.2s;
    }
    button:hover {
      transform: scale(1.05);
    }
    button:focus, input:focus {
      outline: 3px solid #34b7f1;
    }
    @media (max-width: 700px) {
      .container {
        flex-direction: column;
      }
      .contacts {
        width: 100%;
        height: 40%;
        border-right: none;
        border-bottom: 1px solid #ccc;
      }
      .chat-section {
        width: 100%;
        height: 60%;
      }
    }
  </style>
</head>
<body>
  <header aria-label="Cabeçalho">WhatsApp Acessível</header>
  <div class="container">
    <!-- Caixa de contatos -->
    <section id="contacts" class="contacts" aria-label="Lista de contatos">
      <div class="contact">
        <img src="https://i.pravatar.cc/45?img=5" alt="Foto de perfil de Maria">
        <span>Maria</span>
      </div>
      <div class="contact">
        <img src="https://i.pravatar.cc/45?img=12" alt="Foto de perfil de João">
        <span>João</span>
      </div>
      <div class="contact">
        <img src="https://i.pravatar.cc/45?img=8" alt="Foto de perfil de Lucas">
        <span>Lucas</span>
      </div>
    </section>

    <!-- Caixa de chat -->
    <section class="chat-section">
      <main id="chat" aria-live="polite" aria-label="Mensagens do chat">
        <div class="message received">Olá! Tudo bem?</div>
        <div class="message sent">Oi! Tudo ótimo e você?</div>
      </main>

      <!-- Caixa de envio de mensagens -->
      <form class="chat-box" onsubmit="sendMessage(event)" aria-label="Caixa de envio de mensagem">
        <input id="msg" type="text" placeholder="Digite uma mensagem" aria-required="true" />
        <button type="submit" aria-label="Enviar mensagem">></button>
      </form>
    </section>
  </div>

  <script>
    function sendMessage(event) {
      event.preventDefault();
      const input = document.getElementById('msg');
      const text = input.value.trim();
      if (!text) return;

      const chat = document.getElementById('chat');
      const message = document.createElement('div');
      message.className = 'message sent';
      message.textContent = text;
      chat.appendChild(message);

      chat.scrollTop = chat.scrollHeight;
      input.value = '';
      input.focus();
    }
  </script>
</body>
</html>