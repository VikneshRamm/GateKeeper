import {
  CanActivate,
  RouterStateSnapshot,
  ActivatedRouteSnapshot,
  Router
} from "@angular/router";
import { Observable } from "rxjs";
import { Injectable } from "@angular/core";
import { GsigninService } from "./gsignin.service";

@Injectable()
export class AuthGaurd implements CanActivate {
  constructor(private router: Router, private gSignInService: GsigninService) {}
  canActivate(
    route: ActivatedRouteSnapshot,
    state: RouterStateSnapshot
  ): boolean | Observable<boolean> | Promise<boolean> {
    // FIX ME: Not a proper logic
    const isAuth = this.gSignInService.isUserSignedIn();
    if (!isAuth) {
      this.router.navigateByUrl("/");
    }
    return isAuth;
  }
}
