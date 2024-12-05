require "erubis"

template = <<TEMPLATE
Hello! I'm the Template.
I have <%= stuff %>.
TEMPLATE

# create source template / Can be from separate file
eruby = Erubis::Eruby.new(template)
# call for code from template
puts eruby.src
puts "=" * 10
# Erubis takes each char from the template and (<<) builds to a _buf. 
# adding in variables and calling .to_s
# will ignore variables that are not in the template.. neat!
puts eruby.result(:stuff => "ponies!", :nothing => "", :ignore_me => "totally ignored")
