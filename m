Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2697116wrt;
        Mon, 17 Dec 2018 08:33:53 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VzoEoJdf6QkZxvcRci2kEHGOBxcDuav02cE+4cT2G+Y8gwcVTIbgz+pukO3rAqQJ7ndq1T
X-Received: by 2002:a37:5e85:: with SMTP id s127mr12580005qkb.234.1545064433475;
        Mon, 17 Dec 2018 08:33:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1545064433; cv=none;
        d=google.com; s=arc-20160816;
        b=qfLr2xJMJcFkZEKmDdQ0vdzxrrZwafDXKQCYKXT5SV/wyNayaqSP6Vrvq3we6s5Qy4
         lZ7RrPa46AWosST/OY/WysXiGcHZeQRiDbwp44vCaKF5smQ0yx0DHzP0BD88WjWQ+bfH
         oktwf82EYJ2k7LGH4jA2DyMxwBzNqOJxlDoMlCXw5gUoJQMtUdjtDLk6VHvygn88PfAZ
         gUqNy1R3GCwUPVpAT/d7Wu7a/MIOLmQMXtXuGypV3MlvRwmxS6q0LbcfdNSO+nM5nuFj
         sR93MaQE0jCZiE36K1yzelskfxS633Espzoo06p2/V7dj1iTidPnMf1hNveBn1yw7BYv
         Vh1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=+WbdOuqqkQjAPrbopdMlL9Po1nFWfPeHMMj5YSotEao=;
        b=kxIHWA/Tv7OcsGLw/OpDPB5WBV0IsSgGbCUZT6tDVWNto5P5B+nzuY0SKAnLdMPgMZ
         Quxhng5BzSx6+h8Ph+qxCAEbom4pkGB2H41HCDNDpQ2Wk6RfD9xE/CqYNE9HZXNJ2WpT
         FUcrlylBOPrYs3ZpynlvIxzJdjM2+gVz0g6aDcMNA38eKw0fnhctNuD3+/kTzrStatYy
         A/6vwcT+GjSEDyoimbsk0cvETCjxSz9MTjcY2kJRx7fOq5vphIGi57oMbcqMGFP2IuJ6
         LyvG3z8lBjXzO6hUZEoy6fDgvbmUt29VaFjWAhvzPu/7R92NunBmoeh8uY1d5TnaaE+4
         QJfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x3si3251041qtd.345.2018.12.17.08.33.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Dec 2018 08:33:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47756 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gYvq4-0001d1-Sk
	for alex.bennee@linaro.org; Mon, 17 Dec 2018 11:33:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52907)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gYvjm-0005BH-L9
	for qemu-devel@nongnu.org; Mon, 17 Dec 2018 11:27:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gYvjk-0004cn-ET
	for qemu-devel@nongnu.org; Mon, 17 Dec 2018 11:27:22 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48060)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1gYvjZ-0004XA-Mq; Mon, 17 Dec 2018 11:27:09 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2E292C079918;
	Mon, 17 Dec 2018 16:27:08 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B785608C5;
	Mon, 17 Dec 2018 16:27:03 +0000 (UTC)
Date: Mon, 17 Dec 2018 17:27:01 +0100
From: Andrew Jones <drjones@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20181217162701.nzdqhccpnhypj2z7@kamzik.brq.redhat.com>
References: <20181206170733.7469-1-eric.auger@redhat.com>
	<20181206170733.7469-3-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181206170733.7469-3-eric.auger@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 17 Dec 2018 16:27:08 +0000 (UTC)
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
X-TUID: bNjBugiPaCij

On Thu, Dec 06, 2018 at 06:07:33PM +0100, Eric Auger wrote:
> Let's update the structs according to revision D of the IORT
> specification and set the IORT node revision fields.
> 
> In IORT smmuv3 node: the new proximity field is not used as
> the proximity domain valid flag is not set. The new DeviceId
> mapping index is not used either as all the SMMU control
> interrupts are GSIV based.
> 
> In IORT RC node: the new memory address size limit field is
> set to 64 bits.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> 
> v1 -> v2:
> - separate patches for SMMUv3 DMA coherency issue and struct
>   update to revision D.
> - revision fields set
> ---
>  hw/arm/virt-acpi-build.c    |  4 ++++
>  include/hw/acpi/acpi-defs.h | 10 +++++++++-
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index aa177ba64d..a34a0958a5 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -423,6 +423,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>       */
>      iort_node_offset = sizeof(*iort);
>      iort->node_offset = cpu_to_le32(iort_node_offset);
> +    iort->revision = 0;
>  
>      /* ITS group node */
>      node_size =  sizeof(*its) + sizeof(uint32_t);
> @@ -445,6 +446,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  
>          smmu->type = ACPI_IORT_NODE_SMMU_V3;
>          smmu->length = cpu_to_le16(node_size);
> +        smmu->revision = cpu_to_le32(2);
>          smmu->mapping_count = cpu_to_le32(1);
>          smmu->mapping_offset = cpu_to_le32(sizeof(*smmu));
>          smmu->base_address = cpu_to_le64(vms->memmap[VIRT_SMMU].base);
> @@ -470,6 +472,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  
>      rc->type = ACPI_IORT_NODE_PCI_ROOT_COMPLEX;
>      rc->length = cpu_to_le16(node_size);
> +    rc->revision = cpu_to_le32(1);
>      rc->mapping_count = cpu_to_le32(1);
>      rc->mapping_offset = cpu_to_le32(sizeof(*rc));
>  
> @@ -477,6 +480,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      rc->memory_properties.cache_coherency = cpu_to_le32(1);
>      rc->memory_properties.memory_flags = 0x3; /* CCA = CPM = DCAS = 1 */
>      rc->pci_segment_number = 0; /* MCFG pci_segment */
> +    rc->memory_address_limit = 64;

Hmmm... IIUC this provides the size of the IOVA space. When it's 64 the
size of the space is U64_MAX, which gets added to the DMA base (also 64
bits) when calculating things like the last PFN. It seems strange to use
a value that will surely overflow those calculations. Is it common to
put 64 here? Can you elaborate on this?

>  
>      /* Identity RID mapping covering the whole input RID range */
>      idmap = &rc->id_mapping_array[0];
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index 532eaf79bd..b4a5104367 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -628,7 +628,11 @@ struct AcpiIortItsGroup {
>  } QEMU_PACKED;
>  typedef struct AcpiIortItsGroup AcpiIortItsGroup;
>  
> -#define ACPI_IORT_SMMU_V3_COHACC_OVERRIDE 1
> +enum {
> +    ACPI_IORT_SMMU_V3_COHACC_OVERRIDE = 1 << 0,
> +    ACPI_IORT_SMMU_V3_HTTU_OVERRIDE   = 3 << 1,
> +    ACPI_IORT_SMMU_V3_PXM_VALID       = 1 << 3
> +};

We don't usually add flag definitions until we need them. Indeed it'll
just be more code to delete when switching to the aml_append* API.

>  
>  struct AcpiIortSmmu3 {
>      ACPI_IORT_NODE_HEADER_DEF
> @@ -641,6 +645,8 @@ struct AcpiIortSmmu3 {
>      uint32_t pri_gsiv;
>      uint32_t gerr_gsiv;
>      uint32_t sync_gsiv;
> +    uint32_t pxm;
> +    uint32_t id_mapping_index;
>      AcpiIortIdMapping id_mapping_array[0];
>  } QEMU_PACKED;
>  typedef struct AcpiIortSmmu3 AcpiIortSmmu3;
> @@ -650,6 +656,8 @@ struct AcpiIortRC {
>      AcpiIortMemoryAccess memory_properties;
>      uint32_t ats_attribute;
>      uint32_t pci_segment_number;
> +    uint8_t memory_address_limit;
> +    uint8_t reserved2[3];
>      AcpiIortIdMapping id_mapping_array[0];
>  } QEMU_PACKED;
>  typedef struct AcpiIortRC AcpiIortRC;
> -- 
> 2.17.2
> 
>

Thanks,
drew
