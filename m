Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp8102890wrt;
        Tue, 4 Dec 2018 06:03:28 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VWBEg66mNDRmHKiZv1ZySYF8OUp5DgOZ4AWaHB9pIqlJcaJvlc/2cj/MnZvUF/ViuoaP52
X-Received: by 2002:ac8:39c2:: with SMTP id v60mr19562645qte.142.1543932208461;
        Tue, 04 Dec 2018 06:03:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543932208; cv=none;
        d=google.com; s=arc-20160816;
        b=jPvbjDvgTbACQvMheFrquLQm3vfqh7rgpy215pLLe6JL9v8xYsKZPUcc+7wNvhYxTN
         o+5YoK87h5bCoIPPPonrgInLfm5IFvhi7MLttI+HxKD4InBYSZ/HWWsdfmvl1tkFGdGV
         vdC1iDF/RLl3wAU6nJ4rSWw8LdATtnVYmTHKjsA2lNf/9q3ntuW+7wl7eirKkoJM6UZd
         FsI3IKQg4C3+hmqBIaexaAsPX1DzoB8Ren0tkSMb+oK870IiLyeN0iuRN+PdtojzGIVF
         0oLpuxPTHKJKtiatgPtSh2Gek75FS6CU1xd4enifkbELHetbANvfD5AEWgpoHwSMnfPZ
         gBKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=pPS6Rr2ufZBqmuUjzBrtWCRd6SlGw+5eXpkutUHcUeE=;
        b=S/lDs/rUPY3fAYqWI84NFaBtZXSUdPrQEsF7BitWifxFxrr/odbGob3gtcfgOsEkdh
         3RqhW1+Vq4jnwJovQffrFfw8xE+CwIVoKCUH9Y36e3FP62z0i31ZBF4a7adXTUQQISIV
         qJKIRZevUHcdNwNd6/fhJqd0pkEBt1eSNKsMNNfRVwfL1rxXPfbq71OShWi2Xg9MbyuY
         hHR3mstFAxnFTje55ox42DITElHeg9k7cXSYzTR3BUv+Cw7vQ6/kRWadvFN5PLAdKzEf
         4I91Rs45LzIDRUC3qEM4IJ0f8FY5nEN9DQmwRyzKqt3Efj3fYka64DlZw7Y5wW8PSWSE
         M+Fg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e7si3112146qvp.159.2018.12.04.06.03.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Dec 2018 06:03:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56981 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUBIO-0002AV-0W
	for alex.bennee@linaro.org; Tue, 04 Dec 2018 09:03:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41306)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gUBGe-0001To-Px
	for qemu-devel@nongnu.org; Tue, 04 Dec 2018 09:01:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gUBGb-0003FP-JG
	for qemu-devel@nongnu.org; Tue, 04 Dec 2018 09:01:40 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55400)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gUBGR-00038h-7h; Tue, 04 Dec 2018 09:01:28 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 34EBA3082138;
	Tue,  4 Dec 2018 14:01:26 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 39DBC5D785;
	Tue,  4 Dec 2018 14:01:20 +0000 (UTC)
Date: Tue, 4 Dec 2018 15:01:18 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181204150118.6d4a1c09@redhat.com>
In-Reply-To: <20181130130032.11835-8-sameo@linux.intel.com>
References: <20181130130032.11835-1-sameo@linux.intel.com>
	<20181130130032.11835-8-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Tue, 04 Dec 2018 14:01:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 7/8] hw: acpi: Export and share the ARM
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
X-TUID: mvpYyx3UgIiR

On Fri, 30 Nov 2018 14:00:31 +0100
Samuel Ortiz <sameo@linux.intel.com> wrote:

> Now that build_rsdp() supports building both legacy and current RSDP
> tables, we can move it to a generic folder (hw/acpi) and have the i386
> ACPI code reuse it in order to reduce code duplication.
>=20
> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  include/hw/acpi/aml-build.h |  2 ++
>  hw/acpi/aml-build.c         | 68 +++++++++++++++++++++++++++++++++++++
>  hw/arm/virt-acpi-build.c    | 66 -----------------------------------
>  hw/i386/acpi-build.c        | 39 +++++----------------
>  4 files changed, 79 insertions(+), 96 deletions(-)
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
> index 1e43cd736d..555c24f21d 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -1589,6 +1589,74 @@ void acpi_build_tables_cleanup(AcpiBuildTables *ta=
bles, bool mfre)
>      g_array_free(tables->vmgenid, mfre);
>  }
> =20
> +/*
> + * ACPI spec 5.2.5.3 Root System Description Pointer (RSDP).
> + * (Revision 1.0 or later)
> + */
> +void
> +build_rsdp(GArray *tbl, BIOSLinker *linker, AcpiRsdpData *rsdp_data)
> +{
> +    int tbl_off =3D tbl->len; /* Table offset in the RSDP file */
> +
> +    switch (rsdp_data->revision) {
> +    case 0:
> +        /* With ACPI 1.0, we must have an RSDT pointer */
> +        g_assert(rsdp_data->rsdt_tbl_offset);
> +        break;
> +    case 2:
> +        /* With ACPI 2.0+, we must have an XSDT pointer */
> +        g_assert(rsdp_data->xsdt_tbl_offset);
> +        break;
> +    default:
> +        /* Only revisions 0 (ACPI 1.0) and 2 (ACPI 2.0+) are valid for R=
SDP */
> +        g_assert_not_reached();
> +    }
> +
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
> +        bios_linker_loader_add_pointer(linker, ACPI_BUILD_RSDP_FILE,
> +                                       tbl_off + 16, 4,
> +                                       ACPI_BUILD_TABLE_FILE,
> +                                       *rsdp_data->rsdt_tbl_offset);
> +    }
> +
> +    /* Checksum to be filled by guest linker */
> +    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
> +                                    tbl_off, 20, /* ACPI rev 1.0 RSDP si=
ze */
> +                                    8);
> +
> +    if (rsdp_data->revision =3D=3D 0) {
> +        /* ACPI 1.0 RSDP, we're done */
> +        return;
> +    }
> +
> +    build_append_int_noprefix(tbl, 36, 4); /* Length */
> +
> +    /* XSDT address to be filled by guest linker */
> +    build_append_int_noprefix(tbl, 0, 8); /* XsdtAddress */
> +    /* We already validated our xsdt pointer */
> +    bios_linker_loader_add_pointer(linker, ACPI_BUILD_RSDP_FILE,
> +                                   tbl_off + 24, 8,
> +                                   ACPI_BUILD_TABLE_FILE,
> +                                   *rsdp_data->xsdt_tbl_offset);
> +
> +    build_append_int_noprefix(tbl, 0, 1); /* Extended Checksum */
> +    build_append_int_noprefix(tbl, 0, 3); /* Reserved */
> +
> +    /* Extended checksum to be filled by Guest linker */
> +    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
> +                                    tbl_off, 36, /* ACPI rev 2.0 RSDP si=
ze */
> +                                    32);
> +}
> +
>  /* Build rsdt table */
>  void
>  build_rsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 4b212fa44c..95fad6f0ce 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -366,72 +366,6 @@ static void acpi_dsdt_add_power_button(Aml *scope)
>      aml_append(scope, dev);
>  }
> =20
> -/* RSDP */
> -static void
> -build_rsdp(GArray *tbl, BIOSLinker *linker, AcpiRsdpData *rsdp_data)
> -{
> -
> -    int tbl_off =3D tbl->len; /* Table offset in the RSDP file */
> -
> -    switch (rsdp_data->revision) {
> -    case 0:
> -        /* With ACPI 1.0, we must have an RSDT pointer */
> -        g_assert(rsdp_data->rsdt_tbl_offset);
> -        break;
> -    case 2:
> -        /* With ACPI 2.0+, we must have an XSDT pointer */
> -        g_assert(rsdp_data->xsdt_tbl_offset);
> -        break;
> -    default:
> -        /* Only revisions 0 (ACPI 1.0) and 2 (ACPI 2.0+) are valid for R=
SDP */
> -        g_assert_not_reached();
> -    }
> -
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
> -        bios_linker_loader_add_pointer(linker, ACPI_BUILD_RSDP_FILE,
> -                                       tbl_off + 16, 4,
> -                                       ACPI_BUILD_TABLE_FILE,
> -                                       *rsdp_data->rsdt_tbl_offset);
> -    }
> -
> -    /* Checksum to be filled by guest linker */
> -    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
> -                                    tbl_off, 20, /* ACPI rev 1.0 RSDP si=
ze */
> -                                    8);
> -
> -    if (rsdp_data->revision =3D=3D 0) {
> -        /* ACPI 1.0 RSDP, we're done */
> -        return;
> -    }
[...]

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
Removing this part here and not moving it somewhere else doesn't look right.
[...]

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
I'd suggest to keep build_rsdp() clean, move comment above comment
and add an extra padding for machine versions 2.2 and older here.
See pc_i440fx_2_2_machine_options() we probably can use pcmc->rsdp_in_ram as
condition for padding.

And test migration (pingpong) from this QEMU build to 2.2 and 2.3 builds,
in case something else was missed.

> +    }
> =20
>      /* We'll expose it all to Guest so we want to reduce
>       * chance of size changes.

