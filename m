Received: by 10.28.71.27 with SMTP id u27csp1913267wma;
        Thu, 22 Feb 2018 04:44:55 -0800 (PST)
X-Google-Smtp-Source: AH8x227ba3Pd7gJS8/eiJP+Zh0G1u26e4qKr94puAQZ5OANOIA0VIJRNQqysG2++MRxiS4JCgok6
X-Received: by 10.129.208.12 with SMTP id v12mr4570616ywi.304.1519303495692;
        Thu, 22 Feb 2018 04:44:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519303495; cv=none;
        d=google.com; s=arc-20160816;
        b=dOdTzMYD4xmv/lIUPsZWgkneNgRoJm4lFv93VELReukjl7XUqbiai+OqtURQUdHxpP
         Kwf/BQB0kDoBHM2AvuqTohx3pjgoZy3DOz0ZwjSUmj4wOh2awwi71d6p/1H0qACMecl0
         cd5DYEAC+imvJZn4RCc7erCOjf+qpW0MMoR+8cnxySskkVO8fkSxNkmoCbib2Hj27PHl
         LGH4DJfNiDyM8oeRAQsTbzfJf5ljytNFOVkjvrTQkYenPzNrBfe52DOOZqvW17kIehSn
         KbjWDq3Rj0DNx80P/iqvH2iw9xGBD5yYZkjYsFKUL0UxcYOQDPJtB8Qw+/mJprcfg3yr
         f5og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=GW+dD4domzVFC1EjUo85vhj2hKwo4KvPM0ebfArc0YE=;
        b=QWHFImATlb57yO41c5nwYej+wCznKtpfhF1lJZUN6TYd0yoRmDvVbbx7yI3rkh6w65
         PMcFOdiDzCRfI2e34IyEpMsFtEEyS3r+cIts5yq+WiUs/CZR/najEee8wPR/rhz7CbUp
         d/i0+phblMyUmce+AXncwhqhrE5AMBnxxMHMHPk98LEisUFK7Xzk/rRdeAmsw+uDgd7J
         Ehn45ou6x/xmuwCyGGlb3WBo5BCxpuSF23XfcE2Hc70Guj5uQDHP+bYpXogaAULjR5iP
         fk882+1n6cVfI1wQ3wpMl5A8NlmxyCgNTzoEgmV5BajQOUItCe1XM8o2aRne9uuhNy9k
         uptg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id h3-v6si3562ybo.128.2018.02.22.04.44.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Feb 2018 04:44:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37771 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eoqF5-0005mM-3N
	for alex.bennee@linaro.org; Thu, 22 Feb 2018 07:44:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53856)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1eoqEe-0005WM-3w
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 07:44:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1eoqEd-00050u-2E
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 07:44:28 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:48436 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1eoqEc-0004z1-TK; Thu, 22 Feb 2018 07:44:26 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 73B9B80401C1;
	Thu, 22 Feb 2018 12:44:26 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7CB8E2026E0E;
	Thu, 22 Feb 2018 12:44:25 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 22 Feb 2018 13:42:51 +0100
Message-Id: <1519303376-92875-5-git-send-email-imammedo@redhat.com>
In-Reply-To: <1519303376-92875-1-git-send-email-imammedo@redhat.com>
References: <1519303376-92875-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Thu, 22 Feb 2018 12:44:26 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Thu, 22 Feb 2018 12:44:26 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH 4/9] acpi: add build_append_gas() helper for
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>, qemu-arm@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 57lnZ8DBRm9B

it will help to add Generic Address Structure to ACPI tables
without using packed C structures and avoid endianness
issues as API doesn't need an explicit conversion.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
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

