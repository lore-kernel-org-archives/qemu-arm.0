Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5844718wrp;
        Sun, 29 Sep 2019 07:35:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxQUXurYzw9THqQDYN/6RDsvT2WPyOkC9w9CNBiVHtqXJPinSxTUUF/qgsE8FobBXEQkNP4
X-Received: by 2002:a37:512:: with SMTP id 18mr14649678qkf.328.1569767736794;
        Sun, 29 Sep 2019 07:35:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569767736; cv=none;
        d=google.com; s=arc-20160816;
        b=xBdzGMzQxAWuD1iYLvZY9p5RlXEI8rPswiJzKuB3EF3FSFjL78hsPUzRhsiG6HPfHX
         QCq6Ply2YmdCQmakap4xus/CtB7hRcyWjylblNWnHpwQYs+eph3tT/1NOQb0PClq2DkX
         WrWYXV83o6VXoopqxEdjPYX7AKBDIEN6xgp0CfMl1U7lOUC24u5c/p8cIsctTc57KRrw
         a2x56xbx4Iz4eGcbpjiLIF5wj+Byt5VQTtk9C7AQ82cq+5HXBCHxgdRomxW+mz6ICYDq
         2sV8iZPpMJBGwiCl+09x6e+OnKIv6o6CuRZG1/lhjNHpHOJ8vSEyjasuhMfcU5dXzCbY
         /AFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:references:in-reply-to:date:to:from:subject
         :message-id:dkim-signature;
        bh=NVBQNFInHUCd8plEVAt4xET5/5u/wycSBxqrFaN35vI=;
        b=UwS4zhVXH6LfF4NGj4kfz3OeojJB9Z3P2K8fX1jnPO/U+QBPjzv7Qf8jMsjhJ9Q/Li
         e52JVUD0WqOGdATywK3/c6rgbkyiOB9JNgFOP2k5zWNmFCa7SctZ7n+hdNLc8UIQ/KO2
         FepnOQ+LnsNO9i09mYdBZiUbrO54oflsaaadD/KcXWQtgxV+x+72uZ4e4YCGUkknyrXY
         aWVDxVQ0BWvCn03/pM7T8ZvRjXDJzxHKXO/1oz9ki35f4hGl6ajuSZFXN60yZLjG2BKA
         4Bkl1JnYB3Win9ukl+bxL/Ii8M0dQeFXPtcqDAZl+posb511/5T+JZVrwXOL9Gz1bbMv
         x/ow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=j43p6sZF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m9si9859864qvg.52.2019.09.29.07.35.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 29 Sep 2019 07:35:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=j43p6sZF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iEaIR-0004uF-Qd
	for alex.bennee@linaro.org; Sun, 29 Sep 2019 10:35:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40668)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <estebanbosse@gmail.com>) id 1iEaIB-0004rG-JN
 for qemu-arm@nongnu.org; Sun, 29 Sep 2019 10:35:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <estebanbosse@gmail.com>) id 1iEaIA-0000YN-1L
 for qemu-arm@nongnu.org; Sun, 29 Sep 2019 10:35:19 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:45784)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <estebanbosse@gmail.com>)
 id 1iEaI6-0000Ql-CD; Sun, 29 Sep 2019 10:35:14 -0400
Received: by mail-wr1-x443.google.com with SMTP id r5so8098621wrm.12;
 Sun, 29 Sep 2019 07:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=NVBQNFInHUCd8plEVAt4xET5/5u/wycSBxqrFaN35vI=;
 b=j43p6sZF3W+cJ9TD+7K6hQy3jJj0tuchi7WyB4jGfZTTKhyc2wDhpfZsrLomBrstSB
 qIw0GJ+uctD47Y0AZDA24740VCTIdHRqmgsTanlEceeAKx8g/SMERSnVLz3KXzL+BOgX
 V+5jdCCVlf4gfauaMxCdMAK5y/6R0gF+Scf0V4Vy+AnTWTwfenRwc4IQbPmlcygs/kcX
 jd5lhRSKygXSAN4q4kofVsUSFvQgaduQLU0bQjOhdDJozFUILaCrseFxaZDcZpkRrDyL
 HrsqwbBqmC/DIWEme9Tl/R8pzaq/hslJKBMvw6Qq/Kb38s1I7ZLYdWG0vM3V1HK7ayXf
 Hi6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=NVBQNFInHUCd8plEVAt4xET5/5u/wycSBxqrFaN35vI=;
 b=nI7g3KkpZ4R6iK4uG1xEZ6BFt77113hoN1djpq0fc7vXfN6Dt6HhBCyo6jWSVeIXmi
 74WE8roJ7cIXQeoMZ1XyF16+rHl54AwVFrWe1xRdBS3VPLqaYlrRE7CdrIi2REf/5vWb
 9XlTeXnB7lydvQ61MtofzE5amXgz4RrICy8wtyZEvbviLqK8WjOHMwZJytgCLpZJY4AQ
 dU9wPj5w+F4f6M+VbQNaPjVVuYRWaSzKiCwtKxYDQpsf7de+rnVDYHVgnIHkxqEUGDV1
 rPt4R8enLWAChr4WHrr7sKr4wOnJXw+iNDf+jtBKihLMgTJhzr9eS0jsmRtGQ+iERb7y
 2aNg==
X-Gm-Message-State: APjAAAU/1BOuSMzQV3T/lG7KISh/kPFm2VjoJO+xaJW6Nc1Ha8ZnFmAp
 JG/537SSUBwF/McyoLFXels=
X-Received: by 2002:a05:6000:2:: with SMTP id h2mr9507024wrx.309.1569767713013; 
 Sun, 29 Sep 2019 07:35:13 -0700 (PDT)
Received: from ?IPv6:2a01:c22:b04f:b200:7a70:bbc8:8101:45be?
 ([2a01:c22:b04f:b200:7a70:bbc8:8101:45be])
 by smtp.gmail.com with ESMTPSA id h125sm22239737wmf.31.2019.09.29.07.35.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Sep 2019 07:35:12 -0700 (PDT)
Message-ID: <f7e85fc02a87d909ba7dc19cc4d8cdaed7d1de03.camel@gmail.com>
Subject: Re: [PATCH 07/14] hw/arm/bcm2835: Add various unimplemented
 peripherals
From: Esteban Bosse <estebanbosse@gmail.com>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>, Peter
 Maydell <peter.maydell@linaro.org>, Andrew Baumann
 <Andrew.Baumann@microsoft.com>,  qemu-devel@nongnu.org, Pekka Enberg
 <penberg@iki.fi>,  =?ISO-8859-1?Q?Zolt=E1n?= Baldaszti <bztemail@gmail.com>
Date: Sun, 29 Sep 2019 16:35:02 +0200
In-Reply-To: <20190904171315.8354-8-f4bug@amsat.org>
References: <20190904171315.8354-1-f4bug@amsat.org>
 <20190904171315.8354-8-f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Cc: qemu-arm@nongnu.org, Clement Deschamps <clement.deschamps@antfield.fr>,
 =?ISO-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5qh44UzLCJpq

El mié, 04-09-2019 a las 19:13 +0200, Philippe Mathieu-Daudé escribió:
> Base addresses and sizes taken from the "BCM2835 ARM Peripherals"
> datasheet from February 06 2012:
> https://www.raspberrypi.org/app/uploads/2012/02/BCM2835-ARM-Peripherals.pdf
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/arm/bcm2835_peripherals.c         | 30
> ++++++++++++++++++++++++++++
>  include/hw/arm/bcm2835_peripherals.h | 14 +++++++++++++
>  include/hw/arm/raspi_platform.h      |  8 ++++++++
>  3 files changed, 52 insertions(+)
> 
> diff --git a/hw/arm/bcm2835_peripherals.c
> b/hw/arm/bcm2835_peripherals.c
> index 270357b5a8..be6270b8ef 100644
> --- a/hw/arm/bcm2835_peripherals.c
> +++ b/hw/arm/bcm2835_peripherals.c
> @@ -22,6 +22,20 @@
>  /* Capabilities for SD controller: no DMA, high-speed, default
> clocks etc. */
>  #define BCM2835_SDHC_CAPAREG 0x52134b4
>  
> +static void create_unimp(BCM2835PeripheralState *ps,
> +                         UnimplementedDeviceState *uds,
> +                         const char *name, hwaddr ofs, hwaddr size)
> +{
> +    sysbus_init_child_obj(OBJECT(ps), name, uds,
> +                          sizeof(UnimplementedDeviceState),
> +                          TYPE_UNIMPLEMENTED_DEVICE);
> +    qdev_prop_set_string(DEVICE(uds), "name", name);
> +    qdev_prop_set_uint64(DEVICE(uds), "size", size);
> +    object_property_set_bool(OBJECT(uds), true, "realized",
> &error_fatal);
> +    memory_region_add_subregion(&ps->peri_mr, ofs,
> +                                sysbus_mmio_get_region(SYS_BUS_DEVIC
> E(uds), 0));
> +}
> +
>  static void bcm2835_peripherals_init(Object *obj)
>  {
>      BCM2835PeripheralState *s = BCM2835_PERIPHERALS(obj);
> @@ -322,6 +336,22 @@ static void
> bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
>          error_propagate(errp, err);
>          return;
>      }
> +
> +    create_unimp(s, &s->pm, "bcm2835-pm", PM_OFFSET, 0x1000);
> +    create_unimp(s, &s->cprman, "bcm2835-cprman", CPRMAN_OFFSET,
> 0x1000);
> +    create_unimp(s, &s->a2w, "bcm2835-a2w", 0x102000, 0x1000);
> +    create_unimp(s, &s->i2s, "bcm2835-i2s", I2S_OFFSET, 0x100);
> +    create_unimp(s, &s->smi, "bcm2835-smi", SMI_OFFSET, 0x100);
> +    create_unimp(s, &s->spi0, "bcm2835-spi0", SPI0_OFFSET, 0x20);
> +    create_unimp(s, &s->bscsl, "bcm2835-spis", BSC_SL_OFFSET,
> 0x100);
> +    create_unimp(s, &s->i2c[0], "bcm2835-i2c0", BSC0_OFFSET, 0x20);
> +    create_unimp(s, &s->i2c[1], "bcm2835-i2c1", BSC1_OFFSET, 0x20);
> +    create_unimp(s, &s->i2c[2], "bcm2835-i2c2", BSC2_OFFSET, 0x20);
> +    create_unimp(s, &s->otp, "bcm2835-otp", OTP_OFFSET, 0x80);
> +    create_unimp(s, &s->dbus, "bcm2835-dbus", DBUS_OFFSET, 0x8000);
> +    create_unimp(s, &s->ave0, "bcm2835-ave0", AVE0_OFFSET, 0x8000);
> +    create_unimp(s, &s->dwc2, "dwc-usb2", USB_OTG_OFFSET, 0x100);
> +    create_unimp(s, &s->sdramc, "bcm2835-sdramc", SDRAMC_OFFSET,
> 0x100);
>  }
>  
>  static void bcm2835_peripherals_class_init(ObjectClass *oc, void
> *data)
> diff --git a/include/hw/arm/bcm2835_peripherals.h
> b/include/hw/arm/bcm2835_peripherals.h
> index 6b17f6a382..44a182b399 100644
> --- a/include/hw/arm/bcm2835_peripherals.h
> +++ b/include/hw/arm/bcm2835_peripherals.h
> @@ -23,6 +23,7 @@
>  #include "hw/sd/sdhci.h"
>  #include "hw/sd/bcm2835_sdhost.h"
>  #include "hw/gpio/bcm2835_gpio.h"
> +#include "hw/misc/unimp.h"
>  
>  #define TYPE_BCM2835_PERIPHERALS "bcm2835-peripherals"
>  #define BCM2835_PERIPHERALS(obj) \
> @@ -37,6 +38,9 @@ typedef struct BCM2835PeripheralState {
>      MemoryRegion ram_alias[4];
>      qemu_irq irq, fiq;
>  
> +    UnimplementedDeviceState pm;
> +    UnimplementedDeviceState cprman;
> +    UnimplementedDeviceState a2w;
>      PL011State uart0;
>      BCM2835AuxState aux;
>      BCM2835FBState fb;
> @@ -48,6 +52,16 @@ typedef struct BCM2835PeripheralState {
>      SDHCIState sdhci;
>      BCM2835SDHostState sdhost;
>      BCM2835GpioState gpio;
> +    UnimplementedDeviceState i2s;
> +    UnimplementedDeviceState spi0;
> +    UnimplementedDeviceState i2c[3];
> +    UnimplementedDeviceState otp;
> +    UnimplementedDeviceState dbus;
> +    UnimplementedDeviceState ave0;
> +    UnimplementedDeviceState bscsl;
> +    UnimplementedDeviceState smi;
> +    UnimplementedDeviceState dwc2;
> +    UnimplementedDeviceState sdramc;
>  } BCM2835PeripheralState;
>  
>  #endif /* BCM2835_PERIPHERALS_H */
> diff --git a/include/hw/arm/raspi_platform.h
> b/include/hw/arm/raspi_platform.h
> index 6f7db85bab..069edab526 100644
> --- a/include/hw/arm/raspi_platform.h
> +++ b/include/hw/arm/raspi_platform.h
> @@ -40,6 +40,7 @@
>  #define PM_OFFSET               0x100000 /* Power Management, Reset
> controller
>                                            * and Watchdog registers
> */
>  #define CPRMAN_OFFSET           0x101000 /* Clock Management */
> +#define AVS_OFFSET              0x103000 /* Audio Video Standard */
>  #define RNG_OFFSET              0x104000
>  #define GPIO_OFFSET             0x200000
>  #define UART0_OFFSET            0x201000
> @@ -47,11 +48,18 @@
>  #define I2S_OFFSET              0x203000
>  #define SPI0_OFFSET             0x204000
>  #define BSC0_OFFSET             0x205000 /* BSC0 I2C/TWI */
> +#define OTP_OFFSET              0x20f000
> +#define AVSP_OFFSET             0x130000
> +#define BSC_SL_OFFSET           0x214000 /* SPI slave */
>  #define AUX_OFFSET              0x215000 /* AUX: UART1/SPI1/SPI2 */
>  #define EMMC1_OFFSET            0x300000
>  #define SMI_OFFSET              0x600000
>  #define BSC1_OFFSET             0x804000 /* BSC1 I2C/TWI */
> +#define BSC2_OFFSET             0x805000 /* BSC2 I2C/TWI */
> +#define DBUS_OFFSET             0x900000
> +#define AVE0_OFFSET             0x910000
>  #define USB_OTG_OFFSET          0x980000 /* DTC_OTG USB controller
> */
> +#define SDRAMC_OFFSET           0xe00000
>  #define DMA15_OFFSET            0xE05000 /* DMA controller, channel
> 15 */
>  
>  /* GPU interrupts */
Reviewed-by: Esteban Bosse <estebanbosse@gmail.com>

