Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp545912eji;
        Sun, 17 Dec 2023 19:58:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH/fmbRajBt4O6Wwp3b+oc/rZ47lWnyIyN+8HQaabaSCvoLbt246PAeU8e2GW+ddwafOqQw
X-Received: by 2002:a05:622a:11c5:b0:425:a802:46a5 with SMTP id n5-20020a05622a11c500b00425a80246a5mr11919754qtk.43.1702871893160;
        Sun, 17 Dec 2023 19:58:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702871893; cv=none;
        d=google.com; s=arc-20160816;
        b=SRHf9Pfcc6yL3ZZhSKTTq57MicZ/AufdRhdYnAHlI5e+wLKTG1tfALLy8s2//OsFoS
         KEa2fqxd93qlQguR+fbZJsfo8D8rXHvacWh4N18TNmfBIJid0etyrIBdS7655y6DbvEy
         DgPWRDQldE50sRZrPC7aCESyZyJ+MV+5bNBD0nUAXtLLE77DfHk3VW9b7s8iqymFVqyv
         GeU2d1jZ5Mp0DOU5zFTjYCDHmX/asTQlwLTPdBf4RWKueVU41Ax0EHegMSF31TaQcuVA
         864pPP11y+TO4TSNPXwTjDqaE8Gmrr+WqmVpAHOr7/PQojhFVglJSvQ46aIN02Gx90sQ
         oZWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=2y9d+MCu2iNwj8qfDA/f4Nw3tEz5QnJLw9qz8CFKRc8=;
        fh=/LYgw7cjenuZHh1AdjNLJVyUid9oyKPPbsg85Sc1t6U=;
        b=AAWmgdxHNDUsN/tujn0a5NaBULtCd7pemY96oleYASyEZDYobsn97ar8bnxdXRYlUF
         KzoN9fk7/nD8AAnqVi0xp+suhh6Pbx0hFAbvMCJj6Ynd3r0EC1jCp8gBZL4SIMcf9Asz
         9tgwtLYdmbgQWCsj/D1E2TbvH1uNVpeWfeJaKFL2tD7BF2ucgQxXPWEXYz+uiUk1eUCN
         im9sbz8pQ6GAOmwgiFvRi5E5EuA7lgZh45knJ6Z2pdsxJIDI54boMYqBvDiwsU8V9Jgq
         zJt0EEJmN09BAVnzLxhl9m9IjyK/4BE668OTV7CrZff/Y/il0T6IQKBlBW1wMyvDMqNH
         vVZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=FhXnEAHQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j22-20020ac86656000000b00423950e1200si21419735qtp.774.2023.12.17.19.58.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Dec 2023 19:58:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=FhXnEAHQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rF4lN-0003RQ-7a; Sun, 17 Dec 2023 22:57:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rF4lL-0003Qt-Dk; Sun, 17 Dec 2023 22:57:51 -0500
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rF4lJ-0000hy-Ou; Sun, 17 Dec 2023 22:57:51 -0500
Received: by mail-qk1-x730.google.com with SMTP id
 af79cd13be357-77f957a5ac5so129449585a.3; 
 Sun, 17 Dec 2023 19:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702871868; x=1703476668; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2y9d+MCu2iNwj8qfDA/f4Nw3tEz5QnJLw9qz8CFKRc8=;
 b=FhXnEAHQMoOwiJQGgPYStr7tVy+xs9x+5+lO6dex4CPIbiYEDMP599BOUIS6NcHzdE
 P4pRGuYfy1WduAZ/RUxZz92U/OfhOw+eD33MTSX387UAPZR2m9tbNVDDucwmqkpoXNeF
 EGDORaArE0Lyl43T889/zM6WMN+lOHcYd/EEgqj1dWGvJ5coeRdsFxHiWaZvqqSKOgti
 PjQz3hg+44X1PS4/tsj0MBXryxeRWAzisV8q97lPCwHlaF5HS5UN/MqSZUSsYrTqLSZd
 SLxn7E7it4J4B+oRBkF06KJ04PfbbeVx606jnpUy8XVfh8QHhDucbCjmWXf7qH1Tjv54
 Wgmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702871868; x=1703476668;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2y9d+MCu2iNwj8qfDA/f4Nw3tEz5QnJLw9qz8CFKRc8=;
 b=hZ1Zus+JS0LlDRZB7ObqwHAtmnAKx9El43CkTpFXEysvkBIwV5K8yGkVeq+/Z/YBd1
 ijlB1eBMiPnAh1z7DJHnoEy5k6abGMuvluXW5xp0sXoneNW/3CbiAZkhfrOsxU7Hoa5g
 5Cf/oiCulRgUBkHpFQnXkHhQQI7jChOBFlyymWpp+Ju0obme5Q9cJwIYMk7ISHNLjLxy
 th483XmOtpiuekpY7lWJ6EJ7zZiqufG78ykyJwzf4UJmxkaXTBnEVTCPMy/GB/irxQHh
 ICl21PSTgj6CUtNGC88IKx+lbeVnt1RAJmn5kTzfKOzr6esjiGBgChp7Ikl/FJU1bjJq
 BlNA==
X-Gm-Message-State: AOJu0Ywrh+VRbSQ4O61jPSa3b1X+sPXB2DBwagY6/u/ztSzOdA/GAXS0
 6U8uIjnv3idJHgH9dpIZDFRwWlkKckus93O9PWQ=
X-Received: by 2002:a05:620a:c51:b0:77f:dc33:e522 with SMTP id
 u17-20020a05620a0c5100b0077fdc33e522mr1998849qki.37.1702871868236; Sun, 17
 Dec 2023 19:57:48 -0800 (PST)
MIME-Version: 1.0
References: <170223510627.13579.3191933474458037037-0@git.sr.ht>
 <170223510627.13579.3191933474458037037-3@git.sr.ht>
In-Reply-To: <170223510627.13579.3191933474458037037-3@git.sr.ht>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Dec 2023 13:57:22 +1000
Message-ID: <CAKmqyKOZbYaw9jE+audijuL-cuHhgNh9T3s1rB94DP6CoahZ8Q@mail.gmail.com>
Subject: Re: [PATCH qemu 3/3] hw/arm: Connect STM32L4xx SYSCFG to STM32L4x5 SoC
To: "~inesvarhol" <inesvarhol@proton.me>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alistair@alistair23.me, 
 philmd@linaro.org, peter.maydell@linaro.org, ines.varhol@telecom-paris.fr, 
 arnaud.minier@telecom-paris.fr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=alistair23@gmail.com; helo=mail-qk1-x730.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: nz65Q0YiN8Bc

On Mon, Dec 11, 2023 at 5:06=E2=80=AFAM ~inesvarhol <inesvarhol@git.sr.ht> =
wrote:
>
> From: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
>
> Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
> Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
> ---
>  hw/arm/Kconfig                 |  1 +
>  hw/arm/stm32l4x5_soc.c         | 24 ++++++++++++++++--------
>  include/hw/arm/stm32l4x5_soc.h |  2 ++
>  3 files changed, 19 insertions(+), 8 deletions(-)
>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 9c9d5bb541..ea77977d4b 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -458,6 +458,7 @@ config STM32L4X5_SOC
>      bool
>      select ARM_V7M
>      select OR_IRQ
> +    select STM32L4XX_SYSCFG
>      select STM32L4X5_EXTI
>
>  config XLNX_ZYNQMP_ARM
> diff --git a/hw/arm/stm32l4x5_soc.c b/hw/arm/stm32l4x5_soc.c
> index cf786eac1d..9b45a9e606 100644
> --- a/hw/arm/stm32l4x5_soc.c
> +++ b/hw/arm/stm32l4x5_soc.c
> @@ -46,6 +46,7 @@
>  #define SRAM2_SIZE (32 * KiB)
>
>  #define EXTI_ADDR 0x40010400
> +#define SYSCFG_ADDR 0x40010000
>
>  #define NUM_EXTI_IRQ 40
>  /* Match exti line connections with their CPU IRQ number */
> @@ -90,6 +91,8 @@ static void stm32l4x5_soc_initfn(Object *obj)
>
>      object_initialize_child(obj, "exti", &s->exti, TYPE_STM32L4X5_EXTI);
>
> +    object_initialize_child(obj, "syscfg", &s->syscfg, TYPE_STM32L4XX_SY=
SCFG);
> +
>      s->sysclk =3D qdev_init_clock_in(DEVICE(s), "sysclk", NULL, NULL, 0)=
;
>      s->refclk =3D qdev_init_clock_in(DEVICE(s), "refclk", NULL, NULL, 0)=
;
>  }
> @@ -167,6 +170,15 @@ static void stm32l4x5_soc_realize(DeviceState *dev_s=
oc, Error **errp)
>          return;
>      }
>
> +    /* System configuration controller */
> +    dev =3D DEVICE(&s->syscfg);
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->syscfg), errp)) {
> +        return;
> +    }
> +    busdev =3D SYS_BUS_DEVICE(dev);
> +    sysbus_mmio_map(busdev, 0, SYSCFG_ADDR);

What about the SYSCFG in GPIOs?

You don't have to connect them now, but it would be worth mentioning
in the commit message that they aren't connected and why

Alistair

> +
> +    /* EXTI device */
>      dev =3D DEVICE(&s->exti);
>      if (!sysbus_realize(SYS_BUS_DEVICE(&s->exti), errp)) {
>          return;
> @@ -178,13 +190,10 @@ static void stm32l4x5_soc_realize(DeviceState *dev_=
soc, Error **errp)
>          sysbus_connect_irq(busdev, i, qdev_get_gpio_in(armv7m, exti_irq[=
i]));
>      }
>
> -    /*
> -     * Uncomment when Syscfg is implemented
> -     * for (i =3D 0; i < 16; i++) {
> -     *     qdev_connect_gpio_out(DEVICE(&s->syscfg), i,
> -     *                           qdev_get_gpio_in(dev, i));
> -     * }
> -     */
> +    for (i =3D 0; i < 16; i++) {
> +        qdev_connect_gpio_out(DEVICE(&s->syscfg), i,
> +                              qdev_get_gpio_in(dev, i));
> +    }
>
>      /* APB1 BUS */
>      create_unimplemented_device("TIM2",      0x40000000, 0x400);
> @@ -223,7 +232,6 @@ static void stm32l4x5_soc_realize(DeviceState *dev_so=
c, Error **errp)
>      /* RESERVED:    0x40009800, 0x6800 */
>
>      /* APB2 BUS */
> -    create_unimplemented_device("SYSCFG",    0x40010000, 0x30);
>      create_unimplemented_device("VREFBUF",   0x40010030, 0x1D0);
>      create_unimplemented_device("COMP",      0x40010200, 0x200);
>      /* RESERVED:    0x40010800, 0x1400 */
> diff --git a/include/hw/arm/stm32l4x5_soc.h b/include/hw/arm/stm32l4x5_so=
c.h
> index ac47158596..5ff757f15b 100644
> --- a/include/hw/arm/stm32l4x5_soc.h
> +++ b/include/hw/arm/stm32l4x5_soc.h
> @@ -37,6 +37,7 @@
>  #include "qemu/units.h"
>  #include "hw/qdev-core.h"
>  #include "hw/arm/armv7m.h"
> +#include "hw/misc/stm32l4xx_syscfg.h"
>  #include "hw/misc/stm32l4x5_exti.h"
>  #include "qom/object.h"
>
> @@ -52,6 +53,7 @@ struct Stm32l4x5SocState {
>      ARMv7MState armv7m;
>
>      Stm32l4x5ExtiState exti;
> +    STM32L4xxSyscfgState syscfg;
>
>      MemoryRegion sram1;
>      MemoryRegion sram2;
> --
> 2.38.5
>
