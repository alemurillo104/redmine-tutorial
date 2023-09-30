cd /opt
apt update
apt install wget
apt install nano
apt install unzip
apt install build-essential

# Install Ruby-Install
wget https://github.com/postmodern/ruby-install/releases/download/v0.9.2/ruby-install-0.9.2.tar.gz
tar -xzvf ruby-install-0.9.2.tar.gz
cd ruby-install-0.9.2
make install

# Install Ruby-3.1.4
cd /opt
ruby-install ruby 3.1.4
export RUBY_HOME=/opt/rubies/ruby-3.1.4
export PATH=$RUBY_HOME/bin:$PATH

# Install Redmine
wget https://www.redmine.org/releases/redmine-5.0.5.zip
unzip redmine-5.0.5.zip 

cd /opt/redmine-5.0.5
cp config/database.yml.example config/database.yml
echo "Change the Database Config to SQLite3"
nano config/database.yml
#==================
export REDMINE_HOME=/opt/redmine-5.0.5
export PATH=$REDMINE_HOME/bin:$PATH
export RAILS_ENV=production

# Install Gem
gem install bundler
# gem install rails
bundle install --without development test
rake db:migrate RAILS_ENV=production
rails server -e production


