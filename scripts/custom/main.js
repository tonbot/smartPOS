$(document).ready(function() {
    var show = false;
    
    $(".toggle-sidebar").click(function() {
        if(show){
            gsap.to(".sidebar-wrapper", {x: "-250px", duration: 1});
            show = false;
            return;
        }
        gsap.to(".sidebar-wrapper", {x: "250px", duration: 1});
        show = true;
    });
  });