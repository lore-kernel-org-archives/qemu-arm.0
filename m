Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp559212lfq;
        Fri, 8 Jan 2021 06:50:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzDB0aNNzbg9Cuvz53AJ6ZgpVHqay+/rSKP2En6p7KfOTnbdqsMVoMH3QISCrzUNA57U8Oj
X-Received: by 2002:a25:d24e:: with SMTP id j75mr5833576ybg.186.1610117424297;
        Fri, 08 Jan 2021 06:50:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610117424; cv=none;
        d=google.com; s=arc-20160816;
        b=UIypwbf8kyz2HNnbBqL+V4mi53BrN0My9CqvAiH1qtEwCDg8zNRo6Ut8sPcXJMDqqb
         XO7jXDTCROVeuZn1CFBINULdU4lMKRl+uQUfg0mZ4gP7ReQJSg5zKrOP79+qD2T76/b1
         uxvDQEOxpvU0BOYJrTn8qmJ6yS80svkM9FSryAOizKRI9vP6PUNZyi/afcKzxzXWgPIp
         SPMvQRMFp9SmG8Qove3vcR/YKa99sXr0jusspom/pVU0azR98/6GgDS0nJpJ/I+91OXB
         6oalaUlJaYAelZ/2WYXc/5PxoRHX0MUOFD0LPZAD/OEs5Lh0bu0tiw+/cDunpJ31ub8f
         C8fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EPrlCp8NjczREcv59nZpUeZQD3tdKHQamXpMTRmG/NE=;
        b=hWi8qvUOsOjTq8Bw9axVWWuBpRFB+GZGx8USeoRHVYOGwIM8h0eJlQvTuN8dPFF9AZ
         0nXimUDeohHMeKZoYxd3kXHEasuqYeptJzpHdkqJSR6s4nRRlx4fdQIFV/YngZksrpq2
         6gNjyLihl2N7E1phNE8qfRVJqVS7c9TNtCuTo8Vo/uGrrtdeyANnCej6mpiX0YYo058B
         QOKb8IfV/f95QN0j/mEtMuxlESWBNGoorBSmunuBVZFwUOtCOgnlkUZQT9y6ZywXfTxT
         vjAEtio6yVHx+nkVfTcpHqieI/A+X4fJxt22iQLYX+dIlx27S5GvchDKccGhYtPhLKoA
         2kRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qRt7mPVd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p197si11626719ybc.155.2021.01.08.06.50.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jan 2021 06:50:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qRt7mPVd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxt5r-00006b-O7
	for alex.bennee@linaro.org; Fri, 08 Jan 2021 09:50:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxt4x-00087c-NS
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 09:49:27 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:34518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxt4v-0002un-C2
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 09:49:27 -0500
Received: by mail-ej1-x62b.google.com with SMTP id g20so14929027ejb.1
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 06:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EPrlCp8NjczREcv59nZpUeZQD3tdKHQamXpMTRmG/NE=;
 b=qRt7mPVdi6i0OXx7q83lbdqMrI6t0AayzvJgQj8Iw35ln7dAbgLG25aVugw5NgQCvu
 hWZYcf3rrwHkDRE66an7JrfLxWWs1fR+emKJqaUw5/RWJ2nij2tf4rVSorADLrhYmcdY
 in397cOZms27hcpiFbVqJVon4kDDTVMCPhTbv1wRGDi3PqhK4kmVKvy32gIe5UPDPEKn
 BlhTgxfTS3Us0O0J0E3LCqz4zbrAOJNuC37Qlj1oz+eo5aj2xC5V7xOwjqbnkD231CIw
 koGJHmP5n5E2nICGZDEC1K41nzuvgRu6PY5jd7EclGZskNSFnfD5rydXv7UOciWDnK56
 pBIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EPrlCp8NjczREcv59nZpUeZQD3tdKHQamXpMTRmG/NE=;
 b=WZYk2urj+webchknQm1CP1k0D0B19pkyaeJw9UxZNHI8haF/Ezn8RESPZ0/va5fCZT
 9oVosxOJrA6IOFBVkVgP0BahkmCSHtnaNcINGcAqgCvAFiLUwff9dSdcFuO1khQlDBEl
 I3ePy6UxQ0tVQ/qrN++SVwENUtsXltM1CUgnykFnnXOwGhkW4nyH/bD8FXgB9GKuKrWB
 M0ajU6yWVlJ5lzYWTbEuDKOC84Qub9qeB5jyXmMJBGdQ+Qv4BZ3dovUx8d26xcsPBa0Q
 zNv+XaebNakDFTv5p8RK3cpAb0SABBaI9bJMvVx0o8ytq2Sq9ncwLhOnmUb/zkdpU13N
 ijYg==
X-Gm-Message-State: AOAM530WbWAkW8mK3uhFr4LnbGxgMmjmlqujicFWhArQ/scoYSK8naVK
 ITOTaOmGH0dGeRUwqme+sVaWYcDEjDhsdqPRvRd8zw==
X-Received: by 2002:a17:906:e250:: with SMTP id
 gq16mr2773095ejb.382.1610117363818; 
 Fri, 08 Jan 2021 06:49:23 -0800 (PST)
MIME-Version: 1.0
References: <1608182913-54603-1-git-send-email-bmeng.cn@gmail.com>
 <1608182913-54603-2-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1608182913-54603-2-git-send-email-bmeng.cn@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Jan 2021 14:49:12 +0000
Message-ID: <CAFEAcA84tudyJ7NBkKb1YGhV3p5EMZ+6dD7DJicNT_hk0w1sVg@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/ssi: imx_spi: Correct tx and rx fifo endianness
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Bin Meng <bin.meng@windriver.com>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mXNRNkRKsMRZ

On Thu, 17 Dec 2020 at 05:28, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> The endianness of data exchange between tx and rx fifo is incorrect.
> Earlier bytes are supposed to show up on MSB and later bytes on LSB,
> ie: in big endian. The manual does not explicitly say this, but the
> U-Boot and Linux driver codes have a swap on the data transferred
> to tx fifo and from rx fifo.

To check my understanding, if we have a burst length of 16 bits, say,
when we do the fifo32_pop() of a 32 bit word, where in that
word and which way round are the 2 bytes we are going to transfer ?

> With this change, U-Boot read from / write to SPI flash tests pass.
>
>   => sf test 1ff000 1000
>   SPI flash test:
>   0 erase: 0 ticks, 4096000 KiB/s 32768.000 Mbps
>   1 check: 3 ticks, 1333 KiB/s 10.664 Mbps
>   2 write: 235 ticks, 17 KiB/s 0.136 Mbps
>   3 read: 2 ticks, 2000 KiB/s 16.000 Mbps
>   Test passed
>   0 erase: 0 ticks, 4096000 KiB/s 32768.000 Mbps
>   1 check: 3 ticks, 1333 KiB/s 10.664 Mbps
>   2 write: 235 ticks, 17 KiB/s 0.136 Mbps
>   3 read: 2 ticks, 2000 KiB/s 16.000 Mbps
>
> Fixes: c906a3a01582 ("i.MX: Add the Freescale SPI Controller")
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>
> ---
>
>  hw/ssi/imx_spi.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
> index 509fb9f..71f0902 100644
> --- a/hw/ssi/imx_spi.c
> +++ b/hw/ssi/imx_spi.c
> @@ -156,13 +156,14 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
>  {
>      uint32_t tx;
>      uint32_t rx;
> +    uint32_t data;
> +    uint8_t byte;
>
>      DPRINTF("Begin: TX Fifo Size = %d, RX Fifo Size = %d\n",
>              fifo32_num_used(&s->tx_fifo), fifo32_num_used(&s->rx_fifo));
>
>      while (!fifo32_is_empty(&s->tx_fifo)) {
>          int tx_burst = 0;
> -        int index = 0;
>
>          if (s->burst_length <= 0) {
>              s->burst_length = imx_spi_burst_length(s);
> @@ -183,10 +184,18 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
>              tx_burst = 32;
>          }
>
> +        data = 0;
> +        for (int i = 0; i < tx_burst / 8; i++) {
> +            byte = tx & 0xff;
> +            tx = tx >> 8;
> +            data = (data << 8) | byte;
> +        }
> +        tx = data;
> +

Why carefully reverse the order of bytes in the word and then
take a byte at a time from the bottom of the word in the loop below,
when you could change the loop to take bytes from the top of the word
instead ?

>          rx = 0;
>
>          while (tx_burst > 0) {
> -            uint8_t byte = tx & 0xff;
> +            byte = tx & 0xff;
>
>              DPRINTF("writing 0x%02x\n", (uint32_t)byte);
>
> @@ -196,12 +205,11 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
>              DPRINTF("0x%02x read\n", (uint32_t)byte);
>
>              tx = tx >> 8;
> -            rx |= (byte << (index * 8));
> +            rx = (rx << 8) | byte;
>
>              /* Remove 8 bits from the actual burst */
>              tx_burst -= 8;
>              s->burst_length -= 8;
> -            index++;
>          }
>
>          DPRINTF("data rx:0x%08x\n", rx);
> --
> 2.7.4

thanks
-- PMM
