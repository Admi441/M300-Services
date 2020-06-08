"provisioners": [
    {
    "type": "shell",
    "execute_command": "echo 'vagrant'|sudo -S sh '{{.Path}}'",
    "override": {
        "virtualbox-iso": {
        "scripts": [
            "scripts/server/base.sh",
                "post-processors": [
    {
    "type": "vagrant",
    "override": {
        "virtualbox": {
        "output": "ubuntu-server-amd64-virtualbox.box"
        }
    }
}