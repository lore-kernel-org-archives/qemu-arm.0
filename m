Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3879303wrg;
        Tue, 14 May 2019 04:22:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyyOiYew8gy5vtwswcQrJWqLhVoz13o8Hi+smPx+4PYIv4QYRxJ5nbM9RruWpWh+xiUefpy
X-Received: by 2002:a17:902:248:: with SMTP id 66mr28134231plc.185.1557832923538;
        Tue, 14 May 2019 04:22:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557832923; cv=none;
        d=google.com; s=arc-20160816;
        b=q/NO51FL7OcLjOZcnm0tAlFd1NW1FpwGCZHRwL5Z5cK80u7kac2+GyDPvPs7Vp/+9R
         ZNYbeAO9DbU+z7Ik/ZFwjNZBCxgpfq17krt4GxdJSPy5ViJR3oKRQbZkuT6Wj3xqxPDW
         XH/S7+cSYqdCiwLAtDneZiwlRPWX8DYJksWKSSqqCygQd7aD8IP+D7x3cP1gL61w9i6W
         6fexiRuV75RrcYhNHKSJmZ/hK+73nqmojxTJnVInwwgRAVZOQ+klcH3Vc6vzvq9pVmvn
         3UN0vUHyvkJ44ZO6Zj42cWL6eOUi3G/SftI5xQsfBXsdrwGIYwminMU6pRmSYwdREP99
         LlHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=wXfNUKzBVjVyxD7hoIYLWfcz/ruM+61t8MI7ZgW3f20=;
        b=kaQFku/TgOxwNqIqDtCC/rra/RA80Q/3KpMHkxg0l6b3vJ648x/9Gg0mQvvNi0zTjX
         53cFlpiSGE33qUWLfaUxxOAcx37sE2Ict9ZvQ0wYYWNOWtuq1VWvgZtwzfqIijLEfe8T
         KlTwsg9S6sMJvjvW+YQ+dsoiLOoGFh9eYS0Zkq8smPY3sF3WS7N7hHAqepZVkAAa979o
         7OHkBN/kqnYBjIAvc43ES5CghQJAyegz7ywnBtyLYdlGCw7u8k/ioLzk4GY0XE/TaIlf
         qSFMpuopQCbAhlH+mX57uDLWIrrjpyvsi8EkH0Z/FOYcHOlWVtyC5tgCxD+mN/2h7SnG
         Xnww==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id 202si20024040pgh.575.2019.05.14.04.22.03;
        Tue, 14 May 2019 04:22:03 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726422AbfENLWC (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 5 others); Tue, 14 May 2019 07:22:02 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:7643 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726362AbfENLWC (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 14 May 2019 07:22:02 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 6B7BAB2814CF99DB80C7;
        Tue, 14 May 2019 19:22:00 +0800 (CST)
Received: from ros.huawei.com (10.143.28.118) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.439.0; Tue, 14 May 2019 19:21:53 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <pbonzini@redhat.com>, <mst@redhat.com>, <imammedo@redhat.com>,
        <shannon.zhaosl@gmail.com>, <peter.maydell@linaro.org>,
        <lersek@redhat.com>, <james.morse@arm.com>,
        <gengdongjiu@huawei.com>, <mtosatti@redhat.com>, <rth@twiddle.net>,
        <ehabkost@redhat.com>, <zhengxiang9@huawei.com>,
        <jonathan.cameron@huawei.com>, <xuwei5@huawei.com>,
        <kvm@vger.kernel.org>, <qemu-devel@nongnu.org>,
        <qemu-arm@nongnu.org>, <linuxarm@huawei.com>
Subject: [PATCH v17 05/10] acpi: add build_append_ghes_generic_status() helper for Generic Error Status Block
Date:   Tue, 14 May 2019 04:18:18 -0700
Message-ID: <1557832703-42620-6-git-send-email-gengdongjiu@huawei.com>
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
X-TUID: DG1v1PRmk9lH

It will help to add Generic Error Status Block to ACPI tables
without using packed C structures and avoid endianness
issues as API doesn't need explicit conversion.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
 hw/acpi/aml-build.c         | 14 ++++++++++++++
 include/hw/acpi/aml-build.h |  6 ++++++
 2 files changed, 20 insertions(+)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 102a288..ce90970 100644
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
index a71db2f..1ec7e1b 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -425,6 +425,12 @@ void build_append_ghes_generic_data(GArray *table, const char *section_type,
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
