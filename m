Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp52607lfb;
        Sun, 20 Mar 2022 03:08:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPTyF6h6dAR+WuT2D1nAlUCAPe+SDYQHqvsFu9P4IBU9H0SdIJ4iUQ9CitMJZlggVejXIC
X-Received: by 2002:ac8:5c07:0:b0:2e1:edb6:69a6 with SMTP id i7-20020ac85c07000000b002e1edb669a6mr12881183qti.83.1647770885089;
        Sun, 20 Mar 2022 03:08:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647770885; cv=none;
        d=google.com; s=arc-20160816;
        b=Tb1s0t1AyddoDh+zFJj0yKsZiPbdxiJxjjdYKas7eZrZMekqAnU89xi8uMoMbZxTbI
         Ufao6u7Na3VkQAsQEuU0E7dG+MR07nVqDte0QKlGydUZCSpoXJmdUM/STJ6s514co/S8
         0CCuvmfBy8eWBAlMF4hzYNySCuwHlnkYOGoxGZg4XK7ZgPzBzZimj8Q6St51z86k5esS
         sqtebc0tzzillQMa1ToaBgxO8R5q8w+3PRcD92yO8fTZB9jqmSftkEhglP9YQhSYj4q4
         MOMTyvRsHnD6/W5eLtlYRMSmfkMjMbRYhwjDF1ax+AKQZbdphOtCMnxxj93V71xuRJbY
         A5BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F/CgasYLAF0n3qXvxgdzxewrRHRhAwGR7hjt3C8Fdz4=;
        b=BFIJOLN0MtVBeb2Z4he8JvSNpXuQ5dVY7aeFlg9b++h9VKiIrTwu12wfP68EnsatYE
         LeRP3urN+nk8zjskuces9ouFV5TAj0RU50JGUlKLqT0bLTA0RUbvH154ryCjL9HYo2uP
         flM6Sg2OfHg0KwLCXoajDNi5Iz53xziSOnxG9yfMsillXm2LpMGSpSY5LXP3jcG2Mhn0
         kX31Orplw59vFNavO0NUcA+uckqpYXjkWWCy/7A3rId/yBkGh6rLf+p1boEVSPg1HQFD
         EGY2ErhJ/rxovT/63z2TAhIv24ScUqY4UQu9XCsYwjP57t1tInuYl1CebQRxIaw3JsU3
         eG5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=l+5COkIu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i5-20020a05620a248500b0067e4be23833si1230922qkn.120.2022.03.20.03.08.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Mar 2022 03:08:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=l+5COkIu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nVsTk-0007cY-CD
	for alex.bennee@linaro.org; Sun, 20 Mar 2022 06:08:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVsTM-0007bu-De
 for qemu-arm@nongnu.org; Sun, 20 Mar 2022 06:07:40 -0400
Received: from [2607:f8b0:4864:20::1135] (port=39970
 helo=mail-yw1-x1135.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVsTK-00079B-H4
 for qemu-arm@nongnu.org; Sun, 20 Mar 2022 06:07:40 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-2e5e9025c20so46259817b3.7
 for <qemu-arm@nongnu.org>; Sun, 20 Mar 2022 03:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F/CgasYLAF0n3qXvxgdzxewrRHRhAwGR7hjt3C8Fdz4=;
 b=l+5COkIuLIZMw6cizdnz1xi1YdONgy/6FKG1vnfzjT8XVA7q95lI3G0CxSGh+0t9Qo
 aRxoTl0DzgXYwQ2H1QB2OVFbPQk+2WhCOAKNS3gc4J6K4MGN5y+P/qMfx1cREfGAsRHi
 e2unh0klZ4u+mLq7yybU9VV6Dx/azqHCkUxGwKXYmcwNs/Y9Q+c5XtS7ZRKVPHF07hbD
 nqwBS2bPTcxAmjeNUG5TfODQXOK0aCsYQd4lVyiu34+QU7ST1TUHzItO9jgMoDKFZzMf
 uVZ82CGE4HXlnGz/1oKAOGZ6u2eOVSf4DjNXTULaQuzDLKbYzuQvNc18wh7xcVd1rlom
 2FLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F/CgasYLAF0n3qXvxgdzxewrRHRhAwGR7hjt3C8Fdz4=;
 b=V0bB+QyPCgU/O7mOdet5DEXQbDyOfezKPmFBYzsnuRdhkZxf7Apv4LoXhO8tRmuScr
 ROSuirtlrvP+3RmpFIanJYeZlbzU4oWeC6Ujq2EVBFw0Fj185hQs3R4Ugo5sEPSgn7Cl
 j5JwYw5NQfE02sVY4hjl5dPlLTvkQ4uaLsQvzZUCH8FwBd94EMZxSTt1EOQQREh93drI
 K1GJ4NI9JRWAMeUTwHb0NBRjWtaWV3HH2uIIeTt455EUUApMbFIer02NB4heY0/93r9D
 ParI2pvyWiVnj+5pqf2Pu18PeolbyFU8RczxGUnuPYnMW6BOH93/DyyM9xHvIc8QagJF
 86dg==
X-Gm-Message-State: AOAM5331eMAqaDn9YCw72BzWfO7U7y3wkDVs+oElsLOh6XKbgQGOS1fh
 PP1zTCHnrqtApH13H8Sd8qrlpJ4tjzvCbGdPxeTmAnSVItYK5w==
X-Received: by 2002:a81:1151:0:b0:2e5:99ec:9933 with SMTP id
 78-20020a811151000000b002e599ec9933mr18284088ywr.64.1647770856795; Sun, 20
 Mar 2022 03:07:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220319193214.56553-1-zongyuan.li@smartx.com>
 <20220319193214.56553-2-zongyuan.li@smartx.com>
In-Reply-To: <20220319193214.56553-2-zongyuan.li@smartx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 20 Mar 2022 10:07:24 +0000
Message-ID: <CAFEAcA8WQarGR-XponK9eh_hfedJYt2B2XmNJLkWtFK4VhT5RA@mail.gmail.com>
Subject: Re: [RFC PATCH v1 1/1] hw/arm/realview: replace 'qemu_split_irq' with
 'TYPE_SPLIT_IRQ'
To: Zongyuan Li <zongyuan.li@smartx.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1135
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: "open list:Real View" <qemu-arm@nongnu.org>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Spuobs2JIQcX

On Sat, 19 Mar 2022 at 19:32, Zongyuan Li <zongyuan.li@smartx.com> wrote:
>
> Signed-off-by: Zongyuan Li <zongyuan.li@smartx.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/811

Thanks for this patch.

> +#include "hw/qdev-core.h"
>  #include "qemu/osdep.h"

The osdep.h include must always be first in every .c file.
Put new #include lines below it, not above it.

>  #include "qapi/error.h"
>  #include "cpu.h"
>  #include "hw/sysbus.h"
>  #include "hw/arm/boot.h"
>  #include "hw/arm/primecell.h"
> +#include "hw/core/split-irq.h"
>  #include "hw/net/lan9118.h"
>  #include "hw/net/smc91c111.h"
>  #include "hw/pci/pci.h"
>  #include "net/net.h"
> +#include "qom/object.h"
>  #include "sysemu/sysemu.h"
>  #include "hw/boards.h"
>  #include "hw/i2c/i2c.h"
> @@ -27,6 +30,7 @@
>  #include "hw/irq.h"
>  #include "hw/i2c/arm_sbcon_i2c.h"
>  #include "hw/sd/sd.h"
> +#include <stdarg.h>

This include should not be necessary -- osdep.h provides it for you.

>
>  #define SMP_BOOT_ADDR 0xe0000000
>  #define SMP_BOOTREG_ADDR 0x10000030
> @@ -53,6 +57,30 @@ static const int realview_board_id[] = {
>      0x76d
>  };
>
> +static bool split_to_irq_varargs(Object *obj, int nums_of_output, ...) {
> +    int i;
> +    va_list va;
> +    qemu_irq output;
> +    Object *src_irq= object_new(TYPE_SPLIT_IRQ);
> +
> +    if (!object_property_set_int(src_irq, "num-lines", nums_of_output, &error_fatal)) {
> +        return false;
> +    }
> +
> +    if (!qdev_realize(DEVICE(src_irq), NULL, &error_fatal)) {
> +        return false;
> +    }

In board code, prefer to create this device with
qdev_new() and then realize it with
qdev_realize_and_unref(). There's an example in
hw/openrisc/openrisc_sim.c. (NB: for splitters and other
devices created in SoC device objects rather than board code,
the pattern will be different.)

> +
> +    va_start(va, nums_of_output);
> +    for (i = 0; i < nums_of_output; i++) {
> +        output = va_arg(va, qemu_irq);
> +        qdev_connect_gpio_out(DEVICE(src_irq), i, output);
> +    }
> +       va_end(va);
> +
> +    return true;
> +}

I think this varargs function is unnecessarily complicated. We only
create two split devices here, and they are always with a fixed
number of output. Just write the "create splitter and wire it up"
code directly. Again, the openrisc_sim.c code is a good example.

> +
>  static void realview_init(MachineState *machine,
>                            enum realview_board_type board_type)
>  {
> @@ -67,6 +95,8 @@ static void realview_init(MachineState *machine,
>      SysBusDevice *busdev;
>      qemu_irq pic[64];
>      qemu_irq mmc_irq[2];
> +    Object *mmc_irq_for_ro = object_new(TYPE_SPLIT_IRQ);
> +    Object *mmc_irq_for_cardin = object_new(TYPE_SPLIT_IRQ);

You seem to be creating the splitter objects both here and also
in your split_to_irq_varargs() function...

>      PCIBus *pci_bus = NULL;
>      NICInfo *nd;
>      DriveInfo *dinfo;
> @@ -229,14 +259,20 @@ static void realview_init(MachineState *machine,
>       * and the PL061 has them the other way about. Also the card
>       * detect line is inverted.
>       */
> -    mmc_irq[0] = qemu_irq_split(
> -        qdev_get_gpio_in(sysctl, ARM_SYSCTL_GPIO_MMC_WPROT),
> -        qdev_get_gpio_in(gpio2, 1));
> -    mmc_irq[1] = qemu_irq_split(
> -        qdev_get_gpio_in(sysctl, ARM_SYSCTL_GPIO_MMC_CARDIN),
> -        qemu_irq_invert(qdev_get_gpio_in(gpio2, 0)));
> -    qdev_connect_gpio_out_named(dev, "card-read-only", 0, mmc_irq[0]);
> -    qdev_connect_gpio_out_named(dev, "card-inserted", 0, mmc_irq[1]);
> +    if (!split_to_irq_varargs(mmc_irq_for_ro, 2,
> +                              qdev_get_gpio_in(sysctl, ARM_SYSCTL_GPIO_MMC_WPROT),
> +                              qdev_get_gpio_in(gpio2, 1))) {
> +        return;
> +    }
> +    qdev_connect_gpio_out_named(dev, "card-read-only", 0, DEVICE(mmc_irq_for_ro));
> +
> +    if (!split_to_irq_varargs(mmc_irq_for_cardin, 2,
> +                              qdev_get_gpio_in(sysctl, ARM_SYSCTL_GPIO_MMC_CARDIN),
> +                              qemu_irq_invert(qdev_get_gpio_in(gpio2, 0)))) {
> +        return;
> +    }
> +    qdev_connect_gpio_out_named(dev, "card-inserted", 0, DEVICE(mmc_irq_for_cardin));
> +
>      dinfo = drive_get(IF_SD, 0, 0);
>      if (dinfo) {
>          DeviceState *card;
> --
> 2.34.0

thanks
-- PMM
