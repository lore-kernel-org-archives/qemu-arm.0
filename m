Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp987222lfq;
        Fri, 8 Jan 2021 18:13:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxOv/A3r5xwgQqBS3Lps1QrjC7c98eL46doBi5yGlKYGi7T1WuvVFXkQeYEOsKyH/dtncRz
X-Received: by 2002:a25:3801:: with SMTP id f1mr10004063yba.321.1610158418079;
        Fri, 08 Jan 2021 18:13:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610158418; cv=none;
        d=google.com; s=arc-20160816;
        b=Xxap+SK96UD1GyKBTZjcZHX+GVDUR/6joMN2UQn008UQJeupfzzg0FQnj9CVPhQVOc
         iI6MkVJfgZN6yUx0jIk4mkc1I2Bn5f2WGA2TGY6TwKgDGXWZtDuMQSWzVzqwyf3FYFSO
         Cx49nej/3TnZMeETBg6WpQfjKXg2sWtv88RnF6azpqZU8fXeh6q4Yb0JQZxr0l8KMqV8
         vKBHkdEiajolnqRgXtGSz5R/IsRLtkyRUynnSzsXX8TfHxaVwmsfO1ohXQ3qhXAbYIx3
         0KZcz4xs2f8abEGY3Udzpwl4GYQ1aIvKxHeY2tcjareQMupOqWI4qJuE/8Ikrkp5lZn5
         Ipow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AmzsnuS1/ptNkKeTubhLjde1fJ6lG71g4whwGDpBGaY=;
        b=Ocdx7cRHh0q0cc+57PMXL9dGi8yw9hXSAHbJP6okzC/IXj+m/GErrLDclmD1IEueMV
         moTTSM0g4/CyRrlxHl3QrMKeoLIClsJOd1VhszNISMV9h2rWbWR1UD7u8cCTw86ndtTs
         amUxRrHJluJV0Y/4ExUGBZquPg/+u/6pzeBLAAh060hLsNtGf6FLltoj/Dk306GFnddG
         4whfU82ELCHSKx2UbY52C3IvXNgf/xpaDXjY4jmv7jC4MNY6g9QKl24tJm2t0cy5q59e
         prG6yMp52MMtpUcisECG01mJs09kcNeKOuNLq8Cl9BqZS7p/qRudsOO2H0zj7hEA4dDj
         UaYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=CBmP99ow;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j15si11213506ybp.485.2021.01.08.18.13.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jan 2021 18:13:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=CBmP99ow;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ky3l3-0006l9-G9
	for alex.bennee@linaro.org; Fri, 08 Jan 2021 21:13:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ky3kp-0006ku-HA; Fri, 08 Jan 2021 21:13:23 -0500
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:40695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ky3km-0004jz-UU; Fri, 08 Jan 2021 21:13:23 -0500
Received: by mail-yb1-xb36.google.com with SMTP id b64so11199776ybg.7;
 Fri, 08 Jan 2021 18:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AmzsnuS1/ptNkKeTubhLjde1fJ6lG71g4whwGDpBGaY=;
 b=CBmP99owggPuceNfVdRnDsAnlejjE1yh0JxCqwh7HAOTy2PXc9/W630y3zpDbY77nq
 HdPm9r+ehFP8n4xZuikewgrKWyRSatHg4swDsfy0ovQLwI+aEfsSuP3lpQKLX6hT6N10
 3aWgMns8HBle9SYs/cQatzk2mUhs1FoL/N7XrqubnETV/tNuF0DxaXNOJwjwBoUkw0NZ
 LrwoMWupm9T+HXJb8MiYIHmaPy4MM+q81shuWmVZ6r8fjjM2JNqu/MNNJtXECq8jY4fI
 3IPzCj/eZXPHmM8b1mIb8qo5wEgP1joL58dG5edcD555hs4X0bC02kNc30ZcIR5EWEsg
 al7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AmzsnuS1/ptNkKeTubhLjde1fJ6lG71g4whwGDpBGaY=;
 b=dCMQhauTIdrw+E7w9ib47vtw41EOmHFShYv7sXNnAM1sDODSRZhu+NjYcRERgbBcmD
 Y68l62NoObVmF1N4Blu++lFkwGUxXF2i6J9/5LEmKXL6QNlLU52svEeTe1fU+mSn3AWD
 HWEnYQL4RzJ9BICAyd8+xmyNvfCCsKKdB+D29o+zj9RQjT4jgbQaN1IZEcWe8vMA+Aom
 O/pEuirIFcwmOoMa+XOkxjxcEsjHeZxMouAITkGsRZh4akqO8Vqfixe0SF1qzWyTyCzW
 xqLfO0s1yjduXxx+5ocNqX8puh7raXfn/pH/rhi50rBQv3phKlJUgcI9t2/aPjPdelX9
 uBbg==
X-Gm-Message-State: AOAM5302H7dnjVPAYQtc9qGPuhVki70MT5tdmFYZSwH5JohKBzqEx3sR
 ZVCN7OzWjyGfWrvP0W30Jok9abCRyoUm3dyHBrA=
X-Received: by 2002:a25:4744:: with SMTP id u65mr10641312yba.239.1610158399626; 
 Fri, 08 Jan 2021 18:13:19 -0800 (PST)
MIME-Version: 1.0
References: <1608182913-54603-1-git-send-email-bmeng.cn@gmail.com>
 <1608182913-54603-2-git-send-email-bmeng.cn@gmail.com>
 <CAFEAcA84tudyJ7NBkKb1YGhV3p5EMZ+6dD7DJicNT_hk0w1sVg@mail.gmail.com>
In-Reply-To: <CAFEAcA84tudyJ7NBkKb1YGhV3p5EMZ+6dD7DJicNT_hk0w1sVg@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 9 Jan 2021 10:13:08 +0800
Message-ID: <CAEUhbmV0cRrocZYFBaFmBw3rWv7Pf2bLfzocMN2zRPtc_BNx2Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/ssi: imx_spi: Correct tx and rx fifo endianness
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /C6teXCpScJl

Hi Peter,

On Fri, Jan 8, 2021 at 10:49 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 17 Dec 2020 at 05:28, Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > The endianness of data exchange between tx and rx fifo is incorrect.
> > Earlier bytes are supposed to show up on MSB and later bytes on LSB,
> > ie: in big endian. The manual does not explicitly say this, but the
> > U-Boot and Linux driver codes have a swap on the data transferred
> > to tx fifo and from rx fifo.
>
> To check my understanding, if we have a burst length of 16 bits, say,
> when we do the fifo32_pop() of a 32 bit word, where in that
> word and which way round are the 2 bytes we are going to transfer ?

Say the fifo was written with a value of 0x00001234 when the burst
length is 16 bits, 0x12 will be transferred first then followed by
0x34.

>
> > With this change, U-Boot read from / write to SPI flash tests pass.
> >
> >   => sf test 1ff000 1000
> >   SPI flash test:
> >   0 erase: 0 ticks, 4096000 KiB/s 32768.000 Mbps
> >   1 check: 3 ticks, 1333 KiB/s 10.664 Mbps
> >   2 write: 235 ticks, 17 KiB/s 0.136 Mbps
> >   3 read: 2 ticks, 2000 KiB/s 16.000 Mbps
> >   Test passed
> >   0 erase: 0 ticks, 4096000 KiB/s 32768.000 Mbps
> >   1 check: 3 ticks, 1333 KiB/s 10.664 Mbps
> >   2 write: 235 ticks, 17 KiB/s 0.136 Mbps
> >   3 read: 2 ticks, 2000 KiB/s 16.000 Mbps
> >
> > Fixes: c906a3a01582 ("i.MX: Add the Freescale SPI Controller")
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >
> > ---
> >
> >  hw/ssi/imx_spi.c | 16 ++++++++++++----
> >  1 file changed, 12 insertions(+), 4 deletions(-)
> >
> > diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
> > index 509fb9f..71f0902 100644
> > --- a/hw/ssi/imx_spi.c
> > +++ b/hw/ssi/imx_spi.c
> > @@ -156,13 +156,14 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
> >  {
> >      uint32_t tx;
> >      uint32_t rx;
> > +    uint32_t data;
> > +    uint8_t byte;
> >
> >      DPRINTF("Begin: TX Fifo Size = %d, RX Fifo Size = %d\n",
> >              fifo32_num_used(&s->tx_fifo), fifo32_num_used(&s->rx_fifo));
> >
> >      while (!fifo32_is_empty(&s->tx_fifo)) {
> >          int tx_burst = 0;
> > -        int index = 0;
> >
> >          if (s->burst_length <= 0) {
> >              s->burst_length = imx_spi_burst_length(s);
> > @@ -183,10 +184,18 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
> >              tx_burst = 32;
> >          }
> >
> > +        data = 0;
> > +        for (int i = 0; i < tx_burst / 8; i++) {
> > +            byte = tx & 0xff;
> > +            tx = tx >> 8;
> > +            data = (data << 8) | byte;
> > +        }
> > +        tx = data;
> > +
>
> Why carefully reverse the order of bytes in the word and then
> take a byte at a time from the bottom of the word in the loop below,
> when you could change the loop to take bytes from the top of the word
> instead ?

Ah, yes, this can be rewritten to simplify a little.

>
> >          rx = 0;
> >
> >          while (tx_burst > 0) {
> > -            uint8_t byte = tx & 0xff;
> > +            byte = tx & 0xff;
> >
> >              DPRINTF("writing 0x%02x\n", (uint32_t)byte);
> >
> > @@ -196,12 +205,11 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
> >              DPRINTF("0x%02x read\n", (uint32_t)byte);
> >
> >              tx = tx >> 8;
> > -            rx |= (byte << (index * 8));
> > +            rx = (rx << 8) | byte;
> >
> >              /* Remove 8 bits from the actual burst */
> >              tx_burst -= 8;
> >              s->burst_length -= 8;
> > -            index++;
> >          }
> >
> >          DPRINTF("data rx:0x%08x\n", rx);
> > --

Regards,
Bin
