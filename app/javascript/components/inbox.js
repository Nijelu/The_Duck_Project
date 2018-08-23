const form = document.getElementById("comment-form");
form.addEventListener('submit', (event) => {
  event.preventDefault();
  const name = `<h3>${document.getElementById("your-name").value}</h3>`;
  list.insertAdjacentHTML("beforeend", name);
  const message = `<li>${document.getElementById("your-message").value}</li>`;
  list.insertAdjacentHTML("beforeend", message);
  send();
});
