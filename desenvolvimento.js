const { Client } = require('pg');

const client = new Client({
    host: 'localhost',
    port: 5432,
    user: 'seu_usuario',
    password: 'sua_senha',
    database: 'nome_do_seu_banco_de_dados'
});

client.connect()
    .then(() => console.log('Conectado com sucesso'))
    .catch(e => console.log(e))
    .finally(() => client.end());

