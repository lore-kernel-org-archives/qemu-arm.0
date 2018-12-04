Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp8107630wrt;
        Tue, 4 Dec 2018 06:07:06 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VsY4Y2abapOLICkOxqAmJxqvdKKrvjBkhNGJ519Kw7J08pc60qVTJBKG/8YM4Ls7wyoqGZ
X-Received: by 2002:aed:31c5:: with SMTP id 63mr19552000qth.385.1543932426782;
        Tue, 04 Dec 2018 06:07:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543932426; cv=none;
        d=google.com; s=arc-20160816;
        b=A37j2WlUc/Jxqf4a7N8wHzsn7x1umlujNb2eXzGeLS2szsGme8pjFWb/z2RbHbOBQb
         lsIlrsWTepo9HYxSgRQvvtR788CQ7Wqf9C5HM45fyFoagdDDSklhCaklm/ORUYyjRdWS
         4oWw4NUrl/GxLq2eHyCpi/bc8BddWHLmVZymdlajW9xoZD/1J1G+y41fbYyrx3Lo7mBS
         PxaxFTmKicDzlLHWy6M5xdQKJ1sg4z0xMwjEiUZGImuCQfJn25fub/TEtqnjEx9sWaAy
         RZHL0ToFLEDrDv8DR/D65AOBRr7lnYyiYrDCXEqpIY17lL/fRhVSMz2YELYl7IXPTUdu
         vC7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=6Y6TAZN9AidRd3hwejsdteEkxAe3DXzogOiy1kWvBqU=;
        b=iVQzaCn0i4lcHOKJWnAyTKGSM37G2wdWICKB3ZTHJIgtxiC8j/fXM2NMb8Z4yMUnQS
         IhqmwNazXpsVh/xClzHcj7qqKVKPaNSPutkqqhRHraZq/IEW+LE/M+F/QVjwcEqddJPY
         Dq89SzEcMxja6dOcu1K94cALbKXCxDmYsez/gX8scXQl0Pvth6tkbXLBNGvEIR8vawwp
         Ma78/XTkBKJpBn2323zy+ghuvXRVyVcDIviQR3EgCvS91lCfQ6H63kdnThPu8kgAymyT
         DZwO35tq3yWUk3fAMfsMbk0en9P1lLy3UE/nyVglW3N3A93ZoMdiFJo1w7tKRYpV+1E/
         GcCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f70si6186621qke.10.2018.12.04.06.07.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Dec 2018 06:07:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57008 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUBLu-0004Cs-AC
	for alex.bennee@linaro.org; Tue, 04 Dec 2018 09:07:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42869)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gUBLj-0004Bx-JX
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 09:06:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gUBLe-0006aD-Jn
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 09:06:55 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42652)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gUBLe-0006Yg-B5; Tue, 04 Dec 2018 09:06:50 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 89FCE58E42;
	Tue,  4 Dec 2018 14:06:48 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E04475C23E;
	Tue,  4 Dec 2018 14:06:43 +0000 (UTC)
Date: Tue, 4 Dec 2018 15:06:42 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181204150642.7a569e40@redhat.com>
In-Reply-To: <20181130130032.11835-9-sameo@linux.intel.com>
References: <20181130130032.11835-1-sameo@linux.intel.com>
	<20181130130032.11835-9-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 04 Dec 2018 14:06:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v3 8/8] hw: acpi: Remove AcpiRsdpDescriptor
 and fix tests
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
X-TUID: hBn3/LIspvdV

On Fri, 30 Nov 2018 14:00:32 +0100
Samuel Ortiz <sameo@linux.intel.com> wrote:

> The only remaining AcpiRsdpDescriptor users are the ACPI utils for the
> BIOS table tests.
> We remove that dependency and can thus remove the structure itself.
> 
> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  include/hw/acpi/acpi-defs.h | 13 -----------
>  tests/acpi-utils.h          |  4 +++-
>  tests/acpi-utils.c          | 46 ++++++++++++++++++++++++++++++-------
>  tests/bios-tables-test.c    | 21 +++++++++++++----
>  tests/vmgenid-test.c        |  8 ++++---
>  5 files changed, 62 insertions(+), 30 deletions(-)
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
> index ac52abd0dd..4f4899deb5 100644
> --- a/tests/acpi-utils.h
> +++ b/tests/acpi-utils.h
> @@ -82,6 +82,8 @@ typedef struct {
>  
>  uint8_t acpi_calc_checksum(const uint8_t *data, int len);
>  uint32_t acpi_find_rsdp_address(void);
> -void acpi_parse_rsdp_table(uint32_t addr, AcpiRsdpDescriptor *rsdp_table);
> +uint32_t acpi_get_rsdt_address(uint8_t *rsdp_table);
> +uint64_t acpi_get_xsdt_address(uint8_t *rsdp_table);
> +void acpi_parse_rsdp_table(uint32_t addr, uint8_t *rsdp_table);
>  
>  #endif  /* TEST_ACPI_UTILS_H */
> diff --git a/tests/acpi-utils.c b/tests/acpi-utils.c
> index 41dc1ea9b4..d07f7487e2 100644
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
>  
> -    ACPI_READ_FIELD(rsdp_table->checksum, addr);
> -    ACPI_READ_ARRAY(rsdp_table->oem_id, addr);
> -    ACPI_READ_FIELD(rsdp_table->revision, addr);
> -    ACPI_READ_FIELD(rsdp_table->rsdt_physical_address, addr);
> -    ACPI_READ_FIELD(rsdp_table->length, addr);
> +    memcpy(&rsdt_physical_address, &rsdp_table[16 /* RsdtAddress offset */], 4);
> +    return le32_to_cpu(rsdt_physical_address);
> +}
> +
> +uint64_t acpi_get_xsdt_address(uint8_t *rsdp_table)
> +{
> +    uint64_t xsdt_physical_address;
> +    uint8_t revision = rsdp_table[15 /* Revision offset */];
> +
> +    /* We must have revision 2 if we're looking for an XSDT pointer */
> +    g_assert(revision == 2);
> +
> +    memcpy(&xsdt_physical_address, &rsdp_table[24 /* XsdtAddress offset */], 8);
> +    return le64_to_cpu(xsdt_physical_address);
> +}
> +
> +void acpi_parse_rsdp_table(uint32_t addr, uint8_t *rsdp_table)
> +{
> +    uint8_t revision;
> +
> +    /* Read mandatory revision 0 table data (20 bytes) first */
> +    memread(addr, rsdp_table, 20);
> +    revision = rsdp_table[15 /* Revision offset */];
> +
> +    switch (revision) {
> +    case 0: /* ACPI 1.0 RSDP */
> +        break;
> +    case 2: /* ACPI 2.0+ RSDP */
> +        /* Read the rest of the RSDP table */
> +        memread(addr + 20, rsdp_table + 20, 16);
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +
> +    ACPI_ASSERT_CMP64(*((uint64_t *)(rsdp_table)), "RSD PTR ");
>  }
> diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
> index d661d9be62..8749b77b36 100644
> --- a/tests/bios-tables-test.c
> +++ b/tests/bios-tables-test.c
> @@ -27,7 +27,7 @@ typedef struct {
>      const char *machine;
>      const char *variant;
>      uint32_t rsdp_addr;
> -    AcpiRsdpDescriptor rsdp_table;
> +    uint8_t rsdp_table[36 /* ACPI 2.0+ RSDP size */];
>      AcpiRsdtDescriptorRev1 rsdt_table;
>      uint32_t dsdt_addr;
>      uint32_t facs_addr;
> @@ -85,19 +85,30 @@ static void test_acpi_rsdp_address(test_data *data)
>  
>  static void test_acpi_rsdp_table(test_data *data)
>  {
> -    AcpiRsdpDescriptor *rsdp_table = &data->rsdp_table;
> +    uint8_t *rsdp_table = data->rsdp_table, revision;
>      uint32_t addr = data->rsdp_addr;
>  
>      acpi_parse_rsdp_table(addr, rsdp_table);
> +    revision = rsdp_table[15 /* Revision offset */];
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
> diff --git a/tests/vmgenid-test.c b/tests/vmgenid-test.c
> index 0a6fb55f2e..97219ae86c 100644
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
> +    acpi_parse_rsdp_table(rsdp_offset, rsdp_table);
> +
> +    rsdt = acpi_get_rsdt_address(rsdp_table);
> +    g_assert(rsdt);
>  
> -    rsdt = le32_to_cpu(rsdp_table.rsdt_physical_address);
>      /* read the header */
>      ACPI_READ_TABLE_HEADER(&rsdt_table, rsdt);
>      ACPI_ASSERT_CMP(rsdt_table.signature, "RSDT");

