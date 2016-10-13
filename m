Received: by 10.80.166.35 with SMTP id d32csp433975edc;
        Thu, 13 Oct 2016 08:00:45 -0700 (PDT)
X-Received: by 10.55.177.5 with SMTP id a5mr6617753qkf.153.1476370845594;
        Thu, 13 Oct 2016 08:00:45 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m190si6720174qkd.35.2016.10.13.08.00.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Oct 2016 08:00:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40824 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1buhUy-00069U-CK
	for alex.bennee@linaro.org; Thu, 13 Oct 2016 11:00:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41080)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1buhUr-00069K-7f
	for qemu-arm@nongnu.org; Thu, 13 Oct 2016 11:00:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1buhUm-00041J-VS
	for qemu-arm@nongnu.org; Thu, 13 Oct 2016 11:00:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42008)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1buhUm-000410-M2; Thu, 13 Oct 2016 11:00:32 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 604263D968;
	Thu, 13 Oct 2016 15:00:30 +0000 (UTC)
Received: from kamzik.brq.redhat.com ([10.34.1.163])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9DF0PVc023379
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 13 Oct 2016 11:00:27 -0400
Date: Thu, 13 Oct 2016 17:00:25 +0200
From: Andrew Jones <drjones@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20161013150025.zja6u65tqfwzl5zz@kamzik.brq.redhat.com>
References: <1476356143-10577-1-git-send-email-eric.auger@redhat.com>
	<1476356143-10577-2-git-send-email-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1476356143-10577-2-git-send-email-eric.auger@redhat.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 13 Oct 2016 15:00:31 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/2] ACPI: Add IORT Structure
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
Cc: peter.maydell@linaro.org, tn@semihalf.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, shannon.zhao@linaro.org,
	prem.mallappa@broadcom.com, christoffer.dall@linaro.org,
	eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F1Mrhozj+j3v

On Thu, Oct 13, 2016 at 12:55:42PM +0200, Eric Auger wrote:
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
> ---
>  include/hw/acpi/acpi-defs.h | 91 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 91 insertions(+)
> 
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index 9c1b7cb..9ad3c01 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -609,4 +609,95 @@ typedef struct AcpiDmarHardwareUnit AcpiDmarHardwareUnit;
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
> + * IORT subtables

s/subtables/Nodes/

> + */
> +
> +struct AcpiIortNode {
> +    uint8_t  type;
> +    uint16_t length;
> +    uint8_t  revision;
> +    uint32_t reserved;
> +    uint32_t mapping_count;
> +    uint32_t mapping_offset;
> +} QEMU_PACKED;
> +typedef struct AcpiIortNode AcpiIortNode;

The above should be a define like ACPI_TABLE_HEADER_DEF, as it's not
a unique node type. The fields are just common node header fields.

> +
> +/* Values for subtable Type above */

s/subtable/node/

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
> +/* Masks for Flags field above for IORT subtable */
> +#define ACPI_IORT_ID_SINGLE_MAPPING (1)

We don't need to introduce defines/enums for all flags. Sometimes
it makes the code easier to read, but sometimes it's just cruft.
Everything is already documented in the spec, so a comment at
assignment time is usually enough. See the SPCR generation for an
example of attempting to minimize a reproduction of the spec.

> +
> +struct AcpiIortMemoryAccess {
> +    uint32_t cache_coherency;
> +    uint8_t  hints;
> +    uint16_t reserved;
> +    uint8_t  memory_flags;
> +} QEMU_PACKED;
> +typedef struct AcpiIortMemoryAccess AcpiIortMemoryAccess;
> +
> +/* Values for cache_coherency field above */
> +#define ACPI_IORT_NODE_COHERENT         0x00000001
> +#define ACPI_IORT_NODE_NOT_COHERENT     0x00000000

I'd replace these defines with comments at assignment time.

> +
> +/* Masks for Hints field above */
> +#define ACPI_IORT_HT_TRANSIENT          (1)
> +#define ACPI_IORT_HT_WRITE              (1 << 1)
> +#define ACPI_IORT_HT_READ               (1 << 2)
> +#define ACPI_IORT_HT_OVERRIDE           (1 << 3)

I'd drop these, I see they're not used anyway.

> +
> +/* Masks for memory_flags field above */
> +#define ACPI_IORT_MF_COHERENCY          (1)
> +#define ACPI_IORT_MF_ATTRIBUTES         (1 << 1)

And these can go.

> +
> +/*
> + * IORT node specific subtables
> + */

No need for the above header, we're already under

/* IORT Nodes */

> +
> +struct AcpiIortItsGroup {
> +    AcpiIortNode iort_node;

ACPI_IORT_NODE_HEADER_DEF

> +    uint32_t its_count;
> +    uint32_t identifiers[0];
> +} QEMU_PACKED;
> +typedef struct AcpiIortItsGroup AcpiIortItsGroup;
> +
> +struct AcpiIortRC {
> +    AcpiIortNode iort_node;

ACPI_IORT_NODE_HEADER_DEF

> +    AcpiIortMemoryAccess memory_properties;
> +    uint32_t ats_attribute;
> +    uint32_t pci_segment_number;
> +    AcpiIortIdMapping id_mapping_array[0];
> +} QEMU_PACKED;
> +typedef struct AcpiIortRC AcpiIortRC;
> +
>  #endif
> -- 
> 2.5.5
> 
>

Thanks,
drew 
