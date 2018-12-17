Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2633963wrt;
        Mon, 17 Dec 2018 07:36:26 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WLEbWI1g/yGiaX3eobvxkl0EoRBU/xvqzTUAZuAj5m7mxBdJEM6tM/yaUmwq9pEvIkYbxw
X-Received: by 2002:ac8:7308:: with SMTP id x8mr14081249qto.284.1545060986792;
        Mon, 17 Dec 2018 07:36:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1545060986; cv=none;
        d=google.com; s=arc-20160816;
        b=fpLeWGbgo5RgQlV1iSDCRlukmmGE+Wevty/8Z0F9ZdOL9FhGEf493Kup0calMav32B
         qNmlBassypc9U/13zFsiJSJTihf7K0gitALw5rbPICIYmBDDfNfKPQCsRwGA3oDoAlMV
         UrQFy1Oli748reC/TgQ11+LwOMjBhD7Zv4fqWt/LqIN2iTTb4/4ZdFn1piu2NIGd4Pi0
         6Jjx9I5v/OEeVwWbScFkJJ87m4+Q4YphbFeIgQ/Zq1jz7WM8JFZe1DrSuBJggcU7mHYG
         I4oIWjIkEPQkBCZZpqKh8FJRux1/IwPd4iLBKi/Jq5s7jcOLYa2MDqvFJXtN004gExe6
         Zizg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=UNv4x1bIEe+seyrpCCE+x1V6xk+XMzTw88b5+L69Mlc=;
        b=ScE8MvNO3F1rHzqMd5elRy7lyW1f56Tn/MacGN2iAAFnXc0mqaZxsehmTSw0ZSq/+w
         hjZSkdKUUwZ9dcx1JE49uis9eU/vyym7hb+MZqIqLGvj8Uirq1ExA9dnpAdtdXoS1Lr8
         8XZHURYn/l5wHEW8Qn0f8EIGv2dLGBBZOVIHGJpu/jrrStjHR4DLrP51FObLF0Y5cyi/
         Y7RD8Utt0T7nVf2fnr+pTz6icmB4lS6XlqopoYkdjgJBhXjSWqZdPwgwJELJFC02iOBf
         OnnwnXOdlY4m6+h+h+gfVrl4MgxHgTu+SGA3W1/cJ5AQoEwZ4ka2W56NUtQywtOhKn0N
         bdDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q54si7830290qtf.30.2018.12.17.07.36.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Dec 2018 07:36:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47451 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gYuwT-0003k5-O3
	for alex.bennee@linaro.org; Mon, 17 Dec 2018 10:36:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36051)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gYuw0-0003iW-To
	for qemu-devel@nongnu.org; Mon, 17 Dec 2018 10:35:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gYuvz-0005tc-Ol
	for qemu-devel@nongnu.org; Mon, 17 Dec 2018 10:35:56 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33454)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gYuvs-0005pU-L1; Mon, 17 Dec 2018 10:35:48 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B917D1B8A;
	Mon, 17 Dec 2018 15:35:47 +0000 (UTC)
Received: from Igors-MacBook-Pro.local (ovpn-112-32.ams2.redhat.com
	[10.36.112.32])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1A40F608C5;
	Mon, 17 Dec 2018 15:35:39 +0000 (UTC)
Date: Mon, 17 Dec 2018 16:35:36 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181217163536.034fd13c@Igors-MacBook-Pro.local>
In-Reply-To: <20181217134959.GB4456@caravaggio>
References: <20181217104838.18957-1-sameo@linux.intel.com>
	<20181217104838.18957-8-sameo@linux.intel.com>
	<20181217132028.4e387d2d@Igors-MacBook-Pro.local>
	<20181217134959.GB4456@caravaggio>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 17 Dec 2018 15:35:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v4 7/8] hw: acpi: Export and share the ARM
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
	Eduardo Habkost <ehabkost@redhat.com>,
	Ben Warren <ben@skyportsystems.com>, "Michael S.
	Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UtMRC6dOXpMp

On Mon, 17 Dec 2018 14:49:59 +0100
Samuel Ortiz <sameo@linux.intel.com> wrote:

> On Mon, Dec 17, 2018 at 01:20:28PM +0100, Igor Mammedov wrote:
> > On Mon, 17 Dec 2018 11:48:37 +0100
> > Samuel Ortiz <sameo@linux.intel.com> wrote:
> >=20
> > > Now that build_rsdp() supports building both legacy and current RSDP
> > > tables, we can move it to a generic folder (hw/acpi) and have the i386
> > > ACPI code reuse it in order to reduce code duplication.
> > >=20
> > > Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> > > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > > Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > > Reviewed-by: Andrew Jones <drjones@redhat.com>
> > > Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> > for future reference, if one changes patch in a significant way,
> > one is supposed to drop Tested/Reviewed-by tags so that reviewers
> > would look at it again and we by mistake won't merge not actually
> > reviewed changes.
> >=20
> > [...]
> >=20
> > > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > > index fb877648ac..846cb6d755 100644
> > > --- a/hw/i386/acpi-build.c
> > > +++ b/hw/i386/acpi-build.c
> > > @@ -2547,35 +2547,6 @@ build_amd_iommu(GArray *table_data, BIOSLinker=
 *linker)
> > >                   "IVRS", table_data->len - iommu_start, 1, NULL, NUL=
L);
> > >  }
> > > =20
> > > -static void
> > > -build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned rsdt_tbl=
_offset)
> > > -{
> > > -    /* AcpiRsdpDescriptor describes revision 2 RSDP table and as res=
ult we
> > > -     * allocate extra 16 bytes for pc/q35 RSDP rev1 as well. Keep ex=
tra 16 bytes
> > > -     * wasted to make sure we won't breake migration for machine typ=
es older
> > > -     * than 2.3 due to size mismatch.
> > > -     */
> > > -    AcpiRsdpDescriptor *rsdp =3D acpi_data_push(rsdp_table, sizeof *=
rsdp);
> > > -    unsigned rsdt_pa_size =3D sizeof(rsdp->rsdt_physical_address);
> > > -    unsigned rsdt_pa_offset =3D
> > > -        (char *)&rsdp->rsdt_physical_address - rsdp_table->data;
> > > -
> > > -    bios_linker_loader_alloc(linker, ACPI_BUILD_RSDP_FILE, rsdp_tabl=
e, 16,
> > > -                             true /* fseg memory */);
> > > -
> > > -    memcpy(&rsdp->signature, "RSD PTR ", 8);
> > > -    memcpy(rsdp->oem_id, ACPI_BUILD_APPNAME6, 6);
> > > -    /* Address to be filled by Guest linker */
> > > -    bios_linker_loader_add_pointer(linker,
> > > -        ACPI_BUILD_RSDP_FILE, rsdt_pa_offset, rsdt_pa_size,
> > > -        ACPI_BUILD_TABLE_FILE, rsdt_tbl_offset);
> > > -
> > > -    /* Checksum to be filled by Guest linker */
> > > -    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
> > > -        (char *)rsdp - rsdp_table->data, 20 /* ACPI rev 1.0 RSDP siz=
e */,
> > > -        (char *)&rsdp->checksum - rsdp_table->data);
> > > -}
> > > -
> > >  typedef
> > >  struct AcpiBuildState {
> > >      /* Copy of table in RAM (for patching). */
> > > @@ -2732,7 +2703,25 @@ void acpi_build(AcpiBuildTables *tables, Machi=
neState *machine)
> > >                 slic_oem.id, slic_oem.table_id);
> > > =20
> > >      /* RSDP is in FSEG memory, so allocate it separately */
> > > -    build_rsdp(tables->rsdp, tables->linker, rsdt);
> > > +    {
> > > +        AcpiRsdpData rsdp_data =3D {
> > > +            .revision =3D 0,
> > > +            .oem_id =3D ACPI_BUILD_APPNAME6,
> > > +            .xsdt_tbl_offset =3D NULL,
> > > +            .rsdt_tbl_offset =3D &rsdt,
> > > +        };
> > > +        build_rsdp(tables->rsdp, tables->linker, &rsdp_data);
> > > +        if (!pcmc->rsdp_in_ram) {
> > > +            /*
> > > +             * Legacy machine types (2.2 and older) expect to get a =
complete
> > > +             * revision 2 RSDP table, even though they only look at =
the
> > not true, rev is set to 0 for pc machines,
> Rev is set to 0 but they effectively expect to get a structure which
> size is the rev 2 one. That's what I meant.
>=20
> > the point of the original comment was
> > that we allocate extra 16 bytes but not actually using them and why it'=
s bad
> > to drop it suddenly.
> >
> > > +             * revision 0 fields (xsdt pointer is not set). So in or=
der to
> > > +             * not break migration to those machine types we waste 1=
6 bytes
> > > +             * that we amend to the RSDP revision 0 structure.
> >                           ^^^ added
> > > +             */
> > Perhaps amended original comment would be clearer:
> >=20
> >    /* We used to allocate extra space for RSDP rev 2 but used only spac=
e for
> >     * legacy RSDP and extra bytes were zeroed out. Keep wasting extra 1=
6 bytes
> >     * to make sure we won't breake migration for machine types 2.2 and =
older
> >     * due to RSDP blob size mismatch.
> >     */
> >=20
> > > +            build_append_int_noprefix(tables->rsdp, 0, 16);
Looks like I've haven't noticed, it might work but are you sure?
0 here is uint64_t and then it's shifted 16 times which is sort of gray are=
a (undefined behavior)

using g_array_append_val[s]() here might be better

> > > +        }
> > > +    }
> > > =20
> > >      /* We'll expose it all to Guest so we want to reduce
> > >       * chance of size changes.
> >=20
> > With comment fixed:
> > Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> >=20
> > since it's minor fixup and doesn't affect applying remaining patches yo=
u can post
> > v5 7/8 as reply to v4 7/8
> I'll do that.
> Since I assume the 16 bytes addition is a significant change, I'll also r=
emove all
> reviewed-by/tested-by tags from this patch, except yours.
>=20
> Cheers,
> Samuel.
>=20

