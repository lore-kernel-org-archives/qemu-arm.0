Received: by 10.28.71.27 with SMTP id u27csp4967925wma;
        Tue, 27 Feb 2018 07:50:20 -0800 (PST)
X-Google-Smtp-Source: AG47ELs1+znVbPtKbxFjV+G/ZXgmm1c/oMg/nhwAUQDG9IWXR3ADHeLBh9+D1ykuJtCLdf0eJ4vf
X-Received: by 2002:a25:6e8b:: with SMTP id j133-v6mr7091436ybc.206.1519746620282;
        Tue, 27 Feb 2018 07:50:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519746620; cv=none;
        d=google.com; s=arc-20160816;
        b=fGnP1O1VLbDmPKWUD9Wcmavyv+JWts4W5Hca1UQIodVw4prgrx1/ZacelkOWjXAkmT
         Dr6N0Tx40RX2fLmcy7mWfX5uKc+v0y3D+6zbaGUaYIGm0sC9/zW/UXruY3RHVhXogVXC
         SCeOYTPId2USoaD6AkVBxx5h2g5/FtNCgiBYbbR+eG7W+o3V00P+44CCgaswTYPXpqDE
         EB34cGiot0woVFIh0bX+YW2UO8vrqw2rBSDprP4VP6BTRDx0ZPbFBRIeooSWud/el1tX
         nTQoz1qW7Xh7pyEcAzvVKUlUbVDdXdGBXkIwxTTXaM6jdRvhlRDY+q7qoYRRiLswbG86
         7wRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:arc-authentication-results;
        bh=PdCPrsDFRjUAyZhSJa5DJ6W7OdsIhjVFubph6ME9cN0=;
        b=pX9pnaKooUSAyOTii1RAG+Q2gKgmMSXcBUoN5OUM6+B/RwfTj3pkEolBSILCYwP+z2
         0u/pbrYyKzqnQIhiTDREg8nbeiyfKygGzTqIBWR8yFD9FpWW/sNWt13Ma74ZyjNgQIvD
         A4zxHl3ZIQkvWQ8dcnGr6s840zx7xhS3MBejgFQxw4QWGuq0O1lnX9aMvvqnTHNp2ixf
         mV2ZC6pwWxP1h46ZNTXuhWGHOCCo9nbfTsD0o/nyppYHwKxJ79xZC6ZGS7HtTa1214Sg
         q005uMSlxft6oG7AqTMCGqs+8M1y9XLVPFx+qFdUFrrE2rDTmX9vVuFNnppMK9skYyEU
         iOCA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f131si1981188ywb.49.2018.02.27.07.50.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 07:50:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38200 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqhWF-0005NU-K6
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 10:50:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47106)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1eqhVf-0005LY-HF
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 10:49:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1eqhVe-0001gl-6u
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 10:49:43 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:57096 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1eqhVX-0001XD-Et; Tue, 27 Feb 2018 10:49:35 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5D21340201A5;
	Tue, 27 Feb 2018 15:49:31 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 211E51C73F;
	Tue, 27 Feb 2018 15:49:21 +0000 (UTC)
Date: Tue, 27 Feb 2018 16:49:20 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Message-ID: <20180227164920.047b4885@redhat.com>
In-Reply-To: <9277c150-6830-8fb1-0092-4bdfd6ba0486@redhat.com>
References: <1519303376-92875-1-git-send-email-imammedo@redhat.com>
	<1519303376-92875-9-git-send-email-imammedo@redhat.com>
	<9277c150-6830-8fb1-0092-4bdfd6ba0486@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Tue, 27 Feb 2018 15:49:31 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Tue, 27 Feb 2018 15:49:31 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-devel] [PATCH 8/9] virt_arm: acpi: reuse common
 build_fadt()
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pOhVdrXWonyK

On Tue, 27 Feb 2018 16:07:49 +0100
Auger Eric <eric.auger@redhat.com> wrote:

> Hi Igor,
> On 22/02/18 13:42, Igor Mammedov wrote:
> > Extend generic build_fadt() to support rev5.1 FADT
> > and reuse it for 'virt' board, it would allow to
> > phase out usage of AcpiFadtDescriptorRev5_1 and
> > later ACPI_FADT_COMMON_DEF.  
> Oups sorry sent the R-b to fast. Some small comments below.
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> >  include/hw/acpi/acpi-defs.h | 12 ++----------
> >  hw/acpi/aml-build.c         | 21 ++++++++++++++++++++-
> >  hw/arm/virt-acpi-build.c    | 33 ++++++++++++---------------------
> >  3 files changed, 34 insertions(+), 32 deletions(-)
> > 
> > diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> > index e0accc4..34e49dc 100644
> > --- a/include/hw/acpi/acpi-defs.h
> > +++ b/include/hw/acpi/acpi-defs.h
> > @@ -165,16 +165,6 @@ struct AcpiFadtDescriptorRev3 {
> >  } QEMU_PACKED;
> >  typedef struct AcpiFadtDescriptorRev3 AcpiFadtDescriptorRev3;
> >  
> > -struct AcpiFadtDescriptorRev5_1 {
> > -    ACPI_FADT_COMMON_DEF
> > -    /* 64-bit Sleep Control register (ACPI 5.0) */
> > -    struct AcpiGenericAddress sleep_control;
> > -    /* 64-bit Sleep Status register (ACPI 5.0) */
> > -    struct AcpiGenericAddress sleep_status;
> > -} QEMU_PACKED;
> > -
> > -typedef struct AcpiFadtDescriptorRev5_1 AcpiFadtDescriptorRev5_1;
> > -
> >  typedef struct AcpiFadtData {
> >      struct AcpiGenericAddress pm1_cnt;   /* PM1a_CNT_BLK */
> >      struct AcpiGenericAddress pm1_evt;   /* PM1a_EVT_BLK */
> > @@ -192,6 +182,8 @@ typedef struct AcpiFadtData {
> >      uint8_t  rtc_century;      /* CENTURY */
> >      uint16_t c2_latency;       /* P_LVL2_LAT */
> >      uint16_t c3_latency;       /* P_LVL3_LAT */
> > +    uint16_t arm_boot_arch;    /* ARM_BOOT_ARCH */
> > +    uint8_t minor_ver;         /* FADT Minor Version */
> >  
> >      /*
> >       * respective tables offsets within ACPI_BUILD_TABLE_FILE,
> > diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> > index 17fb71b..5a33cd0 100644
> > --- a/hw/acpi/aml-build.c
> > +++ b/hw/acpi/aml-build.c  
> 
> nit: comment above needs to be extended to rev5.1 support
Thanks, I'll fix it up on respin.

> > @@ -1755,7 +1755,14 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
> >  
> >      build_append_gas_from_struct(tbl, &f->reset_reg); /* RESET_REG */
> >      build_append_int_noprefix(tbl, f->reset_val, 1); /* RESET_VALUE */
> > -    build_append_int_noprefix(tbl, 0, 3); /* Reserved, ACPI 3.0 */
> > +    /* Since ACPI 5.1 */
> > +    if ((f->rev >= 6) || ((f->rev == 5) && f->minor_ver > 0)) {
> > +        build_append_int_noprefix(tbl, f->arm_boot_arch, 2); /* ARM_BOOT_ARCH */
> > +        /* FADT Minor Version */
> > +        build_append_int_noprefix(tbl, f->minor_ver, 1);
> > +    } else {
> > +        build_append_int_noprefix(tbl, 0, 3); /* Reserved upto ACPI 5.0 */
> > +    }
> >      build_append_int_noprefix(tbl, 0, 8); /* X_FIRMWARE_CTRL */
> >  
> >      /* XDSDT address to be filled by Guest linker at runtime */
> > @@ -1779,6 +1786,18 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
> >      build_append_gas_from_struct(tbl, &f->gpe0_blk); /* X_GPE0_BLK */
> >      build_append_gas(tbl, AML_AS_SYSTEM_MEMORY, 0 , 0, 0, 0); /* X_GPE1_BLK */
> >  
> > +    if (f->rev <= 4) {
> > +        goto build_hdr;
> > +    }
> > +
> > +    /* SLEEP_CONTROL_REG */
> > +    build_append_gas(tbl, AML_AS_SYSTEM_MEMORY, 0 , 0, 0, 0);
> > +    /* SLEEP_STATUS_REG */
> > +    build_append_gas(tbl, AML_AS_SYSTEM_MEMORY, 0 , 0, 0, 0);  
> 
> what about Hypervisor Vendor Identity field (8 byte) in version 6.0?
not supported yet, hence assert below.
When it's added we should update assert to the next supported revision.

> > +
> > +    /* TODO: extra fields need to be added to support revisions above rev5 */
> > +    assert(f->rev == 5);  
> OK so can't we assert before the (f->rev >= 6) check above?
> 
> Thanks
> 
> Eric
> > +
> >  build_hdr:
> >      build_header(linker, tbl, (void *)(tbl->data + fadt_start),
> >                   "FACP", tbl->len - fadt_start, f->rev, oem_id, oem_table_id);
> > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > index b644da9..c7c6a57 100644
> > --- a/hw/arm/virt-acpi-build.c
> > +++ b/hw/arm/virt-acpi-build.c
> > @@ -654,39 +654,30 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> >  static void build_fadt_rev5(GArray *table_data, BIOSLinker *linker,
> >                              VirtMachineState *vms, unsigned dsdt_tbl_offset)
> >  {
> > -    int fadt_start = table_data->len;
> > -    AcpiFadtDescriptorRev5_1 *fadt = acpi_data_push(table_data, sizeof(*fadt));
> > -    unsigned xdsdt_entry_offset = (char *)&fadt->x_dsdt - table_data->data;
> > -    uint16_t bootflags;
> > +    /* ACPI v5.1 */
> > +    AcpiFadtData fadt = {
> > +        .rev = 5,
> > +        .minor_ver = 1,
> > +        .flags = 1 << ACPI_FADT_F_HW_REDUCED_ACPI,
> > +        .xdsdt_tbl_offset = &dsdt_tbl_offset,
> > +    };
> >  
> >      switch (vms->psci_conduit) {
> >      case QEMU_PSCI_CONDUIT_DISABLED:
> > -        bootflags = 0;
> > +        fadt.arm_boot_arch = 0;
> >          break;
> >      case QEMU_PSCI_CONDUIT_HVC:
> > -        bootflags = ACPI_FADT_ARM_PSCI_COMPLIANT | ACPI_FADT_ARM_PSCI_USE_HVC;
> > +        fadt.arm_boot_arch = ACPI_FADT_ARM_PSCI_COMPLIANT |
> > +                             ACPI_FADT_ARM_PSCI_USE_HVC;
> >          break;
> >      case QEMU_PSCI_CONDUIT_SMC:
> > -        bootflags = ACPI_FADT_ARM_PSCI_COMPLIANT;
> > +        fadt.arm_boot_arch = ACPI_FADT_ARM_PSCI_COMPLIANT;
> >          break;
> >      default:
> >          g_assert_not_reached();
> >      }
> >  
> > -    /* Hardware Reduced = 1 and use PSCI 0.2+ */
> > -    fadt->flags = cpu_to_le32(1 << ACPI_FADT_F_HW_REDUCED_ACPI);
> > -    fadt->arm_boot_flags = cpu_to_le16(bootflags);
> > -
> > -    /* ACPI v5.1 (fadt->revision.fadt->minor_revision) */
> > -    fadt->minor_revision = 0x1;
> > -
> > -    /* DSDT address to be filled by Guest linker */
> > -    bios_linker_loader_add_pointer(linker,
> > -        ACPI_BUILD_TABLE_FILE, xdsdt_entry_offset, sizeof(fadt->x_dsdt),
> > -        ACPI_BUILD_TABLE_FILE, dsdt_tbl_offset);
> > -
> > -    build_header(linker, table_data, (void *)(table_data->data + fadt_start),
> > -                 "FACP", table_data->len - fadt_start, 5, NULL, NULL);
> > +    build_fadt(table_data, linker, &fadt, NULL, NULL);
> >  }
> >  
> >  /* DSDT */
> >   

