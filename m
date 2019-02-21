Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp5721637wrx;
        Thu, 21 Feb 2019 04:46:03 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbJMuVTwHCvplJbd/yW7JkKqoC1idJLjK1/aeh/bRliqUTwphpGDMVrfoKhFBu8kKGmjbJc
X-Received: by 2002:a25:660c:: with SMTP id a12mr33087995ybc.211.1550753163559;
        Thu, 21 Feb 2019 04:46:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550753163; cv=none;
        d=google.com; s=arc-20160816;
        b=0VQTFfiOHh8BO3ayk8YTgtYOrvYGNIVKOKrAt+fW0/PZds8hGW2z93O09Har5ozcbw
         Q5NZ5h4a1y/qQw9Y45H4WXM/1wRXj3AuqqGlVzcNqwD65UrTU1OHo7PC8o9q0SWPeBVf
         CYRajz2ERlhCcV+fQlvrKR0kpgy+vF0r9pI0QuqP9xLHjNdQ/94L5J/8dBqdhgeOBqjK
         ao96Uhz19XJeKxFW6KBnafbz8lBgOQMeDHfoXwnTG3DzN4G40Ua791FMO7KrOUv5VwW4
         koBmwQLJLpOPaRaVzbu+0IhzgEeUDVbnwBpfXiCJ+ob3CaTb9LfER1RwEJ37YTf6WSbC
         OCrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=eurwfEAYMA9Utjkcb1acrAZNmUrtirrFNfo6LgClZQk=;
        b=aFy1sjOakphEMRnVl2iWF2/lnoqmXX3fa65f5sdjRU6/hX6w+4VdFS7GZHTozMV2c9
         FIoxXESptpFX4kQlEa3Vu/gPaV21Cj7pBw9QwH7L4xUgmPEt/ONEnL80RRaAzCSB+VJc
         HhCG18gaWBnVDxVU9M6kDeiaR1meQYv1FDt94xi55fAuTWQybdleESRh5NVA7w8JRrRc
         CYn9A4ldvHN+Oxd42S6ZMp70mhSGRBV4cODWwfagWlmYb5QbbCNA235Mz+E+H4Qrzohj
         f7J73sOKfQ84wvAdjcBN/R4rG9aTwz8yAVpkBQSgWKNoKcGRxTBNlOHr6niyL04RAkRO
         ohmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m133si11896251ywc.321.2019.02.21.04.46.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Feb 2019 04:46:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:59533 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gwnjm-0003lH-UP
	for alex.bennee@linaro.org; Thu, 21 Feb 2019 07:46:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52556)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gwnfP-0008EV-Cx
	for qemu-arm@nongnu.org; Thu, 21 Feb 2019 07:41:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gwnZ3-0005Zc-7E
	for qemu-arm@nongnu.org; Thu, 21 Feb 2019 07:34:58 -0500
Received: from mx1.redhat.com ([209.132.183.28]:62887)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gwnZ2-0005Yx-UV; Thu, 21 Feb 2019 07:34:57 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A5360C01DE1F;
	Thu, 21 Feb 2019 12:34:55 +0000 (UTC)
Received: from [10.36.116.102] (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D6AA5D9D3;
	Thu, 21 Feb 2019 12:34:49 +0000 (UTC)
To: Igor Mammedov <imammedo@redhat.com>
References: <20190205173306.20483-1-eric.auger@redhat.com>
	<20190205173306.20483-17-eric.auger@redhat.com>
	<20190218113008.18ead6cb@Igors-MacBook-Pro.local>
	<8d996c45-a338-cc5a-a740-28168c9ba8fc@redhat.com>
	<20190221131640.3656a574@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <47d9d84d-467c-e7f7-33cc-65f11ea2c03e@redhat.com>
Date: Thu, 21 Feb 2019 13:34:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190221131640.3656a574@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 21 Feb 2019 12:34:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 16/18] hw/arm/virt: Add
 nvdimm hot-plug infrastructure
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, david@redhat.com,
	dgilbert@redhat.com, shameerali.kolothum.thodi@huawei.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	eric.auger.pro@gmail.com, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1sWUFD//b7Dh

Hi Igor,

On 2/21/19 1:16 PM, Igor Mammedov wrote:
> On Wed, 20 Feb 2019 16:21:05 +0100
> Auger Eric <eric.auger@redhat.com> wrote:
> 
>> Hi Igor,
>>
>> On 2/18/19 11:30 AM, Igor Mammedov wrote:
>>> On Tue,  5 Feb 2019 18:33:04 +0100
>>> Eric Auger <eric.auger@redhat.com> wrote:
>>>   
>>>> From: Kwangwoo Lee <kwangwoo.lee@sk.com>
>>>>
>>>> Pre-plug and plug handlers are prepared for NVDIMM support.
>>>>
>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>> Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>
>>>> ---
>>>>  default-configs/arm-softmmu.mak |  2 ++
>>>>  hw/arm/virt-acpi-build.c        |  6 ++++++
>>>>  hw/arm/virt.c                   | 22 ++++++++++++++++++++++
>>>>  include/hw/arm/virt.h           |  3 +++
>>>>  4 files changed, 33 insertions(+)
>>>>
>>>> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
>>>> index dc4624794f..ddbe87ed15 100644
>>>> --- a/default-configs/arm-softmmu.mak
>>>> +++ b/default-configs/arm-softmmu.mak
>>>> @@ -162,3 +162,5 @@ CONFIG_HIGHBANK=y
>>>>  CONFIG_MUSICPAL=y
>>>>  CONFIG_MEM_DEVICE=y
>>>>  CONFIG_DIMM=y
>>>> +CONFIG_NVDIMM=y
>>>> +CONFIG_ACPI_NVDIMM=y
>>>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>>>> index 781eafaf5e..f086adfa82 100644
>>>> --- a/hw/arm/virt-acpi-build.c
>>>> +++ b/hw/arm/virt-acpi-build.c
>>>> @@ -784,6 +784,7 @@ static
>>>>  void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>>>>  {
>>>>      VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>>>> +    MachineState *ms = MACHINE(vms);
>>>>      GArray *table_offsets;
>>>>      unsigned dsdt, xsdt;
>>>>      GArray *tables_blob = tables->table_data;
>>>> @@ -824,6 +825,11 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>>>>          }
>>>>      }
>>>>  
>>>> +    if (vms->acpi_nvdimm_state.is_enabled) {
>>>> +        nvdimm_build_acpi(table_offsets, tables_blob, tables->linker,
>>>> +                          &vms->acpi_nvdimm_state, ms->ram_slots);
>>>> +    }
>>>> +
>>>>      if (its_class_name() && !vmc->no_its) {
>>>>          acpi_add_table(table_offsets, tables_blob);
>>>>          build_iort(tables_blob, tables->linker, vms);
>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>>> index b683902991..0c8c2cc191 100644
>>>> --- a/hw/arm/virt.c
>>>> +++ b/hw/arm/virt.c
>>>> @@ -132,6 +132,7 @@ static const MemMapEntry a15memmap[] = {
>>>>      [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
>>>>      [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
>>>>      [VIRT_SMMU] =               { 0x09050000, 0x00020000 },
>>>> +    [VIRT_ACPI_IO] =            { 0x09070000, 0x00010000 },  
>>> where does this range come from and is its size sufficient?  
>> I understand it can be anywhere in low mem and must be large enough to
>> contain [NVDIMM_ACPI_IO_BASE, NDIMM_ACPI_IO_BASE + NVDIMM_ACPI_IO_LEN].
> it looked to like generic ACPI arrea rather than NVDIMM
> so I'd suggest to name it properly and probably use NVDIMM_ACPI_IO_BASE & co
> to add this entry so that reader won't have to wonder where this magic numbers
> come from.
OK. I will rename the region in v8
> 
>> So one 64kB page should do the job?
> Should it be located in lowmem?
> (do we care about device_memory & AVMF & ACPI & not 64bit guests?)
I guess no. We could easily fit this region into the existing low mem
IO, that's what I meant actually.

Thanks

Eric
> 
> 
>> Thanks
>>
>> Eric
>>>   
>>>>      [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
>>>>      /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
>>>>      [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
>>>> @@ -1637,6 +1638,18 @@ static void machvirt_init(MachineState *machine)
>>>>  
>>>>      create_platform_bus(vms, pic);
>>>>  
>>>> +    if (vms->acpi_nvdimm_state.is_enabled) {
>>>> +        AcpiNVDIMMState *acpi_nvdimm_state = &vms->acpi_nvdimm_state;
>>>> +
>>>> +        acpi_nvdimm_state->dsm_io.type = NVDIMM_ACPI_IO_MEMORY;
>>>> +        acpi_nvdimm_state->dsm_io.base =
>>>> +                vms->memmap[VIRT_ACPI_IO].base + NVDIMM_ACPI_IO_BASE;
>>>> +        acpi_nvdimm_state->dsm_io.len = NVDIMM_ACPI_IO_LEN;
>>>> +
>>>> +        nvdimm_init_acpi_state(acpi_nvdimm_state, sysmem,
>>>> +                               vms->fw_cfg, OBJECT(vms));
>>>> +    }
>>>> +
>>>>      vms->bootinfo.ram_size = machine->ram_size;
>>>>      vms->bootinfo.kernel_filename = machine->kernel_filename;
>>>>      vms->bootinfo.kernel_cmdline = machine->kernel_cmdline;
>>>> @@ -1822,10 +1835,19 @@ static void virt_memory_plug(HotplugHandler *hotplug_dev,
>>>>                               DeviceState *dev, Error **errp)
>>>>  {
>>>>      VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
>>>> +    bool is_nvdimm = object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM);
>>>>      Error *local_err = NULL;
>>>>  
>>>>      pc_dimm_plug(PC_DIMM(dev), MACHINE(vms), &local_err);
>>>> +    if (local_err) {
>>>> +        goto out;
>>>> +    }
>>>>  
>>>> +    if (is_nvdimm) {
>>>> +        nvdimm_plug(&vms->acpi_nvdimm_state);
>>>> +    }
>>>> +
>>>> +out:
>>>>      error_propagate(errp, local_err);
>>>>  }
>>>>  
>>>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
>>>> index c88f67a492..56d73b0e86 100644
>>>> --- a/include/hw/arm/virt.h
>>>> +++ b/include/hw/arm/virt.h
>>>> @@ -37,6 +37,7 @@
>>>>  #include "hw/arm/arm.h"
>>>>  #include "sysemu/kvm.h"
>>>>  #include "hw/intc/arm_gicv3_common.h"
>>>> +#include "hw/mem/nvdimm.h"
>>>>  
>>>>  #define NUM_GICV2M_SPIS       64
>>>>  #define NUM_VIRTIO_TRANSPORTS 32
>>>> @@ -77,6 +78,7 @@ enum {
>>>>      VIRT_GPIO,
>>>>      VIRT_SECURE_UART,
>>>>      VIRT_SECURE_MEM,
>>>> +    VIRT_ACPI_IO,
>>>>      VIRT_LOWMEMMAP_LAST,
>>>>  };
>>>>  
>>>> @@ -134,6 +136,7 @@ typedef struct {
>>>>      hwaddr high_io_base;
>>>>      hwaddr highest_gpa;
>>>>      bool extended_memmap;
>>>> +    AcpiNVDIMMState acpi_nvdimm_state;
>>>>  } VirtMachineState;
>>>>  
>>>>  #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)  
>>>   
> 
> 
