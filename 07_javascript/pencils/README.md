# Pencil order

Create a program that calculates the total cost of an order of wooden
pencils, including taxes (provincial and federal) and shipping fees ($10
base fee, plus $0.01 per meter, with the option to pay an additional $20
for express delivery). Pencils can be personalized with an engraving, 
in which case the cost of the engraving depends on the length of the
phrase to be engraved ($50 base fee, plus $0.25 per letter, excluding
spaces, multiplied by the number of pencils). An order may also receive
a discount in percentage, which is applied only to the subtotal.

Each task should be assigned to a separate function, and each function
should include a signature and a purpose statement. For instance:

```js
// Number, Number -> Number
// Return the discount for the given rate (0-100) 
// on the given subtotal.
calcDiscount(rate, subtotal) {
    ...
}
```

Make sure also to test each fonction using `console.assert`. A test
should contain an *assertion* (i.e., that the function, given certain
arguments, returns the expected result), as well as a brief message
describing what the assertion is testing for.

```js
console.assert(
    calcDiscount(50, 1000) === 500,
    "50% discount on an integer"
);
```
