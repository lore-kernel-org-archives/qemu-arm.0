Received: by 10.28.71.27 with SMTP id u27csp1125667wma;
        Fri, 19 Jan 2018 11:35:44 -0800 (PST)
X-Google-Smtp-Source: ACJfBovrB/BWEMr++TTmdaNUTW+f0pSFPWLYNOeBP6/ym7jgc4AHnhOP3NlPqhk0tr1VDc5/Kedt
X-Received: by 10.13.228.1 with SMTP id n1mr10856564ywe.6.1516390544531;
        Fri, 19 Jan 2018 11:35:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516390544; cv=none;
        d=google.com; s=arc-20160816;
        b=d/bo5zJoV/i3x02SIM1nZ7hdlULlYkeR5dVfywvuuNWHuUXcEFV4aNW5I02zrxWpfQ
         P5VPe9VLjgpzrhAWCQdNCQFy2XHqgxw6PFwbP9P3hHlmLUJejIcM/yUSVAvWmfOxgezA
         5UFViWuSuQVMS5xU47k4hOHZGf4rn0DWhc2KVVk2n5945gqMjdhY8vaJE8/MMYTsM8h/
         hv4rWClAciCLMWuVLZ7xLXNexDhF7lVn8LZ81yy5GKpqTDTyt8atY6Qd/jdg9mYXmUYk
         jWbBscz/BKfzcKD8D5kDyixHBpotOAH4ER6jaPJB6ptLjoA1KJbsZN7EOYP8SwqgX9dl
         meiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=JDiWgFeV6hxQ9fNHC6d0z5dH75K8cBZynvSR7YjV50o=;
        b=GMpFUnUb/FO653tPkp74RRLVJ+Pd7rTk6xdrOgWKCue3ac6Yd9DDEdAHk11CxxuA38
         rg5nxHsg7QhZtZMw7yJMtXvUS8qm4zVmEp2PRnhExX91JkcrV7vawUH/S0Bg+6N8P8Yc
         syzprVinSXp0Ginmj7h91PvOfbHe/SdDseniwZ68U4Zus/wT/s2PXyXza/NqsM0T7La0
         3bSFxY6fFO/afsPRBpaTADeP405OeeW2kKpRELmGGMjOWK6afC5rfXLESWBNzYzQxMW3
         no+satgy42dO5ReHSt/HTXgM9z8MgEAFS1cjBeoyuvP3GLBtmUX/GDsnTnVu7/oBuCAx
         ltOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TLsgb7L4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w138si706508ybe.819.2018.01.19.11.35.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Jan 2018 11:35:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TLsgb7L4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40259 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eccS0-0006MW-1e
	for alex.bennee@linaro.org; Fri, 19 Jan 2018 14:35:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54224)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eccRn-0006Jc-Gf
	for qemu-arm@nongnu.org; Fri, 19 Jan 2018 14:35:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eccRm-0002Xs-6a
	for qemu-arm@nongnu.org; Fri, 19 Jan 2018 14:35:31 -0500
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:41468)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eccRi-0002Sk-4w; Fri, 19 Jan 2018 14:35:26 -0500
Received: by mail-qt0-x244.google.com with SMTP id i1so6526042qtj.8;
	Fri, 19 Jan 2018 11:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=JDiWgFeV6hxQ9fNHC6d0z5dH75K8cBZynvSR7YjV50o=;
	b=TLsgb7L4sVIbeZ+d35cJfl77H5xtoPwyQiO0vumDWKyK76CGMfDFORgp7Jsf72eMt4
	97CNBsTc8LGVepUOih1Cz/UulFcqPmqXsbTK/GY4yB4T2xZFpHIOnWdPgdvaqQT7aYlN
	fB8QM+9KMOV9Xv/fimg41pEzDqOVzR5DRMcmFR3E/d6rwjhv0CIuoLWrRFAhVBUdqEeC
	X9m3/hxv4i7GpopnHXp9jRKGk6eCWzo4LrwUNmVMBHMYDER0KxdRVFqf++DMoc6yKqWz
	vxCtQTYxfujOyU6EJOApeQL3YHL3jAFqijCFMV8aTXuklalFwh2WBm379ov/Ey8WwMKp
	6tHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=JDiWgFeV6hxQ9fNHC6d0z5dH75K8cBZynvSR7YjV50o=;
	b=MQdJkrE5G87j2EdE9dlwYyHkqv1SyR6RwTmxV5SVWc6KzFPY/o+UmntgpY2EmeBA5t
	HbECGx4paNxo6ICmEnaj1KTgQFteT3cHmNpt/cEMdH7Q/U2e+gS11i6vxGVnjVcQ44SF
	YseidcCRk14vxDVCu/S6SzjMem+HnIJrROixmrsmyeNSlbbf5wCfwwXKivPWqGqJ5Xst
	bA6fp5zPIjxKIErYHaTJDPLd8Z+ZbKmdkgEl8QUMzsRgvlzL19XvF+3qZPnVg23zM3/5
	KApU7iIoUNt8HXz7Y3cxpvmskQ5165szyvPa5zbpx6ccIolip/VFhdS8HPre2q3EWnLa
	g0iw==
X-Gm-Message-State: AKwxyteV/ZAnm4unbdAVquP4s0UWSCDM7LjtWcs4kzrY44aedSqy+RG+
	S8b3C5+6kS22Jg2QWRSOf7kzlMJn
X-Received: by 10.55.53.134 with SMTP id c128mr13041247qka.279.1516390525397; 
	Fri, 19 Jan 2018 11:35:25 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id
	y62sm6578739qtd.84.2018.01.19.11.35.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Jan 2018 11:35:24 -0800 (PST)
To: Alistair Francis <alistair.francis@xilinx.com>
References: <cover.1516300623.git.alistair.francis@xilinx.com>
	<f5426a36d6a0d997d5f6445201861445d8e857da.1516300623.git.alistair.francis@xilinx.com>
	<0f5a2011-7378-dcee-cf31-5bfb341b85f8@amsat.org>
	<CAKmqyKP+rfd26R_rBgguWspzASZm4GRjfnfCiyBvPemxkx8AGQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <d6ba5178-6dfe-9857-21cb-97f54b4e199d@amsat.org>
Date: Fri, 19 Jan 2018 16:35:22 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAKmqyKP+rfd26R_rBgguWspzASZm4GRjfnfCiyBvPemxkx8AGQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
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
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NYxc8i/sxofn

On 01/19/2018 03:15 PM, Alistair Francis wrote:
> On Thu, Jan 18, 2018 at 1:42 PM, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> On 01/18/2018 03:38 PM, Alistair Francis wrote:
>>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>>> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
>>> ---
>>> V4:
>>>  - Move the IPI to the machine instead of the SoC
>>>
>>>  hw/microblaze/xlnx-zynqmp-pmu.c | 31 +++++++++++++++++++++++++++++++
>>>  1 file changed, 31 insertions(+)
>>>
>>> diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp-pmu.c
>>> index 7312bfe23e..999a5657cf 100644
>>> --- a/hw/microblaze/xlnx-zynqmp-pmu.c
>>> +++ b/hw/microblaze/xlnx-zynqmp-pmu.c
>>> @@ -24,6 +24,7 @@
>>>  #include "cpu.h"
>>>  #include "boot.h"
>>>
>>> +#include "hw/intc/xlnx-zynqmp-ipi.h"
>>>  #include "hw/intc/xlnx-pmu-iomod-intc.h"
>>>
>>>  /* Define the PMU device */
>>> @@ -38,6 +39,15 @@
>>>
>>>  #define XLNX_ZYNQMP_PMU_INTC_ADDR   0xFFD40000
>>>
>>> +#define XLNX_ZYNQMP_PMU_NUM_IPIS    4
>>> +
>>> +static const uint64_t ipi_addr[XLNX_ZYNQMP_PMU_NUM_IPIS] = {
>>> +    0xFF340000, 0xFF350000, 0xFF360000, 0xFF370000,
>>> +};
>>> +static const uint64_t ipi_irq[XLNX_ZYNQMP_PMU_NUM_IPIS] = {
>>> +    19, 20, 21, 22,
>>> +};
>>> +
>>>  typedef struct XlnxZynqMPPMUSoCState {
>>>      /*< private >*/
>>>      DeviceState parent_obj;
>>> @@ -136,6 +146,9 @@ static void xlnx_zynqmp_pmu_init(MachineState *machine)
>>>      MemoryRegion *address_space_mem = get_system_memory();
>>>      MemoryRegion *pmu_rom = g_new(MemoryRegion, 1);
>>>      MemoryRegion *pmu_ram = g_new(MemoryRegion, 1);
>>> +    XlnxZynqMPIPI *ipi[XLNX_ZYNQMP_PMU_NUM_IPIS];
>>
>> Why use pointers and g_new() here?
>>
>> Isn't a plain array simpler?
> 
> I remember that I tried that and ran into issues. It was so long ago
> though that I can't remember what the problem was. I think it was
> related to adding the object as a child.

It makes sens for the SoC container where it is indeed necessary, but
your v4 moved this into the machine.
Not a blocking issue although.

> 
> Alistair
> 
>>
>>    XlnxZynqMPIPI ipi[XLNX_ZYNQMP_PMU_NUM_IPIS];
>>
>> (same apply to pmu_rom/ram)
>>
>> Or maybe do you plan to start implementing MachineClass::exit()?
>>
>> (or go in this direction, which might make sens thinking about having a
>> multiarch single binary).
>>
>>> +    qemu_irq irq[32];
>>> +    int i;
>>>
>>>      /* Create the ROM */
>>>      memory_region_init_rom(pmu_rom, NULL, "xlnx-zynqmp-pmu.rom",
>>> @@ -155,6 +168,24 @@ static void xlnx_zynqmp_pmu_init(MachineState *machine)
>>>                                &error_abort);
>>>      object_property_set_bool(OBJECT(pmu), true, "realized", &error_fatal);
>>>
>>> +    for (i = 0; i < 32; i++) {
>>> +        irq[i] = qdev_get_gpio_in(DEVICE(&pmu->intc), i);
>>> +    }
>>> +
>>> +    /* Create and connect the IPI device */
>>> +    for (i = 0; i < XLNX_ZYNQMP_PMU_NUM_IPIS; i++) {
>>> +        ipi[i] = g_new0(XlnxZynqMPIPI, 1);
>>> +        object_initialize(ipi[i], sizeof(XlnxZynqMPIPI), TYPE_XLNX_ZYNQMP_IPI);
>>> +        qdev_set_parent_bus(DEVICE(ipi[i]), sysbus_get_default());
>>> +    }
>>> +
>>> +    for (i = 0; i < XLNX_ZYNQMP_PMU_NUM_IPIS; i++) {
>>> +        object_property_set_bool(OBJECT(ipi[i]), true, "realized",
>>> +                                 &error_abort);
>>> +        sysbus_mmio_map(SYS_BUS_DEVICE(ipi[i]), 0, ipi_addr[i]);
>>> +        sysbus_connect_irq(SYS_BUS_DEVICE(ipi[i]), 0, irq[ipi_irq[i]]);
>>> +    }
>>> +
>>>      /* Load the kernel */
>>>      microblaze_load_kernel(&pmu->cpu, XLNX_ZYNQMP_PMU_RAM_ADDR,
>>>                             machine->ram_size,
>>>
> 
