Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2408137wrt;
        Thu, 29 Nov 2018 06:31:26 -0800 (PST)
X-Google-Smtp-Source: AFSGD/W23WuwaRIXui4slMsYQQsfm5A06haorPOh4XuMuJljM/zm5ZvfxrGG4lO4/2kVWTHmKRfT
X-Received: by 2002:a81:5042:: with SMTP id e63mr1577531ywb.50.1543501886441;
        Thu, 29 Nov 2018 06:31:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543501886; cv=none;
        d=google.com; s=arc-20160816;
        b=iRqX25z3vuZSG1xvxvGm6osNDm2x1ZwHJAOMeFt1wItF2puTx5s02LzxzutFoPB8VZ
         A4onMMQgXVDGF/i5fMlITdcld4FtxGI3qrn8VXQNSQIOPw20Kv6+lt9SoAdW6dnFWP4V
         9yShDdzfyTM9R9ZA/oZLCBD28AA1SejIGXNZkj7xSEzyNVQGJUSRL3qvForViJCVY1aW
         Mp3bRwdyPzlmrYMZupdEVvgjDzPmEOnOV24smkWOtTMMxuhRv07H+/s4N7vP4Yy28Il1
         u8wUeSBp5EGAfPyHoD7+JQi7V+sQEOdEIV3OfWzIvS54h117RjaOhwetbqEbluNWLXqJ
         zlOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=YrMP4xhsd38LP978KZZUo2KiTseMVUWRDolsD2lljjI=;
        b=T15i/6ECJO3HZA+LKkhmtD94nnENKFnaR+cdCDm1Ff/zKqsFhgHuWtjGeHxdWOamLo
         f/oJIS1YEHxG2sLyVYCml9/xHQsTp/F+Pbgfg9xTH7nHPPE2tnVh3/RazMq8l5wcGxqf
         9CjHjhWdhGcWT1Ws2vQukWb3KPvmM8cTytUGjhQtC8aDzng0Q6HntvMgfamSb03kGSt/
         bEsPnJocEj/YW6N4RYuP5j/RdhhnkwA7kTcBqr12+XVGWVSZ3egmOswhF+7M0lroP2dN
         PVz3/PjL94xECUuStgaQQ8HrmoE9CB2Uz6DrULUsu8xAnwaJ4uxPdN4qAdwnkVjaNxso
         yNiA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x131-v6si1200125yba.249.2018.11.29.06.31.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 29 Nov 2018 06:31:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:54463 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSNLh-0006G6-Rf
	for alex.bennee@linaro.org; Thu, 29 Nov 2018 09:31:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52480)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gSNIX-0004AE-FX
	for qemu-devel@nongnu.org; Thu, 29 Nov 2018 09:28:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gSNIW-0004tq-Ka
	for qemu-devel@nongnu.org; Thu, 29 Nov 2018 09:28:09 -0500
Received: from mga18.intel.com ([134.134.136.126]:19040)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gSNIR-0002tc-54; Thu, 29 Nov 2018 09:28:03 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Nov 2018 06:27:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,294,1539673200"; d="scan'208";a="116358861"
Received: from hharjula-mobl.ger.corp.intel.com (HELO caravaggio)
	([10.252.29.114])
	by fmsmga004.fm.intel.com with ESMTP; 29 Nov 2018 06:26:56 -0800
Date: Thu, 29 Nov 2018 15:26:27 +0100
From: Samuel Ortiz <sameo@linux.intel.com>
To: Andrew Jones <drjones@redhat.com>
Message-ID: <20181129142627.GA4691@caravaggio>
References: <20181129132428.333-1-sameo@linux.intel.com>
	<20181129132428.333-5-sameo@linux.intel.com>
	<20181129140932.2yl75vsq2ohmuzx6@kamzik.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181129140932.2yl75vsq2ohmuzx6@kamzik.brq.redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.126
Subject: Re: [Qemu-devel] [PATCH v2 4/8] hw: arm: Carry RSDP specific data
 through AcpiRsdpData
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
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4v9aCcbOy0uA

On Thu, Nov 29, 2018 at 03:09:32PM +0100, Andrew Jones wrote:
> On Thu, Nov 29, 2018 at 02:24:24PM +0100, Samuel Ortiz wrote:
> > That will allow us to generalize the ARM build_rsdp() routine to support
> > both legacy RSDP (The current i386 implementation) and extended RSDP
> > (The ARM implementation).
> > 
> > Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> > ---
> >  include/hw/acpi/acpi-defs.h |  8 ++++++++
> >  hw/arm/virt-acpi-build.c    | 18 +++++++++++++-----
> >  2 files changed, 21 insertions(+), 5 deletions(-)
> > 
> > diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> > index af8e023968..8425ecb8c6 100644
> > --- a/include/hw/acpi/acpi-defs.h
> > +++ b/include/hw/acpi/acpi-defs.h
> > @@ -53,6 +53,14 @@ struct AcpiRsdpDescriptor {        /* Root System Descriptor Pointer */
> >  } QEMU_PACKED;
> >  typedef struct AcpiRsdpDescriptor AcpiRsdpDescriptor;
> >  
> > +typedef struct AcpiRsdpData {
> > +    uint8_t oem_id[6]; /* OEM identification */
> > +    uint8_t revision;  /* Must be 0 for 1.0, 2 for 2.0 */
> > +
> > +    unsigned *rsdt_tbl_offset;
> > +    unsigned *xsdt_tbl_offset;
> 
> Why use pointers?
Mostly to be consistent with the FADT data structure (AcpiFadtData).


> > +} AcpiRsdpData;
> > +
> >  /* Table structure from Linux kernel (the ACPI tables are under the
> >     BSD license) */
> >  
> > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > index 0835900052..ce8bfa5a37 100644
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
> 
> sizeof(rsdp_data->oem_id)
Which is the same thing. Note that this piece of code eventually gets
removed later in the serie.



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
> > @@ -857,7 +857,15 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
> >      build_xsdt(tables_blob, tables->linker, table_offsets, NULL, NULL);
> >  
> >      /* RSDP is in FSEG memory, so allocate it separately */
> > -    build_rsdp(tables->rsdp, tables->linker, xsdt);
> > +    {
> > +        AcpiRsdpData rsdp_data = {
> > +            .revision = 2,
> > +            .oem_id = ACPI_BUILD_APPNAME6,
> > +            .xsdt_tbl_offset = &xsdt,
> > +            .rsdt_tbl_offset = NULL,
> 
> nit: no need for this explicit NULLing
Unfortunately, yes.

Cheers,
Samuel.
