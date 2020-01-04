import { TestBed } from "@angular/core/testing";

import { GsigninService } from "./gsignin.service";

describe("GsigninService", () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it("should be created", () => {
    const service: GsigninService = TestBed.get(GsigninService);
    expect(service).toBeTruthy();
  });
});
