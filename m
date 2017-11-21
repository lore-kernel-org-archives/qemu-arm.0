Received: by 10.223.159.82 with SMTP id f18csp507085wrg;
        Tue, 21 Nov 2017 02:32:01 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYo5Em1bsC3OeUE8vbOvQbg8nDlVMWyvIJbFXTQ6PAXZBjr4x7sYkR+FIAjZyUNk02gb5Ce
X-Received: by 10.98.217.133 with SMTP id b5mr1331185pfl.173.1511260321252;
        Tue, 21 Nov 2017 02:32:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511260321; cv=none;
        d=google.com; s=arc-20160816;
        b=pxMjjR0K1h0ABlvmeYkUM73i+gA5+p4lLn5mZvRXJzdmKXnWoVreny5YeXaauGVmJL
         FnudGSNgGkhGtWqCxmDVOviNTc7VfLwVM5bk2SJ4HN+R0ZFzHO52i2a/yCMT8hxX7nD9
         wED0sL3vInUPT8TDqHcdILd2L/nFiOILaox5EVQa1EwodQ4kBXB/wN3MIynsorBGj9ec
         HCVT4c/B0xK5qvUnvpCr5lySsN7+5w4YJKczgIfSvermctR+JpY0OsRrXZFM1qxAFT3K
         Lze60HwUiPQCtHGP8BYKK+VbB2KHF9ZheLqODvsvSYgwlS5re/RPfuQLU+cbKEgbVerN
         1Raw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:arc-authentication-results;
        bh=Bi7VFDnCCJ6sCrXtF9HYOfSFjwQViCjDkFgtGsVSll0=;
        b=xfuOkVEVSWnk0nmFTOxLgVNZaicCLeWM2NB8cpojb5t+43kl2tW9VZ9uYkE7UcEmrV
         x318mJ8NQsEWx2NZAQ8VLjpdrUIkEIdFBjQTUsfTCsRnt6Abc2J59s1QgeYUWsezBtRT
         AvAf0+HhKKX35TjIxmlhvMvUODGRkEGspwBySApC+aQKxfMV25uLSMaPtJRd8RkcrNjf
         gqmcAFoGKl6R0FgNS1JC1pXce7QvIDDFIR9dYp6RbocgpGY/c9qvm70gFupyJX4MAs8x
         1i0D6moWq0AE/jDKXFo5q65PV1SXT810MN2sCkQM36ZqiZb0T5PrUaUnlbeGB0JAFpQw
         EWbg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id 1si10611141pla.339.2017.11.21.02.32.01;
        Tue, 21 Nov 2017 02:32:01 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751654AbdKUKb6 (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Tue, 21 Nov 2017 05:31:58 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:10969 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751988AbdKUKbz (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 21 Nov 2017 05:31:55 -0500
Received: from 172.30.72.58 (EHLO DGGEMS402-HUB.china.huawei.com) ([172.30.72.58])
        by dggrg04-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
        with ESMTP id DLG39778;
        Tue, 21 Nov 2017 18:31:41 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.361.1; Tue, 21 Nov 2017 18:31:30 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <pbonzini@redhat.com>, <mst@redhat.com>, <imammedo@redhat.com>,
        <zhaoshenglong@huawei.com>, <peter.maydell@linaro.org>,
        <mtosatti@redhat.com>, <james.morse@arm.com>, <lersek@redhat.com>,
        <marc.zyngier@arm.com>, <christoffer.dall@linaro.org>,
        <rth@twiddle.net>, <ehabkost@redhat.com>, <kvm@vger.kernel.org>,
        <guohanjun@huawei.com>, <lijinyue@huawei.com>,
        <huangshaoyu@huawei.com>, <wuquanming@huawei.com>,
        <zhengqiang10@huawei.com>, <linuxarm@huawei.com>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
        <dingtianhong@huawei.com>, <wangxiongfeng2@huawei.com>
CC:     <gengdongjiu@huawei.com>
Subject: [PATCH RESEND v12 01/12] ACPI: add related GHES structures and macros definition
Date:   Wed, 22 Nov 2017 02:37:03 +0800
Message-ID: <1511289434-1551-2-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1511289434-1551-1-git-send-email-gengdongjiu@huawei.com>
References: <1511289434-1551-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
        refid=str=0001.0A090204.5A14008E.00BE,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0,
        ip=0.0.0.0,
        so=2014-11-16 11:51:01,
        dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: e683c5966c5bd221d3d93ae6459e1d66
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: CQZTCBiNJqbH

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
