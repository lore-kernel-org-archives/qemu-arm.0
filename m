Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp228098lfg;
        Thu, 11 Mar 2021 04:08:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy//8ugOY6cokYHZYov2Nu0W6b+VGy2mGREOsLn9pMnDWJ+054DH+rbq0yNzFiFsyEvrh+Y
X-Received: by 2002:a05:6638:3ba:: with SMTP id z26mr3342798jap.40.1615464485571;
        Thu, 11 Mar 2021 04:08:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615464485; cv=none;
        d=google.com; s=arc-20160816;
        b=0RcyECWpK20hzSLwhGKm6Ms0yHFRyMKyPX4WpA10Xan8T8nnIuakEVYKc+7szroO7V
         O/shN5TqseQ1pHBgR2S0UhSoOMPRkvYoGGJY89GE/cB4AolhX4WTCXeMOLGyluH6A2E9
         TFMHifd/wHb/pGfItG4RkvWtVqcVmJ2S4ZTYLdbUrXxc8Vp3cRUu76wI90IwT+vC46JQ
         wEsftjU1NFmG41FE4TerdA3IcUNZdpxWZJM1mvaXeaSrq2KNLONQsgQ7g8jyN3DIOfOl
         dmbVpH5zBkcmGYkXDjBnb3C5Y3aTlo+a7x+DHHA4nx409MErFd0dYIaBL5wM7S9m87gn
         7WkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yLjgREMD9eQ4UnJRKOm2CicdV7iEp/vNuleh8Ij//GY=;
        b=L5awdDlyETqMSRYMwNPdlVPmX0cpBrnJptziss6zvOqvDKmBZpTIZYdMEpvs/jMxRP
         T9mPE3LShrx1ps/aYke9j066Eh8SJLpfX3bWJcpa7+qxes6X+2zuNaPVwoZvkmS2jwZY
         u20ZuWHxdBrRCoBJjLLH5ByjOZ5RYR8kNsgdJe7wy8M/ZOy3mhm5CB3CADjn9tA+0iYe
         hr3NFSCFuiwGisu+tuf+v1CJxmO46IThxnT134JODDHW6fZOsKQokPrVr/rFnJBehP2Q
         9taXwvITlqOs3rroB2S8eTXub5KvLfVzzEblQuvErSZimKNhrVv6+wo/E0lZH70sHTgl
         RiFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cGJW7QCA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g3si2558284ild.84.2021.03.11.04.08.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Mar 2021 04:08:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cGJW7QCA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lKK6m-00058I-TZ
	for alex.bennee@linaro.org; Thu, 11 Mar 2021 07:08:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKK6O-00057L-WD
 for qemu-arm@nongnu.org; Thu, 11 Mar 2021 07:07:41 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:37732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKK6M-0006I9-Ta
 for qemu-arm@nongnu.org; Thu, 11 Mar 2021 07:07:40 -0500
Received: by mail-ej1-x632.google.com with SMTP id bm21so45709141ejb.4
 for <qemu-arm@nongnu.org>; Thu, 11 Mar 2021 04:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yLjgREMD9eQ4UnJRKOm2CicdV7iEp/vNuleh8Ij//GY=;
 b=cGJW7QCAoWUYfjwdZ4JuKwJX5BcJTbxzIqW+PoJVexRS5y2Af4omlcQwvlwjgqAEjf
 PHt9rzP5XDpLSHZRfvp9QyIO3W/7J1LoGeVqeNfT+rAdZ74rIAZaD0T9jIH7iLwICXwn
 uL/ui6a9vfWMogFeUfaogXmOmy83v55WB2dkJRLUUSkdLSpvv2V8PJC0tMLev+NjfMic
 kAgpDUnQxN8vNDsM4g3RjCaHuMreMw1Ri2p2gBmGGLfjQkhZBMeBjXc+8q1J4mB1SJUt
 oVqfHQEc6PEIIZrqy3PHP3bGX9UtFMl4ghCNiWmWh6DyWwYsy8/BM6xsNAhQ4KJYpCpc
 S1Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yLjgREMD9eQ4UnJRKOm2CicdV7iEp/vNuleh8Ij//GY=;
 b=KH3/cSMHN3uldC59t0UR1gB06VqCzZUrbGhR9CVZ1cEWuY4Vo+nEYRl/0UOyvVCXCt
 uCWMKx9rklHlaItADXEvPyvYK/N9n/1EOzUQNVmPAr+8dv5oWRGxZZyvu49ZP64zOlzy
 3SK/XnR4RakTdk09WPz1AQVeipv+ZsHN0dbkedZ3byp5d7+ZRug1wAcPcj99r5odt7yT
 9cKY9XaJ1+tIEFooY5uA4NCIQBkdVcFlpcxCTiShRM/72rAud7LSbjTOMcqpjP9YfZ/5
 Sw3AMRGMqsUbHuizqPefjpi2rxLtCoQQ7Ej63C8hWGo92quZsFix7fD7WOfPuDYUhKm2
 TBnA==
X-Gm-Message-State: AOAM530/QSISiXBQRb6f9bvNZsGQY8Cux4a+ZQJ2uV5qV6yueLpMI9PU
 SrLOf/5e704qVCODZDUqMT8H6XTL0KWnoD5fouJwCA==
X-Received: by 2002:a17:906:bd2:: with SMTP id
 y18mr2776605ejg.482.1615464457347; 
 Thu, 11 Mar 2021 04:07:37 -0800 (PST)
MIME-Version: 1.0
References: <20210305183857.3120188-1-wuhaotsh@google.com>
 <20210305183857.3120188-3-wuhaotsh@google.com>
In-Reply-To: <20210305183857.3120188-3-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Mar 2021 12:07:18 +0000
Message-ID: <CAFEAcA_q0WW_1FA_2McFB-o3cC_XWDEZJsw3C+zj4057L9YpDg@mail.gmail.com>
Subject: Re: [PATCH 2/4] hw/misc: Add NPCM7XX MFT Module
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 Doug Evans <dje@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CpByBS0w7GGO

On Fri, 5 Mar 2021 at 18:40, Hao Wu <wuhaotsh@google.com> wrote:
>
> This patch adds Multi Function Timer (MFT) module for NPCM7XX Soc.
> This module is mainly used to configure PWM fans. It has just enough
> functionality to make the PWM fan kernel module work.
>
> The module takes two input, the max_rpm of a fan (modifiable via QMP)
> and duty cycle (a GPIO from the PWM module.) The actual measured RPM
> is equal to max_rpm * duty_cycle / NPCM7XX_PWM_MAX_DUTY. The RPM is
> measured as a counter compared to a prescaled input clock. The kernel
> driver reads this counter and report to user space.
>
> Refs:
> https://github.com/torvalds/linux/blob/master/drivers/hwmon/npcm750-pwm-fan.c
>
> Reviewed-by: Doug Evans <dje@google.com>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---
>  docs/system/arm/nuvoton.rst   |   2 +-
>  hw/arm/npcm7xx.c              |  45 ++-
>  hw/misc/meson.build           |   1 +
>  hw/misc/npcm7xx_mft.c         | 541 ++++++++++++++++++++++++++++++++++
>  hw/misc/trace-events          |   8 +
>  include/hw/arm/npcm7xx.h      |   2 +
>  include/hw/misc/npcm7xx_mft.h |  70 +++++
>  7 files changed, 660 insertions(+), 9 deletions(-)
>  create mode 100644 hw/misc/npcm7xx_mft.c
>  create mode 100644 include/hw/misc/npcm7xx_mft.h

Can you split "implement new device" and "add new device to board"
into separate patches, please?


> +static void npcm7xx_mft_init(Object *obj)
> +{
> +    NPCM7xxMFTState *s = NPCM7XX_MFT(obj);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> +    DeviceState *dev = DEVICE(obj);
> +
> +    memory_region_init_io(&s->iomem, obj, &npcm7xx_mft_ops, s,
> +                          TYPE_NPCM7XX_MFT, 4 * KiB);
> +    sysbus_init_mmio(sbd, &s->iomem);
> +    sysbus_init_irq(sbd, &s->irq);
> +    s->clock_in = qdev_init_clock_in(dev, "clock-in",
> +                                     npcm7xx_mft_update_clock, s);

You'll need to update this for the change to the Clock API that's
now in master, I'm afraid.

(You'll also find some conflicts in the docs and in the board .c file
when you rebase now the ethernet device patchset has landed, but those
are easy to fix.)

thanks
-- PMM
