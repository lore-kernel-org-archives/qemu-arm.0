Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1082525lfb;
        Wed, 1 Sep 2021 19:31:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz822jdIlvbxIha7Bdmm22nlfoqdztFMtQQu8LJS2pTE3jyip3jNr84KwSye36sA4hRxSpU
X-Received: by 2002:a05:622a:1:: with SMTP id x1mr918416qtw.198.1630549900112;
        Wed, 01 Sep 2021 19:31:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630549900; cv=none;
        d=google.com; s=arc-20160816;
        b=vC7pCxo9NFmZOHKZyb3nld9Uz5n4yv3nvDRLfjAdEj9/CmCK0cQau6QTBmzVBjNS+V
         eRrITSiGJVPbmrht7k+engsEKgDn4a3Zq2Qs4eeiUzmtvwZpHGeWi7eG9hqSJyLbdZ+c
         fjlHX55BcPmiveAC/ts/gt/TIVbphOj8H7lfkEqsGp7TwkMBPu/RfC3ya3bJ7hxGjAXa
         EPj98jL8pQtGjeEJIxi8mKXa1t5HpVZimXV9MnCG9jEkK5FHT+lrYQ3y88ZOfjg5d9m3
         7CznxDoOOmSZpNfTsiZulxWPFD4A1ls0KEOYAxgf+ZY5xtw7GOCAqVNkNveMO3/vvd1q
         K93Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=77asedd9W4bQbuo6UI9NfQGmGN3z8h5UpeipA8zxmys=;
        b=ClytimvkLmHwxns4w2vvkzBcAx7trNh3TK9yLQYtBTFS9tEpW3MD+ea3c4340fmp7M
         8+YuiZ54EzKP7++Mw+CgUsQtMXKK1x6R4S1qx7nbrzj+m1dj/dbltWbqGzTb4t5Dn7ac
         di4byk+llw/es7i92lr5miZ9s+30bFxleJ1wqLIrBO9wuAo/4WhuEzp98Yic3zLraWAh
         0q7VOylbdtXD/npPvkfrjh3tEUwLqW7mtAywQFo6/aiIUVbLP0KerixH5il5ygvn3lzR
         Jb+gn7AQxzJ+PoSSKe76KvyQzV/WStyjxj2yqOuWxN1IRylw82UqXDOiRgORvqIM2J92
         d0ng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=hSmSLrZS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y16si287841qko.365.2021.09.01.19.31.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Sep 2021 19:31:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=hSmSLrZS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLcVv-0007p1-Ee
	for alex.bennee@linaro.org; Wed, 01 Sep 2021 22:31:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mLcVZ-0007oY-Vn; Wed, 01 Sep 2021 22:31:18 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:41678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mLcVX-0007vi-MG; Wed, 01 Sep 2021 22:31:17 -0400
Received: by mail-io1-xd2b.google.com with SMTP id j18so576211ioj.8;
 Wed, 01 Sep 2021 19:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=77asedd9W4bQbuo6UI9NfQGmGN3z8h5UpeipA8zxmys=;
 b=hSmSLrZSQczWsIRnC99snYBV5SmYzEutCsPVCg2+q/fhWxPMuMpbqN24QhdK2pBmQX
 K85SPFye5Of2aX65vU6IUJTSroFMCGFYYB1FZ4LYmZLN/IvIosj6fIwBK6/OUdE0QYts
 hqO8OYYSZfTSfz0LoZV5VBTpKDDkPQEjbfQRiwDQVm6HZL75MRqtt6yNy+SHt4NNNfGE
 h7Yu8sHLiVm0nYgofUtEsRS+C7fLumL5hFd1ZtXbz1qp7lCYCAewqv4EDbU8IgdiYNM7
 Sl/Rdv4BtBFs5nfnkSLbxHi5QMx67zmeDDOrLlh4qZqbtqzeNa1MyRTNOvyPH6ANxtOE
 J9jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=77asedd9W4bQbuo6UI9NfQGmGN3z8h5UpeipA8zxmys=;
 b=qX43RW3nqFbXo/auMnuiMp4YbUvUGEa6OZ82u7D5OtBB8d3yMdVbIT5xr1FtJvWhdJ
 /0ZQIsiL73BbXl2olR1bhiLSVvXzRND8lyT+xQVrZPVgcB7IkB804+Oulc2bpjoyRA4p
 wxPO6AJA6P+vhYmgOAKoKlcjm7utNPot5Wx4MqGqeKy4ICsZb2bFgj5rNe1Ty7buIRk0
 KGdjHUYAsngaiaaZoN2EUK3MZQYnT5aCoLQ1F5Ho4T6p8pa1ZZQo2LdbeezGjDAh95hC
 CToQ/184CdQ/ANdxPSrAYjfEmUgx/FtPsEsPUTiFtVS2FOz3u6U9IUpWucVaQESsrJYE
 1Y6w==
X-Gm-Message-State: AOAM531RKyg3snorCEBvbC7cnhdMdz5giWdGzfUzsW2steLHPrCsUrie
 gh6NPwrgSjLRt6t+5Qi0rEtSQ4fei/yI4vAlFOQ=
X-Received: by 2002:a05:6638:2182:: with SMTP id
 s2mr863455jaj.26.1630549873758; 
 Wed, 01 Sep 2021 19:31:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210901032724.23256-1-bmeng.cn@gmail.com>
 <20210901032724.23256-4-bmeng.cn@gmail.com>
In-Reply-To: <20210901032724.23256-4-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Sep 2021 12:30:47 +1000
Message-ID: <CAKmqyKO+WvEFHOcifOOZNs57Ym7Zg4PACm=c0bDjsg32WQDgBw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] hw/char: cadence_uart: Move clock/reset check to
 uart_can_receive()
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P1/3NLDjpEEw

On Wed, Sep 1, 2021 at 1:28 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Currently the clock/reset check is done in uart_receive(), but we
> can move the check to uart_can_receive() which is earlier.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
>
> Changes in v2:
> - avoid declaring variables mid-scope
>
>  hw/char/cadence_uart.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> index 154be34992..fff8be3619 100644
> --- a/hw/char/cadence_uart.c
> +++ b/hw/char/cadence_uart.c
> @@ -235,8 +235,16 @@ static void uart_parameters_setup(CadenceUARTState *s)
>  static int uart_can_receive(void *opaque)
>  {
>      CadenceUARTState *s = opaque;
> -    int ret = MAX(CADENCE_UART_RX_FIFO_SIZE, CADENCE_UART_TX_FIFO_SIZE);
> -    uint32_t ch_mode = s->r[R_MR] & UART_MR_CHMODE;
> +    int ret;
> +    uint32_t ch_mode;
> +
> +    /* ignore characters when unclocked or in reset */
> +    if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
> +        return 0;
> +    }
> +
> +    ret = MAX(CADENCE_UART_RX_FIFO_SIZE, CADENCE_UART_TX_FIFO_SIZE);
> +    ch_mode = s->r[R_MR] & UART_MR_CHMODE;
>
>      if (ch_mode == NORMAL_MODE || ch_mode == ECHO_MODE) {
>          ret = MIN(ret, CADENCE_UART_RX_FIFO_SIZE - s->rx_count);
> @@ -358,11 +366,6 @@ static void uart_receive(void *opaque, const uint8_t *buf, int size)
>      CadenceUARTState *s = opaque;
>      uint32_t ch_mode = s->r[R_MR] & UART_MR_CHMODE;
>
> -    /* ignore characters when unclocked or in reset */
> -    if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
> -        return;
> -    }
> -
>      if (ch_mode == NORMAL_MODE || ch_mode == ECHO_MODE) {
>          uart_write_rx_fifo(opaque, buf, size);
>      }
> --
> 2.25.1
>
>
