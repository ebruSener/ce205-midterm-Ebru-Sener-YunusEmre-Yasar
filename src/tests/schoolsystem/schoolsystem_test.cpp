//#define ENABLE_SCHOOLSYSTEM_TEST  // Uncomment this line to enable the Schoolsystem tests

#include "gtest/gtest.h"
#include "../../schoolsystem/header/schoolsystem.h"  // Adjust this include path based on your project structure

using namespace School::Schoolsystem;

class SchoolsystemTest : public ::testing::Test {
 protected:
  void SetUp() override {
    // Setup test data
  }

  void TearDown() override {
    // Clean up test data
  }
};

TEST_F(SchoolsystemTest, TestAdd) {
  double result = Schoolsystem::add(5.0, 3.0);
  EXPECT_DOUBLE_EQ(result, 8.0);
}

TEST_F(SchoolsystemTest, TestSubtract) {
  double result = Schoolsystem::subtract(5.0, 3.0);
  EXPECT_DOUBLE_EQ(result, 2.0);
}

TEST_F(SchoolsystemTest, TestMultiply) {
  double result = Schoolsystem::multiply(5.0, 3.0);
  EXPECT_DOUBLE_EQ(result, 15.0);
}

TEST_F(SchoolsystemTest, TestDivide) {
  double result = Schoolsystem::divide(6.0, 3.0);
  EXPECT_DOUBLE_EQ(result, 2.0);
}

TEST_F(SchoolsystemTest, TestDivideByZero) {
  EXPECT_THROW(Schoolsystem::divide(5.0, 0.0), std::invalid_argument);
}

/**
 * @brief The main function of the test program.
 *
 * @param argc The number of command-line arguments.
 * @param argv An array of command-line argument strings.
 * @return int The exit status of the program.
 */
int main(int argc, char **argv) {
#ifdef ENABLE_SCHOOLSYSTEM_TEST
  ::testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
#else
  return 0;
#endif
}
