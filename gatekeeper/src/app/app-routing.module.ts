import { NgModule } from "@angular/core";
import { CommonModule } from "@angular/common";
import { RouterModule, Routes } from "@angular/router";
import { HomepageComponent } from "./homepage/homepage.component";
import { DashboardComponent } from "./dashboard/dashboard.component";
import { AuthGaurd } from "./auth-gaurd";

const routes: Routes = [
  { path: "", component: HomepageComponent },
  { path: "dashboard", component: DashboardComponent, canActivate: [AuthGaurd] }
];

@NgModule({
  declarations: [],
  imports: [CommonModule, RouterModule.forRoot(routes)],
  exports: [RouterModule],
  providers: [AuthGaurd]
})
export class AppRoutingModule {}
