import { isOdd } from "@monorepo/shared/src/utils";

describe("Does jest find me?", () => {
  it("yes", () => {
    expect(isOdd(3)).toBe(true);
  });
});
