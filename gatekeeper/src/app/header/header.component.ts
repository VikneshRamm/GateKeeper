import { Component, OnInit, HostListener, ElementRef } from '@angular/core';
import { GsigninService } from '../gsignin.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css'],
})
export class HeaderComponent implements OnInit {

  constructor(public gSignInService: GsigninService, private eRef: ElementRef,
              private router: Router) { }

  name: string;
  imgURL: string;
  isSignedin: boolean;
  showLogOutButton: boolean = false;

  @HostListener('document:click', ['$event'])
  clickout(event) {
    if (event.target.className === 'header-user-img') {
      this.toggleLogOutButton();
    } else {
      this.showLogOutButton = false;
    }
  }

  ngOnInit() {
    this.gSignInService.signInListener.subscribe((value) => {
      this.isSignedin = value;
      if (this.isSignedin) {
        console.log(this);
        const userInfo = this.gSignInService.getUserInfo();
        this.imgURL = userInfo.imgURL;
        this.name = userInfo.name;
      } else {
        this.name = '';
        this.imgURL = '';
        this.showLogOutButton = false;
      }
    });
  }

  toggleLogOutButton() {
    this.showLogOutButton = !this.showLogOutButton;
  }

  hideLogOutButton() {
    this.showLogOutButton = false;
  }

  logOut() {
    this.gSignInService.logOutUser();
  }

  // signInChanged(value: boolean) {
  //   console.log("SIgn In changed", value);
  //   this.isSignedin = value;
  // }

  routeToHomePage() {
    this.router.navigateByUrl('/');
  }

}
