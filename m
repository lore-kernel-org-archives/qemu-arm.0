Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp964126wrt;
        Wed, 28 Nov 2018 04:21:30 -0800 (PST)
X-Google-Smtp-Source: AJdET5ekpdzFfHlGZIiPxMJ9sJHmijZklNwIByvmLrZVmdnHggPE7HrAjGegvf+gQji8muZ/rw3q
X-Received: by 2002:a81:f104:: with SMTP id h4-v6mr37063969ywm.20.1543407690391;
        Wed, 28 Nov 2018 04:21:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543407690; cv=none;
        d=google.com; s=arc-20160816;
        b=ssDe6/6a1nbvtsN6vKll4JqqNuKrHt8nP4DVED4vXr1gKc4rLUGMeXKT0bVWVuroWx
         LLFdmwia5pnz5YzzMIVpNdkCDApgapj0XoJEJ8X6tqjS7/pD4Qy/5nvPQQj/fZ3DxY1B
         pgAzL4I76yIdbY6Q/YPZ9Nd/MOv+zEXlndFkDHG6ng5PiQcVq41QUMji3kmezAV7D4Ma
         B+GWJ+piukUokUXE2F9WWP2LUC6QBxeJQR6rMDFHWQZHRE5NSXnlKVa42SYQw0rVGe1H
         Y+Bv9EApVFdbH6aRZwI5KrrtVUQKNAkT+sXhXtWf3QfDQVesJGnWMoLvPDQTLAJsc03j
         0Qng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=m+cTWTWP442fmq+5H6PbUkQPt4HB9Jv7LymPqqAZ6NE=;
        b=azXpJ4bUTVH9mGjOyD9ixmFznJQBkb+680EGI2oT/gy3DChNfKJfbs4zRIWRIT2mCq
         oU7TTZYt9e2w18pAH+1wMncvWNcUpO8o9Eqfs9R48lMYdQnbosYbROvmPsOGQ6DZExok
         wGN22gLdCyHOkZTZwkLHx2VqfLRQp1clzXxA0RVgvE0Psc1TF5uOant+6jm2paX8Z13m
         zguCgG7P9nu0EimgJj3cygpY23iZJCk6Kw7oxgpLsmNCuxCSmPgkmLTEptDWqJ6Z1jHp
         O6XWH6IEzJqAg4GZDQA30z6K4Wp3qYF0+J9HFxSvr1bFXZkLFlyJB5LGjY+8HkV5VNSO
         HiaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y15-v6si4823360ybg.194.2018.11.28.04.21.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Nov 2018 04:21:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47364 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRyqP-00076f-Pz
	for alex.bennee@linaro.org; Wed, 28 Nov 2018 07:21:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58690)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gRypt-0006Db-Mf
	for qemu-arm@nongnu.org; Wed, 28 Nov 2018 07:21:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gRyhr-0000kB-Gh
	for qemu-arm@nongnu.org; Wed, 28 Nov 2018 07:12:44 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41108)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gRyhr-0000jr-8p; Wed, 28 Nov 2018 07:12:39 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3A97E3002E0C;
	Wed, 28 Nov 2018 12:12:38 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B32582C259;
	Wed, 28 Nov 2018 12:12:32 +0000 (UTC)
Date: Wed, 28 Nov 2018 13:12:30 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181128131230.0a8306f2@redhat.com>
In-Reply-To: <20181128094640.GB5677@caravaggio>
References: <20181126162942.21258-1-sameo@linux.intel.com>
	<20181126162942.21258-5-sameo@linux.intel.com>
	<20181127162551.29608eeb@redhat.com>
	<20181127154218.GA5677@caravaggio>
	<20181127172749.75a036b4@redhat.com>
	<20181128094640.GB5677@caravaggio>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Wed, 28 Nov 2018 12:12:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 4/8] hw: arm: Carry RSDP
 specific data through AcpiRsdpData
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
	Ben Warren <ben@skyportsystems.com>, "Michael S.
	Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mHWb82K4TfGE

On Wed, 28 Nov 2018 10:46:41 +0100
Samuel Ortiz <sameo@linux.intel.com> wrote:

> On Tue, Nov 27, 2018 at 05:27:49PM +0100, Igor Mammedov wrote:
> > On Tue, 27 Nov 2018 16:42:18 +0100
> > Samuel Ortiz <sameo@linux.intel.com> wrote:
> >   
> > > Hi Igor,
> > > 
> > > On Tue, Nov 27, 2018 at 04:25:51PM +0100, Igor Mammedov wrote:  
> > > > On Mon, 26 Nov 2018 17:29:37 +0100
> > > > Samuel Ortiz <sameo@linux.intel.com> wrote:
> > > >     
> > > > > That will allow us to generalize the ARM build_rsdp() routine to support
> > > > > both legacy RSDP (The current i386 implementation) and extended RSDP
> > > > > (The ARM implementation).
> > > > > 
> > > > > Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> > > > > ---
> > > > >  include/hw/acpi/acpi-defs.h | 11 +++++++++++
> > > > >  hw/arm/virt-acpi-build.c    | 27 ++++++++++++++++++++++-----
> > > > >  2 files changed, 33 insertions(+), 5 deletions(-)
> > > > > 
> > > > > diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> > > > > index af8e023968..e7fd24c6c5 100644
> > > > > --- a/include/hw/acpi/acpi-defs.h
> > > > > +++ b/include/hw/acpi/acpi-defs.h
> > > > > @@ -53,6 +53,17 @@ struct AcpiRsdpDescriptor {        /* Root System Descriptor Pointer */
> > > > >  } QEMU_PACKED;
> > > > >  typedef struct AcpiRsdpDescriptor AcpiRsdpDescriptor;
> > > > >  
> > > > > +typedef struct AcpiRsdpData {
> > > > > +    uint8_t oem_id[6]; /* OEM identification */
> > > > > +    uint8_t revision;  /* Must be 0 for 1.0, 2 for 2.0 */
> > > > > +
> > > > > +    unsigned *rsdt_tbl_offset;
> > > > > +    unsigned *xsdt_tbl_offset;
> > > > > +} AcpiRsdpData;
> > > > > +    
> > > >     
> > > > > +#define ACPI_RSDP_REV_1 0
> > > > > +#define ACPI_RSDP_REV_2 2    
> > > > it's one time used spec defined values so just use values directly
> > > > in place with a comment, so reader won't have to jump around code
> > > > when comparing to spec.    
> > > It's also used in the ACPI tests fix patch.  
> > it's better to use in test it's own version (we just opencode them there)
> > see fadt_fetch_facs_and_dsdt_ptrs()/sanitize_fadt_ptrs()
> > same applies for length.  
> 
> I think you're trying to explain to me that this:
> 
> 	/* sdt->aml field offset := spec offset - header size */
>         memset(sdt->aml + 0, 0, 4); /* sanitize FIRMWARE_CTRL(36) ptr */
>         memset(sdt->aml + 4, 0, 4); /* sanitize DSDT(40) ptr */
>         if (sdt->header.revision >= 3) {
>             memset(sdt->aml + 96, 0, 8); /* sanitize X_FIRMWARE_CTRL(132) ptr */
>             memset(sdt->aml + 104, 0, 8); /* sanitize X_DSDT(140) ptr */
>         }
> 
> is good coding practice. I'm having a hard time internalizing that
> hard coded constants and comments not directly mapping the code (How do
> I map "sanitize X_FIRMWARE_CTRL(132) ptr" to "sdt->aml + 96, 0, 8"?) is
> indeed good practice. But I'll take the pragmatic route and follow what
> you guys advice for.
Even though it's ugly, constants directly comparable to spec table
definitions and comments are supposed to hep locate relevant field/table,
macro isn't making it better in this case (just a bit more obscure).

At least for ACPI spec bound code, it's consensus that we reached
after discussing how to better to handle this usecase (from maintainability pov).

> > that way if we break it in qemu's code test would catch the thing
> >   
> > > Also the 0 for revision 1 is a little confusing, I feel the above
> > > definition is clearer.  
> > that's confusion is in the spec, so we just mimic it, no need to add more on top
> >   
> > > 
> > >   
> > > > > +
> > > > >  /* Table structure from Linux kernel (the ACPI tables are under the
> > > > >     BSD license) */
> > > > >  
> > > > > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > > > > index 0835900052..2dad465ecf 100644
> > > > > --- a/hw/arm/virt-acpi-build.c
> > > > > +++ b/hw/arm/virt-acpi-build.c
> > > > > @@ -368,7 +368,7 @@ static void acpi_dsdt_add_power_button(Aml *scope)
> > > > >  
> > > > >  /* RSDP */
> > > > >  static void
> > > > > -build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned xsdt_tbl_offset)
> > > > > +build_rsdp(GArray *rsdp_table, BIOSLinker *linker, AcpiRsdpData *rsdp_data)
> > > > >  {
> > > > >      AcpiRsdpDescriptor *rsdp = acpi_data_push(rsdp_table, sizeof *rsdp);
> > > > >      unsigned xsdt_pa_size = sizeof(rsdp->xsdt_physical_address);
> > > > > @@ -379,14 +379,14 @@ build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned xsdt_tbl_offset)
> > > > >                               true /* fseg memory */);
> > > > >  
> > > > >      memcpy(&rsdp->signature, "RSD PTR ", sizeof(rsdp->signature));
> > > > > -    memcpy(rsdp->oem_id, ACPI_BUILD_APPNAME6, sizeof(rsdp->oem_id));
> > > > > +    memcpy(rsdp->oem_id, rsdp_data->oem_id, sizeof(rsdp->oem_id));
> > > > >      rsdp->length = cpu_to_le32(sizeof(*rsdp));
> > > > > -    rsdp->revision = 0x02;
> > > > > +    rsdp->revision = rsdp_data->revision;
> > > > >  
> > > > >      /* Address to be filled by Guest linker */
> > > > >      bios_linker_loader_add_pointer(linker,
> > > > >          ACPI_BUILD_RSDP_FILE, xsdt_pa_offset, xsdt_pa_size,
> > > > > -        ACPI_BUILD_TABLE_FILE, xsdt_tbl_offset);
> > > > > +        ACPI_BUILD_TABLE_FILE, *rsdp_data->xsdt_tbl_offset);
> > > > >  
> > > > >      /* Checksum to be filled by Guest linker */
> > > > >      bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
> > > > > @@ -399,6 +399,20 @@ build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned xsdt_tbl_offset)
> > > > >          (char *)&rsdp->extended_checksum - rsdp_table->data);
> > > > >  }
> > > > >  
> > > > > +static void
> > > > > +init_rsdp_data(AcpiRsdpData *data, const char *oem_id, uint8_t revision,
> > > > > +               unsigned *rsdt_offset, unsigned *xsdt_offset)
> > > > > +{
> > > > > +    /* Caller must provide an OEM ID */
> > > > > +    g_assert(oem_id);
> > > > > +    g_assert(strlen(oem_id) >= 6);
> > > > > +
> > > > > +    memcpy(data->oem_id, oem_id, 6);
> > > > > +    data->revision = revision;
> > > > > +    data->rsdt_tbl_offset = rsdt_offset;
> > > > > +    data->xsdt_tbl_offset = xsdt_offset;
> > > > > +}
> > > > > +
> > > > >  static void
> > > > >  build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> > > > >  {
> > > > > @@ -810,6 +824,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
> > > > >      GArray *table_offsets;
> > > > >      unsigned dsdt, xsdt;
> > > > >      GArray *tables_blob = tables->table_data;
> > > > > +    AcpiRsdpData rsdp;    
> > > > s/rsdp/rsdp_info/
> > > >     
> > > > >  
> > > > >      table_offsets = g_array_new(false, true /* clear */,
> > > > >                                          sizeof(uint32_t));
> > > > > @@ -857,7 +872,9 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
> > > > >      build_xsdt(tables_blob, tables->linker, table_offsets, NULL, NULL);
> > > > >  
> > > > >      /* RSDP is in FSEG memory, so allocate it separately */
> > > > > -    build_rsdp(tables->rsdp, tables->linker, xsdt);
> > > > > +    init_rsdp_data(&rsdp, ACPI_BUILD_APPNAME6, ACPI_RSDP_REV_2,
> > > > > +                   NULL, &xsdt);    
> > > > It would be more concise to use declarative style without extra clutter:
> > > > 
> > > > -    init_rsdp_data(&rsdp, ACPI_BUILD_APPNAME6, ACPI_RSDP_REV_2,
> > > > -                   NULL, &xsdt);
> > > > -    build_rsdp(tables->rsdp, tables->linker, &rsdp);
> > > > +    {
> > > > +       AcpiRsdpData rsdp = {
> > > > +           .revision = 2,
> > > > +           .oem_id = ACPI_BUILD_APPNAME6,
> > > > +           .xsdt_tbl_offset = &xsdt,
> > > > +           .rsdt_tbl_offset = NULL,
> > > > +       };
> > > > +       build_rsdp(tables->rsdp, tables->linker, &rsdp);
> > > > +    }    
> > > 2 things here, imo:
> > > 
> > > - This is not more concise.  
> > with function, one have to jump to it's definition/body to find out what
> > each argument is, with declaration + initialization inplace it's clear
> > what values mean as you see fields right there as well.  
> With a structure you need to go and look at the structure definition to
> know which fields you need to initialize and what their names are. And
> no, you can't safely copy paste the above snippet and rest assured your
> code is safe, because C allows you to leave some structure fields
> uninitialized.
true, one has to be more careful with initializing.
I don't have a strong opinion here, I'll leave it up to you.

> > If it's simple structure it is clearer to use initializer, instead of
> > wrapper helper. With complex structure it could be other way around.
> >  
> > > - It's code duplication as almost the same snippet is going to be used
> > >   for i386/acpi-build.c  
> > the same goes for init_rsdp_data(...)  
> I disagree here as well. But I'd like to see this code being merged,
> I'll comply. Do you have any comments on the tests part of that serie,
> besides the fact that it's using defined constants as opposed to hard
> coded ones?
> 
> Cheers,
> Samuel.
> 
> 

