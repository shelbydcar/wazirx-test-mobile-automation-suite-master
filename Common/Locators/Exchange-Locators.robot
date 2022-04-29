*** Variables ***
${EXBTC}          xpath=//android.widget.TextView[@text='BTC']
${EXINR}          xpath=//android.widget.TextView[@text='INR']
${EXUSDT}         xpath=//android.widget.TextView[@text='USDT']
${EXP2P}          xpath=//android.widget.TextView[@text='P2P']
${EXWRX}          xpath=//android.widget.TextView[@text='WRX']
${EXFAV}           xpath=//android.widget.ImageView[@bounds='[34,281][169,332]']
${OrdersTab}        id=com.wrx.wazirx.stage:id/bottom_tab_btn_my_orders_label
${ExchangeTab}      id=com.wrx.wazirx.stage:id/bottom_tab_btn_exchange_label

${Charts}         id=com.wrx.wazirx.stage:id/tab_item_charts
${Orders}         id=com.wrx.wazirx.stage:id/tab_item_orders
${Trades}         id=com.wrx.wazirx.stage:id/tab_item_trades
${MyOrders}       id=com.wrx.wazirx.stage:id/tab_item_my_orders
${Buy/Sell}       id=com.wrx.wazirx.stage:id/tab_item_buy_sell

${BuyPrice}       id=com.wrx.wazirx.stage:id/order_book_item_buy_price
${SellPrice}      id=com.wrx.wazirx.stage:id/order_book_item_sell_price
${MarketDepth}    xpath=//android.widget.TextView[contains(@resource-id,'order_book_mode_btn') and @text=' Market Depth']
${OrderVolume}    xpath=//android.widget.TextView[contains(@resource-id,'order_book_mode_btn') and @text=' Order Volume']
${Buy}            id=com.wrx.wazirx.stage:id/bns_form_header_buy_container
${Buysellicon}    	xpath=//android.widget.LinearLayout[@index='2']
${Sell}           id=com.wrx.wazirx.stage:id/bns_form_header_sell_container
${HighestPrice}    xpath=//android.widget.TextView[@text='HIGHEST PRICE']
${LowestPrice}    xpath=//android.widget.TextView[@text='LOWEST PRICE']
${SpendAll}       id=com.wrx.wazirx.stage:id/bns_form_crypto_currency_spend_all
${SellAll}        id=com.wrx.wazirx.stage:id/bns_form_crypto_currency_sell_all
${BuyButton}      xpath=//android.widget.Button[@text='BUY']
${SellButton}     xpath=//android.widget.Button[@text='SELL']
${Coin}             xpath=//android.widget.TextView[@text='${Currency}']
${BaseM}               xpath=//android.widget.TextView[@text='/ ${Market}']
${Price}          id=com.wrx.wazirx.stage:id/bns_form_price
${AmountField}      id=com.wrx.wazirx.stage:id/bns_form_volume
${TotalINR}       id=com.wrx.wazirx.stage:id/bns_form_value
${SwipeElement}        id=com.wrx.wazirx.stage:id/slider_handle
${righttoleftswipe}     	id=com.wrx.wazirx.stage:id/market_currency_icon
${PlaceOrder}     id=com.wrx.wazirx.stage:id/bns_form_main_action

${LimitDropDown}        id=com.wrx.wazirx.stage:id/bns_form_order_type
${LimitDD}              xpath=//android.widget.TextView[@index='1' and @text='Limit']
#${StopLimitDD}          xpath=//android.widget.TextView[@text='Stop Limit']
#${StopLimitDD}          xpath=//*[contains(text(), "Stop")]
${AtPrice}          id=com.wrx.wazirx.stage:id/bns_form_trigger_price
${ConfirmOrd}        	xpath=//android.widget.Button[@text='Confirm']

${SearchIcon}       id=com.wrx.wazirx.stage:id/toolbar_button_search
${SearchField}       id=com.wrx.wazirx.stage:id/toolbar_search_field
${Currancy}         	id=com.wrx.wazirx.stage:id/toolbar_pref_currency
${MyOpenOrders}         xpath=//android.widget.TextView[@text='OPEN']
${OrderHistory}         xpath=//android.widget.TextView[@text='HISTORY']
${BuyOrderPrice}         id=com.wrx.wazirx.stage:id/order_book_item_buy_price
${SellOrderPrice}       id=com.wrx.wazirx.stage:id/order_book_item_sell_price
${FavBadge}             id=com.wrx.wazirx.stage:id/favImageview
${BlankFavMessage}      	id=com.wrx.wazirx.stage:id/add_fav_textview

${Cancellallbtn}        	id=com.wrx.wazirx.stage:id/order_cancel_all_button
${CancelallBTC}             xpath=//android.widget.Button[@text='CANCEL ALL OPEN BTC ORDERS']
${CancelallOpen}            xpath=//android.widget.Button[@text='CANCEL ALL OPEN ORDERS']
${CancelOrderBtn}           id=com.wrx.wazirx.stage:id/transaction_action_button
${CompletedOdrBtn}          id=	com.wrx.wazirx.stage:id/transaction_action_button
${ConfirmCancelorder}       xpath=//android.widget.Button[@text='CANCEL ORDER']
${ConfirmCancel&Modifyorder}       xpath=//android.widget.Button[@text='CANCEL & MODIFY ORDER']

${OpenTab}                      xpath=//android.widget.TextView[@text='OPEN']
${HistoryTab}                  	xpath=//android.widget.TextView[@text='HISTORY']
${Background}                   id=com.wrx.wazirx.stage:id/cfdialog_background
${CancelledLable}               id=com.wrx.wazirx.stage:id/transaction_action_button
${Favbtn}             id=com.wrx.wazirx.stage:id/favButton

${SerchedCoins}             id=com.wrx.wazirx.stage:id/market_currency_subtitle
${SerchedBase}              id=com.wrx.wazirx.stage:id/market_currency_title_sub

${pop_up_message}       path

${OrderPgeFilt}         id=com.wrx.wazirx.stage:id/order_book_mode_btn

${OpenOrderPrc}         com.wrx.wazirx.stage:id/transaction_item_price
######Funds
${Funds}             id=com.wrx.wazirx.stage:id/bottom_tab_btn_funds_label
${HidelowBal}           id=com.wrx.wazirx.stage:id/wallet_hide_low_balance_switch