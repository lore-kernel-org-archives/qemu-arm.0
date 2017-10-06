Received: by 10.223.197.9 with SMTP id q9csp1725647wrf;
        Fri, 6 Oct 2017 07:44:21 -0700 (PDT)
X-Received: by 10.200.52.56 with SMTP id u53mr3360819qtb.16.1507301060966;
        Fri, 06 Oct 2017 07:44:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507301060; cv=none;
        d=google.com; s=arc-20160816;
        b=xPzOF153BgRPwruMnXEbZN0kCiO9TFp9Zuqv0R+MKh/QBVo6j+tikO13t0nH6xhHCD
         rHg8GcFV+MgLDWp3G9s4c4D6bP7gKrHrfEGEuBE4NIlI+lXt9Muu0k3tACRTLe+LrYU1
         1W0i3cqfkK/V3toIE/Ihzsg/TZSA3MdmYBlKwE8Tn18apBp27THcjwlQHo0w7viL57ab
         Gjb1mLP7q/T/n0MkGKCOoxp7hZFSfLZBCtGSxZTNfx0uPVTPViOXA+fxi4nSvwUY7vAA
         FkRTkhLECvP8GIv3GdQgheQhU7WZgDDIz5gE5HHurGZLE13/vHTxmpT8FnZ8WThnwWor
         8/iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=q3+R3GZ/0v8rGZWl5A1D0MTw4Lg2/OLeA8gNkZEJo58=;
        b=JK8+2VT2VoEZ0CzYRcOuqtbUh9YlIjdn8eJFnPW9I5Y61merOT6JT2HEgdhrVADGoV
         2MzD6og4u5JXLyBGbW8k28hbuCXwEyRXIbNGVESOaZqRGraMW6pasnIKYprhlnxRtQVA
         SrdXchFaqBvhd2UGLw22WUsjdkQjDZIkSch9EUbBM/XUUlE94D59HTSMhUhpP0CH5zOF
         b5NQ/TgblMYwf71Rd9EOzDlzOq8kg7pmVcvKgdxGMC+DEbhlMzes9yeKVkqFcyI8fxo/
         j2wtClScPDc5wlR4CpAo5VfV6JHKsxTlcOUJmSufWILpy4P8SbCVOZCU3R1ChHPCzfh1
         XsKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RouIvOym;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r194si1344991qke.494.2017.10.06.07.44.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 Oct 2017 07:44:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RouIvOym;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45325 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e0TrQ-0001LP-Ie
	for alex.bennee@linaro.org; Fri, 06 Oct 2017 10:44:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58593)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e0TqS-0000pj-4j
	for qemu-devel@nongnu.org; Fri, 06 Oct 2017 10:43:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e0TqQ-000503-RN
	for qemu-devel@nongnu.org; Fri, 06 Oct 2017 10:43:20 -0400
Received: from mail-wm0-x22f.google.com ([2a00:1450:400c:c09::22f]:55756)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e0TqQ-0004zO-I2
	for qemu-devel@nongnu.org; Fri, 06 Oct 2017 10:43:18 -0400
Received: by mail-wm0-x22f.google.com with SMTP id u138so8374196wmu.4
	for <qemu-devel@nongnu.org>; Fri, 06 Oct 2017 07:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=q3+R3GZ/0v8rGZWl5A1D0MTw4Lg2/OLeA8gNkZEJo58=;
	b=RouIvOymG5VQ04rJXe3HQBAouaJHW+eUr3i7Q9E94c9yVe7v40Iv76O7gSmGqTHlpl
	tey/WwZEGaxoK/pF1bXF0ie8J1FrXAiPjx9YoAWRE+7EMvPrUyRpAkRqhac/qJkQCsjC
	kRUhL0KcGtF2DMiw5zhOFCAiT7NiaN1QTz34Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=q3+R3GZ/0v8rGZWl5A1D0MTw4Lg2/OLeA8gNkZEJo58=;
	b=DVFSnCsDXrMQSUkV28xH6RXcPVu/Q0RMVGWr8JSP0vQp7tqk6HhUe6b9iSUl2dtpQR
	Djr2xn4Y+Dwmax5U+KZNIiG2gbMLOFkUiwyQbe3TAVx1kdvRNWTwdykrxZ8OXxORjdqO
	zUSBtCeuTXcidxAo5pMRkEmTTitcdDs2UbG2R1pz5U1Ygm4OijhBDy0AG6M4myxCIqxO
	AfQKVAQhKE1ewQo6VzSdgkwzlc9uWgpaRNFxwSWmTVXjVZr/Q4huxXlT34BCj8Jq/6kF
	UkCItLXsd0mKqIpm0xcP5IUBz9lTan3dHkgPWf7HFGo7EMdqWuKhGYBzTYws8eAebVlZ
	VCzw==
X-Gm-Message-State: AMCzsaXdcsuVGjyZ3hLc5DjbplbY7HLeS7HNSnug2CPcp4VEfNoUvuA6
	ptyheWqz+RV7kdFweNooIdKohVFpgW0yXMrLj4iR3Q==
X-Google-Smtp-Source: AOwi7QBkh9TXJY2TcLURbWab6qr+pNDM6YwV/chVpwkLoTFSOu0Yl5M/E+aLEt4eHzV/btinKFyaD3+6dHR4Nk7r9yY=
X-Received: by 10.28.113.196 with SMTP id d65mr1857865wmi.151.1507300997334;
	Fri, 06 Oct 2017 07:43:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.128.207 with HTTP; Fri, 6 Oct 2017 07:42:56 -0700 (PDT)
In-Reply-To: <20170918195100.17593-18-andrew.smirnov@gmail.com>
References: <20170918195100.17593-1-andrew.smirnov@gmail.com>
	<20170918195100.17593-18-andrew.smirnov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Oct 2017 15:42:56 +0100
Message-ID: <CAFEAcA-wjuFzQuxOGz2UbjL6qSO7H75WzKHPVrqhT40QMaLLog@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22f
Subject: Re: [Qemu-devel] [PATCH 17/17] Implement support for i.MX7 Sabre
 board
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5ketq1UFUisu

On 18 September 2017 at 20:51, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  hw/arm/Makefile.objs   |   2 +-
>  hw/arm/mcimx7d-sabre.c | 100 +++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 101 insertions(+), 1 deletion(-)
>  create mode 100644 hw/arm/mcimx7d-sabre.c
>
> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> index 33f6051ae3..fc4a963de8 100644
> --- a/hw/arm/Makefile.objs
> +++ b/hw/arm/Makefile.objs
> @@ -19,5 +19,5 @@ obj-$(CONFIG_FSL_IMX31) += fsl-imx31.o kzm.o
>  obj-$(CONFIG_FSL_IMX6) += fsl-imx6.o sabrelite.o
>  obj-$(CONFIG_ASPEED_SOC) += aspeed_soc.o aspeed.o
>  obj-$(CONFIG_MPS2) += mps2.o
> -obj-$(CONFIG_FSL_IMX7) += fsl-imx7.o
> +obj-$(CONFIG_FSL_IMX7) += fsl-imx7.o mcimx7d-sabre.o
>
> diff --git a/hw/arm/mcimx7d-sabre.c b/hw/arm/mcimx7d-sabre.c
> new file mode 100644
> index 0000000000..34e3933db8
> --- /dev/null
> +++ b/hw/arm/mcimx7d-sabre.c
> @@ -0,0 +1,100 @@
> +/*
> + * Copyright (c) 2017, Impinj, Inc.
> + *
> + * MCIMX7D_SABRE Board System emulation.
> + *
> + * Author: Andrey Smirnov <andrew.smirnov@gmail.com>
> + *
> + * This code is licensed under the GPL, version 2 or later.
> + * See the file `COPYING' in the top level directory.
> + *
> + * It (partially) emulates a mcimx7d_sabre board, with a Freescale
> + * i.MX7 SoC
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "qemu-common.h"
> +#include "hw/arm/fsl-imx7.h"
> +#include "hw/boards.h"
> +#include "sysemu/sysemu.h"
> +#include "sysemu/device_tree.h"
> +#include "qemu/error-report.h"
> +#include "sysemu/qtest.h"
> +#include "net/net.h"
> +
> +typedef struct {
> +    FslIMX7State soc;
> +    MemoryRegion ram;
> +} MCIMX7Sabre;
> +
> +static void mcimx7d_add_psci_node(const struct arm_boot_info *boot_info, void *fdt)
> +{
> +    const char comp[] = "arm,psci-0.2\0arm,psci";
> +
> +    qemu_fdt_add_subnode(fdt, "/psci");
> +    qemu_fdt_setprop(fdt, "/psci", "compatible", comp, sizeof(comp));
> +    qemu_fdt_setprop_string(fdt, "/psci", "method", "smc");
> +}

You shouldn't need this -- we should just be able to work with whatever
the real hardware's device tree is. ("virt" is a special case because
we create our own device tree there.)

> +
> +static void mcimx7d_sabre_init(MachineState *machine)
> +{
> +    static struct arm_boot_info boot_info;
> +    MCIMX7Sabre *s = g_new0(MCIMX7Sabre, 1);
> +    Object *soc;
> +    int i;
> +
> +    if (machine->ram_size > FSL_IMX7_MMDC_SIZE) {
> +        error_report("RAM size " RAM_ADDR_FMT " above max supported (%08x)",
> +                     machine->ram_size, FSL_IMX7_MMDC_SIZE);
> +        exit(1);
> +    }
> +
> +    boot_info = (struct arm_boot_info) {
> +        .loader_start = FSL_IMX7_MMDC_ADDR,
> +        .board_id = -1,
> +        .ram_size = machine->ram_size,
> +        .kernel_filename = machine->kernel_filename,
> +        .kernel_cmdline = machine->kernel_cmdline,
> +        .initrd_filename = machine->initrd_filename,
> +        .nb_cpus = smp_cpus,
> +        .modify_dtb = mcimx7d_add_psci_node,
> +    };
> +
> +    object_initialize(&s->soc, sizeof(s->soc), TYPE_FSL_IMX7);
> +    soc = OBJECT(&s->soc);
> +    object_property_add_child(OBJECT(machine), "soc", soc, &error_fatal);
> +    object_property_set_bool(soc, true, "realized", &error_fatal);
> +
> +    memory_region_allocate_system_memory(&s->ram, NULL, "mcimx7d-sabre.ram",
> +                                         machine->ram_size);
> +    memory_region_add_subregion(get_system_memory(),
> +                                FSL_IMX7_MMDC_ADDR, &s->ram);
> +
> +    for (i = 0; i < FSL_IMX7_NUM_USDHCS; i++) {
> +        BusState *bus;
> +        DeviceState *carddev;
> +        DriveInfo *di;
> +        BlockBackend *blk;
> +
> +        di = drive_get_next(IF_SD);
> +        blk = di ? blk_by_legacy_dinfo(di) : NULL;
> +        bus = qdev_get_child_bus(DEVICE(&s->soc.usdhc[i]), "sd-bus");
> +        carddev = qdev_create(bus, TYPE_SD_CARD);
> +        qdev_prop_set_drive(carddev, "drive", blk, &error_fatal);
> +        object_property_set_bool(OBJECT(carddev), true, "realized", &error_fatal);
> +    }
> +
> +    if (!qtest_enabled()) {
> +        arm_load_kernel(&s->soc.cpu[0], &boot_info);
> +    }
> +}
> +
> +static void mcimx7d_sabre_machine_init(MachineClass *mc)
> +{
> +    mc->desc = "Freescale i.MX7 DUAL SABRE (Cortex A7)";
> +    mc->init = mcimx7d_sabre_init;
> +    mc->max_cpus = FSL_IMX7_NUM_CPUS;
> +    mc->ignore_memory_transaction_failures = true;

Please don't set this flag on new board models -- it is only
for legacy existing board models (where we don't know what
running guest code might be broken by turning bad accesses
into guest aborts. For a new board model, you should leave
the flag unset and instead stub out any devices that you
need to using create_unimplemented_device() so that your
guest code boots.

thanks
-- PMM
