Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp835358ejb;
        Sun, 4 Feb 2024 16:15:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfSBMZ4C3+BjBr02KG+tUBlSmK5iH7Xuj8w4uZG9QgmLXMOrP1uX2qheEVLpRGbPflLFJA
X-Received: by 2002:ac8:4603:0:b0:42a:a6ff:c889 with SMTP id p3-20020ac84603000000b0042aa6ffc889mr5672449qtn.39.1707092105316;
        Sun, 04 Feb 2024 16:15:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707092105; cv=none;
        d=google.com; s=arc-20160816;
        b=tJ16sXbNWLWY5JO35er66MXLexrgz5MKa2k+jNVUelCm2+6oJpIAvB5jTo2i/Q9FbG
         Zse6bRMaGjcWeQB6VTRwenyPFX28kFJ3cJKknD5KWQqxUjdaJHUGRgZQOfHgwXdAnjY+
         fogt1dyTjQZaKHdUnvp/3Rco1j20aNPlDGNvzvS7xiV4X5RQuxoh9pr/oqVFzNNf12Ew
         inq3KvWUgDX/iFlJCbcmv5v2tpM1f0w7t0htpH5rUII7Fhrt7PcvhiwgR6MFlwR8U8Pv
         nbtTXSh/RLrcaHU2Jp7HXRlTduwLGgqs4Qa20rW8OLxn5KpOiwIgD5UqT3ASxdgh1p9i
         jnTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=GRHx+Mp3v+VUCiZNSCjbToKpKbQ9BuOw3oX8+ZDYXpY=;
        fh=0+cxNxIJLy9fUqEFt8qfiFTLRW8Pnv2MQw/i0uk0Fpo=;
        b=giRJhc60Dh7mjb1g6q1C1NG4gHGe6N1dzptqiIeSiozTu/0MTxkwbstZNHrZrj+kfz
         UjOsCPbiKoPRm9g8O1Cm5i0IuHpj1s4yDgK8yqRr71nv2R2JzPlPEvUC9GhdB6zOv1jP
         2VPptankK/QyqP+L1K3CGv4z2zSwSZ3DHFq7zWUeH8hPtIjAdSi+5g0Xfx1m52yol3QS
         h9HFp4Y18PBJJeAjxnnmuqPqb/ly5kiDDRENQ1I1jeeXMEPbpDIvy6wbI1gcdWv8eJZj
         jhJBTADq65BG3le8mIy+m4YiAICgb5vtpVv/tzT+34c9WB08snunpBRYkBAE9Skw1YI6
         XNiQ==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z4a1A07H;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
X-Forwarded-Encrypted: i=0; AJvYcCVrdIIFsUkbBIB7CpY5HbCNZUKSCBXQjnwYB/dzLkMpIWuww3pQgAKZ/JzbYKBcjaLaeufCgoWzXuwWSFVx/k/mMTSH/aAn
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8-20020ac84e88000000b0042c1ca83f25si2277124qtp.89.2024.02.04.16.15.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 04 Feb 2024 16:15:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z4a1A07H;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rWmdF-00054M-N9; Sun, 04 Feb 2024 19:14:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rWmdE-00054A-KR; Sun, 04 Feb 2024 19:14:40 -0500
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rWmdC-0001PT-5E; Sun, 04 Feb 2024 19:14:40 -0500
Received: by mail-vk1-xa2c.google.com with SMTP id
 71dfb90a1353d-4c021a73febso157892e0c.2; 
 Sun, 04 Feb 2024 16:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707092076; x=1707696876; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GRHx+Mp3v+VUCiZNSCjbToKpKbQ9BuOw3oX8+ZDYXpY=;
 b=Z4a1A07H0qPWrqUx7KB9aqdQ+meFgk2omzaHlTdUmTJ7xZ5ui7J799O9L1iCOK/KcB
 Lu/nJagTe3y5mBRekhU+HiyDG3yuYuCAon7xbneUZa+61A2VammQJVFYmGIRLoXy41PX
 v+X1Kt4LenxoSjb9RhwRgly0jF91WqClKMFC4BUvsYcOnLCR0OM6FUdbp0NcQw0AgoZ5
 T2g08ql/p/M58fNVPdlHKy/qwE7WQuRrXOGUwZU1tfirdB+LrxdaA3CeytsNnUrl1kRZ
 6nqNl0Iq9GO8yOAgtk8qJYrWJNyloEE/DN/W2WR8zALjjblt0opTTTBVmQ+RsZsfA38t
 no6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707092076; x=1707696876;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GRHx+Mp3v+VUCiZNSCjbToKpKbQ9BuOw3oX8+ZDYXpY=;
 b=cLcCD24H60kmPIeen2qH/wdoLNKJc+VZQ4AKO9l8UfyNgfqdVJSnmEZ438cCSBYG5s
 W0AO12+v58/U95Ua9jyny91QIQ9AvFaoQgC47s+QxJTQlOoQdniGI2gfHP9YPaUutryb
 wQGoDF/eZYMchzVTgI/5kVV2496PDTWLK2USMDUEWIY+8vQ2BkguT6z5oIcHqkefkNFu
 Pfr2cp4jCZHwVs5KWXTiO9CNXOT1gkgGXUZ9apaIa50Mlype/zZy82rpUgSZtDBRvZpA
 AeudonGZymiBx/Tijk6unALjEQPYnijq8M9ZbzWggYdYixhJ4piLJWCpYFh58Tgbg9VI
 Ad1w==
X-Gm-Message-State: AOJu0YxXgEkfEXjw3mD2cuwRr4vH/em6oF8Fa77Og/m7DwEq9grorY9T
 4K82D0IMtj6M3poHPaDA7Bg5yETNVWGLjk2JVY9d1hIq6X+XyYinZJ73esfvsY5pGrP/nQVpctN
 Zd3qOlmt+W90JC0lScCh6qnIaBG8=
X-Received: by 2002:a67:e308:0:b0:46d:15f0:67a8 with SMTP id
 j8-20020a67e308000000b0046d15f067a8mr2132304vsf.25.1707092076044; Sun, 04 Feb
 2024 16:14:36 -0800 (PST)
MIME-Version: 1.0
References: <20240126193657.792005-1-ines.varhol@telecom-paris.fr>
 <20240126193657.792005-3-ines.varhol@telecom-paris.fr>
In-Reply-To: <20240126193657.792005-3-ines.varhol@telecom-paris.fr>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 5 Feb 2024 10:14:10 +1000
Message-ID: <CAKmqyKO-tmb6466EGqsWeqX=+6GJGJ3dzM1JVCNMerm2Bkfv9A@mail.gmail.com>
Subject: Re: [PATCH 2/3] hw/arm : Connect DM163 to STM32L4x5
To: =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>
Cc: qemu-devel@nongnu.org, Arnaud Minier <arnaud.minier@telecom-paris.fr>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Samuel Tardieu <sam@rfc1149.net>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2c;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: YtPD2tPBTVQA

On Sat, Jan 27, 2024 at 7:09=E2=80=AFAM In=C3=A8s Varhol
<ines.varhol@telecom-paris.fr> wrote:
>
> Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
> Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/Kconfig                 |  1 +
>  hw/arm/stm32l4x5_soc.c         | 55 +++++++++++++++++++++++++++++++++-
>  include/hw/arm/stm32l4x5_soc.h |  3 ++
>  3 files changed, 58 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 3e49b913f8..818aa2f1a2 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -463,6 +463,7 @@ config STM32L4X5_SOC
>      select STM32L4X5_SYSCFG
>      select STM32L4X5_RCC
>      select STM32L4X5_GPIO
> +    select DM163
>
>  config XLNX_ZYNQMP_ARM
>      bool
> diff --git a/hw/arm/stm32l4x5_soc.c b/hw/arm/stm32l4x5_soc.c
> index 478c6ba056..8663546901 100644
> --- a/hw/arm/stm32l4x5_soc.c
> +++ b/hw/arm/stm32l4x5_soc.c
> @@ -26,7 +26,9 @@
>  #include "qapi/error.h"
>  #include "exec/address-spaces.h"
>  #include "sysemu/sysemu.h"
> +#include "hw/core/split-irq.h"
>  #include "hw/arm/stm32l4x5_soc.h"
> +#include "hw/display/dm163.h"
>  #include "hw/qdev-clock.h"
>  #include "hw/misc/unimp.h"
>
> @@ -78,6 +80,31 @@ static const int exti_irq[NUM_EXTI_IRQ] =3D {
>  #define RCC_BASE_ADDRESS 0x40021000
>  #define RCC_IRQ 5
>
> +/*
> + * There are actually 14 input pins in the DM163 device.
> + * Here the DM163 input pin EN isn't connected to the STM32L4x5
> + * GPIOs as the IM120417002 colors shield doesn't actually use
> + * this pin to drive the RGB matrix.
> + */
> +#define NUM_DM163_INPUTS 13
> +
> +static const int dm163_input[NUM_DM163_INPUTS] =3D {
> +    1 * 16 + 2,  /* ROW0  PB2       */
> +    0 * 16 + 15, /* ROW1  PA15      */
> +    0 * 16 + 2,  /* ROW2  PA2       */
> +    0 * 16 + 7,  /* ROW3  PA7       */
> +    0 * 16 + 6,  /* ROW4  PA6       */
> +    0 * 16 + 5,  /* ROW5  PA5       */
> +    1 * 16 + 0,  /* ROW6  PB0       */
> +    0 * 16 + 3,  /* ROW7  PA3       */
> +    0 * 16 + 4,  /* SIN (SDA) PA4   */
> +    1 * 16 + 1,  /* DCK (SCK) PB1   */
> +    2 * 16 + 3,  /* RST_B (RST) PC3 */
> +    2 * 16 + 4,  /* LAT_B (LAT) PC4 */
> +    2 * 16 + 5,  /* SELBK (SB)  PC5 */
> +};
> +
> +
>  static const uint32_t gpio_addr[] =3D {
>      0x48000000,
>      0x48000400,
> @@ -116,6 +143,8 @@ static void stm32l4x5_soc_initfn(Object *obj)
>          g_autofree char *name =3D g_strdup_printf("gpio%c", 'a' + i);
>          object_initialize_child(obj, name, &s->gpio[i], TYPE_STM32L4X5_G=
PIO);
>      }
> +
> +    object_initialize_child(obj, "dm163", &s->dm163, TYPE_DM163);
>  }
>
>  static void stm32l4x5_soc_realize(DeviceState *dev_soc, Error **errp)
> @@ -124,9 +153,10 @@ static void stm32l4x5_soc_realize(DeviceState *dev_s=
oc, Error **errp)
>      Stm32l4x5SocState *s =3D STM32L4X5_SOC(dev_soc);
>      const Stm32l4x5SocClass *sc =3D STM32L4X5_SOC_GET_CLASS(dev_soc);
>      MemoryRegion *system_memory =3D get_system_memory();
> -    DeviceState *armv7m, *dev;
> +    DeviceState *armv7m, *dev, *gpio_output_fork;
>      SysBusDevice *busdev;
>      uint32_t pin_index;
> +    int gpio, pin;
>
>      if (!memory_region_init_rom(&s->flash, OBJECT(dev_soc), "flash",
>                                  sc->flash_size, errp)) {
> @@ -166,6 +196,12 @@ static void stm32l4x5_soc_realize(DeviceState *dev_s=
oc, Error **errp)
>          return;
>      }
>
> +    /* DM163 */
> +    dev =3D DEVICE(&s->dm163);
> +    if (!qdev_realize(dev, NULL, errp)) {
> +        return;
> +    }
> +
>      /* GPIOs */
>      for (unsigned i =3D 0; i < NUM_GPIOS; i++) {
>          g_autofree char *name =3D g_strdup_printf("%c", 'A' + i);
> @@ -204,6 +240,23 @@ static void stm32l4x5_soc_realize(DeviceState *dev_s=
oc, Error **errp)
>          }
>      }
>
> +    for (unsigned i =3D 0; i < NUM_DM163_INPUTS; i++) {
> +        gpio_output_fork =3D qdev_new(TYPE_SPLIT_IRQ);
> +        qdev_prop_set_uint32(gpio_output_fork, "num-lines", 2);
> +        qdev_realize_and_unref(gpio_output_fork, NULL, &error_fatal);
> +
> +        qdev_connect_gpio_out(gpio_output_fork, 0,
> +                              qdev_get_gpio_in(DEVICE(&s->syscfg),
> +                                               dm163_input[i]));
> +        qdev_connect_gpio_out(gpio_output_fork, 1,
> +                              qdev_get_gpio_in(DEVICE(&s->dm163),
> +                                               i));
> +        gpio =3D dm163_input[i] / 16;
> +        pin =3D dm163_input[i] % 16;
> +        qdev_connect_gpio_out(DEVICE(&s->gpio[gpio]), pin,
> +                              qdev_get_gpio_in(DEVICE(gpio_output_fork),=
 0));
> +    }
> +
>      /* EXTI device */
>      busdev =3D SYS_BUS_DEVICE(&s->exti);
>      if (!sysbus_realize(busdev, errp)) {
> diff --git a/include/hw/arm/stm32l4x5_soc.h b/include/hw/arm/stm32l4x5_so=
c.h
> index cb4da08629..60b31d430e 100644
> --- a/include/hw/arm/stm32l4x5_soc.h
> +++ b/include/hw/arm/stm32l4x5_soc.h
> @@ -30,6 +30,7 @@
>  #include "hw/misc/stm32l4x5_exti.h"
>  #include "hw/misc/stm32l4x5_rcc.h"
>  #include "hw/gpio/stm32l4x5_gpio.h"
> +#include "hw/display/dm163.h"
>  #include "qom/object.h"
>
>  #define TYPE_STM32L4X5_SOC "stm32l4x5-soc"
> @@ -48,6 +49,8 @@ struct Stm32l4x5SocState {
>      Stm32l4x5RccState rcc;
>      Stm32l4x5GpioState gpio[NUM_GPIOS];
>
> +    DM163State dm163;
> +
>      MemoryRegion sram1;
>      MemoryRegion sram2;
>      MemoryRegion flash;
> --
> 2.43.0
>
>
