const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const ItemSchema = new Schema({
  name: {
    type: String,
    required: true
  },
  post: {
    type: String,
    required: false
  },
  // email: {
  //   type: String,
  //   default: 'jjj@example.com',
  // },
  date: {
    type: Date,
    default: Date.now
  }
});

module.exports = Item = mongoose.model('item', ItemSchema);
