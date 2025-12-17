require 'pathutil'

# Temporary project-local patch to avoid passing a Hash as a positional
# argument to File.read/binread/readlines. This safely forwards keyword
# arguments (Ruby 2.7+/3.0+) and only affects this site via Jekyll's
# `_plugins` autoloading. Remove when upstream `pathutil` fixes the API.
class Pathutil
  def read(*args, **kwd)
    kwd[:encoding] ||= encoding
    if kwd.empty?
      File.read(self, *args)
    else
      File.read(self, *args, **kwd)
    end
  end

  def binread(*args, **kwd)
    kwd[:encoding] ||= encoding
    if kwd.empty?
      File.binread(self, *args)
    else
      File.binread(self, *args, **kwd)
    end
  end

  def readlines(*args, **kwd)
    kwd[:encoding] ||= encoding
    if kwd.empty?
      File.readlines(self, *args)
    else
      File.readlines(self, *args, **kwd)
    end
  end
end
