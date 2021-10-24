module VagrantPlugins
  module Chef
    module Cap
      module Windows
        module ChefInstalled
          # Check if Chef is installed at the given version.
          # @return [true, false]
          def self.chef_installed(machine, product, version)
            test_binary = product == 'chef-workstation' ? 'chef' : 'chef-client'
            if version != :latest
              command = 'if ((&' + test_binary + ' --version) -Match "' + version.to_s + '"){ exit 0 } else { exit 1 }'
            else
              command = 'if ((&' + test_binary + ' --version) -Match "Chef*"){ exit 0 } else { exit 1 }'
            end
            machine.communicate.test(command, sudo: true)
          end
        end
      end
    end
  end
end
