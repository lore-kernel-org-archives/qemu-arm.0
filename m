Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp843284wrt;
        Wed, 28 Nov 2018 02:17:12 -0800 (PST)
X-Google-Smtp-Source: AJdET5cs1cJdkniE9IVjQqsATMaW+8OryBa4Twu7pNTcgiPEld8km2Nl7wEuWUA5ZDXbnt/dfnvz
X-Received: by 2002:a81:b649:: with SMTP id h9mr38459822ywk.57.1543400232423;
        Wed, 28 Nov 2018 02:17:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543400232; cv=none;
        d=google.com; s=arc-20160816;
        b=Ysr35TuDqQmUzFb/dpxblF4sfq1tQmr+rZfUaOIMReTypY3JnO5HZJ7KAARe0F7StA
         NibwvWeaen3U8Pmdgqhilfk2yOkkEo2Xvrbrd4Gp72fuROzBAqd/fro9/zIIR6K/Yebl
         OABls9qt0P2luOfv5QZdgtsuTBmgh3Aud5kXr7gMBKmYEVc3PUPK0O6dMrDK2DJhKQBw
         kWeM9Y4f8eWbhLZYD0sx4PYYc+Vuc1+tJQTqC+UVdAkV6T7Xcs3FrFeVXgw0wrBlanoU
         WQZVDLN8rxR4nvIBaLOAi8ecuYMtEgTbpnYsas7zz7d9fpBJizZT/Wyf1lBXMpJlXojV
         SS+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=eI0ZG7deChmfEck/SlQFbTdXBEOZxwiGAOKV9Y5B/Uo=;
        b=kXGZbSU+d9N9CvidhohCSL9GB+4ueyll3c+vEjwEH74lnsDZJxuOFgLx9pHhS8OKJw
         0U3XX/lVLLdC01sFif8CSXghPbBcT8s9VfgTD7zUEMnqHACIO1lohOToz/CeUq9g54CG
         ZUyN3J1JOE9xq9O/v2RHsQpVNW9heaaTBvVoE+Z3oCJdg2dEr1UWuy4QaZkpw90/vryz
         9nU9WSUIPyWyw5+cln5iSFxi4Qzx24TdfLAV5c3EHMU11LpZOqw5DCXujOvh2MoVKSA9
         fzQKi+DaRqHw1Aa4zWtMdCb1HfzKs0SyDtMirppYKhJeh+EEoS86VZDdrAEasRdPUAXd
         b7gA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z67si4866218ywb.452.2018.11.28.02.17.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Nov 2018 02:17:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:46931 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRwu7-0002uH-Qn
	for alex.bennee@linaro.org; Wed, 28 Nov 2018 05:17:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51850)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gRwtw-0002tw-IJ
	for qemu-arm@nongnu.org; Wed, 28 Nov 2018 05:17:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gRwtt-0007nc-C3
	for qemu-arm@nongnu.org; Wed, 28 Nov 2018 05:17:00 -0500
Received: from mga12.intel.com ([192.55.52.136]:32027)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gRwtt-0007mg-25; Wed, 28 Nov 2018 05:16:57 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Nov 2018 02:16:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,290,1539673200"; d="scan'208";a="114530331"
Received: from bdoyle2-mobl.ger.corp.intel.com (HELO caravaggio)
	([10.251.86.101])
	by fmsmga002.fm.intel.com with ESMTP; 28 Nov 2018 02:16:51 -0800
Date: Wed, 28 Nov 2018 11:16:22 +0100
From: Samuel Ortiz <sameo@linux.intel.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20181128101622.GD5677@caravaggio>
References: <20181126162942.21258-1-sameo@linux.intel.com>
	<20181126162942.21258-5-sameo@linux.intel.com>
	<20181127162551.29608eeb@redhat.com>
	<20181127154218.GA5677@caravaggio>
	<20181127172749.75a036b4@redhat.com>
	<20181128094640.GB5677@caravaggio>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181128094640.GB5677@caravaggio>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.136
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
	Eduardo Habkost <ehabkost@redhat.com>, Ben Warren <ben@skyportsystems.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x702splx6B58

On Wed, Nov 28, 2018 at 10:46:41AM +0100, Samuel Ortiz wrote:
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
> 
> 
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
> 
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
I just saw your comments on patch #8, thanks.

Cheers,
Samuel.
