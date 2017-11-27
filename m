Received: by 10.223.159.82 with SMTP id f18csp1393154wrg;
        Mon, 27 Nov 2017 02:44:38 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZqlURK2AXH9fzzk+QOeC/j4QX3dRtbyrOP9llefD6GCCe87wvU89OlOSJ0G8Fr6mU0m5A6
X-Received: by 10.159.244.20 with SMTP id x20mr38418912plr.433.1511779478381;
        Mon, 27 Nov 2017 02:44:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511779478; cv=none;
        d=google.com; s=arc-20160816;
        b=r2wSMpQUg7fHk/dPTHpYL5zt2DupgpjRqC66y+XP+cI9HhSQtdhpy5B1boW1/b91Pu
         QNEZ2FW42F05kKnGs82qIH9htgRJYz8CZVIJr1PJRUvnNOwB6pRWcJjRM2vEp/yIMXDu
         9be4tIMEeP30ePQjBNqYKRc+lvKzTbdpBdX4UylStyyGTuC3X/AYHob5my1pk+49Tc/u
         yHAE6h+2F1RaRAKH8yjrGdLafipUI9Gv7Exv9DIQOejm1Swu119JeU9p8gbTyaqYF2Vx
         x8yDrhrNUurbg6FJSzs4Xf3mWbVevaTvRrQ1acK6igfLcfeVuST1uLZn2otY6PdcsO0r
         NUoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:arc-authentication-results;
        bh=Bi7VFDnCCJ6sCrXtF9HYOfSFjwQViCjDkFgtGsVSll0=;
        b=aRpn8HWREbECCUy5on8hCzU9ygbXc4kuXJ4cF0vEErsPKK+Dh48ow6/7SEPTVYdp0s
         iixzieqlGRokavXgtZQ3SBBHxf/iFGgaoQG+flGuje8TvqonZUlwLB+BQdjRM3K9xWiO
         jUtedgZvg2cyqSvyhXHEVrfwN+UxnYCULMNVLdE7PM7+I+C1NcPoRHvlNv2tlnD8UUzT
         qn0SPMu7kuy+8wyDSJ+BA5fpDY3KzJyk44BqN9M5pwlNxHt4aj6jykBE4CLQr851qiPV
         1iDsnH3/aoy1TeJgAR3R8Xvni+6t2B7nP8wEgjO3RP2atbi7tg4cI5KOwiNKfNjus6Kz
         BYhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id t11si23462099plq.683.2017.11.27.02.44.38;
        Mon, 27 Nov 2017 02:44:38 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751667AbdK0Kof (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Mon, 27 Nov 2017 05:44:35 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:11031 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751664AbdK0Koe (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 27 Nov 2017 05:44:34 -0500
Received: from 172.30.72.58 (EHLO DGGEMS411-HUB.china.huawei.com) ([172.30.72.58])
        by dggrg05-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
        with ESMTP id DLQ10007;
        Mon, 27 Nov 2017 18:44:24 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.361.1; Mon, 27 Nov 2017 18:44:15 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <pbonzini@redhat.com>, <mst@redhat.com>, <imammedo@redhat.com>,
        <zhaoshenglong@huawei.com>, <peter.maydell@linaro.org>,
        <mtosatti@redhat.com>, <james.morse@arm.com>, <lersek@redhat.com>,
        <marc.zyngier@arm.com>, <christoffer.dall@linaro.org>,
        <rth@twiddle.net>, <ehabkost@redhat.com>, <kvm@vger.kernel.org>,
        <guohanjun@huawei.com>, <lijinyue@huawei.com>,
        <huangshaoyu@huawei.com>, <wuquanming@huawei.com>,
        <zhengqiang10@huawei.com>, <linuxarm@huawei.com>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH v13 01/12] ACPI: add related GHES structures and macros definition
Date:   Tue, 28 Nov 2017 02:49:44 +0800
Message-ID: <1511808595-24158-2-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1511808595-24158-1-git-send-email-gengdongjiu@huawei.com>
References: <1511808595-24158-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
        refid=str=0001.0A090204.5A1BEC8A.0045,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0,
        ip=0.0.0.0,
        so=2014-11-16 11:51:01,
        dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: a8b2c43e75221f81b914db24f229d707
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: g0mcAM8T5UkJ

Add Generic Error Status Block structures and some macros
definition, which refer to the ACPI 4.0 and ACPI 6.1. The
HEST table generation and CPER record will use them.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
Address Igor's comments to to get rid of most structures and use
build_append_int_noprefix() API to compose whole error status block
and APEI table in [1]

[1]: https://lkml.org/lkml/2017/8/29/187
---
 include/hw/acpi/acpi-defs.h | 49 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index 72be675..f955f1b 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -298,6 +298,25 @@ typedef struct AcpiMultipleApicTable AcpiMultipleApicTable;
 #define ACPI_APIC_RESERVED              16   /* 16 and greater are reserved */
 
 /*
+ * ACPI 4.0 spec, "17.3.2.7 Hardware Error Notification"
+ */
+enum AcpiHestNotifyType {
+    ACPI_HEST_NOTIFY_POLLED = 0,
+    ACPI_HEST_NOTIFY_EXTERNAL = 1,
+    ACPI_HEST_NOTIFY_LOCAL = 2,
+    ACPI_HEST_NOTIFY_SCI = 3,
+    ACPI_HEST_NOTIFY_NMI = 4,
+    ACPI_HEST_NOTIFY_CMCI = 5,  /* ACPI 5.0 */
+    ACPI_HEST_NOTIFY_MCE = 6,   /* ACPI 5.0 */
+    ACPI_HEST_NOTIFY_GPIO = 7,  /* ACPI 6.0 */
+    ACPI_HEST_NOTIFY_SEA = 8,   /* ACPI 6.1 */
+    ACPI_HEST_NOTIFY_SEI = 9,   /* ACPI 6.1 */
+    ACPI_HEST_NOTIFY_GSIV = 10, /* ACPI 6.1 */
+    ACPI_HEST_NOTIFY_SDEI = 11, /* ACPI 6.2 */
+    ACPI_HEST_NOTIFY_RESERVED = 12 /* 12 and greater are reserved */
+};
+
+/*
  * MADT sub-structures (Follow MULTIPLE_APIC_DESCRIPTION_TABLE)
  */
 #define ACPI_SUB_HEADER_DEF   /* Common ACPI sub-structure header */\
@@ -474,6 +493,36 @@ struct AcpiSystemResourceAffinityTable {
 } QEMU_PACKED;
 typedef struct AcpiSystemResourceAffinityTable AcpiSystemResourceAffinityTable;
 
+/*
+ * ACPI 4.0, "17.3.2.6.1 Generic Error Data"
+ */
+#define ACPI_GEBS_UNCORRECTABLE          (1)
+/*
+ * ACPI 6.1, "18.3.2.8 Generic Hardware Error
+ * Source version 2"
+ */
+#define ACPI_HEST_SOURCE_GENERIC_ERROR_V2    (10)
+/*
+ * Table 17-12 Generic Error Status Block, ACPI 4.0,
+ * "17.3.2.6.1 Generic Error Data"
+ */
+struct AcpiGenericErrorStatus {
+    /* It is a bitmask composed of ACPI_GEBS_xxx macros */
+    uint32_t block_status;
+    uint32_t raw_data_offset;
+    uint32_t raw_data_length;
+    uint32_t data_length;
+    uint32_t error_severity;
+} QEMU_PACKED;
+typedef struct AcpiGenericErrorStatus AcpiGenericErrorStatus;
+
+enum AcpiGenericErrorSeverity {
+    ACPI_CPER_SEV_RECOVERABLE,
+    ACPI_CPER_SEV_FATAL,
+    ACPI_CPER_SEV_CORRECTED,
+    ACPI_CPER_SEV_NONE,
+};
+
 #define ACPI_SRAT_PROCESSOR_APIC     0
 #define ACPI_SRAT_MEMORY             1
 #define ACPI_SRAT_PROCESSOR_x2APIC   2
-- 
1.8.3.1
