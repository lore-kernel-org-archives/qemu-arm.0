Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1259573wrt;
        Wed, 28 Nov 2018 08:42:10 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XqBANIasM+yvA2nz+xOyqg/zu6cYVwdsbxW6FmMFTa4KMCj/WPyc+OuYPdAARj7T8Ncmo+
X-Received: by 2002:a25:cc9:: with SMTP id 192-v6mr39287192ybm.145.1543423330366;
        Wed, 28 Nov 2018 08:42:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543423330; cv=none;
        d=google.com; s=arc-20160816;
        b=0jgjH8I4lYnvpfwpTISuorqRR7LRpuGYzUomrg6kccH16QXNolJHM5ITJU/SewYvTZ
         DJ/zaTD4tILLdJgKH8POn704Ft9pRzCDZN8fraL5lOBG3L5/J7vY7YbXhAewctoJ3/iC
         joHhOyVRXgUdXXGeUX5jViNeUiw41zv4u7uZCqKUM5Olwv3z/Fyx5vHK8mN8xSWtTsA6
         dhYDBM3Lo/RysjDoVUdcXhyf1RTJmHC1wSJc/XvwUcVb5QhR2rSV3Wo9UnhALL703e2N
         6a6p2vINtbJOy/4EWKFxl+l+umR1oHLVrFnVFc0SAWhyswQplx9Aq2re8BtGKNSR5bNk
         AK+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature;
        bh=pCNax6ntUa/wA6NKRVM12j5eswBnTjPO7ZiZkKFwWi8=;
        b=asgvSw2sb3s3ECiA8e/KpokKlCn22OicM/6y6N0XVcYAvCnb0M6LsXLij58g5OZC68
         IUZC2ISEeLdXdvwVwEF5TnHliEsjjGv+ELqDsd308XsL2Q0t9kjukXyZFUohiUNdoD1C
         z7Cqsi1yWmGxcWbEvFfTmrDo6cKPyL2d3Fek5hQIlqvC3KiB5zWYJHwFYhZLZnBApup7
         5e7H58hZBsOHTLIlhgCJUiAzWvU/i6V/mvHiFtL/uRutkaCsQQkjrAXzfOEy2HlqEbOY
         D8BzSTcRZu/QcEynbmNX5eNNKKwGO/nODPv1Z3NoNpSK7d8THp7Z8fGNT4pBtMUbYmzF
         b8vg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="NPnAR/UZ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i10si5355436ywa.64.2018.11.28.08.42.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Nov 2018 08:42:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="NPnAR/UZ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48611 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gS2uf-00061r-Pr
	for alex.bennee@linaro.org; Wed, 28 Nov 2018 11:42:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37493)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhaosl@gmail.com>) id 1gS2uN-000610-1u
	for qemu-arm@nongnu.org; Wed, 28 Nov 2018 11:41:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhaosl@gmail.com>) id 1gS2u0-0001ph-EJ
	for qemu-arm@nongnu.org; Wed, 28 Nov 2018 11:41:34 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:35567)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <shannon.zhaosl@gmail.com>)
	id 1gS2u0-0001oW-6F; Wed, 28 Nov 2018 11:41:28 -0500
Received: by mail-ot1-x341.google.com with SMTP id 81so24137978otj.2;
	Wed, 28 Nov 2018 08:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=pCNax6ntUa/wA6NKRVM12j5eswBnTjPO7ZiZkKFwWi8=;
	b=NPnAR/UZM1p9Kfl4DzmErWGsLFtgoKse4xJJMbFp59+Sm+iTi59qt9Ry9cwY9t2Us1
	BcpvKbDDtZvlLD5L9tOTpw5fVoZ9DtWqZ5EEZGDtudfmwP5NrymGxH3MM6N3ZKUcgPvl
	KcrGRrAUgcLad5N1eNQGGgpsA3HKAjBpRsEwHNgn+UMEX6yTUYfc2B1ziJQTkCp8WsZG
	YKLs16mrdUsX3Kl8dL3vDNzzlm0fN4wYTIAMmZ2U8sTdFnuSBcXzI+AOBFA7N1p0JBMA
	6gz8LHnDEOVXgZGSaJHOHe/TcF1cvKAT3a4aiA/C6dl+DwQ1PSJ+TqozlDDddRooU2zJ
	ffhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=pCNax6ntUa/wA6NKRVM12j5eswBnTjPO7ZiZkKFwWi8=;
	b=rFHucY0QNX+fAYl4zCh4sXH4GgqQ/9K8V/KHXVFdzTsOJvFJCDWW+KvAovxcctv6gV
	rvyQCYBKPh8MqiZUuMQvJNQqCZlmlhUtkN3VZw25oGC+a1BJscbYLxHhyBQfxO/FQ/fz
	pmHFDMFPnbulqBdr7Y0+7dYwJeJDCkHtCwhXOea/1xB0+9XvdQcmDGEQ+oT+45rZcv6s
	qvBxj+7Zn1CgkZ+wuxpSpDwovif6jsuj8YDt72i1DsBlyuN7TRlDMFwGel98fKNmEVRy
	oYOSpawaOb5kLna1Bxx7/kWL/R863ld5A13/NBxI4TTIZb67rdE/hO0eUbgQ3tvOaaD6
	szDg==
X-Gm-Message-State: AA+aEWYZLSwela8oi0QHf38cuaYPLDRSLuPO3RnPRhBRMtWAckZOhI93
	jm3yKffyO4rri7cvLcdbbuY=
X-Received: by 2002:a9d:5c88:: with SMTP id a8mr19894179oti.64.1543423286368; 
	Wed, 28 Nov 2018 08:41:26 -0800 (PST)
Received: from [192.168.31.238] ([125.121.16.78])
	by smtp.gmail.com with ESMTPSA id
	h16sm2659217otl.29.2018.11.28.08.40.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Nov 2018 08:41:25 -0800 (PST)
To: Auger Eric <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20181126154616.18173-1-eric.auger@redhat.com>
	<b3c22264-2a95-b851-025c-b8ff0f38f269@redhat.com>
From: Shannon Zhao <shannon.zhaosl@gmail.com>
Message-ID: <65b68704-2c0b-e9b9-2cde-fea5c32161b3@gmail.com>
Date: Thu, 29 Nov 2018 00:39:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <b3c22264-2a95-b851-025c-b8ff0f38f269@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-3.1] hw/arm/virt-acpi-build:
 Fix SMMUv3 ACPI integration
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
Cc: shameerali.kolothum.thodi@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: foY6UsbbwetY



On 2018/11/27 13:53, Auger Eric wrote:
> Hi Shannon,
> 
> On 11/26/18 4:46 PM, Eric Auger wrote:
>> The AcpiIortSmmu3 misses 2 32b fields corresponding to the
>> proximity domain and the device id mapping index.
> I fail to understand how we currently track the evolutions of the IORT
> structures:
> 
> Looking at the smmuv3 node in kernel include/acpi/actbl2.h
> 
> - the following fields were added in c944230064eb  ACPICA: iasl: Update
> to IORT SMMUv3 disassembling (1 year, 4 months ago)
> 	u8 pxm;
> 	u8 reserved1;
> 	u16 reserved2;
> - id_mapping_index was added in 4c106aa411ee  ACPICA: iasl: Add SMMUv3
> device ID mapping index support (1 year ago)
> - current u32 pxm was introduced in d87be0438e3d  ACPICA: IORT: Update
> for revision D (6 months ago)
> 
> I would have expected each of those evolutions to be tagged by a
> revision increment in the acpi_iort_node.revision field but this is not
> done. Also I fail to see any enum for encoding the revision.
> 
> The smmuv3 struct that has been exposed until now corresponds to Rev C
> https://lists.linuxfoundation.org/pipermail/iommu/2017-May/022000.html
> (0c2021c047ba  ACPICA: IORT: Update SMMU models for revision C (1 year,
> 4 months ago)
> 
> Also I noticed that in rev D, new fields were added in struct
> acpi_iort_root_complex. We miss them at the moment in the IORT description.
> 
> How does the guest kernel know which revision of the IORT is exposed?
> What do I miss?
> 
Look at the kernel code in iort.c it checks if the flags field has set 
ACPI_IORT_SMMU_V3_PXM_VALID bit.

	if (smmu->flags & ACPI_IORT_SMMU_V3_PXM_VALID) {
		set_dev_node(dev, acpi_map_pxm_to_node(smmu->pxm));
		pr_info("SMMU-v3[%llx] Mapped to Proximity domain %d\n",
			smmu->base_address,
			smmu->pxm);
	}

But it doesn't check the revision I think the reason is that revision 1 
& 2 just use the next reserved fields. No matter u8 or u32, kernel 
driver get the same value.

The code handling id_mapping_index does check the revision.

static int iort_get_id_mapping_index(struct acpi_iort_node *node)
{
	struct acpi_iort_smmu_v3 *smmu;

	switch (node->type) {
	case ACPI_IORT_NODE_SMMU_V3:
		/*
		 * SMMUv3 dev ID mapping index was introduced in revision 1
		 * table, not available in revision 0
		 */
		if (node->revision < 1)
			return -EINVAL;

> Thanks
> 
> Eric
> 
>>
>> Also let's report IO-coherent access is supported for
>> translation table walks, descriptor fetches and queues by
>> setting the COHACC override flag. Without that, we observe
>> wrong command opcodes. The DT description also advertises
>> the dma coherency.
>>
>> Fixes a703b4f6c1ee ("hw/arm/virt-acpi-build: Add smmuv3 node in IORT table")
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Reported-by: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
>> ---
>>   hw/arm/virt-acpi-build.c    | 1 +
>>   include/hw/acpi/acpi-defs.h | 8 ++++++++
>>   2 files changed, 9 insertions(+)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index 5785fb697c..aa177ba64d 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -448,6 +448,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>           smmu->mapping_count = cpu_to_le32(1);
>>           smmu->mapping_offset = cpu_to_le32(sizeof(*smmu));
>>           smmu->base_address = cpu_to_le64(vms->memmap[VIRT_SMMU].base);
>> +        smmu->flags = ACPI_IORT_SMMU_V3_COHACC_OVERRIDE;
>>           smmu->event_gsiv = cpu_to_le32(irq);
>>           smmu->pri_gsiv = cpu_to_le32(irq + 1);
>>           smmu->gerr_gsiv = cpu_to_le32(irq + 2);
>> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
>> index af8e023968..c3ee1f517b 100644
>> --- a/include/hw/acpi/acpi-defs.h
>> +++ b/include/hw/acpi/acpi-defs.h
>> @@ -628,6 +628,12 @@ struct AcpiIortItsGroup {
>>   } QEMU_PACKED;
>>   typedef struct AcpiIortItsGroup AcpiIortItsGroup;
>>   
>> +enum {
>> +    ACPI_IORT_SMMU_V3_COHACC_OVERRIDE = 1 << 0,
>> +    ACPI_IORT_SMMU_V3_HTTU_OVERRIDE   = 3 << 1,
>> +    ACPI_IORT_SMMU_V3_PXM_VALID       = 1 << 3
>> +};
>> +
>>   struct AcpiIortSmmu3 {
>>       ACPI_IORT_NODE_HEADER_DEF
>>       uint64_t base_address;
>> @@ -639,6 +645,8 @@ struct AcpiIortSmmu3 {
>>       uint32_t pri_gsiv;
>>       uint32_t gerr_gsiv;
>>       uint32_t sync_gsiv;
>> +    uint32_t pxm;
So if we use this field ,we need to set the flags with 
ACPI_IORT_SMMU_V3_PXM_VALID.
>> +    uint32_t id_mapping_index;
And if we use this field, it needs to set the revision to at least 1.

Thanks,
Shannon
>>       AcpiIortIdMapping id_mapping_array[0];
>>   } QEMU_PACKED;
>>   typedef struct AcpiIortSmmu3 AcpiIortSmmu3;
>>
