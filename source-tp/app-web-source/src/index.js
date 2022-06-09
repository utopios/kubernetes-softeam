const express = require('express')

const app = express()

app.get('/', (req, res) => {

    res.end("Hello from api")
})

app.get('/testHealty', (req, res) => {

    res.end("it's healty")
})

app.listen(80, () => {

})