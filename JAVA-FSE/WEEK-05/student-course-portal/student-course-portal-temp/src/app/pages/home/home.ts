import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-home',
  imports: [CommonModule, FormsModule],
  templateUrl: './home.html',
  styleUrl: './home.css'
})
export class Home {

  studentName = 'Harsha Vardhan S';

  course = 'Java Full Stack';

  gpa = 8.23;

  courseImage = 'https://angular.dev/assets/images/press-kit/angular_icon_gradient.gif';

  message = '';

  inputName = '';

  showCourses = true;

  courses = [
    'Java',
    'Angular',
    'Spring Boot',
    'MySQL',
    'MongoDB'
  ];

  showMessage() {
    this.message = 'Welcome to Angular Event Binding!';
  }

}