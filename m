Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp144364wrm;
        Thu, 17 Oct 2019 17:05:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz3xs50xTe1uhLemmx2ceAzTCmZCrd98IZ0M4ym8+0se3jDVJTMEABdZXFsx4sqfxb1Jb6Q
X-Received: by 2002:ac8:7152:: with SMTP id h18mr6999336qtp.377.1571357144422;
        Thu, 17 Oct 2019 17:05:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571357144; cv=none;
        d=google.com; s=arc-20160816;
        b=QYPo87Vax+4gepwhhdPFlQpU+s2PKdLhBLXlKIgF5ifirm7zP+My/nXiqXD8H1siIk
         /KBILd6g+PhQ59ekw14egDn6BQOAcjDRTthAEFloujWiyuMaE7ort7XKNhd/q3E9SJMa
         GAv8CfZelIp7/VUi4lFT7/ZqQGVPplrfKNPyjTgdp96ZKD1csC5oCs/iO0OjO/8TyVjK
         13JD1eZewz0CIskJKyOpxqZ4aLcYuPz0xNkCHXzy/nuQONoyoZY+nzyZWJL164rI9S9V
         Xd9mvFDCTE9kAiamGJT9DOBVq3tz1U/CIwMsSZpM6B+c0srnxZrXW60ZdMkxXsXUNEJ+
         9qRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=jfsReMyQtklLgqDiJUlJtwJEYrv42gE31qbx0Xhhz4Q=;
        b=k1dhJupkFZsVhyfddSbPgxKayUPMU7IjfjLOuIgqVXl4ZwNE4aMIaBQrnS7gnB2Kfs
         sVkvSlvpNw66sVUhZCua5CySsNVq4lZyzN2Jn2JuCfJmKczKgLhWgzjoYrX7pk7y4/By
         nEIE2AeE2sVQfsluezASj3VKcV5rEasVgOGZ2gpv+B0zrXGKKpxGgYV1VaizvqIDklfO
         cdGmQSc46Dpzql2+shQEWlGkRLl9HfITPGEhgNQ8EN9R6jpnODwGZ0dIq4Ff9rwnGbWQ
         icP0gyUDvDWDeuheQw4ccj70CLNOezPAmCsvMh5pMdZn8/gGwA+BwyLiE4O3YoL+blEe
         NsWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=agVF6TNr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r26si3754968qtj.387.2019.10.17.17.05.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 17:05:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=agVF6TNr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLFm3-0004GX-Pn
	for alex.bennee@linaro.org; Thu, 17 Oct 2019 20:05:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46051)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iLFlZ-00048s-Qg
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 20:05:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iLFlW-0007dK-5D
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 20:05:13 -0400
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:35465)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iLFlN-0007Yc-N7; Thu, 17 Oct 2019 20:05:01 -0400
Received: by mail-lj1-x241.google.com with SMTP id m7so4363883lji.2;
 Thu, 17 Oct 2019 17:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jfsReMyQtklLgqDiJUlJtwJEYrv42gE31qbx0Xhhz4Q=;
 b=agVF6TNrcN1AwHJ65Gz//fhlqgUu7RxMoFiLchi/pHh104XWbbbGzg8Gp6nclWfn1m
 yj37uoXdxGFVTrg8/exQLoiBHADsRXxPyvSYcMS9T0+hZqnk8mN/QkF5QW2VcyNF8wIJ
 gmMIZIqvkS/oweWZdfWqk77cPJlcFAjCwAjZySzdGSh+F/ZKq9FATMJThmyk0ydD0fJg
 GzfHW0CLCYUaL2+8wzKbaJMSTgfkQAE9JKNUdwiBiPFu0i8ah4Kku/NjEc9T6CxVSG4I
 lhrB2IjUYyk4D++nqR0+pYXNUzgQHXOopThJQYzXCIz295a2NjJgjtXuw3yq8yeYyzB5
 1jQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jfsReMyQtklLgqDiJUlJtwJEYrv42gE31qbx0Xhhz4Q=;
 b=IobSLeCM9nMIkoFlRGvK3CO+h1HDo5kugG5uTf+6/TLK4DgxJplARI9CcbV45af7Aw
 aoMN8gF9Hg5pOtnXvzLcriZIP0kuzxE//atOs0vrYA6qA5pyfHPslk+VZvWhdcs/Ritz
 s5vR122C+dP5He3eGz50WHOPgu+4UdQ3FsINfH1uVOCPDh1kq3J9CeT05lKEc3vIDbef
 SQuaC+RWTvBaZ6vTbxLKqFfbkw30ErG0mVaLDuYnPaLwvxZbOQAMHRfnvwM31+tjzU6x
 skjvvyAeay7VkLILTEXC6HghSAXjQsGp1ZZn9acrUkWHdqs9wBkGpzhVztNF1PiusoEU
 JsVw==
X-Gm-Message-State: APjAAAXh1SpyJd/GqKn5BoS3Ipj7LLV6SiHiEC66X/6xjSGxDxIFY0IX
 uHjnfqZkjbeUuoLnNyZynjTzkIkZ6UmaLUxKGwI=
X-Received: by 2002:a2e:9890:: with SMTP id b16mr4274220ljj.4.1571357100012;
 Thu, 17 Oct 2019 17:05:00 -0700 (PDT)
MIME-Version: 1.0
References: <20191017225800.6946-1-f4bug@amsat.org>
 <20191017225800.6946-5-f4bug@amsat.org>
In-Reply-To: <20191017225800.6946-5-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 17 Oct 2019 16:59:50 -0700
Message-ID: <CAKmqyKM=W_9aT3=HRbxbX0rjrisc0bcTFKA1XVuJOX+b5ziBfw@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] hw/arm/bcm2835_peripherals: Use the SYS_timer
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::241
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
Cc: Rob Herring <robh@kernel.org>, Peter Maydell <peter.maydell@linaro.org>,
 Clement Deschamps <clement.deschamps@antfield.fr>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Esteban Bosse <estebanbosse@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Pete Batard <pete@akeo.ie>, Cleber Rosa <crosa@redhat.com>,
 Laurent Bonnans <laurent.bonnans@here.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Pekka Enberg <penberg@iki.fi>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vp7IpoBFMcs9

On Thu, Oct 17, 2019 at 4:05 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Connect the recently added SYS_timer.
> Now U-Boot does not hang anymore polling a free running counter
> stuck at 0.
> This timer is also used by the Linux kernel thermal subsystem.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> v2: Remove spurious error check (Alex)
> ---
>  hw/arm/bcm2835_peripherals.c         | 17 ++++++++++++++++-
>  include/hw/arm/bcm2835_peripherals.h |  3 ++-
>  2 files changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
> index 70bf927a02..17207ae07e 100644
> --- a/hw/arm/bcm2835_peripherals.c
> +++ b/hw/arm/bcm2835_peripherals.c
> @@ -58,6 +58,10 @@ static void bcm2835_peripherals_init(Object *obj)
>      /* Interrupt Controller */
>      sysbus_init_child_obj(obj, "ic", &s->ic, sizeof(s->ic), TYPE_BCM2835=
_IC);
>
> +    /* SYS Timer */
> +    sysbus_init_child_obj(obj, "systimer", &s->systmr, sizeof(s->systmr)=
,
> +                          TYPE_BCM2835_SYSTIMER);
> +
>      /* UART0 */
>      sysbus_init_child_obj(obj, "uart0", &s->uart0, sizeof(s->uart0),
>                            TYPE_PL011);
> @@ -171,6 +175,18 @@ static void bcm2835_peripherals_realize(DeviceState =
*dev, Error **errp)
>                  sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->ic), 0));
>      sysbus_pass_irq(SYS_BUS_DEVICE(s), SYS_BUS_DEVICE(&s->ic));
>
> +    /* Sys Timer */
> +    object_property_set_bool(OBJECT(&s->systmr), true, "realized", &err)=
;
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    memory_region_add_subregion(&s->peri_mr, ST_OFFSET,
> +                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->systmr), 0));
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->systmr), 0,
> +        qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_ARM_IRQ,
> +                               INTERRUPT_ARM_TIMER));
> +
>      /* UART0 */
>      qdev_prop_set_chr(DEVICE(&s->uart0), "chardev", serial_hd(0));
>      object_property_set_bool(OBJECT(&s->uart0), true, "realized", &err);
> @@ -352,7 +368,6 @@ static void bcm2835_peripherals_realize(DeviceState *=
dev, Error **errp)
>      }
>
>      create_unimp(s, &s->armtmr, "bcm2835-sp804", ARMCTRL_TIMER0_1_OFFSET=
, 0x40);
> -    create_unimp(s, &s->systmr, "bcm2835-systimer", ST_OFFSET, 0x20);
>      create_unimp(s, &s->cprman, "bcm2835-cprman", CPRMAN_OFFSET, 0x1000)=
;
>      create_unimp(s, &s->a2w, "bcm2835-a2w", A2W_OFFSET, 0x1000);
>      create_unimp(s, &s->i2s, "bcm2835-i2s", I2S_OFFSET, 0x100);
> diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm283=
5_peripherals.h
> index be7ad9b499..7859281e11 100644
> --- a/include/hw/arm/bcm2835_peripherals.h
> +++ b/include/hw/arm/bcm2835_peripherals.h
> @@ -24,6 +24,7 @@
>  #include "hw/sd/sdhci.h"
>  #include "hw/sd/bcm2835_sdhost.h"
>  #include "hw/gpio/bcm2835_gpio.h"
> +#include "hw/timer/bcm2835_systmr.h"
>  #include "hw/misc/unimp.h"
>
>  #define TYPE_BCM2835_PERIPHERALS "bcm2835-peripherals"
> @@ -39,7 +40,7 @@ typedef struct BCM2835PeripheralState {
>      MemoryRegion ram_alias[4];
>      qemu_irq irq, fiq;
>
> -    UnimplementedDeviceState systmr;
> +    BCM2835SystemTimerState systmr;
>      UnimplementedDeviceState armtmr;
>      UnimplementedDeviceState cprman;
>      UnimplementedDeviceState a2w;
> --
> 2.21.0
>
>
