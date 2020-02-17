Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4909058lfp;
        Mon, 17 Feb 2020 02:13:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqxHA5oPbnH7HvZFFzIb0XNnPdrS8/vo8rhLFufkn0YU1GTJhv6Tz49eONdXsRvG1LFkaV/U
X-Received: by 2002:ac8:1b18:: with SMTP id y24mr12275605qtj.158.1581934417480;
        Mon, 17 Feb 2020 02:13:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581934417; cv=none;
        d=google.com; s=arc-20160816;
        b=r0PgGSMU7If0jE/WtS5ISB/VCsYNv7HD7Y7vIG647XwOARNtKIEQFu/nsrOP9DMmqa
         4xmLw5+k1Islzm/SUYX7BDY3axnj4+OXiX7u/Mqk1pWzjPGWYHdRlEeE0waGZJNImdom
         yE7ZaOOAE2omnFZuAQA6atKGJCKidCiZ+G04r9KUjFvVVcta+85B6JAfVCZPggEA6YOc
         6N32mO40gGRET9JE6Bl2B8FUETCdNbJYaGL7dA6UiVMTbDn/6d9Q9yEAwVYesAWpczgn
         ocH/5a4TxAkoLrQ4Cdpoq7i9cqDHsNmSxzTx259v7aaRbwc5hX2ncCc5ICME0SqDwbNd
         ZOaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ihAHHBJTLcUUzMgnsy+QkVHULWLP2nB4QzyKj5oq1ic=;
        b=P/+v8r6ChjMsH7E8jpTRMGUpvtQDQFJn6Q8TMxb9VnY71kdyHIQHETk4pU6tDWdtf4
         hSqwys/9GK6BBxYLGEY7RWAWHnpMQ72YwvOaHvf7gTKKMG0z6toYzdmhPcoFhcVELeX3
         6OBfacA4kUsy1I+X9lQONw18YiufaLgkn/wxz3UtIvynfLCfsyg6Y8zR1XuoWnT5RXBj
         GUTAAOTFVF/IbzP8JJGqfcjzWaQmbFfSDr+Bk78Ne/5MX2mCrfqQ7UM32vHvyNxnYTbs
         iy239QQb46QUEF+9Bm31GE+FpqvgoQrsC2mBOUGyqfxjF6dYUJAr9So4v2nj5LfV8bzW
         0USQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ND9nQBnt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s8si69126qkj.85.2020.02.17.02.13.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2020 02:13:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ND9nQBnt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3dPE-00063E-Sp
	for alex.bennee@linaro.org; Mon, 17 Feb 2020 05:13:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58186)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j3dP6-000630-VZ
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 05:13:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j3dP5-0000HV-Mf
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 05:13:28 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:42815)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j3dP5-0000GN-HD
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 05:13:27 -0500
Received: by mail-oi1-x242.google.com with SMTP id j132so16163084oih.9
 for <qemu-arm@nongnu.org>; Mon, 17 Feb 2020 02:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ihAHHBJTLcUUzMgnsy+QkVHULWLP2nB4QzyKj5oq1ic=;
 b=ND9nQBntlbDrPqWHt9ML1+mIMBvwJ6GgqBxBTWw1cO//V+u1xOg2F4AYDBIWo6S3DD
 msAJMc1svt2ddFIue2gn0+dEwQvyyHnyS58VAeMGoljyhI8FuefwFGGw/1GAqEKc/AtL
 34IqHFEbpJZjvDKVUEOUDtQbJJ6RM0X+5FEMZvg1hFCkahSDFvgGMeDRhd5zuN39R8J2
 9v3HG+0o5KhWr3V8iyGqPoH17P+5WhX3IiVbWK5nU4lq52Uy4LvM9D4nMR5pgMKKHrKk
 W9GAt/Zb/CqeK4KoLnDFnDoAofBtJO7BEbMH7sDkVX7m2Z1sxaA6c+JdtodFnC4QLtjj
 YCmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ihAHHBJTLcUUzMgnsy+QkVHULWLP2nB4QzyKj5oq1ic=;
 b=gdUnZHI+lHBA368Vs2Xzzt/eRWwYdAHBdaPqf+wVbcMGDIO4LGUfMrmsrxyL8dpeZO
 HzQwxo6YrWiYOplbSME9qmvHi9iudJASgwpdHq5uGqvjfokaMBRPjjbvUu0cFXz6+yQa
 1+iyVqoybzm3hB7oNjtPZPGkw+z8FNBN8TLfc3TorTUz8JtDyfd2JmUgS4QMtPgE2K2V
 OFqWNJKeJ4HXbZ2X5oY5tsrvMAF5LaliPOJHa1985L6CRwSCIn3P5SN1/xV3yjpy2uoO
 7fAkD7OAWrT4TSvTG7JlFVoIX3sNm1dsODQvUKWZXnqsrpQH+6QPoCXau2+SXEhUoR0p
 O7FA==
X-Gm-Message-State: APjAAAUVw1u/tadTrkGCsJcIuzfo3+XIpv7GlS0cL6y2PD4WiwHuVmse
 8BzgyfyctLxHAsLhdk5UWoPsP/cpzNUPE8Cr1zoqCA==
X-Received: by 2002:a54:4f16:: with SMTP id e22mr9734447oiy.170.1581934406489; 
 Mon, 17 Feb 2020 02:13:26 -0800 (PST)
MIME-Version: 1.0
References: <20200215001248.2642-1-linux@roeck-us.net>
 <20200215001248.2642-4-linux@roeck-us.net>
In-Reply-To: <20200215001248.2642-4-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Feb 2020 10:13:15 +0000
Message-ID: <CAFEAcA8Su5SfM9f9BpwaEK2yq0NPwjbtUSwQ1n=G1a=8W881JA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm: allwinner: Wire up USB ports
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6Tq3su771/Dm

On Sat, 15 Feb 2020 at 00:12, Guenter Roeck <linux@roeck-us.net> wrote:
>
> Instantiate EHCI and OHCI controllers on Allwinner A10. OHCI ports are
> modeled as companions of the respective EHCI ports.
>
> With this patch applied, USB controllers are discovered and instantiated
> when booting the cubieboard machine with a recent Linux kernel.
>
> ehci-platform 1c14000.usb: EHCI Host Controller
> ehci-platform 1c14000.usb: new USB bus registered, assigned bus number 1
> ehci-platform 1c14000.usb: irq 26, io mem 0x01c14000
> ehci-platform 1c14000.usb: USB 2.0 started, EHCI 1.00
> ehci-platform 1c1c000.usb: EHCI Host Controller
> ehci-platform 1c1c000.usb: new USB bus registered, assigned bus number 2
> ehci-platform 1c1c000.usb: irq 31, io mem 0x01c1c000
> ehci-platform 1c1c000.usb: USB 2.0 started, EHCI 1.00
> ohci-platform 1c14400.usb: Generic Platform OHCI controller
> ohci-platform 1c14400.usb: new USB bus registered, assigned bus number 3
> ohci-platform 1c14400.usb: irq 27, io mem 0x01c14400
> ohci-platform 1c1c400.usb: Generic Platform OHCI controller
> ohci-platform 1c1c400.usb: new USB bus registered, assigned bus number 4
> ohci-platform 1c1c400.usb: irq 32, io mem 0x01c1c400
> usb 2-1: new high-speed USB device number 2 using ehci-platform
> usb-storage 2-1:1.0: USB Mass Storage device detected
> scsi host1: usb-storage 2-1:1.0
> usb 3-1: new full-speed USB device number 2 using ohci-platform
> input: QEMU QEMU USB Mouse as /devices/platform/soc/1c14400.usb/usb3/3-1/3-1:1.0/0003:0627:0001.0001/input/input0
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v2: Instantiate EHCI and OHCI in a single patch
>     Use define instead of ARRAY_SIZE to get the number of USB ports
>     Instantiate OHCI in companion mode
>     Use &error_fatal to handle error conditions
>
>  hw/arm/allwinner-a10.c         | 43 ++++++++++++++++++++++++++++++++++
>  include/hw/arm/allwinner-a10.h |  6 +++++
>  2 files changed, 49 insertions(+)
>
> diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
> index 45cd8d2db5..57275c92f5 100644
> --- a/hw/arm/allwinner-a10.c
> +++ b/hw/arm/allwinner-a10.c
> @@ -24,12 +24,16 @@
>  #include "hw/arm/allwinner-a10.h"
>  #include "hw/misc/unimp.h"
>  #include "sysemu/sysemu.h"
> +#include "hw/boards.h"
> +#include "hw/usb/hcd-ohci.h"
>
>  #define AW_A10_CCM_REG_BASE     0x01c20000
>  #define AW_A10_PIC_REG_BASE     0x01c20400
>  #define AW_A10_PIT_REG_BASE     0x01c20c00
>  #define AW_A10_UART0_REG_BASE   0x01c28000
>  #define AW_A10_EMAC_BASE        0x01c0b000
> +#define AW_A10_EHCI_BASE        0x01c14000
> +#define AW_A10_OHCI_BASE        0x01c14400
>  #define AW_A10_SATA_BASE        0x01c18000

Hi; I tried to apply this patchset, but it doesn't apply to master.
In particular, master doesn't have a #define for AW_A10_CCM_REG_BASE.

Is this patchset supposed to be based on some other patchset
you've already sent that's got lost in my mailbox?

thanks
-- PMM
