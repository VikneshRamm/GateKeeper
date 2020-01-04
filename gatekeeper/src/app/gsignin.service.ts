import { Injectable, NgZone } from "@angular/core";
import { Subject } from "rxjs";
import { HttpClient } from "@angular/common/http";
import { Router } from "@angular/router";
declare const gapi: any;

@Injectable({
  providedIn: "root"
})
export class GsigninService {
  constructor(
    private http: HttpClient,
    private router: Router,
    private ngZone: NgZone
  ) {}
  private auth2: any;
  private name: string;
  private email: string;
  private imgURL: string;
  private idToken: string;
  public signInListener = new Subject<boolean>();
  private isSignedIn: boolean;
  private googleUser: any;

  private saveUserInfo() {
    const userInfo = this.getUserInfo();
    localStorage.setItem("getKeeperAppInfo", JSON.stringify(userInfo));
  }

  private getUserInfoFromStorage() {
    const userInfo = JSON.parse(localStorage.getItem("getKeeperAppInfo"));
    return userInfo;
  }

  private clearUserInfo() {
    localStorage.removeItem("getKeeperAppInfo");
  }

  public getUserInfo() {
    const userInfo = { name: "", imgURL: "", email: "", token: "" };
    userInfo.name = this.name;
    userInfo.imgURL = this.imgURL;
    userInfo.email = this.email;
    userInfo.token = this.idToken;
    return userInfo;
  }

  public googleInit() {
    gapi.load("auth2", () => {
      this.auth2 = gapi.auth2.init({
        // the client ID is obtained form console.google.com when creating a project for Google Signin
        client_id:
          "819801723091-c220n12ttnnvbrdojs2m281svp52flfq.apps.googleusercontent.com",
        cookiepolicy: "single_host_origin",
        scope: "profile email"
      });
      const button = document.getElementById("g-signin-button");
      if (button) {
        this.attachSignin(button);
      }
    });
  }

  public attachSignin(element) {
    this.auth2.attachClickHandler(
      element,
      {},
      googleUser => {
        console.log(googleUser);
        const profile = googleUser.getBasicProfile();
        this.googleUser = googleUser;
        this.idToken = googleUser.getAuthResponse().id_token;
        this.name = profile.getName();
        this.imgURL = profile.getImageUrl();
        this.email = profile.getEmail();
        this.saveUserInfo();
        this.isSignedIn = true;
        // ngZone is required because the below piece of code do not execute under angular scope
        // using ngZone makes it run under Angular's scope.
        this.ngZone.run(() => {
          this.signInListener.next(this.isSignedIn);
          this.router.navigateByUrl("/dashboard");
        });
      },
      error => {
        console.log(JSON.stringify(error, undefined, 2));
      }
    );
  }

  public checkIfUserSignedIn() {
    const userInfo = this.getUserInfoFromStorage();
    if (!userInfo || !userInfo.token) {
      this.isSignedIn = false;
      this.signInListener.next(this.isSignedIn);
      // this.googleInit();
    } else {
      const token = userInfo.token;
      this.http
        .get("https://oauth2.googleapis.com/tokeninfo?id_token=" + token)
        .subscribe(
          (successResponse: any) => {
            console.log(successResponse);
            this.isSignedIn = true;
            this.imgURL = successResponse.picture;
            this.name = successResponse.name;
            this.email = successResponse.email;
            this.idToken = userInfo.token;
            this.signInListener.next(this.isSignedIn);
            this.router.navigateByUrl("/dashboard");
          },
          failureResponse => {
            console.log(failureResponse);
            this.isSignedIn = false;
            this.signInListener.next(this.isSignedIn);
            this.clearUserInfo();
            this.router.navigateByUrl("/");
          }
        );
    }
  }

  public logOutUser() {
    // this.googleUser.disconnect();
    this.clearUserInfo();
    this.isSignedIn = false;
    this.signInListener.next(this.isSignedIn);
    this.router.navigateByUrl("/");
  }

  public isUserSignedIn() {
    return this.isSignedIn;
  }
}
