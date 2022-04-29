*** Variables ***
${FilterDrpDn}              id=com.wrx.wazirx.stage:id/select_sort_item
${FiterMostTraded}          xpath=//android.widget.TextView[@text='Most Traded']
${FiterLeastTraded}         xpath=//android.widget.TextView[@text='Least Traded']
${FiterTopGainers}          xpath=//android.widget.TextView[@text='Top Gainers']
${FiterTopLosers}          xpath=//android.widget.TextView[@text='Top Losers']
${FilterHighestPrice}       xpath=//android.widget.TextView[@text='Highest Price']
${FilterLowestPrice}        xpath=//android.widget.TextView[@text='Lowest Price']
${SetToDefault}             id=com.wrx.wazirx.stage:id/set_to_default
${Selected}                 	id=com.wrx.wazirx.stage:id/sortby_selected
${FilterCloseBtn}             	id=com.wrx.wazirx.stage:id/close_btn



${ClickQuickBuyCoin}          xpath=//android.widget.TextView[@text='${QuickBuyCoin}']
${TapBuy}                   id=com.wrx.wazirx.stage:id/buy_button
${TabSell}                   xpath=//android.widget.TextView[@text='SELL']


${CurrentBalance}           id=com.wrx.wazirx.stage:id/current_balance_label
${CurrentBalanceAmt}        id=com.wrx.wazirx.stage:id/current_balance_text

${QuickBuyTab}              id=com.wrx.wazirx.stage:id/bottom_tab_btn_buysell_label

${0%}                       id=com.wrx.wazirx.stage:id/qbs_form_value_action_0
${25%}                      id=com.wrx.wazirx.stage:id/qbs_form_value_action_25
${50%}                      id=com.wrx.wazirx.stage:id/qbs_form_value_action_50
${75%}                      id=com.wrx.wazirx.stage:id/qbs_form_value_action_75
${100%}                     id=com.wrx.wazirx.stage:id/qbs_form_value_action_100

${Amnt}                     id=com.wrx.wazirx.stage:id/price_text
${SubTitle}                    id=com.wrx.wazirx.stage:id/toolbar_subtitle
${FundsWalletTitle}                id=com.wrx.wazirx.stage:id/toolbar_title
${PreviewBuySell}               id=com.wrx.wazirx.stage:id/button


#${OrderStatus}              xpath=//android.widget.TextView[@text='Successfully Bought']
${OrderStatus}              id=com.wrx.wazirx.stage:id/order_status_textview      #	Successfully Bought
${AmountStatus}             id=com.wrx.wazirx.stage:id/order_amount_textview        # You spent 250 INR and bought 10 BTC
${CloseBtn}                 id=com.wrx.wazirx.stage:id/close_btn