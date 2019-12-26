import { Component, OnInit, AfterViewInit } from '@angular/core';
import { GsigninService } from '../gsignin.service';
declare const gapi: any;

@Component({
  selector: 'app-homepage',
  templateUrl: './homepage.component.html',
  styleUrls: ['./homepage.component.css']
})
export class HomepageComponent implements OnInit, AfterViewInit {

  // public gapi: any;

  constructor(public gSignInService: GsigninService) { }

  ngOnInit() {
  }

  ngAfterViewInit() {
    setTimeout(() => {
      // FIX ME: The timeout is not required I guess. Needed to check.
       this.gSignInService.googleInit();
    }, 300);
  }


}
