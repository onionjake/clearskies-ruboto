require 'ruboto/widget'
require 'ruboto/util/toast'

# FIXME don't make lib part of the search path
$: << 'lib'

import android.os.Environment

require 'daemon'


ruboto_import_widgets :Button, :LinearLayout, :TextView, :EditText

# http://xkcd.com/378/

class ClearSkiesMain
  def onCreate(bundle)
    super
    set_title 'ClearSkies'

    self.content_view =
        linear_layout :orientation => :vertical do
          @text_view = text_view :text => 'Enter Access Code:', :id => 42, :width => :match_parent,
                                 :gravity => :center, :text_size => 48.0
          @access_code = edit_text
          button :text => 'Attach to share!', :width => :match_parent, :id => 43, :on_click_listener => proc { attach }
        end

    $data_dir = self.getFilesDir().getAbsolutePath()
    puts $data_dir

    #startService(android.content.Intent.new(application_context, $package.ClearSkiesService.java_class))

  rescue Exception
    puts "Exception creating activity: #{$!}"
    puts $!.backtrace.join("\n")
  end

  private

  def attach
    require 'pending_codes'
    require 'json'
    require 'safe_thread'
    require 'access_code'
    require 'network'
    my_path = Environment::getExternalStorageDirectory().getAbsolutePath()
    my_path = my_path + '/tmp/share'
    puts my_path
    FileUtils.mkdir_p my_path
    begin
      code = PendingCode.parse(@access_code.getText.toString)
    rescue RuntimeError => e
      $stderr.puts "Invalid code: #{e.to_s}"
      toast e.to_s
      return
    end
    code.path = my_path
    PendingCodes.add code
    Network.force_find_peer
  end

end
