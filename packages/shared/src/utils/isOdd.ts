export default function isOdd(x: number) {
  const absX = Math.abs(x);
  if (absX % 1 !== 0) {
    throw new Error("Value is not an integer");
  }
  return absX % 2 === 1;
}
