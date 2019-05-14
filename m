Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3879458wrg;
        Tue, 14 May 2019 04:22:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwfOyJqdmdNsOshzq1bydLbb3LAeex7PubqbFDOLI3paeFjv7gqCA0rdXCws5thLXgGu1w3
X-Received: by 2002:a17:902:8a4:: with SMTP id 33mr9798585pll.19.1557832933236;
        Tue, 14 May 2019 04:22:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557832933; cv=none;
        d=google.com; s=arc-20160816;
        b=IJxpBfWuFTr1mZPM/faVRGrUHvE603qO1s1SsVAR0R6nMqH/qigJLEshUWZeSWMML7
         4f6mbJ6PL+AjM8S5AplJXq7q5RERhXveEl/sYws4E00N7QmoAZ92ImHRtyis5+ZTzeO5
         gkyBY0VgKI4rjnTkeV06A95ozSlGtpUfpWBNxTThzSJdA9SnmpcaHBeukgmR0YQqvA0P
         HS9AKHbns+TTOgnOvUq3Qaem1NB7sMc/ZyaqYDw2R+0pJzkL2QRkSE53Gi93BJYwSKrR
         rrd+6bvA2GeXyNUmH/9d1c3zKRq50D03/MnzUDzt5i2Xo726i8eptzriGmpLxF17hZL/
         ws5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=qapzenOGreaDitxTOg43001wTBKi9+y3Bs2GK236WG0=;
        b=jg8KK4IhrzkSvqGXTUml2JdHB92UIvV6TPXJYeIyxx6Cp54cMQvsgb4KKAhJRYrGVd
         FI/RtfiQOFpvhJ9q3t7J3aH++270+ZKdmlYA9y74TVl0Mtv3cuNYErH1rNL+n/U768B5
         Z32YoE6l8vePJkKEa9g0BUvHCjRvwzVxPagfHBBYfQ6UeSAV2+f3u59POpVZpEbKQakg
         NDBwQg1Hu8aYRk8nqiuyyIuotvL9s+UV8oUATYTYE1mbOflichHXKVppJPFg1iz2L9tX
         xdxqtF7pU/6y2rfNhq4QmEFcy2CnaNOt1aTWpy6gOP6SfXKFy8ex3RpC4MNnjKKhs3G/
         Vltw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id 202si20024040pgh.575.2019.05.14.04.22.13;
        Tue, 14 May 2019 04:22:13 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726369AbfENLWC (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 5 others); Tue, 14 May 2019 07:22:02 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:44108 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726338AbfENLWC (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 14 May 2019 07:22:02 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 3F83D18CFD8C6B38241D;
        Tue, 14 May 2019 19:22:00 +0800 (CST)
Received: from ros.huawei.com (10.143.28.118) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.439.0; Tue, 14 May 2019 19:21:50 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <pbonzini@redhat.com>, <mst@redhat.com>, <imammedo@redhat.com>,
        <shannon.zhaosl@gmail.com>, <peter.maydell@linaro.org>,
        <lersek@redhat.com>, <james.morse@arm.com>,
        <gengdongjiu@huawei.com>, <mtosatti@redhat.com>, <rth@twiddle.net>,
        <ehabkost@redhat.com>, <zhengxiang9@huawei.com>,
        <jonathan.cameron@huawei.com>, <xuwei5@huawei.com>,
        <kvm@vger.kernel.org>, <qemu-devel@nongnu.org>,
        <qemu-arm@nongnu.org>, <linuxarm@huawei.com>
Subject: [PATCH v17 02/10] ACPI: add some GHES structures and macros definition
Date:   Tue, 14 May 2019 04:18:15 -0700
Message-ID: <1557832703-42620-3-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557832703-42620-1-git-send-email-gengdongjiu@huawei.com>
References: <1557832703-42620-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.118]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 6w7ZXepC8LZ/

Add Generic Error Status Block structures and some macros
definitions, which is referred to the ACPI 4.0 or ACPI 6.2. The
HEST table generation and CPER record will use them.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
 include/hw/acpi/acpi-defs.h | 52 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index f9aa4bd..d1996fb 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -224,6 +224,25 @@ typedef struct AcpiMultipleApicTable AcpiMultipleApicTable;
 #define ACPI_APIC_RESERVED              16   /* 16 and greater are reserved */
 
 /*
+ * Values for Hardware Error Notification Type field
+ */
+enum AcpiHestNotifyType {
+    ACPI_HEST_NOTIFY_POLLED = 0,
+    ACPI_HEST_NOTIFY_EXTERNAL = 1,
+    ACPI_HEST_NOTIFY_LOCAL = 2,
+    ACPI_HEST_NOTIFY_SCI = 3,
+    ACPI_HEST_NOTIFY_NMI = 4,
+    ACPI_HEST_NOTIFY_CMCI = 5,  /* ACPI 5.0: 18.3.2.7, Table 18-290 */
+    ACPI_HEST_NOTIFY_MCE = 6,   /* ACPI 5.0: 18.3.2.7, Table 18-290 */
+    ACPI_HEST_NOTIFY_GPIO = 7,  /* ACPI 6.0: 18.3.2.7, Table 18-332 */
+    ACPI_HEST_NOTIFY_SEA = 8,   /* ACPI 6.1: 18.3.2.9, Table 18-345 */
+    ACPI_HEST_NOTIFY_SEI = 9,   /* ACPI 6.1: 18.3.2.9, Table 18-345 */
+    ACPI_HEST_NOTIFY_GSIV = 10, /* ACPI 6.1: 18.3.2.9, Table 18-345 */
+    ACPI_HEST_NOTIFY_SDEI = 11, /* ACPI 6.2: 18.3.2.9, Table 18-383 */
+    ACPI_HEST_NOTIFY_RESERVED = 12 /* 12 and greater are reserved */
+};
+
+/*
  * MADT sub-structures (Follow MULTIPLE_APIC_DESCRIPTION_TABLE)
  */
 #define ACPI_SUB_HEADER_DEF   /* Common ACPI sub-structure header */\
@@ -400,6 +419,39 @@ struct AcpiSystemResourceAffinityTable {
 } QEMU_PACKED;
 typedef struct AcpiSystemResourceAffinityTable AcpiSystemResourceAffinityTable;
 
+/*
+ * Generic Error Status Block
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
+/*
+ * Masks for block_status flags above
+ */
+#define ACPI_GEBS_UNCORRECTABLE         1
+
+/*
+ * Values for error_severity field above
+ */
+enum AcpiGenericErrorSeverity {
+    ACPI_CPER_SEV_RECOVERABLE,
+    ACPI_CPER_SEV_FATAL,
+    ACPI_CPER_SEV_CORRECTED,
+    ACPI_CPER_SEV_NONE,
+};
+
+/*
+ * Generic Hardware Error Source version 2
+ */
+#define ACPI_HEST_SOURCE_GENERIC_ERROR_V2    10
+
 #define ACPI_SRAT_PROCESSOR_APIC     0
 #define ACPI_SRAT_MEMORY             1
 #define ACPI_SRAT_PROCESSOR_x2APIC   2
-- 
1.8.3.1
