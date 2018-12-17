Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2677052wrt;
        Mon, 17 Dec 2018 08:15:34 -0800 (PST)
X-Google-Smtp-Source: AFSGD/V3EOSbgJ80w1TRKuEw0NWCUc0CFzNlyaA40SBW/NIx5TQiD11cRIJimjfcbtWSzAu31klB
X-Received: by 2002:a37:5f05:: with SMTP id t5mr13185142qkb.47.1545063334494;
        Mon, 17 Dec 2018 08:15:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1545063334; cv=none;
        d=google.com; s=arc-20160816;
        b=g9MrTYkT33alyeawswCxsnOw8hf9Ro+O4DJuIiPU9BLV2dbUnJy97uglRhfywUwhXU
         f44Bv9RYc0Px8YrA2NLFII+T5kz4BbpdvXYaV9H3xyYsIE8ylfoHtQTKJloa3wcW4IpD
         xowhK8aCnzTO49RLNCFbe32CbVh1l/RWQGV1TNDcFhfjUkFgzboBcr4C7DlrrXCfG2nT
         Q9HI8w64+n6K1ryHyX9okGDdwqdQKOStH9rOumhXkVu9cE/D3KRG5Fq6+mAAkI5TAKkt
         odI4DM0RpgxJt27invKqZD6K5IY3dqapMt4Zo6u37i++fKI/icG9WX1zDzNPFESxuXks
         EEGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=6l9ZCbAYrYHOro2EXpAoqIfFQELxRuwJA0NnJ4yKWY8=;
        b=jTi8f6HJqbytT2ooP02cpGKaXo2UX6yugeoUUF145iTfs8TF23rQZ2RJEE0r9QPPc/
         kHNjAG9Sp0H2l3P3y6LnFY2MuC7y1hMpI0zC5iJ5+7Dtfuv19LDp9RTQmy7jr5NDShdA
         8674UL3WJCxcofdAPyUKJB2tHSUU/eMOeBg2p147vs6UZ4mUNFy3Ly4OyRMiVl7+Ja5M
         ltZaQ91XXPX2irDDs283U+oZKEGIJc9tFkjFb68LN3W112dLRMo/M7uIU2cZRFitEjzW
         oe2llcxVuN5ZUj5c4MiJREVWXe2h0Vg+Y6z9aIzg9xvK1K+B20fjzJdFK/HBpt2ljczR
         KDMA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z33si4882qtd.26.2018.12.17.08.15.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Dec 2018 08:15:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47656 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gYvYL-0004Hb-Vr
	for alex.bennee@linaro.org; Mon, 17 Dec 2018 11:15:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48556)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gYvY3-0004Fr-Ar
	for qemu-arm@nongnu.org; Mon, 17 Dec 2018 11:15:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gYvXx-0004C1-To
	for qemu-arm@nongnu.org; Mon, 17 Dec 2018 11:15:15 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38872)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gYvXx-000441-Gb; Mon, 17 Dec 2018 11:15:09 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5E8C681138;
	Mon, 17 Dec 2018 16:15:00 +0000 (UTC)
Received: from [10.36.117.46] (ovpn-117-46.ams2.redhat.com [10.36.117.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BA271A91F;
	Mon, 17 Dec 2018 16:14:56 +0000 (UTC)
To: Andrew Jones <drjones@redhat.com>
References: <20181206170733.7469-1-eric.auger@redhat.com>
	<20181206170733.7469-2-eric.auger@redhat.com>
	<20181217160208.uhz5pjr2yxxosljw@kamzik.brq.redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <879821e3-7667-18d0-20d9-c4c573e1caeb@redhat.com>
Date: Mon, 17 Dec 2018 17:14:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181217160208.uhz5pjr2yxxosljw@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 17 Dec 2018 16:15:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH-for-4.0 v2 1/2]
 hw/arm/virt-acpi-build: Set COHACC override flag in IORT SMMUv3 node
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
X-TUID: dKywQpdgyCKc

Hi Drew,

On 12/17/18 5:02 PM, Andrew Jones wrote:
> On Thu, Dec 06, 2018 at 06:07:32PM +0100, Eric Auger wrote:
>> Let's report IO-coherent access is supported for translation
>> table walks, descriptor fetches and queues by setting the COHACC
>> override flag. Without that, we observe wrong command opcodes.
>> The DT description also advertises the dma coherency.
>>
>> Fixes a703b4f6c1ee ("hw/arm/virt-acpi-build: Add smmuv3 node in IORT table")
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Reported-by: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
>> Tested-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
>>
>> ---
>>
>> - change the commit title
>> - addition of new fields (pxm and id_mapping_index) done in a
>>   separate patch
>> ---
>>  hw/arm/virt-acpi-build.c    | 1 +
>>  include/hw/acpi/acpi-defs.h | 2 ++
>>  2 files changed, 3 insertions(+)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index 5785fb697c..aa177ba64d 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -448,6 +448,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>          smmu->mapping_count = cpu_to_le32(1);
>>          smmu->mapping_offset = cpu_to_le32(sizeof(*smmu));
>>          smmu->base_address = cpu_to_le64(vms->memmap[VIRT_SMMU].base);
>> +        smmu->flags = ACPI_IORT_SMMU_V3_COHACC_OVERRIDE;
> 
> Flags are 4 bytes in length, so you need cpu_to_le32()
Hum right!
> 
>>          smmu->event_gsiv = cpu_to_le32(irq);
>>          smmu->pri_gsiv = cpu_to_le32(irq + 1);
>>          smmu->gerr_gsiv = cpu_to_le32(irq + 2);
>> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
>> index af8e023968..532eaf79bd 100644
>> --- a/include/hw/acpi/acpi-defs.h
>> +++ b/include/hw/acpi/acpi-defs.h
>> @@ -628,6 +628,8 @@ struct AcpiIortItsGroup {
>>  } QEMU_PACKED;
>>  typedef struct AcpiIortItsGroup AcpiIortItsGroup;
>>  
>> +#define ACPI_IORT_SMMU_V3_COHACC_OVERRIDE 1
>> +
>>  struct AcpiIortSmmu3 {
>>      ACPI_IORT_NODE_HEADER_DEF
>>      uint64_t base_address;
>> -- 
>> 2.17.2
>>
>>
> 
> Probably not necessary for this series, but we should really switch all
> table generators to the aml_append* API.
Agreed, I will prepare a separate series for that improvement.

> 
> Besides the missing cpu_to_le32(),
> 
> Reviewed-by: Andrew Jones <drjones@redhat.com>
Thanks

Eric
> 
