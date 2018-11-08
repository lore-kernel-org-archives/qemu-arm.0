Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp183563wrw;
        Thu, 8 Nov 2018 06:17:09 -0800 (PST)
X-Google-Smtp-Source: AJdET5eZm1qdkEzD+rjKLrseVPVEa39NQWAhbMFOgfbtUBv8DBGcI4xQye7D4UPT4s/W6rdBr0y5
X-Received: by 2002:ac8:107:: with SMTP id e7mr4366687qtg.221.1541686629284;
        Thu, 08 Nov 2018 06:17:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541686629; cv=none;
        d=google.com; s=arc-20160816;
        b=SuB8OIlBExugvnZV2ecRKmkly24l2aJ5ZWFo99t40wGpvxGRreVBTZ31sMCfa+PGxr
         FywLOcxjxn8c22isFBu84ZVXKnkxGstxes7R0o4Fdz3JDbwVWTTzNigs4bULyuG0/bqi
         L7o52ZC1d9Em/g97gHWN36hBKNZLsnNLCzWbCmB+K5dQ8oDL3X8rcQY2jeTtxQmeqGVC
         AZdNfOgQi9VsdSAP2qgdRqqaxjG1GKjhdS3SWGnEZ5GAKLI5zsYjr1mXboW6xmElSSkB
         pH2SB/RV2Pw/zsiu6lT4XNOCsR3ty0S17rsRbGE0KP8yNTkMiFYFaNyrYc8nnBDd61IK
         y00g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=0I3WsgTDb1w4fXrO+GxqnxSv+aItqbp0vSvY+QZyPEI=;
        b=jDRTSpO5T0YXrGKiXGkovNpdQTKxjSsrUGPPq7Iy7/U3bH/gQqPKMULmGSqmUpseza
         1HbsA6UpaENSPQ5+jByccw9aJywve0bgcCFL6kAyrtnGF45YMVnGigO0byiaCG9HgS6Z
         2I4isU/CtIlDYMbfzIfdgfrGXc9zVTGKeKv0p8x4CK/qG/efC4A9ds9WVnLOHXNao0Nn
         aphIWSGAFJo2uUpz80hvjDVtIEA+fCCHfvjWgarvuiGkkwbrbqAsAv7BCZgzceps9mRL
         4aatjei2hn17y/qEtUBRq06BwFH79fOlBP7Flwt4vVO3cpUO+Ud+8ZtGr+RtCLDgV9oD
         SLuA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t3si263819qto.355.2018.11.08.06.17.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Nov 2018 06:17:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57036 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gKl7M-0001hX-PT
	for alex.bennee@linaro.org; Thu, 08 Nov 2018 09:17:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51864)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gKl7F-0001h5-0i
	for qemu-arm@nongnu.org; Thu, 08 Nov 2018 09:17:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gKl7C-0003UT-26
	for qemu-arm@nongnu.org; Thu, 08 Nov 2018 09:17:00 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46008)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gKl7B-00037z-Om; Thu, 08 Nov 2018 09:16:57 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7A12A58E59;
	Thu,  8 Nov 2018 14:16:33 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 727BA648C4;
	Thu,  8 Nov 2018 14:16:25 +0000 (UTC)
Date: Thu, 8 Nov 2018 15:16:23 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181108151623.4de26ecb@redhat.com>
In-Reply-To: <20181105014047.26447-6-sameo@linux.intel.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
	<20181105014047.26447-6-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 08 Nov 2018 14:16:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v5 05/24] hw: acpi: Implement XSDT support
 for RSDP
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q+tN+U6x8aBU

On Mon,  5 Nov 2018 02:40:28 +0100
Samuel Ortiz <sameo@linux.intel.com> wrote:

> XSDT is the 64-bit version of the legacy ACPI RSDT (Root System
> Description Table). RSDT only allow for 32-bit addressses and have thus
> been deprecated. Since ACPI version 2.0, RSDPs should point at XSDTs and
> no longer RSDTs, although RSDTs are still supported for backward
> compatibility.
> 
> Since version 2.0, RSDPs should add an extended checksum, a complete table
> length and a version field to the table.

This patch re-implements what arm/virt board already does
and fixes checksum bug in the later and at the same time
without a user (within the patch).

I'd suggest redo it a way similar to FADT refactoring
  patch 1: fix checksum bug in virt/arm
  patch 2: update reference tables in test
  patch 3: introduce AcpiRsdpData similar to commit 937d1b587
             (both arm and x86) wich stores all data in hos byte order
  patch 4: convert arm's impl. to build_append_int_noprefix() API (commit 5d7a334f7)
           ... move out to aml-build.c
  patch 5: reuse generalized arm's build_rsdp() for x86, dropping x86 specific one
      amending it to generate rev1 variant defined by revision in AcpiRsdpData
      (commit dd1b2037a)

  'make check V=1' shouldn't observe any ACPI tables changes after patch 2.

> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> ---
>  include/hw/acpi/aml-build.h |  3 +++
>  hw/acpi/aml-build.c         | 37 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 40 insertions(+)
> 
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index c9bcb32d81..3580d0ce90 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -393,6 +393,9 @@ void
>  build_rsdp(GArray *table_data,
>             BIOSLinker *linker, unsigned rsdt_tbl_offset);
>  void
> +build_rsdp_xsdt(GArray *table_data,
> +                BIOSLinker *linker, unsigned xsdt_tbl_offset);
> +void
>  build_rsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
>             const char *oem_id, const char *oem_table_id);
>  void
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index 51b608432f..a030d40674 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -1651,6 +1651,43 @@ build_xsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
>                   (void *)xsdt, "XSDT", xsdt_len, 1, oem_id, oem_table_id);
>  }
>  
> +/* RSDP pointing at an XSDT */
> +void
> +build_rsdp_xsdt(GArray *rsdp_table,
> +                BIOSLinker *linker, unsigned xsdt_tbl_offset)
> +{
> +    AcpiRsdpDescriptor *rsdp = acpi_data_push(rsdp_table, sizeof *rsdp);
> +    unsigned xsdt_pa_size = sizeof(rsdp->xsdt_physical_address);
> +    unsigned xsdt_pa_offset =
> +        (char *)&rsdp->xsdt_physical_address - rsdp_table->data;
> +    unsigned xsdt_offset =
> +        (char *)&rsdp->length - rsdp_table->data;
> +
> +    bios_linker_loader_alloc(linker, ACPI_BUILD_RSDP_FILE, rsdp_table, 16,
> +                             true /* fseg memory */);
> +
> +    memcpy(&rsdp->signature, "RSD PTR ", 8);
> +    memcpy(rsdp->oem_id, ACPI_BUILD_APPNAME6, 6);
> +    rsdp->length = cpu_to_le32(sizeof(*rsdp));
> +    /* version 2, we will use the XSDT pointer */
> +    rsdp->revision = 0x02;
> +
> +    /* Address to be filled by Guest linker */
> +    bios_linker_loader_add_pointer(linker,
> +        ACPI_BUILD_RSDP_FILE, xsdt_pa_offset, xsdt_pa_size,
> +        ACPI_BUILD_TABLE_FILE, xsdt_tbl_offset);
> +
> +    /* Legacy checksum to be filled by Guest linker */
> +    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
> +        (char *)rsdp - rsdp_table->data, xsdt_offset,
> +        (char *)&rsdp->checksum - rsdp_table->data);
> +
> +    /* Extended checksum to be filled by Guest linker */
> +    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
> +        (char *)rsdp - rsdp_table->data, sizeof *rsdp,
> +        (char *)&rsdp->extended_checksum - rsdp_table->data);
> +}
> +
>  void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
>                         uint64_t len, int node, MemoryAffinityFlags flags)
>  {

