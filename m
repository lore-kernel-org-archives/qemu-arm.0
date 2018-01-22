Received: by 10.28.71.27 with SMTP id u27csp2700031wma;
        Mon, 22 Jan 2018 03:41:57 -0800 (PST)
X-Google-Smtp-Source: AH8x224PHrqoArnuXwJI68IuAm/ddQTKXjQb2hQxJFpN5S6k5UBSPH9XINt+oWW/DCtpHonSmF1H
X-Received: by 10.37.133.3 with SMTP id w3mr7438814ybk.254.1516621317027;
        Mon, 22 Jan 2018 03:41:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516621317; cv=none;
        d=google.com; s=arc-20160816;
        b=Yh6bfTeXCejdI2qHqwNTlMAr6lZ0EAN3h90jjzgfjECDO2ru512QPmEPhO8bY6CcsD
         DuGAPHIKFx5fxB4VybJ2hRWIayUcHc7R8FP34upYUUJiIIAAPrnyewiWm5FmP28qQeMa
         f3wd12updss3+yADOvIKDUO0pbtOjX1QuAdsc3YopBTv5huaGNjhiFzIjLJCfAvVV8Qd
         I6DrvtZvgdk1kzmGe1kQ0uMTKb2iuQiTlDWbYN1wM5KcN6sS/LS05GgFgpdGqyqkxR9H
         E/2I30u6ZF+I4LPHVGpKkWskclpvN1tpHeaVq4SWovzqeq/ZdU0GJEyBEOaq4e0Cywf+
         YMAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :references:message-id:in-reply-to:to:from:date
         :arc-authentication-results;
        bh=ay5SwDQ7IevyNT777duqZF6kYcEBDNzxPB3A066QQQI=;
        b=oGz+uhIvptZzTADxXw11aqL1B5aEVLJQRjGeQ6Ma2GAS1XRom8nZscEtgG4jqAHLYd
         WiF0eAQ2QVAGjvQV6c8XqI6Qjl0Bte4keVePC8JQMliXcCIilKL9cp/LzNzgGVwDD+gn
         bRdMi4PjBAEBQO8XnwihYCsDIA6M3+DYaZ9r4vhYRKiD5DL1kaMAUXRVLrRkNaB6um8u
         OlW95tvef3E0xKPM3GevRUmx7qfDFaZIUSWB7Qv6Nqkyhh7zUtyvfkAFJEMy38Si1fFV
         HR3j+rq0DZClAPObY4d9vJ3sjt9A8W0RTqSgUWJRnVVs8XqN89S9y7XV5WdiOqpHkh0u
         Lxeg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j3si1907864ybm.737.2018.01.22.03.41.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Jan 2018 03:41:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37081 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edaU8-0003rm-EE
	for alex.bennee@linaro.org; Mon, 22 Jan 2018 06:41:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47832)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1edaTz-0003r9-Qz
	for qemu-arm@nongnu.org; Mon, 22 Jan 2018 06:41:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1edaTv-0002q8-Pd
	for qemu-arm@nongnu.org; Mon, 22 Jan 2018 06:41:47 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:63673)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
	id 1edaTv-0002pX-CJ; Mon, 22 Jan 2018 06:41:43 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
	by localhost (Postfix) with SMTP id 767007456D8;
	Mon, 22 Jan 2018 12:41:41 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id 252C87456D7; Mon, 22 Jan 2018 12:41:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zero.eik.bme.hu (Postfix) with ESMTP id 1DF9C7456D5;
	Mon, 22 Jan 2018 12:41:41 +0100 (CET)
Date: Mon, 22 Jan 2018 12:41:41 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: bzt bzt <bztemail@gmail.com>
In-Reply-To: <CADYoBw27wU3CsYPeP7ONFWt4aj+6tvzwU5roDSOKz8qq1n8GSg@mail.gmail.com>
Message-ID: <alpine.BSF.2.21.1801221224400.67089@zero.eik.bme.hu>
References: <CADYoBw2dogvU6-3vChG4js0BNdyTPG8eDvMSRoU50eTX_9DdEQ@mail.gmail.com>
	<MWHPR21MB01590CD596A992C93E01B5079E460@MWHPR21MB0159.namprd21.prod.outlook.com>
	<CADYoBw1ksGDo26-PC4eMnyqxZQoZkXNLDeGoWfcRHs-SfTCJkw@mail.gmail.com>
	<MWHPR21MB01591543E188B048145985709E470@MWHPR21MB0159.namprd21.prod.outlook.com>
	<CADYoBw0RjiW2as9jGtPg92E8XK3KR+gM9C5vjC7HHsBauFn4ug@mail.gmail.com>
	<CADYoBw19GifmUR=Rztkzzc-v3-zWR6frjiNb_wjzsevreAqPDQ@mail.gmail.com>
	<CAFEAcA9_+wZJa7Ht6EHCCZYm+hrfdbjd9gUmVJPGgZ0yvbZOPA@mail.gmail.com>
	<MWHPR21MB0480DE1F826056BC8377EE289E250@MWHPR21MB0480.namprd21.prod.outlook.com>
	<CADYoBw31C0Z2vp0S0ZFBOC6A3146wxtZWvzJabACkGh44ZwC0w@mail.gmail.com>
	<MWHPR21MB0480A1F01D2CEF51E7CE21B09E3A0@MWHPR21MB0480.namprd21.prod.outlook.com>
	<CADYoBw1Ro5gxROvhCVXGv0=-Y8zXmGbKR3D6xOqhkb0zp__LkA@mail.gmail.com>
	<CADYoBw27wU3CsYPeP7ONFWt4aj+6tvzwU5roDSOKz8qq1n8GSg@mail.gmail.com>
User-Agent: Alpine 2.21 (BSF 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:738:2001:2001::2001
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] BCM2837 and machine raspi3
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NeMMfbIumkwV

Hello,

On Thu, 18 Jan 2018, bzt bzt wrote:
> Since you still haven't merged Alistair's patch, I decided to include it in
> my own.

Which patch exactly are you referring to? Please be patient and don't get 
upset. Merging a patch can take some time, especially if code freeze and 
holiday season are in the middle and some backlog is accumulated. I 
suggest to follow instructions described here:

https://wiki.qemu.org/Contribute/SubmitAPatch

and send this version as a new message with proper format and commit 
message so it can be easily found and tested by relevant people and don't 
give up if they are busy and can't reply immediately. Just politely remind 
them after a week or two as suggested on the above wiki page.

Rationale for the above: Replying to an older thread may not show up at 
the end if someone uses threaded view but gets burried in some old thread 
so new patches should be new top level threads, only replies to the same 
patch or series should be sent as replies. Also your patch has been 
mangled by the email client and some lines are broken. This is a problem 
because it cannot be tested by using git am so it's more difficult to 
check. Please make sure you send it unflowed so the patch is not changed 
by the client (or use git send-email).

All in all, I think your work is interesting and the lack of reply only 
means that people who could review and merge it were too busy not lack of 
interest so keep up improving the patch and don't give up.

Regards,
BALATON Zoltan

> I've shrinked the number of modified files to two, that's the bare minimum
> to support "-M raspi3" switch. Bcm2836.c modified minimally, the rest is in
> raspi.c. I've renamed raspi2_init() to raspi_init() 'cos now it initializes
> raspi3 as well, no additional function.
>
> diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
> index 8c43291112..5119e00051 100644
> --- a/hw/arm/bcm2836.c
> +++ b/hw/arm/bcm2836.c
> @@ -15,6 +15,7 @@
> #include "hw/arm/bcm2836.h"
> #include "hw/arm/raspi_platform.h"
> #include "hw/sysbus.h"
> +#include "hw/boards.h"
> #include "exec/address-spaces.h"
>
> /* Peripheral base address seen by the CPU */
> @@ -30,7 +31,7 @@ static void bcm2836_init(Object *obj)
>
>     for (n = 0; n < BCM2836_NCPUS; n++) {
>         object_initialize(&s->cpus[n], sizeof(s->cpus[n]),
> -                          "cortex-a15-" TYPE_ARM_CPU);
> +                          current_machine->cpu_type);
>         object_property_add_child(obj, "cpu[*]", OBJECT(&s->cpus[n]),
>                                   &error_abort);
>     }
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index cd5fa8c3dc..24a9243440 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -5,6 +5,8 @@
>  * Rasperry Pi 2 emulation Copyright (c) 2015, Microsoft
>  * Written by Andrew Baumann
>  *
> + * Raspberry Pi 3 emulation Copyright (c) 2018 by bzt
> + *
>  * This code is licensed under the GNU GPLv2 and later.
>  */
>
> @@ -22,10 +24,11 @@
> #define SMPBOOT_ADDR    0x300 /* this should leave enough space for ATAGS
> */
> #define MVBAR_ADDR      0x400 /* secure vectors */
> #define BOARDSETUP_ADDR (MVBAR_ADDR + 0x20) /* board setup code */
> -#define FIRMWARE_ADDR   0x8000 /* Pi loads kernel.img here by default */
> +#define FIRMWARE_ADDR_2    0x8000 /* Pi 2 loads kernel.img here by default
> */
> +#define FIRMWARE_ADDR_3   0x80000 /* Pi 3 loads kernel8.img here by
> default */
>
> /* Table of Linux board IDs for different Pi versions */
> -static const int raspi_boardid[] = {[1] = 0xc42, [2] = 0xc43};
> +static const int raspi_boardid[] = {[1] = 0xc42, [2] = 0xc43, [3] = 0xc44};
>
> typedef struct RasPiState {
>     BCM2836State soc;
> @@ -83,8 +86,8 @@ static void setup_boot(MachineState *machine, int
> version, size_t ram_size)
>     binfo.secure_board_setup = true;
>     binfo.secure_boot = true;
>
> -    /* Pi2 requires SMP setup */
> -    if (version == 2) {
> +    /* Pi2 and Pi3 requires SMP setup */
> +    if (version >= 2) {
>         binfo.smp_loader_start = SMPBOOT_ADDR;
>         binfo.write_secondary_boot = write_smpboot;
>         binfo.secondary_cpu_reset_hook = reset_secondary;
> @@ -94,15 +97,15 @@ static void setup_boot(MachineState *machine, int
> version, size_t ram_size)
>      * the normal Linux boot process
>      */
>     if (machine->firmware) {
> +        binfo.entry = version==3? FIRMWARE_ADDR_3 : FIRMWARE_ADDR_2;
>         /* load the firmware image (typically kernel.img) */
> -        r = load_image_targphys(machine->firmware, FIRMWARE_ADDR,
> -                                ram_size - FIRMWARE_ADDR);
> +        r = load_image_targphys(machine->firmware, binfo.entry,
> +                                ram_size - binfo.entry);
>         if (r < 0) {
>             error_report("Failed to load firmware from %s",
> machine->firmware);
>             exit(1);
>         }
>
> -        binfo.entry = FIRMWARE_ADDR;
>         binfo.firmware_loaded = true;
>     } else {
>         binfo.kernel_filename = machine->kernel_filename;
> @@ -113,7 +116,7 @@ static void setup_boot(MachineState *machine, int
> version, size_t ram_size)
>     arm_load_kernel(ARM_CPU(first_cpu), &binfo);
> }
>
> -static void raspi2_init(MachineState *machine)
> +static void raspi_init(MachineState *machine)
> {
>     RasPiState *s = g_new0(RasPiState, 1);
>     uint32_t vcram_size;
> @@ -121,6 +124,7 @@ static void raspi2_init(MachineState *machine)
>     BlockBackend *blk;
>     BusState *bus;
>     DeviceState *carddev;
> +    int version = machine->cpu_type==ARM_CPU_TYPE_NAME("cortex-a15")? 2 :
> 3;
>
>     object_initialize(&s->soc, sizeof(s->soc), TYPE_BCM2836);
>     object_property_add_child(OBJECT(machine), "soc", OBJECT(&s->soc),
> @@ -137,8 +141,8 @@ static void raspi2_init(MachineState *machine)
>                                    &error_abort);
>     object_property_set_int(OBJECT(&s->soc), smp_cpus, "enabled-cpus",
>                             &error_abort);
> -    object_property_set_int(OBJECT(&s->soc), 0xa21041, "board-rev",
> -                            &error_abort);
> +    object_property_set_int(OBJECT(&s->soc), version==3 ? 0xa02082 :
> 0xa21041,
> +                            "board-rev", &error_abort);
>     object_property_set_bool(OBJECT(&s->soc), true, "realized",
> &error_abort);
>
>     /* Create and plug in the SD cards */
> @@ -155,21 +159,39 @@ static void raspi2_init(MachineState *machine)
>
>     vcram_size = object_property_get_uint(OBJECT(&s->soc), "vcram-size",
>                                           &error_abort);
> -    setup_boot(machine, 2, machine->ram_size - vcram_size);
> +    setup_boot(machine, version, machine->ram_size - vcram_size);
> }
>
> static void raspi2_machine_init(MachineClass *mc)
> {
>     mc->desc = "Raspberry Pi 2";
> -    mc->init = raspi2_init;
> +    mc->init = raspi_init;
>     mc->block_default_type = IF_SD;
>     mc->no_parallel = 1;
>     mc->no_floppy = 1;
>     mc->no_cdrom = 1;
>     mc->max_cpus = BCM2836_NCPUS;
>     mc->min_cpus = BCM2836_NCPUS;
>     mc->default_cpus = BCM2836_NCPUS;
> +    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
>     mc->default_ram_size = 1024 * 1024 * 1024;
>     mc->ignore_memory_transaction_failures = true;
> };
> DEFINE_MACHINE("raspi2", raspi2_machine_init)
> +
> +static void raspi3_machine_init(MachineClass *mc)
> +{
> +    mc->desc = "Raspberry Pi 3";
> +    mc->init = raspi_init;
> +    mc->block_default_type = IF_SD;
> +    mc->no_parallel = 1;
> +    mc->no_floppy = 1;
> +    mc->no_cdrom = 1;
> +    mc->max_cpus = BCM2836_NCPUS;
> +    mc->min_cpus = BCM2836_NCPUS;
> +    mc->default_cpus = BCM2836_NCPUS;
> +    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a53");
> +    mc->default_ram_size = 1024 * 1024 * 1024;
> +    mc->ignore_memory_transaction_failures = true;
> +};
> +DEFINE_MACHINE("raspi3", raspi3_machine_init)
>
> Hope it's simple enough to be reviewed easily, and it uses CPU type strings
> as requested.
>
> Cheers,
> bzt
>
>
> On Wed, Nov 29, 2017 at 8:52 AM, bzt bzt <bztemail@gmail.com> wrote:
>
>>
>>
>> On Tue, Nov 28, 2017 at 6:54 PM, Andrew Baumann <
>> Andrew.Baumann@microsoft.com> wrote:
>>
>>>> From: bzt bzt [mailto:bztemail@gmail.com]
>>>> Sent: Tuesday, 28 November 2017 03:27
>>>
>>>> Yes, I agree. I've provided a parameterised version on Oct 24, which
>>> does not
>>>> have a separate bcm2837 implementation. Is that patch ok?
>>>
>>> That patch was moving in the right direction, but I think there were two
>>> problems with it. First, the right way to pass a parameter is via a
>>> property field (as Peter explained). Second, IMO the parameter should be
>>> the CPU model string to instantiate and not the Pi version number.
>>>
>>
>> Thanks!
>>
>>
>>>
>>>> Or should I wait
>>>> for Alistair's patch (https://lists.gnu.org/archive
>>> /html/qemu-devel/2017-
>>>> 10/msg04153.html)?
>>>
>>> Alistair's patch doesn't actually help you as far as I can see, since it
>>> doesn't change what CPU bcm2836 instantiates. I think it just means that if
>>> the user specifies a different CPU type they get an error rather than being
>>> silently ignored.
>>>
>>
>> It does add the CPU model string, which can and should be used in bcm2836
>> to decide which CPU to instatiate (regardless the method of passing that
>> parameter). If I add yet another CPU model string, the two patch will be in
>> conflict containing redundant information. Also I'm sure would raspi3 use
>> different cpus, we should always instantiate the one the user specified.
>> Although here is only one possible CPU model, still that seems to be the
>> correct behavior. Don't get me wrong, I don't criticize, I just want to
>> find the best solution. Setting the CPU model only once for each version
>> seems right. I was thinking: if there's going to be a user specified CPU
>> model string anyway, why not use that one?
>>
>> bzt
>>
>>
>>>
>>> Andrew
>>>
>>
>>
>
>
