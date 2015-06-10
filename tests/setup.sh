#/bin/sh

curl https://raw.githubusercontent.com/GetValkyrie/ansible-bootstrap/master/install-ansible.sh | /bin/sh
ansible-galaxy install --ignore-errors geerlingguy.mysql
ansible-galaxy install --ignore-errors http://github.com/getvalkyrie/valhalla.common,,valhalla.common
ansible-galaxy install --ignore-errors http://github.com/getvalkyrie/valhalla.web,,valhalla.web
ansible-galaxy install --ignore-errors http://github.com/getvalkyrie/ansible-role-graphite,,getvalkyrie.graphite
ansible-galaxy install --ignore-errors http://github.com/getvalkyrie/ansible-role-shinken,,getvalkyrie.shinken

target=/etc/ansible/roles/valhalla.monitoring
if [ ! -e $target ]; then
  mkdir -p /etc/ansible/roles/
  ln -s /vagrant/ $target
fi
