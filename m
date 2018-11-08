Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp3210294wrw;
        Thu, 8 Nov 2018 02:32:40 -0800 (PST)
X-Google-Smtp-Source: AJdET5ff0Wf3jSFKrWYLkuzQaY298s29MDlpy7HJo8zcY/B74Zk+F5lrN+1HALLSCrGGSMr9ls4h
X-Received: by 2002:a62:647:: with SMTP id 68-v6mr4166398pfg.42.1541673160729;
        Thu, 08 Nov 2018 02:32:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541673160; cv=none;
        d=google.com; s=arc-20160816;
        b=xXM0Jn8j/+exi/H4PlpFBCUYE7qAUu8wxumw+15Q+OwYMP5oPqYyI2kN3NcrpuNtJc
         6p0OK8X+P1FDQ1DDxken+FvxLzDdUd75DKI9BNe0Bbfw227Unsq/TuJHIzBvFZk8uDqu
         UCa8pLPh4FsY4jLix8nfaBIAzsrISTKdXSN82pN45HJQVccE0P9plvZhE041iuF+yuq0
         AnJSFzo8sjAZn4teAGUYBkhhip2I/yqDKG6vg2WAa4luFGysLkmQXOQWbS86mDQYcoAj
         cfXFf2OM4i2l9v6oTxqQ0tGqwMzLwn66wNzVMfQKgoGcWYzMqYoGDAqm6bHqJhzwwUBz
         0Y8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=2WuWaaFP3429exA0umwDiN0bPJXRTHfJmWQr1u3+nfI=;
        b=TeegxI4EmS0IY9mG5pkfCNWU9mCcq4k9Ec4dNxR81HIp3cYQXoMZXaH0QL/P1fZg3x
         mLlh9TINbe2D5TC+eQz0Yhv9L7zYFJysob+STy7pIyxNCnHtl/LmpdIWnZSq+8Np1BEN
         u1tF177QiCqR/Vcz2nukV85SFECkJu+Q06eB4r7zQoKQn2FP8BstslEBDg34jvTGm/E6
         L7oxog1GZSwPQrjZmSovYYN6+EQmb3zi8Ez/e/da2c8aZQFsmCuuX8ker4Bcyw9CBKvB
         RcIMna5t3sHG6ASWfnb3eXHCaTTNQ8d6h8u5NTziWRA8r3YnP8oBFGNMHRM5Dj8yZ5Lm
         /WHA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id a4-v6si4090403pln.67.2018.11.08.02.32.40;
        Thu, 08 Nov 2018 02:32:40 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727029AbeKHUH2 (ORCPT <rfc822;francois.ozog@linaro.org>
        + 4 others); Thu, 8 Nov 2018 15:07:28 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:14625 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726509AbeKHUH1 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 8 Nov 2018 15:07:27 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id CE341E0E57B8B;
        Thu,  8 Nov 2018 18:32:35 +0800 (CST)
Received: from ros.huawei.com (10.143.28.118) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.408.0; Thu, 8 Nov 2018 18:32:31 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <imammedo@redhat.com>, <mst@redhat.com>,
        <peter.maydell@linaro.org>, <lersek@redhat.com>,
        <marc.zyngier@arm.com>, <james.morse@arm.com>,
        <pbonzini@redhat.com>, <mtosatti@redhat.com>, <rth@twiddle.net>,
        <zhengxiang9@huawei.com>, <ehabkost@redhat.com>,
        <kvm@vger.kernel.org>, <shannon.zhaosl@gmail.com>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
        <gengdongjiu@huawei.com>
Subject: [PATCH RESEND v15 04/10] acpi: add build_append_ghes_generic_status() helper for Generic Error Status Block
Date:   Thu, 8 Nov 2018 02:29:43 -0800
Message-ID: <1541672989-15967-5-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1541672989-15967-1-git-send-email-gengdongjiu@huawei.com>
References: <1541672989-15967-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.118]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 2q9RUN9NCfRe

It will help to add Generic Error Status Block to ACPI tables
without using packed C structures and avoid endianness
issues as API doesn't need explicit conversion.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
 hw/acpi/aml-build.c         | 14 ++++++++++++++
 include/hw/acpi/aml-build.h |  6 ++++++
 2 files changed, 20 insertions(+)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 00b166e..5923248 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -296,6 +296,20 @@ void build_append_ghes_notify(GArray *table, const uint8_t type,
         build_append_int_noprefix(table, error_threshold_window, 4);
 }
 
+/* Generic Error Status Block
+ * ACPI 4.0: 17.3.2.6.1 Generic Error Data
+ */
+void build_append_ghes_generic_status(GArray *table, uint32_t block_status,
+                      uint32_t raw_data_offset, uint32_t raw_data_length,
+                      uint32_t data_length, uint32_t error_severity)
+{
+    build_append_int_noprefix(table, block_status, 4);
+    build_append_int_noprefix(table, raw_data_offset, 4);
+    build_append_int_noprefix(table, raw_data_length, 4);
+    build_append_int_noprefix(table, data_length, 4);
+    build_append_int_noprefix(table, error_severity, 4);
+}
+
 /* Generic Error Data Entry
  * ACPI 4.0: 17.3.2.6.1 Generic Error Data
  */
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index 147eb38..657a0d5 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -423,6 +423,12 @@ void build_append_ghes_generic_data(GArray *table, const char *section_type,
                                     uint32_t error_data_length, uint8_t *fru_id,
                                     uint8_t *fru_text, uint64_t time_stamp);
 
+void
+build_append_ghes_generic_status(GArray *table, uint32_t block_status,
+                                 uint32_t raw_data_offset,
+                                 uint32_t raw_data_length,
+                                 uint32_t data_length, uint32_t error_severity);
+
 void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
                        uint64_t len, int node, MemoryAffinityFlags flags);
 
-- 
1.8.3.1
