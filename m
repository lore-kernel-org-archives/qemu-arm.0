Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp820575wrt;
        Wed, 28 Nov 2018 01:51:37 -0800 (PST)
X-Google-Smtp-Source: AJdET5cKg4+wD43islsZn7lO7+T4iwshShtvNshLm2h3UWnq610ORXGAfJjfT6e1v/e3HVNeRJE7
X-Received: by 2002:a81:9184:: with SMTP id i126mr37404823ywg.371.1543398697222;
        Wed, 28 Nov 2018 01:51:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543398697; cv=none;
        d=google.com; s=arc-20160816;
        b=IkZLkTE8IuFAtPjxo93NxG7lofCheAoHb6WcZGTj0yMlg+ogFYnVsdr5uFVs31mz3W
         4EDcJJ0Zp+dG0iZ0MNTaPfG9a5nN/lOuUnDhDfnPDZ3gWDYCGFxIlBycWG2rG6Pu+Vx/
         a9YP+Qi0EIz6JXZeNgvqmYMnSo3cOhoQysx/xqruI3YQ1t4hzCGpdCU13VFa6j/oBc2T
         kyuUABRTcEQEoGSSHc2AXNvU8qm4d4c0w8ItxomXVPICp07OWpcpnH1nR+g1BSgTbANs
         d77Bb9/U8qqut5XCRyU9K6vBuIXPkwSL5qeLZOcBNv49CRaozsNNKUTa0THnq7pjxfqb
         EVmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=zkJnM38utVFczmQIIH/yKMs/6BGFYIzdz/5lyxEJkU0=;
        b=mjlJbvPIUzGYU29HbzcTSIzV2MO03vu4U5G7ZN3PvhP+CtxQvVWpJ7UmZTNpL4+9jb
         Z0KMv20uoODOa/eQrjIoYP05h6zozJftECofyrmBS0l/5fb0/JSDzU5pnorWOj7j5Hzm
         SS1DXp2HqQaChWsDhWV9wrrspBNttgkUHHEWPhbDpXsmLJqwoDW3pCa1icZ/UG9U7Wxz
         0rObP85umD3wlslVF/2wdiuMuuVAARiPLhSFcSuEGTTvGVHQO4ItwlvFV1xRqzdRkex8
         pumBjCurq0F0yMP/IIwyJ1p9+WoT9VUnDZFJIVdqoZY8HK6VaD57LwFFum/z0MWSYP4I
         OAIw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 195si4631725ywd.309.2018.11.28.01.51.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Nov 2018 01:51:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46852 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRwVM-0006JI-6P
	for alex.bennee@linaro.org; Wed, 28 Nov 2018 04:51:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41794)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gRwUf-0006Hg-Pc
	for qemu-devel@nongnu.org; Wed, 28 Nov 2018 04:50:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gRwUe-0000oI-H6
	for qemu-devel@nongnu.org; Wed, 28 Nov 2018 04:50:53 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47646)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gRwUX-0000f0-Px; Wed, 28 Nov 2018 04:50:46 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C48F830016F5;
	Wed, 28 Nov 2018 09:50:44 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3D9375C21C;
	Wed, 28 Nov 2018 09:50:40 +0000 (UTC)
Date: Wed, 28 Nov 2018 10:50:38 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181128105038.592f50a0@redhat.com>
In-Reply-To: <20181126162942.21258-9-sameo@linux.intel.com>
References: <20181126162942.21258-1-sameo@linux.intel.com>
	<20181126162942.21258-9-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Wed, 28 Nov 2018 09:50:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 8/8] hw: acpi: Remove AcpiRsdpDescriptor
 and fix tests
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
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9KvmEb6PNGwV

On Mon, 26 Nov 2018 17:29:41 +0100
Samuel Ortiz <sameo@linux.intel.com> wrote:

> We switched to the build_append_*() API for all RSDP callers, and this
> patch converts all existing tests depending on this structure.
> It is no longer needed and we can thus remove it.
I'd rephrase it as following:

The sole user of AcpiRsdpDescriptor structure is test,
drop test dependency on it and remove no longer used structure.


> 
> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> ---
>  include/hw/acpi/acpi-defs.h | 13 ----------
>  tests/acpi-utils.h          |  5 +++-
>  tests/acpi-utils.c          | 48 ++++++++++++++++++++++++++++++-------
>  tests/bios-tables-test.c    | 27 ++++++++++++++-------
>  tests/vmgenid-test.c        |  8 ++++---
>  5 files changed, 67 insertions(+), 34 deletions(-)
> 
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index 9b2f6b8043..abef1d57ae 100644
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
> index ac52abd0dd..fb1a67a21f 100644
> --- a/tests/acpi-utils.h
> +++ b/tests/acpi-utils.h
> @@ -82,6 +82,9 @@ typedef struct {
>  
>  uint8_t acpi_calc_checksum(const uint8_t *data, int len);
>  uint32_t acpi_find_rsdp_address(void);
> -void acpi_parse_rsdp_table(uint32_t addr, AcpiRsdpDescriptor *rsdp_table);
> +uint32_t acpi_find_rsdt_address(uint8_t *rsdp_table);
> +uint64_t acpi_find_xsdt_address(uint8_t *rsdp_table);
> +void acpi_parse_rsdp_table(uint32_t addr, uint8_t *rsdp_table,
> +                           uint8_t revision);
>  
>  #endif  /* TEST_ACPI_UTILS_H */
> diff --git a/tests/acpi-utils.c b/tests/acpi-utils.c
> index 41dc1ea9b4..c8fe2d1342 100644
> --- a/tests/acpi-utils.c
> +++ b/tests/acpi-utils.c
> @@ -52,14 +52,44 @@ uint32_t acpi_find_rsdp_address(void)
>      return off;
>  }
>  
> -void acpi_parse_rsdp_table(uint32_t addr, AcpiRsdpDescriptor *rsdp_table)
> +uint32_t acpi_find_rsdt_address(uint8_t *rsdp_table)
s/acpi_find_rsdt_address/acpi_get_rsdt_address/
likewise for xsdt

>  {
> -    ACPI_READ_FIELD(rsdp_table->signature, addr);
> -    ACPI_ASSERT_CMP64(rsdp_table->signature, "RSD PTR ");
> -
> -    ACPI_READ_FIELD(rsdp_table->checksum, addr);
> -    ACPI_READ_ARRAY(rsdp_table->oem_id, addr);
> -    ACPI_READ_FIELD(rsdp_table->revision, addr);
> -    ACPI_READ_FIELD(rsdp_table->rsdt_physical_address, addr);
> -    ACPI_READ_FIELD(rsdp_table->length, addr);
> +    uint32_t rsdt_physical_address = *((uint32_t *)(rsdp_table +
> +                                                    ACPI_RSDP_RSDT_OFFSET));
above cast looks pretty ugly and on some hw it might trigger SIGBUS
maybe:

       memcpy(addr, &rsdp_table[16 /* RsdtAddress offset */], 4);

> +    uint8_t revision = rsdp_table[ACPI_RSDP_REVISION_OFFSET];
> +
> +    if (revision != ACPI_RSDP_REV_1) {
theoretically not rev1 might have rsdt pointer as well for legacy OS
but we don't do this in QEMU, so it doesn't really matter

> +        return 0;
> +    }
> +
> +    return le32_to_cpu(rsdt_physical_address);
> +}
> +
> +uint64_t acpi_find_xsdt_address(uint8_t *rsdp_table)
> +{
> +    uint64_t xsdt_physical_address = *((uint64_t *)(rsdp_table +
> +                                                    ACPI_RSDP_XSDT_OFFSET));
access to uninitialized data if not rev2,
here it's not harmful but it's better not to confuse tools and fetch value after revision check

> +    uint8_t revision = rsdp_table[ACPI_RSDP_REVISION_OFFSET];
> +
> +    if (revision != ACPI_RSDP_REV_2) {
> +        return 0;
> +    }
> +
> +    return le64_to_cpu(xsdt_physical_address);
> +}
> +
> +void acpi_parse_rsdp_table(uint32_t addr, uint8_t *rsdp_table, uint8_t revision)
> +{
> +    switch (revision) {
> +    case ACPI_RSDP_REV_1:
> +        memread(addr, rsdp_table, ACPI_RSDP_REV_1_LEN);
> +        break;
> +    case ACPI_RSDP_REV_2:
> +        memread(addr, rsdp_table, ACPI_RSDP_REV_2_LEN);
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +
> +    ACPI_ASSERT_CMP64(*((uint64_t *)(rsdp_table)), ACPI_RSDP_SIGNATURE);
>  }
> diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
> index d661d9be62..8cde404bda 100644
> --- a/tests/bios-tables-test.c
> +++ b/tests/bios-tables-test.c
> @@ -27,7 +27,8 @@ typedef struct {
>      const char *machine;
>      const char *variant;
>      uint32_t rsdp_addr;
> -    AcpiRsdpDescriptor rsdp_table;
> +    uint8_t rsdp_table[ACPI_RSDP_REV_2_LEN];
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
> +    case ACPI_RSDP_REV_1:
> +        /* With rev 1, checksum is only for the first 20 bytes */
> +        g_assert(!acpi_calc_checksum(rsdp_table,  ACPI_RSDP_REV_1_LEN));
> +        break;
> +    case ACPI_RSDP_REV_2:
> +        /* With revision 2, we have 2 checksums */
> +        g_assert(!acpi_calc_checksum(rsdp_table, ACPI_RSDP_REV_1_LEN));
> +        g_assert(!acpi_calc_checksum(rsdp_table, ACPI_RSDP_REV_2_LEN));
> +    default:
> +        g_assert_not_reached();
> +    }
>  }
>  
>  static void test_acpi_rsdt_table(test_data *data)
>  {
>      AcpiRsdtDescriptorRev1 *rsdt_table = &data->rsdt_table;
> -    uint32_t addr = le32_to_cpu(data->rsdp_table.rsdt_physical_address);
> +    uint32_t addr = acpi_find_rsdt_address(data->rsdp_table);
>      uint32_t *tables;
>      int tables_nr;
>      uint8_t checksum;
> @@ -626,7 +637,7 @@ static void test_acpi_one(const char *params, test_data *data)
>  
>      data->tables = g_array_new(false, true, sizeof(AcpiSdtTable));
>      test_acpi_rsdp_address(data);
> -    test_acpi_rsdp_table(data);
> +    test_acpi_rsdp_table(data, ACPI_RSDP_REV_1);
>      test_acpi_rsdt_table(data);
>      fadt_fetch_facs_and_dsdt_ptrs(data);
>      test_acpi_facs_table(data);
> diff --git a/tests/vmgenid-test.c b/tests/vmgenid-test.c
> index 0a6fb55f2e..db5b084c18 100644
> --- a/tests/vmgenid-test.c
> +++ b/tests/vmgenid-test.c
> @@ -35,7 +35,7 @@ static uint32_t acpi_find_vgia(void)
>  {
>      uint32_t rsdp_offset;
>      uint32_t guid_offset = 0;
> -    AcpiRsdpDescriptor rsdp_table;
> +    uint8_t rsdp_table[ACPI_RSDP_REV_2_LEN];
>      uint32_t rsdt, rsdt_table_length;
>      AcpiRsdtDescriptorRev1 rsdt_table;
>      size_t tables_nr;
> @@ -52,9 +52,11 @@ static uint32_t acpi_find_vgia(void)
>  
>      g_assert_cmphex(rsdp_offset, <, RSDP_ADDR_INVALID);
>  
> -    acpi_parse_rsdp_table(rsdp_offset, &rsdp_table);
> +    acpi_parse_rsdp_table(rsdp_offset, rsdp_table, ACPI_RSDP_REV_1);
> +
> +    rsdt = acpi_find_rsdt_address(rsdp_table);
> +    g_assert(rsdt);
>  
> -    rsdt = le32_to_cpu(rsdp_table.rsdt_physical_address);
>      /* read the header */
>      ACPI_READ_TABLE_HEADER(&rsdt_table, rsdt);
>      ACPI_ASSERT_CMP(rsdt_table.signature, "RSDT");

