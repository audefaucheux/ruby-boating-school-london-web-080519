class Student

    attr_reader :first_name

    @@all = []

    # should initialize with first_name 
    def initialize(first_name)
        @first_name = first_name
        @@all << self
    end

    #Student.all should return all of the student instances
    def self.all
        @@all
    end

    # Student#add_boating_test should initialize a new boating test with a Student (Object), 
    # a boating test name (String), a boating test status (String), and an Instructor (Object)
    def add_boating_test(test_name, test_status, instructor)
        BoatingTest.new(self, test_name, test_status, instructor)
    end

    # Student.find_student will take in a first name and output the student (Object) with that name
    def self.find_student(first_name)
        self.all.find{|student| student.first_name == first_name}
    end

    # Student#grade_percentage should return the percentage of tests that the student has passed, 
    # a Float (so if a student has passed 3 / 9 tests that they've taken, this method should return 
    # the Float 33.33)
    def passed_boating_tests
        BoatingTest.all.select do |boating_test| 
            boating_test.student == self && boating_test.test_status == 'passed'
        end
    end

    def grade_percentage
        total_tests = 9
        passed_tests = self.passed_boating_tests.count

        percentage = passed_tests.to_f/total_tests*100
        percentage.round(2)
    end

end
