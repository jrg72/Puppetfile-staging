# role_facts.rb

  Facter.add(:facter_component) do
    setcode do
      Facter::Util::Resolution.exec('ls /etc/role.d/component')
    end
  end

  Facter.add(:facter_location) do
    setcode do
      Facter::Util::Resolution.exec('ls /etc/role.d/location')
    end
  end

  Facter.add(:facter_platform) do
    setcode do
      Facter::Util::Resolution.exec('ls /etc/role.d/platform')
    end
  end

