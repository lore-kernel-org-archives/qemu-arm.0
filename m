Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp3212469lfb;
        Mon, 18 May 2020 09:58:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytPPMEPtu095Tpi1/zLZxDegtAlsjkpPztFmJlB5+SsrQBuMh6rRQmeIgNTzVo7e+uCMS0
X-Received: by 2002:ae9:ebcb:: with SMTP id b194mr16983714qkg.391.1589821113663;
        Mon, 18 May 2020 09:58:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589821113; cv=none;
        d=google.com; s=arc-20160816;
        b=S864xh37XV0lNLpOYDM0/MPE52gClMDIucS5/3G5DGNqYd2brEAG5slYn3+kJ5HDqy
         4m90NLxMOK2Wu8hXM67y/ZXErDunzBdNrgV86ol4GgDaFr8fn/vHPVOG6mT5RF67yyXc
         RDJ1tpRDd6Q5Tmc+JDf3cCIaA1AxB7FXwAn3HYuKxtyqhOTAJ7xS0weJADNqioTMLH9M
         99iuZL9T6f2BLJXlrpa63/83W/FFqPfYXrjKF7NCaXiNkvzRHv4MeP/6nHXsiNx4K6KU
         xKYKzRHaY9smBeArbIlGKZe+dR5DDUtw8XMoEly5U9PpgNH87TceuTN6alIYMZ7zcywG
         xqwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xOqpUizbZ52/ey8AistUihYLiyi7pkYwNA/587ExWso=;
        b=jPyIp6YKPFsx3U2bpmh95vC7nEwkSdysDJUwgDdUA3LMkWT/GMd0Z1Q2EsFEh1XRCB
         7M6D6wuu+CTVtJJdhxE7cMu+jPWXC+1T3HJsC/xUEYOWqQi++NbtkhlBSDoYSFmhc8gw
         h+SQTkKGjpSaULsCGcBidDJnk+DKlH08PNN3vv18kcdNOeGwrxPbJMquPQYFzA+dA0VC
         i4NOlnUJmO6rK+DBHajuYzxWWX+JVVyqeMb6ogSy+H/2cS/iCuLhXdYCF8fkar4IXor9
         OHc1zdLAHAayC2mAYs2FUTeUSy3SP97ttm/D8eMmiX+gbQyNxstsMyFMi6UIQmwp0Py0
         iYRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=c47bMeNs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d15si446071qvx.132.2020.05.18.09.58.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 May 2020 09:58:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=c47bMeNs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jaj61-00044Q-1Q
	for alex.bennee@linaro.org; Mon, 18 May 2020 12:58:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jaj5L-0002wO-6u; Mon, 18 May 2020 12:57:51 -0400
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142]:37838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jaj5K-00026x-8Y; Mon, 18 May 2020 12:57:50 -0400
Received: by mail-il1-x142.google.com with SMTP id n11so10561388ilj.4;
 Mon, 18 May 2020 09:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xOqpUizbZ52/ey8AistUihYLiyi7pkYwNA/587ExWso=;
 b=c47bMeNsDVWseZDl95wHpGzvmuv2bXSiWi9g9rAWckZtULOva5geMkOEh/XFXgC/ok
 bo3QMpULlc4wwWv/4sAr1IIHt/k6tGJUD1xmhFPHMvk6j5XwR1X0aZBAMN/V6KTnh/M8
 aA+vaCJS40/+W8O8xmEq1GCHxvxD9tPdmQLnVs7aByfR6Y405o3HDGErNur38lhgF5SM
 OaeBBQb4wYfafEtOzN8oUMpXTCeNHjlH69NLwzySpQQ/m6ji9564OxkI7cZyLMcbmhxU
 vtMK3LcAn7p/kCif7x574cZ/uXhd/un0O0WSfwpnS1u+HXpJEfywgoGDzfaSYMbmBWk9
 gvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xOqpUizbZ52/ey8AistUihYLiyi7pkYwNA/587ExWso=;
 b=BoG5BiL6zgDF7N/9oHG9BT/3VtOAEkdS0J2/vZ9rF3q7OE3DP9rlTLseOJ49UvAi4U
 /eqrDScUYzQaLHw2bBrNvt960ijddl2P3VECU1k4nfKVC8oTG2B8B/JRcFa8c3On+802
 OJUlXimY6d6nCGdZzm48mgSM0JpmzSq4b4DDd9UoeU+relSHS192qvZlNxDLid7r3kMi
 eJsceRDxjm4bPGqwW66eajD/gaezNH9pVN7ITcGEC2FE9itVGB+AJkWwzZZzU69OgUtG
 iaa+wXU8Y3D4TRqZiY8v5EV9On1IeSeiCnKGY0hFgBZYzhqE5WDT/GO0RF4z8YP396sr
 7uXQ==
X-Gm-Message-State: AOAM530VZCqGzZFXyj6MBAzIPBw5pQ10S+90cgyvtDwwqtAekGD9r+mT
 8GUjbDUy3Zj1qDjN7jNxMhsjXwdRL2VgzKbFoYE=
X-Received: by 2002:a05:6e02:52e:: with SMTP id
 h14mr3017842ils.177.1589821068312; 
 Mon, 18 May 2020 09:57:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200518050408.4579-1-armbru@redhat.com>
 <20200518050408.4579-2-armbru@redhat.com>
In-Reply-To: <20200518050408.4579-2-armbru@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 May 2020 09:48:56 -0700
Message-ID: <CAKmqyKOun2FyT+JR8cyrP9eQn9xFDAppFb4W12ym-TPGt9h7Hg@mail.gmail.com>
Subject: Re: [PATCH 01/24] arm/stm32f405: Fix realization of "stm32f2xx-adc"
 devices
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::142;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x142.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SI1voSq5a3L3

On Sun, May 17, 2020 at 10:06 PM Markus Armbruster <armbru@redhat.com> wrote:
>
> stm32f405_soc_initfn() creates six such devices, but
> stm32f405_soc_realize() realizes only one.  Affects machine
> netduinoplus2.
>
> I wonder how this ever worked.  If the "device becomes real only on
> realize" thing actually works, then we've always been missing five of
> six such devices, yet nobody noticed.

I must have just been testing the first ADC.

>
> Fix stm32f405_soc_realize() to realize all six.  Visible in "info
> qtree":
>
>      bus: main-system-bus
>        type System
>        dev: stm32f405-soc, id ""
>          cpu-type = "cortex-m4-arm-cpu"
>        dev: stm32f2xx-adc, id ""
>          gpio-out "sysbus-irq" 1
>     -    mmio ffffffffffffffff/00000000000000ff
>     +    mmio 0000000040012000/00000000000000ff
>        dev: stm32f2xx-adc, id ""
>          gpio-out "sysbus-irq" 1
>     -    mmio ffffffffffffffff/00000000000000ff
>     +    mmio 0000000040012000/00000000000000ff
>        dev: stm32f2xx-adc, id ""
>          gpio-out "sysbus-irq" 1
>     -    mmio ffffffffffffffff/00000000000000ff
>     +    mmio 0000000040012000/00000000000000ff
>        dev: stm32f2xx-adc, id ""
>          gpio-out "sysbus-irq" 1
>     -    mmio ffffffffffffffff/00000000000000ff
>     +    mmio 0000000040012000/00000000000000ff
>        dev: stm32f2xx-adc, id ""
>          gpio-out "sysbus-irq" 1
>          mmio 0000000040012000/00000000000000ff
>        dev: stm32f2xx-adc, id ""
>          gpio-out "sysbus-irq" 1
>     -    mmio ffffffffffffffff/00000000000000ff
>     +    mmio 0000000040012000/00000000000000ff
>        dev: armv7m, id ""
>
> The mmio addresses look suspicious.

Good catch, thanks :)

>
> Fixes: 529fc5fd3e18ace8f739afd02dc0953354f39442
> Cc: Alistair Francis <alistair@alistair23.me>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/stm32f405_soc.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/hw/arm/stm32f405_soc.c b/hw/arm/stm32f405_soc.c
> index 4f10ce6176..4649502711 100644
> --- a/hw/arm/stm32f405_soc.c
> +++ b/hw/arm/stm32f405_soc.c
> @@ -185,16 +185,18 @@ static void stm32f405_soc_realize(DeviceState *dev_soc, Error **errp)
>      qdev_connect_gpio_out(DEVICE(&s->adc_irqs), 0,
>                            qdev_get_gpio_in(armv7m, ADC_IRQ));
>
> -    dev = DEVICE(&(s->adc[i]));
> -    object_property_set_bool(OBJECT(&s->adc[i]), true, "realized", &err);
> -    if (err != NULL) {
> -        error_propagate(errp, err);
> -        return;
> +    for (i = 0; i < STM_NUM_ADCS; i++) {
> +        dev = DEVICE(&(s->adc[i]));
> +        object_property_set_bool(OBJECT(&s->adc[i]), true, "realized", &err);
> +        if (err != NULL) {
> +            error_propagate(errp, err);
> +            return;
> +        }
> +        busdev = SYS_BUS_DEVICE(dev);
> +        sysbus_mmio_map(busdev, 0, ADC_ADDR);
> +        sysbus_connect_irq(busdev, 0,
> +                           qdev_get_gpio_in(DEVICE(&s->adc_irqs), i));
>      }
> -    busdev = SYS_BUS_DEVICE(dev);
> -    sysbus_mmio_map(busdev, 0, ADC_ADDR);
> -    sysbus_connect_irq(busdev, 0,
> -                       qdev_get_gpio_in(DEVICE(&s->adc_irqs), i));
>
>      /* SPI devices */
>      for (i = 0; i < STM_NUM_SPIS; i++) {
> --
> 2.21.1
>
>
