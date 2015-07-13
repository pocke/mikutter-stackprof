require 'stackprof'

Thread.new do
  loop do
    r = StackProf.run mode: :cpu do
      sleep 60
    end
    re = StackProf::Report.new(r)
    pp Time.now
    re.print_text
  end
end
