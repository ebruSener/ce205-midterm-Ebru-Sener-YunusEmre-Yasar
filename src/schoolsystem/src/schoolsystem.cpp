#include "../header/schoolsystem.h"
#include <stdexcept>

using namespace school::Schoolsystem;

double Schoolsystem::add(double a, double b) {
  return a + b;
}

double Schoolsystem::subtract(double a, double b) {
  return a - b;
}

double Schoolsystem::multiply(double a, double b) {
  return a * b;
}

double Schoolsystem::divide(double a, double b) {
  if (b == 0) {
    throw std::invalid_argument("Division by zero is not allowed.");
  }

  return a / b;
}
