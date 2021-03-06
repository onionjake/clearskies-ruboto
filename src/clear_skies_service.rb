require 'ruboto/util/toast'

## FIXME don't make lib part of the search path
#$: << 'lib'
#
#require 'daemon'
#require 'control_client'

# Services are complicated and don't really make sense unless you
# show the interaction between the Service and other parts of your
# app.
# For now, just take a look at the explanation and example in
# online:
# http://developer.android.com/reference/android/app/Service.html
class ClearSkiesService
  def onStartCommand(intent, flags, startId)
    toast 'Hello from the service'
    Thread.new {
      Daemon.run
    }
    toast 'Hello from the service after'
    android.app.Service::START_STICKY
  end
end
