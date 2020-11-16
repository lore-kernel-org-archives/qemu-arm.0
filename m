Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3817453lfb;
        Mon, 16 Nov 2020 07:52:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwHLFGk89H19036MJnPp+oYAjYZF/OGoGuPzsW4tAZgtWOaJtltcWNYyzsRWVMO6LSNAR6m
X-Received: by 2002:a25:bfd2:: with SMTP id q18mr18335463ybm.187.1605541952711;
        Mon, 16 Nov 2020 07:52:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605541952; cv=none;
        d=google.com; s=arc-20160816;
        b=lpj1R0bKY4V3/6hyKiok7NP79+PNKuDOUoOMQu89xZt0poxYb/k/hYx9F7CMizlQd4
         /M0vVBdbRFFQb/bQ6KRQjWiiuRA4mT/cIMt9wsECJnipDsbfLH0HWJgKQ1PGU/W1bz6x
         2id2Sb1snlDVv/lJ6x1Qc8hIrgNE36aMBGevHx1a+IyyTro3wXShcnPm7Qq9PVrS5iwF
         rwGRm2C4WDb9qrpI+Ve1h0GfX3JUWCYkqFH/ShIiKBhixbiJ3sPSo6bedctzFGTxTUTj
         /BBFG1zoCu41HjZ3OBgFi1unFmdDNSYJGLk7kq4acpdkoUSly2krMKpyJc2OdZ2j/BEX
         TUeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=R0rX/kNZSwvKSrh96Zhu3HoPRziyEctQ6CeWLHmasBo=;
        b=FazaJyH2DGNz+qKtm5gt5T2Sk1qXwCTy7ICOOpo+w5ihN9FQr8eJkHoA9HXy1oVYjS
         AUtco7DJJ+Ml4TIdln8y7BcKkqj70oWeyQEgV3g+He6aCxpiUdxtCCV0pixeCfX3qq82
         nvKIRB5+hCfu8ZJHNuF6cuUYodEjlANAplUPTJ2fUFOBaGBPRheY19+U2QOdXIm2mXz3
         ARKR12UY59cs+Tf8RPJad/uZ4287ADaG+ZGDXGsUxA3l7NNhuaGkZV2NOB91LWbnNNUr
         QgsUBUTe8aqBk4Cc84TUvQtE104yFs5BAxJu1D0AD0AnqvhIOQlJ1XSWXEaFa5hVUZqQ
         ohLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ePHef1RG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o8si20460558yba.45.2020.11.16.07.52.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Nov 2020 07:52:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ePHef1RG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kegnw-0007cf-1n
	for alex.bennee@linaro.org; Mon, 16 Nov 2020 10:52:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kegnc-0007bY-7n
 for qemu-arm@nongnu.org; Mon, 16 Nov 2020 10:52:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kegnY-0002No-Hs
 for qemu-arm@nongnu.org; Mon, 16 Nov 2020 10:52:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605541926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R0rX/kNZSwvKSrh96Zhu3HoPRziyEctQ6CeWLHmasBo=;
 b=ePHef1RGPbxl/EZrEhTz72IVT17GUigFLfLua8c8yJWJmCq6L6OCJ9oI6ySbk85z7t0sR3
 nJVtwFM8jACOu9NKVp3V9CKW20hj8hzP/m2kZveQepTzkjxD0iKdnXFZpnJvrVT6w7hrJW
 1isNGYW1r1zCxsQ2d0K72owXaUIN1FE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-CVIUaUngOHWnuU26wVfROg-1; Mon, 16 Nov 2020 10:52:03 -0500
X-MC-Unique: CVIUaUngOHWnuU26wVfROg-1
Received: by mail-wm1-f72.google.com with SMTP id b206so8839460wmd.3
 for <qemu-arm@nongnu.org>; Mon, 16 Nov 2020 07:52:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=R0rX/kNZSwvKSrh96Zhu3HoPRziyEctQ6CeWLHmasBo=;
 b=UOqDIAzcIYccnecKKvkswAwhklJDOIpzutfOjskqIA+nXMHA4rb8+J9m5ynpUF7RHP
 mL5ueqk7FIoKovmifZNsnPfvtjEIz2g9zmV2znaZ47z3BBaF4p5+S/pVwB5r0poWKEHv
 rFjRFb+SVpWwq4H+1nMAldsBpj7GKn8oIyrRpfqtKVb2MyQLOgJc/MyH71mQtxEh8DQV
 rT1Qd14BQxPOYaYeqKBnG8brRuz5BxVjZM8v9tc8ONgn8TmbUa/v2BWIPXSLDXEVoCbA
 kykrcYZRclMqET2SL8dUioGyGDr56iiqc0sHAQq+UFR2PWAL8j0QIKSKt6Mfnvj0yRv6
 usvA==
X-Gm-Message-State: AOAM5300oB1AXJNjV+S4QvXPR5PBoPHA8pRP8k98BXyNOzKU5ttEjDVR
 rPgbuKfBoq9w4uLYBQx2hKNHbTzQE5u4VrSGRPQs0uUWc7hL4zLCZQT3NDQmFglJylY4YW4brsx
 IBaHbYYV+xYfbHqUFm7b4oX9bW0m4ASrIIGXdZJMbOSyRgM3BfY857Ya/DOjV6g==
X-Received: by 2002:a5d:654c:: with SMTP id z12mr19061690wrv.46.1605541921780; 
 Mon, 16 Nov 2020 07:52:01 -0800 (PST)
X-Received: by 2002:a5d:654c:: with SMTP id z12mr19061667wrv.46.1605541921544; 
 Mon, 16 Nov 2020 07:52:01 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id 30sm16532618wrd.88.2020.11.16.07.52.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2020 07:52:00 -0800 (PST)
Subject: Re: [PATCH] hw/char/cmsdk-apb-uart: Fix rx interrupt handling
To: Tadej Pecar <tpecar95@gmail.com>, qemu-devel@nongnu.org
References: <CAD-fBOBqRWQLW8xpJ+j8DSWeuDbCNEOr67uHqQJ+v=CwAFow7g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e01a895a-ef42-91f1-30e1-816f6e838a91@redhat.com>
Date: Mon, 16 Nov 2020 16:51:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAD-fBOBqRWQLW8xpJ+j8DSWeuDbCNEOr67uHqQJ+v=CwAFow7g@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:46:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 15Qf+RDRjnae

Hi Tadej,

On 11/16/20 4:11 PM, Tadej Pecar wrote:
> Previously, the RX interrupt got missed if:
> - the character backend provided the next character before the RX IRQ
> Handler
>   managed to clear the currently served interrupt.
> - the character backend provided the next character while the RX interrupt
>   was disabled. Enabling the interrupt did not trigger the interrupt
>   even if the RXFULL status bit was set.
> 
> Signed-off-by: Tadej P <tpecar95@gmail.com <mailto:tpecar95@gmail.com>>

Thanks for your patch!

Minor comment, your git seems mis-configured (full name is expected
here: Tadej Pecar).

You might fix by running in a shell:

$ git config user.name "Tadej Pecar"

See:
https://wiki.qemu.org/Contribute/SubmitAPatch#Patch_emails_must_include_a_Signed-off-by:_line

> ---
>  hw/char/cmsdk-apb-uart.c | 54 ++++++++++++++++++++++++++++------------
>  hw/char/trace-events     |  1 +
>  2 files changed, 39 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/char/cmsdk-apb-uart.c b/hw/char/cmsdk-apb-uart.c
> index 626b68f2ec..1b361bc4d6 100644
> --- a/hw/char/cmsdk-apb-uart.c
> +++ b/hw/char/cmsdk-apb-uart.c
> @@ -96,19 +96,34 @@ static void uart_update_parameters(CMSDKAPBUART *s)
>  
>  static void cmsdk_apb_uart_update(CMSDKAPBUART *s)
>  {
> -    /* update outbound irqs, including handling the way the rxo and txo
> -     * interrupt status bits are just logical AND of the overrun bit in
> -     * STATE and the overrun interrupt enable bit in CTRL.
> +    /*
> +     * update outbound irqs
> +     * (
> +     *     state     [rxo,  txo,  rxbf, txbf ] at bit [3, 2, 1, 0]
> +     *   | intstatus [rxo,  txo,  rx,   tx   ] at bit [3, 2, 1, 0]
> +     * )
> +     * & ctrl        [rxoe, txoe, rxe,  txe  ] at bit [5, 4, 3, 2]
> +     * = masked_intstatus
> +     *
> +     * state: status register
> +     * intstatus: pending interrupts and is sticky (has to be cleared
> by sw)
> +     * masked_intstatus: masked (by ctrl) pending interrupts
> +     *
> +     * intstatus [rxo, txo, rx] bits are set here
> +     * intstatus [tx] is managed in uart_transmit
>       */
> -    uint32_t omask = (R_INTSTATUS_RXO_MASK | R_INTSTATUS_TXO_MASK);
> -    s->intstatus &= ~omask;
> -    s->intstatus |= (s->state & (s->ctrl >> 2) & omask);
> -
> -    qemu_set_irq(s->txint, !!(s->intstatus & R_INTSTATUS_TX_MASK));
> -    qemu_set_irq(s->rxint, !!(s->intstatus & R_INTSTATUS_RX_MASK));
> -    qemu_set_irq(s->txovrint, !!(s->intstatus & R_INTSTATUS_TXO_MASK));
> -    qemu_set_irq(s->rxovrint, !!(s->intstatus & R_INTSTATUS_RXO_MASK));
> -    qemu_set_irq(s->uartint, !!(s->intstatus));
> +    s->intstatus |= s->state &
> +        (R_INTSTATUS_RXO_MASK | R_INTSTATUS_TXO_MASK |
> R_INTSTATUS_RX_MASK);
> +
> +    uint32_t masked_intstatus = s->intstatus & (s->ctrl >> 2);
> +
> +    trace_cmsdk_apb_uart_update(s->state, s->intstatus, masked_intstatus);
> +
> +    qemu_set_irq(s->txint,    !!(masked_intstatus & R_INTSTATUS_TX_MASK));
> +    qemu_set_irq(s->rxint,    !!(masked_intstatus & R_INTSTATUS_RX_MASK));
> +    qemu_set_irq(s->txovrint, !!(masked_intstatus & R_INTSTATUS_TXO_MASK));
> +    qemu_set_irq(s->rxovrint, !!(masked_intstatus & R_INTSTATUS_RXO_MASK));
> +    qemu_set_irq(s->uartint,  !!(masked_intstatus));
>  }
>  
>  static int uart_can_receive(void *opaque)
> @@ -144,9 +159,11 @@ static void uart_receive(void *opaque, const
> uint8_t *buf, int size)
>  
>      s->rxbuf = *buf;
>      s->state |= R_STATE_RXFULL_MASK;
> -    if (s->ctrl & R_CTRL_RX_INTEN_MASK) {
> -        s->intstatus |= R_INTSTATUS_RX_MASK;
> -    }
> +
> +    /*
> +     * Handled in cmsdk_apb_uart_update, in order to properly handle
> +     * pending rx interrupt when rxen gets enabled
> +     */
>      cmsdk_apb_uart_update(s);
>  }
>  
> @@ -278,7 +295,12 @@ static void uart_write(void *opaque, hwaddr offset,
> uint64_t value,
>           * is then reflected into the intstatus value by the update
> function).
>           */
>          s->state &= ~(value & (R_INTSTATUS_TXO_MASK |
> R_INTSTATUS_RXO_MASK));
> -        s->intstatus &= ~value;
> +
> +        /*
> +         * Clear rx interrupt status only if no pending character
> +         * (no buffer full asserted).
> +         */
> +        s->intstatus &= ~value | (s->state & R_STATE_RXFULL_MASK);
>          cmsdk_apb_uart_update(s);
>          break;
>      case A_BAUDDIV:
> diff --git a/hw/char/trace-events b/hw/char/trace-events
> index 81026f6612..0821c8eb3a 100644
> --- a/hw/char/trace-events
> +++ b/hw/char/trace-events
> @@ -68,6 +68,7 @@ pl011_put_fifo_full(void) "FIFO now full, RXFF set"
>  pl011_baudrate_change(unsigned int baudrate, uint64_t clock, uint32_t
> ibrd, uint32_t fbrd) "new baudrate %u (clk: %" PRIu64 "hz, ibrd: %"
> PRIu32 ", fbrd: %" PRIu32 ")"
>  
>  # cmsdk-apb-uart.c
> +cmsdk_apb_uart_update(uint32_t state, uint32_t intstatus, uint32_t
> masked_intstatus) "CMSDK APB UART update: state 0x%x intstatus 0x%x
> masked_intstatus 0x%x"
>  cmsdk_apb_uart_read(uint64_t offset, uint64_t data, unsigned size)
> "CMSDK APB UART read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
>  cmsdk_apb_uart_write(uint64_t offset, uint64_t data, unsigned size)
> "CMSDK APB UART write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
>  cmsdk_apb_uart_reset(void) "CMSDK APB UART: reset"
> --
> 2.29.2
> 

