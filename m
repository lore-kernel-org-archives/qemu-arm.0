Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3389409wrt;
        Fri, 30 Nov 2018 02:06:43 -0800 (PST)
X-Google-Smtp-Source: AFSGD/V8KBUjU0Ebd1fZqjg6B8ecpEPAGmd0A9TlgtPIRQIPoDb+Om3mFueJ1jTtziHG8BS9fQ7O
X-Received: by 2002:a81:441f:: with SMTP id r31mr4939017ywa.48.1543572403545;
        Fri, 30 Nov 2018 02:06:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543572403; cv=none;
        d=google.com; s=arc-20160816;
        b=RR60yaszaG4mKVcbapsbvMgGvJNswoPYmrRuWDgVkuTCQd8Xg08uNFOYd4TLf4JbAV
         4VzweorSe3CUAE4igfIRPew7g0OLMSDW68PeiuQN4DYMF0NyRdFLwge9oN25GnQW/5in
         rsRzjs+7kkd5f7gENu1tf5e+XNW4LV2bsjUBKUq/RJL0/AVQn4gqkbs1mqFnN2/8RSio
         PKt2s9Stimx2yJ6cnJBT5lA4iGw5FuoYBdCmjQ9Pd4cMimk4HW5hXrsvO9kCF+D1p7na
         HXFQdpIXBq6MzacEzO3CURmGYa6Elom14MVOafuBsPdxeuHeHaEwgpXf0fAMifOD5l+W
         5HuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=LMcJyV5nuiMKz25YmTfK1NMlyjanCIrBLent+RTMi0E=;
        b=gHzuMWm/Xk3MOLBghlnEj2V276E6ZIfe2u7GIurdNx5/Jn8mwAteDQM+eXataEvG4B
         6uq/ERUwzILPq78aKUvKVXvlxLzBd1xX9uq4F4Xl5Sr5LgdoM4m0i6kSSILInsptCH2R
         hDE8Iuac5RXMGxCy2DZgurEHZ0pU4fWPTiuC/JqQ07gs8yb6iQTiacjuCB1hqrLlMOh3
         ZhAusvlnVpBo2AegznPmTRhygQ2DjRFSpXFauTX2WR1gXmCEE3g1dalS3AHBDkno6Js7
         utG189fYTatBUhy24Of0wxBfPXgUoN7M3T5zTlJlDfriOW7d2xtSud+4w2cZFu4oPCiV
         iEbA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n5-v6si2821162ybk.64.2018.11.30.02.06.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Nov 2018 02:06:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59126 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSfh5-0008Hx-0I
	for alex.bennee@linaro.org; Fri, 30 Nov 2018 05:06:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46773)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gSfeE-0006ed-S2
	for qemu-devel@nongnu.org; Fri, 30 Nov 2018 05:03:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gSfeB-0006nb-B9
	for qemu-devel@nongnu.org; Fri, 30 Nov 2018 05:03:46 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58430)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gSfdw-0006Ub-GN; Fri, 30 Nov 2018 05:03:30 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 384AD41A5B;
	Fri, 30 Nov 2018 10:03:25 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 299DE1019637;
	Fri, 30 Nov 2018 10:03:19 +0000 (UTC)
Date: Fri, 30 Nov 2018 11:03:17 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181130110317.08192149@redhat.com>
In-Reply-To: <20181129132428.333-8-sameo@linux.intel.com>
References: <20181129132428.333-1-sameo@linux.intel.com>
	<20181129132428.333-8-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 30 Nov 2018 10:03:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 7/8] hw: acpi: Export and share the ARM
 RSDP build
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Ben Warren <ben@skyportsystems.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 245eYnjyf3cj

On Thu, 29 Nov 2018 14:24:27 +0100
Samuel Ortiz <sameo@linux.intel.com> wrote:

> Now that build_rsdp() supports building both legacy and current RSDP
> tables, we can move it to a generic folder (hw/acpi) and have the i386
> ACPI code reuse it in order to reduce code duplication.
>=20
> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
with nit below fixed

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  include/hw/acpi/aml-build.h |  2 ++
>  hw/acpi/aml-build.c         | 50 +++++++++++++++++++++++++++++++++++++
>  hw/arm/virt-acpi-build.c    | 50 -------------------------------------
>  hw/i386/acpi-build.c        | 39 +++++++----------------------
>  4 files changed, 61 insertions(+), 80 deletions(-)
>=20
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index 6c36903c0a..1a563ad756 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -388,6 +388,8 @@ void acpi_add_table(GArray *table_offsets, GArray *ta=
ble_data);
>  void acpi_build_tables_init(AcpiBuildTables *tables);
>  void acpi_build_tables_cleanup(AcpiBuildTables *tables, bool mfre);
>  void
> +build_rsdp(GArray *tbl, BIOSLinker *linker, AcpiRsdpData *rsdp_data);
> +void
>  build_rsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
>             const char *oem_id, const char *oem_table_id);
>  void
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index 1e43cd736d..3d5f77e02b 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -1589,6 +1589,56 @@ void acpi_build_tables_cleanup(AcpiBuildTables *ta=
bles, bool mfre)
>      g_array_free(tables->vmgenid, mfre);
>  }
> =20
> +/* RSDP */
> +void
> +build_rsdp(GArray *tbl, BIOSLinker *linker, AcpiRsdpData *rsdp_data)
> +{
> +    bios_linker_loader_alloc(linker, ACPI_BUILD_RSDP_FILE, tbl, 16,
> +                             true /* fseg memory */);
> +
> +    g_array_append_vals(tbl, "RSD PTR ", 8); /* Signature */
> +    build_append_int_noprefix(tbl, 0, 1); /* Checksum */
> +    g_array_append_vals(tbl, rsdp_data->oem_id, 6); /* OEMID */
> +    build_append_int_noprefix(tbl, rsdp_data->revision, 1); /* Revision =
*/
> +    build_append_int_noprefix(tbl, 0, 4); /* RsdtAddress */
> +    if (rsdp_data->rsdt_tbl_offset) {
> +        /* RSDT address to be filled by guest linker */
> +        bios_linker_loader_add_pointer(linker,
> +                                       ACPI_BUILD_RSDP_FILE, 16, 4,
> +                                       ACPI_BUILD_TABLE_FILE,
> +                                       *rsdp_data->rsdt_tbl_offset);
> +    }
> +
> +    /* Checksum to be filled by guest linker */
> +    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
> +                                    0, 20, /* ACPI rev 1.0 RSDP size */
> +                                    8);
> +
> +    if (rsdp_data->revision =3D=3D 0) {
> +        /* ACPI 1.0 RSDP, we're done */
> +        return;
> +    }
> +
> +    /* The RSDP revision is 2 and later, we must have an XSDT pointer */
> +    g_assert(rsdp_data->xsdt_tbl_offset !=3D NULL);
> +
> +    build_append_int_noprefix(tbl, 36, 4); /* Length */
> +
> +    /* XSDT address to be filled by guest linker */
> +    build_append_int_noprefix(tbl, 0, 8); /* XsdtAddress */
> +    bios_linker_loader_add_pointer(linker, ACPI_BUILD_RSDP_FILE, 24, 8,
> +                                   ACPI_BUILD_TABLE_FILE,
> +                                   *rsdp_data->xsdt_tbl_offset);
> +
> +    build_append_int_noprefix(tbl, 0, 1); /* Extended Checksum */
> +    build_append_int_noprefix(tbl, 0, 3); /* Reserved */
> +
> +    /* Extended checksum to be filled by Guest linker */
> +    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
> +                                    0, 36, /* ACPI rev 2.0 RSDP size */
> +                                    32);
> +}
> +
>  /* Build rsdt table */
>  void
>  build_rsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index e1338b6f5a..95fad6f0ce 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -366,56 +366,6 @@ static void acpi_dsdt_add_power_button(Aml *scope)
>      aml_append(scope, dev);
>  }
> =20
> -/* RSDP */
I'd make comment more descriptive, see build_slit() for example

> -static void
> -build_rsdp(GArray *tbl, BIOSLinker *linker, AcpiRsdpData *rsdp_data)
> -{
> -    bios_linker_loader_alloc(linker, ACPI_BUILD_RSDP_FILE, tbl, 16,
> -                             true /* fseg memory */);
> -
> -    g_array_append_vals(tbl, "RSD PTR ", 8); /* Signature */
> -    build_append_int_noprefix(tbl, 0, 1); /* Checksum */
> -    g_array_append_vals(tbl, rsdp_data->oem_id, 6); /* OEMID */
> -    build_append_int_noprefix(tbl, rsdp_data->revision, 1); /* Revision =
*/
> -    build_append_int_noprefix(tbl, 0, 4); /* RsdtAddress */
> -    if (rsdp_data->rsdt_tbl_offset) {
> -        /* RSDT address to be filled by guest linker */
> -        bios_linker_loader_add_pointer(linker,
> -                                       ACPI_BUILD_RSDP_FILE, 16, 4,
> -                                       ACPI_BUILD_TABLE_FILE,
> -                                       *rsdp_data->rsdt_tbl_offset);
> -    }
> -
> -    /* Checksum to be filled by guest linker */
> -    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
> -                                    0, 20, /* ACPI rev 1.0 RSDP size */
> -                                    8);
> -
> -    if (rsdp_data->revision =3D=3D 0) {
> -        /* ACPI 1.0 RSDP, we're done */
> -        return;
> -    }
> -
> -    /* The RSDP revision is 2 and later, we must have an XSDT pointer */
> -    g_assert(rsdp_data->xsdt_tbl_offset !=3D NULL);
> -
> -    build_append_int_noprefix(tbl, 36, 4); /* Length */
> -
> -    /* XSDT address to be filled by guest linker */
> -    build_append_int_noprefix(tbl, 0, 8); /* XsdtAddress */
> -    bios_linker_loader_add_pointer(linker, ACPI_BUILD_RSDP_FILE, 24, 8,
> -                                   ACPI_BUILD_TABLE_FILE,
> -                                   *rsdp_data->xsdt_tbl_offset);
> -
> -    build_append_int_noprefix(tbl, 0, 1); /* Extended Checksum */
> -    build_append_int_noprefix(tbl, 0, 3); /* Reserved */
> -
> -    /* Extended checksum to be filled by Guest linker */
> -    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
> -                                    0, 36, /* ACPI rev 2.0 RSDP size */
> -                                    32);
> -}
> -
>  static void
>  build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  {
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index fb877648ac..528a5fd4ed 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -2547,35 +2547,6 @@ build_amd_iommu(GArray *table_data, BIOSLinker *li=
nker)
>                   "IVRS", table_data->len - iommu_start, 1, NULL, NULL);
>  }
> =20
> -static void
> -build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned rsdt_tbl_off=
set)
> -{
> -    /* AcpiRsdpDescriptor describes revision 2 RSDP table and as result =
we
> -     * allocate extra 16 bytes for pc/q35 RSDP rev1 as well. Keep extra =
16 bytes
> -     * wasted to make sure we won't breake migration for machine types o=
lder
> -     * than 2.3 due to size mismatch.
> -     */
> -    AcpiRsdpDescriptor *rsdp =3D acpi_data_push(rsdp_table, sizeof *rsdp=
);
> -    unsigned rsdt_pa_size =3D sizeof(rsdp->rsdt_physical_address);
> -    unsigned rsdt_pa_offset =3D
> -        (char *)&rsdp->rsdt_physical_address - rsdp_table->data;
> -
> -    bios_linker_loader_alloc(linker, ACPI_BUILD_RSDP_FILE, rsdp_table, 1=
6,
> -                             true /* fseg memory */);
> -
> -    memcpy(&rsdp->signature, "RSD PTR ", 8);
> -    memcpy(rsdp->oem_id, ACPI_BUILD_APPNAME6, 6);
> -    /* Address to be filled by Guest linker */
> -    bios_linker_loader_add_pointer(linker,
> -        ACPI_BUILD_RSDP_FILE, rsdt_pa_offset, rsdt_pa_size,
> -        ACPI_BUILD_TABLE_FILE, rsdt_tbl_offset);
> -
> -    /* Checksum to be filled by Guest linker */
> -    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
> -        (char *)rsdp - rsdp_table->data, 20 /* ACPI rev 1.0 RSDP size */,
> -        (char *)&rsdp->checksum - rsdp_table->data);
> -}
> -
>  typedef
>  struct AcpiBuildState {
>      /* Copy of table in RAM (for patching). */
> @@ -2732,7 +2703,15 @@ void acpi_build(AcpiBuildTables *tables, MachineSt=
ate *machine)
>                 slic_oem.id, slic_oem.table_id);
> =20
>      /* RSDP is in FSEG memory, so allocate it separately */
> -    build_rsdp(tables->rsdp, tables->linker, rsdt);
> +    {
> +        AcpiRsdpData rsdp_data =3D {
> +            .revision =3D 0,
> +            .oem_id =3D ACPI_BUILD_APPNAME6,
> +            .xsdt_tbl_offset =3D NULL,
> +            .rsdt_tbl_offset =3D &rsdt,
> +        };
> +        build_rsdp(tables->rsdp, tables->linker, &rsdp_data);
> +    }
> =20
>      /* We'll expose it all to Guest so we want to reduce
>       * chance of size changes.

