Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp532467wrt;
        Tue, 27 Nov 2018 19:26:49 -0800 (PST)
X-Google-Smtp-Source: AFSGD/U0OkkaCmdwht7uxXe49oSfUdlTzLxjYvKyhJCitw3o2HGtdO9jaXTLTOBY3COeNkc5z69Q
X-Received: by 2002:a81:4506:: with SMTP id s6mr32497328ywa.200.1543375609811;
        Tue, 27 Nov 2018 19:26:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543375609; cv=none;
        d=google.com; s=arc-20160816;
        b=rKdzNqMwrqyay3/ScovdOHprD2YNDpfujIhuBPW3ndK8x5TNtmzCjEFnVOUpOiqaMq
         f/bSFv/J47SqYEpAIsDeO+1hiTWMt04x8680XXL1oK8mustO3aQwggV8AyqyNl7YhC/x
         30i+UhqWbly78uTIClQJ3d4fJcE/vyNDDhHGskGrAHtyMMoxfq7Ssd/nuNA0xBj2ME82
         WIaY/NCJ/OHurYnMHJfhDKAGy/ZQcpKuPzEWNOOwmmjel4yIoIbdGuXB86X2BAfuES/2
         G85w+Q9NMUSSv5bYcx3sMlq/wIlSCpd5W38BYydmMGoNFJ8Y/bOILjZUGqWvBMpsEzFV
         mjEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=xKWZuN/zA4BXPTdN6tHOmlOAEfO6qDzDlaHt9UEd7RE=;
        b=RN2k+f7QOTdiF3FrfCAFXaKw0VIw6SFzwhaG09z8rDL5+OF17YuIrvKAPjbqBxH+F2
         vNUUmTfzJFDgJAOCEx6iFjOWdLKjA+skjWu9DcpUkQKy76UboPvKdSBLrKnm2oD9mxR7
         Ydd/SoeZ/jzO06E7FNsvguDcDJDjk11aKZF1nln/sibR51ayiJaeKKzJdGA5fw3G9VKX
         l+EObJSDiQd62KNWyY41SbVpAgRaUgt7agsiRg838+qOBAOKkP4Y1/7xqpb32WtY78SV
         HRWSgdi1qIl6WLBlfLirI1LyCY9kyuXanGy/WScDC1EcgV4n07bgzJ6QEthP9wpHHpzx
         F78A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z124-v6si3798519yba.78.2018.11.27.19.26.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Nov 2018 19:26:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45670 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRqUz-0000zP-8t
	for alex.bennee@linaro.org; Tue, 27 Nov 2018 22:26:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45758)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gRqUs-0000z7-Cm
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 22:26:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gRqUn-0001p2-Ik
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 22:26:42 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43726)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1gRqUn-0001oX-BF; Tue, 27 Nov 2018 22:26:37 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 290C330820EE;
	Wed, 28 Nov 2018 03:26:36 +0000 (UTC)
Received: from redhat.com (ovpn-121-88.rdu2.redhat.com [10.10.121.88])
	by smtp.corp.redhat.com (Postfix) with SMTP id 0A54C600C0;
	Wed, 28 Nov 2018 03:26:30 +0000 (UTC)
Date: Tue, 27 Nov 2018 22:26:30 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20181127221515-mutt-send-email-mst@kernel.org>
References: <20181126162942.21258-1-sameo@linux.intel.com>
	<20181126162942.21258-5-sameo@linux.intel.com>
	<20181127162551.29608eeb@redhat.com>
	<20181127154218.GA5677@caravaggio>
	<20181127172749.75a036b4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181127172749.75a036b4@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Wed, 28 Nov 2018 03:26:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 4/8] hw: arm: Carry RSDP specific data
 through AcpiRsdpData
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
	Samuel Ortiz <sameo@linux.intel.com>,
	Ben Warren <ben@skyportsystems.com>, qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: imXmVtfFve+Y

On Tue, Nov 27, 2018 at 05:27:49PM +0100, Igor Mammedov wrote:
> On Tue, 27 Nov 2018 16:42:18 +0100
> Samuel Ortiz <sameo@linux.intel.com> wrote:
> 
> > Hi Igor,
> > 
> > On Tue, Nov 27, 2018 at 04:25:51PM +0100, Igor Mammedov wrote:
> > > On Mon, 26 Nov 2018 17:29:37 +0100
> > > Samuel Ortiz <sameo@linux.intel.com> wrote:
> > >   
> > > > That will allow us to generalize the ARM build_rsdp() routine to support
> > > > both legacy RSDP (The current i386 implementation) and extended RSDP
> > > > (The ARM implementation).
> > > > 
> > > > Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> > > > ---
> > > >  include/hw/acpi/acpi-defs.h | 11 +++++++++++
> > > >  hw/arm/virt-acpi-build.c    | 27 ++++++++++++++++++++++-----
> > > >  2 files changed, 33 insertions(+), 5 deletions(-)
> > > > 
> > > > diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> > > > index af8e023968..e7fd24c6c5 100644
> > > > --- a/include/hw/acpi/acpi-defs.h
> > > > +++ b/include/hw/acpi/acpi-defs.h
> > > > @@ -53,6 +53,17 @@ struct AcpiRsdpDescriptor {        /* Root System Descriptor Pointer */
> > > >  } QEMU_PACKED;
> > > >  typedef struct AcpiRsdpDescriptor AcpiRsdpDescriptor;
> > > >  
> > > > +typedef struct AcpiRsdpData {
> > > > +    uint8_t oem_id[6]; /* OEM identification */
> > > > +    uint8_t revision;  /* Must be 0 for 1.0, 2 for 2.0 */
> > > > +
> > > > +    unsigned *rsdt_tbl_offset;
> > > > +    unsigned *xsdt_tbl_offset;
> > > > +} AcpiRsdpData;
> > > > +  
> > >   
> > > > +#define ACPI_RSDP_REV_1 0
> > > > +#define ACPI_RSDP_REV_2 2  
> > > it's one time used spec defined values so just use values directly
> > > in place with a comment, so reader won't have to jump around code
> > > when comparing to spec.  
> > It's also used in the ACPI tests fix patch.
> it's better to use in test it's own version (we just opencode them there)
> see fadt_fetch_facs_and_dsdt_ptrs()/sanitize_fadt_ptrs()
> same applies for length.
> that way if we break it in qemu's code test would catch the thing
> 
> > Also the 0 for revision 1 is a little confusing, I feel the above
> > definition is clearer.
> that's confusion is in the spec, so we just mimic it, no need to add more on top

To be more precise, there is a huge number of constants in ACPI
such that adding defines for them all would be a huge burden,
and will not make it easy to check values against the
spec at all (case in point ACPI_RSDP_REV_2 is actually wrong,
2 is version 3 and up).

Thus the preferred style is to add a comment near the value
matching spec name verbatim, so one can copy it and
look it up in the spec. Sometimes one needs to reference
specific spec version.

0 /* Revision: ACPI version 1.0 */

and

1 /* Revision: ACPI 2.0 */

and

2 /* Revision: ACPI 3.0a */

For style consistency, if the value is used multiple times, we avoid
duplication by using an inline function and not a macro.

> > 
> > 
> > > > +
> > > >  /* Table structure from Linux kernel (the ACPI tables are under the
> > > >     BSD license) */
> > > >  
> > > > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > > > index 0835900052..2dad465ecf 100644
> > > > --- a/hw/arm/virt-acpi-build.c
> > > > +++ b/hw/arm/virt-acpi-build.c
> > > > @@ -368,7 +368,7 @@ static void acpi_dsdt_add_power_button(Aml *scope)
> > > >  
> > > >  /* RSDP */
> > > >  static void
> > > > -build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned xsdt_tbl_offset)
> > > > +build_rsdp(GArray *rsdp_table, BIOSLinker *linker, AcpiRsdpData *rsdp_data)
> > > >  {
> > > >      AcpiRsdpDescriptor *rsdp = acpi_data_push(rsdp_table, sizeof *rsdp);
> > > >      unsigned xsdt_pa_size = sizeof(rsdp->xsdt_physical_address);
> > > > @@ -379,14 +379,14 @@ build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned xsdt_tbl_offset)
> > > >                               true /* fseg memory */);
> > > >  
> > > >      memcpy(&rsdp->signature, "RSD PTR ", sizeof(rsdp->signature));
> > > > -    memcpy(rsdp->oem_id, ACPI_BUILD_APPNAME6, sizeof(rsdp->oem_id));
> > > > +    memcpy(rsdp->oem_id, rsdp_data->oem_id, sizeof(rsdp->oem_id));
> > > >      rsdp->length = cpu_to_le32(sizeof(*rsdp));
> > > > -    rsdp->revision = 0x02;
> > > > +    rsdp->revision = rsdp_data->revision;
> > > >  
> > > >      /* Address to be filled by Guest linker */
> > > >      bios_linker_loader_add_pointer(linker,
> > > >          ACPI_BUILD_RSDP_FILE, xsdt_pa_offset, xsdt_pa_size,
> > > > -        ACPI_BUILD_TABLE_FILE, xsdt_tbl_offset);
> > > > +        ACPI_BUILD_TABLE_FILE, *rsdp_data->xsdt_tbl_offset);
> > > >  
> > > >      /* Checksum to be filled by Guest linker */
> > > >      bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
> > > > @@ -399,6 +399,20 @@ build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned xsdt_tbl_offset)
> > > >          (char *)&rsdp->extended_checksum - rsdp_table->data);
> > > >  }
> > > >  
> > > > +static void
> > > > +init_rsdp_data(AcpiRsdpData *data, const char *oem_id, uint8_t revision,
> > > > +               unsigned *rsdt_offset, unsigned *xsdt_offset)
> > > > +{
> > > > +    /* Caller must provide an OEM ID */
> > > > +    g_assert(oem_id);
> > > > +    g_assert(strlen(oem_id) >= 6);
> > > > +
> > > > +    memcpy(data->oem_id, oem_id, 6);
> > > > +    data->revision = revision;
> > > > +    data->rsdt_tbl_offset = rsdt_offset;
> > > > +    data->xsdt_tbl_offset = xsdt_offset;
> > > > +}
> > > > +
> > > >  static void
> > > >  build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> > > >  {
> > > > @@ -810,6 +824,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
> > > >      GArray *table_offsets;
> > > >      unsigned dsdt, xsdt;
> > > >      GArray *tables_blob = tables->table_data;
> > > > +    AcpiRsdpData rsdp;  
> > > s/rsdp/rsdp_info/
> > >   
> > > >  
> > > >      table_offsets = g_array_new(false, true /* clear */,
> > > >                                          sizeof(uint32_t));
> > > > @@ -857,7 +872,9 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
> > > >      build_xsdt(tables_blob, tables->linker, table_offsets, NULL, NULL);
> > > >  
> > > >      /* RSDP is in FSEG memory, so allocate it separately */
> > > > -    build_rsdp(tables->rsdp, tables->linker, xsdt);
> > > > +    init_rsdp_data(&rsdp, ACPI_BUILD_APPNAME6, ACPI_RSDP_REV_2,
> > > > +                   NULL, &xsdt);  
> > > It would be more concise to use declarative style without extra clutter:
> > > 
> > > -    init_rsdp_data(&rsdp, ACPI_BUILD_APPNAME6, ACPI_RSDP_REV_2,
> > > -                   NULL, &xsdt);
> > > -    build_rsdp(tables->rsdp, tables->linker, &rsdp);
> > > +    {
> > > +       AcpiRsdpData rsdp = {
> > > +           .revision = 2,
> > > +           .oem_id = ACPI_BUILD_APPNAME6,
> > > +           .xsdt_tbl_offset = &xsdt,
> > > +           .rsdt_tbl_offset = NULL,
> > > +       };
> > > +       build_rsdp(tables->rsdp, tables->linker, &rsdp);
> > > +    }  
> > 2 things here, imo:
> > 
> > - This is not more concise.
> with function, one have to jump to it's definition/body to find out what
> each argument is, with declaration + initialization inplace it's clear
> what values mean as you see fields right there as well.
> 
> If it's simple structure it is clearer to use initializer, instead of
> wrapper helper. With complex structure it could be other way around.
> 
> > - It's code duplication as almost the same snippet is going to be used
> >   for i386/acpi-build.c
> the same goes for init_rsdp_data(...), the only difference
> the declaration isn't folded in 2 lines to be more readable and there is
> boiler plate helper function adds.
> 
> > 
> > Cheers,
> > Samuel.
