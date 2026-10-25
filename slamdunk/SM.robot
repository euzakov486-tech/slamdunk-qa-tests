*** Settings ***
Resource         SM1.resource
Test Setup       web.Precondition: Open Browser And Maximize    site_url=https://www.slamdunk.su/auth/login    browser=chrome
Test Teardown    web.Postcondition: Close Browser
Test Timeout     2m


*** Test Cases ***
Standard Data Driven Invalid Login
    [Documentation]    Стандартная авторизация с невалидными данными
    [Template]        SM1.Login With Invalid Credentials

    # 1. Валидный логин и невалидный пароль
    %{VALID_LOGIN}    invalid_password
    # 2. Невалидный логин и валидный пароль
    invalid_login    %{VALID_PASSWORD}
    # 3. И невалидный логин и невалидный пароль
    invalid_login    invalid_password

Main Shopping Flow Test
    [Documentation]    Основной тест: просмотр товара и добавление в корзину
    SM1.Navigate To Main Page
    SM1.Click Search Button
    SM1.Enter Article Number
    SM1.Click On Product
    SM1.View Product Photos
    SM1.Select Size 7
    SM1.Add To Cart First Button
    SM1.Add To Cart Second Button
    SM1.Continue Shopping
    SM1.Open All Shoe Categories In New Tabs




















