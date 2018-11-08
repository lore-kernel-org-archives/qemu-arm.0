Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp3210327wrw;
        Thu, 8 Nov 2018 02:32:43 -0800 (PST)
X-Google-Smtp-Source: AJdET5ccfyxEYnH2uC44KMtYXV8xlCi6sWkKkNoJOVxHSoUcYdcEge2UrZLRcJt0mX6iN7Uw1Tms
X-Received: by 2002:a63:7044:: with SMTP id a4mr3241265pgn.359.1541673163792;
        Thu, 08 Nov 2018 02:32:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541673163; cv=none;
        d=google.com; s=arc-20160816;
        b=hJUSlnSkKMNm5fqzgolILEmJqifNZQAicn+kmEbI6xxPxO8zHdroAJ7mxnfIf9/CeY
         jgZRR3ud2g3bmguIlmiEQOfYiy4kS3glidOUBecGsJOG8AvAAobbf/aYLrtltN6EMgxZ
         A+adEKnLOACg/pkT5n5fIkMTNWrX3M0162uYN0cUQHSjQ+pxWGT5HDJecDEQlLBVJELJ
         YwkzxRhmjEjho+8whavoYkuqFYIIo3TEKQ5S5xhGvbadSa/WMy7xAkSDBM0SHUvQ1D+f
         c2iDDevGdj/E/x8QmoEP8VtTLnqyrKZTyQzr/gO7Y/IQx0J/rH0NqhkV4c/V7i8FV7cq
         OFNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=NOnvikheJUSaQMV3pBKieBfX11cD/7MReabXmjmeg7o=;
        b=gyHAJxqrg5Z3twIoBVLSim1jom0StOBxrYLjo8GXLbAiKou5JfEfID3vWgTuMFzWLt
         /kDh3z3/JvESWNoucalWM+7gDwX5EpTPfvYr5uzcBze1YPOV/uNc+IuWrZ6b/C2VyLw5
         6gG0O8uuawPUQr1c7TfB4E6cED6GbbRUIhZwrgCGowKK4y6FFJmlrjvsQj4psdl1RMfi
         xjE1bXEWZAL14wweFLqwCw0ftMmQPl0SR8bjjKeq/ECUq7mlrmd4y0Iwj1DSmvA9134r
         0aCBX6W+d8BN3O95gktHXRXn8EnKF5s3METCYfGJdU1zDQjwsJFzeZXFiOvlvQz7qE4M
         kA/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id a4-v6si4090403pln.67.2018.11.08.02.32.43;
        Thu, 08 Nov 2018 02:32:43 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727027AbeKHUH1 (ORCPT <rfc822;francois.ozog@linaro.org>
        + 4 others); Thu, 8 Nov 2018 15:07:27 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:38272 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726145AbeKHUH1 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 8 Nov 2018 15:07:27 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 2BEBA272705F9;
        Thu,  8 Nov 2018 18:32:36 +0800 (CST)
Received: from ros.huawei.com (10.143.28.118) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.408.0; Thu, 8 Nov 2018 18:32:30 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <imammedo@redhat.com>, <mst@redhat.com>,
        <peter.maydell@linaro.org>, <lersek@redhat.com>,
        <marc.zyngier@arm.com>, <james.morse@arm.com>,
        <pbonzini@redhat.com>, <mtosatti@redhat.com>, <rth@twiddle.net>,
        <zhengxiang9@huawei.com>, <ehabkost@redhat.com>,
        <kvm@vger.kernel.org>, <shannon.zhaosl@gmail.com>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
        <gengdongjiu@huawei.com>
Subject: [PATCH RESEND v15 03/10] acpi: add build_append_ghes_generic_data() helper for Generic Error Data Entry
Date:   Thu, 8 Nov 2018 02:29:42 -0800
Message-ID: <1541672989-15967-4-git-send-email-gengdongjiu@huawei.com>
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
X-TUID: g1NVHANJhKu3

It will help to add Generic Error Data Entry to ACPI tables
without using packed C structures and avoid endianness
issues as API doesn't need explicit conversion.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
 hw/acpi/aml-build.c         | 32 ++++++++++++++++++++++++++++++++
 include/hw/acpi/aml-build.h |  6 ++++++
 2 files changed, 38 insertions(+)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 4210c36..00b166e 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -296,6 +296,38 @@ void build_append_ghes_notify(GArray *table, const uint8_t type,
         build_append_int_noprefix(table, error_threshold_window, 4);
 }
 
+/* Generic Error Data Entry
+ * ACPI 4.0: 17.3.2.6.1 Generic Error Data
+ */
+void build_append_ghes_generic_data(GArray *table, const char *section_type,
+                                    uint32_t error_severity, uint16_t revision,
+                                    uint8_t validation_bits, uint8_t flags,
+                                    uint32_t error_data_length, uint8_t *fru_id,
+                                    uint8_t *fru_text, uint64_t time_stamp)
+{
+    int i;
+
+    for (i = 0; i < 16; i++) {
+        build_append_int_noprefix(table, section_type[i], 1);
+    }
+
+    build_append_int_noprefix(table, error_severity, 4);
+    build_append_int_noprefix(table, revision, 2);
+    build_append_int_noprefix(table, validation_bits, 1);
+    build_append_int_noprefix(table, flags, 1);
+    build_append_int_noprefix(table, error_data_length, 4);
+
+    for (i = 0; i < 16; i++) {
+        build_append_int_noprefix(table, fru_id[i], 1);
+    }
+
+    for (i = 0; i < 20; i++) {
+        build_append_int_noprefix(table, fru_text[i], 1);
+    }
+
+    build_append_int_noprefix(table, time_stamp, 8);
+}
+
 /*
  * Build NAME(XXXX, 0x00000000) where 0x00000000 is encoded as a dword,
  * and return the offset to 0x00000000 for runtime patching.
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index a005052..147eb38 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -417,6 +417,12 @@ void build_append_ghes_notify(GArray *table, const uint8_t type,
                               uint32_t error_threshold_value,
                               uint32_t error_threshold_window);
 
+void build_append_ghes_generic_data(GArray *table, const char *section_type,
+                                    uint32_t error_severity, uint16_t revision,
+                                    uint8_t validation_bits, uint8_t flags,
+                                    uint32_t error_data_length, uint8_t *fru_id,
+                                    uint8_t *fru_text, uint64_t time_stamp);
+
 void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
                        uint64_t len, int node, MemoryAffinityFlags flags);
 
-- 
1.8.3.1
