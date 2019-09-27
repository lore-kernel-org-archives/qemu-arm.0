Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp4040083wrp;
        Fri, 27 Sep 2019 14:58:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzKRm093TBNYza9VGKPRYHfKdFYKczo9NFTC6QI7W9OhYVxEcRaU3n7uSsPBmeJkJ5zMAJk
X-Received: by 2002:a05:620a:12d1:: with SMTP id e17mr7057240qkl.149.1569621524292;
        Fri, 27 Sep 2019 14:58:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569621524; cv=none;
        d=google.com; s=arc-20160816;
        b=FTTcIERBdJrdmIJJo1jV0wMNuryi1qxdiM5ygzE9Z2L6p3zsDE+pn02SDFk3XJcMBq
         zS7/qqqxAypIou/JmkXPent39lKabF+JchuWPhMPg9LSGu/ASIhjQL43F5VdcyalrLey
         k/NYpWoVq8y7ytjzuqV/zmLAwrNFjCaYB3YNX1Cp0Rx3rpmJMiqPjH4El0232gP2psoI
         JFoomKLTZD4RxF8oymvfkJBjNQxm/aMWM86Wt4vS0cIkF1tQbOGe8KaiJD1cAffV59HY
         HKIF/uG0Y41TGkerjguz9Tzs8Qu9ZyUiHZKoVtvcN3ENxIlSNAi/PKoNwddMlx7C2Yyf
         9ggw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=+CPKxPVVDfhT0cAoc/B31bv7euMHESRzMG7B3a7nxHI=;
        b=BbZKuxzJttYpD+rhuXmSEfuDxzVghnxrP49/5XEFKwbGUTOk9YfkBBkW2sq/nDDSVi
         xWu2pxkVBXbJjbGCposBanYlR+mj80wFj2quZr31yOn0xhDEaexIrH3nkSFmtTMZVrXL
         F+PIu8bx95Fo3N0TKQohcUSwd1oGghlcE99t6f4qhvkl2F+I5G3JPhNzGgXEyJXwn4MR
         Wdg8oIMVfaq55T67lMYEAipO4h7lfFhGp8ksawR5z2ZWr5z5WqZx27hhs63NyNp62DkY
         Drf0TWrK9GqBu69lUZGVAwBMHlZ4tEASpmmI5xKJNPTidGDZ4oGEVMtC3ZGRhhk9BJne
         9fXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=A+rw58Xp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n64si3761757qkb.62.2019.09.27.14.58.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Sep 2019 14:58:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=A+rw58Xp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iDyGB-0005nz-OS
	for alex.bennee@linaro.org; Fri, 27 Sep 2019 17:58:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38261)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iDyDm-0003zc-GT
 for qemu-arm@nongnu.org; Fri, 27 Sep 2019 17:56:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iDyDl-0006Q7-A3
 for qemu-arm@nongnu.org; Fri, 27 Sep 2019 17:56:14 -0400
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:37524)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iDyDh-0006DB-M2; Fri, 27 Sep 2019 17:56:09 -0400
Received: by mail-lj1-x244.google.com with SMTP id l21so3901397lje.4;
 Fri, 27 Sep 2019 14:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+CPKxPVVDfhT0cAoc/B31bv7euMHESRzMG7B3a7nxHI=;
 b=A+rw58XpcojTsfMnbGf1OyM49U7JXN+m6O60Q3XScyxbUJMqCOdWeBnkmqVuluRs/V
 xsJ40A6TahdX42LbVMLoctRgUSCb6Ap7APfgOf6FzWvrsshXMGipFpOvlXHmqVyowoef
 i63iYOXgQvII8mRVMkOrZLRyinTvzb0AUfPfe1/ZuFH3yWbfw/QC5z/FKmiZc9VTauQC
 yRXLq6bkuUg7Z5/B5HokmdZ6e/AOu889WkQFKHQRX6jMHk4sNOQGO7cUnCNJYiwWuR7J
 hRTnAo4wF15IjLiDyA7jv74Flxkzm3ne7u40Fk/gupyfikHGBgRgoQSZqVgiu5ZqHj9C
 pDYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+CPKxPVVDfhT0cAoc/B31bv7euMHESRzMG7B3a7nxHI=;
 b=p57AmytgAFMs3lZgKgwUeF8yFAQJHexohF6sLjrrcZm1AL3BASQweSe5N0SbWZRsme
 ctk0/IQeFDWiSxySurmplGYm4/x815Z7YsBE6/AudsijZUIyjKJkJ4dqKWxwEarhZYcH
 HlBIU7H+Ooz5TIDX6Yn0f8njJkWYdnl+zxe+DqyO2OWtZpzmGBGz8h2/x7nUUETXE5S8
 L8CpJI5PAG9AtQnPaJgrMJkkowtoGodVAQeaPNO3fCgScSlGwCikYHRq3mBc2dag3twb
 B7FkwLtWjnDv1ht4uepdAg/OTfxdsYbyVBX/58mvu2+ZQ7Kn/X4Enmg2z4pR/mfO6uHI
 +klQ==
X-Gm-Message-State: APjAAAWStaRDOAvkiy6KfSa9bVuoUSwmRTbXH0bL0stNSk8IrCNx8ZGz
 iBN041/bAoQImNBOvUGPIHOO6lgaiByrSi7yymY=
X-Received: by 2002:a2e:91c7:: with SMTP id u7mr4365011ljg.146.1569621368224; 
 Fri, 27 Sep 2019 14:56:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190926173428.10713-1-f4bug@amsat.org>
 <20190926173428.10713-10-f4bug@amsat.org>
In-Reply-To: <20190926173428.10713-10-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 27 Sep 2019 14:51:17 -0700
Message-ID: <CAKmqyKP0vtp26B1rmyZYM4QXe8pJQ_nqX-NpLeqZDwTThOWjUw@mail.gmail.com>
Subject: Re: [PATCH 09/19] hw/arm/bcm2835_peripherals: Use the thermal sensor
 block
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::244
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
 =?UTF-8?Q?Zolt=C3=A1n_Baldaszti?= <bztemail@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Esteban Bosse <estebanbosse@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 Clement Deschamps <clement.deschamps@antfield.fr>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Laurent Bonnans <laurent.bonnans@here.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Pekka Enberg <penberg@iki.fi>, Guenter Roeck <linux@roeck-us.net>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DSDo7stox8Un

On Thu, Sep 26, 2019 at 10:42 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> Map the thermal sensor in the BCM2835 block.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/bcm2835_peripherals.c         | 13 +++++++++++++
>  include/hw/arm/bcm2835_peripherals.h |  2 ++
>  include/hw/arm/raspi_platform.h      |  1 +
>  3 files changed, 16 insertions(+)
>
> diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
> index fdcf616c56..70bf927a02 100644
> --- a/hw/arm/bcm2835_peripherals.c
> +++ b/hw/arm/bcm2835_peripherals.c
> @@ -111,6 +111,10 @@ static void bcm2835_peripherals_init(Object *obj)
>      object_property_add_const_link(OBJECT(&s->dma), "dma-mr",
>                                     OBJECT(&s->gpu_bus_mr), &error_abort)=
;
>
> +    /* Thermal */
> +    sysbus_init_child_obj(obj, "thermal", &s->thermal, sizeof(s->thermal=
),
> +                          TYPE_BCM2835_THERMAL);
> +
>      /* GPIO */
>      sysbus_init_child_obj(obj, "gpio", &s->gpio, sizeof(s->gpio),
>                            TYPE_BCM2835_GPIO);
> @@ -321,6 +325,15 @@ static void bcm2835_peripherals_realize(DeviceState =
*dev, Error **errp)
>                                                    INTERRUPT_DMA0 + n));
>      }
>
> +    /* THERMAL */
> +    object_property_set_bool(OBJECT(&s->thermal), true, "realized", &err=
);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    memory_region_add_subregion(&s->peri_mr, THERMAL_OFFSET,
> +                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->thermal), 0));
> +
>      /* GPIO */
>      object_property_set_bool(OBJECT(&s->gpio), true, "realized", &err);
>      if (err) {
> diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm283=
5_peripherals.h
> index 62a4c7b559..be7ad9b499 100644
> --- a/include/hw/arm/bcm2835_peripherals.h
> +++ b/include/hw/arm/bcm2835_peripherals.h
> @@ -20,6 +20,7 @@
>  #include "hw/misc/bcm2835_property.h"
>  #include "hw/misc/bcm2835_rng.h"
>  #include "hw/misc/bcm2835_mbox.h"
> +#include "hw/misc/bcm2835_thermal.h"
>  #include "hw/sd/sdhci.h"
>  #include "hw/sd/bcm2835_sdhost.h"
>  #include "hw/gpio/bcm2835_gpio.h"
> @@ -53,6 +54,7 @@ typedef struct BCM2835PeripheralState {
>      SDHCIState sdhci;
>      BCM2835SDHostState sdhost;
>      BCM2835GpioState gpio;
> +    Bcm2835ThermalState thermal;
>      UnimplementedDeviceState i2s;
>      UnimplementedDeviceState spi[1];
>      UnimplementedDeviceState i2c[3];
> diff --git a/include/hw/arm/raspi_platform.h b/include/hw/arm/raspi_platf=
orm.h
> index cdcbca943f..61b04a1bd4 100644
> --- a/include/hw/arm/raspi_platform.h
> +++ b/include/hw/arm/raspi_platform.h
> @@ -48,6 +48,7 @@
>  #define SPI0_OFFSET             0x204000
>  #define BSC0_OFFSET             0x205000 /* BSC0 I2C/TWI */
>  #define OTP_OFFSET              0x20f000
> +#define THERMAL_OFFSET          0x212000
>  #define BSC_SL_OFFSET           0x214000 /* SPI slave */
>  #define AUX_OFFSET              0x215000 /* AUX: UART1/SPI1/SPI2 */
>  #define EMMC1_OFFSET            0x300000
> --
> 2.20.1
>
>
