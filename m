Received: by 10.28.91.67 with SMTP id p64csp669553wmb;
        Wed, 28 Feb 2018 06:25:53 -0800 (PST)
X-Google-Smtp-Source: AG47ELtGYJjnmbnBpguIBCCrOnfSxxdNYrU0VUp0fXLFvgSOo8f4ys9sz60A1OXOvZzvCEMWTqHV
X-Received: by 2002:a25:3054:: with SMTP id w81-v6mr11733213ybw.320.1519827953649;
        Wed, 28 Feb 2018 06:25:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519827953; cv=none;
        d=google.com; s=arc-20160816;
        b=EEQi7S4fq2aQE5aWxglpFT7kvRLbB+gq+luAb3r8RmDfExVH0AbiZgQaD3GDutIXVh
         UyPSH9HBh8VCZ32wL/NmLqhS8mLMGXeEIVIEToizKtL8OyWBKmZKDmx+2TgxBCfMXKgP
         AKbnvJ5X5Au82WFEke5G8Oa8G3E/VeFo5Kv/KHQUnv+ss6cczEKh0qOi/NkfRE6CqSda
         GBQ65qn33PbxSyhl9hyNA9pdAZJnc9OXjlvMvX08f2PyTRZeXBBD0vq2UzWZdeMX08+t
         48QN6ORsqsG+wwS3L+fyRn6/XN1/coXOIGS2KnsgrxH8kAGGByOQVXPwkG78WyifVZH5
         +eog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=YVJ8g+JanIXimSdTDMLLHUok+tDpX9RGM2NweGRL0CU=;
        b=tDLJisAa/YhIY+Cgda+HSkTeN5HaKT2lUOeLeL7udGcUhr5/CwJt3fpRbK8pLd63dV
         7fYFhm1gxN9/bV9GjZYSrMzMEdLz9+an5GGB9h3IVUisziTEKjsNARuZqwmVlq0+CTY+
         J7+NTzhm9q7X5TEfsiYdvYY/0UzYd3VRzbCmilaNNY+m13FQq16DwGwS6QF+Eu1cvO+O
         rrLUqdlQklMYbmMPslqIUqS6/5y7dH6WBZ9wI6ESz8XxCPQ2dGwvqToWtUyzKhQ45fTb
         WDGag1SQy2/mDhJwjcJFEqQNaQjXTKlMDdQZZYN7bZxQWLrrp8k0e23GME6vnOF10t6N
         Zeww==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w130-v6si283881ybw.74.2018.02.28.06.25.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Feb 2018 06:25:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44602 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1er2g5-0004uV-0l
	for alex.bennee@linaro.org; Wed, 28 Feb 2018 09:25:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33462)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1er2ff-0004fl-OF
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 09:25:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1er2fe-0001tt-AH
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 09:25:27 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:35398 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1er2fe-0001tk-4E; Wed, 28 Feb 2018 09:25:26 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BAB57400ADC3;
	Wed, 28 Feb 2018 14:25:25 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DC8BA9C04A;
	Wed, 28 Feb 2018 14:25:24 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 28 Feb 2018 15:23:49 +0100
Message-Id: <1519827835-239519-5-git-send-email-imammedo@redhat.com>
In-Reply-To: <1519827835-239519-1-git-send-email-imammedo@redhat.com>
References: <1519827835-239519-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Wed, 28 Feb 2018 14:25:25 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Wed, 28 Feb 2018 14:25:25 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v2 04/10] acpi: add build_append_gas() helper for
 Generic Address Structure
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
X-TUID: YEwWGhvuuGDX

it will help to add Generic Address Structure to ACPI tables
without using packed C structures and avoid endianness
issues as API doesn't need an explicit conversion.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 include/hw/acpi/aml-build.h | 20 ++++++++++++++++++++
 hw/acpi/aml-build.c         | 16 ++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index 88d0738..8692ccc 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -78,6 +78,15 @@ typedef enum {
 } AmlUpdateRule;
 
 typedef enum {
+    AML_AS_SYSTEM_MEMORY = 0X00,
+    AML_AS_SYSTEM_IO = 0X01,
+    AML_AS_PCI_CONFIG = 0X02,
+    AML_AS_EMBEDDED_CTRL = 0X03,
+    AML_AS_SMBUS = 0X04,
+    AML_AS_FFH = 0X7F,
+} AmlAddressSpace;
+
+typedef enum {
     AML_SYSTEM_MEMORY = 0X00,
     AML_SYSTEM_IO = 0X01,
     AML_PCI_CONFIG = 0X02,
@@ -389,6 +398,17 @@ int
 build_append_named_dword(GArray *array, const char *name_format, ...)
 GCC_FMT_ATTR(2, 3);
 
+void build_append_gas(GArray *table, AmlAddressSpace as,
+                      uint8_t bit_width, uint8_t bit_offset,
+                      uint8_t access_width, uint64_t address);
+
+static inline void
+build_append_gas_from_struct(GArray *table, const struct AcpiGenericAddress *s)
+{
+    build_append_gas(table, s->space_id, s->bit_width, s->bit_offset,
+                     s->access_width, s->address);
+}
+
 void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
                        uint64_t len, int node, MemoryAffinityFlags flags);
 
diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 36a6cc4..3fef5f6 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -258,6 +258,22 @@ static void build_append_int(GArray *table, uint64_t value)
     }
 }
 
+/* Generic Address Structure (GAS)
+ * ACPI 2.0/3.0: 5.2.3.1 Generic Address Structure
+ * 2.0 compat note:
+ *    @access_width must be 0, see ACPI 2.0:Table 5-1
+ */
+void build_append_gas(GArray *table, AmlAddressSpace as,
+                      uint8_t bit_width, uint8_t bit_offset,
+                      uint8_t access_width, uint64_t address)
+{
+    build_append_int_noprefix(table, as, 1);
+    build_append_int_noprefix(table, bit_width, 1);
+    build_append_int_noprefix(table, bit_offset, 1);
+    build_append_int_noprefix(table, access_width, 1);
+    build_append_int_noprefix(table, address, 8);
+}
+
 /*
  * Build NAME(XXXX, 0x00000000) where 0x00000000 is encoded as a dword,
  * and return the offset to 0x00000000 for runtime patching.
-- 
2.7.4

