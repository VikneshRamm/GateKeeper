import { Component, OnInit, AfterViewChecked } from '@angular/core';
import { GsigninService } from '../gsignin.service';
declare const gapi: any;

@Component({
  selector: 'app-homepage',
  templateUrl: './homepage.component.html',
  styleUrls: ['./homepage.component.css']
})
export class HomepageComponent implements OnInit, AfterViewChecked {

  // public gapi: any;

  isSignedIn: boolean;
  constructor(public gSignInService: GsigninService) { }

  ngOnInit() {
    this.isSignedIn = this.gSignInService.isUserSignedIn();
    this.gSignInService.signInListener.subscribe((value) => {
      this.isSignedIn = value;
    });
  }

  ngAfterViewChecked() {
    /* this is used to attach the sign in function for the button when
     the button becomes visible*/
    if (!this.isSignedIn) {
      this.gSignInService.googleInit();
    }
  }

}
