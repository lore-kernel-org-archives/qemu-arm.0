Received: by 10.28.91.67 with SMTP id p64csp672276wmb;
        Wed, 28 Feb 2018 06:28:44 -0800 (PST)
X-Google-Smtp-Source: AH8x225duY048rad0dkkzrDykLsCGwqHtl9BTt5S/T90TLbmODKgxxhAGJ3ZvL96OdTnFRIFsBjM
X-Received: by 10.129.148.193 with SMTP id l184mr11732576ywg.452.1519828124501;
        Wed, 28 Feb 2018 06:28:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519828124; cv=none;
        d=google.com; s=arc-20160816;
        b=TKXnVIphlDXrGmTVwnowqIm62+gd5BQCM4AKPO57Op9kOItNkb90Zq7Ri2dtS9QrGx
         P/TUX0yTlARe+g5fxoO7/barmkIsrdngYWqGwtq52IJwtiZJQy3fVKi+HaGaDk8JyUqN
         o+3cPBvYiuVgcfoLaHJNu19MJvZ8CsePgZRDTRVp43uOxZLtkUjvo2knGcqpUJpcsuGN
         NX0poJ4TvhFEnOf+EHd0apqlDeMbxNk3zkJqhYkEwftsokBlHTcFr7IO6vhlqGuflZw/
         XWW1H0dJIdrafPdDgaSB54XiKU9a/ciKaTSvhyQHrbFBCyqAsk6hFyTR+wc43R348DWv
         JWUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=D0K8tG/V79tDJV7SPQiSRHUeYxm++RL3YXuKUqv9/cg=;
        b=PAm4xSyGXzREk7OZYAhUkEDb3lRu/m+knqhGDo+X3YzTNrvOg3wHp5yNFbKb+0BqQV
         aybL+bIqLA6mRMAQ704BQXrekJ5OSqD7aS1CqUUddLQyVm85vyQZzBb9amkIXcno/Ibp
         cMvCKuW+ENCYhGe0/zzQwlOxFwdEp5htB6IPhxNv5SeEAzKBaC0x/apSfGesNo4kdlwg
         eLyGowFTZT8V/5JfDQosfX1/hMkaqBLTkXNoE+AB0uuSb2fReEVQ3LNvVgoQcD5zNv6y
         vTxl/BmM7BPCCAbl44BZ76pEovIdWQKmcwZg9X57S7pF2w7IQnCpCbqGIdKJzEve/m7G
         eayA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k3si276643ywd.524.2018.02.28.06.28.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Feb 2018 06:28:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44628 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1er2ip-0007R8-Sy
	for alex.bennee@linaro.org; Wed, 28 Feb 2018 09:28:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33522)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1er2fj-0004jL-7C
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 09:25:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1er2fd-0001tS-Hf
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 09:25:31 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:37540 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1er2fd-0001tH-28; Wed, 28 Feb 2018 09:25:25 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A7F3640FB650;
	Wed, 28 Feb 2018 14:25:24 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CA1709C04E;
	Wed, 28 Feb 2018 14:25:23 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 28 Feb 2018 15:23:48 +0100
Message-Id: <1519827835-239519-4-git-send-email-imammedo@redhat.com>
In-Reply-To: <1519827835-239519-1-git-send-email-imammedo@redhat.com>
References: <1519827835-239519-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Wed, 28 Feb 2018 14:25:24 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Wed, 28 Feb 2018 14:25:24 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v2 03/10] acpi: reuse AcpiGenericAddress instead
 of Acpi20GenericAddress
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
Cc: Auger Eric <eric.auger@redhat.com>, Shannon Zhao <zhaoshenglong@huawei.com>,
	qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MYs4eDCFSmkq

Drop duplicate in form of Acpi20GenericAddress and reuse
AcpiGenericAddress.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 include/hw/acpi/acpi-defs.h | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index 80c8099..9942bc5 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -40,18 +40,6 @@ enum {
     ACPI_FADT_F_LOW_POWER_S0_IDLE_CAPABLE,
 };
 
-/*
- * ACPI 2.0 Generic Address Space definition.
- */
-struct Acpi20GenericAddress {
-    uint8_t  address_space_id;
-    uint8_t  register_bit_width;
-    uint8_t  register_bit_offset;
-    uint8_t  reserved;
-    uint64_t address;
-} QEMU_PACKED;
-typedef struct Acpi20GenericAddress Acpi20GenericAddress;
-
 struct AcpiRsdpDescriptor {        /* Root System Descriptor Pointer */
     uint64_t signature;              /* ACPI signature, contains "RSD PTR " */
     uint8_t  checksum;               /* To make sum of struct == 0 */
@@ -167,7 +155,8 @@ struct AcpiGenericAddress {
     uint8_t space_id;        /* Address space where struct or register exists */
     uint8_t bit_width;       /* Size in bits of given register */
     uint8_t bit_offset;      /* Bit offset within the register */
-    uint8_t access_width;    /* Minimum Access size (ACPI 3.0) */
+    uint8_t access_width;    /* ACPI 3.0: Minimum Access size (ACPI 3.0),
+                                ACPI 2.0: Reserved, Table 5-1 */
     uint64_t address;        /* 64-bit address of struct or register */
 } QEMU_PACKED;
 
@@ -456,7 +445,7 @@ typedef struct AcpiGenericTimerTable AcpiGenericTimerTable;
 struct Acpi20Hpet {
     ACPI_TABLE_HEADER_DEF                    /* ACPI common table header */
     uint32_t           timer_block_id;
-    Acpi20GenericAddress addr;
+    struct AcpiGenericAddress addr;
     uint8_t            hpet_number;
     uint16_t           min_tick;
     uint8_t            page_protect;
-- 
2.7.4

