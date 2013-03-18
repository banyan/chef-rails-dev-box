execute "apt-get update" do
 command "apt-get update"
 action :run
end

# when run this, it will be crash.. :S
# execute "apt-get upgrade" do
 # command "apt-get -y upgrade"
 # action :run
# end

# execute "apt-get dist-upgrade" do
 # command "apt-get -y dist-upgrade"
 # action :run
# end

packages = %w(
  curl
  build-essential
  libyaml-dev
  libxml2
  libxml2-dev
  libxslt1-dev
)

packages.each do |p|
  package p do
    action :install
  end
end
