require 'rubyXL'

class Export

  def initialize

  end

  def run

    workbook = RubyXL::Workbook.new

    worksheet = workbook.worksheets[0]

    User.all.each_with_index do |x,i|

       worksheet.add_cell(i,0, x.id)
       worksheet.add_cell(i,1, x.email)
    end


    #worksheet.add_cell(0, 0, 'A1')

    file = File.new("test.xlsx", 'w')

    #tempfile = Tempfile.new("export",".xlsx")

    #workbook.write(tempfile.path)

    workbook.write(file.path)

    file.close

  end



end
