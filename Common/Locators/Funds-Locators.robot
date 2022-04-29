*** Variables ***
${Funds}          id=com.wrx.wazirx.stage:id/bottom_tab_btn_funds_label
${Hidelowbal}       id=com.wrx.wazirx.stage:id/wallet_hide_low_balance_switch
${BTCFunds}         xpath=//android.widget.TextView[@text="BTC"]
${XRPFunds}         xpath=//android.widget.TextView[@text="XRP"]

${DepositButton}    id=com.wrx.wazirx.stage:id/wallet_deposit_button
${addresscopy}      id=com.wrx.wazirx.stage:id/deposit_address_copy
${tagcopy}          id=com.wrx.wazirx.stage:id/deposit_memo_copy
${Depositeqr}       id=com.wrx.wazirx.stage:id/deposit_qr_blur
${ShowDestinationAdd}       id=com.wrx.wazirx.stage:id/deposit_tips_button
${DestinationTag}           id=com.wrx.wazirx.stage:id/deposit_memo_value

${rapidlistingtag}          id=com.wrx.wazirx.stage:id/status_info_title
${rapidlistingmsg}          id=com.wrx.wazirx.stage:id/status_info_message
${whatisrapidlisting}       id=com.wrx.wazirx.stage:id/status_info_action
${wazirxblogtitle}          id=com.wrx.wazirx.stage:id/toolbar_title
${closerapidlisting}        id=com.wrx.wazirx.stage:id/toolbar_title
${drpdrapidlisting}         id=com.wrx.wazirx.stage:id/status_info_action_view

${ClickFundsCoin}          xpath=//android.widget.TextView[@text='${FundsCoin}']
${xrpqr}                    id=com.wrx.wazirx.stage:id/deposit_qr_image




${WithdrawButton}    id=com.wrx.wazirx.stage:id/wallet_withdraw_button
${addresspaste}     id=com.wrx.wazirx.stage:id/wallet_address_paste
${qrscanner}        id=com.wrx.wazirx.stage:id/wallet_withdraw_qr_btn
${WithdrawAll}      id=com.wrx.wazirx.stage:id/wallet_withdraw_all_btn
${DestinationAdd}       id=com.wrx.wazirx.stage:id/wallet_withdraw_address
${FinalWithdrawAmnt}        id=com.wrx.wazirx.stage:id/wallet_withdraw_final_amount
${memotag}              id=com.wrx.wazirx.stage:id/wallet_withdraw_tag

${FundsSearch}    id=com.wrx.wazirx.stage:id/wallet_header_search_field
${FundsSearchButton}    id=com.wrx.wazirx.stage:id/wallet_header_search_button
${SelectButton}    xpath=//android.view.ViewGroup[@index="3"]

${DepositAddress}    id=com.wrx.wazirx.stage:id/deposit_address_value
${Fees}           id=com.wrx.wazirx.stage:id/wallet_withdraw_fees
${WithdrawAll}    id=com.wrx.wazirx.stage:id/wallet_withdraw_all_btn
${Volume}         id=com.wrx.wazirx.stage:id/wallet_withdraw_amount
${WithdrawAddress}    id=com.wrx.wazirx.stage:id/wallet_withdraw_address
${Remarks}        id=com.wrx.wazirx.stage:id/wallet_withdraw_remarks
${TransferHistory}    xpath=//android.widget.TextView[@text="RECENT TRANSACTIONS"]
${TransferTable}    id=com.wrx.wazirx.stage:id/transaction_item_container
${Proceed}        id=com.wrx.wazirx.stage:id/wallet_withdrawal_action_button


${ConfirmWarning}       id=com.wrx.wazirx.stage:id/wd_confirm_warning
${CloseConfirm}         id=com.wrx.wazirx.stage:id/toolbar_button_close



${ConfirmDestAdd}       id=com.wrx.wazirx.stage:id/wd_confirm_address
${ConfirmMemoTag}       id=com.wrx.wazirx.stage:id/wd_confirm_tag
${ConfirmNetwork}       id=com.wrx.wazirx.stage:id/wd_confirm_network
${ConfirmAmount}       id=com.wrx.wazirx.stage:id/wd_confirm_amount
${ConfirmWithFee}       id=com.wrx.wazirx.stage:id/wd_confirm_fee
${ConfirmFinalAmount}       id=com.wrx.wazirx.stage:id/wd_confirm_final_amount
${ConfirmRemark}            id=com.wrx.wazirx.stage:id/wd_confirm_remarks
${ConfirmSlider}            id=com.wrx.wazirx.stage:id/slider_handle


${Open2FASettings}          xpath=//android.widget.Button[@text='Open 2FA Settings']
${CancelBtn}                   xpath=//android.widget.Button[@text='Cancel']
${OKBtn}                        xpath=//android.widget.Button[@text='OK']
${PhoneNo}                  	id=intl-tel-input
${SendOTP}                      xpath=//android.widget.Button[@text='Send OTP']
