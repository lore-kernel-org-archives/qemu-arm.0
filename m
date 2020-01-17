Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp9824420lff;
        Fri, 17 Jan 2020 05:48:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqw5qdz2DSX7jBz2yfW+J+7/KLGoWmIDzaMQUE7hNMpKwg9YmVAKqb2pgevPFX9Si0E4zoFJ
X-Received: by 2002:ac8:7088:: with SMTP id y8mr7330290qto.325.1579268930678;
        Fri, 17 Jan 2020 05:48:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579268930; cv=none;
        d=google.com; s=arc-20160816;
        b=bb8bCB9/khtM2AuPeS4Duw9B4aYnXy2CwsR7NjLyU356kdZPRP7ffoPomK1C8R/Dch
         Qcpa3dH9vrxCsC3Y6peqZLFfpCZFAieOUky0HJG+Y07+1XbwkZHbFfGkYmRIroVmMQNm
         axlDZoeQ2sNZ6sNK9lkFfMWy7RWFF5G5ic6Hv4MBCcZjdpNvynNBW/VrM1b+D2lkHRC3
         oJ1idxtblZHTraMW0/O/awvstbmC8OKJVBbByk5tvSFpyAAXF5bH4U4c+spTNGF/t55W
         y1VFHoHU9Gc34Vd4lMwGllup4GviwweaAZc4Z7+B0Rwie99F4IEbrTmZbqEQZKoBultv
         L+9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8rJJ11zKAnCxLPJdTkuCFT0idGhjpwtf3W0G6yikRvc=;
        b=eCx40d8PuZasvfMwn9Gpi7bmUygKjxZNQIZuz6sVCoE5m7HGQbAnPWJVLkUWw0efpG
         Ks2ybpIUkUKRQCcNocSxE1FW2rHMfFkT+Tpi/E1qrnUgoMl845DsfxHNBHdRF3WWw55k
         2rS5U33F2lPeXZQ08lWkyaJPOuxhX1i1nABZhzwi0WDAJcAUoq6i6d2xz/4l61j5pNMV
         LwVFt8t7MKHWCP3BHxhCUFme5B3oh/IBHdNFabkUJDL2CZfCvWCExlcrBZepYPcFwf70
         KC3enFMp0oNYe5GTUu04FrGiWb1rbbYO3Uzwwl/1DNP9x4FoSGbwKAuxh3f7c3nz1XsO
         t2xw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LgqA4PWN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h7si14193894qvx.217.2020.01.17.05.48.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Jan 2020 05:48:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LgqA4PWN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1isRzV-0002Jy-1Q
	for alex.bennee@linaro.org; Fri, 17 Jan 2020 08:48:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51035)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1isRz3-0002Ft-SI
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 08:48:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1isRz2-0002xu-Km
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 08:48:21 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:43510)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1isRz2-0002v5-E8
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 08:48:20 -0500
Received: by mail-oi1-x242.google.com with SMTP id p125so22199317oif.10
 for <qemu-arm@nongnu.org>; Fri, 17 Jan 2020 05:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8rJJ11zKAnCxLPJdTkuCFT0idGhjpwtf3W0G6yikRvc=;
 b=LgqA4PWNstFMAgGotuGAycqrEN6eahf2LL0OR3K5KgPFgVxg8qIV5zexb+uKlN7i77
 zG6hDhzT7eq86Wh/NOxieLaoF82w4zPKpOaAok6JzMs2rsMeJ5H9RGOFuuPCdx1AJuW1
 ATEKx+ov7hlXJvxfxPpu8sE4H1yYUCKQHQsENAFWC0E/+3C5VAZvk8QQLu6TZv1Iq9pC
 KGhyhAHGvdBqneK9FuzH+ZlBzVqu5/NVmAbCn945EU6aHkhuzO+wQZPaWuNhYcXGGiRc
 /3M/pRZfJpmo4BE8lOz6+A5ddLtaOnsMz6/7xv66nLowlhvT1Y/j0Vo9moIDeUZ5zDZZ
 LGpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8rJJ11zKAnCxLPJdTkuCFT0idGhjpwtf3W0G6yikRvc=;
 b=mhl6dr+ItuyofVV3HCNykOwDQ93Sul1YV6QJRrN8xssr8Cy2d4FgqpsnSrSyaEcpUl
 Cipze5p0trjPe/GBKJGqFZgxWY7pnDNBxkHdpAViy7KyJ8z3Kkv3t3s+messaqpNrBBa
 L3GTibKjjOssfIs48WZyx2y4BusdMKhmJgSzD3L2LiYizX7qlamA/uNgt49pawXPKVgW
 fu5+HH/YahkweGt2NTYNG0jTiG8SraTPWuNT4mKnc6OaYA0lpIAkhuiYs+Gl3RSWY3JY
 UTFacLuInljQJrXkXwQ9FBqJIL3N0kCmu7s0OZkF0T63c2FIU2DvRXcwgif/MOQeFfy2
 OQSw==
X-Gm-Message-State: APjAAAXHxsKDu75F4GLE3cHLBn+5IyJh3xa9oRjBZkRa9fU3iwMG5xvF
 YkhfKtVXRsG4JEoe+ANdb5Zcc1KUu1HGftxUQWkEYQ==
X-Received: by 2002:aca:570d:: with SMTP id l13mr3363950oib.146.1579268896810; 
 Fri, 17 Jan 2020 05:48:16 -0800 (PST)
MIME-Version: 1.0
References: <20200110203942.5745-1-linux@roeck-us.net>
 <20200110203942.5745-7-linux@roeck-us.net>
In-Reply-To: <20200110203942.5745-7-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Jan 2020 13:48:06 +0000
Message-ID: <CAFEAcA_v98GcR06PWfm+=VnteQN_Q7iKK4wobAg6NrVSP1AyDg@mail.gmail.com>
Subject: Re: [PATCH 6/6] hw/arm/exynos4210: Connect serial port DMA busy
 signals with pl330
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l8NAO2KIchKe

On Fri, 10 Jan 2020 at 20:39, Guenter Roeck <linux@roeck-us.net> wrote:
>
> The Exynos4210 serial driver uses an interrupt line to signal if receive
> data is available. Connect that interrupt with the DMA controller's
> 'peripheral busy' gpio pin.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  hw/arm/exynos4210.c | 39 ++++++++++++++++++++++++++-------------
>  1 file changed, 26 insertions(+), 13 deletions(-)
>
> diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
> index c7b5c587b1..498d79ebb2 100644
> --- a/hw/arm/exynos4210.c
> +++ b/hw/arm/exynos4210.c
> @@ -166,8 +166,8 @@ static uint64_t exynos4210_calc_affinity(int cpu)
>      return (0x9 << ARM_AFF1_SHIFT) | cpu;
>  }
>
> -static void pl330_create(uint32_t base, qemu_irq irq, int nreq, int nevents,
> -                         int width)
> +static DeviceState *pl330_create(uint32_t base, qemu_irq irq, int nreq,
> +                                 int nevents, int width)
>  {
>      SysBusDevice *busdev;
>      DeviceState *dev;
> @@ -191,6 +191,7 @@ static void pl330_create(uint32_t base, qemu_irq irq, int nreq, int nevents,
>      for (i = 0; i < nevents; i++) {
>          sysbus_connect_irq(busdev, i + 1, irq); /* event irq lines */
>      }
> +    return dev;
>  }
>
>  static void exynos4210_realize(DeviceState *socdev, Error **errp)
> @@ -199,7 +200,7 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
>      MemoryRegion *system_mem = get_system_memory();
>      qemu_irq gate_irq[EXYNOS4210_NCPUS][EXYNOS4210_IRQ_GATE_NINPUTS];
>      SysBusDevice *busdev;
> -    DeviceState *dev;
> +    DeviceState *dev, *uart[4], *pl330[3];

Rather than having the uart and pl330 pointers be locals,
they should be fields in Exynos4210State. (Otherwise technically
we leak them, though this is unnoticeable in practice because there's
no way to destroy an Exynos4210State.)

Patch looks good otherwise.

thanks
-- PMM
