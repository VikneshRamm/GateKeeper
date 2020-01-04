import { Component, OnInit, AfterViewInit } from "@angular/core";
import { GsigninService } from "../gsignin.service";

@Component({
  selector: "app-dashboard",
  templateUrl: "./dashboard.component.html",
  styleUrls: ["./dashboard.component.css"]
})
export class DashboardComponent implements OnInit, AfterViewInit {
  constructor(private gSignInService: GsigninService) {}

  name: string;
  ngOnInit() {
    const userInfo = this.gSignInService.getUserInfo();
    this.name = userInfo.name;
  }

  ngAfterViewInit() {
    // this.gSignInService.signInListener.next(true);
  }
}
