Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp3210300wrw;
        Thu, 8 Nov 2018 02:32:41 -0800 (PST)
X-Google-Smtp-Source: AJdET5ff3JbPmz9s7L2kFVkKVuv9BrvoW2B0SDoBJ28HAYj42o9eow2Jzit2yJWW81qRDBYVR/EQ
X-Received: by 2002:a65:638a:: with SMTP id h10-v6mr3391397pgv.136.1541673161031;
        Thu, 08 Nov 2018 02:32:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541673161; cv=none;
        d=google.com; s=arc-20160816;
        b=ypn3hGZSZz88yRYEHGiBrIQIYCaQRLsRjB1xhSTObia+bheLFe4Hzby7AyiiBTvgLz
         B/ACDeB8iX1oV+ZHD5kY20BKTQsQlIaVXZH43K7UGRI5514PQjdbhkZqaNm8d9SIr20b
         5Lu9GUqOxJV0Lu3H2PQVrk52VJLPl2kfCDZXjnpW55COCqcCuwaaRvo/90Ru7wgVYXXE
         ZuCSADSut89ommNJg/BmjHOCVuFhlyl/4a0SVrPa5k8VE8jeGLKcdf6hZXRynhieOjY9
         ZjZ0pJ+maBkezNLp3d2EN4//Jo/L0tIAdlub6IzXmlnUYhD2o2QtnYIm3XEkGgccEyUM
         7SxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=MK4hudOr1pHlO4VX4t0JcQ+x7qwzKjyN10IBpTEDc18=;
        b=T8DAQMw/Y2BivYPM9pGlDjOBf8WA6nW4XRdQN3zilv9/51Vj8v1XNrG4vtiu/v/z7m
         O9HroOnd7vA/spSCMyLQR2xy9DZBt0Ekb+xV1IB6aIxvRavmGepC/RhLF8GnWdYtmyGd
         bg35+Q7xkRbTeV4k2OKmvIiqajMkjIxC0nBWuTO2GzAvUi2bcigByi/McbxGxOyCek/7
         zfWmR6MSgmk7CB2hpd5TazyeF200GBjR7ZyRJr3XZyqrwJOSeMubIg5mQ646xrz52LYx
         Bsb4XFYnpPg0A8/GDBriixIMEQXwNyGemhSGuVJjZ4hfoSdS0w0siye7aUQTYz3qHSwz
         x7xw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id a4-v6si4090403pln.67.2018.11.08.02.32.40;
        Thu, 08 Nov 2018 02:32:41 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727040AbeKHUH2 (ORCPT <rfc822;francois.ozog@linaro.org>
        + 4 others); Thu, 8 Nov 2018 15:07:28 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:14627 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726517AbeKHUH2 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 8 Nov 2018 15:07:28 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id E0D9D3F317D48;
        Thu,  8 Nov 2018 18:32:35 +0800 (CST)
Received: from ros.huawei.com (10.143.28.118) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.408.0; Thu, 8 Nov 2018 18:32:29 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <imammedo@redhat.com>, <mst@redhat.com>,
        <peter.maydell@linaro.org>, <lersek@redhat.com>,
        <marc.zyngier@arm.com>, <james.morse@arm.com>,
        <pbonzini@redhat.com>, <mtosatti@redhat.com>, <rth@twiddle.net>,
        <zhengxiang9@huawei.com>, <ehabkost@redhat.com>,
        <kvm@vger.kernel.org>, <shannon.zhaosl@gmail.com>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
        <gengdongjiu@huawei.com>
Subject: [PATCH RESEND v15 02/10] acpi: add build_append_ghes_notify() helper for Hardware Error Notification
Date:   Thu, 8 Nov 2018 02:29:41 -0800
Message-ID: <1541672989-15967-3-git-send-email-gengdongjiu@huawei.com>
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
X-TUID: i9iMcvubgKRl

It will help to add Hardware Error Notification to ACPI tables
without using packed C structures and avoid endianness
issues as API doesn't need explicit conversion.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
 hw/acpi/aml-build.c         | 22 ++++++++++++++++++++++
 include/hw/acpi/aml-build.h |  8 ++++++++
 2 files changed, 30 insertions(+)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 1e43cd7..4210c36 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -274,6 +274,28 @@ void build_append_gas(GArray *table, AmlAddressSpace as,
     build_append_int_noprefix(table, address, 8);
 }
 
+/* Hardware Error Notification
+ * ACPI 4.0: 17.3.2.7 Hardware Error Notification
+ */
+void build_append_ghes_notify(GArray *table, const uint8_t type,
+                              uint8_t length, uint16_t config_write_enable,
+                              uint32_t poll_interval, uint32_t vector,
+                              uint32_t polling_threshold_value,
+                              uint32_t polling_threshold_window,
+                              uint32_t error_threshold_value,
+                              uint32_t error_threshold_window)
+{
+        build_append_int_noprefix(table, type, 1); /* type */
+        build_append_int_noprefix(table, length, 1);
+        build_append_int_noprefix(table, config_write_enable, 2);
+        build_append_int_noprefix(table, poll_interval, 4);
+        build_append_int_noprefix(table, vector, 4);
+        build_append_int_noprefix(table, polling_threshold_value, 4);
+        build_append_int_noprefix(table, polling_threshold_window, 4);
+        build_append_int_noprefix(table, error_threshold_value, 4);
+        build_append_int_noprefix(table, error_threshold_window, 4);
+}
+
 /*
  * Build NAME(XXXX, 0x00000000) where 0x00000000 is encoded as a dword,
  * and return the offset to 0x00000000 for runtime patching.
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index 6c36903..a005052 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -409,6 +409,14 @@ build_append_gas_from_struct(GArray *table, const struct AcpiGenericAddress *s)
                      s->access_width, s->address);
 }
 
+void build_append_ghes_notify(GArray *table, const uint8_t type,
+                              uint8_t length, uint16_t config_write_enable,
+                              uint32_t poll_interval, uint32_t vector,
+                              uint32_t polling_threshold_value,
+                              uint32_t polling_threshold_window,
+                              uint32_t error_threshold_value,
+                              uint32_t error_threshold_window);
+
 void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
                        uint64_t len, int node, MemoryAffinityFlags flags);
 
-- 
1.8.3.1
