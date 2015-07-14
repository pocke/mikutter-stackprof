require 'stackprof'
require 'stringio'

Thread.new do
  loop do
    r = StackProf.run mode: :cpu do
      sleep 60 * 60
    end
    re = StackProf::Report.new(r)
    sio = StringIO.new("", "w+")
    re.print_text(false, 10, sio)
    Plugin.call(:update, nil, [Message.new(message: sio.string, system: true)])
  end
end
