Received: by 10.223.188.70 with SMTP id a6csp409645wrh;
        Fri, 18 Aug 2017 07:01:42 -0700 (PDT)
X-Received: by 10.200.45.98 with SMTP id o31mr10926321qta.43.1503064902722;
        Fri, 18 Aug 2017 07:01:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503064902; cv=none;
        d=google.com; s=arc-20160816;
        b=C0WYYSbKbbkz6z33/jubFg4syeTES2UK6ZRpBgikUwCECx50UPEYmj1/hRemz0Wwxa
         XtMG/BAzVyysRx8a1X6hymTLyEMj5nFdAzM+42TkrQEyEdn4yrq/DookZaox01heZRKe
         q85q4WQjEAAEsZ9mKuQtXHXqSZf6JLhkVEk8qmWARnQfz63KVDfaNqrt8zauOCKMK7tr
         I22QKOBjS4ltadIL4rTbe1lG9z5bF+gJ/JHOISPLOBBv2sh+js2m7Wql7OU8DtkKGdxZ
         ++RSmQm1lHUhrgG15OdsaApf3WkMUWdC7yGa8aizHSqxCVyizIWRyQp++xb40ar3b6jy
         pBMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :arc-authentication-results;
        bh=gFeZ0onbTh/2EWZeNer6eP/cQdwd/Ij5YWDIAEH6PBQ=;
        b=Yu5d44Nt2EsTxl2pPmcQW+hSNStH5vnwBqVMbgP8UN0tCZMr0BvIc4437FyIAhqNQO
         VE5a1M8TMjOlCcm+YYgEJ5JDOkFUhKSxy4QsR9bwFhXLyt5FOACUdZddEE4Vroxht4E/
         +c8Ae1n0nrTL3XgfzG4erIgEU1Tip1rTMW1jVzWxHdMposO5D9vMxyjo6kOteMtjV4ee
         3c6fo8+f+zE01L/6aJ+4E798zHIUjOs4Zgjt2UYtCCqLY3unQOHSSCdxeCufzwLarTZI
         TREd9+Hi4QqFEOYGYcRzt7jkceWLitkF8P0AB74jGn4N4quU1WQN1RGRdo+yS6kbSIQQ
         JR2w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id 75si6035220qkw.546.2017.08.18.07.01.42;
        Fri, 18 Aug 2017 07:01:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 3BE1749CAD;
	Fri, 18 Aug 2017 09:59:53 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.799
X-Spam-Level: 
X-Spam-Status: No, score=0.799 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699] autolearn=no
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bWAiHJH1rKg6; Fri, 18 Aug 2017 09:59:52 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 2098349CB4;
	Fri, 18 Aug 2017 09:59:51 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id EF9B949CA8
 for <kvmarm@lists.cs.columbia.edu>; Fri, 18 Aug 2017 09:59:49 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PVXLRlH2q4Vv for <kvmarm@lists.cs.columbia.edu>;
 Fri, 18 Aug 2017 09:59:48 -0400 (EDT)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 00B7949CA7
 for <kvmarm@lists.cs.columbia.edu>; Fri, 18 Aug 2017 09:59:47 -0400 (EDT)
Received: from 172.30.72.58 (EHLO DGGEMS411-HUB.china.huawei.com)
 ([172.30.72.58])
 by dggrg05-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
 with ESMTP id DFM74410; Fri, 18 Aug 2017 22:00:48 +0800 (CST)
Received: from linux.huawei.com (10.67.187.203) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.301.0; Fri, 18 Aug 2017 22:00:12 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <mst@redhat.com>, <imammedo@redhat.com>, <zhaoshenglong@huawei.com>,
 <peter.maydell@linaro.org>, <pbonzini@redhat.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <kvm@vger.kernel.org>,
 <edk2-devel@lists.01.org>, <christoffer.dall@linaro.org>,
 <marc.zyngier@arm.com>, <will.deacon@arm.com>, <james.morse@arm.com>,
 <tbaicar@codeaurora.org>, <ard.biesheuvel@linaro.org>,
 <mingo@kernel.org>, <bp@suse.de>, <shiju.jose@huawei.com>,
 <zjzhang@codeaurora.org>, <linux-arm-kernel@lists.infradead.org>,
 <kvmarm@lists.cs.columbia.edu>, <linux-kernel@vger.kernel.org>,
 <linux-acpi@vger.kernel.org>, <devel@acpica.org>,
 <john.garry@huawei.com>, <jonathan.cameron@huawei.com>,
 <shameerali.kolothum.thodi@huawei.com>, <huangdaode@hisilicon.com>,
 <wangzhou1@hisilicon.com>
Subject: [PATCH v11 1/6] ACPI: add APEI/HEST/CPER structures and macros
Date: Fri, 18 Aug 2017 22:23:42 +0800
Message-ID: <1503066227-18251-2-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <1503066227-18251-1-git-send-email-gengdongjiu@huawei.com>
References: <1503066227-18251-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.187.203]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
 refid=str=0001.0A020201.5996F310.0190, ss=1, re=0.000, recu=0.000, reip=0.000,
 cl=1, cld=1, fgs=0, ip=0.0.0.0,
 so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: d6bd547ab7138c2865427ea05fc33ed4
Cc: zhengqiang10@huawei.com, wuquanming@huawei.com, huangshaoyu@huawei.com,
 linuxarm@huawei.com, gengdongjiu@huawei.com
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: Jw8BUGho97jR

(1) Add related APEI/HEST table structures and  macros, these
    definition refer to ACPI 6.1 and UEFI 2.6 spec.
(2) Add generic error status block and CPER memory section
    definition, user space only handle memory section errors.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
 include/hw/acpi/acpi-defs.h | 193 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 193 insertions(+)

diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index 72be675..3b4bad7 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -297,6 +297,44 @@ typedef struct AcpiMultipleApicTable AcpiMultipleApicTable;
 #define ACPI_APIC_GENERIC_TRANSLATOR    15
 #define ACPI_APIC_RESERVED              16   /* 16 and greater are reserved */
 
+/* UEFI Spec 2.6, "N.2.5 Memory Error Section */
+#define UEFI_CPER_MEM_VALID_ERROR_STATUS     0x0001
+#define UEFI_CPER_MEM_VALID_PA               0x0002
+#define UEFI_CPER_MEM_VALID_PA_MASK          0x0004
+#define UEFI_CPER_MEM_VALID_NODE             0x0008
+#define UEFI_CPER_MEM_VALID_CARD             0x0010
+#define UEFI_CPER_MEM_VALID_MODULE           0x0020
+#define UEFI_CPER_MEM_VALID_BANK             0x0040
+#define UEFI_CPER_MEM_VALID_DEVICE           0x0080
+#define UEFI_CPER_MEM_VALID_ROW              0x0100
+#define UEFI_CPER_MEM_VALID_COLUMN           0x0200
+#define UEFI_CPER_MEM_VALID_BIT_POSITION     0x0400
+#define UEFI_CPER_MEM_VALID_REQUESTOR        0x0800
+#define UEFI_CPER_MEM_VALID_RESPONDER        0x1000
+#define UEFI_CPER_MEM_VALID_TARGET           0x2000
+#define UEFI_CPER_MEM_VALID_ERROR_TYPE       0x4000
+#define UEFI_CPER_MEM_VALID_RANK_NUMBER      0x8000
+#define UEFI_CPER_MEM_VALID_CARD_HANDLE      0x10000
+#define UEFI_CPER_MEM_VALID_MODULE_HANDLE    0x20000
+#define UEFI_CPER_MEM_ERROR_TYPE_MULTI_ECC   3
+
+/* From the ACPI 6.1 spec, "18.3.2.9 Hardware Error Notification" */
+
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
+    ACPI_HEST_NOTIFY_RESERVED = 11  /* 11 and greater are reserved */
+};
+
 /*
  * MADT sub-structures (Follow MULTIPLE_APIC_DESCRIPTION_TABLE)
  */
@@ -474,6 +512,161 @@ struct AcpiSystemResourceAffinityTable {
 } QEMU_PACKED;
 typedef struct AcpiSystemResourceAffinityTable AcpiSystemResourceAffinityTable;
 
+/* Hardware Error Notification, from the ACPI 6.1
+ * spec, "18.3.2.9 Hardware Error Notification"
+ */
+struct AcpiHestNotify {
+    uint8_t type;
+    uint8_t length;
+    uint16_t config_write_enable;
+    uint32_t poll_interval;
+    uint32_t vector;
+    uint32_t polling_threshold_value;
+    uint32_t polling_threshold_window;
+    uint32_t error_threshold_value;
+    uint32_t error_threshold_window;
+} QEMU_PACKED;
+typedef struct AcpiHestNotify AcpiHestNotify;
+
+/* From ACPI 6.1, sections "18.3.2.1 IA-32 Architecture Machine
+ * Check Exception" through "18.3.2.8 Generic Hardware Error Source version 2".
+ */
+enum AcpiHestSourceType {
+    ACPI_HEST_SOURCE_IA32_CHECK = 0,
+    ACPI_HEST_SOURCE_IA32_CORRECTED_CHECK = 1,
+    ACPI_HEST_SOURCE_IA32_NMI = 2,
+    ACPI_HEST_SOURCE_AER_ROOT_PORT = 6,
+    ACPI_HEST_SOURCE_AER_ENDPOINT = 7,
+    ACPI_HEST_SOURCE_AER_BRIDGE = 8,
+    ACPI_HEST_SOURCE_GENERIC_ERROR = 9,
+    ACPI_HEST_SOURCE_GENERIC_ERROR_V2 = 10,
+    ACPI_HEST_SOURCE_RESERVED = 11    /* 11 and greater are reserved */
+};
+
+/* Block status bitmasks from ACPI 6.1, "18.3.2.7.1 Generic Error Data" */
+#define ACPI_GEBS_UNCORRECTABLE             (1)
+#define ACPI_GEBS_CORRECTABLE               (1 << 1)
+#define ACPI_GEBS_MULTIPLE_UNCORRECTABLE    (1 << 2)
+#define ACPI_GEBS_MULTIPLE_CORRECTABLE      (1 << 3)
+/* 10 bits, error data entry count */
+#define ACPI_GEBS_ERROR_ENTRY_COUNT         (0x3FF << 4)
+
+/* Generic Hardware Error Source Structure, refer to ACPI 6.1
+ * "18.3.2.7 Generic Hardware Error Source". in this struct the
+ * "type" field has to be ACPI_HEST_SOURCE_GENERIC_ERROR
+ */
+
+struct AcpiGenericHardwareErrorSource {
+    uint16_t type;
+    uint16_t source_id;
+    uint16_t related_source_id;
+    uint8_t flags;
+    uint8_t enabled;
+    uint32_t number_of_records;
+    uint32_t max_sections_per_record;
+    uint32_t max_raw_data_length;
+    struct AcpiGenericAddress error_status_address;
+    struct AcpiHestNotify notify;
+    uint32_t error_status_block_length;
+} QEMU_PACKED;
+typedef struct AcpiGenericHardwareErrorSource AcpiGenericHardwareErrorSource;
+
+/* Generic Hardware Error Source, version 2, ACPI 6.1, "18.3.2.8 Generic
+ * Hardware Error Source version 2", in this struct the "type" field has to
+ * be ACPI_HEST_SOURCE_GENERIC_ERROR_V2
+ */
+struct AcpiGenericHardwareErrorSourceV2 {
+    uint16_t type;
+    uint16_t source_id;
+    uint16_t related_source_id;
+    uint8_t flags;
+    uint8_t enabled;
+    uint32_t number_of_records;
+    uint32_t max_sections_per_record;
+    uint32_t max_raw_data_length;
+    struct AcpiGenericAddress error_status_address;
+    struct AcpiHestNotify notify;
+    uint32_t error_status_block_length;
+    struct AcpiGenericAddress read_ack_register;
+    uint64_t read_ack_preserve;
+    uint64_t read_ack_write;
+} QEMU_PACKED;
+typedef struct AcpiGenericHardwareErrorSourceV2
+            AcpiGenericHardwareErrorSourceV2;
+
+/* Generic Error Status block, from ACPI 6.1,
+ * "18.3.2.7.1 Generic Error Data"
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
+/* Generic Error Data entry, revision number is 0x0300,
+ * ACPI 6.1, "18.3.2.7.1 Generic Error Data"
+ */
+struct AcpiGenericErrorData {
+    uint8_t section_type_le[16];
+    /* The "error_severity" fields that they take their
+     * values from AcpiGenericErrorSeverity
+     */
+    uint32_t error_severity;
+    uint16_t revision;
+    uint8_t validation_bits;
+    uint8_t flags;
+    uint32_t error_data_length;
+    uint8_t fru_id[16];
+    uint8_t fru_text[20];
+    uint64_t time_stamp;
+} QEMU_PACKED;
+typedef struct AcpiGenericErrorData AcpiGenericErrorData;
+
+/* From UEFI 2.6, "N.2.5 Memory Error Section" */
+struct UefiCperSecMemErr {
+    uint64_t    validation_bits;
+    uint64_t    error_status;
+    uint64_t    physical_addr;
+    uint64_t    physical_addr_mask;
+    uint16_t    node;
+    uint16_t    card;
+    uint16_t    module;
+    uint16_t    bank;
+    uint16_t    device;
+    uint16_t    row;
+    uint16_t    column;
+    uint16_t    bit_pos;
+    uint64_t    requestor_id;
+    uint64_t    responder_id;
+    uint64_t    target_id;
+    uint8_t     error_type;
+    uint8_t     reserved;
+    uint16_t    rank;
+    uint16_t    mem_array_handle;   /* card handle in UEFI 2.4 */
+    uint16_t    mem_dev_handle;     /* module handle in UEFI 2.4 */
+} QEMU_PACKED;
+typedef struct UefiCperSecMemErr UefiCperSecMemErr;
+
+/*
+ * HEST Description Table
+ */
+struct AcpiHardwareErrorSourceTable {
+    ACPI_TABLE_HEADER_DEF                    /* ACPI common table header */
+    uint32_t           error_source_count;
+} QEMU_PACKED;
+typedef struct AcpiHardwareErrorSourceTable AcpiHardwareErrorSourceTable;
+
 #define ACPI_SRAT_PROCESSOR_APIC     0
 #define ACPI_SRAT_MEMORY             1
 #define ACPI_SRAT_PROCESSOR_x2APIC   2
-- 
1.8.3.1

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
