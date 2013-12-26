module YamlcssSupport
  def install_yaml(path = nil)
    if path
      run_simple("bundle exec yamlcss install --path '#{path}'")
    else
      run_simple("bundle exec yamlcss install")
    end
  end

  def yaml_path(prefix, path)
    if prefix
      File.join(prefix, 'yamlcss', path)
    else
      File.join('yamlcss', path)
    end
  end
end

World(YamlcssSupport)
