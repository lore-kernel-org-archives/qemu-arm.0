Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp469836ejc;
        Thu, 25 Jan 2024 12:12:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZvIWan21V7wY6k4urElmWQekg8pmKHaqeyDRQNic1Lz5zAHGeuE5FGy6LT8mpRQUCWwk+
X-Received: by 2002:ad4:4ee3:0:b0:686:a231:8ebb with SMTP id dv3-20020ad44ee3000000b00686a2318ebbmr219291qvb.67.1706213543175;
        Thu, 25 Jan 2024 12:12:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706213543; cv=none;
        d=google.com; s=arc-20160816;
        b=Ylx9lcRQedTqKK1i90MSi5mlXHFCGX69hkeaGnbAdpI3DoThOoZ4FwDdjdPhBQMMQL
         nFaY+oULTBgo2y5gzc0S2g1+weT2Fzw9zyRQy5Oyf2LhhTL++ISYjZ5Jqe9lECTmfI2t
         eGs3NC2eQUGyF2jMMXWFeLwVxUWz7/MDg4MkLQL6RT2ToW4Cix90kTYj/7AGqwmebQbB
         7vIlvCsv7PU5MhiJel9/It7zhbISM5FbF69JESqdt2k98RwkjygbxKvTCEUgKPu7pqlD
         JbADJWjThsal/E7vWL2VzsnlbF5A+XjwOwxZ6Nk7FknCVMftDHuq8P09lRaCc9MwOxmn
         9HPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=TFUoNC1lAgfWpZEjhvmr06qXZkNpsWgTAE7H9zZCQAE=;
        fh=CRE3KOE6Upfpj919V0UIiBJhJVFezCYT0VOK+4KG5AA=;
        b=TJd5miWuQqDuAP9Y+G3AN3s8Rn0pDei8BzNmYnDbeYeUApVawPCaPGxECWJ8wtluyz
         SykLMOSO/NGLgqJ/ZIxpHrpCm7Yacrk8k14049RIrl+ywyRuazsrS/aGEEjYTYtJHx/q
         fZyKGC/8QpRi0bRm4g5aUbHv3z9CAeAzEtM1bv5K6nzjcCbYu+v6CkekF1vpEkhfUop/
         jsCgqE/h5PXldGQDDNGNTiNbbW8eCd+ekRKtHcgZZWtP6KmXAGm/331FUHKeUeNYo3yR
         Z9eghISXb+8tUubHi4mTAeuAkIKi/CAcDX9MC7T0ShP/1HIf7vhMrM+Ut7/R5o/LuYgw
         mt0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Iu4EkmmU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a25-20020a0cb359000000b006852e500f5bsi7198764qvf.322.2024.01.25.12.12.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jan 2024 12:12:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Iu4EkmmU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rT64x-0007ig-CD; Thu, 25 Jan 2024 15:12:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <n.ostrenkov@gmail.com>)
 id 1rT64w-0007hk-10; Thu, 25 Jan 2024 15:12:02 -0500
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <n.ostrenkov@gmail.com>)
 id 1rT64t-0006oo-RE; Thu, 25 Jan 2024 15:12:01 -0500
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-6000bbdbeceso47350167b3.2; 
 Thu, 25 Jan 2024 12:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706213518; x=1706818318; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TFUoNC1lAgfWpZEjhvmr06qXZkNpsWgTAE7H9zZCQAE=;
 b=Iu4EkmmUhP4qIFvzQYCAT4HwS0fcYiXOfykGJpx2TL2FWCqYQ0a0tvdJBGclalqXz6
 UdfGzd1amUOYnR831xrdge+/CL3X3gfRO/Jr0tfWh7jIYYM3HbELvIzYnFAdvPi+Qp8e
 C4eHxGRkIc7sDNzg2ZroSVJJFuGyfPdIrba4UrkD4SbLdhpGSxi2RGnbgfxL3osRNuQ1
 /PgSLqB5MGRKlB4L1p3SS60Xw2lCVxSK1+yAqDEsA2h1W6KB6/VFGjm7EElO3tr/tYMx
 bswrWjDNySR75CxNTarcOhYrqTizICLOqnuvCP8yVHiOtgHyImeQ1jEDRqQTHD64uVf3
 muUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706213518; x=1706818318;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TFUoNC1lAgfWpZEjhvmr06qXZkNpsWgTAE7H9zZCQAE=;
 b=C2uJvRs+iFWGl9TqrXVlgxl3KE2M/6QpYU/sK7SBm/Nrqpjt/WzN6GP8iq5kIqxfST
 BdGeU7m8x6J7LrxASha4QPZqtPMYNMeFk92bxGgOt4KeiRwiRMidB4Y4sLDsEKvUMhxb
 pZndBTpEGevFYC30aHT3s1URlwZ/VZrjGQmrcsCPyZBnrfl6FGSSW/IityL6MJfb1Ka2
 oAd8exiyPPrbhJ0qGod688MVON0FEbswvKYxSWvCdeX1tctgQIbPDv7mVhkiJMYg/vwJ
 rjCzkXI70GVMzLecUkE4YFZgIw7Q8Hz+PIhCJnJKdMd+iVxkL4j6De28Vkc1NS8VHruI
 7+Mg==
X-Gm-Message-State: AOJu0YwqM/B+3V5SHVKBfo6laGLGL8flTkf+dia/OhYzu6mhcyD6ti5Z
 swDw8Aqf7ps6KMQ406ap1Y8Hqjz2LY4/8aRW7TWnP+PAbgNiPWMfFn3GA03qQF9RBpOvG/D+3lT
 v9OHPFUBZhlriX9sACcZPENrcIbLgjE9EFNo=
X-Received: by 2002:a81:aa46:0:b0:602:b474:bd64 with SMTP id
 z6-20020a81aa46000000b00602b474bd64mr364266ywk.13.1706213518045; Thu, 25 Jan
 2024 12:11:58 -0800 (PST)
MIME-Version: 1.0
References: <20240108140325.1291-1-n.ostrenkov@gmail.com>
In-Reply-To: <20240108140325.1291-1-n.ostrenkov@gmail.com>
From: Nikita Ostrenkov <n.ostrenkov@gmail.com>
Date: Thu, 25 Jan 2024 23:11:47 +0300
Message-ID: <CAC8KSA2ansk83=JL2GNLXSgvXUnpHMEf2HtvARYnpViiWTVtRw@mail.gmail.com>
Subject: Re: [PATCH v2] hw/arm: add PCIe to Freescale i.MX6
To: qemu-devel@nongnu.org
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000a7772a060fcaca6c"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=n.ostrenkov@gmail.com; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: iNTEmoajjbwa

--000000000000a7772a060fcaca6c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ping
https://patchew.org/QEMU/20240108140325.1291-1-n.ostrenkov@gmail.com/

=D0=BF=D0=BD, 8 =D1=8F=D0=BD=D0=B2. 2024=E2=80=AF=D0=B3., 17:03 Nikita Ostr=
enkov <n.ostrenkov@gmail.com>:

> Signed-off-by: Nikita Ostrenkov <n.ostrenkov@gmail.com>
> ---
>  hw/arm/Kconfig            |  2 ++
>  hw/arm/fsl-imx6.c         | 25 ++++++++++++++++++++++
>  include/hw/arm/fsl-imx6.h | 44 ++++++++++++++++++++-------------------
>  3 files changed, 50 insertions(+), 21 deletions(-)
>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 660f49db49..2559d1317b 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -530,6 +530,7 @@ config FSL_IMX31
>
>  config FSL_IMX6
>      bool
> +    imply PCIE_DEVICES
>      imply I2C_DEVICES
>      select A9MPCORE
>      select IMX
> @@ -537,6 +538,7 @@ config FSL_IMX6
>      select IMX_I2C
>      select IMX_USBPHY
>      select WDT_IMX2
> +    select PCI_EXPRESS_DESIGNWARE
>      select SDHCI
>
>  config ASPEED_SOC
> diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
> index b2153022c0..27702b6d6d 100644
> --- a/hw/arm/fsl-imx6.c
> +++ b/hw/arm/fsl-imx6.c
> @@ -22,6 +22,7 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "hw/arm/fsl-imx6.h"
> +#include "hw/misc/unimp.h"
>  #include "hw/usb/imx-usb-phy.h"
>  #include "hw/boards.h"
>  #include "hw/qdev-properties.h"
> @@ -102,6 +103,8 @@ static void fsl_imx6_init(Object *obj)
>
>
>      object_initialize_child(obj, "eth", &s->eth, TYPE_IMX_ENET);
> +
> +    object_initialize_child(obj, "pcie", &s->pcie,
> TYPE_DESIGNWARE_PCIE_HOST);
>  }
>
>  static void fsl_imx6_realize(DeviceState *dev, Error **errp)
> @@ -109,6 +112,7 @@ static void fsl_imx6_realize(DeviceState *dev, Error
> **errp)
>      MachineState *ms =3D MACHINE(qdev_get_machine());
>      FslIMX6State *s =3D FSL_IMX6(dev);
>      uint16_t i;
> +    qemu_irq irq;
>      unsigned int smp_cpus =3D ms->smp.cpus;
>
>      if (smp_cpus > FSL_IMX6_NUM_CPUS) {
> @@ -421,6 +425,27 @@ static void fsl_imx6_realize(DeviceState *dev, Error
> **errp)
>                                              FSL_IMX6_WDOGn_IRQ[i]));
>      }
>
> +    /*
> +     * PCIe
> +     */
> +    sysbus_realize(SYS_BUS_DEVICE(&s->pcie), &error_abort);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->pcie), 0, FSL_IMX6_PCIe_REG_ADDR)=
;
> +
> +    irq =3D qdev_get_gpio_in(DEVICE(&s->a9mpcore), FSL_IMX6_PCIE1_IRQ);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->pcie), 0, irq);
> +    irq =3D qdev_get_gpio_in(DEVICE(&s->a9mpcore), FSL_IMX6_PCIE2_IRQ);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->pcie), 1, irq);
> +    irq =3D qdev_get_gpio_in(DEVICE(&s->a9mpcore), FSL_IMX6_PCIE3_IRQ);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->pcie), 2, irq);
> +    irq =3D qdev_get_gpio_in(DEVICE(&s->a9mpcore), FSL_IMX6_PCIE4_IRQ);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->pcie), 3, irq);
> +
> +    /*
> +     * PCIe PHY
> +     */
> +    create_unimplemented_device("pcie-phy", FSL_IMX6_PCIe_ADDR,
> +                                FSL_IMX6_PCIe_SIZE);
> +
>      /* ROM memory */
>      if (!memory_region_init_rom(&s->rom, OBJECT(dev), "imx6.rom",
>                                  FSL_IMX6_ROM_SIZE, errp)) {
> diff --git a/include/hw/arm/fsl-imx6.h b/include/hw/arm/fsl-imx6.h
> index 519b871014..61c593ffd2 100644
> --- a/include/hw/arm/fsl-imx6.h
> +++ b/include/hw/arm/fsl-imx6.h
> @@ -32,6 +32,7 @@
>  #include "hw/net/imx_fec.h"
>  #include "hw/usb/chipidea.h"
>  #include "hw/usb/imx-usb-phy.h"
> +#include "hw/pci-host/designware.h"
>  #include "exec/memory.h"
>  #include "cpu.h"
>  #include "qom/object.h"
> @@ -55,27 +56,28 @@ struct FslIMX6State {
>      DeviceState parent_obj;
>
>      /*< public >*/
> -    ARMCPU         cpu[FSL_IMX6_NUM_CPUS];
> -    A9MPPrivState  a9mpcore;
> -    IMX6CCMState   ccm;
> -    IMX6SRCState   src;
> -    IMX7SNVSState  snvs;
> -    IMXSerialState uart[FSL_IMX6_NUM_UARTS];
> -    IMXGPTState    gpt;
> -    IMXEPITState   epit[FSL_IMX6_NUM_EPITS];
> -    IMXI2CState    i2c[FSL_IMX6_NUM_I2CS];
> -    IMXGPIOState   gpio[FSL_IMX6_NUM_GPIOS];
> -    SDHCIState     esdhc[FSL_IMX6_NUM_ESDHCS];
> -    IMXSPIState    spi[FSL_IMX6_NUM_ECSPIS];
> -    IMX2WdtState   wdt[FSL_IMX6_NUM_WDTS];
> -    IMXUSBPHYState usbphy[FSL_IMX6_NUM_USB_PHYS];
> -    ChipideaState  usb[FSL_IMX6_NUM_USBS];
> -    IMXFECState    eth;
> -    MemoryRegion   rom;
> -    MemoryRegion   caam;
> -    MemoryRegion   ocram;
> -    MemoryRegion   ocram_alias;
> -    uint32_t       phy_num;
> +    ARMCPU             cpu[FSL_IMX6_NUM_CPUS];
> +    A9MPPrivState      a9mpcore;
> +    IMX6CCMState       ccm;
> +    IMX6SRCState       src;
> +    IMX7SNVSState      snvs;
> +    IMXSerialState     uart[FSL_IMX6_NUM_UARTS];
> +    IMXGPTState        gpt;
> +    IMXEPITState       epit[FSL_IMX6_NUM_EPITS];
> +    IMXI2CState        i2c[FSL_IMX6_NUM_I2CS];
> +    IMXGPIOState       gpio[FSL_IMX6_NUM_GPIOS];
> +    SDHCIState         esdhc[FSL_IMX6_NUM_ESDHCS];
> +    IMXSPIState        spi[FSL_IMX6_NUM_ECSPIS];
> +    IMX2WdtState       wdt[FSL_IMX6_NUM_WDTS];
> +    IMXUSBPHYState     usbphy[FSL_IMX6_NUM_USB_PHYS];
> +    ChipideaState      usb[FSL_IMX6_NUM_USBS];
> +    IMXFECState        eth;
> +    DesignwarePCIEHost pcie;
> +    MemoryRegion       rom;
> +    MemoryRegion       caam;
> +    MemoryRegion       ocram;
> +    MemoryRegion       ocram_alias;
> +    uint32_t           phy_num;
>  };
>
>
> --
> 2.34.1
>
>

--000000000000a7772a060fcaca6c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Ping<div dir=3D"auto"><a href=3D"https://patchew.org/QEMU=
/20240108140325.1291-1-n.ostrenkov@gmail.com/">https://patchew.org/QEMU/202=
40108140325.1291-1-n.ostrenkov@gmail.com/</a></div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=D0=BF=D0=BD, 8 =D1=8F=
=D0=BD=D0=B2. 2024=E2=80=AF=D0=B3., 17:03 Nikita Ostrenkov &lt;<a href=3D"m=
ailto:n.ostrenkov@gmail.com">n.ostrenkov@gmail.com</a>&gt;:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">Signed-off-by: Nikita Ostrenkov &lt;<a href=3D"mai=
lto:n.ostrenkov@gmail.com" target=3D"_blank" rel=3D"noreferrer">n.ostrenkov=
@gmail.com</a>&gt;<br>
---<br>
=C2=A0hw/arm/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 ++<=
br>
=C2=A0hw/arm/fsl-imx6.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 25 +++++++++++++=
+++++++++<br>
=C2=A0include/hw/arm/fsl-imx6.h | 44 ++++++++++++++++++++------------------=
-<br>
=C2=A03 files changed, 50 insertions(+), 21 deletions(-)<br>
<br>
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig<br>
index 660f49db49..2559d1317b 100644<br>
--- a/hw/arm/Kconfig<br>
+++ b/hw/arm/Kconfig<br>
@@ -530,6 +530,7 @@ config FSL_IMX31<br>
<br>
=C2=A0config FSL_IMX6<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
+=C2=A0 =C2=A0 imply PCIE_DEVICES<br>
=C2=A0 =C2=A0 =C2=A0imply I2C_DEVICES<br>
=C2=A0 =C2=A0 =C2=A0select A9MPCORE<br>
=C2=A0 =C2=A0 =C2=A0select IMX<br>
@@ -537,6 +538,7 @@ config FSL_IMX6<br>
=C2=A0 =C2=A0 =C2=A0select IMX_I2C<br>
=C2=A0 =C2=A0 =C2=A0select IMX_USBPHY<br>
=C2=A0 =C2=A0 =C2=A0select WDT_IMX2<br>
+=C2=A0 =C2=A0 select PCI_EXPRESS_DESIGNWARE<br>
=C2=A0 =C2=A0 =C2=A0select SDHCI<br>
<br>
=C2=A0config ASPEED_SOC<br>
diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c<br>
index b2153022c0..27702b6d6d 100644<br>
--- a/hw/arm/fsl-imx6.c<br>
+++ b/hw/arm/fsl-imx6.c<br>
@@ -22,6 +22,7 @@<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;hw/arm/fsl-imx6.h&quot;<br>
+#include &quot;hw/misc/unimp.h&quot;<br>
=C2=A0#include &quot;hw/usb/imx-usb-phy.h&quot;<br>
=C2=A0#include &quot;hw/boards.h&quot;<br>
=C2=A0#include &quot;hw/qdev-properties.h&quot;<br>
@@ -102,6 +103,8 @@ static void fsl_imx6_init(Object *obj)<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0object_initialize_child(obj, &quot;eth&quot;, &amp;s-&g=
t;eth, TYPE_IMX_ENET);<br>
+<br>
+=C2=A0 =C2=A0 object_initialize_child(obj, &quot;pcie&quot;, &amp;s-&gt;pc=
ie, TYPE_DESIGNWARE_PCIE_HOST);<br>
=C2=A0}<br>
<br>
=C2=A0static void fsl_imx6_realize(DeviceState *dev, Error **errp)<br>
@@ -109,6 +112,7 @@ static void fsl_imx6_realize(DeviceState *dev, Error **=
errp)<br>
=C2=A0 =C2=A0 =C2=A0MachineState *ms =3D MACHINE(qdev_get_machine());<br>
=C2=A0 =C2=A0 =C2=A0FslIMX6State *s =3D FSL_IMX6(dev);<br>
=C2=A0 =C2=A0 =C2=A0uint16_t i;<br>
+=C2=A0 =C2=A0 qemu_irq irq;<br>
=C2=A0 =C2=A0 =C2=A0unsigned int smp_cpus =3D ms-&gt;smp.cpus;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (smp_cpus &gt; FSL_IMX6_NUM_CPUS) {<br>
@@ -421,6 +425,27 @@ static void fsl_imx6_realize(DeviceState *dev, Error *=
*errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0FSL_IMX6_WDOGn_IRQ[i]));<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* PCIe<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 sysbus_realize(SYS_BUS_DEVICE(&amp;s-&gt;pcie), &amp;error_a=
bort);<br>
+=C2=A0 =C2=A0 sysbus_mmio_map(SYS_BUS_DEVICE(&amp;s-&gt;pcie), 0, FSL_IMX6=
_PCIe_REG_ADDR);<br>
+<br>
+=C2=A0 =C2=A0 irq =3D qdev_get_gpio_in(DEVICE(&amp;s-&gt;a9mpcore), FSL_IM=
X6_PCIE1_IRQ);<br>
+=C2=A0 =C2=A0 sysbus_connect_irq(SYS_BUS_DEVICE(&amp;s-&gt;pcie), 0, irq);=
<br>
+=C2=A0 =C2=A0 irq =3D qdev_get_gpio_in(DEVICE(&amp;s-&gt;a9mpcore), FSL_IM=
X6_PCIE2_IRQ);<br>
+=C2=A0 =C2=A0 sysbus_connect_irq(SYS_BUS_DEVICE(&amp;s-&gt;pcie), 1, irq);=
<br>
+=C2=A0 =C2=A0 irq =3D qdev_get_gpio_in(DEVICE(&amp;s-&gt;a9mpcore), FSL_IM=
X6_PCIE3_IRQ);<br>
+=C2=A0 =C2=A0 sysbus_connect_irq(SYS_BUS_DEVICE(&amp;s-&gt;pcie), 2, irq);=
<br>
+=C2=A0 =C2=A0 irq =3D qdev_get_gpio_in(DEVICE(&amp;s-&gt;a9mpcore), FSL_IM=
X6_PCIE4_IRQ);<br>
+=C2=A0 =C2=A0 sysbus_connect_irq(SYS_BUS_DEVICE(&amp;s-&gt;pcie), 3, irq);=
<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* PCIe PHY<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 create_unimplemented_device(&quot;pcie-phy&quot;, FSL_IMX6_P=
CIe_ADDR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FSL_IMX6_PCIe_SIZE);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0/* ROM memory */<br>
=C2=A0 =C2=A0 =C2=A0if (!memory_region_init_rom(&amp;s-&gt;rom, OBJECT(dev)=
, &quot;imx6.rom&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FSL_IMX6_ROM_SIZE, errp)) {<br=
>
diff --git a/include/hw/arm/fsl-imx6.h b/include/hw/arm/fsl-imx6.h<br>
index 519b871014..61c593ffd2 100644<br>
--- a/include/hw/arm/fsl-imx6.h<br>
+++ b/include/hw/arm/fsl-imx6.h<br>
@@ -32,6 +32,7 @@<br>
=C2=A0#include &quot;hw/net/imx_fec.h&quot;<br>
=C2=A0#include &quot;hw/usb/chipidea.h&quot;<br>
=C2=A0#include &quot;hw/usb/imx-usb-phy.h&quot;<br>
+#include &quot;hw/pci-host/designware.h&quot;<br>
=C2=A0#include &quot;exec/memory.h&quot;<br>
=C2=A0#include &quot;cpu.h&quot;<br>
=C2=A0#include &quot;qom/object.h&quot;<br>
@@ -55,27 +56,28 @@ struct FslIMX6State {<br>
=C2=A0 =C2=A0 =C2=A0DeviceState parent_obj;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/*&lt; public &gt;*/<br>
-=C2=A0 =C2=A0 ARMCPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu[FSL_IMX6_NUM_CPU=
S];<br>
-=C2=A0 =C2=A0 A9MPPrivState=C2=A0 a9mpcore;<br>
-=C2=A0 =C2=A0 IMX6CCMState=C2=A0 =C2=A0ccm;<br>
-=C2=A0 =C2=A0 IMX6SRCState=C2=A0 =C2=A0src;<br>
-=C2=A0 =C2=A0 IMX7SNVSState=C2=A0 snvs;<br>
-=C2=A0 =C2=A0 IMXSerialState uart[FSL_IMX6_NUM_UARTS];<br>
-=C2=A0 =C2=A0 IMXGPTState=C2=A0 =C2=A0 gpt;<br>
-=C2=A0 =C2=A0 IMXEPITState=C2=A0 =C2=A0epit[FSL_IMX6_NUM_EPITS];<br>
-=C2=A0 =C2=A0 IMXI2CState=C2=A0 =C2=A0 i2c[FSL_IMX6_NUM_I2CS];<br>
-=C2=A0 =C2=A0 IMXGPIOState=C2=A0 =C2=A0gpio[FSL_IMX6_NUM_GPIOS];<br>
-=C2=A0 =C2=A0 SDHCIState=C2=A0 =C2=A0 =C2=A0esdhc[FSL_IMX6_NUM_ESDHCS];<br=
>
-=C2=A0 =C2=A0 IMXSPIState=C2=A0 =C2=A0 spi[FSL_IMX6_NUM_ECSPIS];<br>
-=C2=A0 =C2=A0 IMX2WdtState=C2=A0 =C2=A0wdt[FSL_IMX6_NUM_WDTS];<br>
-=C2=A0 =C2=A0 IMXUSBPHYState usbphy[FSL_IMX6_NUM_USB_PHYS];<br>
-=C2=A0 =C2=A0 ChipideaState=C2=A0 usb[FSL_IMX6_NUM_USBS];<br>
-=C2=A0 =C2=A0 IMXFECState=C2=A0 =C2=A0 eth;<br>
-=C2=A0 =C2=A0 MemoryRegion=C2=A0 =C2=A0rom;<br>
-=C2=A0 =C2=A0 MemoryRegion=C2=A0 =C2=A0caam;<br>
-=C2=A0 =C2=A0 MemoryRegion=C2=A0 =C2=A0ocram;<br>
-=C2=A0 =C2=A0 MemoryRegion=C2=A0 =C2=A0ocram_alias;<br>
-=C2=A0 =C2=A0 uint32_t=C2=A0 =C2=A0 =C2=A0 =C2=A0phy_num;<br>
+=C2=A0 =C2=A0 ARMCPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu[FS=
L_IMX6_NUM_CPUS];<br>
+=C2=A0 =C2=A0 A9MPPrivState=C2=A0 =C2=A0 =C2=A0 a9mpcore;<br>
+=C2=A0 =C2=A0 IMX6CCMState=C2=A0 =C2=A0 =C2=A0 =C2=A0ccm;<br>
+=C2=A0 =C2=A0 IMX6SRCState=C2=A0 =C2=A0 =C2=A0 =C2=A0src;<br>
+=C2=A0 =C2=A0 IMX7SNVSState=C2=A0 =C2=A0 =C2=A0 snvs;<br>
+=C2=A0 =C2=A0 IMXSerialState=C2=A0 =C2=A0 =C2=A0uart[FSL_IMX6_NUM_UARTS];<=
br>
+=C2=A0 =C2=A0 IMXGPTState=C2=A0 =C2=A0 =C2=A0 =C2=A0 gpt;<br>
+=C2=A0 =C2=A0 IMXEPITState=C2=A0 =C2=A0 =C2=A0 =C2=A0epit[FSL_IMX6_NUM_EPI=
TS];<br>
+=C2=A0 =C2=A0 IMXI2CState=C2=A0 =C2=A0 =C2=A0 =C2=A0 i2c[FSL_IMX6_NUM_I2CS=
];<br>
+=C2=A0 =C2=A0 IMXGPIOState=C2=A0 =C2=A0 =C2=A0 =C2=A0gpio[FSL_IMX6_NUM_GPI=
OS];<br>
+=C2=A0 =C2=A0 SDHCIState=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0esdhc[FSL_IMX6_N=
UM_ESDHCS];<br>
+=C2=A0 =C2=A0 IMXSPIState=C2=A0 =C2=A0 =C2=A0 =C2=A0 spi[FSL_IMX6_NUM_ECSP=
IS];<br>
+=C2=A0 =C2=A0 IMX2WdtState=C2=A0 =C2=A0 =C2=A0 =C2=A0wdt[FSL_IMX6_NUM_WDTS=
];<br>
+=C2=A0 =C2=A0 IMXUSBPHYState=C2=A0 =C2=A0 =C2=A0usbphy[FSL_IMX6_NUM_USB_PH=
YS];<br>
+=C2=A0 =C2=A0 ChipideaState=C2=A0 =C2=A0 =C2=A0 usb[FSL_IMX6_NUM_USBS];<br=
>
+=C2=A0 =C2=A0 IMXFECState=C2=A0 =C2=A0 =C2=A0 =C2=A0 eth;<br>
+=C2=A0 =C2=A0 DesignwarePCIEHost pcie;<br>
+=C2=A0 =C2=A0 MemoryRegion=C2=A0 =C2=A0 =C2=A0 =C2=A0rom;<br>
+=C2=A0 =C2=A0 MemoryRegion=C2=A0 =C2=A0 =C2=A0 =C2=A0caam;<br>
+=C2=A0 =C2=A0 MemoryRegion=C2=A0 =C2=A0 =C2=A0 =C2=A0ocram;<br>
+=C2=A0 =C2=A0 MemoryRegion=C2=A0 =C2=A0 =C2=A0 =C2=A0ocram_alias;<br>
+=C2=A0 =C2=A0 uint32_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0phy_num;<br=
>
=C2=A0};<br>
<br>
<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div>

--000000000000a7772a060fcaca6c--
