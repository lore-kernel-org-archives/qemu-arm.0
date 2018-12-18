Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3594375wrt;
        Tue, 18 Dec 2018 03:11:06 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Uuwwd0aH6I5mU8Xf9ITM63o6jWEp26G8G6Yar1LRWsZEIkD6K46tEIW9vr9nVDJnS0GS/i
X-Received: by 2002:ae9:eb94:: with SMTP id b142mr14573575qkg.227.1545131466855;
        Tue, 18 Dec 2018 03:11:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1545131466; cv=none;
        d=google.com; s=arc-20160816;
        b=AisgACQjfxB7yR4uOcdtsHyZJ3AMRsfXpURayh1aWw6zEWWlQWcNjBqCINRcDrVmLv
         lq8wFdp9YGx9Xsm+xuKnVjbPoP4QW8M+2JGyxSnW0XX6mTcrT2Ecubx6LIaUz1PCFjrN
         maQ8qkFOrybaUfvl4W5tMlVgBfhO/et0uN6XrODm/AEvCEMQVeOZElnCo/W+5+DxUWHm
         ZTnYprRHyQtlkOe+2Oed+O7RgvcqDhMiL4hGT0m5EZ0R1gmYhw2owL1IInCsP6Tuw88S
         WwSeIuZa0vW3n2Er4EvDQOnXuP0sRk9+oanRldr3tL9WeqLcnZvG1sOz3X5ezH6cKHpD
         fY5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=G75ZNYsN9BJziCRvD71VUhWQ5DSb9jK22nfkDTenOWs=;
        b=IpyI+/jWwZq7aN/u2W9vxA5BRVr/2CRdfV/+pYgoeoyVdJTlOFn7fMMcwbW7tTlr/F
         Vt2aRoFkhtqMC2rMM1u6KNzD6DH4LaM34ksceUNk2BzhsWroNHSrlO7sdwEPXa9aRFpd
         0//+GjjZW0VDJL7SnXxV1fjsAdVuOmfY1l5jf5spi8N/6q/ILCxifaa8RnLJ+G5NKNau
         6nyU7Uc1YO2Ou5JVcdJNRcPnj1IiUmZXpPnU8IPfad8oHonIVicZIzYOXafOVz6nn6Gx
         jXc64HFqoUx5BR+6QOUnyvT8lEL9q7XqvT4Qf2cLhLY77W4r950QJHvTDdqGvePt4eIw
         trdw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n64si888794qtd.105.2018.12.18.03.11.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 18 Dec 2018 03:11:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53119 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gZDHG-0002lz-Av
	for alex.bennee@linaro.org; Tue, 18 Dec 2018 06:11:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41619)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gZDFU-0001Vk-3G
	for qemu-devel@nongnu.org; Tue, 18 Dec 2018 06:09:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gZD1L-0007Bn-QD
	for qemu-devel@nongnu.org; Tue, 18 Dec 2018 05:54:42 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58242)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gZD1I-00078h-7t; Tue, 18 Dec 2018 05:54:36 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6FA6D89ACC;
	Tue, 18 Dec 2018 10:54:35 +0000 (UTC)
Received: from [10.36.117.46] (ovpn-117-46.ams2.redhat.com [10.36.117.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA0576012B;
	Tue, 18 Dec 2018 10:54:33 +0000 (UTC)
To: Andrew Jones <drjones@redhat.com>
References: <20181206170733.7469-1-eric.auger@redhat.com>
	<20181206170733.7469-3-eric.auger@redhat.com>
	<20181217162701.nzdqhccpnhypj2z7@kamzik.brq.redhat.com>
	<f253b6f6-2d2c-1e75-75ee-0dd0072924d1@redhat.com>
	<20181217182546.zym4jhmambkzyigi@kamzik.brq.redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <efbeed1b-2941-dce1-f8e9-14c05733e01e@redhat.com>
Date: Tue, 18 Dec 2018 11:54:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181217182546.zym4jhmambkzyigi@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 18 Dec 2018 10:54:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH-for-4.0 v2 2/2] hw/arm/virt-acpi-build:
 IORT Update for revision D
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org,
	shameerali.kolothum.thodi@huawei.com, shannon.zhaosl@gmail.com,
	qemu-arm@nongnu.org, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h9zDyrphd41H

Hi Drew,

On 12/17/18 7:25 PM, Andrew Jones wrote:
> On Mon, Dec 17, 2018 at 05:49:02PM +0100, Auger Eric wrote:
>> Hi Drew,
>>
>> On 12/17/18 5:27 PM, Andrew Jones wrote:
>>> On Thu, Dec 06, 2018 at 06:07:33PM +0100, Eric Auger wrote:
>>>> Let's update the structs according to revision D of the IORT
>>>> specification and set the IORT node revision fields.
>>>>
>>>> In IORT smmuv3 node: the new proximity field is not used as
>>>> the proximity domain valid flag is not set. The new DeviceId
>>>> mapping index is not used either as all the SMMU control
>>>> interrupts are GSIV based.
>>>>
>>>> In IORT RC node: the new memory address size limit field is
>>>> set to 64 bits.
>>>>
>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>>
>>>> ---
>>>>
>>>> v1 -> v2:
>>>> - separate patches for SMMUv3 DMA coherency issue and struct
>>>>   update to revision D.
>>>> - revision fields set
>>>> ---
>>>>  hw/arm/virt-acpi-build.c    |  4 ++++
>>>>  include/hw/acpi/acpi-defs.h | 10 +++++++++-
>>>>  2 files changed, 13 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>>>> index aa177ba64d..a34a0958a5 100644
>>>> --- a/hw/arm/virt-acpi-build.c
>>>> +++ b/hw/arm/virt-acpi-build.c
>>>> @@ -423,6 +423,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>>>       */
>>>>      iort_node_offset = sizeof(*iort);
>>>>      iort->node_offset = cpu_to_le32(iort_node_offset);
>>>> +    iort->revision = 0;
>>>>  
>>>>      /* ITS group node */
>>>>      node_size =  sizeof(*its) + sizeof(uint32_t);
>>>> @@ -445,6 +446,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>>>  
>>>>          smmu->type = ACPI_IORT_NODE_SMMU_V3;
>>>>          smmu->length = cpu_to_le16(node_size);
>>>> +        smmu->revision = cpu_to_le32(2);
>>>>          smmu->mapping_count = cpu_to_le32(1);
>>>>          smmu->mapping_offset = cpu_to_le32(sizeof(*smmu));
>>>>          smmu->base_address = cpu_to_le64(vms->memmap[VIRT_SMMU].base);
>>>> @@ -470,6 +472,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>>>  
>>>>      rc->type = ACPI_IORT_NODE_PCI_ROOT_COMPLEX;
>>>>      rc->length = cpu_to_le16(node_size);
>>>> +    rc->revision = cpu_to_le32(1);
>>>>      rc->mapping_count = cpu_to_le32(1);
>>>>      rc->mapping_offset = cpu_to_le32(sizeof(*rc));
>>>>  
>>>> @@ -477,6 +480,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>>>      rc->memory_properties.cache_coherency = cpu_to_le32(1);
>>>>      rc->memory_properties.memory_flags = 0x3; /* CCA = CPM = DCAS = 1 */
>>>>      rc->pci_segment_number = 0; /* MCFG pci_segment */
>>>> +    rc->memory_address_limit = 64;
>>>
>>> Hmmm... IIUC this provides the size of the IOVA space. When it's 64 the
>>> size of the space is U64_MAX, which gets added to the DMA base (also 64
>>> bits) when calculating things like the last PFN. It seems strange to use
>>> a value that will surely overflow those calculations. Is it common to
>>> put 64 here? Can you elaborate on this?
>>
>> I looked at drivers/acpi/arm64/iort.c nc_dma_get_range.
>> There you can find
>>
>>         *size = ncomp->memory_address_limit >= 64 ? U64_MAX :
>>                         1ULL<<ncomp->memory_address_limit;
>>
>> So I was expecting the value "64" to be properly handled by the kernel.
> 
> I traced the code further and see that the size gets added to the u64
> dma base without any special checks in both iort_dma_setup() and
> iommu_dma_init_domain(). Also iommu_dma_init_domain() function has this
> comment
> 
>  * @base and @size should be exact multiples of IOMMU page granularity to
>  * avoid rounding surprises. If necessary, we reserve the page at address 0
>  * to ensure it is an invalid IOVA. It is safe to reinitialise a domain, but
>  * any change which could make prior IOVAs invalid will fail.
> 
> U64_MAX is not a multiple of any page size. Maybe that U64_MAX assignment
> is a kernel bug?
Yes most probably the kernel should check address wraps and alignment.
Do you want to send a kernel patch yourself or shall I do?
> 
> 
>> If one decides to select something less than the whole range, which
>> value would you suggest?
> 
> I don't know. Isn't it host/guest/device specific? Should we ask KVM what
> the supported IPA is first? What kind of values are showing up in the
> IORTs of real hardware?
Digging into https://lkml.org/lkml/2017/7/31/472, the field is motivated
for cases where the bus connecting devices to the IOMMU is smaller in
size than the IOMMU input address bits. Architecturally the SMMU input
address space is 64 bits. As the vSMMUv3 only implements stage 1, the
input address is treated as a VA and when bypassed as intermediate
physical address.

My understanding is the VAS (VA size) is max 2x52bits=53 bits for
ARMv8.2. IPA is max 52 bits for 8.2.

But there are cases where the 64b upper byte is used (when TBI is set)
in the translation. I still feel difficult to understand SMMU spec 3.4.1
chapter (Input address size and Virtual Address size).

But anyway I think the kernel should support setting the value to 64bits.

The machines I have access to have Rev 0 IORT table so this field is not
used :-(

Thanks

Eric



> 
>>>
>>>>  
>>>>      /* Identity RID mapping covering the whole input RID range */
>>>>      idmap = &rc->id_mapping_array[0];
>>>> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
>>>> index 532eaf79bd..b4a5104367 100644
>>>> --- a/include/hw/acpi/acpi-defs.h
>>>> +++ b/include/hw/acpi/acpi-defs.h
>>>> @@ -628,7 +628,11 @@ struct AcpiIortItsGroup {
>>>>  } QEMU_PACKED;
>>>>  typedef struct AcpiIortItsGroup AcpiIortItsGroup;
>>>>  
>>>> -#define ACPI_IORT_SMMU_V3_COHACC_OVERRIDE 1
>>>> +enum {
>>>> +    ACPI_IORT_SMMU_V3_COHACC_OVERRIDE = 1 << 0,
>>>> +    ACPI_IORT_SMMU_V3_HTTU_OVERRIDE   = 3 << 1,
>>>> +    ACPI_IORT_SMMU_V3_PXM_VALID       = 1 << 3
>>>> +};
>>>
>>> We don't usually add flag definitions until we need them. Indeed it'll
>>> just be more code to delete when switching to the aml_append* API.
>>
>> The rationale was that those flags becomes usable with this revision so
>> I decided to expose them. Now I don't have a strong opinion here.
> 
> I'd drop the change then.
> 
> Thanks,
> drew
> 
