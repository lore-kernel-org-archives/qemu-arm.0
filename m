Received: by 10.28.91.67 with SMTP id p64csp720868wmb;
        Mon, 12 Mar 2018 05:49:01 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtfotlu6YKqc61W0hJVoFJaTdEuijAAyOXgpeaWP825c9lISxaQF4UPHs9NM+Ia/K9kbEmh
X-Received: by 2002:a25:908b:: with SMTP id t11-v6mr3694278ybl.288.1520858941712;
        Mon, 12 Mar 2018 05:49:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1520858941; cv=none;
        d=google.com; s=arc-20160816;
        b=i4WlYb6CY4UDXalonLpYshoXrq+dXQougy5WoX6xoVq/T/hWbmqEskQGZ1OoPyhb6R
         lhTKvAkZmxqqvfmUrZoBkizWv6N1Zj9oKZEx8Rf10Gw+HzbE7yExx2NthRjdWK0z2kI0
         uyfbVGRBlul2SeaOBKUETe0w4GktS2urANa9rBuJlOLAmfgoB5bXBky2OZ944+dG+zbz
         DlnBsunMGTqUCQROmCHeby0bJ/Sv4hdlpgpPZADeNU1sGsMkRhAU9hK/X0M6wEml8TIo
         2BQBbtSTlBp0esZukmGgxlve7JsIYOtKs8ElpFI98ximXid5PSE9TrvG8/D7JDL/JbwK
         xcwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=496GmkVNqXiqigeJWd5b8liWH++rDglUk3FgHC9snvo=;
        b=RgnrGRQ+SpGs6WMSunKNhn66lNvFEZGMvtVgCscubyP5cFzIQDKeYsEzYA+4pesFe3
         r912zDn9Ywgv3tfsYdbTSQWfOibW5vII34dDV89UHYHiudMjB1u8BC9kkYXtc/k85/rq
         sYscCumA2JjRbqXe2E+JYljx53HiAtjqzirnxeqPu6oTWg8qEv2sALh6YqcUTKJYHqlm
         UasuNRkOIXp9SuZJiiHdXkoqwKA4CdPpCJ7yTdbuZ+Bg6s75bPiJat7f635fH4GnCYil
         u2kroT7hKsW7VWCQLZR+0+1q+L0XY0J7kwMruBRj5ZAjDKUZ4iGxsRsfqgI+UBGgnUEK
         0zeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gSwZn96w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q206si57339ywc.232.2018.03.12.05.49.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Mar 2018 05:49:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gSwZn96w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58517 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1evMsv-0004XJ-6c
	for alex.bennee@linaro.org; Mon, 12 Mar 2018 08:49:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41494)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1evMsm-0004X0-8W
	for qemu-arm@nongnu.org; Mon, 12 Mar 2018 08:48:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1evMsk-00060g-R9
	for qemu-arm@nongnu.org; Mon, 12 Mar 2018 08:48:52 -0400
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:41195)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1evMsk-0005zU-L8
	for qemu-arm@nongnu.org; Mon, 12 Mar 2018 08:48:50 -0400
Received: by mail-ot0-x242.google.com with SMTP id w38so15088888ota.8
	for <qemu-arm@nongnu.org>; Mon, 12 Mar 2018 05:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=496GmkVNqXiqigeJWd5b8liWH++rDglUk3FgHC9snvo=;
	b=gSwZn96w46G7ZOAVBQd9CEMOn/pVG9MAayFnBeq0j1jtg132s9TKG+0Ck0id5ZfHIG
	ZQQp7f2qHFi5DEtsV97rkAGhLpckfgykFs+CTu+GWsZrEEKObtINrprZ2nnNep3xxLRl
	KSiWxdCIL+lTghhMnwws65GsCoiBRknqXHgPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=496GmkVNqXiqigeJWd5b8liWH++rDglUk3FgHC9snvo=;
	b=lQOFOtAjtrGkHdGBIdYg8bL8E+yY4T8MZ6QBcghVADRrg4pZwn8Qs/xwamxoI/W8N4
	I/0fOlUuwcUjQuJ+Ebj/wLcykXjkRy9bVy3j2P0Cwoo/fBJEebGPsqlI1LNKAYrq9DnI
	ha5j7iLsFCbYWVpn25NM8RD6VWu9FKxfVPBxpZt3GpOKffYUNOF48JmPXY7c22lMEa1v
	FK/CKYS1NNPkFrxTReKcvVKJUTda2KNp/dgZ56Uao4dCq7S+pZCchvCrTJqTlCgC1Dnd
	kRnC3gQCipQXPWFd7hKcoY3wFLxNdZaYHMVJe9oFmENwjQxqRcNYFCNUO86t/24B2/hX
	UlFg==
X-Gm-Message-State: AElRT7EUK7PCdSJluD09WDb4780lL2b/yDQDSA6I3Vn9PL1Y9bqN7qo6
	15FXZmSQvyOkn8kOmUjkmAB9RHWr9y3HRIlCggEaqg==
X-Received: by 10.157.69.152 with SMTP id x24mr5048422ote.126.1520858929863;
	Mon, 12 Mar 2018 05:48:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2164:0:0:0:0:0 with HTTP; Mon, 12 Mar 2018 05:48:29
	-0700 (PDT)
In-Reply-To: <1518893216-9983-14-git-send-email-eric.auger@redhat.com>
References: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>
	<1518893216-9983-14-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Mar 2018 12:48:29 +0000
Message-ID: <CAFEAcA810AsyBgCJ2vSKcxqRYKGZgJ3RLEqmJt_c5aa9j9t_Kw@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-arm] [PATCH v9 13/14] hw/arm/virt-acpi-build: Add smmuv3
 node in IORT table
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Tomasz Nowicki <tn@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>, linuc.decode@gmail.com,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	Prem Mallappa <prem.mallappa@gmail.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kHIVngPMhLWJ

On 17 February 2018 at 18:46, Eric Auger <eric.auger@redhat.com> wrote:
> From: Prem Mallappa <prem.mallappa@broadcom.com>
>
> This patch builds the smmuv3 node in the ACPI IORT table.
>
> The RID space of the root complex, which spans 0x0-0x10000
> maps to streamid space 0x0-0x10000 in smmuv3, which in turn
> maps to deviceid space 0x0-0x10000 in the ITS group.
>
> The guest must feature the IOMMU probe deferral series
> (https://lkml.org/lkml/2017/4/10/214) which fixes streamid
> multiple lookup. This bug is not related to the SMMU emulation.
>
> Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
> ---
>
> v2 -> v3:
> - integrate into the existing IORT table made up of ITS, RC nodes
> - take into account vms->smmu
> - match linux actbl2.h acpi_iort_smmu_v3 field names
> ---
>  hw/arm/virt-acpi-build.c    | 56 +++++++++++++++++++++++++++++++++++++++------
>  include/hw/acpi/acpi-defs.h | 15 ++++++++++++
>  2 files changed, 64 insertions(+), 7 deletions(-)

Since ACPI is definitely not my area of expertise, I've cc'd
Shannon on this patch. Shannon, could you take a look at it, please?

> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index f7fa795..4b5ad91 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -393,19 +393,26 @@ build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned xsdt_tbl_offset)
>  }
>
>  static void
> -build_iort(GArray *table_data, BIOSLinker *linker)
> +build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  {
> -    int iort_start = table_data->len;
> +    int nb_nodes, iort_start = table_data->len;
>      AcpiIortIdMapping *idmap;
>      AcpiIortItsGroup *its;
>      AcpiIortTable *iort;
> -    size_t node_size, iort_length;
> +    AcpiIortSmmu3 *smmu;
> +    size_t node_size, iort_length, smmu_offset = 0;
>      AcpiIortRC *rc;
>
>      iort = acpi_data_push(table_data, sizeof(*iort));
>
> +    if (vms->iommu) {
> +        nb_nodes = 3; /* RC, ITS, SMMUv3 */
> +    } else {
> +        nb_nodes = 2; /* RC, ITS */
> +    }
> +
>      iort_length = sizeof(*iort);
> -    iort->node_count = cpu_to_le32(2); /* RC and ITS nodes */
> +    iort->node_count = cpu_to_le32(nb_nodes);
>      iort->node_offset = cpu_to_le32(sizeof(*iort));
>
>      /* ITS group node */
> @@ -418,6 +425,35 @@ build_iort(GArray *table_data, BIOSLinker *linker)
>      its->its_count = cpu_to_le32(1);
>      its->identifiers[0] = 0; /* MADT translation_id */
>
> +    if (vms->iommu == VIRT_IOMMU_SMMUV3) {
> +        int irq =  vms->irqmap[VIRT_SMMU];
> +
> +        /* SMMUv3 node */
> +        smmu_offset = cpu_to_le32(iort->node_offset + node_size);
> +        node_size = sizeof(*smmu) + sizeof(*idmap);
> +        iort_length += node_size;
> +        smmu = acpi_data_push(table_data, node_size);
> +
> +
> +        smmu->type = ACPI_IORT_NODE_SMMU_V3;
> +        smmu->length = cpu_to_le16(node_size);
> +        smmu->mapping_count = cpu_to_le32(1);
> +        smmu->mapping_offset = cpu_to_le32(sizeof(*smmu));
> +        smmu->base_address = cpu_to_le64(vms->memmap[VIRT_SMMU].base);
> +        smmu->event_gsiv = cpu_to_le32(irq);
> +        smmu->pri_gsiv = cpu_to_le32(irq + 1);
> +        smmu->gerr_gsiv = cpu_to_le32(irq + 2);
> +        smmu->sync_gsiv = cpu_to_le32(irq + 3);
> +
> +        /* Identity RID mapping covering the whole input RID range */
> +        idmap = &smmu->id_mapping_array[0];
> +        idmap->input_base = 0;
> +        idmap->id_count = cpu_to_le32(0xFFFF);
> +        idmap->output_base = 0;
> +        /* output IORT node is the ITS group node (the first node) */
> +        idmap->output_reference = cpu_to_le32(iort->node_offset);
> +    }
> +
>      /* Root Complex Node */
>      node_size = sizeof(*rc) + sizeof(*idmap);
>      iort_length += node_size;
> @@ -438,8 +474,14 @@ build_iort(GArray *table_data, BIOSLinker *linker)
>      idmap->input_base = 0;
>      idmap->id_count = cpu_to_le32(0xFFFF);
>      idmap->output_base = 0;
> -    /* output IORT node is the ITS group node (the first node) */
> -    idmap->output_reference = cpu_to_le32(iort->node_offset);
> +
> +    if (vms->iommu) {
> +        /* output IORT node is the smmuv3 node */
> +        idmap->output_reference = cpu_to_le32(smmu_offset);
> +    } else {
> +        /* output IORT node is the ITS group node (the first node) */
> +        idmap->output_reference = cpu_to_le32(iort->node_offset);
> +    }
>
>      iort->length = cpu_to_le32(iort_length);
>
> @@ -786,7 +828,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>
>      if (its_class_name() && !vmc->no_its) {
>          acpi_add_table(table_offsets, tables_blob);
> -        build_iort(tables_blob, tables->linker);
> +        build_iort(tables_blob, tables->linker, vms);
>      }
>
>      /* XSDT is pointed to by RSDP */
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index 80c8099..068ce28 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -700,6 +700,21 @@ struct AcpiIortItsGroup {
>  } QEMU_PACKED;
>  typedef struct AcpiIortItsGroup AcpiIortItsGroup;
>
> +struct AcpiIortSmmu3 {
> +    ACPI_IORT_NODE_HEADER_DEF
> +    uint64_t base_address;
> +    uint32_t flags;
> +    uint32_t reserved2;
> +    uint64_t vatos_address;
> +    uint32_t model;
> +    uint32_t event_gsiv;
> +    uint32_t pri_gsiv;
> +    uint32_t gerr_gsiv;
> +    uint32_t sync_gsiv;
> +    AcpiIortIdMapping id_mapping_array[0];
> +} QEMU_PACKED;
> +typedef struct AcpiIortSmmu3 AcpiIortSmmu3;
> +
>  struct AcpiIortRC {
>      ACPI_IORT_NODE_HEADER_DEF
>      AcpiIortMemoryAccess memory_properties;
> --
> 2.5.5
>

thanks
-- PMM
