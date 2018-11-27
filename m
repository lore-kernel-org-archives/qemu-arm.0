Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1433267wrt;
        Tue, 27 Nov 2018 07:43:15 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WOMFDvQeVo/nUeQrVEOSBv4nAY9cAfeh+VXk4MPAfT028Dn7C7lVvAzr5PVqu8saf5SgCr
X-Received: by 2002:a81:1d44:: with SMTP id d65mr19850226ywd.483.1543333395310;
        Tue, 27 Nov 2018 07:43:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543333395; cv=none;
        d=google.com; s=arc-20160816;
        b=jVtW/iW4pBlJeihmn62SJUTROPDvsgEsovzJDqcv1thGVslGGEPweF57WqoI2LXuI5
         fvCyzBXww6VoRADxlgEYOwkRxWr02aT2eY1n4iQR2AkPtH7tynqr6D6Xa9rovHKLskv/
         sU3aazu6rI6TeQiXsgmezm55Qm5A3xZkdLvpuzRU87eHsZ4b87su9JdV96IvGXxP1OXH
         bJlAI2XDcmvUiR9hOHElp9qtgaJSPq8jnRrengCQgDAhjXINKwS4Tzmla1HNCk6ji7HN
         C7a4/vjQE9DKUs5P5KzDQAiHqqpzF8uUhZSwUr5Rer0bBWN25VRrFPCvy0SYu4sxQ58F
         vZTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=iFqAJ9+/pv0hAGls4hb0g/KG+ijwp+WufD1ujewtbRc=;
        b=ppyB86h19McIvrf2PoehxfWy0xNDmBSH2SP2Y9H5wncgmpg3mvVQM1BHCJUrD3vjux
         kD0QZS8kHiKxDP19Exa4C+avVgKAOAIba9VpASbrTQotqGw9n6DbNrEStsHxoow4vm/w
         blWMDI7c07+lS4LuAX105NZbEyWoK6ehor8AOdg5T+pb6z9iVBXCR/dutPqfcB17MJnS
         zuPjJ6a/p/knG0MMNjfiQpvRQfF5WsPWHHiIXCsjXv3e2BGk1we3JQSzbThnxUN7m7up
         u7rCYuoM6grODYY4jNuUdPX8rz4bMh/nIruQX4BNgXX+gQchlS/Yu35XW2WQpLQIfs02
         L5aA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w126-v6si2977662yba.122.2018.11.27.07.43.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Nov 2018 07:43:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:43039 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRfW6-0006dK-PU
	for alex.bennee@linaro.org; Tue, 27 Nov 2018 10:43:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54480)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gRfVu-0006d0-Le
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 10:43:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gRfVn-00017o-JD
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 10:43:02 -0500
Received: from mga06.intel.com ([134.134.136.31]:41056)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gRfVn-00011n-At; Tue, 27 Nov 2018 10:42:55 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Nov 2018 07:42:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,287,1539673200"; d="scan'208";a="93731017"
Received: from sdommett-mobl2.ger.corp.intel.com (HELO caravaggio)
	([10.252.8.174])
	by fmsmga008.fm.intel.com with ESMTP; 27 Nov 2018 07:42:48 -0800
Date: Tue, 27 Nov 2018 16:42:18 +0100
From: Samuel Ortiz <sameo@linux.intel.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20181127154218.GA5677@caravaggio>
References: <20181126162942.21258-1-sameo@linux.intel.com>
	<20181126162942.21258-5-sameo@linux.intel.com>
	<20181127162551.29608eeb@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181127162551.29608eeb@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.31
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
X-TUID: 77liNWFvHF1t

Hi Igor,

On Tue, Nov 27, 2018 at 04:25:51PM +0100, Igor Mammedov wrote:
> On Mon, 26 Nov 2018 17:29:37 +0100
> Samuel Ortiz <sameo@linux.intel.com> wrote:
> 
> > That will allow us to generalize the ARM build_rsdp() routine to support
> > both legacy RSDP (The current i386 implementation) and extended RSDP
> > (The ARM implementation).
> > 
> > Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> > ---
> >  include/hw/acpi/acpi-defs.h | 11 +++++++++++
> >  hw/arm/virt-acpi-build.c    | 27 ++++++++++++++++++++++-----
> >  2 files changed, 33 insertions(+), 5 deletions(-)
> > 
> > diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> > index af8e023968..e7fd24c6c5 100644
> > --- a/include/hw/acpi/acpi-defs.h
> > +++ b/include/hw/acpi/acpi-defs.h
> > @@ -53,6 +53,17 @@ struct AcpiRsdpDescriptor {        /* Root System Descriptor Pointer */
> >  } QEMU_PACKED;
> >  typedef struct AcpiRsdpDescriptor AcpiRsdpDescriptor;
> >  
> > +typedef struct AcpiRsdpData {
> > +    uint8_t oem_id[6]; /* OEM identification */
> > +    uint8_t revision;  /* Must be 0 for 1.0, 2 for 2.0 */
> > +
> > +    unsigned *rsdt_tbl_offset;
> > +    unsigned *xsdt_tbl_offset;
> > +} AcpiRsdpData;
> > +
> 
> > +#define ACPI_RSDP_REV_1 0
> > +#define ACPI_RSDP_REV_2 2
> it's one time used spec defined values so just use values directly
> in place with a comment, so reader won't have to jump around code
> when comparing to spec.
It's also used in the ACPI tests fix patch.
Also the 0 for revision 1 is a little confusing, I feel the above
definition is clearer.


> > +
> >  /* Table structure from Linux kernel (the ACPI tables are under the
> >     BSD license) */
> >  
> > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > index 0835900052..2dad465ecf 100644
> > --- a/hw/arm/virt-acpi-build.c
> > +++ b/hw/arm/virt-acpi-build.c
> > @@ -368,7 +368,7 @@ static void acpi_dsdt_add_power_button(Aml *scope)
> >  
> >  /* RSDP */
> >  static void
> > -build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned xsdt_tbl_offset)
> > +build_rsdp(GArray *rsdp_table, BIOSLinker *linker, AcpiRsdpData *rsdp_data)
> >  {
> >      AcpiRsdpDescriptor *rsdp = acpi_data_push(rsdp_table, sizeof *rsdp);
> >      unsigned xsdt_pa_size = sizeof(rsdp->xsdt_physical_address);
> > @@ -379,14 +379,14 @@ build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned xsdt_tbl_offset)
> >                               true /* fseg memory */);
> >  
> >      memcpy(&rsdp->signature, "RSD PTR ", sizeof(rsdp->signature));
> > -    memcpy(rsdp->oem_id, ACPI_BUILD_APPNAME6, sizeof(rsdp->oem_id));
> > +    memcpy(rsdp->oem_id, rsdp_data->oem_id, sizeof(rsdp->oem_id));
> >      rsdp->length = cpu_to_le32(sizeof(*rsdp));
> > -    rsdp->revision = 0x02;
> > +    rsdp->revision = rsdp_data->revision;
> >  
> >      /* Address to be filled by Guest linker */
> >      bios_linker_loader_add_pointer(linker,
> >          ACPI_BUILD_RSDP_FILE, xsdt_pa_offset, xsdt_pa_size,
> > -        ACPI_BUILD_TABLE_FILE, xsdt_tbl_offset);
> > +        ACPI_BUILD_TABLE_FILE, *rsdp_data->xsdt_tbl_offset);
> >  
> >      /* Checksum to be filled by Guest linker */
> >      bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
> > @@ -399,6 +399,20 @@ build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned xsdt_tbl_offset)
> >          (char *)&rsdp->extended_checksum - rsdp_table->data);
> >  }
> >  
> > +static void
> > +init_rsdp_data(AcpiRsdpData *data, const char *oem_id, uint8_t revision,
> > +               unsigned *rsdt_offset, unsigned *xsdt_offset)
> > +{
> > +    /* Caller must provide an OEM ID */
> > +    g_assert(oem_id);
> > +    g_assert(strlen(oem_id) >= 6);
> > +
> > +    memcpy(data->oem_id, oem_id, 6);
> > +    data->revision = revision;
> > +    data->rsdt_tbl_offset = rsdt_offset;
> > +    data->xsdt_tbl_offset = xsdt_offset;
> > +}
> > +
> >  static void
> >  build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> >  {
> > @@ -810,6 +824,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
> >      GArray *table_offsets;
> >      unsigned dsdt, xsdt;
> >      GArray *tables_blob = tables->table_data;
> > +    AcpiRsdpData rsdp;
> s/rsdp/rsdp_info/
> 
> >  
> >      table_offsets = g_array_new(false, true /* clear */,
> >                                          sizeof(uint32_t));
> > @@ -857,7 +872,9 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
> >      build_xsdt(tables_blob, tables->linker, table_offsets, NULL, NULL);
> >  
> >      /* RSDP is in FSEG memory, so allocate it separately */
> > -    build_rsdp(tables->rsdp, tables->linker, xsdt);
> > +    init_rsdp_data(&rsdp, ACPI_BUILD_APPNAME6, ACPI_RSDP_REV_2,
> > +                   NULL, &xsdt);
> It would be more concise to use declarative style without extra clutter:
> 
> -    init_rsdp_data(&rsdp, ACPI_BUILD_APPNAME6, ACPI_RSDP_REV_2,
> -                   NULL, &xsdt);
> -    build_rsdp(tables->rsdp, tables->linker, &rsdp);
> +    {
> +       AcpiRsdpData rsdp = {
> +           .revision = 2,
> +           .oem_id = ACPI_BUILD_APPNAME6,
> +           .xsdt_tbl_offset = &xsdt,
> +           .rsdt_tbl_offset = NULL,
> +       };
> +       build_rsdp(tables->rsdp, tables->linker, &rsdp);
> +    }
2 things here, imo:

- This is not more concise.
- It's code duplication as almost the same snippet is going to be used
  for i386/acpi-build.c

Cheers,
Samuel.
