import "bootstrap";

const flatpickr = require("flatpickr");


const input = document.getElementById('flatp')

const dates = JSON.parse(input.dataset.disabledDates)

const disabledates = []
dates.forEach((array) => {
  disabledates.push({
    from: array[0],
    to: array[1]
  })
})

const fp = flatpickr(input, {
  dateFormat: "Y-m-d",
  minDate: new Date,
  mode: 'range',
  disable: disabledates
});

console.log(fp)
