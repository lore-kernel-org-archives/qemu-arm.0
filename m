Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp3199267wrw;
        Thu, 8 Nov 2018 02:18:46 -0800 (PST)
X-Google-Smtp-Source: AJdET5dP6mD/jgBqf0uBRXdPArT3cdQqnSMacpSv61X5PYibd8JV20LU+dxF7+8/h0939w48JfUN
X-Received: by 2002:a63:5122:: with SMTP id f34mr3164371pgb.218.1541672326114;
        Thu, 08 Nov 2018 02:18:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541672326; cv=none;
        d=google.com; s=arc-20160816;
        b=CXrQrylrAOqg4tBBXb1dpx0rkGmAa/AfLn/LyxwSkcBY/mUJ34e/5NVsGwfOCE18So
         HqFeHMQk006EDReWqk4M8WfDJQ5gLVR+GqNSEztAF8Z3EADMTmH8yYbNF7p6u90JQolH
         fgLzscg/R4ZyDR7TcAzMXoWq8YIH/TGxYhRO47BGb9gkabNgR4KIQGBLm+AIxHwkCmYF
         ifChkUusYJNcl0VUO1BwbCJ6ojal7Jak0QZVn/JL5780iMTrs3KCpI6yBGZCJfZGAadV
         QHlvEznfHdYgRAKShM6hNSXEtouQ7PRKLzUR0FMR//KgVCdR7kNPY+w1tdYKLJlbu1DB
         zy0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=2WuWaaFP3429exA0umwDiN0bPJXRTHfJmWQr1u3+nfI=;
        b=mA8ACOytea37NV50xMoyaSOFVrCVYe+oMx6JABhgibAMQX6O7VNV3fwVeq5DhcZBkq
         y0quIbPKZeEBJOh7Y6EumGWYxq+04CKDsDfgIjdxo5KsrsyT47PWMza3LeM0Y6NObjKQ
         1QRXi4VAjBRx2ZUem4qmHs82dymM4dyC4WSe89KMX15Du0m5ZDdlWuyuBtqh/ugzMLQE
         J9NOVqTnUipkgXWAmSB87UsRtUZm4wq+jdK7XtDGsdq3+t/Sm9v/TS+vnZA2a5S5e4eK
         K3QBJS3/7MoQCqL5Rdosi5SurlYaY3FWB1LZ8xbAU51zA1j0oDvh1uKl10Lz0FSCWLTB
         qLWw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id v26-v6si3400052pge.101.2018.11.08.02.18.45;
        Thu, 08 Nov 2018 02:18:46 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727029AbeKHTx2 (ORCPT <rfc822;francois.ozog@linaro.org>
        + 4 others); Thu, 8 Nov 2018 14:53:28 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:45064 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726509AbeKHTx1 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 8 Nov 2018 14:53:27 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 1173EFD305648;
        Thu,  8 Nov 2018 18:18:39 +0800 (CST)
Received: from ros.huawei.com (10.143.28.118) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.408.0; Thu, 8 Nov 2018 18:18:34 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <imammedo@redhat.com>, <mst@redhat.com>,
        <peter.maydell@linaro.org>, <pbonzini@redhat.com>,
        <mtosatti@redhat.com>, <rth@twiddle.net>, <ehabkost@redhat.com>,
        <kvm@vger.kernel.org>, <shannon.zhaosl@gmail.com>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
        <gengdongjiu@huawei.com>
Subject: [PATCH v15 04/10] acpi: add build_append_ghes_generic_status() helper for Generic Error Status Block
Date:   Thu, 8 Nov 2018 02:15:47 -0800
Message-ID: <1541672153-15529-5-git-send-email-gengdongjiu@huawei.com>
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
X-TUID: NZxwPXwEmYos

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
