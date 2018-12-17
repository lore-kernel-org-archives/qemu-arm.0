Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2712167wrt;
        Mon, 17 Dec 2018 08:49:26 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XiXt0vew31zSRU6f3LhSyv/+zG2+fFwyLimGuUNroCUUVLax50MrVznUtoAeBXYSYq4vYN
X-Received: by 2002:ac8:1873:: with SMTP id n48mr13895535qtk.10.1545065366695;
        Mon, 17 Dec 2018 08:49:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1545065366; cv=none;
        d=google.com; s=arc-20160816;
        b=aH/6n9XIGwnrl1OIEP/BLplkCY8nayqI/YqyCf1gUCuFAcP+VzKHSHn0ix98hZMm7g
         i9iUs1NE9xaVZMvOPEDeUGHugf781onMjhM16kd8+6dp9Pkslf6M/ia4zTeh+Vf2UEzU
         LClwmubtbTenEM5DC3l6mLSuCHn1zZ0jxo1I8eQAKcIIzeOUt8IQgyBh86hLx03oc5oL
         Ge+DOkd35YAAgfcfiNjPGZv9dVNtPwkl4ATZu/a2pLFhIefeDdAe8ChOs2K3buVpyP5/
         hlPbUZo8x2/Dq3t/AQGAqgIQGzj9rFlGYBBXpCSskCRhQEueuEJwtAPttDzSlcO4HZhd
         AmPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=6JxjY9feIlku9uRsg0zpZlogS/BOO2OkZMP00GZJA48=;
        b=hLpYTAxq6crEgmgKhSymftIHV/6CvgEmrnlG1IOaPp4xHDjdpyyliREomc9PnEY+IN
         EoUfUkvtWMT5XJQtR1w5d/EbROfF1xej4KQx81MhP+/W5J/XY/SvY72ngvXnB9Pn0IOy
         jsGjcqf/PDr1a+t4oISlYSgdAoi24B6GYPXfcFGiOvCT/+qykLQbhhR8gwdqLzA4PduR
         +ointTRgEGjFNmsfiuJNRn+u/mSYFc6UxhEw0RYQO4B/OCd4on1Xx0iWM83aIVsHRkyu
         qpN2fjluk1NnR42QG0yacUw8/yjP086LR21r9CYCu5Y6ekRCvL5fSpMJBgi7haWanvpJ
         rkJA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c3si3868461qtq.11.2018.12.17.08.49.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Dec 2018 08:49:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47841 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gYw58-0003FL-4r
	for alex.bennee@linaro.org; Mon, 17 Dec 2018 11:49:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59728)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gYw4t-0003DG-Sa
	for qemu-arm@nongnu.org; Mon, 17 Dec 2018 11:49:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gYw4o-0006JN-Oq
	for qemu-arm@nongnu.org; Mon, 17 Dec 2018 11:49:11 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60058)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gYw4o-0006IE-EA; Mon, 17 Dec 2018 11:49:06 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 523F8EB9A3;
	Mon, 17 Dec 2018 16:49:05 +0000 (UTC)
Received: from [10.36.117.46] (ovpn-117-46.ams2.redhat.com [10.36.117.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B486E60C47;
	Mon, 17 Dec 2018 16:49:03 +0000 (UTC)
To: Andrew Jones <drjones@redhat.com>
References: <20181206170733.7469-1-eric.auger@redhat.com>
	<20181206170733.7469-3-eric.auger@redhat.com>
	<20181217162701.nzdqhccpnhypj2z7@kamzik.brq.redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <f253b6f6-2d2c-1e75-75ee-0dd0072924d1@redhat.com>
Date: Mon, 17 Dec 2018 17:49:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181217162701.nzdqhccpnhypj2z7@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 17 Dec 2018 16:49:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH-for-4.0 v2 2/2]
 hw/arm/virt-acpi-build: IORT Update for revision D
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org,
	shameerali.kolothum.thodi@huawei.com, shannon.zhaosl@gmail.com,
	qemu-arm@nongnu.org, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7m/+WcuTYpDC

Hi Drew,

On 12/17/18 5:27 PM, Andrew Jones wrote:
> On Thu, Dec 06, 2018 at 06:07:33PM +0100, Eric Auger wrote:
>> Let's update the structs according to revision D of the IORT
>> specification and set the IORT node revision fields.
>>
>> In IORT smmuv3 node: the new proximity field is not used as
>> the proximity domain valid flag is not set. The new DeviceId
>> mapping index is not used either as all the SMMU control
>> interrupts are GSIV based.
>>
>> In IORT RC node: the new memory address size limit field is
>> set to 64 bits.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>>
>> v1 -> v2:
>> - separate patches for SMMUv3 DMA coherency issue and struct
>>   update to revision D.
>> - revision fields set
>> ---
>>  hw/arm/virt-acpi-build.c    |  4 ++++
>>  include/hw/acpi/acpi-defs.h | 10 +++++++++-
>>  2 files changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index aa177ba64d..a34a0958a5 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -423,6 +423,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>       */
>>      iort_node_offset = sizeof(*iort);
>>      iort->node_offset = cpu_to_le32(iort_node_offset);
>> +    iort->revision = 0;
>>  
>>      /* ITS group node */
>>      node_size =  sizeof(*its) + sizeof(uint32_t);
>> @@ -445,6 +446,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>  
>>          smmu->type = ACPI_IORT_NODE_SMMU_V3;
>>          smmu->length = cpu_to_le16(node_size);
>> +        smmu->revision = cpu_to_le32(2);
>>          smmu->mapping_count = cpu_to_le32(1);
>>          smmu->mapping_offset = cpu_to_le32(sizeof(*smmu));
>>          smmu->base_address = cpu_to_le64(vms->memmap[VIRT_SMMU].base);
>> @@ -470,6 +472,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>  
>>      rc->type = ACPI_IORT_NODE_PCI_ROOT_COMPLEX;
>>      rc->length = cpu_to_le16(node_size);
>> +    rc->revision = cpu_to_le32(1);
>>      rc->mapping_count = cpu_to_le32(1);
>>      rc->mapping_offset = cpu_to_le32(sizeof(*rc));
>>  
>> @@ -477,6 +480,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>      rc->memory_properties.cache_coherency = cpu_to_le32(1);
>>      rc->memory_properties.memory_flags = 0x3; /* CCA = CPM = DCAS = 1 */
>>      rc->pci_segment_number = 0; /* MCFG pci_segment */
>> +    rc->memory_address_limit = 64;
> 
> Hmmm... IIUC this provides the size of the IOVA space. When it's 64 the
> size of the space is U64_MAX, which gets added to the DMA base (also 64
> bits) when calculating things like the last PFN. It seems strange to use
> a value that will surely overflow those calculations. Is it common to
> put 64 here? Can you elaborate on this?

I looked at drivers/acpi/arm64/iort.c nc_dma_get_range.
There you can find

        *size = ncomp->memory_address_limit >= 64 ? U64_MAX :
                        1ULL<<ncomp->memory_address_limit;

So I was expecting the value "64" to be properly handled by the kernel.
If one decides to select something less than the whole range, which
value would you suggest?
> 
>>  
>>      /* Identity RID mapping covering the whole input RID range */
>>      idmap = &rc->id_mapping_array[0];
>> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
>> index 532eaf79bd..b4a5104367 100644
>> --- a/include/hw/acpi/acpi-defs.h
>> +++ b/include/hw/acpi/acpi-defs.h
>> @@ -628,7 +628,11 @@ struct AcpiIortItsGroup {
>>  } QEMU_PACKED;
>>  typedef struct AcpiIortItsGroup AcpiIortItsGroup;
>>  
>> -#define ACPI_IORT_SMMU_V3_COHACC_OVERRIDE 1
>> +enum {
>> +    ACPI_IORT_SMMU_V3_COHACC_OVERRIDE = 1 << 0,
>> +    ACPI_IORT_SMMU_V3_HTTU_OVERRIDE   = 3 << 1,
>> +    ACPI_IORT_SMMU_V3_PXM_VALID       = 1 << 3
>> +};
> 
> We don't usually add flag definitions until we need them. Indeed it'll
> just be more code to delete when switching to the aml_append* API.

The rationale was that those flags becomes usable with this revision so
I decided to expose them. Now I don't have a strong opinion here.

Thanks

Eric
> 
>>  
>>  struct AcpiIortSmmu3 {
>>      ACPI_IORT_NODE_HEADER_DEF
>> @@ -641,6 +645,8 @@ struct AcpiIortSmmu3 {
>>      uint32_t pri_gsiv;
>>      uint32_t gerr_gsiv;
>>      uint32_t sync_gsiv;
>> +    uint32_t pxm;
>> +    uint32_t id_mapping_index;
>>      AcpiIortIdMapping id_mapping_array[0];
>>  } QEMU_PACKED;
>>  typedef struct AcpiIortSmmu3 AcpiIortSmmu3;
>> @@ -650,6 +656,8 @@ struct AcpiIortRC {
>>      AcpiIortMemoryAccess memory_properties;
>>      uint32_t ats_attribute;
>>      uint32_t pci_segment_number;
>> +    uint8_t memory_address_limit;
>> +    uint8_t reserved2[3];
>>      AcpiIortIdMapping id_mapping_array[0];
>>  } QEMU_PACKED;
>>  typedef struct AcpiIortRC AcpiIortRC;
>> -- 
>> 2.17.2
>>
>>
> 
> Thanks,
> drew
> 
