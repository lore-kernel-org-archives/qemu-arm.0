Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp922331eji;
        Mon, 18 Dec 2023 08:41:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF2vXpSTO5p0nA6wvK22YhedI0otgy0Uwf7ZbB1XHZ9oCoAZlZ7vBVq0B8CYQ5eP3RKPO9l
X-Received: by 2002:a05:6214:4118:b0:67f:40e8:de34 with SMTP id kc24-20020a056214411800b0067f40e8de34mr2470655qvb.4.1702917714869;
        Mon, 18 Dec 2023 08:41:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702917714; cv=none;
        d=google.com; s=arc-20160816;
        b=DVpiMnxN7lBuIiULGNEkLuOAqloKQEg1vi/ltaS++WxwT+AZT0K3OZpDgyjmhCr/ar
         NJWYJdFfPXLZhtg0MysurP3SOW35Jr0pVYYnnEhIcAlCIkqfjY1lSMpDcRULZ/yCf20m
         W4HgeEZ0nZdFb3ySk4n2U6/XCNnOgw8kpG2Xhn0mm5/0Z6SgYB+u8jQEU+MFN90qt40Y
         Zt5UzmYhYL1Bs6bcJkMm4jt3d+O2kxwSDmsfJAMGheFGpHpQU1EqdtS/XOuiMsHKRxdK
         xHjlxqQ6XnPxK/QotXi39dpvkTIZ8AN6bTNGrOg9gp6oA2xzafabxot1MEDfuKFPhNUN
         xNSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=DnRd5fNcsD03vuFGrT23ASKpRhWRVtXIKT5M3YKw78I=;
        fh=gdBed72JnSifzQdV0PLkUCrNnp2PjbNCgzXbyzmTG1w=;
        b=WBWEA6/7KwHrZIYnfnOyO4NZSfTqwri6cXX8Stj5ndsO4dHve24MCmaV5Ds8sYMMI0
         rqXwfYgjZ1hZOLEaXol1KLNB1OeE22KAeRUhp9LwxqEaTUyCtLv0Oxxh8xwiyws1iNkK
         sLSBuouxB5hMuMr9PrIcxhRDCsngN9PI90KgUnLOjxapAGqXpgzXrK44RVW3dI3HHEhR
         M/WYpk1xeKJb7BHtI3LXqbsQCk+/VgFPNDUt3MRmWkqN8xkgJ4/iIZO6pghub+u8YVzQ
         SZ7812cynbQjKyd0klx2/wZ46maecaYM7BisKNdToVry10/25N/DLdulb44XnoVit2Ze
         KoSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VW3ssgUw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c11-20020a0ce14b000000b0067f2955aec5si5536751qvl.242.2023.12.18.08.41.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Dec 2023 08:41:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VW3ssgUw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rFGgW-000666-My; Mon, 18 Dec 2023 11:41:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFGgV-00065b-OC
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 11:41:39 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFGgT-0001vw-8L
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 11:41:39 -0500
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5532b45c286so2094104a12.0
 for <qemu-arm@nongnu.org>; Mon, 18 Dec 2023 08:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702917695; x=1703522495; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DnRd5fNcsD03vuFGrT23ASKpRhWRVtXIKT5M3YKw78I=;
 b=VW3ssgUwvF9wmX322i96XKfeTjIs1du3BuDs8laFac8YjQ2lQhL9PZZ8eoaE4ZfVqF
 NqBq64gsmaE/cKwBnqUHjBd+RMQJ6OvKgjFN8/zpB7U3qNHS+kiBnsSFOkILgxp2bmRF
 zXiWgiXBsNRRgE1oCo0z0pZ5zjLaHFHWkxDLRV61hgMueyJGCerSsMXLavIkFyYG+D1I
 4t6TmqRPZMIMSD73fBgvqIWeiG0XnuxP60YVBiWnENT6mLG4mB9JDXQ+Uw9w/oyNPil3
 zraKfgNNadSXKClMJoxB+25CRKh8nZ6TiOkVVsbjsxNdeF7+7upgdFxfQX6YeQhVexbP
 c4NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702917695; x=1703522495;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DnRd5fNcsD03vuFGrT23ASKpRhWRVtXIKT5M3YKw78I=;
 b=XBa7qhWithYuzeemOOyr09Xq63/tbHYkAZ25AFosamCj1GkUrIpO4uoPkKcH8KMykl
 L8LhaOY9jdoIMYkhBSdGXnSgGZdcgYff/HIfCT5fy1ArbG52/fL3kcKT2w5NPUZ96Rc6
 WgW0nPXlUP2siFBfWYRP+iScTbYQHrHWG3cLFizr2qyJC72BVnVD1lgsmFfGsOuB3IIP
 hu+UNlRGqRNjT31nr49iOnuqpC/0AWxlvJFvVPsW5u51CE4eTVW3HicOpT66mY4jqAZU
 xgkNawWxbQ4oTHspM4kI9W4x7P2yVHcL1tOG35/uF/2KXNELMyADS0y/D14QN8W2nmF9
 +k3Q==
X-Gm-Message-State: AOJu0YwUg4wymDVn4cV5XabVPRwekDZZNw919p4Wrp6l1N7CVn7ZSHIk
 fCZrvGbu4He8mGZelM70d+soojEsxK7SU67nz6AR/Q==
X-Received: by 2002:a50:e60b:0:b0:54c:4fec:11a with SMTP id
 y11-20020a50e60b000000b0054c4fec011amr4927814edm.169.1702917695279; Mon, 18
 Dec 2023 08:41:35 -0800 (PST)
MIME-Version: 1.0
References: <20231208023145.1385775-1-sergey.kambalin@auriga.com>
 <20231208023145.1385775-10-sergey.kambalin@auriga.com>
In-Reply-To: <20231208023145.1385775-10-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Dec 2023 16:41:24 +0000
Message-ID: <CAFEAcA9HM14SO_eA+5RdpxABTk0M82+e625feJCuZBafA+sdUg@mail.gmail.com>
Subject: Re: [PATCH v4 09/45] Add GPIO and SD to BCM2838 periph
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: pJVPwL//NFOZ

On Fri, 8 Dec 2023 at 02:37, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>  hw/arm/bcm2838_peripherals.c         | 140 +++++++++++++++++++++++++++
>  include/hw/arm/bcm2838_peripherals.h |   9 ++
>  2 files changed, 149 insertions(+)


> @@ -42,6 +73,115 @@ static void bcm2838_peripherals_realize(DeviceState *dev, Error **errp)
>                                          BCM2838_VC_PERI_LOW_BASE,
>                                          &s->peri_low_mr_alias, 1);
>
> +    /* Extended Mass Media Controller 2 */
> +    object_property_set_uint(OBJECT(&s->emmc2), "sd-spec-version", 3,
> +                             &error_abort);
> +    object_property_set_uint(OBJECT(&s->emmc2), "capareg",
> +                             BCM2835_SDHC_CAPAREG, &error_abort);
> +    object_property_set_bool(OBJECT(&s->emmc2), "pending-insert-quirk", true,
> +                             &error_abort);
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->emmc2), errp)) {
> +        return;
> +    }
> +
> +    memory_region_add_subregion(
> +        &s_base->peri_mr, EMMC2_OFFSET,
> +        sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->emmc2), 0));

Odd indent again here...

> +
> +    /* According to DTS, EMMC and EMMC2 share one irq */
> +    if (!qdev_realize(DEVICE(&s->mmc_irq_orgate), NULL, errp)) {
> +        return;
> +    }
> +
> +    DeviceState *mmc_irq_orgate = DEVICE(&s->mmc_irq_orgate);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->emmc2), 0,
> +                        qdev_get_gpio_in(mmc_irq_orgate, 0));
> +
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s_base->sdhci), 0,
> +                        qdev_get_gpio_in(mmc_irq_orgate, 1));

...and here.

> +
> +   /* Connect EMMC and EMMC2 to the interrupt controller */
> +    qdev_connect_gpio_out(mmc_irq_orgate, 0,
> +                          qdev_get_gpio_in_named(DEVICE(&s_base->ic),
> +                                                 BCM2835_IC_GPU_IRQ,
> +                                                 INTERRUPT_ARASANSDIO));
> +
> +    /* Connect DMA 0-6 to the interrupt controller */
> +    for (n = 0; n < 7; n++) {
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s_base->dma), n,
> +                           qdev_get_gpio_in_named(DEVICE(&s_base->ic),
> +                                                  BCM2835_IC_GPU_IRQ,
> +                                                  GPU_INTERRUPT_DMA0 + n));
> +    }
> +
> +   /* According to DTS, DMA 7 and 8 share one irq */
> +    if (!qdev_realize(DEVICE(&s->dma_7_8_irq_orgate), NULL, errp)) {
> +        return;
> +    }
> +    DeviceState *dma_7_8_irq_orgate = DEVICE(&s->dma_7_8_irq_orgate);

Declaration not at top of code block (here and below).


Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
