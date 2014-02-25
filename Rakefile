require 'rake'

desc "install the dot files into user's home directory"
task :install do
  install_oh_my_zsh
  switch_to_zsh
  replace_all = false

  files = Dir['*'] - %w[Rakefile README.rdoc LICENSE oh-my-zsh]
  files << "oh-my-zsh/custom/hrother.zsh-theme"
  files << "oh-my-zsh/custom/plugins/com_abriv/com_abriv.plugin.zsh"
  files << "oh-my-zsh/custom/plugins/dir_abriv/dir_abriv.plugin.zsh"
  files << "oh-my-zsh/custom/plugins/functions/functions.plugin.zsh"
  files << "oh-my-zsh/custom/plugins/env/env.plugin.zsh"
  files << "oh-my-zsh/custom/plugins/virsh/virsh.plugin.zsh"
  files << "oh-my-zsh/custom/plugins/virsh/_virsh"
  files.each do |file|
    if File.exist?(File.join(ENV['HOME'], ".#{file}"))
      if replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{file}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file}"
        end
      end
    else
      link_file(file)
    end
  end

  # Need to do this to make vim use RVM's ruby version
  #puts "Moving zshenv to zshrc"
  #system %Q{sudo mv /etc/zshenv /etc/zshrc}
  if not File.exists?(File.expand_path("~/.tmp"))
    system %Q{mkdir $HOME/.tmp} 
  end

end

def replace_file(file)
  system %Q{rm "$HOME/.#{file}"}
  link_file(file)
end

def link_file(file)
  if file =~ /custom/
    path = File.dirname(file)
    if not File.directory?(File.expand_path("~/.#{path}"))
      puts "creating folder #{path}"
      system %Q{mkdir -p "$HOME/.#{path}"}
    end
  end
  puts "linking ~/.#{file}"
  system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
end

def switch_to_zsh
  if ENV["SHELL"] =~ /zsh/
    puts "using zsh"
  else
    print "switch to zsh? (recommended) [ynq] "
    case $stdin.gets.chomp
    when 'y'
      puts "switching to zsh"
      system %Q{chsh -s `which zsh`}
    when 'q'
      exit
    else
      puts "skipping zsh"
    end
  end
end

def install_oh_my_zsh
  if File.exist?(File.join(ENV['HOME'], ".oh-my-zsh"))
    puts "found ~/.oh-my-zsh"
  else
    print "install oh-my-zsh? [ynq] "
    case $stdin.gets.chomp
    when 'y'
      puts "installing oh-my-zsh"
      system %Q{git clone git://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh"}
    when 'q'
      exit
    else
      puts "skipping oh-my-zsh, you will need to change ~/.zshrc"
    end
  end
end
