const cardsContainer = document.querySelector('.favorite-songs-container');
const loginForm = document.querySelector('.login-form');
const loginContainer = document.querySelector('.login-container');




document.addEventListener('DOMContentLoaded', () => {
    sessionStorage.clear();
    loadFavoriteSongs()
    fetchUsers()
});




function loadFavoriteSongs() {
    fetch('http://localhost:3000/favorite_songs')
        .then(res => res.json())
        .then(json => {
    songs = json;
    songs.forEach(song => {
        addSongCards(song);
    })
    });
};

function fetchUsers() {
    fetch('http://localhost:3000/users')
        .then(res => res.json())
        .then(json => {
    users = json;
    })
};

function addSongCards (song) {
    let songCard = document.createElement('div');
    songCard.setAttribute('class', 'song-card');
    songCard.setAttribute('id', song.id);

    let userTitle = document.createElement('h2');
    userTitle.setAttribute('class', 'user-title');
    userTitle.innerText = song.user.username;

    let songHeader = document.createElement('header');
    songHeader.setAttribute('class', 'song-header');
    let h1 = document.createElement('h1');
    h1.innerText = `"${song.title}" - ${song.artist}`
    songHeader.append(h1);

    //video_url needs to be in this format to currently work: "https://www.youtube.com/embed/9cN1XCpfWD4"
    let video = document.createElement('iframe');
    video.setAttribute('width', '350');
    video.setAttribute('height', '315');
    video.setAttribute('src', song.video_url);
    video.setAttribute('frameborder', '0');
    video.setAttribute('allow', "accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture");
    video.setAttribute('allowfullscreen', '');
    //Even though they ^ will still display, some vids might not be able to play 
    //due to either copyright or the fact that some embedding doesn't work within
    //local host.

    let likesSec = document.createElement('div');
    likesSec.setAttribute('class', 'likes-section');
    let likes = document.createElement('span');
    likes.setAttribute('class', 'likes');
    likes.innerText = `${song.likes} likes`;
    let likeBtn = document.createElement('button');
    likeBtn.setAttribute('class', 'like-button');
    likeBtn.setAttribute('id', song.id);
    likeBtn.innerText = '👍';
    likesSec.append(likes, likeBtn);

    let ul = document.createElement('ul');
    ul.setAttribute('class', 'comments');
    for (let i = 0; i < song.comments.length; i++) {
        let li = document.createElement('li');
        li.innerText = song.comments[i].content;
        ul.append(li);
    }

    let commentForm = document.createElement('form');
    commentForm.setAttribute('class', 'comment-form');
    let commentInput = document.createElement('input');
    commentInput.setAttribute('class', 'comment-input');
    commentInput.setAttribute('type', 'text');
    commentInput.setAttribute('name', 'comment');
    commentInput.setAttribute('placeholder', 'Add a comment...');
    let commentBtn = document.createElement('button');
    commentBtn.setAttribute('class', 'comment-button');
    commentBtn.setAttribute('type', 'submit');
    commentBtn.setAttribute('id', song.id);
    commentBtn.innerText = 'Post';
    commentForm.append(commentInput, commentBtn);


    songCard.append(userTitle, songHeader, video, likesSec, ul, commentForm);
    cardsContainer.append(songCard);
}


loginForm.addEventListener('submit', (e) => {
    e.preventDefault(e);
    loginContainer.style.display = "none";
    cardsContainer.style.display = "grid";
    let currentUser = e.target.username.value;
    let findUser = users.find(user => user.username === currentUser);

    if (findUser) {
        sessionStorage.setItem('userId', findUser.id);
        //sessionStorage.userId to get current user id 
    } else {
        console.log('cannot find user');
        //Post
    }

  });