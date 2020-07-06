Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp171323lfm;
        Mon, 6 Jul 2020 10:16:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7sFa1+lbrlyfOya2Gw50+Uv/NHk5jmP9CfbKAUeTQJMJGBMSBDQyRbEbAO3F114+wF4nP
X-Received: by 2002:a25:138a:: with SMTP id 132mr32877529ybt.334.1594055771705;
        Mon, 06 Jul 2020 10:16:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594055771; cv=none;
        d=google.com; s=arc-20160816;
        b=kiWImKKIFvWjbRgoWMuFe9vJ4kVEXrI3xn5UGa/rzWhrGfYHPZ8e8on+MRDW9TZ8xu
         Wl0xuP4RriL2zZI5Tyls0MLtEa2tshpiWgKUzbaxo7GSPAmrD/JKuFLp0wBG71HWm2Q6
         /FsbcEeppLdPuSl4wgZ4RdpKsKgtbDsBVkl/IpyaYqllnotFVSde4pbPr6ASetbhSigo
         antzTRBAjIUqvHMilVSWcTg2YPMzqiLoB/j5cV4enbImDvsM+kUEoWAUFbRDrU3BpEau
         CXQpcO08/EmsWWrgfjkWVaM08xoNN2MgL/Jfmmi5qiAeb6+ba/BYVuBsqTPaty5eV0Tu
         Otww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=ghXchj3um6Pn/VL2e/vxVCYYlGV97OajaQt+uKewb7Q=;
        b=YRHoyUmt12TC9xHrRVYCmLhh4pHXE57a/CKR1yBJrqpMOEmOtYlb9cPsxxNJwDg2y9
         49iCcFGJBfWDvSupYc4nVkAPdgmYHxuJw0LsPPDWJc6vS0j8OydEXLOjaqcpFBf+tDpN
         Mrk66D412lopVrELJEBNnex88j7EP4hkhuqFBFJW80t8SNZpxb7gJau82lX3njv4bzlu
         wzrwCAifuiIndBjIqAa0zZ/gWEOaztvzkEN7YB7irMj67+HabxGY0vf4z9UQVWqq2/GB
         lcBuDiUQHkY1nW42cDWNgpauyesR2zz3+Tw+VALzQlyJxT0LJnC64ZrpT822kqMCMgJe
         5/Aw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="gcllo2/b";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x68si19397872ybg.110.2020.07.06.10.16.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jul 2020 10:16:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="gcllo2/b";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jsUix-0007q0-0C
	for alex.bennee@linaro.org; Mon, 06 Jul 2020 13:16:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jsUHr-0006KS-4k; Mon, 06 Jul 2020 12:48:11 -0400
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144]:35067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jsUHp-0004JD-9Q; Mon, 06 Jul 2020 12:48:10 -0400
Received: by mail-il1-x144.google.com with SMTP id t18so13554820ilh.2;
 Mon, 06 Jul 2020 09:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ghXchj3um6Pn/VL2e/vxVCYYlGV97OajaQt+uKewb7Q=;
 b=gcllo2/bIIMmAXuudNSj/PMzTP1HUPloYdRIVK+mcAhySnXw45KBiFuA3Y1grIYAJE
 rMHuj1fgmzh4Ej9REPUkeUTZZ3DFHA2HpQen3WKBZ2J2q13IuHDQEs9Fl5zAv9yyQ8Up
 RwFYDomabB3S/Xi1x9uLQ/7qsFKQe6Pt6N2PlnDo3PXVHK4d3yIp/OJcbJYedyhVPxue
 g4wpaj/eBjsZDIHttEngYaY4qlI7vRQ4F0fsgZ5AdNzLgpgmmc6eHiNoVbAkDfF1vJuq
 pPGyrOUtthisNk4v/IXeAPxxhwbJXZPnleIyd5oRA7G1+3mYDAn4FyHdV6Ki6enR1HlR
 aglg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ghXchj3um6Pn/VL2e/vxVCYYlGV97OajaQt+uKewb7Q=;
 b=iBY23yiMXOMZA7L7alKRSFkt6BCVXp3FrJEHTsIoGU7Tdq0Jg+/z6qDusZIebppfck
 QZoRSWvEekavk4nlpPiu/67kNxQPQabcgAeqJuI36Mz1aHn7KLjYyR7FKJxOFe3nmgkn
 raC+A2AI3Zp2yNaP5NVysY+S8SnKr0JapBU6HaoF+PucOQHOZyrfQGCtKTvK2SNSWDr0
 wAO7Jez0KAjdidzCkcqRmT5h5iF0Sck0ZWT6dzmqrQrhLqNlnwzEgd54N2wURfjKTT0x
 /UHbgLcV2ekx5dDLCiyhObS1XFLYEk9HbkAywwTzSxoS+SRanWqB3cChlCot414OYV/L
 riaw==
X-Gm-Message-State: AOAM531FpQk89DkY0yhrfTtmqjZSujSaEgYiJ/ciiFJXsoY6Cgk+RItS
 rpC5F8rwhjs2639/ORxPPbZ5l2PN3U2u4IQv0Lo=
X-Received: by 2002:a92:c213:: with SMTP id j19mr31544813ilo.40.1594054087802; 
 Mon, 06 Jul 2020 09:48:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200705213350.24725-1-f4bug@amsat.org>
 <20200705213350.24725-2-f4bug@amsat.org>
In-Reply-To: <20200705213350.24725-2-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jul 2020 09:38:20 -0700
Message-ID: <CAKmqyKNZ13Kjax9jU+sk6eWxMm7W8UCOXuRMcioT2JiK9KA_7Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/sd/pxa2xx_mmci: Do not create SD card within the
 SDHCI controller
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::144;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x144.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /GsvnH8qje20

On Sun, Jul 5, 2020 at 2:34 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> SDHCI controllers provide a SD Bus to plug SD cards, but don't
> come with SD card plugged in :) Let the machine/board object
> create and plug the SD cards when required.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/arm/pxa.h |  3 +--
>  hw/arm/pxa2xx.c      | 39 +++++++++++++++++++++++++++++----------
>  hw/sd/pxa2xx_mmci.c  | 11 ++---------
>  3 files changed, 32 insertions(+), 21 deletions(-)
>
> diff --git a/include/hw/arm/pxa.h b/include/hw/arm/pxa.h
> index 8843e5f910..d99b6192da 100644
> --- a/include/hw/arm/pxa.h
> +++ b/include/hw/arm/pxa.h
> @@ -89,8 +89,7 @@ void pxa2xx_lcd_vsync_notifier(PXA2xxLCDState *s, qemu_=
irq handler);
>  typedef struct PXA2xxMMCIState PXA2xxMMCIState;
>  PXA2xxMMCIState *pxa2xx_mmci_init(MemoryRegion *sysmem,
>                  hwaddr base,
> -                BlockBackend *blk, qemu_irq irq,
> -                qemu_irq rx_dma, qemu_irq tx_dma);
> +                qemu_irq irq, qemu_irq rx_dma, qemu_irq tx_dma);
>  void pxa2xx_mmci_handlers(PXA2xxMMCIState *s, qemu_irq readonly,
>                  qemu_irq coverswitch);
>
> diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
> index f104a33463..78f6e69f63 100644
> --- a/hw/arm/pxa2xx.c
> +++ b/hw/arm/pxa2xx.c
> @@ -22,6 +22,7 @@
>  #include "hw/irq.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/ssi/ssi.h"
> +#include "hw/sd/sd.h"
>  #include "chardev/char-fe.h"
>  #include "sysemu/blockdev.h"
>  #include "sysemu/qtest.h"
> @@ -2135,15 +2136,24 @@ PXA2xxState *pxa270_init(MemoryRegion *address_sp=
ace,
>
>      s->gpio =3D pxa2xx_gpio_init(0x40e00000, s->cpu, s->pic, 121);
>
> -    dinfo =3D drive_get(IF_SD, 0, 0);
> -    if (!dinfo && !qtest_enabled()) {
> -        warn_report("missing SecureDigital device");
> -    }
>      s->mmc =3D pxa2xx_mmci_init(address_space, 0x41100000,
> -                    dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
>                      qdev_get_gpio_in(s->pic, PXA2XX_PIC_MMC),
>                      qdev_get_gpio_in(s->dma, PXA2XX_RX_RQ_MMCI),
>                      qdev_get_gpio_in(s->dma, PXA2XX_TX_RQ_MMCI));
> +    dinfo =3D drive_get(IF_SD, 0, 0);
> +    if (dinfo) {
> +        DeviceState *carddev;
> +
> +        /* Create and plug in the sd card */
> +        carddev =3D qdev_new(TYPE_SD_CARD);
> +        qdev_prop_set_drive_err(carddev, "drive",
> +                                blk_by_legacy_dinfo(dinfo), &error_fatal=
);
> +        qdev_realize_and_unref(carddev, qdev_get_child_bus(DEVICE(s->mmc=
),
> +                                                           "sd-bus"),
> +                               &error_fatal);
> +    } else if (!qtest_enabled()) {
> +        warn_report("missing SecureDigital device");
> +    }
>
>      for (i =3D 0; pxa270_serial[i].io_base; i++) {
>          if (serial_hd(i)) {
> @@ -2259,15 +2269,24 @@ PXA2xxState *pxa255_init(MemoryRegion *address_sp=
ace, unsigned int sdram_size)
>
>      s->gpio =3D pxa2xx_gpio_init(0x40e00000, s->cpu, s->pic, 85);
>
> -    dinfo =3D drive_get(IF_SD, 0, 0);
> -    if (!dinfo && !qtest_enabled()) {
> -        warn_report("missing SecureDigital device");
> -    }
>      s->mmc =3D pxa2xx_mmci_init(address_space, 0x41100000,
> -                    dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
>                      qdev_get_gpio_in(s->pic, PXA2XX_PIC_MMC),
>                      qdev_get_gpio_in(s->dma, PXA2XX_RX_RQ_MMCI),
>                      qdev_get_gpio_in(s->dma, PXA2XX_TX_RQ_MMCI));
> +    dinfo =3D drive_get(IF_SD, 0, 0);
> +    if (dinfo) {
> +        DeviceState *carddev;
> +
> +        /* Create and plug in the sd card */
> +        carddev =3D qdev_new(TYPE_SD_CARD);
> +        qdev_prop_set_drive_err(carddev, "drive",
> +                                blk_by_legacy_dinfo(dinfo), &error_fatal=
);
> +        qdev_realize_and_unref(carddev, qdev_get_child_bus(DEVICE(s->mmc=
),
> +                                                           "sd-bus"),
> +                               &error_fatal);
> +    } else if (!qtest_enabled()) {
> +        warn_report("missing SecureDigital device");
> +    }
>
>      for (i =3D 0; pxa255_serial[i].io_base; i++) {
>          if (serial_hd(i)) {
> diff --git a/hw/sd/pxa2xx_mmci.c b/hw/sd/pxa2xx_mmci.c
> index 68bed24480..9482b9212d 100644
> --- a/hw/sd/pxa2xx_mmci.c
> +++ b/hw/sd/pxa2xx_mmci.c
> @@ -476,10 +476,9 @@ static const MemoryRegionOps pxa2xx_mmci_ops =3D {
>
>  PXA2xxMMCIState *pxa2xx_mmci_init(MemoryRegion *sysmem,
>                  hwaddr base,
> -                BlockBackend *blk, qemu_irq irq,
> -                qemu_irq rx_dma, qemu_irq tx_dma)
> +                qemu_irq irq, qemu_irq rx_dma, qemu_irq tx_dma)
>  {
> -    DeviceState *dev, *carddev;
> +    DeviceState *dev;
>      SysBusDevice *sbd;
>      PXA2xxMMCIState *s;
>
> @@ -492,12 +491,6 @@ PXA2xxMMCIState *pxa2xx_mmci_init(MemoryRegion *sysm=
em,
>      qdev_connect_gpio_out_named(dev, "tx-dma", 0, tx_dma);
>      sysbus_realize_and_unref(sbd, &error_fatal);
>
> -    /* Create and plug in the sd card */
> -    carddev =3D qdev_new(TYPE_SD_CARD);
> -    qdev_prop_set_drive_err(carddev, "drive", blk, &error_fatal);
> -    qdev_realize_and_unref(carddev, qdev_get_child_bus(dev, "sd-bus"),
> -                           &error_fatal);
> -
>      return s;
>  }
>
> --
> 2.21.3
>
>
