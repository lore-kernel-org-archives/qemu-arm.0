Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2417828wrt;
        Mon, 17 Dec 2018 04:20:50 -0800 (PST)
X-Google-Smtp-Source: AFSGD/X+P1uOi94UesGwQxPpMP4BmwQ2XBqW16NMXLlDmnhr+D8hQr1MGDr+GtQYGTu0DjLD2G74
X-Received: by 2002:ac8:48c1:: with SMTP id l1mr12863207qtr.71.1545049250474;
        Mon, 17 Dec 2018 04:20:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1545049250; cv=none;
        d=google.com; s=arc-20160816;
        b=lg7+rMlkiBW9P1HH2v23VoGYlGUxyMZqD6Jc0kcbE9GDZGHFkd6iVw02hTxt2hiB1s
         uQnNNRMabpN49nnd5qzOetnW9CKb1vfQFk0UmGMffZtrO4oxbzNYzgmwpaUnW8UvWYn3
         mW6ngmGA0OnR30DrmD/ZsNZ7yBPVpLLRsz3kS0hosuzW+DeByqPq0quzBn2BhNSK+MWz
         /Jio0NNzH+gJQ0bODhR7pQz//f8O0tpcKINcISVDDq8QxQPs1lm1rtR4nqzvUMv61Gs0
         YWrUdOKlV6iaD7EFPKHP1jQHtVCmZSkmGhp9x+vdpPA6V/93U4qt1AMzwZmTz9AxWTLO
         p6Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=v+YlfK+MPLmKRY4eWfi/PQNnyd5uX3Ik1N6dLFk2WAo=;
        b=C6PFrfif81BQWzhBb4bucYDHWhwwiRc6qp72S8SIegIkhY92q8K+TD2n+4mfvGZOs2
         33RRdGpIAQfsLDwdKCQoyf764MQAiKAxBrKz6AaHF9dGS3accEsZGAYx6+ONNy3NHXyL
         +YxCxB726O/BRZ9A8XMDjkkuvHsnujwi1QxEVYc3Ow+NEjLrTz5qWMkyTHCizg8/8BHr
         cybaqD2UXR7Lrk0lRf79yj4vaJZodHRiQDmjrlWfB1uivlVJ2JABOtp3lOjR5KwZub5+
         knrhOEqaAypP1Xs+Xdk+h89saWQwZVgTy72RuYAUfNagh/Y0G0EmZoun4R2cs36gEMFd
         yeeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e10si581187qtb.330.2018.12.17.04.20.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Dec 2018 04:20:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46334 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gYrtC-0000Kx-0p
	for alex.bennee@linaro.org; Mon, 17 Dec 2018 07:20:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36484)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gYrt5-0000Kq-Qe
	for qemu-arm@nongnu.org; Mon, 17 Dec 2018 07:20:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gYrt0-0002UQ-VE
	for qemu-arm@nongnu.org; Mon, 17 Dec 2018 07:20:43 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60834)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gYrt0-0002Tn-NH; Mon, 17 Dec 2018 07:20:38 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E1C9C12E4F5;
	Mon, 17 Dec 2018 12:20:37 +0000 (UTC)
Received: from Igors-MacBook-Pro.local (ovpn-112-32.ams2.redhat.com
	[10.36.112.32])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9106719754;
	Mon, 17 Dec 2018 12:20:32 +0000 (UTC)
Date: Mon, 17 Dec 2018 13:20:28 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181217132028.4e387d2d@Igors-MacBook-Pro.local>
In-Reply-To: <20181217104838.18957-8-sameo@linux.intel.com>
References: <20181217104838.18957-1-sameo@linux.intel.com>
	<20181217104838.18957-8-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 17 Dec 2018 12:20:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 7/8] hw: acpi: Export and
 share the ARM RSDP build
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Ben Warren <ben@skyportsystems.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v+dEunvJ1nYQ

On Mon, 17 Dec 2018 11:48:37 +0100
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
for future reference, if one changes patch in a significant way,
one is supposed to drop Tested/Reviewed-by tags so that reviewers
would look at it again and we by mistake won't merge not actually
reviewed changes.

[...]

> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index fb877648ac..846cb6d755 100644
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
> @@ -2732,7 +2703,25 @@ void acpi_build(AcpiBuildTables *tables, MachineSt=
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
> +        if (!pcmc->rsdp_in_ram) {
> +            /*
> +             * Legacy machine types (2.2 and older) expect to get a comp=
lete
> +             * revision 2 RSDP table, even though they only look at the
not true, rev is set to 0 for pc machines, the point of the original commen=
t was
that we allocate extra 16 bytes but not actually using them and why it's bad
to drop it suddenly.

> +             * revision 0 fields (xsdt pointer is not set). So in order =
to
> +             * not break migration to those machine types we waste 16 by=
tes
> +             * that we amend to the RSDP revision 0 structure.
                          ^^^ added
> +             */
Perhaps amended original comment would be clearer:

   /* We used to allocate extra space for RSDP rev 2 but used only space for
    * legacy RSDP and extra bytes were zeroed out. Keep wasting extra 16 by=
tes
    * to make sure we won't breake migration for machine types 2.2 and older
    * due to RSDP blob size mismatch.
    */

> +            build_append_int_noprefix(tables->rsdp, 0, 16);
> +        }
> +    }
> =20
>      /* We'll expose it all to Guest so we want to reduce
>       * chance of size changes.

With comment fixed:
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

since it's minor fixup and doesn't affect applying remaining patches you ca=
n post
v5 7/8 as reply to v4 7/8
