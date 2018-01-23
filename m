Received: by 10.28.71.27 with SMTP id u27csp3919829wma;
        Tue, 23 Jan 2018 03:14:21 -0800 (PST)
X-Google-Smtp-Source: AH8x224hgg0cD/ZDsT73A9+SpHnWQwjkY7yvRDN4KuwjPqsTzXWY+NDKTYKJ2GxA9ouiybCh0CyI
X-Received: by 10.37.129.80 with SMTP id j16mr2054618ybm.9.1516706060994;
        Tue, 23 Jan 2018 03:14:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516706060; cv=none;
        d=google.com; s=arc-20160816;
        b=r5JoZBifuAvuwSLSHDp8uwkbqS4b2XyXlHiCQKv21wwKqqHuEr+/uq3EO6GpQI8Lfo
         9VjPBF4N9in9oqxCLztpnATa5rjMXvH0Of4JVcGEClQhUHi5m8HEJsOVE9onkwiAZpFm
         e6m9a/g9jPCF7vt1PNkKJUKNcNebI7oTySKXYA70tX00Ci3PmSslrpMM2a3JJ4eYtFZi
         7Gw/gpDc5hbMv5M/hZPEp/kjQbHIycf/MtvX9X92awVo4P5KBwccHSUZsro5K6GyI8+0
         nCj/+pa189fwxMwYr/BfQ9ypknD45f4a3N02/gQ63TBdnoss+8xzAcp/mGq0PVXBLWmd
         Tkyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=ttXgO0DxI80oXz2b2ZK7FpgGYQkEaRLfOFdDKPS/0JA=;
        b=05r40wV9hv6PUNYAgDV7maSkPAMyrigZtHgSgiAuqKcUueQDt2i4XM0XLDlQUvSz4m
         f+y4GTupZuCxJA5zVrsnahZoC1FWLNqR3IhDgKxiDBuwuy1lh11uUCgeier85gWHgo1Y
         CYwD/SgSFrV+ikiiMjkTKgmmfSDxigZOhPOTPEL5yNbkicZcBgOHIvWAI9FDWt72q6iL
         pzEXLcH2zn6rpwPPmiy1NdSe8LIBcU4eJVh/EaKB/gFubDETGLEw1Q4rIicGFiNLTbGZ
         xeSt8kwwpeovFrzk6OPRjlfLbACejR3zvpuCRfSGHSIhcsg+b01TRdaHJnr4je+NVA6B
         xGzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Kmmauo9R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i132si4037761ywe.557.2018.01.23.03.14.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 03:14:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Kmmauo9R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52240 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edwWy-0003fu-Df
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 06:14:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47016)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bztemail@gmail.com>) id 1edwVw-00032G-LG
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 06:13:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bztemail@gmail.com>) id 1edwVt-0004ST-0Y
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 06:13:16 -0500
Received: from mail-pf0-x232.google.com ([2607:f8b0:400e:c00::232]:44672)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bztemail@gmail.com>)
	id 1edwVs-0004SA-K1; Tue, 23 Jan 2018 06:13:12 -0500
Received: by mail-pf0-x232.google.com with SMTP id m26so50917pfj.11;
	Tue, 23 Jan 2018 03:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ttXgO0DxI80oXz2b2ZK7FpgGYQkEaRLfOFdDKPS/0JA=;
	b=Kmmauo9Rarav5MO6RcsCCpASTRPfkPpAY3DnNRbbz4fIx+DH/aoNqlzrEmpFa571Xd
	D1OJToi3vZCGh7nEX0W8NBgc16oGBkBSFIeOGK9N+wHvaQUc+GmsE+4L7Fgj7ed3y3pb
	oVVT4FuKeH6uX/l0se6HQHc96UmrJKxeqIhQTrg31PXNvSOOsj93sYo3mo9mz+9DulYF
	aZbNRpLTTYdAC0ylZ8EaSVdhe/9Hd1oSSritVPXEzd++bG23dmSo+MBwyrf2fLX21ZZ8
	cimobN3dLZG91MJ9Of45VCuh9UFMmUW3Br5QRNSgLIMde8pmOKlMhdGWNib1wlNRHmGm
	rxIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ttXgO0DxI80oXz2b2ZK7FpgGYQkEaRLfOFdDKPS/0JA=;
	b=fRCewWMIl5seLJMOE8tYaH+5PkjZSIFb5tyXZeilYTsWB3Du9Bu78mzf/JMUWiEcEJ
	k1+fKIpFowQDzPLGoMzdF8rUvajyPTs5ACjg6XfiAAZ9oDaTw/nlvAfz/hRfLoHyjdJQ
	wSepszRPsy6LbovrwMBp30YGZpXHjihFD3aDZnBSNLtZwKBAWLGG6WxbnxvoENsOLjD/
	R7Bw2ZlL2okJymdTRRrEUEVSR3QygNSE7ku/7qio5cSd7oBiy25rsTBsasAEsJtHqGFY
	ep/dBAT4DzUdyduGplP4jUt0w4rrS0ab12bc9hSw8Rq5SOBV+8hCr1V615Jk2G1V4u0s
	OpIQ==
X-Gm-Message-State: AKwxytcIMRH4TVyQGQmUlNAXAE0lcs5zcvLhkj9zBp3JSfkeL564ZJET
	LHrKye6NfI3S2+q2s7q4tNy2maGLVDEBz8LvPL0=
X-Received: by 10.99.94.193 with SMTP id s184mr8977305pgb.325.1516705991144;
	Tue, 23 Jan 2018 03:13:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.163.101 with HTTP; Tue, 23 Jan 2018 03:13:10 -0800 (PST)
In-Reply-To: <alpine.BSF.2.21.1801221224400.67089@zero.eik.bme.hu>
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
	<alpine.BSF.2.21.1801221224400.67089@zero.eik.bme.hu>
From: bzt bzt <bztemail@gmail.com>
Date: Tue, 23 Jan 2018 12:13:10 +0100
Message-ID: <CADYoBw3qjq_CJpp3dQvpHvAgfx-FjhPvPgZ4xTpSBt4LEGiiOw@mail.gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: multipart/alternative; boundary="94eb2c0c78e8d4ba3e05636fa138"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::232
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
X-TUID: jYYXqwPOk8R6

--94eb2c0c78e8d4ba3e05636fa138
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 22, 2018 at 12:41 PM, BALATON Zoltan <balaton@eik.bme.hu> wrote:

> Hello,
>
> On Thu, 18 Jan 2018, bzt bzt wrote:
>
>> Since you still haven't merged Alistair's patch, I decided to include it
>> in
>> my own.
>>
>
> Which patch exactly are you referring to?


The one I linked earlier, which also added CPU model to the mc class.


> Please be patient and don't get upset.


I'm not in-patent and I'm not upset. I can emulate raspi3, and I'm very
happy with it! Other users may be upset about you (plural) because they
can't use binary distributions and have to compile qemu from my source if
they want to have raspi3 support.


> Merging a patch can take some time, especially if code freeze and holiday
> season are in the middle and some backlog is accumulated. I suggest to
> follow instructions described here:
>
> https://wiki.qemu.org/Contribute/SubmitAPatch
>
> and send this version as a new message with proper format and commit
> message so it can be easily found and tested by relevant people and don't
> give up if they are busy and can't reply immediately. Just politely remind
> them after a week or two as suggested on the above wiki page.
>

There's a huge misunderstanding here. I have a working qemu for about half
a year now, and I don't need it merged. It's not my goal to submit a patch
to qemu in any way, I just did that because I had modified an Open Source
software and wanted to share it with the community. If you don't merge my
patch, I don't care. Other users will.


>
> Rationale for the above: Replying to an older thread may not show up at
> the end if someone uses threaded view but gets burried in some old thread
> so new patches should be new top level threads, only replies to the same
> patch or series should be sent as replies. Also your patch has been mangled
> by the email client and some lines are broken. This is a problem because it
> cannot be tested by using git am so it's more difficult to check. Please
> make sure you send it unflowed so the patch is not changed by the client
> (or use git send-email).
>

Again, if you want to provide raspi3 support (as more and more users
require it), use my patch or my git repo. I don't have to or want to do
anything more about it.


> All in all, I think your work is interesting and the lack of reply only
> means that people who could review and merge it were too busy not lack of
> interest so keep up improving the patch and don't give up.
>

I won't improve my patch any further, 'cos it's working perfectly for me.
Don't try to fix what's not broken!

Regards,
bzt


> Regards,
> BALATON Zoltan
>
>
> I've shrinked the number of modified files to two, that's the bare minimum
>> to support "-M raspi3" switch. Bcm2836.c modified minimally, the rest is
>> in
>> raspi.c. I've renamed raspi2_init() to raspi_init() 'cos now it
>> initializes
>> raspi3 as well, no additional function.
>>
>> diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
>> index 8c43291112..5119e00051 100644
>> --- a/hw/arm/bcm2836.c
>> +++ b/hw/arm/bcm2836.c
>> @@ -15,6 +15,7 @@
>> #include "hw/arm/bcm2836.h"
>> #include "hw/arm/raspi_platform.h"
>> #include "hw/sysbus.h"
>> +#include "hw/boards.h"
>> #include "exec/address-spaces.h"
>>
>> /* Peripheral base address seen by the CPU */
>> @@ -30,7 +31,7 @@ static void bcm2836_init(Object *obj)
>>
>>     for (n = 0; n < BCM2836_NCPUS; n++) {
>>         object_initialize(&s->cpus[n], sizeof(s->cpus[n]),
>> -                          "cortex-a15-" TYPE_ARM_CPU);
>> +                          current_machine->cpu_type);
>>         object_property_add_child(obj, "cpu[*]", OBJECT(&s->cpus[n]),
>>                                   &error_abort);
>>     }
>> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
>> index cd5fa8c3dc..24a9243440 100644
>> --- a/hw/arm/raspi.c
>> +++ b/hw/arm/raspi.c
>> @@ -5,6 +5,8 @@
>>  * Rasperry Pi 2 emulation Copyright (c) 2015, Microsoft
>>  * Written by Andrew Baumann
>>  *
>> + * Raspberry Pi 3 emulation Copyright (c) 2018 by bzt
>> + *
>>  * This code is licensed under the GNU GPLv2 and later.
>>  */
>>
>> @@ -22,10 +24,11 @@
>> #define SMPBOOT_ADDR    0x300 /* this should leave enough space for ATAGS
>> */
>> #define MVBAR_ADDR      0x400 /* secure vectors */
>> #define BOARDSETUP_ADDR (MVBAR_ADDR + 0x20) /* board setup code */
>> -#define FIRMWARE_ADDR   0x8000 /* Pi loads kernel.img here by default */
>> +#define FIRMWARE_ADDR_2    0x8000 /* Pi 2 loads kernel.img here by
>> default
>> */
>> +#define FIRMWARE_ADDR_3   0x80000 /* Pi 3 loads kernel8.img here by
>> default */
>>
>> /* Table of Linux board IDs for different Pi versions */
>> -static const int raspi_boardid[] = {[1] = 0xc42, [2] = 0xc43};
>> +static const int raspi_boardid[] = {[1] = 0xc42, [2] = 0xc43, [3] =
>> 0xc44};
>>
>> typedef struct RasPiState {
>>     BCM2836State soc;
>> @@ -83,8 +86,8 @@ static void setup_boot(MachineState *machine, int
>> version, size_t ram_size)
>>     binfo.secure_board_setup = true;
>>     binfo.secure_boot = true;
>>
>> -    /* Pi2 requires SMP setup */
>> -    if (version == 2) {
>> +    /* Pi2 and Pi3 requires SMP setup */
>> +    if (version >= 2) {
>>         binfo.smp_loader_start = SMPBOOT_ADDR;
>>         binfo.write_secondary_boot = write_smpboot;
>>         binfo.secondary_cpu_reset_hook = reset_secondary;
>> @@ -94,15 +97,15 @@ static void setup_boot(MachineState *machine, int
>> version, size_t ram_size)
>>      * the normal Linux boot process
>>      */
>>     if (machine->firmware) {
>> +        binfo.entry = version==3? FIRMWARE_ADDR_3 : FIRMWARE_ADDR_2;
>>         /* load the firmware image (typically kernel.img) */
>> -        r = load_image_targphys(machine->firmware, FIRMWARE_ADDR,
>> -                                ram_size - FIRMWARE_ADDR);
>> +        r = load_image_targphys(machine->firmware, binfo.entry,
>> +                                ram_size - binfo.entry);
>>         if (r < 0) {
>>             error_report("Failed to load firmware from %s",
>> machine->firmware);
>>             exit(1);
>>         }
>>
>> -        binfo.entry = FIRMWARE_ADDR;
>>         binfo.firmware_loaded = true;
>>     } else {
>>         binfo.kernel_filename = machine->kernel_filename;
>> @@ -113,7 +116,7 @@ static void setup_boot(MachineState *machine, int
>> version, size_t ram_size)
>>     arm_load_kernel(ARM_CPU(first_cpu), &binfo);
>> }
>>
>> -static void raspi2_init(MachineState *machine)
>> +static void raspi_init(MachineState *machine)
>> {
>>     RasPiState *s = g_new0(RasPiState, 1);
>>     uint32_t vcram_size;
>> @@ -121,6 +124,7 @@ static void raspi2_init(MachineState *machine)
>>     BlockBackend *blk;
>>     BusState *bus;
>>     DeviceState *carddev;
>> +    int version = machine->cpu_type==ARM_CPU_TYPE_NAME("cortex-a15")? 2
>> :
>> 3;
>>
>>     object_initialize(&s->soc, sizeof(s->soc), TYPE_BCM2836);
>>     object_property_add_child(OBJECT(machine), "soc", OBJECT(&s->soc),
>> @@ -137,8 +141,8 @@ static void raspi2_init(MachineState *machine)
>>                                    &error_abort);
>>     object_property_set_int(OBJECT(&s->soc), smp_cpus, "enabled-cpus",
>>                             &error_abort);
>> -    object_property_set_int(OBJECT(&s->soc), 0xa21041, "board-rev",
>> -                            &error_abort);
>> +    object_property_set_int(OBJECT(&s->soc), version==3 ? 0xa02082 :
>> 0xa21041,
>> +                            "board-rev", &error_abort);
>>     object_property_set_bool(OBJECT(&s->soc), true, "realized",
>> &error_abort);
>>
>>     /* Create and plug in the SD cards */
>> @@ -155,21 +159,39 @@ static void raspi2_init(MachineState *machine)
>>
>>     vcram_size = object_property_get_uint(OBJECT(&s->soc), "vcram-size",
>>                                           &error_abort);
>> -    setup_boot(machine, 2, machine->ram_size - vcram_size);
>> +    setup_boot(machine, version, machine->ram_size - vcram_size);
>> }
>>
>> static void raspi2_machine_init(MachineClass *mc)
>> {
>>     mc->desc = "Raspberry Pi 2";
>> -    mc->init = raspi2_init;
>> +    mc->init = raspi_init;
>>     mc->block_default_type = IF_SD;
>>     mc->no_parallel = 1;
>>     mc->no_floppy = 1;
>>     mc->no_cdrom = 1;
>>     mc->max_cpus = BCM2836_NCPUS;
>>     mc->min_cpus = BCM2836_NCPUS;
>>     mc->default_cpus = BCM2836_NCPUS;
>> +    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
>>     mc->default_ram_size = 1024 * 1024 * 1024;
>>     mc->ignore_memory_transaction_failures = true;
>> };
>> DEFINE_MACHINE("raspi2", raspi2_machine_init)
>> +
>> +static void raspi3_machine_init(MachineClass *mc)
>> +{
>> +    mc->desc = "Raspberry Pi 3";
>> +    mc->init = raspi_init;
>> +    mc->block_default_type = IF_SD;
>> +    mc->no_parallel = 1;
>> +    mc->no_floppy = 1;
>> +    mc->no_cdrom = 1;
>> +    mc->max_cpus = BCM2836_NCPUS;
>> +    mc->min_cpus = BCM2836_NCPUS;
>> +    mc->default_cpus = BCM2836_NCPUS;
>> +    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a53");
>> +    mc->default_ram_size = 1024 * 1024 * 1024;
>> +    mc->ignore_memory_transaction_failures = true;
>> +};
>> +DEFINE_MACHINE("raspi3", raspi3_machine_init)
>>
>> Hope it's simple enough to be reviewed easily, and it uses CPU type
>> strings
>> as requested.
>>
>> Cheers,
>> bzt
>>
>>
>> On Wed, Nov 29, 2017 at 8:52 AM, bzt bzt <bztemail@gmail.com> wrote:
>>
>>
>>>
>>> On Tue, Nov 28, 2017 at 6:54 PM, Andrew Baumann <
>>> Andrew.Baumann@microsoft.com> wrote:
>>>
>>> From: bzt bzt [mailto:bztemail@gmail.com]
>>>>> Sent: Tuesday, 28 November 2017 03:27
>>>>>
>>>>
>>>> Yes, I agree. I've provided a parameterised version on Oct 24, which
>>>>>
>>>> does not
>>>>
>>>>> have a separate bcm2837 implementation. Is that patch ok?
>>>>>
>>>>
>>>> That patch was moving in the right direction, but I think there were two
>>>> problems with it. First, the right way to pass a parameter is via a
>>>> property field (as Peter explained). Second, IMO the parameter should be
>>>> the CPU model string to instantiate and not the Pi version number.
>>>>
>>>>
>>> Thanks!
>>>
>>>
>>>
>>>> Or should I wait
>>>>> for Alistair's patch (https://lists.gnu.org/archive
>>>>>
>>>> /html/qemu-devel/2017-
>>>>
>>>>> 10/msg04153.html)?
>>>>>
>>>>
>>>> Alistair's patch doesn't actually help you as far as I can see, since it
>>>> doesn't change what CPU bcm2836 instantiates. I think it just means
>>>> that if
>>>> the user specifies a different CPU type they get an error rather than
>>>> being
>>>> silently ignored.
>>>>
>>>>
>>> It does add the CPU model string, which can and should be used in bcm2836
>>> to decide which CPU to instatiate (regardless the method of passing that
>>> parameter). If I add yet another CPU model string, the two patch will be
>>> in
>>> conflict containing redundant information. Also I'm sure would raspi3 use
>>> different cpus, we should always instantiate the one the user specified.
>>> Although here is only one possible CPU model, still that seems to be the
>>> correct behavior. Don't get me wrong, I don't criticize, I just want to
>>> find the best solution. Setting the CPU model only once for each version
>>> seems right. I was thinking: if there's going to be a user specified CPU
>>> model string anyway, why not use that one?
>>>
>>> bzt
>>>
>>>
>>>
>>>> Andrew
>>>>
>>>>
>>>
>>>
>>
>>

--94eb2c0c78e8d4ba3e05636fa138
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Jan 22, 2018 at 12:41 PM, BALATON Zoltan <span dir=3D"ltr">&lt;=
<a href=3D"mailto:balaton@eik.bme.hu" target=3D"_blank">balaton@eik.bme.hu<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hello,<span class=
=3D""><br>
<br>
On Thu, 18 Jan 2018, bzt bzt wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Since you still haven&#39;t merged Alistair&#39;s patch, I decided to inclu=
de it in<br>
my own.<br>
</blockquote>
<br></span>
Which patch exactly are you referring to? </blockquote><div><br></div><div>=
The one I linked earlier, which also added CPU model to the mc class.<br>=
=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">Please be patient and don&#3=
9;t get upset. </blockquote><div><br></div><div>I&#39;m not in-patent and I=
&#39;m not upset. I can emulate raspi3, and I&#39;m very happy with it! Oth=
er users may be upset about you (plural) because they can&#39;t use binary =
distributions and have to compile qemu from my source if they want to have =
raspi3 support.<br>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Merging =
a patch can take some time, especially if code freeze and holiday season ar=
e in the middle and some backlog is accumulated. I suggest to follow instru=
ctions described here:<br>
<br>
<a href=3D"https://wiki.qemu.org/Contribute/SubmitAPatch" rel=3D"noreferrer=
" target=3D"_blank">https://wiki.qemu.org/Contribu<wbr>te/SubmitAPatch</a><=
br>
<br>
and send this version as a new message with proper format and commit messag=
e so it can be easily found and tested by relevant people and don&#39;t giv=
e up if they are busy and can&#39;t reply immediately. Just politely remind=
 them after a week or two as suggested on the above wiki page.<br></blockqu=
ote><div><br></div><div>There&#39;s a huge misunderstanding here. I have a =
working qemu for about half a year now, and I don&#39;t need it merged. It&=
#39;s not my goal to submit a patch to qemu in any way, I just did that bec=
ause I had modified an Open Source software and wanted to share it with the=
 community. If you don&#39;t merge my patch, I don&#39;t care. Other users =
will.<br>=C2=A0 <br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Rationale for the above: Replying to an older thread may not show up at the=
 end if someone uses threaded view but gets burried in some old thread so n=
ew patches should be new top level threads, only replies to the same patch =
or series should be sent as replies. Also your patch has been mangled by th=
e email client and some lines are broken. This is a problem because it cann=
ot be tested by using git am so it&#39;s more difficult to check. Please ma=
ke sure you send it unflowed so the patch is not changed by the client (or =
use git send-email).<br></blockquote><div><br></div><div>Again, if you want=
 to provide raspi3 support (as more and more users require it), use my patc=
h or my git repo. I don&#39;t have to or want to do anything more about it.=
<br><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">
<br>
All in all, I think your work is interesting and the lack of reply only mea=
ns that people who could review and merge it were too busy not lack of inte=
rest so keep up improving the patch and don&#39;t give up.<br></blockquote>=
<div><br></div><div>I won&#39;t improve my patch any further, &#39;cos it&#=
39;s working perfectly for me. Don&#39;t try to fix what&#39;s not broken!<=
br><br></div><div>Regards,<br></div><div>bzt<br><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<br>
Regards,<br>
BALATON Zoltan<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
I&#39;ve shrinked the number of modified files to two, that&#39;s the bare =
minimum<br>
to support &quot;-M raspi3&quot; switch. Bcm2836.c modified minimally, the =
rest is in<br>
raspi.c. I&#39;ve renamed raspi2_init() to raspi_init() &#39;cos now it ini=
tializes<br>
raspi3 as well, no additional function.<br>
<br>
diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c<br>
index 8c43291112..5119e00051 100644<br>
--- a/hw/arm/bcm2836.c<br>
+++ b/hw/arm/bcm2836.c<br>
@@ -15,6 +15,7 @@<br>
#include &quot;hw/arm/bcm2836.h&quot;<br>
#include &quot;hw/arm/raspi_platform.h&quot;<br>
#include &quot;hw/sysbus.h&quot;<br>
+#include &quot;hw/boards.h&quot;<br>
#include &quot;exec/address-spaces.h&quot;<br>
<br>
/* Peripheral base address seen by the CPU */<br>
@@ -30,7 +31,7 @@ static void bcm2836_init(Object *obj)<br>
<br>
=C2=A0 =C2=A0 for (n =3D 0; n &lt; BCM2836_NCPUS; n++) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_initialize(&amp;s-&gt;cpus[n], sizeof(s-=
&gt;cpus[n]),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;cortex-a15-&quot; TYPE_ARM_CPU);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 current_machine-&gt;cpu_type);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_property_add_child(obj, &quot;cpu[*]&quo=
t;, OBJECT(&amp;s-&gt;cpus[n]),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;error_abort);<br>
=C2=A0 =C2=A0 }<br>
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c<br>
index cd5fa8c3dc..24a9243440 100644<br>
--- a/hw/arm/raspi.c<br>
+++ b/hw/arm/raspi.c<br>
@@ -5,6 +5,8 @@<br>
=C2=A0* Rasperry Pi 2 emulation Copyright (c) 2015, Microsoft<br>
=C2=A0* Written by Andrew Baumann<br>
=C2=A0*<br>
+ * Raspberry Pi 3 emulation Copyright (c) 2018 by bzt<br>
+ *<br>
=C2=A0* This code is licensed under the GNU GPLv2 and later.<br>
=C2=A0*/<br>
<br>
@@ -22,10 +24,11 @@<br>
#define SMPBOOT_ADDR=C2=A0 =C2=A0 0x300 /* this should leave enough space f=
or ATAGS<br>
*/<br>
#define MVBAR_ADDR=C2=A0 =C2=A0 =C2=A0 0x400 /* secure vectors */<br>
#define BOARDSETUP_ADDR (MVBAR_ADDR + 0x20) /* board setup code */<br>
-#define FIRMWARE_ADDR=C2=A0 =C2=A00x8000 /* Pi loads kernel.img here by de=
fault */<br>
+#define FIRMWARE_ADDR_2=C2=A0 =C2=A0 0x8000 /* Pi 2 loads kernel.img here =
by default<br>
*/<br>
+#define FIRMWARE_ADDR_3=C2=A0 =C2=A00x80000 /* Pi 3 loads kernel8.img here=
 by<br>
default */<br>
<br>
/* Table of Linux board IDs for different Pi versions */<br>
-static const int raspi_boardid[] =3D {[1] =3D 0xc42, [2] =3D 0xc43};<br>
+static const int raspi_boardid[] =3D {[1] =3D 0xc42, [2] =3D 0xc43, [3] =
=3D 0xc44};<br>
<br>
typedef struct RasPiState {<br>
=C2=A0 =C2=A0 BCM2836State soc;<br>
@@ -83,8 +86,8 @@ static void setup_boot(MachineState *machine, int<br>
version, size_t ram_size)<br>
=C2=A0 =C2=A0 binfo.secure_board_setup =3D true;<br>
=C2=A0 =C2=A0 binfo.secure_boot =3D true;<br>
<br>
-=C2=A0 =C2=A0 /* Pi2 requires SMP setup */<br>
-=C2=A0 =C2=A0 if (version =3D=3D 2) {<br>
+=C2=A0 =C2=A0 /* Pi2 and Pi3 requires SMP setup */<br>
+=C2=A0 =C2=A0 if (version &gt;=3D 2) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 binfo.smp_loader_start =3D SMPBOOT_ADDR;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 binfo.write_secondary_boot =3D write_smpboot;<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 binfo.secondary_cpu_reset_hook =3D reset_second=
ary;<br>
@@ -94,15 +97,15 @@ static void setup_boot(MachineState *machine, int<br>
version, size_t ram_size)<br>
=C2=A0 =C2=A0 =C2=A0* the normal Linux boot process<br>
=C2=A0 =C2=A0 =C2=A0*/<br>
=C2=A0 =C2=A0 if (machine-&gt;firmware) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 binfo.entry =3D version=3D=3D3? FIRMWARE_ADDR_=
3 : FIRMWARE_ADDR_2;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* load the firmware image (typically kernel.im=
g) */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D load_image_targphys(machine-&gt;f<wbr>ir=
mware, FIRMWARE_ADDR,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ram_size - FIRMWARE_ADDR);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D load_image_targphys(machine-&gt;f<wbr>ir=
mware, binfo.entry,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ram_size - binfo.entry);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Failed to load=
 firmware from %s&quot;,<br>
machine-&gt;firmware);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(1);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 binfo.entry =3D FIRMWARE_ADDR;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 binfo.firmware_loaded =3D true;<br>
=C2=A0 =C2=A0 } else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 binfo.kernel_filename =3D machine-&gt;kernel_fi=
lename;<br>
@@ -113,7 +116,7 @@ static void setup_boot(MachineState *machine, int<br>
version, size_t ram_size)<br>
=C2=A0 =C2=A0 arm_load_kernel(ARM_CPU(first_<wbr>cpu), &amp;binfo);<br>
}<br>
<br>
-static void raspi2_init(MachineState *machine)<br>
+static void raspi_init(MachineState *machine)<br>
{<br>
=C2=A0 =C2=A0 RasPiState *s =3D g_new0(RasPiState, 1);<br>
=C2=A0 =C2=A0 uint32_t vcram_size;<br>
@@ -121,6 +124,7 @@ static void raspi2_init(MachineState *machine)<br>
=C2=A0 =C2=A0 BlockBackend *blk;<br>
=C2=A0 =C2=A0 BusState *bus;<br>
=C2=A0 =C2=A0 DeviceState *carddev;<br>
+=C2=A0 =C2=A0 int version =3D machine-&gt;cpu_type=3D=3DARM_CPU_TYP<wbr>E_=
NAME(&quot;cortex-a15&quot;)? 2 :<br>
3;<br>
<br>
=C2=A0 =C2=A0 object_initialize(&amp;s-&gt;soc, sizeof(s-&gt;soc), TYPE_BCM=
2836);<br>
=C2=A0 =C2=A0 object_property_add_child(OBJE<wbr>CT(machine), &quot;soc&quo=
t;, OBJECT(&amp;s-&gt;soc),<br>
@@ -137,8 +141,8 @@ static void raspi2_init(MachineState *machine)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;error_abort);<br>
=C2=A0 =C2=A0 object_property_set_int(OBJECT<wbr>(&amp;s-&gt;soc), smp_cpus=
, &quot;enabled-cpus&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &amp;error_abort);<br>
-=C2=A0 =C2=A0 object_property_set_int(OBJECT<wbr>(&amp;s-&gt;soc), 0xa2104=
1, &quot;board-rev&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &amp;error_abort);<br>
+=C2=A0 =C2=A0 object_property_set_int(OBJECT<wbr>(&amp;s-&gt;soc), version=
=3D=3D3 ? 0xa02082 :<br>
0xa21041,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;board-rev&quot;, &amp;error_abort);<br>
=C2=A0 =C2=A0 object_property_set_bool(OBJEC<wbr>T(&amp;s-&gt;soc), true, &=
quot;realized&quot;,<br>
&amp;error_abort);<br>
<br>
=C2=A0 =C2=A0 /* Create and plug in the SD cards */<br>
@@ -155,21 +159,39 @@ static void raspi2_init(MachineState *machine)<br>
<br>
=C2=A0 =C2=A0 vcram_size =3D object_property_get_uint(OBJEC<wbr>T(&amp;s-&g=
t;soc), &quot;vcram-size&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
amp;error_abort);<br>
-=C2=A0 =C2=A0 setup_boot(machine, 2, machine-&gt;ram_size - vcram_size);<b=
r>
+=C2=A0 =C2=A0 setup_boot(machine, version, machine-&gt;ram_size - vcram_si=
ze);<br>
}<br>
<br>
static void raspi2_machine_init(MachineCla<wbr>ss *mc)<br>
{<br>
=C2=A0 =C2=A0 mc-&gt;desc =3D &quot;Raspberry Pi 2&quot;;<br>
-=C2=A0 =C2=A0 mc-&gt;init =3D raspi2_init;<br>
+=C2=A0 =C2=A0 mc-&gt;init =3D raspi_init;<br>
=C2=A0 =C2=A0 mc-&gt;block_default_type =3D IF_SD;<br>
=C2=A0 =C2=A0 mc-&gt;no_parallel =3D 1;<br>
=C2=A0 =C2=A0 mc-&gt;no_floppy =3D 1;<br>
=C2=A0 =C2=A0 mc-&gt;no_cdrom =3D 1;<br>
=C2=A0 =C2=A0 mc-&gt;max_cpus =3D BCM2836_NCPUS;<br>
=C2=A0 =C2=A0 mc-&gt;min_cpus =3D BCM2836_NCPUS;<br>
=C2=A0 =C2=A0 mc-&gt;default_cpus =3D BCM2836_NCPUS;<br>
+=C2=A0 =C2=A0 mc-&gt;default_cpu_type =3D ARM_CPU_TYPE_NAME(&quot;cortex-a=
15&quot;<wbr>);<br>
=C2=A0 =C2=A0 mc-&gt;default_ram_size =3D 1024 * 1024 * 1024;<br>
=C2=A0 =C2=A0 mc-&gt;ignore_memory_transaction_<wbr>failures =3D true;<br>
};<br>
DEFINE_MACHINE(&quot;raspi2&quot;, raspi2_machine_init)<br>
+<br>
+static void raspi3_machine_init(MachineCla<wbr>ss *mc)<br>
+{<br>
+=C2=A0 =C2=A0 mc-&gt;desc =3D &quot;Raspberry Pi 3&quot;;<br>
+=C2=A0 =C2=A0 mc-&gt;init =3D raspi_init;<br>
+=C2=A0 =C2=A0 mc-&gt;block_default_type =3D IF_SD;<br>
+=C2=A0 =C2=A0 mc-&gt;no_parallel =3D 1;<br>
+=C2=A0 =C2=A0 mc-&gt;no_floppy =3D 1;<br>
+=C2=A0 =C2=A0 mc-&gt;no_cdrom =3D 1;<br>
+=C2=A0 =C2=A0 mc-&gt;max_cpus =3D BCM2836_NCPUS;<br>
+=C2=A0 =C2=A0 mc-&gt;min_cpus =3D BCM2836_NCPUS;<br>
+=C2=A0 =C2=A0 mc-&gt;default_cpus =3D BCM2836_NCPUS;<br>
+=C2=A0 =C2=A0 mc-&gt;default_cpu_type =3D ARM_CPU_TYPE_NAME(&quot;cortex-a=
53&quot;<wbr>);<br>
+=C2=A0 =C2=A0 mc-&gt;default_ram_size =3D 1024 * 1024 * 1024;<br>
+=C2=A0 =C2=A0 mc-&gt;ignore_memory_transaction_<wbr>failures =3D true;<br>
+};<br>
+DEFINE_MACHINE(&quot;raspi3&quot;, raspi3_machine_init)<br>
<br>
Hope it&#39;s simple enough to be reviewed easily, and it uses CPU type str=
ings<br>
as requested.<br>
<br>
Cheers,<br>
bzt<br>
<br>
<br>
On Wed, Nov 29, 2017 at 8:52 AM, bzt bzt &lt;<a href=3D"mailto:bztemail@gma=
il.com" target=3D"_blank">bztemail@gmail.com</a>&gt; wrote:<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
<br>
On Tue, Nov 28, 2017 at 6:54 PM, Andrew Baumann &lt;<br>
<a href=3D"mailto:Andrew.Baumann@microsoft.com" target=3D"_blank">Andrew.Ba=
umann@microsoft.com</a>&gt; wrote:<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
From: bzt bzt [mailto:<a href=3D"mailto:bztemail@gmail.com" target=3D"_blan=
k">bztemail@gmail.com</a>]<br>
Sent: Tuesday, 28 November 2017 03:27<br>
</blockquote>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Yes, I agree. I&#39;ve provided a parameterised version on Oct 24, which<br=
>
</blockquote>
does not<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
have a separate bcm2837 implementation. Is that patch ok?<br>
</blockquote>
<br>
That patch was moving in the right direction, but I think there were two<br=
>
problems with it. First, the right way to pass a parameter is via a<br>
property field (as Peter explained). Second, IMO the parameter should be<br=
>
the CPU model string to instantiate and not the Pi version number.<br>
<br>
</blockquote>
<br>
Thanks!<br>
<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Or should I wait<br>
for Alistair&#39;s patch (<a href=3D"https://lists.gnu.org/archive" rel=3D"=
noreferrer" target=3D"_blank">https://lists.gnu.org/archive</a><br>
</blockquote>
/html/qemu-devel/2017-<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
10/msg04153.html)?<br>
</blockquote>
<br>
Alistair&#39;s patch doesn&#39;t actually help you as far as I can see, sin=
ce it<br>
doesn&#39;t change what CPU bcm2836 instantiates. I think it just means tha=
t if<br>
the user specifies a different CPU type they get an error rather than being=
<br>
silently ignored.<br>
<br>
</blockquote>
<br>
It does add the CPU model string, which can and should be used in bcm2836<b=
r>
to decide which CPU to instatiate (regardless the method of passing that<br=
>
parameter). If I add yet another CPU model string, the two patch will be in=
<br>
conflict containing redundant information. Also I&#39;m sure would raspi3 u=
se<br>
different cpus, we should always instantiate the one the user specified.<br=
>
Although here is only one possible CPU model, still that seems to be the<br=
>
correct behavior. Don&#39;t get me wrong, I don&#39;t criticize, I just wan=
t to<br>
find the best solution. Setting the CPU model only once for each version<br=
>
seems right. I was thinking: if there&#39;s going to be a user specified CP=
U<br>
model string anyway, why not use that one?<br>
<br>
bzt<br>
<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
Andrew<br>
<br>
</blockquote>
<br>
<br>
</blockquote>
<br>
<br>
</blockquote>
</div></div></blockquote></div><br></div></div>

--94eb2c0c78e8d4ba3e05636fa138--
