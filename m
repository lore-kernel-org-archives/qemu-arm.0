Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3461052lfq;
        Tue, 12 Jan 2021 03:24:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyjXrkMxOX33O+x+7j5tRLdBSs0bG7FAK91/uKdEytveoEhzk1NecDkRlwWkbNTyoTcqFe1
X-Received: by 2002:a25:4015:: with SMTP id n21mr5928564yba.192.1610450691389;
        Tue, 12 Jan 2021 03:24:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610450691; cv=none;
        d=google.com; s=arc-20160816;
        b=YB0eQzjeNcFxJLCVLBacwda7ISvYJd+Q7AxFUoEZERm2AM7L5HUvaULAqtVq+e11kR
         RTRVKXvIJ4K7N2GuTAFrGah1YU2uJwRhOXdAP61jvDXOLl7sIFF0vfityYXNmlvCEtAZ
         Nb+pywM6EvOtrf9imzLO0FCETp68RfF4c8ey8We1eFg5FhxLcRy52vtUhRyiIAurGthe
         ZoYCK2KOBlzEQalXv/4M/9COw5+5/g5daSM3ZfznJ/ucIMUqhH5e84tbmRaV6ZqNVeys
         TGPofHXS7ki0RrdmtfDtNWS++q78brFABA05cyp7DKvNxSzlY61yZjaPjfgw3Zb5McDF
         4qzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bZLwrZ3xxdQz7uKoyvX1GiJCdl4sjF6OsI7zd0fu4rU=;
        b=l2gn8RJPwREa6LhLw50PiJY7H3n6LvGRT83UUcyDvUzUld1Th9OITYiO4e7ogPLGgq
         KmLhes+VLbmny3/g5pYmlwR3liC4AM04wZBK5pjPHrIay2PpXm4c1fA5BcnBrjbN6JMb
         MorK1jj1UcmZbUTswZejINoIHiFLT7ohJkT6Rw3kQ/DLfsUuE2z6f73jEb73zt406PSI
         4F8aZbC/T0ic+g/Dnyz+yT0VtsElM7Z9YPZ4UsKf6CW1itE4XbHcH/CsZuFFwj0+Mi0B
         EcqGJdD9rmjz8adUJk/6DIfimnoDFTGbtftAHuLrANfkXoXjvYjWS9geYRJCv6aJfW2Q
         QEYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eAVVUDtr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y5si2620958yba.276.2021.01.12.03.24.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jan 2021 03:24:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eAVVUDtr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzHn8-0006It-Ql
	for alex.bennee@linaro.org; Tue, 12 Jan 2021 06:24:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzHBx-0004TX-6N
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 05:46:25 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:38292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzHBv-0003mn-1B
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 05:46:24 -0500
Received: by mail-ed1-x532.google.com with SMTP id w10so840753edu.5
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 02:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bZLwrZ3xxdQz7uKoyvX1GiJCdl4sjF6OsI7zd0fu4rU=;
 b=eAVVUDtr9wGPdzlYYg+Hui3CJh3BU9Q5DyppwGfYEnhbFnSZNPV0M//NYInKK+kHVy
 Ei3Nu+u+2+9WES8MNTCNArTK/U9uAU0m4rgFVo59HhWGjZBMt48B5kt3E9LDoLXo397V
 QYUby8IhQhnmVPepdgy25Mqf8KHiETLRxu4ypqVKjPt5xIjfeCtCB3wz3buTCtJhWX5m
 XO+OJJsnyf/U+XynaRpX4vldVhZg2QcLv7Kuy6yHqt+pY6GFn2yN0WhHxbFrcscrh9p8
 VeZ18aKk47RxJVbzLf4pQwDe7XzbfBB/ZQSskinIwJkgrYvBzUTE579+wKgQdgxTFtT/
 A97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bZLwrZ3xxdQz7uKoyvX1GiJCdl4sjF6OsI7zd0fu4rU=;
 b=Leb3hvkdbJ1Ug9nV4WrleSb/Y3L5CqIAtYWY3RkJNg6ovcOELINQ4hP95TxB/s1/g3
 YvYoPcvt4qOEGixi/pR8ZoUKd+swFax/eX/h0JiGsSlUGk9FiiuFMZYPMBZzrheb0Nvq
 EfhlPYQf08SLlCeY9rZDlVfVCeI0DsM2Z2OO8IYlfOoGL3TWDymvb37rBHbUIi1/w0xZ
 YT+W8yGj+QWYEkKDRPE/8ja+5fbkXnzTKf7Fo44N6y04gmz5MLWRYHH0lBPjHLoa76Mj
 O6KYfDzFfqqkBmEPmbTVr+teq2fojo3q1jq/cRjvIXXju3udU+AWiXk643Wb6gKur8pm
 2CHg==
X-Gm-Message-State: AOAM533UT8Hd+AM5i6c3tHS7ZsqFYhUv6VecnrfYNlEGhJZJY3XXlP2y
 YRV+MBX107nwpHMAe6FN1+VxPpjE64yCuIgB8OgeHg==
X-Received: by 2002:a05:6402:366:: with SMTP id
 s6mr2825367edw.44.1610448381006; 
 Tue, 12 Jan 2021 02:46:21 -0800 (PST)
MIME-Version: 1.0
References: <20210110081429.10126-1-bmeng.cn@gmail.com>
 <20210110081429.10126-7-bmeng.cn@gmail.com>
In-Reply-To: <20210110081429.10126-7-bmeng.cn@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Jan 2021 10:46:09 +0000
Message-ID: <CAFEAcA-RPxLHSVuGDk=Wn-+2kGG6+L_VQfkiaGNEfJ8X1-Mkzg@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] hw/ssi: imx_spi: Correct tx and rx fifo endianness
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SdxfrikItuhu

On Sun, 10 Jan 2021 at 08:15, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> The endianness of data exchange between tx and rx fifo is incorrect.
> Earlier bytes are supposed to show up on MSB and later bytes on LSB,
> ie: in big endian. The manual does not explicitly say this, but the
> U-Boot and Linux driver codes have a swap on the data transferred
> to tx fifo and from rx fifo.
>
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
> (no changes since v3)
>
> Changes in v3:
> - Simplify the tx fifo endianness handling
>
>  hw/ssi/imx_spi.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
> index 47c8a0f572..b5124a6426 100644
> --- a/hw/ssi/imx_spi.c
> +++ b/hw/ssi/imx_spi.c
> @@ -171,7 +171,6 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
>
>      while (!fifo32_is_empty(&s->tx_fifo)) {
>          int tx_burst = 0;
> -        int index = 0;
>
>          if (s->burst_length <= 0) {
>              s->burst_length = imx_spi_burst_length(s);
> @@ -192,7 +191,7 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
>          rx = 0;
>
>          while (tx_burst > 0) {
> -            uint8_t byte = tx & 0xff;
> +            uint8_t byte = tx >> (tx_burst - 8);
>
>              DPRINTF("writing 0x%02x\n", (uint32_t)byte);
>
> @@ -201,13 +200,11 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
>
>              DPRINTF("0x%02x read\n", (uint32_t)byte);
>
> -            tx = tx >> 8;
> -            rx |= (byte << (index * 8));
> +            rx = (rx << 8) | byte;
>
>              /* Remove 8 bits from the actual burst */
>              tx_burst -= 8;
>              s->burst_length -= 8;
> -            index++;
>          }

This version of the loop definitely looks a lot neater. However,
looking at the code I don't think there's anything that forces the
guest to set a burst length that's a multiple of 8, so you need
to handle that somehow. Otherwise on the last time through the
loop (tx_burst - 8) can be negative, which is undefined behaviour
when you try to shift by it.

I think just rounding tx_burst up to a multiple of 8 before
the start of the loop would do the right thing ?

thanks
-- PMM
