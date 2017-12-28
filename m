Received: by 10.223.134.117 with SMTP id 50csp5137098wrw;
        Wed, 27 Dec 2017 21:28:02 -0800 (PST)
X-Google-Smtp-Source: ACJfBov0ltAitbRInOAmZI8KFuleYXAtFfL7/qH0QEbOZZFbUi/AxkpgNO8gL1VCpypMfp0Yx8T0
X-Received: by 10.98.208.67 with SMTP id p64mr30571879pfg.111.1514438882839;
        Wed, 27 Dec 2017 21:28:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514438882; cv=none;
        d=google.com; s=arc-20160816;
        b=08UUlHfq8qvZKS7jPOYdWWnFyB9Rz6sjRPn4AWrP/w/ZZJ8k7ecRZMz/5mQ5LSXqZD
         Ibim1y3qPbNJBxcrlOhhwD+s3KRmL6TXQ7gOtBODXhv/EnSpPVFO/wOFn/aQ4KIE+BFb
         x1FkMq0mlhzFSEYE4fXoeFA+mXI8Q27gh6JbcwcbiSRx2cbAfIu5xglSLQXWWqN83kQj
         /iZdzNnZ2jFt0oh34HOTlUnKGe2iI7t/BR8PhWJLDL5EbIpd0YYOmTPcrI1MSnSSvL+E
         mxpkfk2tWDNshmN7KRXmgv1EoGKNdc6SQKKouOxr0QaQR610J218jRQgvwImQOCobhJd
         yRRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:arc-authentication-results;
        bh=Ho80WFHut1305+/F77eXxhR8RE2nzOcjcYEReDhtmxc=;
        b=Q+oE7ppenLg5uCVdWDQAsH0V0b+pWw/tEwhUd/mFDAodPtKHRF3H8ZQXza5xF1+HMx
         q+mqjCrXEEkeHqCTOY2tV3MzneCTmdSWGsTFujdtDwBNXKE2nj6diAUJ0MJ9izW80/pi
         VhWh6vu80wVp1UArT6za5WLajsWrOXYhap0LlT6iO6g88By/1dRweqbpp/EyXgk6iMGS
         Mi0pXmIVtQuWuhfniQWHGgWJ7soP1LWI/Yrd1mprrj5fOXgzezBjxx2R7qQmklXzOaf0
         UJ2d/tXHiTQrfaGfJGsrTb6OKGpqYnEN506uroYZaqWBtggJ+HzJdIQPyb5GM7UU2LBt
         2bCA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id d17si23639783pge.93.2017.12.27.21.28.02;
        Wed, 27 Dec 2017 21:28:02 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751442AbdL1F17 (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Thu, 28 Dec 2017 00:27:59 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3189 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751338AbdL1F1z (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 28 Dec 2017 00:27:55 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 9976C1C4DFF1;
        Thu, 28 Dec 2017 13:27:38 +0800 (CST)
Received: from linux.huawei.com (10.67.187.203) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.361.1; Thu, 28 Dec 2017 13:27:30 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <pbonzini@redhat.com>, <mst@redhat.com>, <imammedo@redhat.com>,
        <zhaoshenglong@huawei.com>, <peter.maydell@linaro.org>,
        <mtosatti@redhat.com>, <rth@twiddle.net>, <ehabkost@redhat.com>,
        <james.morse@arm.com>, <christoffer.dall@linaro.org>,
        <marc.zyngier@arm.com>, <kvm@vger.kernel.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC:     <gengdongjiu@huawei.com>, <huangshaoyu@huawei.com>,
        <zhengqiang10@huawei.com>, <xuwei5@hisilicon.com>
Subject: [PATCH v14 1/9] ACPI: add some GHES structures and macros definition
Date:   Thu, 28 Dec 2017 13:54:10 +0800
Message-ID: <1514440458-10515-2-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <1514440458-10515-1-git-send-email-gengdongjiu@huawei.com>
References: <1514440458-10515-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.187.203]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: dGdqb32zor/L

Add Generic Error Status Block structures and some macros
definitions, which is referred to the ACPI 4.0 or ACPI 6.1. The
HEST table generation and CPER record will use them.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
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
index 72be675..fb2110c 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -298,6 +298,25 @@ typedef struct AcpiMultipleApicTable AcpiMultipleApicTable;
 #define ACPI_APIC_RESERVED              16   /* 16 and greater are reserved */
 
 /*
+ * Hardware Error Notification
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
@@ -474,6 +493,39 @@ struct AcpiSystemResourceAffinityTable {
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
+ * Masks for Block Status field above
+ */
+#define ACPI_GEBS_UNCORRECTABLE          (1)
+
+/*
+ * Value for Error Severity field above
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
+#define ACPI_HEST_SOURCE_GENERIC_ERROR_V2    (10)
+
 #define ACPI_SRAT_PROCESSOR_APIC     0
 #define ACPI_SRAT_MEMORY             1
 #define ACPI_SRAT_PROCESSOR_x2APIC   2
-- 
1.8.3.1
