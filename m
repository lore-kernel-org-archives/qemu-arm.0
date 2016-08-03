Received: by 10.25.21.156 with SMTP id 28csp591137lfv;
        Wed, 3 Aug 2016 00:22:31 -0700 (PDT)
X-Received: by 10.200.57.34 with SMTP id s31mr106599021qtb.49.1470208951194;
        Wed, 03 Aug 2016 00:22:31 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c68si1439103qkb.126.2016.08.03.00.22.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Aug 2016 00:22:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60684 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bUqVa-00076h-LQ
	for alex.bennee@linaro.org; Wed, 03 Aug 2016 03:22:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41661)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bUqVV-00076a-9k
	for qemu-arm@nongnu.org; Wed, 03 Aug 2016 03:22:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bUqVR-0000vY-0T
	for qemu-arm@nongnu.org; Wed, 03 Aug 2016 03:22:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38928)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>)
	id 1bUqVQ-0000vQ-OB; Wed, 03 Aug 2016 03:22:20 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D8425201FA;
	Wed,  3 Aug 2016 07:22:18 +0000 (UTC)
Received: from localhost.localdomain (vpn1-7-60.ams2.redhat.com [10.36.7.60])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u737MEUE015253
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 3 Aug 2016 03:22:15 -0400
To: Shannon Zhao <zhaoshenglong@huawei.com>, eric.auger.pro@gmail.com,
	peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	p.fedin@samsung.com
References: <1470161247-10251-1-git-send-email-eric.auger@redhat.com>
	<1470161247-10251-8-git-send-email-eric.auger@redhat.com>
	<57A1412A.8070407@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <efbf113d-311a-0279-8808-bbbb30a438ed@redhat.com>
Date: Wed, 3 Aug 2016 09:22:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <57A1412A.8070407@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 03 Aug 2016 07:22:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v5 7/7] hw/arm/virt-acpi-build:
 Add ITS description in ACPI MADT table
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
Cc: drjones@redhat.com, tn@semihalf.com, shlomopongratz@gmail.com,
	shannon.zhao@linaro.org, diana.craciun@freescale.com,
	christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2j5ssq5dkCQf

Hi Shannon,

On 03/08/2016 02:56, Shannon Zhao wrote:
> Hi Eric,
> 
> On 2016/8/3 2:07, Eric Auger wrote:
>> This patch exposes the GICv3 ITS to the ACPI guest. The ITS structure
>> is added to the MADT table.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>>
>> v5: new
>>
>> Tested with Tomasz' kernel series on guest side:
>> - [PATCH V7 0/8] Introduce ACPI world to ITS,
>>   https://lkml.org/lkml/2016/6/20/321
>> - for running PCIe on the guest (virtio-pci-net or vhost-net)
>>   the following series is also needed, although not directly ITS:
>>   Support for ARM64 ACPI based PCI host controller,
>>   https://lwn.net/Articles/690995/
>> ---
>>  hw/arm/virt-acpi-build.c    |  7 +++++++
>>  include/hw/acpi/acpi-defs.h | 13 ++++++++++++-
>>  2 files changed, 19 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index 28fc59c..6cfedff 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -546,6 +546,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
>>      }
>>  
>>      if (guest_info->gic_version == 3) {
>> +        AcpiMadtGicIts *gic_its;
>>          AcpiMadtGenericRedistributor *gicr = acpi_data_push(table_data,
>>                                                           sizeof *gicr);
>>  
>> @@ -553,6 +554,12 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
>>          gicr->length = sizeof(*gicr);
>>          gicr->base_address = cpu_to_le64(memmap[VIRT_GIC_REDIST].base);
>>          gicr->range_length = cpu_to_le32(memmap[VIRT_GIC_REDIST].size);
>> +
>> +        gic_its = acpi_data_push(table_data, sizeof *gic_its);
>> +        gic_its->type = ACPI_APIC_ITS_STRUCTURE;
>> +        gic_its->length = sizeof(*gic_its);
>> +        gic_its->gic_its_id = 0;
>> +        gic_its->base_address = cpu_to_le64(memmap[VIRT_GIC_ITS].base);
> Since for TCG it doesn't support ITS yet, it should check here using
> its_class_name().
> 
>>      } else {
>>          gic_msi = acpi_data_push(table_data, sizeof *gic_msi);
>>          gic_msi->type = ACPI_APIC_GENERIC_MSI_FRAME;
>> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
>> index 41c1d95..ba3be1e 100644
>> --- a/include/hw/acpi/acpi-defs.h
>> +++ b/include/hw/acpi/acpi-defs.h
>> @@ -294,7 +294,8 @@ typedef struct AcpiMultipleApicTable AcpiMultipleApicTable;
>>  #define ACPI_APIC_GENERIC_DISTRIBUTOR   12
>>  #define ACPI_APIC_GENERIC_MSI_FRAME     13
>>  #define ACPI_APIC_GENERIC_REDISTRIBUTOR 14
>> -#define ACPI_APIC_RESERVED              15   /* 15 and greater are reserved */
>> +#define ACPI_APIC_ITS_STRUCTURE         15
> use ACPI_APIC_GENERIC_TRANSLATOR instead.
> 
>> +#define ACPI_APIC_RESERVED              16   /* 16 and greater are reserved */
>>  
>>  /*
>>   * MADT sub-structures (Follow MULTIPLE_APIC_DESCRIPTION_TABLE)
>> @@ -386,6 +387,16 @@ struct AcpiMadtGenericMsiFrame {
>>  
>>  typedef struct AcpiMadtGenericMsiFrame AcpiMadtGenericMsiFrame;
>>  
>> +struct AcpiMadtGicIts {
>> +    ACPI_SUB_HEADER_DEF
>> +    uint16_t reserved;
>> +    uint32_t gic_its_id;
>> +    uint64_t base_address;
>> +    uint32_t reserved2;
>> +} QEMU_PACKED;
>> +
>> +typedef struct AcpiMadtGicIts AcpiMadtGicIts;
>> +
> Define it like below to respect the name in linux kernel and also keep
> consistent with other structures.
> 
> +struct AcpiMadtGenericTranslator {
> +    ACPI_SUB_HEADER_DEF
> +    uint16_t reserved;
> +    uint32_t translation_id;
> +    uint64_t base_address;
> +    uint32_t reserved2;
> +} QEMU_PACKED;
> +
> +typedef struct AcpiMadtGenericTranslator AcpiMadtGenericTranslator;
> 
> BTW, you could have a look at [1] which I sent before.
> 
> [1] https://lists.gnu.org/archive/html/qemu-devel/2015-11/msg06282.html
Hum sorry, please apologize. I was not aware of those. Do you want to
respin or shall I respin mine taking into account your comments and
changing the author. Besides, thanks for the review.

Thanks

Eric
> 
> Thanks,
> 
