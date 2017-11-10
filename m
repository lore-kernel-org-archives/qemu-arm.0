Received: by 10.223.150.237 with SMTP id u100csp3629213wrb;
        Fri, 10 Nov 2017 03:14:45 -0800 (PST)
X-Google-Smtp-Source: ABhQp+Q2AeADd7WfZgjbk+GEVsTbU1liL2EqdVVRJQ9OcsbYNLil6kzPenWvlFNt2hExcizD7yZD
X-Received: by 10.159.230.19 with SMTP id u19mr3915242plq.84.1510312485095;
        Fri, 10 Nov 2017 03:14:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510312485; cv=none;
        d=google.com; s=arc-20160816;
        b=jciIe4kg531PmXwsz7Nb+6ZCNnNDCHAEvodtQszSNu+ciJPSjQpSiLfIskeLsj+qku
         XkZvSl68x1u9xX/ortj+/9w4XCo+26LD+7awDTkiryiZR1YLqXQdy8KlgDH50Gdj8cmu
         Utz27ipMGKeOAQ9pAdqRUkLT/zI0cvRGwWv7jF57ap8awlz563RfSMJevnY6Y2OoUD3l
         J+kN+pCAl18idCtSxA6WM1VRnCCoVrGqppBZi9fczUIJ6SQvTiV4TF3ivyoNtWt3Dw4Z
         YgtqX6KSKeeTygfUp5q41dVnUtksDfPCNYm1IU6mQbrCYlB3nl7J8bFoFX1LxXVeJz/A
         7DhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:arc-authentication-results;
        bh=jWYsK/pVpbMwZA8Esz+/W3V7vVXzWsitAB27PEhEtv4=;
        b=RE3FG9UxuZI0h/TqCNUgnGxA9L1jzBUMl1eLv1MCFLDmfXWMQeO0ohgNWW/zHzzIrU
         v1mJisx+whMwHOYSVBecOhasac/8Z0mEbD3vFWyxyAt7j0hY4Hu/R2RcftWp9EJiwO9q
         W+LPBvdpjcBgO36CYnBY0uq32pxf5RkjkFYj4Sm13sIAKWXLiNS10n4118iq0UwuKr6I
         7cQv7tFD/HkUu9X7jgxcbAiTLVuW9mDRJtPsBJtBcYn4/dnaOIGBmNt/ww1KjaOEvMRd
         v2MbMiIyiZZwBOAxxv9W7FzdgzJu2uGTg87n4pdDphILmMvOVFdDGUAf6/oeJUZ3SDMZ
         XuPA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id s15si8697707plp.268.2017.11.10.03.14.44;
        Fri, 10 Nov 2017 03:14:45 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753021AbdKJLOe (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Fri, 10 Nov 2017 06:14:34 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:10441 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752948AbdKJLOb (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 10 Nov 2017 06:14:31 -0500
Received: from 172.30.72.58 (EHLO DGGEMS403-HUB.china.huawei.com) ([172.30.72.58])
        by dggrg04-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
        with ESMTP id DKO46195;
        Fri, 10 Nov 2017 19:14:11 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.361.1; Fri, 10 Nov 2017 19:13:59 +0800
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
Subject: [PATCH v12 01/12] ACPI: add related GHES structures and macros definition
Date:   Sat, 11 Nov 2017 03:19:40 +0800
Message-ID: <1510341591-22817-2-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1510341591-22817-1-git-send-email-gengdongjiu@huawei.com>
References: <1510341591-22817-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
        refid=str=0001.0A090203.5A058A05.00AA,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0,
        ip=0.0.0.0,
        so=2014-11-16 11:51:01,
        dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 390e22677b5509e9b8ab007518927248
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: iqu8Q2gYlQ3/

Add Generic Error Status Block structures and some macros
definition, which refer to the ACPI 4.0 and ACPI 6.1. The
HEST table generation and CPER record will use them.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---

It has been suggested to get rid of most structures that introduced in patch, the
second patch mainly use build_append_int_noprefix() API to compose whole error status
block and APEI table

https://lkml.org/lkml/2017/8/29/187

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
