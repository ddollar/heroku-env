require "heroku/command"

class Heroku::Command::App
  def env
    app = extract_app
    env = heroku.config_vars(app)
    vars = env.map do |key, val|
      [key, val].join("=")
    end.join(" ")

    error "usage: heroku env <command>" unless args
    command = "env #{vars} #{args.join(" ")}"
    exec command
  end
end

