// MENU TOGGLE 
function menuToggle() {
    let menu = document.querySelector('.aside')
    let main = document.querySelector('.main_content')
    if (menu.classList.contains('menuOpen')) {
        menu.classList.remove('menuOpen')
        menu.classList.add('menuClosed')
        main.classList.add('main_content_full')
        main.classList.remove('main_content_normal')
    } else {
        menu.classList.remove('menuClosed')
        menu.classList.add('menuOpen')
        main.classList.remove('main_content_full')
        main.classList.add('main_content_normal')
    }
}
