const mongoose = require('mongoose');

const reviewsSchema = new mongoose.Schema({
  id: Number, // primary key
  product_id: Number,
  rating: Number,
  recommended: Boolean, // default false
  reported: Boolean, // default false
  response: String,
  body: String,
  date: Date,
  name: String,
  helpfulness: Number, // default 0
});
const Review = mongoose.model('reviews', reviewsSchema);

const photosSchema = new mongoose.Schema({
  id: Number, // primary key
  review_id: Number, // foreign key
  url: String
})
const Photo = mongoose.model('photos', photosSchema); 

const characteristicsSchema = new mongoose.Schema({
  id: Number, // primary key
  name:  String,
})
const Characteristic = mongoose.model('characteristics', characteristicsSchema); 

const reviewCharacteristicsSchema = new mongoose.Schema({
  id: Number, // primary key
  review_id: Number, // foreign key
  characteristic_id: Number, // foreign key
  rating: Number,
})
const ReviewCharacteristics = mongoose.model('review_characteristics', reviewCharacteristicsSchema);

module.exports.Review  = Review;
module.exports.Photo = Photo;
module.exports.Characteristic = Characteristic;
module.exports.ReviewCharacteristics = ReviewCharacteristics;
