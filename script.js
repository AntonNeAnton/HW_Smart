const Web3 = require('web3');
const contractAbi = require('./MyContract.json');

const web3 = new Web3('https://mainnet.infura.io/v3/104e323e8bfa4c5aa1de21beba59ef6c');

const contractAddress = '0x643852Adb400B23Acd67Ac14eAdA4939C4228e49';
const myContract = new web3.eth.Contract(contractAbi, contractAddress);

// Вызов метода контракта
myContract.methods.addProduct(1, 'Product1', 100, true).send({ from: '0x71238bE7A7139C729b4758c383FBb8dDa99bD1F0' })
.on('transactionHash', (hash) => {
console.log('Transaction hash:', hash);
})
.on('receipt', (receipt) => {
console.log('Receipt:', receipt);
})
.on('error', (error, receipt) => {
console.error('Error:', error);
});

// Запрос событий по адресу и фильтру
const eventFilter = myContract.events.ProductAdded({ filter: { productId: 1 } });
eventFilter.on('data', (event) => {
console.log('ProductAdded event:', event.returnValues);
})
.on('changed', (event) => {
console.log('Event changed:', event);
})
.on('error', (error, receipt) => {
console.error('Error:', error);
});

// Просмотр слотов хранилища контракта
myContract.methods.products(1).call()
.then((product) => {
console.log('Product with ID 1:', product);
})
.catch((error) => {
console.error('Error:', error);