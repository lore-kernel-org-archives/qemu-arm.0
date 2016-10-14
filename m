Received: by 10.80.166.35 with SMTP id d32csp259027edc;
        Fri, 14 Oct 2016 05:42:30 -0700 (PDT)
X-Received: by 10.55.3.7 with SMTP id 7mr11125630qkd.291.1476448950646;
        Fri, 14 Oct 2016 05:42:30 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o4si9584954qtc.52.2016.10.14.05.42.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 14 Oct 2016 05:42:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47124 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bv1ok-0008DK-4X
	for alex.bennee@linaro.org; Fri, 14 Oct 2016 08:42:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41428)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1bv1og-0008C8-Hm
	for qemu-arm@nongnu.org; Fri, 14 Oct 2016 08:42:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1bv1od-000617-7c
	for qemu-arm@nongnu.org; Fri, 14 Oct 2016 08:42:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51926)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1bv1oc-00060M-Uf; Fri, 14 Oct 2016 08:42:23 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6708FC04B924;
	Fri, 14 Oct 2016 12:42:22 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9ECgJhX005529; Fri, 14 Oct 2016 08:42:20 -0400
Date: Fri, 14 Oct 2016 14:42:18 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20161014144218.10d072b5@nial.brq.redhat.com>
In-Reply-To: <1476435295-21885-2-git-send-email-eric.auger@redhat.com>
References: <1476435295-21885-1-git-send-email-eric.auger@redhat.com>
	<1476435295-21885-2-git-send-email-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 14 Oct 2016 12:42:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 1/2] ACPI: Add IORT Structure
 definition
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, tn@semihalf.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	shannon.zhao@linaro.org, prem.mallappa@broadcom.com,
	christoffer.dall@linaro.org, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a42F+BO3HsNa

On Fri, 14 Oct 2016 10:54:54 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> From: Prem Mallappa <prem.mallappa@broadcom.com>
> 
> ACPI Spec 6.0 introduces IO Remapping Table Structure. This patch
> introduces the definitions required to describe the IO relationship
> between the PCIe root complex and the ITS.
> 
> This conforms to:
> "IO Remapping Table System Software on ARM Platforms",
> Document number: ARM DEN 0049B, October 2015.
> 
> Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Preferred way to build/pack ACPI tables info is to use
build_append_foo() functions.
That way you won't have to care about endianness avoiding
mistakes at assignment time. Also you won't need to declare
intermediate structures to do packing and will have more
compact code (only a single function) and better documented
at that if every build_append_foo() is accompanied by
comment matching field description from ACPI spec.
Pls see build_amd_iommu() as example.

If you redo this series that way it will become single patch.

> 
> ---
> 
> v1 -> v2:
> - took into account Drew's comments:
>   cleanup comments, remove most defines, add ACPI_IORT_NODE_HEADER_DEF
> ---
>  include/hw/acpi/acpi-defs.h | 68 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
> 
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index 9c1b7cb..1cd1e69 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -609,4 +609,72 @@ typedef struct AcpiDmarHardwareUnit AcpiDmarHardwareUnit;
>  /* Masks for Flags field above */
>  #define ACPI_DMAR_INCLUDE_PCI_ALL   1
>  
> +/*
> + * Input Output Remapping Table (IORT)
> + * Conforms to "IO Remapping Table System Software on ARM Platforms",
> + * Document number: ARM DEN 0049B, October 2015
> + */
> +
> +struct AcpiIortTable {
> +    ACPI_TABLE_HEADER_DEF     /* ACPI common table header */
> +    uint32_t node_count;
> +    uint32_t node_offset;
> +    uint32_t reserved;
> +} QEMU_PACKED;
> +typedef struct AcpiIortTable AcpiIortTable;
> +
> +/*
> + * IORT node types
> + */
> +
> +#define ACPI_IORT_NODE_HEADER_DEF   /* Node format common fields */ \
> +    uint8_t  type;          \
> +    uint16_t length;        \
> +    uint8_t  revision;      \
> +    uint32_t reserved;      \
> +    uint32_t mapping_count; \
> +    uint32_t mapping_offset;\
> +
> +/* Values for node Type above */
> +enum {
> +        ACPI_IORT_NODE_ITS_GROUP = 0x00,
> +        ACPI_IORT_NODE_NAMED_COMPONENT = 0x01,
> +        ACPI_IORT_NODE_PCI_ROOT_COMPLEX = 0x02,
> +        ACPI_IORT_NODE_SMMU = 0x03,
> +        ACPI_IORT_NODE_SMMU_V3 = 0x04
> +};
> +
> +struct AcpiIortIdMapping {
> +    uint32_t input_base;
> +    uint32_t id_count;
> +    uint32_t output_base;
> +    uint32_t output_reference;
> +    uint32_t flags;
> +} QEMU_PACKED;
> +typedef struct AcpiIortIdMapping AcpiIortIdMapping;
> +
> +struct AcpiIortMemoryAccess {
> +    uint32_t cache_coherency;
> +    uint8_t  hints;
> +    uint16_t reserved;
> +    uint8_t  memory_flags;
> +} QEMU_PACKED;
> +typedef struct AcpiIortMemoryAccess AcpiIortMemoryAccess;
> +
> +struct AcpiIortItsGroup {
> +    ACPI_IORT_NODE_HEADER_DEF
> +    uint32_t its_count;
> +    uint32_t identifiers[0];
> +} QEMU_PACKED;
> +typedef struct AcpiIortItsGroup AcpiIortItsGroup;
> +
> +struct AcpiIortRC {
> +    ACPI_IORT_NODE_HEADER_DEF
> +    AcpiIortMemoryAccess memory_properties;
> +    uint32_t ats_attribute;
> +    uint32_t pci_segment_number;
> +    AcpiIortIdMapping id_mapping_array[0];
> +} QEMU_PACKED;
> +typedef struct AcpiIortRC AcpiIortRC;
> +
>  #endif

