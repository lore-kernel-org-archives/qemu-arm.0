Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1091948lfb;
        Wed, 1 Sep 2021 19:51:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvABYiAm0YR2vXpVMwAnAlMjGmMStQfLqOEb1TdZuOc/+Xhaw8Y0M8ZHvfzxoHmkeCcnYK
X-Received: by 2002:a25:74ca:: with SMTP id p193mr1441116ybc.28.1630551097964;
        Wed, 01 Sep 2021 19:51:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630551097; cv=none;
        d=google.com; s=arc-20160816;
        b=x8bN1GfSWtuAzle3icAzgyj4JBODfk5LnH1582JpjLQUw1xAAsxTdEM4Nuj3PJEXqx
         B7THdExC+dkIQBGHb5akx894mMGYLkDG8jdz73xyVLLrh+mtBd/cHXBmrFapgfE9hutX
         bFp3lJKizpraHOck3VWCmn51qKZ1IUIM/6ZI2fOrpL5WS8nsZIqUNirFWTn6hSpUSa+/
         BGlV0/BE/COHiCjkkKYjhiF5zot9jHpkr5xod557H9mnlqBOtjhlUH+2r+n0NwkH77TC
         lsjfZCdAfPGVIdOCCVMEImxnqE+wBAw4fExsGi4W0x7QLJgmsge8+wfoKxN95zBFyngR
         uJBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qmg8Wz97vw+J4eGYexburl1dF0+BJrjJC3ZmvdxH8qo=;
        b=W3CaFuSguZ1majmUz+LA3M2k+OioV4sZImuq6FAMgFWW3KDK2lAkLNlpe4MREpbJVt
         wMSmpX0oD8IJkMn8amHHU+r/09ynHIP7zHWlouK0DdUGXc+N04EZTS9xrvFvBcUYUv7g
         fiSvUApZBxOKH0PQwePwNF0WGNc1iiYU3mRbMbDrxMK8yqc02bSgCs2Sx1MLXTOiQ9pE
         tIaDtOim3rhZwYxUDACe6Wzl3antC5pV99sf/EEcZQF7BqkbfxE2/Ew+Ypx3jrU0IzPB
         G3GZW3Sh7x0Jw83vu1giu169iKhsYOYc/SbxOPO1pKRjAeWLXNS4BdoWN8MkNwUusLwi
         nAEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=dDE2gytU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d88si755610ybi.490.2021.09.01.19.51.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Sep 2021 19:51:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=dDE2gytU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:33870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLcpE-0000N7-7B
	for alex.bennee@linaro.org; Wed, 01 Sep 2021 22:51:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mLcp1-0000Ir-95; Wed, 01 Sep 2021 22:51:23 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:43742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mLcoy-0006FX-7X; Wed, 01 Sep 2021 22:51:23 -0400
Received: by mail-il1-x12a.google.com with SMTP id v16so306474ilo.10;
 Wed, 01 Sep 2021 19:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qmg8Wz97vw+J4eGYexburl1dF0+BJrjJC3ZmvdxH8qo=;
 b=dDE2gytUJZCAoGhxinXs2WmEq1LKQq0JCWJDMCmZ5ciCDuI8SfAQYrnCnQ7hUioLYG
 LiF9WRpsbGrlsh4B21yl5dck+R29DOZwFXsKxUw/bAak1Tx/B+/NJvnwFORY+F2swWr0
 Nai9ehjm6bP1Z8gYrjclGBSuh6Qem2BvJ1nQIkPPQRSfT7hOI66irgID4JYWg/gDweMD
 mxt5yT70Y+9aZfB8GMoua1wXpsPyK4nuwGbXW084D2drEuEB1qV+TNc8HwL7VgBcXKEP
 BghPms89nJmpBuWqzVFQPITyWbbAPQisQfwviu62CvjaY+VFKg9ygCIuofQ8R88DWRyb
 wIzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qmg8Wz97vw+J4eGYexburl1dF0+BJrjJC3ZmvdxH8qo=;
 b=UysFYfAbWnv5c5MEAWcj01fHkLsJwDXV5xXXJKbCdsYWRhCCc2zY9Jfpx4F9w51fbZ
 JDvX37qT7UZMf7W6eh9B2BzaNPuVwABAwUTm3po7OLJa21Af9bo7DGUsQeXufGDrLgmz
 sBjUO7OUTG96GKaRSD7brJPwhI1ks3PGc06dXxWFddpctFO2rTYW8rH8Z4L0G95SzlHr
 +g9L5DSBrcLqkAmm7jbBHmYgyJBTgDg6m+aTZK1F2ORprpv+9qTqeATELgYP4iTb7wtq
 bsToue+DbptljGwRE1QqkOEyBdMorzYYFTY/L8mmlrJWyySDqlAJeEXWP6w4v4TySe37
 Kzzw==
X-Gm-Message-State: AOAM530Qnd9WUj0E8YeqYHtLhtsZ8KH3A4V36Aj5W8tqj3+Bfy5QvBKi
 UTVzSMWqYxdWvktTFOYhqT4AmfpHWVPVnb2bsuo=
X-Received: by 2002:a92:ce03:: with SMTP id b3mr641799ilo.267.1630551078694;
 Wed, 01 Sep 2021 19:51:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210901124521.30599-1-bmeng.cn@gmail.com>
 <20210901124521.30599-5-bmeng.cn@gmail.com>
In-Reply-To: <20210901124521.30599-5-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Sep 2021 12:50:52 +1000
Message-ID: <CAKmqyKM==22e-xvVi3fwm6c1wCCR5s5kmz=4BOao3QqaV2XwbQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] hw/char: cadence_uart: Convert to
 memop_with_attrs() ops
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12a.google.com
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
X-TUID: CbpgMttGiLf6

On Wed, Sep 1, 2021 at 10:46 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> This converts uart_read() and uart_write() to memop_with_attrs() ops.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
>
> (no changes since v2)
>
> Changes in v2:
> - new patch: hw/char: cadence_uart: Convert to memop_with_attrs() ops
>
>  hw/char/cadence_uart.c | 26 +++++++++++++++-----------
>  1 file changed, 15 insertions(+), 11 deletions(-)
>
> diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> index fff8be3619..8bcf2b718a 100644
> --- a/hw/char/cadence_uart.c
> +++ b/hw/char/cadence_uart.c
> @@ -411,15 +411,15 @@ static void uart_read_rx_fifo(CadenceUARTState *s, uint32_t *c)
>      uart_update_status(s);
>  }
>
> -static void uart_write(void *opaque, hwaddr offset,
> -                          uint64_t value, unsigned size)
> +static MemTxResult uart_write(void *opaque, hwaddr offset,
> +                              uint64_t value, unsigned size, MemTxAttrs attrs)
>  {
>      CadenceUARTState *s = opaque;
>
>      DB_PRINT(" offset:%x data:%08x\n", (unsigned)offset, (unsigned)value);
>      offset >>= 2;
>      if (offset >= CADENCE_UART_R_MAX) {
> -        return;
> +        return MEMTX_DECODE_ERROR;
>      }
>      switch (offset) {
>      case R_IER: /* ier (wts imr) */
> @@ -466,30 +466,34 @@ static void uart_write(void *opaque, hwaddr offset,
>          break;
>      }
>      uart_update_status(s);
> +
> +    return MEMTX_OK;
>  }
>
> -static uint64_t uart_read(void *opaque, hwaddr offset,
> -        unsigned size)
> +static MemTxResult uart_read(void *opaque, hwaddr offset,
> +                             uint64_t *value, unsigned size, MemTxAttrs attrs)
>  {
>      CadenceUARTState *s = opaque;
>      uint32_t c = 0;
>
>      offset >>= 2;
>      if (offset >= CADENCE_UART_R_MAX) {
> -        c = 0;
> -    } else if (offset == R_TX_RX) {
> +        return MEMTX_DECODE_ERROR;
> +    }
> +    if (offset == R_TX_RX) {
>          uart_read_rx_fifo(s, &c);
>      } else {
> -       c = s->r[offset];
> +        c = s->r[offset];
>      }
>
>      DB_PRINT(" offset:%x data:%08x\n", (unsigned)(offset << 2), (unsigned)c);
> -    return c;
> +    *value = c;
> +    return MEMTX_OK;
>  }
>
>  static const MemoryRegionOps uart_ops = {
> -    .read = uart_read,
> -    .write = uart_write,
> +    .read_with_attrs = uart_read,
> +    .write_with_attrs = uart_write,
>      .endianness = DEVICE_NATIVE_ENDIAN,
>  };
>
> --
> 2.25.1
>
>
