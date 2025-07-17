

const express = require('express');
const app = express();
const PORT = 5000;


app.use(express.static('public'));

app.get('/', (req, res) => {
  res.send(`
    <!DOCTYPE html>
    <html lang="en">
    <head>
      <meta charset="UTF-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>Welcome to Terraform</title>
      <style>
        body {
          margin: 0;
          padding: 0;
          background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
          font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
          color: #fff;
          display: flex;
          flex-direction: column;
          align-items: center;
          justify-content: center;
          height: 100vh;
          overflow: hidden;
        }

        h1 {
          font-size: 3rem;
          animation: fadeIn 2s ease-out forwards;
          margin-bottom: 1rem;
        }

        p {
          font-size: 1.2rem;
          max-width: 600px;
          text-align: center;
          animation: fadeIn 3s ease-out forwards;
          opacity: 0;
        }

        @keyframes fadeIn {
          0% {
            opacity: 0;
            transform: translateY(30px);
          }
          100% {
            opacity: 1;
            transform: translateY(0);
          }
        }

        .pulse {
          animation: pulse 2s infinite;
        }

        @keyframes pulse {
          0% {
            transform: scale(1);
          }
          50% {
            transform: scale(1.05);
          }
          100% {
            transform: scale(1);
          }
        }
      </style>
    </head>
    <body>
      <h1 class="pulse">Welcome to Terraform</h1>
      <p>
        This is a simple animated Node.js web app powered by Express.<br>
        Terraform helps you build, change, and version infrastructure safely and efficiently.
      </p>
    </body>
    </html>
  `);
});


