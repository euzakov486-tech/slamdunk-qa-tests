*** Settings ***
Documentation    Файл с переменными для тестов Slamdunk


*** Variables ***
${ACCOUNT_BUTTON}                  //a[@href="/auth/login" and @class="btn btn-outline-dark"]
${LOGO}                           //a[@class="logo-link"]
${SEARCH_BUTTON}                  //button[@class="btn btn-outline-dark"]
${PRODUCT_ARTICLE}                ABTU001-1
${PRODUCT_CARD}                   //div[@class="product-card__body-wrapper"]
${NEXT_ARROW}                     //div[@class="swiper-button-next"]
${SIZE_7_BUTTON}                  //button[@class="btn btn-block btn-outline-dark mb-1 size-control"]
${ADD_TO_CART_BUTTON_1}           //button[@class="btn btn-block btn-orange py-2 mb-2 add-btn"]
${ADD_TO_CART_BUTTON_2}           //button[@class="btn btn-orange btn-block btn-lg mb-1"]
${CONTINUE_SHOPPING_LINK}         //a[@class="text-muted cursor-custom"]
