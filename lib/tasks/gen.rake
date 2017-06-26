namespace :gen do
	desc 'Добавить смену'

	task :addShift, [:arg_1] => [:environment] do |task, args|
  	shift = Shift.new
  	shift.date = args.arg_1
  	shift.factory = Factory.last
  	shift.save
  end
  desc 'Тестовая генерация всего'
  task test: :environment do
  	n = User.last.id
  	for i in 0..5
	    user = User.new
	    user.name = "#{n+i}"
	    user.password = '#{n+i*2}'
	    user.save
	    puts "#{ user.errors }" if !user.errors.empty?
	    puts "Создан пользователь #{ user.name }" if user.save
	    factory = Factory.new
	    factory.name = "Фабрика#{n+i}"
	    factory.user = user
	    factory.save
	    shift = Shift.last
	    worker = Worker.new
	    worker.name = "Работник#{n+i}"
	    worker.workingHrs = 5
	    worker.shift = shift
	    worker.factory = shift.factory
	    worker.save
	end
  end
  desc 'Добавление заказа'
  task :order, [:arg_1] => [:environment] do |task, args|
  	order = Order.new
  	#order.factory = Factory.find(args.arg_1)
  	order.difficulty = args.arg_1
  	order.pic = "pics/#{args.arg_1}"
  	order.shift = Shift.find(args.arg_1)
  	order.worker = Worker.find(args.arg_1)
  	order.save
  end
end