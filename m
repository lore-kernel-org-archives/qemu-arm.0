Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3405814wrt;
        Fri, 30 Nov 2018 02:27:03 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XCfUsa8NLf9cnhH+uWac9kLHMf7qjJL3noSgjXjBjIsaPdk/G6Rk+idkuUdsRkh2XuExUW
X-Received: by 2002:a25:6508:: with SMTP id z8-v6mr4737706ybb.470.1543573623737;
        Fri, 30 Nov 2018 02:27:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543573623; cv=none;
        d=google.com; s=arc-20160816;
        b=XeWV1i8+zQ9AwBkRQ5HN5f1iUDBZFY1CzKCO/z6z/I1E30DPpV53Dih3QSVOX8nrOV
         a2KRSmvuKKXriJrD8owcQwc0VTCtyZrp795cksABaZDDzxEctr+mCP58qXRWc1xzkg3b
         vECteO9gcMV0LlgzUKAIROFvlp3TwnemAFfVIf/h6NTWIVG2taj5mf1wddYlv0JWKMKo
         tLKgtShhJFdcXXuAlrb/e6FAfYl2XpdVEDo70I6UTgWfuA4cCNoagh4e0orNNZkgh4iZ
         1obydpapSOw6x7DjW0y7LvEp91K7gu1nm6z6al1GVrrY4fWR0mboJBmc/HlIrtZ2AvqZ
         YKAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=3Tkf+iBZAKo7eJQk5yJr0085G9zv3vpYyxvbbRiK6QY=;
        b=HxtvNUf0BMSWa6Vwbr6BXTjeOKiC2zAmYNvk0UpnehQ2RFdSZ2sLUTL0SYknOSeWQI
         qEfQ0AIVkYjuYtNO7LAhbd8Gj7xoChk43EUl4qmSvFTTi9MEm0vN34nEBOZTquWVF/ym
         PHL71oagS1XpjGCRa2k/FGvJFFaVyYn7YvIFFZMO+J1twEgzBNhB9DgIODqXeSszqF4E
         bF/Ua6ttLODtNKaZKE59XgBmJWuTF+kNiG8y1xpbBIpoO+1fcXa2VpAw37ISqodcU/mF
         gkfYzWz1irD8lC+pseW1K5migqOepQgvCR9KVGUw9640xn9ODkshkyw4ANd5y2Zk7RGY
         7tHg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e12-v6si2883734ybj.50.2018.11.30.02.27.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Nov 2018 02:27:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59235 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSg0l-0008Da-7L
	for alex.bennee@linaro.org; Fri, 30 Nov 2018 05:27:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54965)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gSg0d-0008DI-On
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 05:26:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gSg0Z-00048F-LI
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 05:26:55 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38504)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gSg0X-000473-Qo; Fri, 30 Nov 2018 05:26:51 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AE8403E2D8;
	Fri, 30 Nov 2018 10:26:47 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4D48360C61;
	Fri, 30 Nov 2018 10:26:41 +0000 (UTC)
Date: Fri, 30 Nov 2018 11:26:40 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181130112640.74e350b5@redhat.com>
In-Reply-To: <20181129132428.333-9-sameo@linux.intel.com>
References: <20181129132428.333-1-sameo@linux.intel.com>
	<20181129132428.333-9-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 30 Nov 2018 10:26:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
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
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2ZIZRfgYwwzZ

On Thu, 29 Nov 2018 14:24:28 +0100
Samuel Ortiz <sameo@linux.intel.com> wrote:

> The only remaining AcpiRsdpDescriptor users are the ACPI utils for the
> BIOS table tests.
> We remove that dependency and can thus remove the structure itself.
> 
> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> ---
>  include/hw/acpi/acpi-defs.h | 13 -----------
>  tests/acpi-utils.h          |  5 +++-
>  tests/acpi-utils.c          | 46 ++++++++++++++++++++++++++++++-------
>  tests/bios-tables-test.c    | 27 +++++++++++++++-------
>  tests/vmgenid-test.c        |  8 ++++---
>  5 files changed, 66 insertions(+), 33 deletions(-)
> 
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index 8425ecb8c6..5021cb9e79 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -40,19 +40,6 @@ enum {
>      ACPI_FADT_F_LOW_POWER_S0_IDLE_CAPABLE,
>  };
>  
> -struct AcpiRsdpDescriptor {        /* Root System Descriptor Pointer */
> -    uint64_t signature;              /* ACPI signature, contains "RSD PTR " */
> -    uint8_t  checksum;               /* To make sum of struct == 0 */
> -    uint8_t  oem_id [6];             /* OEM identification */
> -    uint8_t  revision;               /* Must be 0 for 1.0, 2 for 2.0 */
> -    uint32_t rsdt_physical_address;  /* 32-bit physical address of RSDT */
> -    uint32_t length;                 /* XSDT Length in bytes including hdr */
> -    uint64_t xsdt_physical_address;  /* 64-bit physical address of XSDT */
> -    uint8_t  extended_checksum;      /* Checksum of entire table */
> -    uint8_t  reserved [3];           /* Reserved field must be 0 */
> -} QEMU_PACKED;
> -typedef struct AcpiRsdpDescriptor AcpiRsdpDescriptor;
> -
>  typedef struct AcpiRsdpData {
>      uint8_t oem_id[6]; /* OEM identification */
>      uint8_t revision;  /* Must be 0 for 1.0, 2 for 2.0 */
> diff --git a/tests/acpi-utils.h b/tests/acpi-utils.h
> index ac52abd0dd..c26c8976a6 100644
> --- a/tests/acpi-utils.h
> +++ b/tests/acpi-utils.h
> @@ -82,6 +82,9 @@ typedef struct {
>  
>  uint8_t acpi_calc_checksum(const uint8_t *data, int len);
>  uint32_t acpi_find_rsdp_address(void);
> -void acpi_parse_rsdp_table(uint32_t addr, AcpiRsdpDescriptor *rsdp_table);
> +uint32_t acpi_get_rsdt_address(uint8_t *rsdp_table);
> +uint64_t acpi_get_xsdt_address(uint8_t *rsdp_table);
> +void acpi_parse_rsdp_table(uint32_t addr, uint8_t *rsdp_table,
> +                           uint8_t revision);
>  
>  #endif  /* TEST_ACPI_UTILS_H */
> diff --git a/tests/acpi-utils.c b/tests/acpi-utils.c
> index 41dc1ea9b4..b1113bda8b 100644
> --- a/tests/acpi-utils.c
> +++ b/tests/acpi-utils.c
> @@ -52,14 +52,44 @@ uint32_t acpi_find_rsdp_address(void)
>      return off;
>  }
>  
> -void acpi_parse_rsdp_table(uint32_t addr, AcpiRsdpDescriptor *rsdp_table)
> +uint32_t acpi_get_rsdt_address(uint8_t *rsdp_table)
>  {
> -    ACPI_READ_FIELD(rsdp_table->signature, addr);
> -    ACPI_ASSERT_CMP64(rsdp_table->signature, "RSD PTR ");
> +    uint32_t rsdt_physical_address;
> +    uint8_t revision = rsdp_table[15 /* Revision offset */];
>  
> -    ACPI_READ_FIELD(rsdp_table->checksum, addr);
> -    ACPI_READ_ARRAY(rsdp_table->oem_id, addr);
> -    ACPI_READ_FIELD(rsdp_table->revision, addr);
> -    ACPI_READ_FIELD(rsdp_table->rsdt_physical_address, addr);
> -    ACPI_READ_FIELD(rsdp_table->length, addr);
> +    if (revision != 0) { /* ACPI 1.0 RSDP */
> +        return 0;
> +    }
It seems not needed,
Why not return whatever is in table?

> +
> +    memcpy(&rsdt_physical_address, &rsdp_table[16 /* RsdtAddress offset */], 4);
> +    return le32_to_cpu(rsdt_physical_address);
> +}
> +
> +uint64_t acpi_get_xsdt_address(uint8_t *rsdp_table)
> +{
> +    uint64_t xsdt_physical_address;
> +    uint8_t revision = rsdp_table[15 /* Revision offset */];
> +
> +    if (revision != 2) { /* ACPI 2.0+ RSDP */
maybe replace this with assert, if we are getting XSDT, revision must be 2 or more

> +        return 0;
> +    }
> +
> +    memcpy(&xsdt_physical_address, &rsdp_table[24 /* XsdtAddress offset */], 8);
> +    return le64_to_cpu(xsdt_physical_address);
> +}
> +
> +void acpi_parse_rsdp_table(uint32_t addr, uint8_t *rsdp_table, uint8_t revision)
> +{
why do we need pass in revision?
It would be better if we read sub-table first, then parse revision
and then read the rest if necessary.

Then it's up to a caller what do with the table that  we've fetched here

> +    switch (revision) {
> +    case 0: /* ACPI 1.0 RSDP */
> +        memread(addr, rsdp_table, 20);
> +        break;
> +    case 2: /* ACPI 2.0+ RSDP */
> +        memread(addr, rsdp_table, 36);
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +
> +    ACPI_ASSERT_CMP64(*((uint64_t *)(rsdp_table)), "RSD PTR ");
>  }
> diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
> index d661d9be62..84f1500920 100644
> --- a/tests/bios-tables-test.c
> +++ b/tests/bios-tables-test.c
> @@ -27,7 +27,8 @@ typedef struct {
>      const char *machine;
>      const char *variant;
>      uint32_t rsdp_addr;
> -    AcpiRsdpDescriptor rsdp_table;
> +    uint8_t rsdp_table[36 /* ACPI 2.0+ RSDP size */];
> +    uint32_t rsdt_physical_address;
>      AcpiRsdtDescriptorRev1 rsdt_table;
>      uint32_t dsdt_addr;
>      uint32_t facs_addr;
> @@ -83,21 +84,31 @@ static void test_acpi_rsdp_address(test_data *data)
>      data->rsdp_addr = off;
>  }
>  
> -static void test_acpi_rsdp_table(test_data *data)
> +static void test_acpi_rsdp_table(test_data *data, uint8_t revision)
like wise, I'd drop revision here and use whatever is in the table
if we need to test for specific revision in the future we can add
test case for that then.

>  {
> -    AcpiRsdpDescriptor *rsdp_table = &data->rsdp_table;
> +    uint8_t *rsdp_table = data->rsdp_table;
>      uint32_t addr = data->rsdp_addr;
>  
> -    acpi_parse_rsdp_table(addr, rsdp_table);
> +    acpi_parse_rsdp_table(addr, rsdp_table, revision);
>  
> -    /* rsdp checksum is not for the whole table, but for the first 20 bytes */
> -    g_assert(!acpi_calc_checksum((uint8_t *)rsdp_table, 20));
> +    switch (revision) {
> +    case 0: /* ACPI 1.0 RSDP */
> +        /* With rev 1, checksum is only for the first 20 bytes */
> +        g_assert(!acpi_calc_checksum(rsdp_table,  20));
> +        break;
> +    case 2: /* ACPI 2.0+ RSDP */
> +        /* With revision 2, we have 2 checksums */
> +        g_assert(!acpi_calc_checksum(rsdp_table, 20));
> +        g_assert(!acpi_calc_checksum(rsdp_table, 36));
> +    default:
> +        g_assert_not_reached();
> +    }
>  }
>  
>  static void test_acpi_rsdt_table(test_data *data)
>  {
>      AcpiRsdtDescriptorRev1 *rsdt_table = &data->rsdt_table;
> -    uint32_t addr = le32_to_cpu(data->rsdp_table.rsdt_physical_address);
> +    uint32_t addr = acpi_get_rsdt_address(data->rsdp_table);
>      uint32_t *tables;
>      int tables_nr;
>      uint8_t checksum;
> @@ -626,7 +637,7 @@ static void test_acpi_one(const char *params, test_data *data)
>  
>      data->tables = g_array_new(false, true, sizeof(AcpiSdtTable));
>      test_acpi_rsdp_address(data);
> -    test_acpi_rsdp_table(data);
> +    test_acpi_rsdp_table(data, 0); /* ACPI 1.0 RSDP */
>      test_acpi_rsdt_table(data);
>      fadt_fetch_facs_and_dsdt_ptrs(data);
>      test_acpi_facs_table(data);
> diff --git a/tests/vmgenid-test.c b/tests/vmgenid-test.c
> index 0a6fb55f2e..5f30dee059 100644
> --- a/tests/vmgenid-test.c
> +++ b/tests/vmgenid-test.c
> @@ -35,7 +35,7 @@ static uint32_t acpi_find_vgia(void)
>  {
>      uint32_t rsdp_offset;
>      uint32_t guid_offset = 0;
> -    AcpiRsdpDescriptor rsdp_table;
> +    uint8_t rsdp_table[36 /* ACPI 2.0+ RSDP size */];
>      uint32_t rsdt, rsdt_table_length;
>      AcpiRsdtDescriptorRev1 rsdt_table;
>      size_t tables_nr;
> @@ -52,9 +52,11 @@ static uint32_t acpi_find_vgia(void)
>  
>      g_assert_cmphex(rsdp_offset, <, RSDP_ADDR_INVALID);
>  
> -    acpi_parse_rsdp_table(rsdp_offset, &rsdp_table);
> +    acpi_parse_rsdp_table(rsdp_offset, rsdp_table, 0);
> +
> +    rsdt = acpi_get_rsdt_address(rsdp_table);
> +    g_assert(rsdt);
>  
> -    rsdt = le32_to_cpu(rsdp_table.rsdt_physical_address);
>      /* read the header */
>      ACPI_READ_TABLE_HEADER(&rsdt_table, rsdt);
>      ACPI_ASSERT_CMP(rsdt_table.signature, "RSDT");

