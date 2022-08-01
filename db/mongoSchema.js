const mongoose = require('mongoose');

const reviewsSchema = new mongoose.Schema({
  id:          { type: Number, unique: true, required: true },
  product_id:  { type: Number, required: true },
  rating:      { type: Number, required: true },
  recommended: { type: Boolean, default: false },
  reported:    { type: Boolean, default: false },
  response:    String,
  body:        { type: String, required: true },
  date:        { type: Date, required: true },
  name:        { type: String, required: true },
  helpfulness: { type: Number, default: 0 },
  photos:      [{ url: String }]
});
const Review = mongoose.model('reviews', reviewsSchema);

const characteristicsSchema = new mongoose.Schema({
  id:             { type: Number, unique: true, required: true },
  characteristic: { type: String, required: true }
})
const Characteristic = mongoose.model('characteristics', characteristicsSchema); 

const reviewCharacteristicsSchema = new mongoose.Schema({
  id:                { type: Number, unique: true, required: true },
  review_id:         { type: Number, required: true }, // foreign key
  characteristic_id: { type: Number, required: true }, // foreign key
  rating:            { type: Number, required: true },
})
const ReviewCharacteristics = mongoose.model('review_characteristics', reviewCharacteristicsSchema);

module.exports.Review  = Review;
module.exports.Characteristic = Characteristic;
module.exports.ReviewCharacteristics = ReviewCharacteristics;
