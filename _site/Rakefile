require "sass"

desc "Genera los estilos"
task :default do
  puts "Leyendo base.scss..."
  content = File.read("css/base.scss")
  puts "Extrayendo metadata..."
  meta = /^(---\s*\n.*?\n?)^(---\s*$\n?)/m.match(content)
  data = meta.post_match
  puts "Procesando estilos..."
  engine = Sass::Engine.new(data, :syntax => :scss)
  puts "Guardando archivo..."
  File.open("css/base.css", "w") do |f|
    f.puts engine.render
  end
  puts "Listo, base.css generado."
end