*** Settings ***
Documentation    Ключевые слова для тестов Slamdunk
Resource    ../web.resource
Resource    ../lcSM.resource


*** Keywords ***
Navigate To Account Login
    [Documentation]    Переход на страницу входа в аккаунт
    
    Wait Until Element Is Visible    locator=${ACCOUNT_BUTTON}    timeout=5s
    Click Element    locator=${ACCOUNT_BUTTON}

Login With Invalid Credentials
    [Documentation]    Попытка авторизации с невалидными данными
    [Arguments]    ${login}    ${password}

    Wait Until Element Is Visible    locator=${ACCOUNT_BUTTON}    timeout=20s
    Click Element    locator=${ACCOUNT_BUTTON}

    Wait Until Element Is Visible    //*[@id="loginName"]
    Input Text    locator=//*[@id="loginName"]    text=${login}

    Input Password    locator=//*[@id="loginPass"]    password=${password}

    Click Element    //*[@id="j-body"]/div[2]/div/div[1]/form/div[4]/button
    Wait Until Element Is Visible    //button[@class='btn btn-outline-orange btn-block py-2']

Navigate To Main Page
    [Documentation]    Переход на главную страницу

    Wait Until Element Is Visible    locator=${LOGO}    timeout=5s
    Click Element    locator=${LOGO}

Click Search Button
    [Documentation]    Клик по кнопке поиска

    Wait Until Element Is Visible    locator=${SEARCH_BUTTON}
    Click Button    locator=${SEARCH_BUTTON}

Enter Article Number
    [Documentation]    Ввод артикула товара

     Wait Until Element Is Visible    //input[@type="text"]    timeout=10s

    Input Text    //input[@type="text"]    text=${PRODUCT_ARTICLE}
    Sleep    2s
    Press Keys    //input[@type="text"]    ENTER

Click On Product
    [Documentation]    Клик по карточке товара

    Wait Until Element Is Visible    locator=${PRODUCT_CARD}    timeout=5s
    Click Element    locator=${PRODUCT_CARD}

View Product Photos
    [Documentation]    Просмотр фотографий товара

    Wait Until Element Is Visible    locator=${NEXT_ARROW}    timeout=5s
    WHILE    ${True}
        ${can_click}    Run Keyword And Return Status    Click Element    ${NEXT_ARROW}
        Exit For Loop If    ${can_click} == ${FALSE}
    END

Select Size 7
    [Documentation]    Выбор размера 7

    Wait Until Element Is Visible    locator=${SIZE_7_BUTTON}    timeout=10s
    Click Element    locator=${SIZE_7_BUTTON}

Add To Cart First Button
    [Documentation]    Добавление в корзину (первая кнопка)

    Wait Until Element Is Visible    locator=${ADD_TO_CART_BUTTON_1}    timeout=10s
    Click Element    locator=${ADD_TO_CART_BUTTON_1}

Add To Cart Second Button
    [Documentation]    Добавление в корзину (вторая кнопка)

    Wait Until Element Is Visible    locator=${ADD_TO_CART_BUTTON_2}    timeout=10s
    Click Element    locator=${ADD_TO_CART_BUTTON_2}

Continue Shopping
    [Documentation]    Возврат к покупкам

    Wait Until Element Is Visible    locator=${CONTINUE_SHOPPING_LINK}    timeout=10s
    Click Element    locator=${CONTINUE_SHOPPING_LINK}

Open All Shoe Categories In New Tabs
    [Documentation]    Открытие всех категорий обуви в новых вкладках

    @{shoe_links}=    Get WebElements    //ul[@class="list-group list-group-flush"]//li//a
    ${opened_count}=    Set Variable    0
    FOR    ${link}    IN    @{shoe_links}
        ${is_clickable}=    Run Keyword And Return Status
        ...    Click Element    ${link}    modifier=CTRL
        IF    ${is_clickable}
            ${opened_count}=    Evaluate    ${opened_count} + 1
            Sleep    1s
        ELSE
            Log    Элемент не кликабельный, пропускаем
        END
    END
