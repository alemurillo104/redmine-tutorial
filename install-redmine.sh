cd /opt
apt update
apt install wget --yes
apt install nano --yes
apt install unzip --yes
apt install build-essential --yes
apt install libsqlite3-dev --yes

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
wget https://www.redmine.org/releases/redmine-5.0.5.tar.gz
tar -xzvf redmine-5.0.5.tar.gz

cd /opt/redmine-5.0.5
# Config Database SQLite3
cd /opt/redmine-5.0.5/config
echo "# Database SQLite3"     >  database.yml
echo "production:"            >> database.yml
echo "  adapter: sqlite3"     >> database.yml
echo "  database: redmine.db" >> database.yml
echo "  host: localhost"      >> database.yml
echo "  username: root"       >> database.yml
echo "  password: ''"         >> database.yml
echo "  encoding: utf8mb4"    >> database.yml

# Default Configurations
cd /opt/redmine-5.0.5/config
cp configuration.yml.example configuration.yml

#==================
export REDMINE_HOME=/opt/redmine-5.0.5
export PATH=$REDMINE_HOME/bin:$PATH
export RAILS_ENV=production

# Install Gem
# Fix Install
cd /opt/redmine-5.0.5
sed -i "10i\gem 'tzinfo-data'" Gemfile
sed -i "10i\gem 'webrick'" Gemfile
gem install bundler
# gem install rails
bundle install --without development test
rake db:migrate RAILS_ENV=production
bundle exec rake generate_secret_token
rails server -e production