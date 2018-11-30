Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3365340wrt;
        Fri, 30 Nov 2018 01:36:22 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XOxDXdnXTks8AfB51oELwJC+q6Az0c+sC6dlScN04CjeaNVuR6T/QMF8F85SRSeOFsLdAW
X-Received: by 2002:a81:b2c2:: with SMTP id q185-v6mr4780181ywh.349.1543570582177;
        Fri, 30 Nov 2018 01:36:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543570582; cv=none;
        d=google.com; s=arc-20160816;
        b=co0pZmYL8ZXiZW23TlBu+y8HDS5v63nek4Hk3RN0yeym2c3iphzQYGAveEYh7faJvF
         FwNS77gNCxnQbzJg7QeE4BrDR4+rerozz7eJlmNWQhUTmkRvOF54eVDFtqzWdbFrj6QJ
         Ekhi9pPVTLnylj4AnXZj8y4QUhz/pp+rq2+fBmDbJEmAGMUw7tWGZFmXmzpsdm/Jd5jd
         +nkuaZ8oIUnm+RAPOtXGbga5z9vdVRYq//qbZk/9exdYuDAraIcknE9ioqjyvQUrPx8o
         hDF8/J98sD/CvDLZj47zGPVLFZ9a7I1ZUv2fEysRKtynstaUl+Q8/pxBl+hZRvwOh+5R
         B8eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=jH0J6XwoQbZjmqDyEdasLmwhgdf6S9Qs3ytkrztlKtI=;
        b=L+Lsj27HNgBxEyj08LcJfl0klI1+1DmXdeOH3ZwxO9X/YOgtJfwWuWlWcfk/EMfiEW
         djLlGNG00ort++rnfBlZ9qd3T2eBT8XOp9mo4lSgAit6Bs7JDdvz10PRebEL8LjLUplb
         as1elz7xd38CxmhKrf0Ajb2L4CMWMCTE3yb+19Qdm+ggYyFwO6NobZ5lsSjHe6BXl93e
         WjDB/ZAt0eMI4+kQxucZ+UG0o9dbo77C9L3iySA9GVMfllz7wdhFE30hML1Q03LNyjTO
         7tvy4mzhEf7BdrMbTE2OAd+H8I2wARRaQ5ag+E1hxrm9kx/POmFw9O6GIsoX+tC8QX5s
         r2rA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l19si2720334ywa.358.2018.11.30.01.36.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Nov 2018 01:36:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:58951 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSfDh-000330-LI
	for alex.bennee@linaro.org; Fri, 30 Nov 2018 04:36:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37266)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gSfDZ-00032t-Je
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 04:36:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gSfDV-0008RF-Jc
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 04:36:13 -0500
Received: from mga02.intel.com ([134.134.136.20]:35743)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gSfDV-0008Qg-8A; Fri, 30 Nov 2018 04:36:09 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Nov 2018 01:36:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,298,1539673200"; d="scan'208";a="292780332"
Received: from ppkrause-mobl.ger.corp.intel.com (HELO caravaggio)
	([10.251.84.55])
	by fmsmga005.fm.intel.com with ESMTP; 30 Nov 2018 01:36:02 -0800
Date: Fri, 30 Nov 2018 10:35:33 +0100
From: Samuel Ortiz <sameo@linux.intel.com>
To: Andrew Jones <drjones@redhat.com>
Message-ID: <20181130093533.GB4195@caravaggio>
References: <20181129132428.333-1-sameo@linux.intel.com>
	<20181129132428.333-9-sameo@linux.intel.com>
	<20181129150743.rsrrtsplzvzqie7o@kamzik.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181129150743.rsrrtsplzvzqie7o@kamzik.brq.redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.20
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 8/8] hw: acpi: Remove
 AcpiRsdpDescriptor and fix tests
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
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PWjl5bI7dUf7

On Thu, Nov 29, 2018 at 04:07:43PM +0100, Andrew Jones wrote:
> On Thu, Nov 29, 2018 at 02:24:28PM +0100, Samuel Ortiz wrote:
> > The only remaining AcpiRsdpDescriptor users are the ACPI utils for the
> > BIOS table tests.
> > We remove that dependency and can thus remove the structure itself.
> > 
> > Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> > ---
> >  include/hw/acpi/acpi-defs.h | 13 -----------
> >  tests/acpi-utils.h          |  5 +++-
> >  tests/acpi-utils.c          | 46 ++++++++++++++++++++++++++++++-------
> >  tests/bios-tables-test.c    | 27 +++++++++++++++-------
> >  tests/vmgenid-test.c        |  8 ++++---
> >  5 files changed, 66 insertions(+), 33 deletions(-)
> > 
> > diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> > index 8425ecb8c6..5021cb9e79 100644
> > --- a/include/hw/acpi/acpi-defs.h
> > +++ b/include/hw/acpi/acpi-defs.h
> > @@ -40,19 +40,6 @@ enum {
> >      ACPI_FADT_F_LOW_POWER_S0_IDLE_CAPABLE,
> >  };
> >  
> > -struct AcpiRsdpDescriptor {        /* Root System Descriptor Pointer */
> > -    uint64_t signature;              /* ACPI signature, contains "RSD PTR " */
> > -    uint8_t  checksum;               /* To make sum of struct == 0 */
> > -    uint8_t  oem_id [6];             /* OEM identification */
> > -    uint8_t  revision;               /* Must be 0 for 1.0, 2 for 2.0 */
> > -    uint32_t rsdt_physical_address;  /* 32-bit physical address of RSDT */
> > -    uint32_t length;                 /* XSDT Length in bytes including hdr */
> > -    uint64_t xsdt_physical_address;  /* 64-bit physical address of XSDT */
> > -    uint8_t  extended_checksum;      /* Checksum of entire table */
> > -    uint8_t  reserved [3];           /* Reserved field must be 0 */
> > -} QEMU_PACKED;
> > -typedef struct AcpiRsdpDescriptor AcpiRsdpDescriptor;
> > -
> >  typedef struct AcpiRsdpData {
> >      uint8_t oem_id[6]; /* OEM identification */
> >      uint8_t revision;  /* Must be 0 for 1.0, 2 for 2.0 */
> > diff --git a/tests/acpi-utils.h b/tests/acpi-utils.h
> > index ac52abd0dd..c26c8976a6 100644
> > --- a/tests/acpi-utils.h
> > +++ b/tests/acpi-utils.h
> > @@ -82,6 +82,9 @@ typedef struct {
> >  
> >  uint8_t acpi_calc_checksum(const uint8_t *data, int len);
> >  uint32_t acpi_find_rsdp_address(void);
> > -void acpi_parse_rsdp_table(uint32_t addr, AcpiRsdpDescriptor *rsdp_table);
> > +uint32_t acpi_get_rsdt_address(uint8_t *rsdp_table);
> > +uint64_t acpi_get_xsdt_address(uint8_t *rsdp_table);
> > +void acpi_parse_rsdp_table(uint32_t addr, uint8_t *rsdp_table,
> > +                           uint8_t revision);
> >  
> >  #endif  /* TEST_ACPI_UTILS_H */
> > diff --git a/tests/acpi-utils.c b/tests/acpi-utils.c
> > index 41dc1ea9b4..b1113bda8b 100644
> > --- a/tests/acpi-utils.c
> > +++ b/tests/acpi-utils.c
> > @@ -52,14 +52,44 @@ uint32_t acpi_find_rsdp_address(void)
> >      return off;
> >  }
> >  
> > -void acpi_parse_rsdp_table(uint32_t addr, AcpiRsdpDescriptor *rsdp_table)
> > +uint32_t acpi_get_rsdt_address(uint8_t *rsdp_table)
> >  {
> > -    ACPI_READ_FIELD(rsdp_table->signature, addr);
> > -    ACPI_ASSERT_CMP64(rsdp_table->signature, "RSD PTR ");
> > +    uint32_t rsdt_physical_address;
> > +    uint8_t revision = rsdp_table[15 /* Revision offset */];
> >  
> > -    ACPI_READ_FIELD(rsdp_table->checksum, addr);
> > -    ACPI_READ_ARRAY(rsdp_table->oem_id, addr);
> > -    ACPI_READ_FIELD(rsdp_table->revision, addr);
> > -    ACPI_READ_FIELD(rsdp_table->rsdt_physical_address, addr);
> > -    ACPI_READ_FIELD(rsdp_table->length, addr);
> > +    if (revision != 0) { /* ACPI 1.0 RSDP */
> > +        return 0;
> > +    }
> 
> So now we assume a zero offset can't be valid, which means we don't need
> pointers in the struct. Your answer that pointers are used for consistency
> is good enough for me though.
> 
> > +
> > +    memcpy(&rsdt_physical_address, &rsdp_table[16 /* RsdtAddress offset */], 4);
> > +    return le32_to_cpu(rsdt_physical_address);
> > +}
> > +
> > +uint64_t acpi_get_xsdt_address(uint8_t *rsdp_table)
> > +{
> > +    uint64_t xsdt_physical_address;
> > +    uint8_t revision = rsdp_table[15 /* Revision offset */];
> > +
> > +    if (revision != 2) { /* ACPI 2.0+ RSDP */
> 
> revision < 2
> 
> > +        return 0;
> > +    }
> > +
> > +    memcpy(&xsdt_physical_address, &rsdp_table[24 /* XsdtAddress offset */], 8);
> > +    return le64_to_cpu(xsdt_physical_address);
> > +}
> > +
> > +void acpi_parse_rsdp_table(uint32_t addr, uint8_t *rsdp_table, uint8_t revision)
> > +{
> > +    switch (revision) {
> > +    case 0: /* ACPI 1.0 RSDP */
> > +        memread(addr, rsdp_table, 20);
> > +        break;
> > +    case 2: /* ACPI 2.0+ RSDP */
> > +        memread(addr, rsdp_table, 36);
> > +        break;
> > +    default:
> > +        g_assert_not_reached();
> > +    }
> > +
> > +    ACPI_ASSERT_CMP64(*((uint64_t *)(rsdp_table)), "RSD PTR ");
> >  }
> > diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
> > index d661d9be62..84f1500920 100644
> > --- a/tests/bios-tables-test.c
> > +++ b/tests/bios-tables-test.c
> > @@ -27,7 +27,8 @@ typedef struct {
> >      const char *machine;
> >      const char *variant;
> >      uint32_t rsdp_addr;
> > -    AcpiRsdpDescriptor rsdp_table;
> > +    uint8_t rsdp_table[36 /* ACPI 2.0+ RSDP size */];
> > +    uint32_t rsdt_physical_address;
> 
> I don't see rsdt_physical_address getting used anyway.
Good catch, thanks. Removed in v3.

Cheers,
Samuel.

