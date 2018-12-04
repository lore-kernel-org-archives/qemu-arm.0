Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp8287778wrt;
        Tue, 4 Dec 2018 08:46:13 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UkX94eh4sqJtVbHq0Gd8NZiAUhjM99w3GCYeX4BTKpcxI00Xc/1zMvjWCmGCdmOKpsa8no
X-Received: by 2002:ac8:44d3:: with SMTP id b19mr20787065qto.107.1543941973135;
        Tue, 04 Dec 2018 08:46:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543941973; cv=none;
        d=google.com; s=arc-20160816;
        b=lKE4keSZQ5LMN+E/r2bJ3Pnadgp/UyNMhdDYUNpzdAyrMjGmwy9kq9pw4y6iJ6/9xw
         Jod7Z2lzJpN65G+QZAP1dIt3rpq0F5C1i7u+qQsJR3gOf2OX8+QbibXmR/AxkDVZAxqv
         BTei/PapAL0AlvHnQEU9XLlVbUpSnguH6einZmdRIK2K3gU/RSbR1j4PgV+KSPiHQDa9
         b6azpntGswfHA5sATOIuBP6yldrXpwPi8BPBSI48Gj57kgW82HCTXaa8lh2Kvw3t1ycn
         4OMOLho5GEu0t2MuhmJRiU5NAslsHRXL9gAQ/bo+SAAdSdlbGkq6pNoJbe8mpQKpDKjl
         Xrag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=GBvv2K4xjkeIPe+S9l/2/PJpVux6cAqrIu9mUK+nK7g=;
        b=Mpntvb+bvojLDzwsygK2K0OEEvW6xqjwZVLRIos/WxTTK7PD0d1kiJhGSwWaE2xMm6
         B+CO9sHF+tqcuynuaMLcUfRoP8lzPym8v771dyee8OZe3SQd2JsFS9NbO3+5VFxbyJx3
         U8N6hCGSD9dLq0J3fm1HWbK3OrhE01omTJenHMiGvAh4fFj1hacBBomuieXBs4AWx5ci
         zotj8UevVbwqRGH84Gyavp4pSH2Qh60tDJ17Z07Wj5YFou3gov/QG0UEPAeUL84opvN2
         GOqvp2HTuwnQ3FQ7vr6rqN/9z03zLalRzUP5OKXulE1pcKLFE2peAzW1kph4Lm2eiZp8
         GSBA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j13si525825qtk.203.2018.12.04.08.46.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Dec 2018 08:46:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57862 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUDps-0004lu-HW
	for alex.bennee@linaro.org; Tue, 04 Dec 2018 11:46:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39253)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gUDnG-0001Fb-Hn
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 11:43:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gUDn6-0000zm-Tr
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 11:43:26 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40226)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gUDn2-0000qw-Hs; Tue, 04 Dec 2018 11:43:18 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 91F0B96E9;
	Tue,  4 Dec 2018 16:43:12 +0000 (UTC)
Received: from localhost (unknown [10.40.205.13])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 415557F1BF;
	Tue,  4 Dec 2018 16:43:07 +0000 (UTC)
Date: Tue, 4 Dec 2018 17:43:05 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Message-ID: <20181204174305.34a8644d@redhat.com>
In-Reply-To: <20181204151052.otrsahh4dqehiwif@kamzik.brq.redhat.com>
References: <20181130130032.11835-1-sameo@linux.intel.com>
	<20181130130032.11835-9-sameo@linux.intel.com>
	<20181204151052.otrsahh4dqehiwif@kamzik.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 04 Dec 2018 16:43:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 8/8] hw: acpi: Remove
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
	Samuel Ortiz <sameo@linux.intel.com>, Ben Warren <ben@skyportsystems.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uqlOmmJRnRhE

On Tue, 4 Dec 2018 16:10:52 +0100
Andrew Jones <drjones@redhat.com> wrote:

> On Fri, Nov 30, 2018 at 02:00:32PM +0100, Samuel Ortiz wrote:
> > The only remaining AcpiRsdpDescriptor users are the ACPI utils for the
> > BIOS table tests.
> > We remove that dependency and can thus remove the structure itself.
> > 
> > Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> > ---
> >  include/hw/acpi/acpi-defs.h | 13 -----------
> >  tests/acpi-utils.h          |  4 +++-
> >  tests/acpi-utils.c          | 46 ++++++++++++++++++++++++++++++-------
> >  tests/bios-tables-test.c    | 21 +++++++++++++----
> >  tests/vmgenid-test.c        |  8 ++++---
> >  5 files changed, 62 insertions(+), 30 deletions(-)
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
> > index ac52abd0dd..4f4899deb5 100644
> > --- a/tests/acpi-utils.h
> > +++ b/tests/acpi-utils.h
> > @@ -82,6 +82,8 @@ typedef struct {
> >  
> >  uint8_t acpi_calc_checksum(const uint8_t *data, int len);
> >  uint32_t acpi_find_rsdp_address(void);
> > -void acpi_parse_rsdp_table(uint32_t addr, AcpiRsdpDescriptor *rsdp_table);
> > +uint32_t acpi_get_rsdt_address(uint8_t *rsdp_table);
> > +uint64_t acpi_get_xsdt_address(uint8_t *rsdp_table);
> > +void acpi_parse_rsdp_table(uint32_t addr, uint8_t *rsdp_table);
> >  
> >  #endif  /* TEST_ACPI_UTILS_H */
> > diff --git a/tests/acpi-utils.c b/tests/acpi-utils.c
> > index 41dc1ea9b4..d07f7487e2 100644
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
> >  
> > -    ACPI_READ_FIELD(rsdp_table->checksum, addr);
> > -    ACPI_READ_ARRAY(rsdp_table->oem_id, addr);
> > -    ACPI_READ_FIELD(rsdp_table->revision, addr);
> > -    ACPI_READ_FIELD(rsdp_table->rsdt_physical_address, addr);
> > -    ACPI_READ_FIELD(rsdp_table->length, addr);
> > +    memcpy(&rsdt_physical_address, &rsdp_table[16 /* RsdtAddress offset */], 4);
> > +    return le32_to_cpu(rsdt_physical_address);
> > +}
> > +
> > +uint64_t acpi_get_xsdt_address(uint8_t *rsdp_table)
> > +{
> > +    uint64_t xsdt_physical_address;
> > +    uint8_t revision = rsdp_table[15 /* Revision offset */];
> > +
> > +    /* We must have revision 2 if we're looking for an XSDT pointer */
> > +    g_assert(revision == 2);
> > +
> > +    memcpy(&xsdt_physical_address, &rsdp_table[24 /* XsdtAddress offset */], 8);
> > +    return le64_to_cpu(xsdt_physical_address);
> > +}
> > +
> > +void acpi_parse_rsdp_table(uint32_t addr, uint8_t *rsdp_table)
> > +{
> > +    uint8_t revision;
> > +
> > +    /* Read mandatory revision 0 table data (20 bytes) first */
> > +    memread(addr, rsdp_table, 20);
> > +    revision = rsdp_table[15 /* Revision offset */];
> > +
> > +    switch (revision) {
> > +    case 0: /* ACPI 1.0 RSDP */
> > +        break;
> > +    case 2: /* ACPI 2.0+ RSDP */
> > +        /* Read the rest of the RSDP table */
> > +        memread(addr + 20, rsdp_table + 20, 16);
> > +        break;
> > +    default:
> > +        g_assert_not_reached();
> > +    }
> > +
> > +    ACPI_ASSERT_CMP64(*((uint64_t *)(rsdp_table)), "RSD PTR ");
> >  }
> > diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
> > index d661d9be62..8749b77b36 100644
> > --- a/tests/bios-tables-test.c
> > +++ b/tests/bios-tables-test.c
> > @@ -27,7 +27,7 @@ typedef struct {
> >      const char *machine;
> >      const char *variant;
> >      uint32_t rsdp_addr;
> > -    AcpiRsdpDescriptor rsdp_table;
> > +    uint8_t rsdp_table[36 /* ACPI 2.0+ RSDP size */];
> >      AcpiRsdtDescriptorRev1 rsdt_table;
> >      uint32_t dsdt_addr;
> >      uint32_t facs_addr;
> > @@ -85,19 +85,30 @@ static void test_acpi_rsdp_address(test_data *data)
> >  
> >  static void test_acpi_rsdp_table(test_data *data)
> >  {
> > -    AcpiRsdpDescriptor *rsdp_table = &data->rsdp_table;
> > +    uint8_t *rsdp_table = data->rsdp_table, revision;
> >      uint32_t addr = data->rsdp_addr;
> >  
> >      acpi_parse_rsdp_table(addr, rsdp_table);
> > +    revision = rsdp_table[15 /* Revision offset */];
> >  
> > -    /* rsdp checksum is not for the whole table, but for the first 20 bytes */
> > -    g_assert(!acpi_calc_checksum((uint8_t *)rsdp_table, 20));
> > +    switch (revision) {
> > +    case 0: /* ACPI 1.0 RSDP */
> > +        /* With rev 1, checksum is only for the first 20 bytes */
> > +        g_assert(!acpi_calc_checksum(rsdp_table,  20));
> > +        break;
> > +    case 2: /* ACPI 2.0+ RSDP */
> > +        /* With revision 2, we have 2 checksums */
> > +        g_assert(!acpi_calc_checksum(rsdp_table, 20));
> > +        g_assert(!acpi_calc_checksum(rsdp_table, 36));  
> 
> Missing break. I guess this wasn't yet tested with ACPI 2.0+?
> Are we going to extend the tests to do that?
I'm working on adding arm/virt board to these tests,
so that will use this 2.0 path

> 
> > +    default:
> > +        g_assert_not_reached();
> > +    }
> >  }
> >  
> >  static void test_acpi_rsdt_table(test_data *data)
> >  {
> >      AcpiRsdtDescriptorRev1 *rsdt_table = &data->rsdt_table;
> > -    uint32_t addr = le32_to_cpu(data->rsdp_table.rsdt_physical_address);
> > +    uint32_t addr = acpi_get_rsdt_address(data->rsdp_table);
> >      uint32_t *tables;
> >      int tables_nr;
> >      uint8_t checksum;
> > diff --git a/tests/vmgenid-test.c b/tests/vmgenid-test.c
> > index 0a6fb55f2e..97219ae86c 100644
> > --- a/tests/vmgenid-test.c
> > +++ b/tests/vmgenid-test.c
> > @@ -35,7 +35,7 @@ static uint32_t acpi_find_vgia(void)
> >  {
> >      uint32_t rsdp_offset;
> >      uint32_t guid_offset = 0;
> > -    AcpiRsdpDescriptor rsdp_table;
> > +    uint8_t rsdp_table[36 /* ACPI 2.0+ RSDP size */];
> >      uint32_t rsdt, rsdt_table_length;
> >      AcpiRsdtDescriptorRev1 rsdt_table;
> >      size_t tables_nr;
> > @@ -52,9 +52,11 @@ static uint32_t acpi_find_vgia(void)
> >  
> >      g_assert_cmphex(rsdp_offset, <, RSDP_ADDR_INVALID);
> >  
> > -    acpi_parse_rsdp_table(rsdp_offset, &rsdp_table);
> > +    acpi_parse_rsdp_table(rsdp_offset, rsdp_table);
> > +
> > +    rsdt = acpi_get_rsdt_address(rsdp_table);
> > +    g_assert(rsdt);
> >  
> > -    rsdt = le32_to_cpu(rsdp_table.rsdt_physical_address);
> >      /* read the header */
> >      ACPI_READ_TABLE_HEADER(&rsdt_table, rsdt);
> >      ACPI_ASSERT_CMP(rsdt_table.signature, "RSDT");
> > -- 
> > 2.19.2
> > 
> >  
> 
> Besides the missing break
> 
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> 

