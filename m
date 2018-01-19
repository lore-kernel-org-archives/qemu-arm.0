Received: by 10.28.71.27 with SMTP id u27csp1051299wma;
        Fri, 19 Jan 2018 10:15:57 -0800 (PST)
X-Google-Smtp-Source: ACJfBosLpxaDHbUzdRBbUfGI26UXXU4la3YOsHvjgPBRLW9GPWib3npki0z796R8ngWv3zXiQfDO
X-Received: by 10.37.145.11 with SMTP id v11mr40153143ybl.22.1516385757165;
        Fri, 19 Jan 2018 10:15:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516385757; cv=none;
        d=google.com; s=arc-20160816;
        b=Nm4NMD7xx87bjFGxf+1WL3Mo4T8pw4mQ0q+ddYoLic6BjW1dJ9rZ6OF5Ul60RQICXl
         bt60vIVxUi9W+SmeUlC5zjW94YMZjHh06LF7dQV1tsyWD4zISJa+cx76H4maUukp99jO
         UKC0v2jU0xwYbpyHpMJdBMzpubHO62HNicW0OnMCkiX6xx6KiEFSbYiAb/19JSE0ddZ/
         x+N8B0CoYhRRjAa9NDYG//nGLS3JaZDHSnbuCI87FSehDDE0pZdhlIaeg05d0J0gz8Al
         uxAVvjEZ6Fpi1B0R7E9xwzxRysqL9ZbKvBrA4NRQpptj1bv2r9r+xql2x7w14JjZ56t0
         Ar5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=x9384oe/vq/eLiyFOlNQCFkRbAcXdDYL1bIiBEwh6G8=;
        b=TA09lxhAjM15kyq4WqDs8ACCytIv94cSkoIeoyoQNdJF7p4qHfmrzwugulAiYJE+oc
         wAPYUPFOJQQfgnaRok4kAALOgMLX+u6dJ6wZtDCQwcfpMRAbdHhcXpW/r5NLeYJJNk9e
         7nqJwyO+o7yG4wWwj4Mz918qnqp5u/iJh66xqDjOytjvsB3fvAB6viZXMDhIqVZPJJbV
         SBGDl9juh4f8c8l2rVaN604uDzPjHlK3TOdUQCEKcGOH+KorHfgBkv3fM1VM8UH+N7QA
         MIkjZaOslu3xBc/6eYlAxEyDz8FOIXfLZTiwZ1pYEn/0cz8t2FVANTpCcBpyP/t3cDpg
         75pQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QInMt8em;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t69si713308ybi.275.2018.01.19.10.15.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Jan 2018 10:15:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QInMt8em;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36094 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecbCm-0002io-FK
	for alex.bennee@linaro.org; Fri, 19 Jan 2018 13:15:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33507)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ecbCc-0002hF-SS
	for qemu-arm@nongnu.org; Fri, 19 Jan 2018 13:15:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ecbCb-0004xR-SV
	for qemu-arm@nongnu.org; Fri, 19 Jan 2018 13:15:46 -0500
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:43962)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1ecbCY-0004wD-T6; Fri, 19 Jan 2018 13:15:43 -0500
Received: by mail-lf0-x243.google.com with SMTP id o89so3122970lfg.10;
	Fri, 19 Jan 2018 10:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=x9384oe/vq/eLiyFOlNQCFkRbAcXdDYL1bIiBEwh6G8=;
	b=QInMt8emU2VYMxU4YdQDt9EGFQ5Tmcqz5O0gDOZcPr/ORnguDRaOVO6isFWy9XqaKw
	UKR9qZF17AININ0RahdQZpelXaEyZxvrDnhwOiO4/Uv7qBncQMPi4vfwCPbDRiBPC0fz
	vYOPc8xDIUreOE0yfbBDHoMkxXcfAaj6KdhUr860oRSDH9JH1rpURssKh8gpDUFfAliL
	G+bh1tPkwTGsJ87Dfo2cusfcp7JTwmbcyou9DKElbKHFNTpoBfFLfXH2j/Ohx1Ldg6Jm
	isYf7820RM/g2g1LWnIVDUBz+ZwfI/ZtbtWF6CE3n47WqlrlL5CZsifQ7NoBE/Z3Eums
	He8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=x9384oe/vq/eLiyFOlNQCFkRbAcXdDYL1bIiBEwh6G8=;
	b=tv7QpeOM+IjSRHkEtfrRMOY1BTbnk8QKuhBkCw6Pkv3F6+EUrfAyJWwH8NAB1g4miW
	EQ9IiyZt39YkVTxOJFDsCo/rncipa2AY7qt/1xqdaW6Mm8JDZnZ258sch0OeP3EBvwjw
	m6Ja2o3lS//kImIYT+F9ed9adGyjs3pU1wLhmi12fU418as/zRqXuM2ACX1np3sp0ZxD
	8GponBEVdS9QZRTVXCP63jDXV5sL+a0Kr0bZJ8l8N1ZD2I+NnW5dWni6CqT39x1IeLMo
	3d7pxRWNWIracr0Sk1X/25MdDA4BTGithx+d1K+MSqyFk3Mi0F6LiqBRa2acg1jJRHYE
	hV3Q==
X-Gm-Message-State: AKwxytcx/kQHNK8BYkp5JDlrdDzO1n6Xgtjbjk9FkneupI9QIBx4x0Rn
	C9v/ayAuh72QouWs9oh5W62pMiJhTv8aPSOoTYB3cUQq8R0=
X-Received: by 10.46.127.4 with SMTP id a4mr6459937ljd.121.1516385741673; Fri,
	19 Jan 2018 10:15:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.45.10 with HTTP; Fri, 19 Jan 2018 10:15:10 -0800 (PST)
In-Reply-To: <0f5a2011-7378-dcee-cf31-5bfb341b85f8@amsat.org>
References: <cover.1516300623.git.alistair.francis@xilinx.com>
	<f5426a36d6a0d997d5f6445201861445d8e857da.1516300623.git.alistair.francis@xilinx.com>
	<0f5a2011-7378-dcee-cf31-5bfb341b85f8@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 19 Jan 2018 10:15:10 -0800
X-Google-Sender-Auth: uSCqCKZw7gEwPM_m9so-psg_wSU
Message-ID: <CAKmqyKP+rfd26R_rBgguWspzASZm4GRjfnfCiyBvPemxkx8AGQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::243
Subject: Re: [Qemu-arm] [PATCH v6 8/9] xlnx-zynqmp-pmu: Connect the IPI
 device to the PMU
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
X-TUID: SNeQV9733eyz

On Thu, Jan 18, 2018 at 1:42 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> On 01/18/2018 03:38 PM, Alistair Francis wrote:
>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
>> ---
>> V4:
>>  - Move the IPI to the machine instead of the SoC
>>
>>  hw/microblaze/xlnx-zynqmp-pmu.c | 31 +++++++++++++++++++++++++++++++
>>  1 file changed, 31 insertions(+)
>>
>> diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp=
-pmu.c
>> index 7312bfe23e..999a5657cf 100644
>> --- a/hw/microblaze/xlnx-zynqmp-pmu.c
>> +++ b/hw/microblaze/xlnx-zynqmp-pmu.c
>> @@ -24,6 +24,7 @@
>>  #include "cpu.h"
>>  #include "boot.h"
>>
>> +#include "hw/intc/xlnx-zynqmp-ipi.h"
>>  #include "hw/intc/xlnx-pmu-iomod-intc.h"
>>
>>  /* Define the PMU device */
>> @@ -38,6 +39,15 @@
>>
>>  #define XLNX_ZYNQMP_PMU_INTC_ADDR   0xFFD40000
>>
>> +#define XLNX_ZYNQMP_PMU_NUM_IPIS    4
>> +
>> +static const uint64_t ipi_addr[XLNX_ZYNQMP_PMU_NUM_IPIS] =3D {
>> +    0xFF340000, 0xFF350000, 0xFF360000, 0xFF370000,
>> +};
>> +static const uint64_t ipi_irq[XLNX_ZYNQMP_PMU_NUM_IPIS] =3D {
>> +    19, 20, 21, 22,
>> +};
>> +
>>  typedef struct XlnxZynqMPPMUSoCState {
>>      /*< private >*/
>>      DeviceState parent_obj;
>> @@ -136,6 +146,9 @@ static void xlnx_zynqmp_pmu_init(MachineState *machi=
ne)
>>      MemoryRegion *address_space_mem =3D get_system_memory();
>>      MemoryRegion *pmu_rom =3D g_new(MemoryRegion, 1);
>>      MemoryRegion *pmu_ram =3D g_new(MemoryRegion, 1);
>> +    XlnxZynqMPIPI *ipi[XLNX_ZYNQMP_PMU_NUM_IPIS];
>
> Why use pointers and g_new() here?
>
> Isn't a plain array simpler?

I remember that I tried that and ran into issues. It was so long ago
though that I can't remember what the problem was. I think it was
related to adding the object as a child.

Alistair

>
>    XlnxZynqMPIPI ipi[XLNX_ZYNQMP_PMU_NUM_IPIS];
>
> (same apply to pmu_rom/ram)
>
> Or maybe do you plan to start implementing MachineClass::exit()?
>
> (or go in this direction, which might make sens thinking about having a
> multiarch single binary).
>
>> +    qemu_irq irq[32];
>> +    int i;
>>
>>      /* Create the ROM */
>>      memory_region_init_rom(pmu_rom, NULL, "xlnx-zynqmp-pmu.rom",
>> @@ -155,6 +168,24 @@ static void xlnx_zynqmp_pmu_init(MachineState *mach=
ine)
>>                                &error_abort);
>>      object_property_set_bool(OBJECT(pmu), true, "realized", &error_fata=
l);
>>
>> +    for (i =3D 0; i < 32; i++) {
>> +        irq[i] =3D qdev_get_gpio_in(DEVICE(&pmu->intc), i);
>> +    }
>> +
>> +    /* Create and connect the IPI device */
>> +    for (i =3D 0; i < XLNX_ZYNQMP_PMU_NUM_IPIS; i++) {
>> +        ipi[i] =3D g_new0(XlnxZynqMPIPI, 1);
>> +        object_initialize(ipi[i], sizeof(XlnxZynqMPIPI), TYPE_XLNX_ZYNQ=
MP_IPI);
>> +        qdev_set_parent_bus(DEVICE(ipi[i]), sysbus_get_default());
>> +    }
>> +
>> +    for (i =3D 0; i < XLNX_ZYNQMP_PMU_NUM_IPIS; i++) {
>> +        object_property_set_bool(OBJECT(ipi[i]), true, "realized",
>> +                                 &error_abort);
>> +        sysbus_mmio_map(SYS_BUS_DEVICE(ipi[i]), 0, ipi_addr[i]);
>> +        sysbus_connect_irq(SYS_BUS_DEVICE(ipi[i]), 0, irq[ipi_irq[i]]);
>> +    }
>> +
>>      /* Load the kernel */
>>      microblaze_load_kernel(&pmu->cpu, XLNX_ZYNQMP_PMU_RAM_ADDR,
>>                             machine->ram_size,
>>
