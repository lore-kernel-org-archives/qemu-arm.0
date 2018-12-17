Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3054692wrt;
        Mon, 17 Dec 2018 15:13:54 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UFneJsdBsNK4PZGjDQsKpYabWGUgiwipRPcFIrgoj6XmVGrAZa75P3D4woXuQAGiPgtw/9
X-Received: by 2002:a37:a315:: with SMTP id m21mr13726044qke.152.1545088434218;
        Mon, 17 Dec 2018 15:13:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1545088434; cv=none;
        d=google.com; s=arc-20160816;
        b=l3uE5qmlQWh+uK+JrlkaeW/eIuoABEhNuS7ssohOV1IdUXUC1eHA4oixkb1EeF0wze
         s5msdBUm8d9AJG4cqrrCJOzajr5ztHngg8LwAyXDdgxLIh7mlw9QdC6Bjl83wSC7LCKX
         ju99mug87hjw0GpQzWGnpJls+dF5h4+tG2xxIW5V9vAGYZLcbLqdIC4Tx+JotBaJkkWy
         AT/22TFk40qZ0GTs4qeCBwbB2vXShA19/vvzyO50QslGKfoSdu9mOzmcxgRqTOye/Ktv
         9XpjSLGoYAUr1ojB7jn9JO9fRBKiLwcze7iLCfEr548sHD8+OVbqJtCjNg+AuEPRiwYG
         t5nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date;
        bh=F09XzWmszKJgS4/DucuDWbRH2U9JAY96TvH8FGIpycg=;
        b=FRHzpGg56wDOQkMY5GoLsrOXPRQrvrbgq8sGvshv13i29nOk4kc+5raNhaHSKLrMp7
         /TN7Fvel046wM1E/8Bye4eYw7ThiUd9Hm1/WRvjX4zbW2dRm0otzYLomDsB5Hmgh7Fzp
         zHSAhRgkv5WCbDHLx+jOBrFT4IJRhP/YHRbfwsNYHxyxxcUwfwYCgOZdi1D/vb5xk+/t
         aY3HlWcBhltXt+28CK9AWNs3e9eY8p7Wwrv+DJqH6+sqGSDFwhqEmHGFGoHdes+fm+m9
         lg6+fRrmRq/Y11pWi+qKWlecD7OkG5g+4cjdwfIhAFlaeWDfj3RjPO3r1r3oqQWFlD5n
         jCFA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m10si5204879qtk.397.2018.12.17.15.13.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Dec 2018 15:13:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50418 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gZ25B-000616-IB
	for alex.bennee@linaro.org; Mon, 17 Dec 2018 18:13:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39168)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gZ1w5-000705-Td
	for qemu-arm@nongnu.org; Mon, 17 Dec 2018 18:04:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gZ1w2-0003ks-3C
	for qemu-arm@nongnu.org; Mon, 17 Dec 2018 18:04:29 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47174)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1gZ1w1-0003jt-PT; Mon, 17 Dec 2018 18:04:26 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 01B90D215C;
	Mon, 17 Dec 2018 23:04:24 +0000 (UTC)
Received: from redhat.com (ovpn-120-67.rdu2.redhat.com [10.10.120.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A19EC5D70A;
	Mon, 17 Dec 2018 23:04:22 +0000 (UTC)
Date: Mon, 17 Dec 2018 18:04:21 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181217180208-mutt-send-email-mst@kernel.org>
References: <20181217104838.18957-1-sameo@linux.intel.com>
	<20181217104838.18957-8-sameo@linux.intel.com>
	<20181217132028.4e387d2d@Igors-MacBook-Pro.local>
	<20181217134959.GB4456@caravaggio>
	<20181217163536.034fd13c@Igors-MacBook-Pro.local>
	<20181217164648.GG4456@caravaggio>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20181217164648.GG4456@caravaggio>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 17 Dec 2018 23:04:24 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
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
	Eduardo Habkost <ehabkost@redhat.com>,
	Ben Warren <ben@skyportsystems.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W9zXsPgMn/Vd

On Mon, Dec 17, 2018 at 05:46:48PM +0100, Samuel Ortiz wrote:
> On Mon, Dec 17, 2018 at 04:35:36PM +0100, Igor Mammedov wrote:
> > On Mon, 17 Dec 2018 14:49:59 +0100
> > Samuel Ortiz <sameo@linux.intel.com> wrote:
> >=20
> > > On Mon, Dec 17, 2018 at 01:20:28PM +0100, Igor Mammedov wrote:
> > > > On Mon, 17 Dec 2018 11:48:37 +0100
> > > > Samuel Ortiz <sameo@linux.intel.com> wrote:
> > > >=20
> > > > > Now that build_rsdp() supports building both legacy and current=
 RSDP
> > > > > tables, we can move it to a generic folder (hw/acpi) and have t=
he i386
> > > > > ACPI code reuse it in order to reduce code duplication.
> > > > >=20
> > > > > Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> > > > > Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> > > > > Tested-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> > > > > Reviewed-by: Andrew Jones <drjones@redhat.com>
> > > > > Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> > > > for future reference, if one changes patch in a significant way,
> > > > one is supposed to drop Tested/Reviewed-by tags so that reviewers
> > > > would look at it again and we by mistake won't merge not actually
> > > > reviewed changes.
> > > >=20
> > > > [...]
> > > >=20
> > > > > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > > > > index fb877648ac..846cb6d755 100644
> > > > > --- a/hw/i386/acpi-build.c
> > > > > +++ b/hw/i386/acpi-build.c
> > > > > @@ -2547,35 +2547,6 @@ build_amd_iommu(GArray *table_data, BIOS=
Linker *linker)
> > > > >                   "IVRS", table_data->len - iommu_start, 1, NUL=
L, NULL);
> > > > >  }
> > > > > =20
> > > > > -static void
> > > > > -build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned rs=
dt_tbl_offset)
> > > > > -{
> > > > > -    /* AcpiRsdpDescriptor describes revision 2 RSDP table and =
as result we
> > > > > -     * allocate extra 16 bytes for pc/q35 RSDP rev1 as well. K=
eep extra 16 bytes
> > > > > -     * wasted to make sure we won't breake migration for machi=
ne types older
> > > > > -     * than 2.3 due to size mismatch.
> > > > > -     */
> > > > > -    AcpiRsdpDescriptor *rsdp =3D acpi_data_push(rsdp_table, si=
zeof *rsdp);
> > > > > -    unsigned rsdt_pa_size =3D sizeof(rsdp->rsdt_physical_addre=
ss);
> > > > > -    unsigned rsdt_pa_offset =3D
> > > > > -        (char *)&rsdp->rsdt_physical_address - rsdp_table->dat=
a;
> > > > > -
> > > > > -    bios_linker_loader_alloc(linker, ACPI_BUILD_RSDP_FILE, rsd=
p_table, 16,
> > > > > -                             true /* fseg memory */);
> > > > > -
> > > > > -    memcpy(&rsdp->signature, "RSD PTR ", 8);
> > > > > -    memcpy(rsdp->oem_id, ACPI_BUILD_APPNAME6, 6);
> > > > > -    /* Address to be filled by Guest linker */
> > > > > -    bios_linker_loader_add_pointer(linker,
> > > > > -        ACPI_BUILD_RSDP_FILE, rsdt_pa_offset, rsdt_pa_size,
> > > > > -        ACPI_BUILD_TABLE_FILE, rsdt_tbl_offset);
> > > > > -
> > > > > -    /* Checksum to be filled by Guest linker */
> > > > > -    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FI=
LE,
> > > > > -        (char *)rsdp - rsdp_table->data, 20 /* ACPI rev 1.0 RS=
DP size */,
> > > > > -        (char *)&rsdp->checksum - rsdp_table->data);
> > > > > -}
> > > > > -
> > > > >  typedef
> > > > >  struct AcpiBuildState {
> > > > >      /* Copy of table in RAM (for patching). */
> > > > > @@ -2732,7 +2703,25 @@ void acpi_build(AcpiBuildTables *tables,=
 MachineState *machine)
> > > > >                 slic_oem.id, slic_oem.table_id);
> > > > > =20
> > > > >      /* RSDP is in FSEG memory, so allocate it separately */
> > > > > -    build_rsdp(tables->rsdp, tables->linker, rsdt);
> > > > > +    {
> > > > > +        AcpiRsdpData rsdp_data =3D {
> > > > > +            .revision =3D 0,
> > > > > +            .oem_id =3D ACPI_BUILD_APPNAME6,
> > > > > +            .xsdt_tbl_offset =3D NULL,
> > > > > +            .rsdt_tbl_offset =3D &rsdt,
> > > > > +        };
> > > > > +        build_rsdp(tables->rsdp, tables->linker, &rsdp_data);
> > > > > +        if (!pcmc->rsdp_in_ram) {
> > > > > +            /*
> > > > > +             * Legacy machine types (2.2 and older) expect to =
get a complete
> > > > > +             * revision 2 RSDP table, even though they only lo=
ok at the
> > > > not true, rev is set to 0 for pc machines,
> > > Rev is set to 0 but they effectively expect to get a structure whic=
h
> > > size is the rev 2 one. That's what I meant.
> > >=20
> > > > the point of the original comment was
> > > > that we allocate extra 16 bytes but not actually using them and w=
hy it's bad
> > > > to drop it suddenly.
> > > >
> > > > > +             * revision 0 fields (xsdt pointer is not set). So=
 in order to
> > > > > +             * not break migration to those machine types we w=
aste 16 bytes
> > > > > +             * that we amend to the RSDP revision 0 structure.
> > > >                           ^^^ added
> > > > > +             */
> > > > Perhaps amended original comment would be clearer:
> > > >=20
> > > >    /* We used to allocate extra space for RSDP rev 2 but used onl=
y space for
> > > >     * legacy RSDP and extra bytes were zeroed out. Keep wasting e=
xtra 16 bytes
> > > >     * to make sure we won't breake migration for machine types 2.=
2 and older
> > > >     * due to RSDP blob size mismatch.
> > > >     */
> > > >=20
> > > > > +            build_append_int_noprefix(tables->rsdp, 0, 16);
> > Looks like I've haven't noticed, it might work but are you sure?
> > 0 here is uint64_t and then it's shifted 16 times which is sort of gr=
ay area (undefined behavior)
> AFAIK shifting by N bits when N > width(left operand) is undefined but
> that's not the case here. build_append_int_noprefix(foo, 0, 16) shift a=
 64 bits
> wide unsigned int by 8 bits, for each iterations of a 16 iterations
> loop. So we're doing 16 iterations of properly defined behaviour.
>=20
> Cheers,
> Samuel.

It works fine but is IMHO unnecessarily tricky. Simple

	for (i =3D 0; i < 16; ++i)
		build_append_byte(tables->rsdp, 0)

is imho clearer.


