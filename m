Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1490141wrt;
        Tue, 27 Nov 2018 08:29:46 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WEUB7nRdsadKFgBVz/myVsR3N5JP9nsvX1P1+YALtGl3rjc4PQ7fSzxmwDao1eXjW+lNJ+
X-Received: by 2002:a25:c981:: with SMTP id z123-v6mr33566694ybf.511.1543336185926;
        Tue, 27 Nov 2018 08:29:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543336185; cv=none;
        d=google.com; s=arc-20160816;
        b=epB/UsT68FbWnXGzOPOldG3koa3oRHx9maG8Pr1QSrptHZA0q8ozz6zk5U8aVF5Lkk
         YjvYe3uEQ0X/hBJ4vO2PxfoYwd5la7iX5qH59lgyTT4b+R5ap/a7RIlJgQPCYKZ52G6C
         aam08JPhWkWXBZrt0xmWVFbr51mjADhXj6jBX9CJ74EZjRBydPeVAEWQc95iniNdJ08D
         nXEZp6vnhZdrhtzmDMPXUzefXqIqEeOYAptU7E4niyfpRwasGLS0c0agKc+5LQslP3po
         o+CRcyFw/apsfVN9pcuTQwh2TrOiaQti+Awzl4bgGZ++0lZmvkHU48fiG+Lt97fihwuF
         RlHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=UQbn327tW1WzZIYsTwANHzulO6q3VMCDkPOmbIOdJVk=;
        b=rQf4A+YBwjnTmzC/pbC/18/1wG8DDnsGWkxPd+Ffsrl/0UjpCcehaPEGbG7MdLsxHH
         cesvV8Ke94g6aZQCqxPgmRborp9W1h4VUYlxAhk7lPYJ0yovFP4UlrzUfjc+3MzIkwb2
         dfzaFdExS+92lkOs5JnDzok9HDKVaeiRZjQhN59FiuaND9OSgmMFB8q9bm1D/5IJvoJV
         NARVED/V7JRdV8md72miedlL0o0lxoLHCK6QtZhqunAmLl2fgE4jFEl/6zR5dFzBeHve
         30rf5T9TwI+MItNi/BidYAz4CGqnFlhu3CVNF4Vv0FKwIm7LETEiBQVxgcAJkddl2paM
         N2bA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i185-v6si3009990ywi.307.2018.11.27.08.29.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Nov 2018 08:29:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43361 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRgF7-0007Ct-8t
	for alex.bennee@linaro.org; Tue, 27 Nov 2018 11:29:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41166)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gRgDb-0006Pa-S2
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 11:28:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gRgDZ-0003tl-RO
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 11:28:11 -0500
Received: from mx1.redhat.com ([209.132.183.28]:8786)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gRgDW-0003qM-1X; Tue, 27 Nov 2018 11:28:07 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E496558E3B;
	Tue, 27 Nov 2018 16:28:03 +0000 (UTC)
Received: from localhost (ovpn-204-51.brq.redhat.com [10.40.204.51])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EF04C608DA;
	Tue, 27 Nov 2018 16:27:50 +0000 (UTC)
Date: Tue, 27 Nov 2018 17:27:49 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181127172749.75a036b4@redhat.com>
In-Reply-To: <20181127154218.GA5677@caravaggio>
References: <20181126162942.21258-1-sameo@linux.intel.com>
	<20181126162942.21258-5-sameo@linux.intel.com>
	<20181127162551.29608eeb@redhat.com>
	<20181127154218.GA5677@caravaggio>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 27 Nov 2018 16:28:04 +0000 (UTC)
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
	Eduardo Habkost <ehabkost@redhat.com>, Ben Warren <ben@skyportsystems.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Yd2GRQgH7a3Y

On Tue, 27 Nov 2018 16:42:18 +0100
Samuel Ortiz <sameo@linux.intel.com> wrote:

> Hi Igor,
> 
> On Tue, Nov 27, 2018 at 04:25:51PM +0100, Igor Mammedov wrote:
> > On Mon, 26 Nov 2018 17:29:37 +0100
> > Samuel Ortiz <sameo@linux.intel.com> wrote:
> >   
> > > That will allow us to generalize the ARM build_rsdp() routine to support
> > > both legacy RSDP (The current i386 implementation) and extended RSDP
> > > (The ARM implementation).
> > > 
> > > Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> > > ---
> > >  include/hw/acpi/acpi-defs.h | 11 +++++++++++
> > >  hw/arm/virt-acpi-build.c    | 27 ++++++++++++++++++++++-----
> > >  2 files changed, 33 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> > > index af8e023968..e7fd24c6c5 100644
> > > --- a/include/hw/acpi/acpi-defs.h
> > > +++ b/include/hw/acpi/acpi-defs.h
> > > @@ -53,6 +53,17 @@ struct AcpiRsdpDescriptor {        /* Root System Descriptor Pointer */
> > >  } QEMU_PACKED;
> > >  typedef struct AcpiRsdpDescriptor AcpiRsdpDescriptor;
> > >  
> > > +typedef struct AcpiRsdpData {
> > > +    uint8_t oem_id[6]; /* OEM identification */
> > > +    uint8_t revision;  /* Must be 0 for 1.0, 2 for 2.0 */
> > > +
> > > +    unsigned *rsdt_tbl_offset;
> > > +    unsigned *xsdt_tbl_offset;
> > > +} AcpiRsdpData;
> > > +  
> >   
> > > +#define ACPI_RSDP_REV_1 0
> > > +#define ACPI_RSDP_REV_2 2  
> > it's one time used spec defined values so just use values directly
> > in place with a comment, so reader won't have to jump around code
> > when comparing to spec.  
> It's also used in the ACPI tests fix patch.
it's better to use in test it's own version (we just opencode them there)
see fadt_fetch_facs_and_dsdt_ptrs()/sanitize_fadt_ptrs()
same applies for length.
that way if we break it in qemu's code test would catch the thing

> Also the 0 for revision 1 is a little confusing, I feel the above
> definition is clearer.
that's confusion is in the spec, so we just mimic it, no need to add more on top

> 
> 
> > > +
> > >  /* Table structure from Linux kernel (the ACPI tables are under the
> > >     BSD license) */
> > >  
> > > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > > index 0835900052..2dad465ecf 100644
> > > --- a/hw/arm/virt-acpi-build.c
> > > +++ b/hw/arm/virt-acpi-build.c
> > > @@ -368,7 +368,7 @@ static void acpi_dsdt_add_power_button(Aml *scope)
> > >  
> > >  /* RSDP */
> > >  static void
> > > -build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned xsdt_tbl_offset)
> > > +build_rsdp(GArray *rsdp_table, BIOSLinker *linker, AcpiRsdpData *rsdp_data)
> > >  {
> > >      AcpiRsdpDescriptor *rsdp = acpi_data_push(rsdp_table, sizeof *rsdp);
> > >      unsigned xsdt_pa_size = sizeof(rsdp->xsdt_physical_address);
> > > @@ -379,14 +379,14 @@ build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned xsdt_tbl_offset)
> > >                               true /* fseg memory */);
> > >  
> > >      memcpy(&rsdp->signature, "RSD PTR ", sizeof(rsdp->signature));
> > > -    memcpy(rsdp->oem_id, ACPI_BUILD_APPNAME6, sizeof(rsdp->oem_id));
> > > +    memcpy(rsdp->oem_id, rsdp_data->oem_id, sizeof(rsdp->oem_id));
> > >      rsdp->length = cpu_to_le32(sizeof(*rsdp));
> > > -    rsdp->revision = 0x02;
> > > +    rsdp->revision = rsdp_data->revision;
> > >  
> > >      /* Address to be filled by Guest linker */
> > >      bios_linker_loader_add_pointer(linker,
> > >          ACPI_BUILD_RSDP_FILE, xsdt_pa_offset, xsdt_pa_size,
> > > -        ACPI_BUILD_TABLE_FILE, xsdt_tbl_offset);
> > > +        ACPI_BUILD_TABLE_FILE, *rsdp_data->xsdt_tbl_offset);
> > >  
> > >      /* Checksum to be filled by Guest linker */
> > >      bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
> > > @@ -399,6 +399,20 @@ build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned xsdt_tbl_offset)
> > >          (char *)&rsdp->extended_checksum - rsdp_table->data);
> > >  }
> > >  
> > > +static void
> > > +init_rsdp_data(AcpiRsdpData *data, const char *oem_id, uint8_t revision,
> > > +               unsigned *rsdt_offset, unsigned *xsdt_offset)
> > > +{
> > > +    /* Caller must provide an OEM ID */
> > > +    g_assert(oem_id);
> > > +    g_assert(strlen(oem_id) >= 6);
> > > +
> > > +    memcpy(data->oem_id, oem_id, 6);
> > > +    data->revision = revision;
> > > +    data->rsdt_tbl_offset = rsdt_offset;
> > > +    data->xsdt_tbl_offset = xsdt_offset;
> > > +}
> > > +
> > >  static void
> > >  build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> > >  {
> > > @@ -810,6 +824,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
> > >      GArray *table_offsets;
> > >      unsigned dsdt, xsdt;
> > >      GArray *tables_blob = tables->table_data;
> > > +    AcpiRsdpData rsdp;  
> > s/rsdp/rsdp_info/
> >   
> > >  
> > >      table_offsets = g_array_new(false, true /* clear */,
> > >                                          sizeof(uint32_t));
> > > @@ -857,7 +872,9 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
> > >      build_xsdt(tables_blob, tables->linker, table_offsets, NULL, NULL);
> > >  
> > >      /* RSDP is in FSEG memory, so allocate it separately */
> > > -    build_rsdp(tables->rsdp, tables->linker, xsdt);
> > > +    init_rsdp_data(&rsdp, ACPI_BUILD_APPNAME6, ACPI_RSDP_REV_2,
> > > +                   NULL, &xsdt);  
> > It would be more concise to use declarative style without extra clutter:
> > 
> > -    init_rsdp_data(&rsdp, ACPI_BUILD_APPNAME6, ACPI_RSDP_REV_2,
> > -                   NULL, &xsdt);
> > -    build_rsdp(tables->rsdp, tables->linker, &rsdp);
> > +    {
> > +       AcpiRsdpData rsdp = {
> > +           .revision = 2,
> > +           .oem_id = ACPI_BUILD_APPNAME6,
> > +           .xsdt_tbl_offset = &xsdt,
> > +           .rsdt_tbl_offset = NULL,
> > +       };
> > +       build_rsdp(tables->rsdp, tables->linker, &rsdp);
> > +    }  
> 2 things here, imo:
> 
> - This is not more concise.
with function, one have to jump to it's definition/body to find out what
each argument is, with declaration + initialization inplace it's clear
what values mean as you see fields right there as well.

If it's simple structure it is clearer to use initializer, instead of
wrapper helper. With complex structure it could be other way around.

> - It's code duplication as almost the same snippet is going to be used
>   for i386/acpi-build.c
the same goes for init_rsdp_data(...), the only difference
the declaration isn't folded in 2 lines to be more readable and there is
boiler plate helper function adds.

> 
> Cheers,
> Samuel.

