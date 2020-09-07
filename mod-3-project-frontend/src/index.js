document.addEventListener('DOMContentLoaded', () => {
loadUsers()
});

function loadUsers() {
    fetch('http://localhost:3000/users')
        .then(res => res.json())
        .then(json => {
    users = json;
    console.log(users)
    });
};