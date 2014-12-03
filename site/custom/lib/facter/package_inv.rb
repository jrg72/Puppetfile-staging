# package_inv.rb

  #package_data = Facter::Util::Resolution.exec('rpm --query --all  --qf "%{NAME}\n"')
  package_data = Facter::Util::Resolution.exec('rpm --query --all  --qf "%{NAME}||%{VERSION}\n"')
 
  package_data.split("\n").each do |line|
 
    rpm_detail      = line.split("||")
    #package_name    = 'package_' + line
    package_name    = 'package_' + rpm_detail[0]
    package_version = rpm_detail[1]
    #package_version = Facter::Util::Resolution.exec('rpm --query --qf "%{VERSION}\n" ' + "#{line}")
 
    Facter.add(package_name) do
      setcode do
        package_version
      end
    end
  end

