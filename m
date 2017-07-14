Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id u187sm3066295wmd.26.2017.07.14.09.11.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Jul 2017 09:11:42 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 92A7F3E00CD;
	Fri, 14 Jul 2017 17:11:41 +0100 (BST)
References: <1500029487-14822-1-git-send-email-peter.maydell@linaro.org> <1500029487-14822-3-git-send-email-peter.maydell@linaro.org> <87mv87uj9r.fsf@linaro.org> <CAFEAcA_NJpj_vigDCr8dy_OH5J4T50caAGFHZPC5a+nhdTH2Uw@mail.gmail.com>
User-agent: mu4e 0.9.19; emacs 25.2.50.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@xilinx.com>, Philippe =?utf-8?Q?Mathie?=
 =?utf-8?Q?u-Daud=C3=A9?= <f4bug@amsat.org>, "patches\@linaro.org"
 <patches@linaro.org>
Subject: Re: [Qemu-arm] [PATCH v2 2/9] hw/char/cmsdk-apb-uart.c: Implement CMSDK APB UART
In-reply-to: <CAFEAcA_NJpj_vigDCr8dy_OH5J4T50caAGFHZPC5a+nhdTH2Uw@mail.gmail.com>
Date: Fri, 14 Jul 2017 17:11:41 +0100
Message-ID: <87k23buhfm.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: aH9WG3wPmnnS


Peter Maydell <peter.maydell@linaro.org> writes:

> On 14 July 2017 at 16:32, Alex Bennée <alex.bennee@linaro.org> wrote:
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>>> Implement a model of the simple "APB UART" provided in
>>> the Cortex-M System Design Kit (CMSDK).
>>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>
>> This fails to compile, I think since
>> 81517ba37a6cec59f92396b4722861868eb0a500 change the API for
>> qemu_chr_fe_set_handlers.
>
>>> +static void cmsdk_apb_uart_update(CMSDKAPBUART *s)
>>> +{
>>> +    /* update outbound irqs, including handling the way the rxo and txo
>>> +     * interrupt status bits are just logical AND of the overrun bit in
>>> +     * STATE and the overrun interrupt enable bit in CTRL.
>>> +     */
>>> +    uint32_t omask = (R_INTSTATUS_RXO_MASK | R_INTSTATUS_TXO_MASK);
>>> +    s->intstatus &= ~omask;
>>> +    s->intstatus |= (s->state & (s->ctrl >> 2) & omask);
>>> +
>>> +    qemu_set_irq(s->txint, !!(s->intstatus & R_INTSTATUS_TX_MASK));
>>> +    qemu_set_irq(s->rxint, !!(s->intstatus & R_INTSTATUS_RX_MASK));
>>> +    qemu_set_irq(s->txovrint, !!(s->intstatus & R_INTSTATUS_TXO_MASK));
>>> +    qemu_set_irq(s->rxovrint, !!(s->intstatus & R_INTSTATUS_RXO_MASK));
>>> +    qemu_set_irq(s->uartint, !!(s->intstatus));
>>
>> If we updated qemu_set_irq to take a bool instead of int would the !!
>> hack no longer be needed?
>
> I am fairly sure we have a few places that utilize the ability
> to send an integer down the qemu_irq channel.
>
>>> +    case A_STATE:
>>> +        /* Bits 0 and 1 are read only; bits 2 and 3 are W1C */
>>> +        s->state &= ~(value & 0xc);
>>
>> I guess:
>>           s->state &= ~(value & (R_STATE_TXOVERRUN_MASK | R_STATE_RXOVERRUN_MASK));
>>
>> maybe a little too verbose.
>
> Well, it probably ought to use the bit mask names, yes.
>
>>> +static void cmsdk_apb_uart_realize(DeviceState *dev, Error **errp)
>>> +{
>>> +    CMSDKAPBUART *s = CMSDK_APB_UART(dev);
>>> +
>>> +    if (s->pclk_frq == 0) {
>>> +        error_setg(errp, "CMSDK APB UART: pclk-frq property must be set");
>>> +        return;
>>> +    }
>>> +
>>> +    /* This UART has no flow control, so we do not need to register
>>> +     * an event handler to deal with CHR_EVENT_BREAK.
>>> +     */
>>> +    qemu_chr_fe_set_handlers(&s->chr, uart_can_receive, uart_receive,
>>> +                             NULL, s, NULL, true);
>>
>> I think this is now:
>>
>>     qemu_chr_fe_set_handlers(&s->chr, uart_can_receive, uart_receive,
>>                              NULL, NULL, s, NULL, true);
>
> Yes. It looks like we don't have to support backend swaps
> (only hw/char/serial.c and virtio-console have support for that),
> so just the extra NULL argument will do fine.
>
> I propose to just fix both these nits in target-arm rather
> than resend.

Sure.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

>
> thanks
> -- PMM


--
Alex Bennée
