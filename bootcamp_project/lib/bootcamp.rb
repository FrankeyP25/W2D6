class Bootcamp
  attr_reader :name, :slogan, :teachers, :students
    def initialize(name, slogan, student_capacity)
      @name = name
      @slogan = slogan
      @student_capacity = student_capacity
      @students = []
      @teachers = []
      @grades = Hash.new { |h, k| h[k] = [] }
    end

    def hire(tea)
      @teachers << tea
    end

    def enroll(stu)
      if @students.length < @student_capacity
        @students << stu
        true
      else
        false
      end
    end

    def enrolled?(stu)
      @students.include?(stu)
    end

    def student_to_teacher_ratio
      @students.length / @teachers.length
    end

    def add_grade(stu, gra)
      if enrolled?(stu)
        @grades[stu] << gra
        true
      else
        false
      end
    end

    def num_grades(stu)
      num = @grades[stu].length
    end

    def average_grade(stu)
      return nil if num_grades(stu) == 0
      sum = @grades[stu].sum
      sum / num_grades(stu)
    end
end
