Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp58959wrt;
        Mon, 26 Nov 2018 09:38:42 -0800 (PST)
X-Google-Smtp-Source: AFSGD/U4mClTUtGBt02c+4tVYQV7EpjkOyE+8qXBDNZrjVWi7nnfyqSo2PRoP1j2c7JKDeuUCMbD
X-Received: by 2002:a81:ae06:: with SMTP id m6mr29115316ywh.416.1543253921968;
        Mon, 26 Nov 2018 09:38:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543253921; cv=none;
        d=google.com; s=arc-20160816;
        b=ciuMKJiR3oF0cErfGnVx6MCMTKWGBXEO4NxelXoBeaLykv89ybww6GP8UpH0VCSOnd
         B9EFiRhULcaz+tRrxZKGU3+usuxvxUdQTfFEBDAlUBbZHuP9oLbrXzkujyinhvoJrm3R
         qh25bFc7bm/BlTwGJc3QjDWO5pEFTZuOV/YMemhX7TVTQ1VENtDxDjNJ8J/0iUDv+529
         5xQ/0vnYA8dT/UxoDpTIi6GXgS0mPEDryMcyGiy+j+0YaTjdf6tkSrIw7S3N3gWJQNhl
         RzkmYSzwUQsb5EKg/YsdCuQWb2AFmfkEfwqogtSDt3nFhkssJTkglN4Nk1B06hYx6OyZ
         4AtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=FkItK9Bwio37xgF4lg0NOOslvjiprhRXzsKlAQJd6y4=;
        b=ziSeUNfOz1oQM+bb/Zy65pS8m1oTi8enO1xiWRUXCnLKLwOZEVO2RoBjKmqSsyk2hx
         iPJQUrxCYNF73CueNMeykDbX5oe4/WKAfhKe9QNaAgTDjIN0IDj3pGt/z7ypmvHUCsOT
         IqjZk4wqaUv12GixR2IPaUd4KEjwk6DIgS8zxgyk1KKM7sTbWzdA4/4xi1Pm/nYsiCX8
         2j+zooOiHallLrPMCyCC0loncJg1QeVMi6sbJyU+S2InOi8zAXuPsUiu0JRWnv0Ph2dc
         HAPPJFKLOUDvku/LB5960WdoCzbu76TYopTSSU2BDD1W+CrvcR/O+kwCFVYcIF+aUPFy
         mVVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z206-v6si684018ywb.239.2018.11.26.09.38.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Nov 2018 09:38:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38002 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRKqH-0003YK-DK
	for alex.bennee@linaro.org; Mon, 26 Nov 2018 12:38:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33036)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gRKq6-0003Xc-Oe
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 12:38:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gRKq2-0003ad-IY
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 12:38:30 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38132)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gRKq2-0003Yg-9j; Mon, 26 Nov 2018 12:38:26 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A84AD306B661;
	Mon, 26 Nov 2018 17:38:23 +0000 (UTC)
Received: from [10.36.116.102] (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 19946424B;
	Mon, 26 Nov 2018 17:38:21 +0000 (UTC)
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>
References: <20181126154616.18173-1-eric.auger@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA83885CFB0@FRAEML521-MBB.china.huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <8464018b-334e-6dff-151d-b70a06f63311@redhat.com>
Date: Mon, 26 Nov 2018 18:38:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <5FC3163CFD30C246ABAA99954A238FA83885CFB0@FRAEML521-MBB.china.huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Mon, 26 Nov 2018 17:38:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
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
Cc: "xuwei \(O\)" <xuwei5@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: L30sROkrC+JU

Hi Shameer,
On 11/26/18 6:04 PM, Shameerali Kolothum Thodi wrote:
> Hi Eric,
> 
>> -----Original Message-----
>> From: Eric Auger [mailto:eric.auger@redhat.com]
>> Sent: 26 November 2018 15:46
>> To: eric.auger.pro@gmail.com; eric.auger@redhat.com; qemu-
>> devel@nongnu.org; qemu-arm@nongnu.org; peter.maydell@linaro.org;
>> shannon.zhaosl@gmail.com
>> Cc: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
>> Subject: [PATCH for-3.1] hw/arm/virt-acpi-build: Fix SMMUv3 ACPI integration
>>
>> The AcpiIortSmmu3 misses 2 32b fields corresponding to the
>> proximity domain and the device id mapping index.
>>
>> Also let's report IO-coherent access is supported for
>> translation table walks, descriptor fetches and queues by
>> setting the COHACC override flag. Without that, we observe
>> wrong command opcodes. The DT description also advertises
>> the dma coherency.
> 
> Ah..that explains the "IDR0.COHACC overridden" and "CMD_SYNC timeout "
> entries in the boot log.  Thanks for the fix and I can confirm this fixes the issue
> reported earlier[1]. 
> 
> FWIW:
> Tested-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Many thanks!

Best Regards

Eric
> 
> Thanks,
> Shameer
> 
> [1] https://patchwork.kernel.org/cover/10609261/
> 
>> Fixes a703b4f6c1ee ("hw/arm/virt-acpi-build: Add smmuv3 node in IORT
>> table")
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Reported-by: Shameerali Kolothum Thodi
>> <shameerali.kolothum.thodi@huawei.com>
>> ---
>>  hw/arm/virt-acpi-build.c    | 1 +
>>  include/hw/acpi/acpi-defs.h | 8 ++++++++
>>  2 files changed, 9 insertions(+)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index 5785fb697c..aa177ba64d 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -448,6 +448,7 @@ build_iort(GArray *table_data, BIOSLinker *linker,
>> VirtMachineState *vms)
>>          smmu->mapping_count = cpu_to_le32(1);
>>          smmu->mapping_offset = cpu_to_le32(sizeof(*smmu));
>>          smmu->base_address = cpu_to_le64(vms->memmap[VIRT_SMMU].base);
>> +        smmu->flags = ACPI_IORT_SMMU_V3_COHACC_OVERRIDE;
>>          smmu->event_gsiv = cpu_to_le32(irq);
>>          smmu->pri_gsiv = cpu_to_le32(irq + 1);
>>          smmu->gerr_gsiv = cpu_to_le32(irq + 2);
>> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
>> index af8e023968..c3ee1f517b 100644
>> --- a/include/hw/acpi/acpi-defs.h
>> +++ b/include/hw/acpi/acpi-defs.h
>> @@ -628,6 +628,12 @@ struct AcpiIortItsGroup {
>>  } QEMU_PACKED;
>>  typedef struct AcpiIortItsGroup AcpiIortItsGroup;
>>
>> +enum {
>> +    ACPI_IORT_SMMU_V3_COHACC_OVERRIDE = 1 << 0,
>> +    ACPI_IORT_SMMU_V3_HTTU_OVERRIDE   = 3 << 1,
>> +    ACPI_IORT_SMMU_V3_PXM_VALID       = 1 << 3
>> +};
>> +
>>  struct AcpiIortSmmu3 {
>>      ACPI_IORT_NODE_HEADER_DEF
>>      uint64_t base_address;
>> @@ -639,6 +645,8 @@ struct AcpiIortSmmu3 {
>>      uint32_t pri_gsiv;
>>      uint32_t gerr_gsiv;
>>      uint32_t sync_gsiv;
>> +    uint32_t pxm;
>> +    uint32_t id_mapping_index;
>>      AcpiIortIdMapping id_mapping_array[0];
>>  } QEMU_PACKED;
>>  typedef struct AcpiIortSmmu3 AcpiIortSmmu3;
>> --
>> 2.17.2
> 
> 
