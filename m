Received: by 10.223.197.9 with SMTP id q9csp2625960wrf;
        Mon, 9 Oct 2017 09:30:39 -0700 (PDT)
X-Received: by 10.55.78.72 with SMTP id c69mr5165672qkb.105.1507566639457;
        Mon, 09 Oct 2017 09:30:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507566639; cv=none;
        d=google.com; s=arc-20160816;
        b=XxpKbmq0ItYttO9sHIr/f5vOpHFfqYEELhJ0vvnU2QItw5Tmc+jLMuYqNyRXEpHtru
         MdfXzLlJac3rvp97H26aRA19SY2ZLRgiypruafXxz8ULZ1KVulZUIxfhctRHg3YYUE3o
         M+Fa79ZCEy9u2HRAgBze4maSf9zPzulSlq76/qcTGv5nF6P9sHkjVu2KVhAPjbiDkYNT
         ZVjYZ8G3EICjzIXUlk+/hJ2cH19dfmRQ9NZOxRJB0r4T9zySVuqcHlfFf3So1TAm/T1C
         edVgjsDd7W/g0zynW7W/otYrAAiOhEMVve03B6tM/WEjllCVIXQygI3Ja9bbeRh63p3V
         OkPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=blLa9bHfVLSO1FBf8kDEQncta3Fl6mSZ2mgZjOkGTT4=;
        b=dN7ujXGGT8+ZLwfCen/yydLjcbKYab/PPDJhzgB7Of/symbNzJJziirvNw1FBrTCoa
         aBB55PwTuhAv+Zx777sgduaS7ojoUX2jx+tiK9MQpSmF0nENaIWHbFHBVD3llqXrVqcx
         te8vl/uCm+xrfsRzlND2aW1GvyVIioYoMqEeZAhfjdqJRZgVxmiFwDcvi+BKe+CtaZvo
         1DHqFNG2MOYIO1fOak/KaCgVVjk6fq9mWqzDQR6OMmNo0sKpRZqwZlP56MBjtghYC1c4
         JZ3E9DKzGufx788rRryKOO1Fh4rbKIOwNb2gbxKuejFN5MZBAJJ/+rgZyr01o5tW2MvD
         lyRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OHfHb6Q/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s188si3598819qkb.145.2017.10.09.09.30.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Oct 2017 09:30:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OHfHb6Q/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58796 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1awx-0003TO-0V
	for alex.bennee@linaro.org; Mon, 09 Oct 2017 12:30:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33436)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e1awn-0003TD-9N
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 12:30:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e1awg-0006GL-VK
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 12:30:29 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:35718)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1e1awg-0006FQ-Lw; Mon, 09 Oct 2017 12:30:22 -0400
Received: by mail-qk0-x242.google.com with SMTP id w63so15119758qkd.2;
	Mon, 09 Oct 2017 09:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=blLa9bHfVLSO1FBf8kDEQncta3Fl6mSZ2mgZjOkGTT4=;
	b=OHfHb6Q/WA4pjpGx9YwOajcMAuQAMhiFz9E1Fg5YmuhkGEQedoQNwAvwJCQK2mi0Qz
	Tp6SwqJ4V29Wnt/3FQj4+RaLXHvNHlanOxOZHfI712P2FnSpX45Oycn5ztLoLCvpXi2+
	EMdGP65Udg1lQR92volZtbpATlOiHeVhW2OQXK8I6TShMiH1gyzDrgKBPvKtcDit9JYs
	lg8MCWYXPKAk/25fk4kUI9aPWB4uhU2r7jydSBjOHOxRQ1FLFQmfvtNT87kPHc49Qu5Z
	bzWFKfocqe4DLxrN8vjLrnkqDm7jCxyLSEUNa2XX1w2igvLOCBmRhGv137BUETJan+bS
	uNSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=blLa9bHfVLSO1FBf8kDEQncta3Fl6mSZ2mgZjOkGTT4=;
	b=J2E5tL/r/a6yMXJixEo1S81ghEhqb5qHIg30c1BzAOLD1mFk71KOdYuOzl7SNrcw/8
	uUl7jI+AN7pPq4fwYc1P90nrKcn9frF+I4V8WLSX9/p7UyVrwxUKXkk1GypfPyasbIvT
	3ZxuG9HX2wXgcGDpwxgQRpMtCHutsj1Md3ByjCsFbCG71NsOnciuxNbLV1uiw3x+YiQU
	2bckT44Q0/BDMR1yZ/qI64+BuuSstiNB+U27QPFZw2pqFOb29UIXbRDXPPGHjBBH4SD9
	2ha+WwLWHm+2Jn7W9ccALAoxKwPLvCV9wPXEWf/l9uO4xEmtiEBb++de4dLP2ITRA7fX
	FqGw==
X-Gm-Message-State: AMCzsaXjSbbIwx2SREcQC6hAZD2aL/wPKZNCPJY6NS4cdrTEap4GGz+u
	gG4CJwNkXfYI2ifEgOSJ9nQMoy1YHlh29ofS/SY=
X-Google-Smtp-Source: AOwi7QAl/FEa8w1wdWxpikRfog+8ulQ86mli5QbfjryTM+hod6imjZlng7jVVu4GfcrDvBEDI+/HWb+Fe7Z56cdq/2A=
X-Received: by 10.55.201.135 with SMTP id m7mr10458581qkl.97.1507566621826;
	Mon, 09 Oct 2017 09:30:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.165 with HTTP; Mon, 9 Oct 2017 09:30:21 -0700 (PDT)
In-Reply-To: <CAFEAcA-wjuFzQuxOGz2UbjL6qSO7H75WzKHPVrqhT40QMaLLog@mail.gmail.com>
References: <20170918195100.17593-1-andrew.smirnov@gmail.com>
	<20170918195100.17593-18-andrew.smirnov@gmail.com>
	<CAFEAcA-wjuFzQuxOGz2UbjL6qSO7H75WzKHPVrqhT40QMaLLog@mail.gmail.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Mon, 9 Oct 2017 09:30:21 -0700
Message-ID: <CAHQ1cqF5c=kq9USPUb9DdH9AePEVMxOV_MhAY6bHMV6H4Zm6FQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: Re: [Qemu-arm] [PATCH 17/17] Implement support for i.MX7 Sabre board
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3xSf+pf45aTr

On Fri, Oct 6, 2017 at 7:42 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 18 September 2017 at 20:51, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: qemu-devel@nongnu.org
>> Cc: qemu-arm@nongnu.org
>> Cc: yurovsky@gmail.com
>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>> ---
>>  hw/arm/Makefile.objs   |   2 +-
>>  hw/arm/mcimx7d-sabre.c | 100 +++++++++++++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 101 insertions(+), 1 deletion(-)
>>  create mode 100644 hw/arm/mcimx7d-sabre.c
>>
>> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
>> index 33f6051ae3..fc4a963de8 100644
>> --- a/hw/arm/Makefile.objs
>> +++ b/hw/arm/Makefile.objs
>> @@ -19,5 +19,5 @@ obj-$(CONFIG_FSL_IMX31) += fsl-imx31.o kzm.o
>>  obj-$(CONFIG_FSL_IMX6) += fsl-imx6.o sabrelite.o
>>  obj-$(CONFIG_ASPEED_SOC) += aspeed_soc.o aspeed.o
>>  obj-$(CONFIG_MPS2) += mps2.o
>> -obj-$(CONFIG_FSL_IMX7) += fsl-imx7.o
>> +obj-$(CONFIG_FSL_IMX7) += fsl-imx7.o mcimx7d-sabre.o
>>
>> diff --git a/hw/arm/mcimx7d-sabre.c b/hw/arm/mcimx7d-sabre.c
>> new file mode 100644
>> index 0000000000..34e3933db8
>> --- /dev/null
>> +++ b/hw/arm/mcimx7d-sabre.c
>> @@ -0,0 +1,100 @@
>> +/*
>> + * Copyright (c) 2017, Impinj, Inc.
>> + *
>> + * MCIMX7D_SABRE Board System emulation.
>> + *
>> + * Author: Andrey Smirnov <andrew.smirnov@gmail.com>
>> + *
>> + * This code is licensed under the GPL, version 2 or later.
>> + * See the file `COPYING' in the top level directory.
>> + *
>> + * It (partially) emulates a mcimx7d_sabre board, with a Freescale
>> + * i.MX7 SoC
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "qapi/error.h"
>> +#include "qemu-common.h"
>> +#include "hw/arm/fsl-imx7.h"
>> +#include "hw/boards.h"
>> +#include "sysemu/sysemu.h"
>> +#include "sysemu/device_tree.h"
>> +#include "qemu/error-report.h"
>> +#include "sysemu/qtest.h"
>> +#include "net/net.h"
>> +
>> +typedef struct {
>> +    FslIMX7State soc;
>> +    MemoryRegion ram;
>> +} MCIMX7Sabre;
>> +
>> +static void mcimx7d_add_psci_node(const struct arm_boot_info *boot_info, void *fdt)
>> +{
>> +    const char comp[] = "arm,psci-0.2\0arm,psci";
>> +
>> +    qemu_fdt_add_subnode(fdt, "/psci");
>> +    qemu_fdt_setprop(fdt, "/psci", "compatible", comp, sizeof(comp));
>> +    qemu_fdt_setprop_string(fdt, "/psci", "method", "smc");
>> +}
>
> You shouldn't need this -- we should just be able to work with whatever
> the real hardware's device tree is. ("virt" is a special case because
> we create our own device tree there.)
>

Upstream kernel for i.MX7 relies on PSCI to support SMP and this is a
kind of DT fixup that would normally be done by a PSCI-compatible
bootloader. I can remove this code, but it would effectively disable
SMP on vanilla DT/kernel combos.

>> +
>> +static void mcimx7d_sabre_init(MachineState *machine)
>> +{
>> +    static struct arm_boot_info boot_info;
>> +    MCIMX7Sabre *s = g_new0(MCIMX7Sabre, 1);
>> +    Object *soc;
>> +    int i;
>> +
>> +    if (machine->ram_size > FSL_IMX7_MMDC_SIZE) {
>> +        error_report("RAM size " RAM_ADDR_FMT " above max supported (%08x)",
>> +                     machine->ram_size, FSL_IMX7_MMDC_SIZE);
>> +        exit(1);
>> +    }
>> +
>> +    boot_info = (struct arm_boot_info) {
>> +        .loader_start = FSL_IMX7_MMDC_ADDR,
>> +        .board_id = -1,
>> +        .ram_size = machine->ram_size,
>> +        .kernel_filename = machine->kernel_filename,
>> +        .kernel_cmdline = machine->kernel_cmdline,
>> +        .initrd_filename = machine->initrd_filename,
>> +        .nb_cpus = smp_cpus,
>> +        .modify_dtb = mcimx7d_add_psci_node,
>> +    };
>> +
>> +    object_initialize(&s->soc, sizeof(s->soc), TYPE_FSL_IMX7);
>> +    soc = OBJECT(&s->soc);
>> +    object_property_add_child(OBJECT(machine), "soc", soc, &error_fatal);
>> +    object_property_set_bool(soc, true, "realized", &error_fatal);
>> +
>> +    memory_region_allocate_system_memory(&s->ram, NULL, "mcimx7d-sabre.ram",
>> +                                         machine->ram_size);
>> +    memory_region_add_subregion(get_system_memory(),
>> +                                FSL_IMX7_MMDC_ADDR, &s->ram);
>> +
>> +    for (i = 0; i < FSL_IMX7_NUM_USDHCS; i++) {
>> +        BusState *bus;
>> +        DeviceState *carddev;
>> +        DriveInfo *di;
>> +        BlockBackend *blk;
>> +
>> +        di = drive_get_next(IF_SD);
>> +        blk = di ? blk_by_legacy_dinfo(di) : NULL;
>> +        bus = qdev_get_child_bus(DEVICE(&s->soc.usdhc[i]), "sd-bus");
>> +        carddev = qdev_create(bus, TYPE_SD_CARD);
>> +        qdev_prop_set_drive(carddev, "drive", blk, &error_fatal);
>> +        object_property_set_bool(OBJECT(carddev), true, "realized", &error_fatal);
>> +    }
>> +
>> +    if (!qtest_enabled()) {
>> +        arm_load_kernel(&s->soc.cpu[0], &boot_info);
>> +    }
>> +}
>> +
>> +static void mcimx7d_sabre_machine_init(MachineClass *mc)
>> +{
>> +    mc->desc = "Freescale i.MX7 DUAL SABRE (Cortex A7)";
>> +    mc->init = mcimx7d_sabre_init;
>> +    mc->max_cpus = FSL_IMX7_NUM_CPUS;
>> +    mc->ignore_memory_transaction_failures = true;
>
> Please don't set this flag on new board models -- it is only
> for legacy existing board models (where we don't know what
> running guest code might be broken by turning bad accesses
> into guest aborts. For a new board model, you should leave
> the flag unset and instead stub out any devices that you
> need to using create_unimplemented_device() so that your
> guest code boots.

That flag didn't exist when I started porting this board and I only
discovered it a couple of hours before I prepared v1 of the patchset,
since I didn't want to submit the code that wouldn't work but didn't
have time to implements all of the missing blocks. I'll update v2, to
get rid of it.

Thanks,
Andrey Smirnov
