import { Component, OnInit } from '@angular/core';
import { GsigninService } from './gsignin.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {
  constructor(private gSignInService: GsigninService) { }

  title = 'gatekeeper';

  ngOnInit() {
    // FIX ME: Need to check if this is required
    this.gSignInService.checkIfUserSignedIn();
  }
}
