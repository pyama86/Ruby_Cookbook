module EventDispatcher
	def setup_listeners
		@event_dispatcher_listeners = {}
	end

	#&callbackなのでlamdbaとして登録される
	def subscribe(event, &callback)
		(@event_dispatcher_listeners[event] ||= []) <<callback
	end
	
	protected
	def notify(event ,*args)
		#dispatcherが登録済み
		if @event_dispatcher_listeners[event]
			@event_dispatcher_listeners[event].each do |m|
				
				#call出来るなら
				m.call(*args) if m.respond_to? :call
			end
		end
		return nil
	end
end

class Factory
	include EventDispatcher

	def initialize
		setup_listeners
	end
	def produce_widget(color)
		notify(:new_widget,color)
	end
end

class WidgetCounter
	def initialize(factory)
		@counts = Hash.new(0)
		#ディスパッチャにブロックを登録する
		factory.subscribe(:new_widget) do |color|
			@counts[color] += 1
			puts "#{@counts[color]} #{color} widget(s) created since I started watching."
		end
	end
end


f1 = Factory.new

WidgetCounter.new(f1)
#notifyを飛ばす
f1.produce_widget("red")
f1.produce_widget("green")
f1.produce_widget("red")
