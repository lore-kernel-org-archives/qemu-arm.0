Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1764256ejn;
        Sun, 16 Oct 2022 07:15:54 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6X4ckwafDQeJ1t0+cy7oeISL+UunCKrwc9xdkC+0ensq0M/FVGPPLUKih5kc+f8ONNDzPv
X-Received: by 2002:a05:620a:16d5:b0:6ec:52ab:e8bd with SMTP id a21-20020a05620a16d500b006ec52abe8bdmr4619465qkn.424.1665929754475;
        Sun, 16 Oct 2022 07:15:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665929754; cv=none;
        d=google.com; s=arc-20160816;
        b=PvSdPduIZi5LpnMHl/JkVtpL05Q5rGZd6h5Jrqjr4hCcCrfhluZ1l+zvN8LFoTyUxV
         m9r4V8TKgvxazgE57US7FyHSJBByee64Kmamsyad4L0e4utlB6/ZUfa5ttqBp10m9G4F
         Vlh/h/HJpgHhvTwOggLQxOqNwqx1xx2frrQ7MprCFoy4TpzMdNvZn/U9IqgP/u/jObj7
         lrV8BJGYaXrME6quGcc1B2XJd6U8KbKQjT1NCghHr95Ssj3OvPKheVO0GGshxKoWWVHj
         68ypcUJqF8dNwXnRhIkUUGKRtQY3N4FH1sCo88KP20vuIVdzjehwDJ4VWJ1piQcba0yx
         QvSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:cc:to:from:date;
        bh=fo7apOubQ39aMphkVOgCWWZZgHlQbffMNd+RUEHFBew=;
        b=wd3XfFNdQzxemd+IwbMhAmIkNc+3wnZOCtUrYrZlTJfADyyZgy8MEeaPdc19Jix4mP
         M67a8ohO2CF+nXid8LU9OegBF9s3j8B32l1aXY9KH1SOnRj+ML/b+xBFvHf3EzFqWwV5
         HOuPPeMHacHZHIkHM//vgPaRsjvR8/6hErvewHzyw170MOAnJ93I3yaU9hfprUCth5PH
         +grZ1XLfkyr6geFl3NT1pct+L7ZUgAe+xa2233IK+dkDd9v++rNhzOj5CnYn3sdjiu/v
         kpjmhLTfghZEQZ+uuhZZAcVxBqmMBhdJOlA7gAq1+eIB7kllF4zBGFbZlDvpWXXCHGZr
         HdtA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t10-20020a0562140c6a00b004afb5d22ed1si3998742qvj.191.2022.10.16.07.15.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 Oct 2022 07:15:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1]:43094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ok4Qj-0004Dw-Vm
	for alex.bennee@linaro.org; Sun, 16 Oct 2022 10:15:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ok4QE-0004Br-JJ; Sun, 16 Oct 2022 10:15:22 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:20635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ok4QA-0007no-IV; Sun, 16 Oct 2022 10:15:21 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 41D2175A151;
 Sun, 16 Oct 2022 16:15:10 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id EC9DA75A135; Sun, 16 Oct 2022 16:15:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id E9AB875A15C;
 Sun, 16 Oct 2022 16:15:09 +0200 (CEST)
Date: Sun, 16 Oct 2022 16:15:09 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>, 
 qemu-arm@nongnu.org, Alistair Francis <alistair@alistair23.me>, 
 Jan Kiszka <jan.kiszka@web.de>, Magnus Damm <magnus.damm@gmail.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, 
 Bin Meng <bin.meng@windriver.com>, Aurelien Jarno <aurelien@aurel32.net>, 
 qemu-ppc@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>, 
 Antony Pavlov <antonynpavlov@gmail.com>, Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v3 7/9] hw/ppc/e500: Implement pflash handling
In-Reply-To: <20221016122737.93755-8-shentey@gmail.com>
Message-ID: <2d634687-bdf7-a59b-76e1-60de81142a4a@eik.bme.hu>
References: <20221016122737.93755-1-shentey@gmail.com>
 <20221016122737.93755-8-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1358549279-1665929709=:92617"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9YZbc8za6FRS

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1358549279-1665929709=:92617
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sun, 16 Oct 2022, Bernhard Beschow wrote:
> Allows e500 boards to have their root file system reside on flash using
> only builtin devices located in the eLBC memory region.
>
> Note that the flash memory area is only created when a -pflash argument is
> given, and that the size is determined by the given file. The idea is to
> put users into control.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
> docs/system/ppc/ppce500.rst | 16 ++++++++++
> hw/ppc/Kconfig              |  1 +
> hw/ppc/e500.c               | 62 +++++++++++++++++++++++++++++++++++++
> 3 files changed, 79 insertions(+)
>
> diff --git a/docs/system/ppc/ppce500.rst b/docs/system/ppc/ppce500.rst
> index ba6bcb7314..99d2c680d6 100644
> --- a/docs/system/ppc/ppce500.rst
> +++ b/docs/system/ppc/ppce500.rst
> @@ -165,3 +165,19 @@ if “-device eTSEC” is given to QEMU:
> .. code-block:: bash
>
>   -netdev tap,ifname=tap0,script=no,downscript=no,id=net0 -device eTSEC,netdev=net0
> +
> +Root file system on flash drive
> +-------------------------------
> +
> +Rather than using a root file system on ram disk, it is possible to have it on
> +CFI flash. Given an ext2 image whose size must be a power of two, it can be used
> +as follows:
> +
> +.. code-block:: bash
> +
> +  $ qemu-system-ppc{64|32} -M ppce500 -cpu e500mc -smp 4 -m 2G \

We have qemu-system-ppc and qemu-system-ppc64 not qemu-system-ppc32 so 
maybe qemu-system-ppc[64] even though that looks odd so maybe just 
qemu-system-ppc and then people should know that ppc64 includes ppc config 
as well.

Regards,
BALATON Zoltan

> +      -display none -serial stdio \
> +      -kernel vmlinux \
> +      -drive if=pflash,file=/path/to/rootfs.ext2,format=raw \
> +      -append "rootwait root=/dev/mtdblock0"
> +
> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
> index 791fe78a50..769a1ead1c 100644
> --- a/hw/ppc/Kconfig
> +++ b/hw/ppc/Kconfig
> @@ -126,6 +126,7 @@ config E500
>     select ETSEC
>     select GPIO_MPC8XXX
>     select OPENPIC
> +    select PFLASH_CFI01
>     select PLATFORM_BUS
>     select PPCE500_PCI
>     select SERIAL
> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
> index 3e950ea3ba..23d2c3451a 100644
> --- a/hw/ppc/e500.c
> +++ b/hw/ppc/e500.c
> @@ -23,8 +23,10 @@
> #include "e500-ccsr.h"
> #include "net/net.h"
> #include "qemu/config-file.h"
> +#include "hw/block/flash.h"
> #include "hw/char/serial.h"
> #include "hw/pci/pci.h"
> +#include "sysemu/block-backend-io.h"
> #include "sysemu/sysemu.h"
> #include "sysemu/kvm.h"
> #include "sysemu/reset.h"
> @@ -267,6 +269,31 @@ static void sysbus_device_create_devtree(SysBusDevice *sbdev, void *opaque)
>     }
> }
>
> +static void create_devtree_flash(SysBusDevice *sbdev,
> +                                 PlatformDevtreeData *data)
> +{
> +    g_autofree char *name = NULL;
> +    uint64_t num_blocks = object_property_get_uint(OBJECT(sbdev),
> +                                                   "num-blocks",
> +                                                   &error_fatal);
> +    uint64_t sector_length = object_property_get_uint(OBJECT(sbdev),
> +                                                      "sector-length",
> +                                                      &error_fatal);
> +    uint64_t bank_width = object_property_get_uint(OBJECT(sbdev),
> +                                                   "width",
> +                                                   &error_fatal);
> +    hwaddr flashbase = 0;
> +    hwaddr flashsize = num_blocks * sector_length;
> +    void *fdt = data->fdt;
> +
> +    name = g_strdup_printf("%s/nor@%" PRIx64, data->node, flashbase);
> +    qemu_fdt_add_subnode(fdt, name);
> +    qemu_fdt_setprop_string(fdt, name, "compatible", "cfi-flash");
> +    qemu_fdt_setprop_sized_cells(fdt, name, "reg",
> +                                 1, flashbase, 1, flashsize);
> +    qemu_fdt_setprop_cell(fdt, name, "bank-width", bank_width);
> +}
> +
> static void platform_bus_create_devtree(PPCE500MachineState *pms,
>                                         void *fdt, const char *mpic)
> {
> @@ -276,6 +303,8 @@ static void platform_bus_create_devtree(PPCE500MachineState *pms,
>     uint64_t addr = pmc->platform_bus_base;
>     uint64_t size = pmc->platform_bus_size;
>     int irq_start = pmc->platform_bus_first_irq;
> +    SysBusDevice *sbdev;
> +    bool ambiguous;
>
>     /* Create a /platform node that we can put all devices into */
>
> @@ -302,6 +331,13 @@ static void platform_bus_create_devtree(PPCE500MachineState *pms,
>     /* Loop through all dynamic sysbus devices and create nodes for them */
>     foreach_dynamic_sysbus_device(sysbus_device_create_devtree, &data);
>
> +    sbdev = SYS_BUS_DEVICE(object_resolve_path_type("", TYPE_PFLASH_CFI01,
> +                                                    &ambiguous));
> +    if (sbdev) {
> +        assert(!ambiguous);
> +        create_devtree_flash(sbdev, &data);
> +    }
> +
>     g_free(node);
> }
>
> @@ -856,6 +892,7 @@ void ppce500_init(MachineState *machine)
>     unsigned int pci_irq_nrs[PCI_NUM_PINS] = {1, 2, 3, 4};
>     IrqLines *irqs;
>     DeviceState *dev, *mpicdev;
> +    DriveInfo *dinfo;
>     CPUPPCState *firstenv = NULL;
>     MemoryRegion *ccsr_addr_space;
>     SysBusDevice *s;
> @@ -1024,6 +1061,31 @@ void ppce500_init(MachineState *machine)
>                                 pmc->platform_bus_base,
>                                 &pms->pbus_dev->mmio);
>
> +    dinfo = drive_get(IF_PFLASH, 0, 0);
> +    if (dinfo) {
> +        BlockBackend *blk = blk_by_legacy_dinfo(dinfo);
> +        BlockDriverState *bs = blk_bs(blk);
> +        uint64_t size = bdrv_getlength(bs);
> +        uint64_t mmio_size = pms->pbus_dev->mmio.size;
> +        PFlashCFI01 *pfl;
> +
> +        if (!is_power_of_2(size)) {
> +            error_report("Size of pflash file must be a power of two.");
> +            exit(1);
> +        }
> +
> +        if (size > mmio_size) {
> +            error_report("Size of pflash file must not be bigger than %" PRIu64
> +                         " bytes.", mmio_size);
> +            exit(1);
> +        }
> +
> +        pfl = pflash_cfi01_register("e500.flash", size, blk, 64 * KiB, 2,
> +                                    0x89, 0x18, 0x0000, 0x0, 1);
> +        memory_region_add_subregion(&pms->pbus_dev->mmio, 0,
> +                                    pflash_cfi01_get_memory(pfl));
> +    }
> +
>     /*
>      * Smart firmware defaults ahead!
>      *
>
--3866299591-1358549279-1665929709=:92617--
