Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3647777wrt;
        Fri, 30 Nov 2018 06:35:08 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XwN4s9Lgwvy66WQ1XOmBb1O5FLLSYDUdIRLjytHj0sC3pbuIP4+7103SrpR2+QHH1NiynA
X-Received: by 2002:a81:ae06:: with SMTP id m6mr5899928ywh.416.1543588508465;
        Fri, 30 Nov 2018 06:35:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543588508; cv=none;
        d=google.com; s=arc-20160816;
        b=iu7A8aCsKI3sDSU94jMeF3p8TJGs2KPwnL1ThRXAwFeAP9WtLMRXLDverabvUtVA/B
         doSQH+yb6TpVYIkk3eCvMc66MyZhW/dYkkxBOlQlLZqPZZ5JeyAv0YY+HwSTBDVhncRR
         CT5O+OdHW5eM1hOV961pwHggNz1ws6kXg2vo87LYoSXluWtKCBIU5D2chRepeOR841ya
         0Y1Lah6Ffb/PAA1u0SQU6uG9FZLPQQURr5UPxKAgT8MNarhKFhkfOIgi6RIvkjh/5rCw
         JfSozZFzIhIgH5XBCMFYKfcRwE+BRaKvWWW2t54kcrOM7da8vB2MNwOpADiF9tXOhkGP
         gDRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=FzhiJavLRdpV5vLcGMMwNffMkG+p3KvKCIvOjsRt3Tk=;
        b=aDejsu0XXlXXKfAsbo6iPHYwQeK6FbSa+r5vDUJX7R3qi2rLjWXBn4B3Kd8kivtjAI
         0wRo4aSGAK+QdOtqHaHPBZwkxCFcd/YyyK/1Rcem/ZmU20thQRAnfOwiId/v1NpkRlZ9
         HrhdnMJ+FrnCDSad1JJjR6ErLpBEQdmTLfGZk5BZF7ismd1mm/zJswkp6Tba2s3YSamR
         BOFz+41SdMySCtDvtC3EKxreECUcwT+P2WIOYIz641mkJjx/Q1ADwF+VbwwhgEAd9YUr
         thrnpqJQEtmm1zzeYObAdVwT7ilmk6RIZzsLjOYYvnuPJD3pGcbcqptX298DGGKn5cOU
         xSnw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a93-v6si3280161ybi.258.2018.11.30.06.35.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Nov 2018 06:35:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60479 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSjsp-00085I-M4
	for alex.bennee@linaro.org; Fri, 30 Nov 2018 09:35:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57886)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gSjsi-00084f-Mx
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 09:35:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gSjse-0005kN-JK
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 09:35:00 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50698)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1gSjsd-0005ew-NN; Fri, 30 Nov 2018 09:34:56 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DF9ABC025011;
	Fri, 30 Nov 2018 14:34:50 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 057A860851;
	Fri, 30 Nov 2018 14:34:42 +0000 (UTC)
Date: Fri, 30 Nov 2018 15:34:40 +0100
From: Andrew Jones <drjones@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20181130143440.m63yjvjqnt32kiy2@kamzik.brq.redhat.com>
References: <20181129132428.333-1-sameo@linux.intel.com>
	<20181129132428.333-5-sameo@linux.intel.com>
	<20181129140932.2yl75vsq2ohmuzx6@kamzik.brq.redhat.com>
	<20181129142627.GA4691@caravaggio>
	<20181130082621.6afb2d0a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181130082621.6afb2d0a@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 30 Nov 2018 14:34:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 4/8] hw: arm: Carry RSDP
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
	Samuel Ortiz <sameo@linux.intel.com>, Ben Warren <ben@skyportsystems.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WCEvelOnuZ+E

On Fri, Nov 30, 2018 at 08:26:21AM +0100, Igor Mammedov wrote:
> On Thu, 29 Nov 2018 15:26:27 +0100
> Samuel Ortiz <sameo@linux.intel.com> wrote:
> 
> > On Thu, Nov 29, 2018 at 03:09:32PM +0100, Andrew Jones wrote:
> > > On Thu, Nov 29, 2018 at 02:24:24PM +0100, Samuel Ortiz wrote:  
> > > > That will allow us to generalize the ARM build_rsdp() routine to support
> > > > both legacy RSDP (The current i386 implementation) and extended RSDP
> > > > (The ARM implementation).
> > > > 
> > > > Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> > > > ---
> > > >  include/hw/acpi/acpi-defs.h |  8 ++++++++
> > > >  hw/arm/virt-acpi-build.c    | 18 +++++++++++++-----
> > > >  2 files changed, 21 insertions(+), 5 deletions(-)
> > > > 
> > > > diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> > > > index af8e023968..8425ecb8c6 100644
> > > > --- a/include/hw/acpi/acpi-defs.h
> > > > +++ b/include/hw/acpi/acpi-defs.h
> > > > @@ -53,6 +53,14 @@ struct AcpiRsdpDescriptor {        /* Root System Descriptor Pointer */
> > > >  } QEMU_PACKED;
> > > >  typedef struct AcpiRsdpDescriptor AcpiRsdpDescriptor;
> > > >  
> > > > +typedef struct AcpiRsdpData {
> > > > +    uint8_t oem_id[6]; /* OEM identification */
> > > > +    uint8_t revision;  /* Must be 0 for 1.0, 2 for 2.0 */
> > > > +
> > > > +    unsigned *rsdt_tbl_offset;
> > > > +    unsigned *xsdt_tbl_offset;  
> > > 
> > > Why use pointers?  
> > Mostly to be consistent with the FADT data structure (AcpiFadtData).
> My guess would be that's for detecting an optional field and
> skipping setting it in build_rsdp(). But it's mostly for
> consistence with current code.
> 
> > 
> > > > +} AcpiRsdpData;
> > > > +
> > > >  /* Table structure from Linux kernel (the ACPI tables are under the
> > > >     BSD license) */
> > > >  
> > > > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > > > index 0835900052..ce8bfa5a37 100644
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
> > > 
> > > sizeof(rsdp_data->oem_id)  
> > Which is the same thing. Note that this piece of code eventually gets
> > removed later in the serie.
> > 
> > 
> > 
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
> > > > @@ -857,7 +857,15 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
> > > >      build_xsdt(tables_blob, tables->linker, table_offsets, NULL, NULL);
> > > >  
> > > >      /* RSDP is in FSEG memory, so allocate it separately */
> > > > -    build_rsdp(tables->rsdp, tables->linker, xsdt);
> > > > +    {
> > > > +        AcpiRsdpData rsdp_data = {
> > > > +            .revision = 2,
> > > > +            .oem_id = ACPI_BUILD_APPNAME6,
> > > > +            .xsdt_tbl_offset = &xsdt,
> > > > +            .rsdt_tbl_offset = NULL,  
> > > 
> > > nit: no need for this explicit NULLing  
> then one would get random junk from the stack this variable is allocate from
> in this field.

Not when you initialize the structure with = { ... }. All uninitialized
pointers will be NULL and all uninitialized arithmetic types will be zero.
Of course explicitly setting it to NULL is fine too, which is why this is
only a "nit".

> 
> > Unfortunately, yes.
> > 
> > Cheers,
> > Samuel.
> 
> 
