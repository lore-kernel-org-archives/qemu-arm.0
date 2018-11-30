Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3270440wrt;
        Thu, 29 Nov 2018 23:26:41 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WoNMq98FCMrpe3U08YKPMZbXcoU43uSG3j71bHY8Fu14J66nPs0g57tntCthb0XF4jYIS/
X-Received: by 2002:a81:ec04:: with SMTP id j4mr4544131ywm.230.1543562801315;
        Thu, 29 Nov 2018 23:26:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543562801; cv=none;
        d=google.com; s=arc-20160816;
        b=solPj5uh1u/q5FlfWWqyKB0dmtqPAg7MhCe2QZg7V4JoGk94DyG0CvaO9l2Ogg5SPN
         Q6a01TnXbVN7Hc5CC5oLN2OFnCeaapMLLMV/J42osINFrsFAvkpaDthLv7gIXhAjbRxh
         uZgTXbf/3VNvGHJhoLfsdbzvvTKqgH/2j+q+hvGmZNDp0ui8SeJAmZu4wdD3QfgtpJc+
         8Xz8ym2br6PkvwOlSAc/l3qwvGV9NGqvIgrihBbl2WfGy5p64p198+yup5gKSCuf5DnR
         Lap1sIRsLyQVEVfgybxJ9NYLvNmPT66mhqx3CFXe7TNLDeFhJmLge03vAJ5oTrnqx+2I
         cOvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=5+Ej/41hmD0BEUhaU6346X+s3wuHoiRCU9PIrt5cArQ=;
        b=HMllxExUHjaQTwy+3kqK8gNbLlXDLdc1iM0EWKCnHtR7BerWYLuTzhGI5FWkjrnXY1
         0FUudPJo3AxOrNvT9D6kYX/LYYbHqc1ZAzroEPusBMqCufdbTcG+fTqFZYa4w1ln5d3r
         9HJey4yqgqE/4Q3mFDMDVmDjQPe0odd+J7aj93IXsSc0gaqGsKc6eKkwMqIP+6zRfKil
         l28pC5bDCzU95jLoiO2MlXuuddu0NsrY7pidmquAJwa1rU4p45Dx9HPMdL0/wB3YQbBs
         FODaLK4OvhxByjYyHhzvOnw0d+N55WsBj/23sPb0w6GYBMQ1UizuHmJDyLVgNO8UVzGW
         ff8A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c8-v6si2496002ybb.314.2018.11.29.23.26.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 29 Nov 2018 23:26:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58451 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSdCC-0006BN-Kf
	for alex.bennee@linaro.org; Fri, 30 Nov 2018 02:26:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55074)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gSdC5-0006A4-AE
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 02:26:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gSdC2-000191-0R
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 02:26:33 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55094)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gSdC1-00014R-Nv; Fri, 30 Nov 2018 02:26:29 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0C2817F6D0;
	Fri, 30 Nov 2018 07:26:28 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5CE3D6013E;
	Fri, 30 Nov 2018 07:26:23 +0000 (UTC)
Date: Fri, 30 Nov 2018 08:26:21 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181130082621.6afb2d0a@redhat.com>
In-Reply-To: <20181129142627.GA4691@caravaggio>
References: <20181129132428.333-1-sameo@linux.intel.com>
	<20181129132428.333-5-sameo@linux.intel.com>
	<20181129140932.2yl75vsq2ohmuzx6@kamzik.brq.redhat.com>
	<20181129142627.GA4691@caravaggio>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 30 Nov 2018 07:26:28 +0000 (UTC)
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
	Peter Maydell <peter.maydell@linaro.org>,
	Andrew Jones <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	Ben Warren <ben@skyportsystems.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pnFDlQHdAh7W

On Thu, 29 Nov 2018 15:26:27 +0100
Samuel Ortiz <sameo@linux.intel.com> wrote:

> On Thu, Nov 29, 2018 at 03:09:32PM +0100, Andrew Jones wrote:
> > On Thu, Nov 29, 2018 at 02:24:24PM +0100, Samuel Ortiz wrote:  
> > > That will allow us to generalize the ARM build_rsdp() routine to support
> > > both legacy RSDP (The current i386 implementation) and extended RSDP
> > > (The ARM implementation).
> > > 
> > > Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> > > ---
> > >  include/hw/acpi/acpi-defs.h |  8 ++++++++
> > >  hw/arm/virt-acpi-build.c    | 18 +++++++++++++-----
> > >  2 files changed, 21 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> > > index af8e023968..8425ecb8c6 100644
> > > --- a/include/hw/acpi/acpi-defs.h
> > > +++ b/include/hw/acpi/acpi-defs.h
> > > @@ -53,6 +53,14 @@ struct AcpiRsdpDescriptor {        /* Root System Descriptor Pointer */
> > >  } QEMU_PACKED;
> > >  typedef struct AcpiRsdpDescriptor AcpiRsdpDescriptor;
> > >  
> > > +typedef struct AcpiRsdpData {
> > > +    uint8_t oem_id[6]; /* OEM identification */
> > > +    uint8_t revision;  /* Must be 0 for 1.0, 2 for 2.0 */
> > > +
> > > +    unsigned *rsdt_tbl_offset;
> > > +    unsigned *xsdt_tbl_offset;  
> > 
> > Why use pointers?  
> Mostly to be consistent with the FADT data structure (AcpiFadtData).
My guess would be that's for detecting an optional field and
skipping setting it in build_rsdp(). But it's mostly for
consistence with current code.

> 
> > > +} AcpiRsdpData;
> > > +
> > >  /* Table structure from Linux kernel (the ACPI tables are under the
> > >     BSD license) */
> > >  
> > > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > > index 0835900052..ce8bfa5a37 100644
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
> > 
> > sizeof(rsdp_data->oem_id)  
> Which is the same thing. Note that this piece of code eventually gets
> removed later in the serie.
> 
> 
> 
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
> > > @@ -857,7 +857,15 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
> > >      build_xsdt(tables_blob, tables->linker, table_offsets, NULL, NULL);
> > >  
> > >      /* RSDP is in FSEG memory, so allocate it separately */
> > > -    build_rsdp(tables->rsdp, tables->linker, xsdt);
> > > +    {
> > > +        AcpiRsdpData rsdp_data = {
> > > +            .revision = 2,
> > > +            .oem_id = ACPI_BUILD_APPNAME6,
> > > +            .xsdt_tbl_offset = &xsdt,
> > > +            .rsdt_tbl_offset = NULL,  
> > 
> > nit: no need for this explicit NULLing  
then one would get random junk from the stack this variable is allocate from
in this field.

> Unfortunately, yes.
> 
> Cheers,
> Samuel.

