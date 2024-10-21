import { isOdd } from "..";

it("returns true for odd numbers", () => {
  expect(isOdd(3)).toBe(true);
  expect(isOdd(5)).toBe(true);
  expect(isOdd(-15)).toBe(true);
  expect(isOdd(222222222222229)).toBe(true);
});

it("returns false for even numbers", () => {
  expect(isOdd(2)).toBe(false);
  expect(isOdd(12345678)).toBe(false);
  expect(isOdd(-100)).toBe(false);
});

it("throws for non-integers", () => {
  expect(() => isOdd(1.5)).toThrow("Value is not an integer");
  expect(() => isOdd(-10.9999)).toThrow("Value is not an integer");
  expect(() => isOdd(123.00000001)).toThrow("Value is not an integer");
});
