Received: by 10.25.21.156 with SMTP id 28csp476429lfv;
        Tue, 2 Aug 2016 18:04:23 -0700 (PDT)
X-Received: by 10.55.68.81 with SMTP id r78mr80377020qka.129.1470186262933;
        Tue, 02 Aug 2016 18:04:22 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b34si3274165qtb.136.2016.08.02.18.04.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Aug 2016 18:04:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59609 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bUkbe-0007xP-9f
	for alex.bennee@linaro.org; Tue, 02 Aug 2016 21:04:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38424)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bUkbV-0007vo-Re
	for qemu-arm@nongnu.org; Tue, 02 Aug 2016 21:04:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bUkbU-0006Yh-FG
	for qemu-arm@nongnu.org; Tue, 02 Aug 2016 21:04:13 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:41244)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1bUkbP-0006Os-3x; Tue, 02 Aug 2016 21:04:07 -0400
Received: from 172.24.1.137 (EHLO szxeml433-hub.china.huawei.com)
	([172.24.1.137])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id CFT65186; Wed, 03 Aug 2016 08:56:22 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml433-hub.china.huawei.com
	(10.82.67.210) with Microsoft SMTP Server id 14.3.235.1; Wed, 3 Aug 2016
	08:56:12 +0800
Message-ID: <57A1412A.8070407@huawei.com>
Date: Wed, 3 Aug 2016 08:56:10 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Eric Auger <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
	<peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>, <p.fedin@samsung.com>
References: <1470161247-10251-1-git-send-email-eric.auger@redhat.com>
	<1470161247-10251-8-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1470161247-10251-8-git-send-email-eric.auger@redhat.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020202.57A14138.000E, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: d2feb11d4287df64d846e9e4829c5379
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
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
X-TUID: 3uwFqFrYxJ7Z

Hi Eric,

On 2016/8/3 2:07, Eric Auger wrote:
> This patch exposes the GICv3 ITS to the ACPI guest. The ITS structure
> is added to the MADT table.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> 
> v5: new
> 
> Tested with Tomasz' kernel series on guest side:
> - [PATCH V7 0/8] Introduce ACPI world to ITS,
>   https://lkml.org/lkml/2016/6/20/321
> - for running PCIe on the guest (virtio-pci-net or vhost-net)
>   the following series is also needed, although not directly ITS:
>   Support for ARM64 ACPI based PCI host controller,
>   https://lwn.net/Articles/690995/
> ---
>  hw/arm/virt-acpi-build.c    |  7 +++++++
>  include/hw/acpi/acpi-defs.h | 13 ++++++++++++-
>  2 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 28fc59c..6cfedff 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -546,6 +546,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
>      }
>  
>      if (guest_info->gic_version == 3) {
> +        AcpiMadtGicIts *gic_its;
>          AcpiMadtGenericRedistributor *gicr = acpi_data_push(table_data,
>                                                           sizeof *gicr);
>  
> @@ -553,6 +554,12 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
>          gicr->length = sizeof(*gicr);
>          gicr->base_address = cpu_to_le64(memmap[VIRT_GIC_REDIST].base);
>          gicr->range_length = cpu_to_le32(memmap[VIRT_GIC_REDIST].size);
> +
> +        gic_its = acpi_data_push(table_data, sizeof *gic_its);
> +        gic_its->type = ACPI_APIC_ITS_STRUCTURE;
> +        gic_its->length = sizeof(*gic_its);
> +        gic_its->gic_its_id = 0;
> +        gic_its->base_address = cpu_to_le64(memmap[VIRT_GIC_ITS].base);
Since for TCG it doesn't support ITS yet, it should check here using
its_class_name().

>      } else {
>          gic_msi = acpi_data_push(table_data, sizeof *gic_msi);
>          gic_msi->type = ACPI_APIC_GENERIC_MSI_FRAME;
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index 41c1d95..ba3be1e 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -294,7 +294,8 @@ typedef struct AcpiMultipleApicTable AcpiMultipleApicTable;
>  #define ACPI_APIC_GENERIC_DISTRIBUTOR   12
>  #define ACPI_APIC_GENERIC_MSI_FRAME     13
>  #define ACPI_APIC_GENERIC_REDISTRIBUTOR 14
> -#define ACPI_APIC_RESERVED              15   /* 15 and greater are reserved */
> +#define ACPI_APIC_ITS_STRUCTURE         15
use ACPI_APIC_GENERIC_TRANSLATOR instead.

> +#define ACPI_APIC_RESERVED              16   /* 16 and greater are reserved */
>  
>  /*
>   * MADT sub-structures (Follow MULTIPLE_APIC_DESCRIPTION_TABLE)
> @@ -386,6 +387,16 @@ struct AcpiMadtGenericMsiFrame {
>  
>  typedef struct AcpiMadtGenericMsiFrame AcpiMadtGenericMsiFrame;
>  
> +struct AcpiMadtGicIts {
> +    ACPI_SUB_HEADER_DEF
> +    uint16_t reserved;
> +    uint32_t gic_its_id;
> +    uint64_t base_address;
> +    uint32_t reserved2;
> +} QEMU_PACKED;
> +
> +typedef struct AcpiMadtGicIts AcpiMadtGicIts;
> +
Define it like below to respect the name in linux kernel and also keep
consistent with other structures.

+struct AcpiMadtGenericTranslator {
+    ACPI_SUB_HEADER_DEF
+    uint16_t reserved;
+    uint32_t translation_id;
+    uint64_t base_address;
+    uint32_t reserved2;
+} QEMU_PACKED;
+
+typedef struct AcpiMadtGenericTranslator AcpiMadtGenericTranslator;

BTW, you could have a look at [1] which I sent before.

[1] https://lists.gnu.org/archive/html/qemu-devel/2015-11/msg06282.html

Thanks,
-- 
Shannon

