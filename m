Received: by 10.28.71.27 with SMTP id u27csp2729956wma;
        Mon, 22 Jan 2018 04:14:25 -0800 (PST)
X-Google-Smtp-Source: AH8x224yjkjJHJcVUGiDthBdBNllguJ1903Mi4ughIMspyT8VGkzaG1K6CGoGZybCLI3maTTHpgZ
X-Received: by 10.37.172.39 with SMTP id w39mr2244704ybi.164.1516623265133;
        Mon, 22 Jan 2018 04:14:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516623265; cv=none;
        d=google.com; s=arc-20160816;
        b=Njh2cepgn5sn7soi1n43R1cfsT2jwsCM/oDXmUQoGy0HvSB4MqxlXH47ioutNQY5km
         pG57+fZ5q+ACLJG+MABHluocNCqqWw9pzV3i79ClYg9JXR96tj7t8SR3GSCMb8N2JN/f
         gG3w5w7iwIqd0KxiN1vwTMVsZ4mXy+VLcs4sRG3TJJzVHfu9lxbboTx7yZ40/uyjekLK
         K1wW18atKGbocySPoJ9arujjFTOzA325v3TP1ugODQlSPqSK5KtrCZA1cq+DELSF/RkZ
         POF24z+HBN+IMjHDSwQG9CFz090xEF0p32ic+FKv1GFBjjD+qoHLoxKEPKi5e/z5Lw4d
         IuXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=55MRFLGwuIqb5myNEIJB2uzhPmQctXC8eE5Fwl8Q6qg=;
        b=ZBj7YZqTEdCBQsikPBy/7wiYXpY/1TL5IvXSWLqbJmZV8J3kwbH0Iracg4ay5eKtw7
         HoOfa5flnLC/Xw237/rC6Dej5j1PtKDe6lPutk9w/DuXqexYRO6iPJSWHNcX8Ermq6fQ
         Q8ZhSb/wvi7Pc+5jTR1t7b3TQG9DqTRpEaO91eUSXcxJlh52FAg1kVGb7vhzpJMCJdrI
         sY7oxkVE0pwEbJlAcFtRv1owXmCpff2RYxu5cGlt8O++MwNTWKrQKrqVFcLjhnxju3z1
         YRBLZouBUnPKKaOmEGxfej1ARnfL9eEC7tVRcr/P5vwrzC6g3ADKjrc1YfF8HdVvd5u+
         Vg5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BKf19bjD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h5si1879719ybm.210.2018.01.22.04.14.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Jan 2018 04:14:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BKf19bjD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38270 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edazY-0004AC-Gv
	for alex.bennee@linaro.org; Mon, 22 Jan 2018 07:14:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55389)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1edayO-0003HT-PA
	for qemu-arm@nongnu.org; Mon, 22 Jan 2018 07:13:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1edayM-0005XT-US
	for qemu-arm@nongnu.org; Mon, 22 Jan 2018 07:13:12 -0500
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:45600)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1edayM-0005X8-Ko
	for qemu-arm@nongnu.org; Mon, 22 Jan 2018 07:13:10 -0500
Received: by mail-ot0-x243.google.com with SMTP id r4so7238326oti.12
	for <qemu-arm@nongnu.org>; Mon, 22 Jan 2018 04:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=55MRFLGwuIqb5myNEIJB2uzhPmQctXC8eE5Fwl8Q6qg=;
	b=BKf19bjDXN7Xe0bG6ZDwvUQQgFdMFKW293xVM9itZ5aTIWwWiTH/zGYH8Ia/E3dC3K
	Z9F6qIiUBZP3b/fICJh+gkyt/9iIKt/Ip92bTmGV9pfH1QpIrJeOvNLB/B1YHEaBajMe
	WcOErZ2sJOKCn9EuBqjZE0k1Vd5Q0+tZ81q50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=55MRFLGwuIqb5myNEIJB2uzhPmQctXC8eE5Fwl8Q6qg=;
	b=shGI1X89KpqjAq4BsBVL2yww9eXxxZY0yFjfhVBqSVBb7Ozfo/gL4gxVMP/quLASm2
	2XSQrJjJgRK87YrE/R5K8Gc/3pTJagQuoBW1TdqSahJeqM7py3PjC1LQEMXvLmcjvFDK
	u+DAE45gfxnDExbq/m4E7Ee7Lp9ec/qXOiD7iayJZ2K9X6QrBRpEKBBLv1oxZHjOTdT5
	gI6DwVMGDBOrOObc/ruhLf4dFI+xqvdmIoKoe3Wt8M0WgNnAT6qRHVOcjO4selWAh5F7
	fMrCQ9gYGJOmIWujOf5ue8WpQmW51Rap5IBfC7L5r/wgnCMYAjAvt9J7sqKFCT5TRdNe
	pG9A==
X-Gm-Message-State: AKwxytcVczy9G3WKtOkDhLhlEyzzI6nT7+1TOvTv9rlNq2gLillgTrCG
	VtvqGlNrnGyiR2y0joAhsUeo0YrxAQdCFXcn0H9dvw==
X-Received: by 10.157.29.229 with SMTP id w34mr3731837otw.24.1516623189826;
	Mon, 22 Jan 2018 04:13:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.61.133 with HTTP; Mon, 22 Jan 2018 04:12:49 -0800 (PST)
In-Reply-To: <CADYoBw27wU3CsYPeP7ONFWt4aj+6tvzwU5roDSOKz8qq1n8GSg@mail.gmail.com>
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
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Jan 2018 12:12:49 +0000
Message-ID: <CAFEAcA--i8RVKaBw5yXn4xRXBy5S+Yk=WDNKbuqzfDxn6jjtOA@mail.gmail.com>
To: bzt bzt <bztemail@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w2kij3Xf7AdC

On 18 January 2018 at 21:39, bzt bzt <bztemail@gmail.com> wrote:
> Dear All,
>
> Since you still haven't merged Alistair's patch, I decided to include it in
> my own.
> I've shrinked the number of modified files to two, that's the bare minimum
> to support "-M raspi3" switch. Bcm2836.c modified minimally, the rest is in
> raspi.c. I've renamed raspi2_init() to raspi_init() 'cos now it initializes
> raspi3 as well, no additional function.
>

Can you send this as a proper patch email, not as a reply to
an existing email thread, please? (This makes our automated tooling
much happier.)

In particular we can't apply patches if they don't come with
the right Signed-off-by: lines from everybody who contributed
code to them.

I've made some code review comments below.

> diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
> index 8c43291112..5119e00051 100644
> --- a/hw/arm/bcm2836.c
> +++ b/hw/arm/bcm2836.c
> @@ -15,6 +15,7 @@
>  #include "hw/arm/bcm2836.h"
>  #include "hw/arm/raspi_platform.h"
>  #include "hw/sysbus.h"
> +#include "hw/boards.h"
>  #include "exec/address-spaces.h"
>
>  /* Peripheral base address seen by the CPU */
> @@ -30,7 +31,7 @@ static void bcm2836_init(Object *obj)
>
>      for (n = 0; n < BCM2836_NCPUS; n++) {
>          object_initialize(&s->cpus[n], sizeof(s->cpus[n]),
> -                          "cortex-a15-" TYPE_ARM_CPU);
> +                          current_machine->cpu_type);

This SoC code shouldn't be looking at the current_machine settings.
It should have a QOM property that specifies the cpu type, and
the raspi.c code should set that property. (Call the property
'cpu-type' -- if you grep in hw/arm for that string you'll find
some examples of existing devices/boards that do this.)

>          object_property_add_child(obj, "cpu[*]", OBJECT(&s->cpus[n]),
>                                    &error_abort);
>      }
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index cd5fa8c3dc..24a9243440 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -5,6 +5,8 @@
>   * Rasperry Pi 2 emulation Copyright (c) 2015, Microsoft
>   * Written by Andrew Baumann
>   *
> + * Raspberry Pi 3 emulation Copyright (c) 2018 by bzt
> + *
>   * This code is licensed under the GNU GPLv2 and later.
>   */
>
> @@ -22,10 +24,11 @@
>  #define SMPBOOT_ADDR    0x300 /* this should leave enough space for ATAGS
> */
>  #define MVBAR_ADDR      0x400 /* secure vectors */
>  #define BOARDSETUP_ADDR (MVBAR_ADDR + 0x20) /* board setup code */
> -#define FIRMWARE_ADDR   0x8000 /* Pi loads kernel.img here by default */
> +#define FIRMWARE_ADDR_2    0x8000 /* Pi 2 loads kernel.img here by default
> */
> +#define FIRMWARE_ADDR_3   0x80000 /* Pi 3 loads kernel8.img here by default
> */
>
>  /* Table of Linux board IDs for different Pi versions */
> -static const int raspi_boardid[] = {[1] = 0xc42, [2] = 0xc43};
> +static const int raspi_boardid[] = {[1] = 0xc42, [2] = 0xc43, [3] = 0xc44};
>
>  typedef struct RasPiState {
>      BCM2836State soc;
> @@ -83,8 +86,8 @@ static void setup_boot(MachineState *machine, int version,
> size_t ram_size)
>      binfo.secure_board_setup = true;
>      binfo.secure_boot = true;
>
> -    /* Pi2 requires SMP setup */
> -    if (version == 2) {
> +    /* Pi2 and Pi3 requires SMP setup */
> +    if (version >= 2) {
>          binfo.smp_loader_start = SMPBOOT_ADDR;
>          binfo.write_secondary_boot = write_smpboot;
>          binfo.secondary_cpu_reset_hook = reset_secondary;
> @@ -94,15 +97,15 @@ static void setup_boot(MachineState *machine, int
> version, size_t ram_size)
>       * the normal Linux boot process
>       */
>      if (machine->firmware) {
> +        binfo.entry = version==3? FIRMWARE_ADDR_3 : FIRMWARE_ADDR_2;

There should be more spaces in this : "version == 3 ? ...".
If you run your patch through scripts/checkpatch.pl it should
help with this kind of style nit (though it doesn't always find
everything and sometimes it gets confused, so it's not always right).

>          /* load the firmware image (typically kernel.img) */
> -        r = load_image_targphys(machine->firmware, FIRMWARE_ADDR,
> -                                ram_size - FIRMWARE_ADDR);
> +        r = load_image_targphys(machine->firmware, binfo.entry,
> +                                ram_size - binfo.entry);
>          if (r < 0) {
>              error_report("Failed to load firmware from %s",
> machine->firmware);
>              exit(1);
>          }
>
> -        binfo.entry = FIRMWARE_ADDR;
>          binfo.firmware_loaded = true;
>      } else {
>          binfo.kernel_filename = machine->kernel_filename;
> @@ -113,7 +116,7 @@ static void setup_boot(MachineState *machine, int
> version, size_t ram_size)
>      arm_load_kernel(ARM_CPU(first_cpu), &binfo);
>  }
>
> -static void raspi2_init(MachineState *machine)
> +static void raspi_init(MachineState *machine)
>  {
>      RasPiState *s = g_new0(RasPiState, 1);
>      uint32_t vcram_size;
> @@ -121,6 +124,7 @@ static void raspi2_init(MachineState *machine)
>      BlockBackend *blk;
>      BusState *bus;
>      DeviceState *carddev;
> +    int version = machine->cpu_type==ARM_CPU_TYPE_NAME("cortex-a15")? 2 :
> 3;

This will get confused if the user passes a -cpu argument. Instead
we should just have the machine type directly determine the version.
There are several ways to do this, but the simplest way is to have
raspi2_machine_init() set mc->init to raspi2_init() and raspi3_machine_init()
set mc->niit to raspi3_init(), and thenthose function calls
raspi_init(machine, 2) or raspi_init(machine, 3).

(The other approach would be to make the board set up a subclass
of MachineState and then have raspi2 and raspi3 be subclasses of
that, which gives you a place to define raspi-specific data fields
like "version". You can see that approach in hw/arm/vexpress.c. But
that seems like a lot of effort to go to given where we've started,
so I don't really recommend it.)

>      object_initialize(&s->soc, sizeof(s->soc), TYPE_BCM2836);
>      object_property_add_child(OBJECT(machine), "soc", OBJECT(&s->soc),
> @@ -137,8 +141,8 @@ static void raspi2_init(MachineState *machine)
>                                     &error_abort);
>      object_property_set_int(OBJECT(&s->soc), smp_cpus, "enabled-cpus",
>                              &error_abort);
> -    object_property_set_int(OBJECT(&s->soc), 0xa21041, "board-rev",
> -                            &error_abort);
> +    object_property_set_int(OBJECT(&s->soc), version==3 ? 0xa02082 :
> 0xa21041,
> +                            "board-rev", &error_abort);
>      object_property_set_bool(OBJECT(&s->soc), true, "realized",
> &error_abort);
>
>      /* Create and plug in the SD cards */
> @@ -155,21 +159,39 @@ static void raspi2_init(MachineState *machine)
>
>      vcram_size = object_property_get_uint(OBJECT(&s->soc), "vcram-size",
>                                            &error_abort);
> -    setup_boot(machine, 2, machine->ram_size - vcram_size);
> +    setup_boot(machine, version, machine->ram_size - vcram_size);
>  }
>
>  static void raspi2_machine_init(MachineClass *mc)
>  {
>      mc->desc = "Raspberry Pi 2";
> -    mc->init = raspi2_init;
> +    mc->init = raspi_init;
>      mc->block_default_type = IF_SD;
>      mc->no_parallel = 1;
>      mc->no_floppy = 1;
>      mc->no_cdrom = 1;
>      mc->max_cpus = BCM2836_NCPUS;
>      mc->min_cpus = BCM2836_NCPUS;
>      mc->default_cpus = BCM2836_NCPUS;
> +    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
>      mc->default_ram_size = 1024 * 1024 * 1024;
>      mc->ignore_memory_transaction_failures = true;
>  };
>  DEFINE_MACHINE("raspi2", raspi2_machine_init)
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


I don't want to add new machine types which set the
ignore_memory_transaction_failures flag to true -- this is
only for existing board models where we don't know what
guest code that used to run would break when the flag was
flipped. For new boards we know that no code runs on them
so can leave the flag at its correct default.

This may mean that you need to add some extra dummy
devices to the the SoC model using
create_unimplemented_device() so that your guest image
doesn't crash trying to probe those devices.

I appreciate that this is a bit annoying for a case like this
where it's adding a new variant of an existing SoC, but
this is one of the situations where the only practical
opportunity to get the implementation right without breaking
existing QEMU users is at the point where we add the new
board model.

thanks
-- PMM
