Received: by 10.25.0.6 with SMTP id 6csp172185lfa;
        Tue, 30 May 2017 23:04:39 -0700 (PDT)
X-Received: by 10.55.21.82 with SMTP id f79mr19824021qkh.128.1496210679315;
        Tue, 30 May 2017 23:04:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496210679; cv=none;
        d=google.com; s=arc-20160816;
        b=OwI/M6K2NV5XsfS0gmY2GrEQGw3hTDdTYPnuvQhI6m2RtyFiA+RR/WsX+9FuJSoUSY
         +OxLoiYizocLhWdi8jCF3F73q4PEnppCLhPAXrw5c3l3pKO3qPLV4bczlVbltnAync5a
         h6kSooMZAH9L6j+VHQtC6QQRDgz1nOUXOzb08K3sd/Ls+SrT9FLg1rLmL9LuyZ9CgjmF
         xAURvQGOy0yAr5ddVjE76PVlvxvoSycvOx6jERaFu3C4bVRIdUDgXcz11WMth31Cq84+
         Idi3cUrAGqFW/zXsoKiyOj21vATE9MVrUcV28KTt9Ea3tdfZx2+fJ2ZZansnYfT2ea1S
         E8Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=73zDLkYq5Gf6Ya7HHdG1LYyDPDoQHSAapfmmNMQS0L0=;
        b=ZTPU23YZRXXkgjiZLHBHEtviMPbxBOJ25JCWdIL5RTqGc7zj37GNfz1p0LHRePAsPw
         WBLa9IcJUFXQsXh+Rwd/sSmlZZ4Y1IQLRUNR4pIZk9GmeM2WExjBL4KwfvtaVqeINme+
         5IKYNfLO0XygbitLTiZK+YakkQbYBoFWFv3fnDAhOjwUdlIa4mnomKwpJDfngHwun0++
         BZYiC8lgdy+CrtoI2sq+H5OE52j6cZWu0nigQS2wm1PPk2BcGPxXnluzj/UDTdXUnwDh
         f9RKvFfYvoGccfEzLhXg/90VxvDCUDyMNwy5yOogBRhC++vfuScXwBw672fhSSofbF73
         hejg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a78si14911872qkh.64.2017.05.30.23.04.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 May 2017 23:04:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57430 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dFwkG-0005ID-Kv
	for alex.bennee@linaro.org; Wed, 31 May 2017 02:04:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50093)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dFwkC-0005I5-B7
	for qemu-arm@nongnu.org; Wed, 31 May 2017 02:04:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dFwk9-0001zQ-4j
	for qemu-arm@nongnu.org; Wed, 31 May 2017 02:04:32 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:36470)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dFwk8-0001zE-UX; Wed, 31 May 2017 02:04:29 -0400
Received: by mail-oi0-x244.google.com with SMTP id w138so458778oiw.3;
	Tue, 30 May 2017 23:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=73zDLkYq5Gf6Ya7HHdG1LYyDPDoQHSAapfmmNMQS0L0=;
	b=EBT4RdqW+xDwqH3paYi1WU4oiS51UbN3Z2Vm220YytrKA7r9Kt9xKlMizUTrZiMKBI
	/7nNE9JnuCZdb6hG2ioEyxJjn9F8dsDu1D+HTGccs2TiBU+von7RloxffPluSLCdT2Vy
	no6SCcuJCf1MFI6giZs2x07PtL/dP8P3hAcLFnYRXy+/MrThsd7xZsSq4lSqP7H49D28
	EcMZ2nCtm2f+lFVwu5hxBKgU+ZvcNpfK6U5g+6SRUIfMPOZT5+R8159Y7HJI6j/it6n+
	zs5Nw+5j3EPxTSgnaquZ1R1bCoUCdsR+48aHwXmGGeROFNSLYFf6vQs5AuX2C1wWFgFi
	+NNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=73zDLkYq5Gf6Ya7HHdG1LYyDPDoQHSAapfmmNMQS0L0=;
	b=q05DdPBh+ZNQ0vAgNpHCc7NAM5g7eBnmX+YOB6bZEbf0Segv1jGCLv5QzQAPveo5s1
	pXK78hewv5B1gDadYSJ7RwGxz5cfGmNeTrBsJVbJ0cOv78F0IOy0fWjOFRYd2OsjLv30
	pTnWMMPcYec2idlqiKowXBVwQScuhuh4AdPCMEdWwkX/ZT9JOzG0K2kaNzlnPaxP3yf/
	qJTB8UPSua9vEZNl9nf6NvkKkXom8ZbZGdr6koNjLAKJ8Gu25jm9XBB7NtzuXQ7MucsQ
	BPgOmJFLfOUHTMwWyvGfjPlNfmAkCjszqQGzwN5NvysnG4X0WJcHQwvcOLG6rY0y5Iq5
	+GXQ==
X-Gm-Message-State: AODbwcDXhp12LvoxtVFb/wMBfa3jXFkdYcwg3W8bD/Uwre7smGBOvvv5
	8cVmDcE01fZ9yw==
X-Received: by 10.202.81.12 with SMTP id f12mr11980145oib.66.1496210668179;
	Tue, 30 May 2017 23:04:28 -0700 (PDT)
Received: from [192.168.1.107]
	(162-231-236-127.lightspeed.miamfl.sbcglobal.net. [162.231.236.127])
	by smtp.gmail.com with ESMTPSA id
	j16sm6882677oth.12.2017.05.30.23.04.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 May 2017 23:04:26 -0700 (PDT)
To: Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
References: <1494949133-2202-1-git-send-email-sundeep.lkml@gmail.com>
	<1494949133-2202-6-git-send-email-sundeep.lkml@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6c077dcf-e8a8-aae9-9023-f197007a98dc@amsat.org>
Date: Wed, 31 May 2017 03:04:25 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1494949133-2202-6-git-send-email-sundeep.lkml@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [Qemu devel v5 PATCH 5/5] msf2: Add Emcraft's
 Smartfusion2 SOM kit.
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, alistair23@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9sMjZD/RC0AG

Hi Subbaraya,

On 05/16/2017 12:38 PM, Subbaraya Sundeep wrote:
> Emulated Emcraft's Smartfusion2 System On Module starter
> kit.
>
> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
> ---
>  hw/arm/Makefile.objs |  1 +
>  hw/arm/msf2-som.c    | 89 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 90 insertions(+)
>  create mode 100644 hw/arm/msf2-som.c
>
> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> index c828061..4b02093 100644
> --- a/hw/arm/Makefile.objs
> +++ b/hw/arm/Makefile.objs
> @@ -5,6 +5,7 @@ obj-y += omap_sx1.o palm.o realview.o spitz.o stellaris.o
>  obj-y += tosa.o versatilepb.o vexpress.o virt.o xilinx_zynq.o z2.o
>  obj-$(CONFIG_ACPI) += virt-acpi-build.o
>  obj-y += netduino2.o
> +obj-y += msf2-som.o
>  obj-y += sysbus-fdt.o
>
>  obj-y += armv7m.o exynos4210.o pxa2xx.o pxa2xx_gpio.o pxa2xx_pic.o
> diff --git a/hw/arm/msf2-som.c b/hw/arm/msf2-som.c
> new file mode 100644
> index 0000000..cd2b759
> --- /dev/null
> +++ b/hw/arm/msf2-som.c
> @@ -0,0 +1,89 @@
> +/*
> + * SmartFusion2 SOM starter kit(from Emcraft) emulation.
> + *
> + * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "hw/boards.h"
> +#include "hw/arm/msf2-soc.h"
> +#include "hw/arm/arm.h"
> +#include "exec/address-spaces.h"
> +
> +#define DDR_BASE_ADDRESS      0xA0000000
> +#define DDR_SIZE              (64 * M_BYTE)
> +
> +static void emcraft_sf2_init(MachineState *machine)
> +{
> +    DeviceState *dev;
> +    DeviceState *spi_flash;
> +    MSF2State *soc;
> +    DriveInfo *dinfo = drive_get_next(IF_MTD);
> +    qemu_irq cs_line;
> +    SSIBus *spi_bus;
> +    MemoryRegion *sysmem = get_system_memory();
> +    MemoryRegion *ddr = g_new(MemoryRegion, 1);
> +
> +    memory_region_init_ram(ddr, NULL, "ddr-ram", DDR_SIZE,
> +                           &error_fatal);
> +    vmstate_register_ram_global(ddr);
> +    memory_region_add_subregion(sysmem, DDR_BASE_ADDRESS, ddr);
> +
> +    dev = qdev_create(NULL, TYPE_MSF2_SOC);
> +    qdev_prop_set_string(dev, "part-name", "M2S010");
> +    qdev_prop_set_uint64(dev, "eNVM-size", M2S010_ENVM_SIZE);
> +    qdev_prop_set_uint64(dev, "eSRAM-size", M2S010_ESRAM_SIZE);
> +
> +    /*
> +     * pclk0 and pclk1 are configurable in Libero.
> +     * Emcraft's SoM kit comes with these settings by default.
> +     */
> +    qdev_prop_set_uint32(dev, "pclk0", 71 * 1000000);
> +    qdev_prop_set_uint32(dev, "pclk1", 71 * 1000000);
> +
> +    object_property_set_bool(OBJECT(dev), true, "realized", &error_fatal);
> +
> +    soc = MSF2_SOC(dev);
> +
> +    /* Attach SPI flash to SPI0 controller */
> +    spi_bus = (SSIBus *)qdev_get_child_bus(dev, "spi0");
> +    spi_flash = ssi_create_slave_no_init(spi_bus, "s25sl12801");
> +    qdev_prop_set_uint8(spi_flash, "spansion-cr2nv", 1);
> +    if (dinfo) {
> +        qdev_prop_set_drive(spi_flash, "drive", blk_by_legacy_dinfo(dinfo),
> +                                    &error_fatal);
> +    }
> +    qdev_init_nofail(spi_flash);
> +    cs_line = qdev_get_gpio_in_named(spi_flash, SSI_GPIO_CS, 0);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&soc->spi[0]), 1, cs_line);
> +
> +    armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
> +                       soc->envm_size);
> +}
> +
> +static void emcraft_sf2_machine_init(MachineClass *mc)
> +{
> +    mc->desc = "SmartFusion2 SOM kit from Emcraft";
> +    mc->init = emcraft_sf2_init;
> +}
> +
> +DEFINE_MACHINE("smartfusion2-som", emcraft_sf2_machine_init)

Here I still disagree with the machine name, what do you think about 
"emcraft-sf2" or "emcraft-m2s[-fg484-som]" as described by Emcraft in 
their website (but shorter is easier to type)?
