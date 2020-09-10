const cardsContainer = document.querySelector('.favorite-songs-container');
const loginForm = document.querySelector('.login-form');
const loginContainer = document.querySelector('.login-container');
const allUsers = [];
const allComments = [];



document.addEventListener('DOMContentLoaded', () => {
    sessionStorage.clear();
    fetchUsers()
    fetchComments()
});

function fetchUsers() {
    fetch('http://localhost:3000/users')
        .then(res => res.json())
        .then(json => {
    users = json;
    users.forEach(user => {
        allUsers.push(user);
    });
    });
};

function fetchComments() {
    fetch('http://localhost:3000/comments')
        .then(res => res.json())
        .then(json => {
    comments = json;
    comments.forEach(comment => {
        allComments.push(comment);
    });
    });
};

loginForm.addEventListener('submit', (e) => {
    e.preventDefault();
    loginContainer.style.display = "none";
    cardsContainer.style.display = "grid";
    let currentUser = e.target.username.value;
    let findUser = users.find(user => user.username === currentUser);

    if (findUser) {
        sessionStorage.setItem('userId', findUser.id);
    } else {
        fetch('http://localhost:3000/users', {
            method: 'POST',
            headers: {
                Accept: "application/json",
                'Content-Type': "application/json"
            },
            body: JSON.stringify({
                "username": currentUser}),
            })
                .then(res => res.json()).then(json => {
            user = json;
            sessionStorage.setItem('userId', user.id)
        })
    }
    loadFavoriteSongs()
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

    let likesSection = document.createElement('div');
    likesSection.setAttribute('class', 'likes-section');
    let likes = document.createElement('span');
    const btnDiv = document.createElement('div');
    btnDiv.setAttribute('class', 'button-div');

    likes.setAttribute('class', 'likes');
    likes.innerText = `${song.likes} likes`;
    let likeBtn = document.createElement('button');
    likeBtn.setAttribute('class', 'like-button');
    likeBtn.setAttribute('id', song.id);
    likeBtn.innerText = '👍';
    let dislikeBtn = document.createElement('button');
    dislikeBtn.setAttribute('class', 'dislike-button');
    dislikeBtn.setAttribute('id', song.id);
    dislikeBtn.innerText = '👎';
    dislikeBtn.addEventListener('click', subtractLikes);
    likeBtn.addEventListener('click', addLikes)
    btnDiv.append(likeBtn, dislikeBtn)
    likesSection.append(likes, btnDiv);


    function addLikes(){
        const id = song.id
        likesNum = parseInt(likes.innerText.split(" ")[0]);
        addNum = likesNum + 1;
        likes.innerText = `${addNum} likes`

        fetch(`http://localhost:3000/favorite_songs/${id}`, {
            method: 'PATCH',
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            },
            body: JSON.stringify({
                "likes": addNum
            })
        })

    }

    function subtractLikes(){
        const id = song.id
        likesNum = parseInt(likes.innerText.split(" ")[0]);
        subtractNum = likesNum - 1;
        likes.innerText = `${subtractNum} likes`

        fetch(`http://localhost:3000/favorite_songs/${id}`, {
            method: 'PATCH',
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            },
            body: JSON.stringify({
                "likes": subtractNum
            })
        })

    }

    let ul = document.createElement('ul');
    ul.setAttribute('class', 'comments');
    for (let i = 0; i < song.comments.length; i++) {
        let li = document.createElement('li');
        let b = document.createElement('b');

        let commentUser = allUsers.find(user => user.id === song.comments[i].user_id);
        b.innerText = `${commentUser.username}`;

        let x = Math.floor(Math.random() * 256);
        let y = Math.floor(Math.random() * 256);
        let z = Math.floor(Math.random() * 256);
        let bgColor = "rgb(" + x + "," + y + "," + z + ")";
        b.style.color = bgColor;
        
        li.innerText = `${song.comments[i].content} -- `;
        li.append(b);
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


    songCard.append(userTitle, songHeader, video, likesSection, ul, commentForm);
    cardsContainer.append(songCard);
}