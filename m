Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp3199299wrw;
        Thu, 8 Nov 2018 02:18:48 -0800 (PST)
X-Google-Smtp-Source: AJdET5cso6c2SCut9Odij2EKTV5X4D4QQHD0CSWheZh4kPlzn6mhTgGGxdx44evbddOGGOZU9k9q
X-Received: by 2002:a17:902:a508:: with SMTP id s8-v6mr3957616plq.135.1541672328481;
        Thu, 08 Nov 2018 02:18:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541672328; cv=none;
        d=google.com; s=arc-20160816;
        b=ROVIsqLzBvk67Hyn31ebI8uCtzLGAmxxFJIxbXEN+y/iFba2rGpj4VA2qFTbAfu1ab
         C82xKQKcXD6x1aGTzVfabyPqqej2kDT3NG8ZSdvfVMbKYuU3bZFJ/cwvssKrabD5D+CQ
         dL4FNmEn+7gyxVC/CcxsyyWm5TdS8bb2sBy6/61AgyS9tSatr35z9oUdzx0IE0PdDpXp
         dEHQfM4fzEsHJXpkglqiUTcfpyXN9T8dQU6RnSkC6lRZ+kLsLCmsVX0Nx4kyCZx1b3WT
         JROlY97NgxFCjkXkERsQ/qh8RYritdyAV4qQaKWdGWXjcwGr60LEjCLJ7zmL8lbyBWDV
         ZePw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=dVMysMDjzAjot11UmdS0C8RqsGyCYhHIuikZLDNXiuk=;
        b=DWNVaMiA5xxTUn8aKK/F8F21I6Ullr9edQYJTvzrp770XL67hzb3ZRe0y/+jbWCSE6
         DzwDnQgABaUutbTRREkgeR4MtuEA24t53I4POjo69WEDo5bzkp4c9iKvFdRIxTk13DUZ
         lZXxM/FVEsDeS4GaFBGA95seXAq2uVUh4MELRaVdpEaPJ+sqgHg/GIA+0RLDOVqCn3ne
         jtoRCepB4VmwsZ5IeZJq1p2lCARHDPA+5nFz79FDUdSa/bg1aYnxwj7tiifidYhNOC7x
         zucpmbBxsecMp5W1KJxNe7LxgCXYr2mXmucGM8Kjiud6xxwgv0uNYz/AelJ4yqgEASDE
         An8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id v26-v6si3400052pge.101.2018.11.08.02.18.48;
        Thu, 08 Nov 2018 02:18:48 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726915AbeKHTx1 (ORCPT <rfc822;francois.ozog@linaro.org>
        + 4 others); Thu, 8 Nov 2018 14:53:27 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:14617 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726274AbeKHTx1 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 8 Nov 2018 14:53:27 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 418216E916F3D;
        Thu,  8 Nov 2018 18:18:39 +0800 (CST)
Received: from ros.huawei.com (10.143.28.118) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.408.0; Thu, 8 Nov 2018 18:18:32 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <imammedo@redhat.com>, <mst@redhat.com>,
        <peter.maydell@linaro.org>, <pbonzini@redhat.com>,
        <mtosatti@redhat.com>, <rth@twiddle.net>, <ehabkost@redhat.com>,
        <kvm@vger.kernel.org>, <shannon.zhaosl@gmail.com>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
        <gengdongjiu@huawei.com>
Subject: [PATCH v15 01/10] ACPI: add some GHES structures and macros definition
Date:   Thu, 8 Nov 2018 02:15:44 -0800
Message-ID: <1541672153-15529-2-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1541672153-15529-1-git-send-email-gengdongjiu@huawei.com>
References: <1541672153-15529-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.118]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: LXWcuLzSGuBl

Add Generic Error Status Block structures and some macros
definitions, which is referred to the ACPI 4.0 or ACPI 6.2. The
HEST table generation and CPER record will use them.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>

Change since v14:
Thanks Igor's review and comments
1. Update spec comment for AcpiHestNotifyType
2. drop () for the macro definition

Change since v13:
1. Clean the new added structures and macros definition

Change since v12:
1. Address Igor's comments to to get rid of most structures and use
build_append_int_noprefix() API to compose whole error status block
and APEI table in [1]

[1]: https://lkml.org/lkml/2017/8/29/187
---
 include/hw/acpi/acpi-defs.h | 52 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index af8e023..f85cf98 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -226,6 +226,25 @@ typedef struct AcpiMultipleApicTable AcpiMultipleApicTable;
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
@@ -402,6 +421,39 @@ struct AcpiSystemResourceAffinityTable {
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
