Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1735667lfb;
        Thu, 21 May 2020 09:42:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYh1YRgZHNLCWSNEKRFVrqT1VVfirHN0QyhrEsi/6fF+iiPfwahAsa2FYYKH2t59GjQA6D
X-Received: by 2002:a25:bd8f:: with SMTP id f15mr17242169ybh.96.1590079337663;
        Thu, 21 May 2020 09:42:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590079337; cv=none;
        d=google.com; s=arc-20160816;
        b=ETJepAYVxPS2gPiWEZVOwfI8nWLnsiCjHAz2qJGHEa1d22R6VkYm7VCrhNoVgOXSyp
         FeN+IT6f0t5GT7Y5O0QyFgwvgqkLBmUD2BWptyn5Dlj70En/JNd3DOb8TLON5/j3uZQF
         7WrYDC0UF2TRO8OqhtWLDe56dLsdNBDBe/9XxYQ4FJniiLIkVNtv8UfR+I1XceGMnlpy
         ar5kekHwvt2Y2PUb4cuSoo93dT8B0os0mXBsZwjiG/htleWpk8gsHjTvACsx53aioNKg
         vgWQTBqyOVzXEOVlO1kz1KQZA35uohxzM4Ts4AENjZj5xdz/20YR5II3eOrQR+H8TD07
         6V4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8E/poLvZzRLPdzPli9ukalkP/v2cZkBvpmdtH4RI/Xw=;
        b=Q1647ahWHh2cLmjy4Hy5SUpbs1EYs4myx/XuIG6DMMcJX5nq1VlvOUiVlW1y781B/X
         DDPfIYfP9pOARXmI131sNVUbyFySRI0k5pD5p5P6udROnACZE5pED+HVmf4HuHUwj12L
         z/5HALxnbKIwDlImYngH4PhYnI8Fxd2cDdr977MK4KCGwEaB+rOH4ZL7CKx8r1M6dxI8
         fu1hoTTSfIDJ0zRZ00F405dtlChLLYbvzi15SYHK1Te6aUNnZtywsRRxeZsYwkQXBUik
         8D9Li1/rx2ZogEgkZQNmu1+Gar+tVJXEOqwvStlYdzf5O3dUQy33nLgsd7+WQpjG8QOh
         c7sQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eZyh2Eor;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c9si5494899ybq.416.2020.05.21.09.42.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 May 2020 09:42:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eZyh2Eor;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jboGv-0000Ky-1C
	for alex.bennee@linaro.org; Thu, 21 May 2020 12:42:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jboGn-0000K6-Rk
 for qemu-arm@nongnu.org; Thu, 21 May 2020 12:42:09 -0400
Received: from mail-oo1-xc42.google.com ([2607:f8b0:4864:20::c42]:45845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jboGm-0006Cs-0E
 for qemu-arm@nongnu.org; Thu, 21 May 2020 12:42:09 -0400
Received: by mail-oo1-xc42.google.com with SMTP id p123so1559523oop.12
 for <qemu-arm@nongnu.org>; Thu, 21 May 2020 09:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8E/poLvZzRLPdzPli9ukalkP/v2cZkBvpmdtH4RI/Xw=;
 b=eZyh2EoreYs9k+rK4XeDxZjRuLGsib1jv0W4KOn56jGEojb40/3eb50axs3BMKnQPM
 6XbixvXJO3pPXEB9VDCg+vPsG1P/CGC0RjEPRxX8M/60v8fjL638Fnu72hQQcFvsRg2+
 5M1ag/fFMd59yYu+cf3e5q2WoWBd3unUcPpwG2LxUhcsQH7atfUzMZYjbm6mu/p8qkZR
 XllEVAN6urSoeUif2kWQzcKkmNv5ZHcuRsReMAHNYGzNHMs360jE9GxWispRTPPeOJ/Y
 Ml9go81xBH8Xt6JCm3UrtqdYzDubzKURrGDcnzXhbSotjP/lcmPBOki+k7g72y4czfhp
 dWrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8E/poLvZzRLPdzPli9ukalkP/v2cZkBvpmdtH4RI/Xw=;
 b=KffpYez77KJFLd/iv80QX95CFv7R3K8Ez+1OP4oDaFH1BmXElUtZOiF7Q3PeGcxSx4
 5QP3NPa2UEJdxnfylm1zdbK13wKiu1r1b+LUEonjpkBqLLrotX0oXaCNb/WdV9tCWDvR
 LD2XaOwpVXtIW+I35HPYhz7q4hXqyKXAvHOpSjxmO8LL9K9yzjLNNqn8VjQsSFwn8+IE
 HIaWb4kK8OWepb/f3yKcHi1AQUF4JUSG7kV+4iNOnmPaloUqIBe1SqttoZyWYhwjPCcw
 j8tpvPFhrbIYD34R0oFCKWffnrtNcOCOjeQ3pFLJe3tS3WiMi15eUss17blCAKl4zZSj
 SZUg==
X-Gm-Message-State: AOAM5330FlK8T7ak3nbvoeOJCsBT6YIdiaoZz5OoHIqNRcpzdT/7M5K2
 g2VtD3Myjpd12iu4SKZSjBSC7PtEHY/zTAnOZAeA/w==
X-Received: by 2002:a4a:3556:: with SMTP id w22mr7967412oog.20.1590079326635; 
 Thu, 21 May 2020 09:42:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200520143255.27235-1-e.mikitas@gmail.com>
In-Reply-To: <20200520143255.27235-1-e.mikitas@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 May 2020 17:41:55 +0100
Message-ID: <CAFEAcA_i=HsBtpJh_o4+NWNeUihvNTccfB67gs0WrXttYdTc2A@mail.gmail.com>
Subject: Re: [PATCH] ssi/imx_spi: Removed unnecessary cast and fixed condition
 in while statement
To: Eden Mikitas <e.mikitas@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c42;
 envelope-from=peter.maydell@linaro.org; helo=mail-oo1-xc42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 "open list:i.MX31 \(kzm\)" <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AJ2yLn0tWvde

On Wed, 20 May 2020 at 15:33, Eden Mikitas <e.mikitas@gmail.com> wrote:
> When inserting the value retrieved (rx) from the spi slave, rx is pushed to
> rx_fifo after being cast to uint8_t. rx_fifo is a fifo32, and the rx
> register the driver uses is also 32 bit. This zeroes the 24 most
> significant bits of rx. This proved problematic with devices that expect to
> use the whole 32 bits of the rx register.
> I tested this change by running `make check` and by booting linux on
> sabrelite (which uses an spi flash device).
>
> Signed-off-by: Eden Mikitas <e.mikitas@gmail.com>
> ---
>  hw/ssi/imx_spi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
> index 2dd9a631e1..43b2f14dd2 100644
> --- a/hw/ssi/imx_spi.c
> +++ b/hw/ssi/imx_spi.c
> @@ -182,7 +182,7 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
>
>          rx = 0;
>
> -        while (tx_burst) {
> +        while (tx_burst > 0) {
>              uint8_t byte = tx & 0xff;

When does this make a difference? Looking at the code
I don't think tx_burst can ever be negative at this
point, in which case the two conditions are equivalent.
What was the motivation for this change?

>              DPRINTF("writing 0x%02x\n", (uint32_t)byte);
> @@ -206,7 +206,7 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
>          if (fifo32_is_full(&s->rx_fifo)) {
>              s->regs[ECSPI_STATREG] |= ECSPI_STATREG_RO;
>          } else {
> -            fifo32_push(&s->rx_fifo, (uint8_t)rx);
> +            fifo32_push(&s->rx_fifo, rx);
>          }
>
>          if (s->burst_length <= 0) {

This seems like a separate change to the first one;
in general unrelated changes should be each in their
own patch, rather than combined into a single patch.

The fifo32_push() part of this change looks correct to me.

thanks
-- PMM
