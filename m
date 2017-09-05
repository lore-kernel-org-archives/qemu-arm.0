Received: by 10.223.172.38 with SMTP id v35csp1688485wrc;
        Tue, 5 Sep 2017 10:37:40 -0700 (PDT)
X-Received: by 10.55.104.131 with SMTP id d125mr5972333qkc.37.1504633060125;
        Tue, 05 Sep 2017 10:37:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504633060; cv=none;
        d=google.com; s=arc-20160816;
        b=h6M7uz6jal0QwBaUa1XzPKEN2y091I1iXV8/20y5ckjcvlxk1kwndIjwkQnzHjZoyb
         i3+8il5fViobniLqLYOFk8796uBF2DVuLergtaHzR21ikbi+t8suPvP3y9cbV9YyrHHP
         8fydidSRmYCewutuxB82j1sQQUNQOMLNWmOzpcpgoR2PMxnpReellshUeVsAwLEweWS8
         MChklOhUcTCkY5PuYmrilp+kiI69t2EtjIgeNpULZlKaPelqeYMuLHzfFvB+rq25SQSm
         3NxO3wEMoyJ7b+PzhY5ZCl4WYlBNNG/IhqmvM1xLVnnCyFTKIYSYcDNofGLeFlYvN8BW
         cJ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Jgyua2PpvzZqgRE1mLGZsftoZdfTUYFbMxToRMbMhdk=;
        b=EDdGeAWV965VRMJNynF4pH+np+jvAqhfmtpBs954hnv2YkICqlNJXRRN6Y4E6k05mU
         i/d/2UxmcNB/sKtVWmTqUTaRGpctlV5AT2LrVWXLqwYOtbrGU5GvYB/EIhN2PVoNoB6U
         gw5X/OPCCfs6GVdzbosmZmtJlT9u20j9GriZEEfocCWLOYOPvahfBrnw+tnGzYISfBd/
         XtT+4ULm5tosWgMlugSj0SKUu71seZZtEJTVf/pUmrh8U3IZ+QNR4RmrchTl/NEWj5rn
         YxANvzRPG8dAEIB2JEVUw7dg7Wa5VXjctXYjEe+C6IFTu6GjT+bVwatQeBg5cqV7tZYd
         JsGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=U8R+qgVj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c9si1034606qkh.398.2017.09.05.10.37.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Sep 2017 10:37:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=U8R+qgVj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60354 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpHn7-0003OJ-Rq
	for alex.bennee@linaro.org; Tue, 05 Sep 2017 13:37:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51778)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dpHmt-0003KX-TG
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 13:37:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dpHmp-0008Tq-22
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 13:37:23 -0400
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:34827)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dpHme-0008LE-G2; Tue, 05 Sep 2017 13:37:08 -0400
Received: by mail-wm0-x241.google.com with SMTP id e64so3504897wmi.2;
	Tue, 05 Sep 2017 10:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=Jgyua2PpvzZqgRE1mLGZsftoZdfTUYFbMxToRMbMhdk=;
	b=U8R+qgVjyl2BT63Wy4xqnYrA+8gBLcXtRk71tI05ATx/WSGThPQlxID7VqBfptixOc
	j42xm2zUXvw6nlnoGcsfOGPLlMWUc6P9eyTiRaGF/jt4gdiblppOW6MTyZ/SKL9QvV0f
	9OOA7BSmT4jLZxPFtSwY1ugPtAFBqcfAiQNvOLlx1jHcTY4joG8RWUerDonibzBdc2p2
	NxD6JLUSuz4YqfiHqabsKcFH0ecYvO143wp2hmxQp44t3wfwvzbW0mPDxHbBKvn3gFBf
	jzT0saVGUkFP1kopjcoIz72Zr8HSkXYmW9Hbi5QU1oZ3tlmy12XLSTz3nrwmaslbVBR2
	5pyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=Jgyua2PpvzZqgRE1mLGZsftoZdfTUYFbMxToRMbMhdk=;
	b=EcLWE1ZHFJrs0XoX6bbcbnAG2Z08HouGRD/+3n0X2FBKxypz7J9nASVRmfriV+ZjPl
	GzahG5BLhVt+xCHu70jW0/kgwwnkgEzNcGp4ZSGDtlDlQBlj51tmww5zD7KsYePuNyYM
	1+rZxWJ73YGppWaWbTSwUTzY2QAndVSFXdmH+Q6b5mxrJaaHysLjCkPtFcOEVH+UVPam
	ZTkX2l+3ZqwTcuOwflaXJkJbrmI3Y6uagGS21ECtYh7GjdOxkJNgVHrfMZOi6+2E6MVX
	emgeyEgLPfOkLm01N7fAfInfUXtAiYFnhflLpYa0uHNcyzYojerGeiJYKkl0NyoeTMHb
	KrTg==
X-Gm-Message-State: AHPjjUiQexiRtKexAjzqWHDV61yNGqJA66vcbPbcn/9GjVD9j7/DJ0bt
	vH5u1QHxNYLABW5PRsAaGb7WTfCXhA==
X-Google-Smtp-Source: ADKCNb7eTVJEe8l3GqlAAjwd5zqgHoy9RMrPADsqWnRHnbn1roeah1ZUaBDFjwOL5mjB8OrBM5LsWEyq7KsaM5MdR2g=
X-Received: by 10.28.209.14 with SMTP id i14mr1908716wmg.156.1504633027300;
	Tue, 05 Sep 2017 10:37:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.130 with HTTP; Tue, 5 Sep 2017 10:36:36 -0700 (PDT)
In-Reply-To: <20170904093224.62b43efb@nial.brq.redhat.com>
References: <cover.1504293917.git.alistair.francis@xilinx.com>
	<241130c59df31aebaf4f23b5f151b6b5c91f36fa.1504293917.git.alistair.francis@xilinx.com>
	<20170904093224.62b43efb@nial.brq.redhat.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 5 Sep 2017 10:36:36 -0700
X-Google-Sender-Auth: _RcevA5wh4I_BqfJHrCfcTjgNIw
Message-ID: <CAKmqyKOyxQX__uV8Sh3bmyq9NACwsekPz2EaGVBZP9i3dFKSPg@mail.gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 2/6] xlnx-zynqmp-pmu: Add the
 CPU and memory
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tVwQNjAVWOig

On Mon, Sep 4, 2017 at 12:32 AM, Igor Mammedov <imammedo@redhat.com> wrote:
> On Fri, 1 Sep 2017 14:00:37 -0700
> Alistair Francis <alistair.francis@xilinx.com> wrote:
>
>> Connect the MicroBlaze CPU and the ROM and RAM memory regions.
>>
>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>> ---
>>
>>  hw/microblaze/xlnx-zynqmp-pmu.c | 65 +++++++++++++++++++++++++++++++++++++++--
>>  1 file changed, 63 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp-pmu.c
>> index fc3c8b236f..33584cfa4d 100644
>> --- a/hw/microblaze/xlnx-zynqmp-pmu.c
>> +++ b/hw/microblaze/xlnx-zynqmp-pmu.c
>> @@ -18,8 +18,11 @@
>>  #include "qemu/osdep.h"
>>  #include "qapi/error.h"
>>  #include "qemu-common.h"
>> +#include "exec/address-spaces.h"
>>  #include "hw/boards.h"
>> +#include "hw/qdev-properties.h"
>>  #include "cpu.h"
>> +#include "boot.h"
>>
>>  /* Define the PMU device */
>>
>> @@ -27,21 +30,51 @@
>>  #define XLNX_ZYNQMP_PMU(obj) OBJECT_CHECK(XlnxZynqMPPMUState, (obj), \
>>                                            TYPE_XLNX_ZYNQMP_PMU)
>>
>> +#define XLNX_ZYNQMP_PMU_ROM_SIZE    0x8000
>> +#define XLNX_ZYNQMP_PMU_ROM_ADDR    0xFFD00000
>> +#define XLNX_ZYNQMP_PMU_RAM_ADDR    0xFFDC0000
>> +
>>  typedef struct XlnxZynqMPPMUState {
>>      /*< private >*/
>>      DeviceState parent_obj;
>>
>>      /*< public >*/
>> +    MicroBlazeCPU cpu;
>>  }  XlnxZynqMPPMUState;
>>
>>  static void xlnx_zynqmp_pmu_init(Object *obj)
>>  {
>> +    XlnxZynqMPPMUState *s = XLNX_ZYNQMP_PMU(obj);
>>
>> +    object_initialize(&s->cpu, sizeof(s->cpu),
>> +                      TYPE_MICROBLAZE_CPU);
>> +    object_property_add_child(obj, "pmu-cpu[*]", OBJECT(&s->cpu),
>                                               ^^^ why do you use this syntax here?
>

Woops, that was a left over from the ARM ZynqMP. I'll remove the '[*]'

>> +                              &error_abort);
>>  }
>>
>>  static void xlnx_zynqmp_pmu_realize(DeviceState *dev, Error **errp)
>>  {
>> -
>> +    XlnxZynqMPPMUState *s = XLNX_ZYNQMP_PMU(dev);
>> +
>> +    object_property_set_uint(OBJECT(&s->cpu), XLNX_ZYNQMP_PMU_ROM_ADDR,
>> +                             "base-vectors", &error_abort);
>> +    object_property_set_bool(OBJECT(&s->cpu), true, "use-stack-protection",
>> +                             &error_abort);
>> +    object_property_set_uint(OBJECT(&s->cpu), 0, "use-fpu", &error_abort);
>> +    object_property_set_uint(OBJECT(&s->cpu), 0, "use-hw-mul", &error_abort);
>> +    object_property_set_bool(OBJECT(&s->cpu), true, "use-barrel",
>> +                             &error_abort);
>> +    object_property_set_bool(OBJECT(&s->cpu), true, "use-msr-instr",
>> +                             &error_abort);
>> +    object_property_set_bool(OBJECT(&s->cpu), true, "use-pcmp-instr",
>> +                             &error_abort);
>> +    object_property_set_bool(OBJECT(&s->cpu), false, "use-mmu", &error_abort);
>> +    object_property_set_bool(OBJECT(&s->cpu), true, "endianness",
>> +                             &error_abort);
>> +    object_property_set_str(OBJECT(&s->cpu), "8.40.b", "version",
>> +                            &error_abort);
>> +    object_property_set_uint(OBJECT(&s->cpu), 0, "pvr", &error_abort);
>> +    object_property_set_bool(OBJECT(&s->cpu), true, "realized", &error_fatal);
> I'd replace error_fatal here with errp

Will do.

Thanks,
Alistair

>
>>  }
>>
>>  static void xlnx_zynqmp_pmu_class_init(ObjectClass *oc, void *data)
>> @@ -70,7 +103,35 @@ type_init(xlnx_zynqmp_pmu_register_types)
>>
>>  static void xlnx_zcu102_pmu_init(MachineState *machine)
>>  {
>> -
>> +    XlnxZynqMPPMUState *pmu = g_new0(XlnxZynqMPPMUState, 1);
>> +    MemoryRegion *address_space_mem = get_system_memory();
>> +    MemoryRegion *pmu_rom = g_new(MemoryRegion, 1);
>> +    MemoryRegion *pmu_ram = g_new(MemoryRegion, 1);
>> +
>> +    /* Create the ROM */
>> +    memory_region_init_rom(pmu_rom, NULL, "xlnx-zcu102-pmu.rom",
>> +                           XLNX_ZYNQMP_PMU_ROM_SIZE, &error_fatal);
>> +    memory_region_add_subregion(address_space_mem, XLNX_ZYNQMP_PMU_ROM_ADDR,
>> +                                pmu_rom);
>> +
>> +    /* Create the RAM */
>> +    memory_region_init_ram(pmu_ram, NULL, "xlnx-zcu102-pmu.ram",
>> +                           machine->ram_size, &error_fatal);
>> +    memory_region_add_subregion(address_space_mem, XLNX_ZYNQMP_PMU_RAM_ADDR,
>> +                                pmu_ram);
>> +
>> +    /* Create the PMU device */
>> +    object_initialize(pmu, sizeof(XlnxZynqMPPMUState), TYPE_XLNX_ZYNQMP_PMU);
>> +    object_property_add_child(OBJECT(machine), "pmu", OBJECT(pmu),
>> +                              &error_abort);
>> +    object_property_set_bool(OBJECT(pmu), true, "realized", &error_fatal);
>> +
>> +    /* Load the kernel */
>> +    microblaze_load_kernel(&pmu->cpu, XLNX_ZYNQMP_PMU_RAM_ADDR,
>> +                           machine->ram_size,
>> +                           machine->kernel_filename,
>> +                           machine->dtb,
>> +                           NULL);
>>  }
>>
>>  static void xlnx_zcu102_pmu_machine_init(MachineClass *mc)
>
