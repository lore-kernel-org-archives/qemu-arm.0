Received: by 10.25.0.6 with SMTP id 6csp68529lfa;
        Thu, 11 May 2017 22:02:53 -0700 (PDT)
X-Received: by 10.55.178.132 with SMTP id b126mr1865355qkf.315.1494565373242;
        Thu, 11 May 2017 22:02:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494565373; cv=none;
        d=google.com; s=arc-20160816;
        b=idtvZXkTT5XeO1bp7/mQt3dtp5syYKXoT9C+paIMdiGr91Z9ny9gUR4kxxfcPZWiWK
         +Lp8YOYv5a8sD1/TogTgCOJCtUVuzoJRYHixw2BvAeYxP3+3C2nEZU5YEJA8IxCIQZzv
         nd94N+i+vkLoamZpICAiWhGE+lLqPKJYFnleoQ7xOvhqPJw/aNlHT6+1E8JrTHR+fwKy
         n5ebCDzXzV3HuHEe2x3xdozBAgMDSmkES/cnezgWTW3RUsiiCHWXt/naSr4efqgxZGDx
         x2ROpn2RVqeEycUgTcyQ7+GjYJB2/RqmxZdjqmfBKWLE5kW5WFzuJ/mCl9NDJdustDkJ
         oMQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=sxC29dl72wD3f3hDNcV8jIDBM7uJWI8QQsrSrNl/Ht8=;
        b=cln55/6QOSwOfMHCZ2walj4bWZdk68HN9vPvV68k1PO8bC1J1ljMxW/qa/frmdsNyY
         l8MjykRlinqGxuTNO2/C6r4AX692DVBfrMC8KRUUQztcXILLVGdJSEzezkRHH9vwz1H2
         INzcvLP+cIB8r7TmDU3PWawNjazRGBuyFN1Z4BC+MRE65phNAFj+5tD7LBhR2P927Hbu
         2MCF1Hrv7DcdVVuQGZiY2vwrVHInRb97kAERTPbe+BcqLUDFNfEWMyNHoC+NWStpqBo/
         g7oUOGIg+iCDwkrTqaguNO9pxA5pqh4WqrmgfLwrYBJlxA0bhCjbjSmvmvEyJN5ZgTR0
         oPXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t31si2356724qtb.285.2017.05.11.22.02.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 May 2017 22:02:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51323 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d92j6-0003Kj-OO
	for alex.bennee@linaro.org; Fri, 12 May 2017 01:02:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58642)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d92j0-0003KT-AU
	for qemu-arm@nongnu.org; Fri, 12 May 2017 01:02:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d92ix-0006UU-6h
	for qemu-arm@nongnu.org; Fri, 12 May 2017 01:02:46 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:36831)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d92ix-0006U9-07; Fri, 12 May 2017 01:02:43 -0400
Received: by mail-qk0-x244.google.com with SMTP id y128so6473182qka.3;
	Thu, 11 May 2017 22:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=sxC29dl72wD3f3hDNcV8jIDBM7uJWI8QQsrSrNl/Ht8=;
	b=EVeGVnSRDYQ7+gpK6z9ubFb1qPKCJJqIiNKUc+oBTCoVEEVggDpXlVPx7og/DlAQP9
	hg1VL/4VW3Ibu9iQ2L4BUlZ7PXYjvAlB/AB7kBWeen3UugptQLHAis/HWPNVledrrdgk
	Fp86qmguyd0PGQbdRFlrqTxJi62z2NcjLsifP1Na8N5V11qgLQb99uuJ2zHDFGvOtzj1
	vGreUaAaPTa9vOW/juK8ZSc/m8QFz+QbFESf5yiP1kyakWDQYGN561YAvLNGmPu/nn9g
	71qTDJP+XA7PHMyplFNBmLu1Gl3oAzZJ1X4w/D1eT1TzUkDysAkR1hB5DMvkHi6Lwdn8
	DR8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=sxC29dl72wD3f3hDNcV8jIDBM7uJWI8QQsrSrNl/Ht8=;
	b=If1GldTYpIG7NfVDgnRi/qYo7snoLp1NMqREKOaF/qpw84LTSaBh0l/ZmlmMqMFgAw
	Vo+8MTF1KMnS2nFuZJg37W/Wiory7mtcieC01OcfkOkw/KaILNe60hKu7el0xIqHk2Xl
	7y+2r6mnA8vmgnbqF/Ca5TPtsnEVgG2XwWJw2QUEOfDvNpkxBA5HJfnkqS2HO/j2aowD
	sdUAD8KRcq/1LTqwhq3UglYmNmaRUFomRQVde50LIinc/uP4enBP3UWG0Ekokf2oS7eu
	dijupdTWSQXiEL1VLS+JW/pKzsyTGYeuET9Ra51q102U7I9s0lxCyJ7mNg8XEe4WvQBc
	+hiA==
X-Gm-Message-State: AODbwcCMOonZKoL9jJLDzFrnT6t/JJzDn3TRij6+LxqRVLUHWCPR0Ir8
	gcMA4BkqKOql5A==
X-Received: by 10.55.149.130 with SMTP id x124mr1755057qkd.99.1494565362180;
	Thu, 11 May 2017 22:02:42 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	r40sm1684269qkr.13.2017.05.11.22.02.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 May 2017 22:02:41 -0700 (PDT)
To: sundeep subbaraya <sundeep.lkml@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair23@gmail.com>
References: <1494348286-10253-1-git-send-email-sundeep.lkml@gmail.com>
	<1494348286-10253-5-git-send-email-sundeep.lkml@gmail.com>
	<b913e666-8df3-714f-3ff9-e8f4ff9e7098@amsat.org>
	<CALHRZuptHwyzu0Y98VWnNd785W80AZ=+1cr_rfegvDo5amh+3g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7ee4c347-4502-863a-8c9f-faaf8fab17f3@amsat.org>
Date: Fri, 12 May 2017 02:02:37 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CALHRZuptHwyzu0Y98VWnNd785W80AZ=+1cr_rfegvDo5amh+3g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-arm] [Qemu-devel] [Qemu-devel PATCH 4/5] msf2: Add
 Smartfusion2 SoC.
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CteNBFZUg1Sy

On 05/12/2017 12:17 AM, sundeep subbaraya wrote:
> Hi Philippe,
>
> On Wed, May 10, 2017 at 5:20 PM, Philippe Mathieu-Daudé <f4bug@amsat.org>
> wrote:
>
>> Hi Subbaraya,
>>
>>
>> On 05/09/2017 01:44 PM, Subbaraya Sundeep wrote:
>>
>>> Smartfusion2 SoC has hardened Microcontroller subsystem
>>> and flash based FPGA fabric. This patch adds support for
>>> Microcontroller subsystem in the SoC.
>>>
>>> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
>>> ---
>>>  default-configs/arm-softmmu.mak |   1 +
>>>  hw/arm/Makefile.objs            |   2 +-
>>>  hw/arm/msf2-soc.c               | 188 ++++++++++++++++++++++++++++++
>>> ++++++++++
>>>  include/hw/arm/msf2-soc.h       |  60 +++++++++++++
>>>  4 files changed, 250 insertions(+), 1 deletion(-)
>>>  create mode 100644 hw/arm/msf2-soc.c
>>>  create mode 100644 include/hw/arm/msf2-soc.h
>>>
>>> diff --git a/default-configs/arm-softmmu.mak
>>> b/default-configs/arm-softmmu.mak
>>> index 78d7af0..7062512 100644
>>> --- a/default-configs/arm-softmmu.mak
>>> +++ b/default-configs/arm-softmmu.mak
>>> @@ -122,3 +122,4 @@ CONFIG_ACPI=y
>>>  CONFIG_SMBIOS=y
>>>  CONFIG_ASPEED_SOC=y
>>>  CONFIG_GPIO_KEY=y
>>> +CONFIG_MSF2=y
>>> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
>>> index 4c5c4ee..ae5e4a3 100644
>>> --- a/hw/arm/Makefile.objs
>>> +++ b/hw/arm/Makefile.objs
>>> @@ -1,7 +1,7 @@
>>>  obj-y += boot.o collie.o exynos4_boards.o gumstix.o highbank.o
>>>  obj-$(CONFIG_DIGIC) += digic_boards.o
>>>  obj-y += integratorcp.o mainstone.o musicpal.o nseries.o
>>> -obj-y += omap_sx1.o palm.o realview.o spitz.o stellaris.o
>>> +obj-y += omap_sx1.o palm.o realview.o spitz.o stellaris.o msf2-soc.o
>>>
>>
>> Not a big deal, but since you added CONFIG_MSF2 why not using it here and
>> the Makefiles you touched (misc/ssi/timer)?
>>
>> obj-$(CONFIG_MSF2) += msf2-soc.o
>>
>>   OK. Will change it.
>
>>
>>  obj-y += tosa.o versatilepb.o vexpress.o virt.o xilinx_zynq.o z2.o
>>>  obj-$(CONFIG_ACPI) += virt-acpi-build.o
>>>  obj-y += netduino2.o
[...]
>>> +    MemoryRegion *system_memory = get_system_memory();
>>> +    MemoryRegion *nvm = g_new(MemoryRegion, 1);
>>> +    MemoryRegion *nvm_alias = g_new(MemoryRegion, 1);
>>> +    MemoryRegion *sram = g_new(MemoryRegion, 1);
>>> +    MemoryRegion *ddr = g_new(MemoryRegion, 1);
>>> +
>>> +    memory_region_init_ram(nvm, NULL, "MSF2.envm", ENVM_SIZE,
>>> +                           &error_fatal);
>>>
>>
>> Maybe you can name it "eNVM" to match the documentation.
>>
>> Also envm_size should be a per-model property.
>>
>
> Ok.
>
>>
>> +    memory_region_init_alias(nvm_alias, NULL, "MSF2.flash.alias",
>>> +                             nvm, 0, ENVM_SIZE);
>>>
>>
>> Hmmm well this would be the "Cache Matrix Remap" which happens to be
>> mapped by default to eNVM on cold reset.
>> Naming it "MSF2.flash.alias" is pretty confusing.
>>
>
> Exactly it is Cache Matrix Remap.
> AFAIK currently we cannot remap memory during runtime in Qemu.
> So I handled default remap with alias.
> Please suggest the name. MSF2.eNVM.alias sounds fine?

Hmm Peter, Francis?

Personally I prefer "bus_remap.alias" which is explicit.

"eNVM.alias" is only true on Cold Reset.

>>
>> +    vmstate_register_ram_global(nvm);
>>> +
>>> +    memory_region_set_readonly(nvm, true);
>>> +    memory_region_set_readonly(nvm_alias, true);
>>> +
>>> +    memory_region_add_subregion(system_memory, ENVM_BASE_ADDRESS, nvm);
>>> +    memory_region_add_subregion(system_memory, 0, nvm_alias);
>>> +
>>> +    memory_region_init_ram(ddr, NULL, "MSF2.ddr", DDR_SIZE,
>>> +                           &error_fatal);
>>>
>>
>> Wrong, there is no DDR on this SoC.
>>
> DDR controller is there in Smartfusion2 (different from Smartfusion). As
> you said below this
> should be in board file.

There IS a DDRC in this SoC, but here you are registering a DDR 'ram' 
memory region, not a controller. This SoC can be used without any DDR, 
enough using embedded eNVM and eSRAM.

Now it happens your SoM board provides a DDR chip connected to this SoC.

>>
>> +    vmstate_register_ram_global(ddr);
>>> +    memory_region_add_subregion(system_memory, DDR_BASE_ADDRESS, ddr);
>>> +
>>> +    memory_region_init_ram(sram, NULL, "MSF2.sram", SRAM_SIZE,
>>> +                           &error_fatal);
>>>
>>
>> I'd rather like to see it named "eSRAM" somehow, so there is no confusion
>> possible with external SRAM a SoM/board can map at 0x60000000.
>>
>> Same comment than envm_size, sram_size should be a per-model property.
>>
>> OK
>
>> +    vmstate_register_ram_global(sram);
>>> +    memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, sram);
>>> +
>>> +    armv7m = DEVICE(&s->armv7m);
>>> +    qdev_prop_set_uint32(armv7m, "num-irq", 96);
>>>
>>
>> Can you point me to your datasheet? I thought the SF2 had 240 IRQs.
>
>
> Please go to link:
> https://www.microsemi.com/document-portal/search_form
> and provide search keyword as "UG0331". You can the download the spec.
> It has 81 irqs I remember when I have given 81 qemu complained not multiple
> of 4.
> I checked again with 81 and it is fine. I will change it to 81.

Ok :)

> +    qdev_prop_set_string(armv7m, "cpu-model", "cortex-m3");
>>> +    object_property_set_link(OBJECT(&s->armv7m),
>>> OBJECT(get_system_memory()),
>>> +                                     "memory", &error_abort);
[...]
>>> +#define MSF2_NUM_SPIS         2
>>> +#define MSF2_NUM_UARTS        2
>>> +
>>> +#define ENVM_BASE_ADDRESS     0x60000000
>>> +#define ENVM_SIZE             (128 * 1024)
>>>
>>
>> The SoC design ENVM_SIZE is 1MB, 128K seems your particular model.
>>
>
>  M2S010 SoC device has 256K eNMV. My bad it should be 256 instead of 128.
>  The board I have contains M2S010 device in SOM.
>

What I mean here is on the SF2 the eNVM "region size" (as seen by the 
AHB Bus) is 1MB. Now your SoC M2S010 provides 256KB in this dedicated 1M 
region.

I find your #define confusing, what about:

#define ENVM_REGION_SIZE      (1 * M_BYTE)
#define M2S010_ENVM_SIZE      (256 * K_BYTE)

(?_BYTE from "qemu/cutils.h")

I wanted to clarify this because you named your functions as it can 
models any SF2 but actually you restrict it to your M2S010.

Maybe to start you can rename msf2_soc_x() -> m2s010_sf2_soc_x() then if 
needed this can be generalized to other SoCs from SF2 family?

>> +
>>> +#define DDR_BASE_ADDRESS      0xA0000000
>>> +#define DDR_SIZE              (64 * 1024 * 1024)
>>>
>>
>> This belongs to the SoM.
>> Yes will change it.
>>
>>> +
>>> +#define SRAM_BASE_ADDRESS     0x20000000
>>> +#define SRAM_SIZE             (64 * 1024)
>>>
>>
>> Indeed this SoC is designed to have up to 64K of SRAM.
>> Luckily your model provides 64K.
>>
>
>
> Yes it is 64k :)
>

Same here, what you have is:

#define ESRAM_REGION_SIZE     (64 * K_BYTE)
#define M2S010_ESRAM_SIZE     (64 * K_BYTE)

which happens to be equal but does not mean the same, do you see the 
difference?

> +
>>> +typedef struct MSF2State {
>>> +    /*< private >*/
>>> +    SysBusDevice parent_obj;
>>> +    /*< public >*/
>>> +
>>> +    ARMv7MState armv7m;
>>> +
>>> +    MSF2SysregState sysreg;
>>> +    MSF2TimerState timer;
>>> +    MSF2SpiState spi[MSF2_NUM_SPIS];
>>> +} MSF2State;
>>> +
>>> +#endif
