Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1938536lfm;
        Thu, 16 Apr 2020 08:21:21 -0700 (PDT)
X-Google-Smtp-Source: APiQypLpT1kcQTNorGwyzlj5bVSyIpCDXdjTZ+2c8829MpDEFTGz93h2rpP0mY4oQaW0khojk0o3
X-Received: by 2002:a0c:aee5:: with SMTP id n37mr10108699qvd.173.1587050481213;
        Thu, 16 Apr 2020 08:21:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587050481; cv=none;
        d=google.com; s=arc-20160816;
        b=nr5ONx+ZG/7XS1YzgDHTVNuObt4ikFcWYwIMJWX2sIoPYSF+yaZ7+AM9AagXVZscZN
         6O7R+snqNuR0A+M3Dsvnw0iAtLcBl4HavKLhDgRZGzIPVHq7HPuiw5q9KuGi1gM8+SwR
         8IQJtL5VtCbRrcypDhdPOVyF0RfqZvhwtItVHZ11ZK+3qpKdIwK9y0LX3PcHDVjsIbv8
         YsyXc0Y3iEQusNF5DjK8BJAm74CgerNVGUIJeJFMqqimhjyDnUmyBFLzsUfVwa103jiW
         HXIhN5STVkCGRuVdq0O+zCfIAqRF+tifnUEdngwZBK/Bp9oIirPYbCQ2hm+jNnvr9D2Q
         bhSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dol/6kqOEATgIsl9Yn3GVE60WYjm/LNLo+V8uhspohw=;
        b=uOOZgoYpDEyEV7kYKX+grWKdfMXCOi0Mxe5aRgFxYS+k9rm5pu88au7zvAlRH1AICM
         fUR7dTyxGSx/uELnp2ljDbaMCQtDho/TXbhzQ9vmxQdGeaiJ/bbBrXPQcKEpaUI4Fd9H
         +9Og/AZGN/0YAXYR+MF4FH2ZtP/OULlfSAugzZ72TVO5mzcGqrxB/IOPnT3y1Cja7uFO
         FCTj8P5dNbI/r4aOlR+iNPJBoCMHlSxG75KHgT/v8IOSvGoL74BVo69F0O14W7dw8tTQ
         FGr80vkLbzaGVRuxlkDE3MPp88Q7P+7g2Hf8Ppw/YmUNKiToFOoDRiRvBsdvIpyHluAg
         mwCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tu8MfcaM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f26si12603741qtg.21.2020.04.16.08.21.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Apr 2020 08:21:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tu8MfcaM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jP6KO-0001MN-MK
	for alex.bennee@linaro.org; Thu, 16 Apr 2020 11:21:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49433)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jP6K8-0001Jh-0c
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 11:21:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jP6K6-0001hY-43
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 11:21:03 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:43912)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jP6K5-0001gz-Tj
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 11:21:02 -0400
Received: by mail-ot1-x344.google.com with SMTP id g14so3330639otg.10
 for <qemu-arm@nongnu.org>; Thu, 16 Apr 2020 08:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Dol/6kqOEATgIsl9Yn3GVE60WYjm/LNLo+V8uhspohw=;
 b=tu8MfcaMH0oYZDyAg0fH/hXl7znlWj4eGrVn7e6BQT+p/rbDg8gimVPO2uIvxM+OsC
 zMGd7f1jsabyFC5XkczRBf0litI84E/h9IO4OoyEApd9w/4OSDijDE0mOBzMHpxz5Dvo
 0b2SXVBLZ19gzPgKTT5mVX9PT6Il3h+8FA6tEgbrFyW30P43vgSu0d/Y3QutwK1IzL0l
 +/v54es/SHa/mtgSPjkEnJsNvxOru+fIM6s/66OAUOQowrJmRUnoXtFuCam/DEfv4Fu2
 MAp/ILqa95ysA9mnVwO2J2KB4S/Cv6D2BMvpknP9Pix7CZRQ04eHe6c2wMtsLWbs3d2T
 WgpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dol/6kqOEATgIsl9Yn3GVE60WYjm/LNLo+V8uhspohw=;
 b=AJn0d6x0cJ8ZY1Qy7dG9a8ssMi4m3GuyepfRtzWelfhaiT3HLvz4odMixJX2SdpcfG
 4HgSKRuFeJqsVPoyZJXAIWMqNUbxdlFEwjnZTyLV1slEs+ic3DIYIIRlUg1FQJCzWx1I
 r0ddUqf/ex6bOaNCynF90coBSTtSYE+AAyOZY5MifkmKpuTznGEcDAPFg6Az5CT4M9oT
 TK5wf3T7NCZ5DjCvS5jMDARH81cG/VN56BmYT9TYnH1F/dmRQ+on4uPWwL5D4Y8Gdr6L
 UnsegDvTnbRN6iNGizk4u9sm8p1YLlkPVXI7MyLVE27NnJ13ux/bfqR8uubqTeGFtiUP
 bJwg==
X-Gm-Message-State: AGi0PuYmTx4MwwwCI8wefaSAn0SZgxTtCHXSbYPMC0JV4nHw1NOGYWWq
 nnnedDPhqwOAxH2RNIg+Da6KXYHdMutIs7yFkrnMhA==
X-Received: by 2002:a05:6830:1e4e:: with SMTP id
 e14mr8545146otj.91.1587050460691; 
 Thu, 16 Apr 2020 08:21:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200322211919.11335-1-linux@roeck-us.net>
 <20200322211919.11335-3-linux@roeck-us.net>
In-Reply-To: <20200322211919.11335-3-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Apr 2020 16:20:49 +0100
Message-ID: <CAFEAcA9D3VD4YciMMBBaO2K7rZj5A6DXFJ1g3L04NHnAis3cNQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] hw/watchdog: Implement full i.MX watchdog support
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KUqa4gxPoLK+

On Sun, 22 Mar 2020 at 21:19, Guenter Roeck <linux@roeck-us.net> wrote:
>
> Implement full support for the watchdog in i.MX systems.
> Pretimeout support is optional because the watchdog hardware on i.MX31
> does not support pretimeouts.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v2: Fixup of CONFIG_WDT_IMX -> CONFIG_WDT_IMX2 moved to patch 1/8

Sorry for not getting to this earlier, I've been focusing on
work for the 5.0 release. Some comments below, but overall
this looks pretty good.

>
>  hw/watchdog/wdt_imx2.c         | 196 +++++++++++++++++++++++++++++++--
>  include/hw/watchdog/wdt_imx2.h |  49 ++++++++-
>  2 files changed, 231 insertions(+), 14 deletions(-)
>
> diff --git a/hw/watchdog/wdt_imx2.c b/hw/watchdog/wdt_imx2.c
> index ad1ef02e9e..f5339f3590 100644
> --- a/hw/watchdog/wdt_imx2.c
> +++ b/hw/watchdog/wdt_imx2.c
> @@ -13,24 +13,157 @@
>  #include "qemu/bitops.h"
>  #include "qemu/module.h"
>  #include "sysemu/watchdog.h"
> +#include "migration/vmstate.h"
> +#include "hw/qdev-properties.h"
>
>  #include "hw/watchdog/wdt_imx2.h"
>
> -#define IMX2_WDT_WCR_WDA    BIT(5)      /* -> External Reset WDOG_B */
> -#define IMX2_WDT_WCR_SRS    BIT(4)      /* -> Software Reset Signal */
> +static void imx2_wdt_interrupt(void *opaque)
> +{
> +    IMX2WdtState *s = IMX2_WDT(opaque);
> +
> +    s->wicr |= IMX2_WDT_WICR_WTIS;
> +    qemu_set_irq(s->irq, 1);
> +}
>
> -static uint64_t imx2_wdt_read(void *opaque, hwaddr addr,
> -                              unsigned int size)
> +static void imx2_wdt_expired(void *opaque)
>  {
> +    IMX2WdtState *s = IMX2_WDT(opaque);
> +
> +    s->wrsr = IMX2_WDT_WRSR_TOUT;
> +
> +    /* Perform watchdog action if watchdog is enabled */
> +    if (s->wcr & IMX2_WDT_WCR_WDE) {
> +        watchdog_perform_action();
> +    }
> +}
> +
> +static void imx2_wdt_reset(DeviceState *dev)
> +{
> +    IMX2WdtState *s = IMX2_WDT(dev);
> +
> +    s->wcr = IMX2_WDT_WCR_WDA | IMX2_WDT_WCR_SRS;
> +    s->wsr = 0;
> +    s->wrsr &= ~(IMX2_WDT_WRSR_TOUT | IMX2_WDT_WRSR_SFTW);
> +    s->wicr = 4;
> +    s->wmcr = IMX2_WDT_WMCR_PDE;

Your reset function probably also needs to ptimer_stop()
the timers or otherwise put them into whatever is the
correct state for the device-as-reset.

> +}

> +
>  static void imx2_wdt_write(void *opaque, hwaddr addr,
>                             uint64_t value, unsigned int size)
>  {
> -    if (addr == IMX2_WDT_WCR &&
> -        (~value & (IMX2_WDT_WCR_WDA | IMX2_WDT_WCR_SRS))) {
> -        watchdog_perform_action();
> +    IMX2WdtState *s = IMX2_WDT(opaque);
> +
> +    switch (addr) {
> +    case IMX2_WDT_WCR:
> +        s->wcr = value;
> +        if (!(value & IMX2_WDT_WCR_SRS)) {
> +            s->wrsr = IMX2_WDT_WRSR_SFTW;
> +        }
> +        if (!(value & (IMX2_WDT_WCR_WDA | IMX2_WDT_WCR_SRS)) ||
> +            (!(value & IMX2_WDT_WCR_WT) && (value & IMX2_WDT_WCR_WDE))) {
> +            watchdog_perform_action();
> +        }
> +        s->wcr |= IMX2_WDT_WCR_SRS;
> +        imx_wdt2_update_timer(s, true);
> +        break;
> +    case IMX2_WDT_WSR:
> +        if (s->wsr == IMX2_WDT_SEQ1 && value == IMX2_WDT_SEQ2) {
> +            imx_wdt2_update_timer(s, false);
> +        }
> +        s->wsr = value;
> +        break;
> +    case IMX2_WDT_WRSR:
> +        break;
> +    case IMX2_WDT_WICR:
> +        if (!s->pretimeout_support) {
> +            return;
> +        }
> +        /* The pretimeout value is write-once */

My imx6 manual says that the WICR WIE bit is also write-once,
so I think that changes to it should also be guarded under
!pretimeout_locked, like the WICT bits.

(In fact quite a lot of registers seem to have write-once bits.)

> +        if (s->pretimeout_locked) {
> +            value &= ~IMX2_WDT_WICR_WICT;
> +            s->wicr &= (IMX2_WDT_WICR_WTIS | IMX2_WDT_WICR_WICT);
> +        } else {
> +            s->wicr &= IMX2_WDT_WICR_WTIS;
> +        }
> +        s->wicr |= value & (IMX2_WDT_WICR_WIE | IMX2_WDT_WICR_WICT);
> +        if (value & IMX2_WDT_WICR_WTIS) {
> +            s->wicr &= ~IMX2_WDT_WICR_WTIS;
> +            qemu_set_irq(s->irq, 0);
> +        }
> +        imx_wdt2_update_itimer(s, true);
> +        s->pretimeout_locked = true;
> +        break;
> +    case IMX2_WDT_WMCR:
> +        s->wmcr = value & IMX2_WDT_WMCR_PDE;
> +        break;
>      }
>  }

>  static void imx2_wdt_realize(DeviceState *dev, Error **errp)
>  {
>      IMX2WdtState *s = IMX2_WDT(dev);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>
>      memory_region_init_io(&s->mmio, OBJECT(dev),
>                            &imx2_wdt_ops, s,
> -                          TYPE_IMX2_WDT".mmio",
> -                          IMX2_WDT_REG_NUM * sizeof(uint16_t));
> -    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
> +                          TYPE_IMX2_WDT,
> +                          IMX2_WDT_MMIO_SIZE);
> +    sysbus_init_mmio(sbd, &s->mmio);
> +    sysbus_init_irq(sbd, &s->irq);
> +
> +    s->timer = ptimer_init(imx2_wdt_expired, s, PTIMER_POLICY_DEFAULT);

PTIMER_POLICY_DEFAULT is almost never the right thing: it
basically means "same as the old legacy behaviour of our
first somewhat-broken implementation of ptimer". The comments
in include/hw/ptimer.h suggests some behaviours real timers
tend to have which can be enabled with suitable bits.
If the default really is the right thing for this timer then
a comment is helpful to indicate that we've looked at this
and made an active decision to use the 'default' rather than
the timer implementation just having been grandfathered in.


> +    ptimer_transaction_begin(s->timer);
> +    ptimer_set_freq(s->timer, 2);
> +    ptimer_set_limit(s->timer, 0xff, 1);
> +    ptimer_transaction_commit(s->timer);
> +    if (s->pretimeout_support) {
> +        s->itimer = ptimer_init(imx2_wdt_interrupt, s, PTIMER_POLICY_DEFAULT);
> +        ptimer_transaction_begin(s->itimer);
> +        ptimer_set_freq(s->itimer, 2);
> +        ptimer_set_limit(s->itimer, 0xff, 1);
> +        ptimer_transaction_commit(s->itimer);
> +    }
>  }

thanks
-- PMM
