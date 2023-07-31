*** Settings ***
Library    OperatingSystem
Library    RPA.Email.ImapSmtp
Variables    config.py
Documentation       Template robot main suite.
#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

*** Tasks ***
Hello World
    Create File    outputs/hello_world.txt    Hello World!
    Authorize Smtp    ${smtp_account}    ${smtp_password}    ${smtp_server}    ${smtp_port}
    Send Message    ${smtp_account}    jeremy.young@centricconsulting.com    Hello World    This is a test
