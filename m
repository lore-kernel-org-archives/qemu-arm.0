Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp9804973lff;
        Fri, 17 Jan 2020 05:30:57 -0800 (PST)
X-Google-Smtp-Source: APXvYqxQQyduLvFGHoGKT0j66+wS9qS6heFhv2P7Hbps84w8VN291LYxSfJ58Bhltx6jRfqE/BuS
X-Received: by 2002:ac8:7b29:: with SMTP id l9mr7278433qtu.141.1579267857660;
        Fri, 17 Jan 2020 05:30:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579267857; cv=none;
        d=google.com; s=arc-20160816;
        b=lKp5/FeCdQ14CjzVwhjBS+pIFiqEUnwOCRX0D/XeSw5q8i2tHXje3IevyQXjnfRInh
         wBcfT9eyIiMSPKgPfT2I1wEO/TBaqx4DXV2GFQOMg2+WJ2K7AUETl3z0oqvmyyKSiyNI
         zG539yTDQcfgga0nNrJdmmaVyfImGl7HnhF6aoo3JQuia80W4JOkUv30BLfiC0CB1Eii
         ZfeNtSW7Dl0I0pJEOz3OMJaKcsxXoiseZRDS2BbFwqIUcCTqoJwrEn16IiQDwMnuZcle
         Ukz3mh5Rq8nTsYY0q8U3pr4vD8GRWgHaSqxStwhIqatpa8QGczw3KNTRGLUY/er1LqJG
         l2Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U6lmHJAPfQiQkYws4wu1JYbjB0vbSu9F1bgBg8wmbmI=;
        b=ZWe1NZFrFxFqXAGodvmQqBu/jYtsg4AB2puOp/+0dow+KEIJ65rUii+Y0XBjP4fsZY
         //E96oLP1hmAWD/S2KhLpBDsij2EkbMOM4XbOCYFfn9k2KnTKXzo2lBjCxoinUoJBPdV
         mUIN+FPpvTxBAsKMXLdcZdbVJOYRYNZyXLv1ilRH8Zhu5iOpSXYxOCBj3+1tcoqZHkhq
         maRpQ/tO5fbXsnMYrCSCR1XpD047oJUFmh9xmojCqznyeVtaUPrD0QCMEyzIXQ+nFMEU
         Y/xzmhkuAKP3KnlyMXzZhy2tTCYFa80pBdib4Qa+H4w+/6RupeWLa9ZFxG4rvfBc1jcR
         5rjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NqvHSayB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q133si15901149qke.172.2020.01.17.05.30.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Jan 2020 05:30:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NqvHSayB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1isRiC-0000VV-G1
	for alex.bennee@linaro.org; Fri, 17 Jan 2020 08:30:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48572)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1isRhp-0000TV-2a
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 08:30:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1isRhn-0006Cj-LZ
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 08:30:32 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:40169)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1isRhn-0006Bn-G1
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 08:30:31 -0500
Received: by mail-ot1-x341.google.com with SMTP id w21so22483665otj.7
 for <qemu-arm@nongnu.org>; Fri, 17 Jan 2020 05:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U6lmHJAPfQiQkYws4wu1JYbjB0vbSu9F1bgBg8wmbmI=;
 b=NqvHSayBE0KS5YhWV/99vNmeJgAx/KVQh6/N3QWALQl9hXLpFm13rx7cdlmXsmG4o6
 oLPPFkL7Z0Wtlflxr5GFuqsgZyuPSbGIVx131qDxZahZ7wRB4+WDGyUlgeoMVIprabYe
 N1kUDfpyyrI56saZ47D0gnpX7pANmiHqQBhlQ3V6wrkThUDTagFssy3OiHyeZKr5llny
 rCEgXmgzzyULmrWDhySdJniKS/S5eaNfsULQG2sgx6a/Q/v0k/cE8S0KclAab85VUo6Q
 V6PXviGP/OFDiDmcCo8Q12puAkS1+Rhdigwvpx8iUmtv9u1M/O/8aNS6avX4PLpObg2d
 N8PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U6lmHJAPfQiQkYws4wu1JYbjB0vbSu9F1bgBg8wmbmI=;
 b=NujRjlj5KlT7eLaJkSjVr6QfL/1Yj/VcQThCPMA028oP2iAsG5sq7WeXX9zi0Q3hPL
 nyoleTvmwNUZC8ito75PWdW9TNWn0iTc9j0LihJ3glbqwfo7RIRIKXomBAdzbvPFgry6
 JwpFchr/pdMjq2gI6Du4/GX54WbLLEPRn/NsZ8q8vroxBzCWMpRMnZ+9MbFSInwzmljO
 PEQ90FBopJ4a3YFiu7rAb3OQHtXu0z0YXUMbuEQOvUBne0ueeyoJ+pJb17n8agM0nPF1
 EbQUy6TBm3Fv/gL+2n8hsG05Ss1njqIf58JiHCyiaBtRDnklSqbCe9QF8SMyvLYOIagV
 LyKQ==
X-Gm-Message-State: APjAAAWUS8//9LFL2wQmvNevpOkx0hB7DFY9ELHudnGUYVVcOdzDU+as
 15IpNnqSrWpyvO6BJgoODZ3AqmWhiH8DE+gRYTBFKA==
X-Received: by 2002:a05:6830:184:: with SMTP id
 q4mr6128143ota.232.1579267830256; 
 Fri, 17 Jan 2020 05:30:30 -0800 (PST)
MIME-Version: 1.0
References: <20200110203942.5745-1-linux@roeck-us.net>
 <20200110203942.5745-3-linux@roeck-us.net>
In-Reply-To: <20200110203942.5745-3-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Jan 2020 13:30:19 +0000
Message-ID: <CAFEAcA_CeenDy9cNpQi6YpnT5rV+V10+EwYh=-zJEtjaT_gdDA@mail.gmail.com>
Subject: Re: [PATCH 2/6] hw/arm/exynos4210: Fix DMA initialization
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wH++GRnfteTX

On Fri, 10 Jan 2020 at 20:39, Guenter Roeck <linux@roeck-us.net> wrote:
>
> First parameter to exynos4210_get_irq() is not the SPI port number,
> but the interrupt group number. Interrupt groups are 20 for mdma
> and 21 for pdma. Interrupts are not inverted. Controllers support 32
> events (pdma) or 31 events (mdma). Events must all be routed to a single
> interrupt line. Set other parameters as documented in Exynos4210 datasheet,
> section 8 (DMA controller).
>
> Fixes: 59520dc65e ("hw/arm/exynos4210: Add DMA support for the Exynos4210")
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  hw/arm/exynos4210.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
>
> diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
> index 77fbe1baab..c7b5c587b1 100644
> --- a/hw/arm/exynos4210.c
> +++ b/hw/arm/exynos4210.c
> @@ -166,17 +166,31 @@ static uint64_t exynos4210_calc_affinity(int cpu)
>      return (0x9 << ARM_AFF1_SHIFT) | cpu;
>  }
>
> -static void pl330_create(uint32_t base, qemu_irq irq, int nreq)
> +static void pl330_create(uint32_t base, qemu_irq irq, int nreq, int nevents,
> +                         int width)
>  {
>      SysBusDevice *busdev;
>      DeviceState *dev;
> +    int i;
>
>      dev = qdev_create(NULL, "pl330");
> +    qdev_prop_set_uint8(dev, "num_events", nevents);
> +    qdev_prop_set_uint8(dev, "num_chnls",  8);
>      qdev_prop_set_uint8(dev, "num_periph_req",  nreq);
> +
> +    qdev_prop_set_uint8(dev, "wr_cap", 4);
> +    qdev_prop_set_uint8(dev, "wr_q_dep", 8);
> +    qdev_prop_set_uint8(dev, "rd_cap", 4);
> +    qdev_prop_set_uint8(dev, "rd_q_dep", 8);
> +    qdev_prop_set_uint8(dev, "data_width", width);
> +    qdev_prop_set_uint16(dev, "data_buffer_dep", width);
>      qdev_init_nofail(dev);
>      busdev = SYS_BUS_DEVICE(dev);
>      sysbus_mmio_map(busdev, 0, base);
> -    sysbus_connect_irq(busdev, 0, irq);
> +    sysbus_connect_irq(busdev, 0, irq);         /* abort irq line */
> +    for (i = 0; i < nevents; i++) {
> +        sysbus_connect_irq(busdev, i + 1, irq); /* event irq lines */
> +    }

It isn't valid to connect multiple qemu_irq outputs to a single
input like this. If the hardware logically ORs the irq lines
together then you need to instantiate and wire up a TYPE_OR_IRQ
device (include/hw/or-irq.h) to do that. Unfortunately QEMU
doesn't catch accidental wiring of a qemu_irq to multiple
inputs, and it will even sort-of seem to work: the bug is that
if two inputs go high, and then one goes low, the destination
will get a "signal went low" call even though the first input
should still be holding the line high.

(Conversely, to connect one qemu_irq to multiple outputs you
need a TYPE_SPLIT_IRQ, include/hw/core/split-irq.h).

thanks
-- PMM
