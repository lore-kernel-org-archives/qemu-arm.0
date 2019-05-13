Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2760544wrg;
        Mon, 13 May 2019 05:46:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxjV8gtf4EUwWTRh5R+Wp3vOtGJHO2aON60lgUkYn11it/CBTX4k4zGbkmCGX3ZyjnzJlDb
X-Received: by 2002:a63:e408:: with SMTP id a8mr30834054pgi.146.1557751610818;
        Mon, 13 May 2019 05:46:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557751610; cv=none;
        d=google.com; s=arc-20160816;
        b=YwvLgGUrX44yhp5HsNbcs+B9W/V1yQ/1pkfL1KNTs6lCxCqkmrndJszBpVPGlCwiyZ
         0UtKMQ11nIOTJKO4V4+u+rUxvBD2s3CtnXpu53bsLWXhYHENxtLz0iAlYwh7nKD1wJGr
         m2HdOrhDptX5Vw0XZTclHUYfvVBJBG/gpJ10tsn7ZU+WQzbClqUb96Yp0HNmLGn0/agD
         VCHWIy4RFWXYQJ/TJXNNYUIWl9hFEYBYbPU4Xb6wBT/r9dSOgIeCvHg7u6FGmt6j9KOU
         3X3wM35dZxWVb7vqmSfAuociSTeqhvSCno7jD0MeSUcV9ct/1c5y//tmTPa9ZX5UCpzQ
         29RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=IEeAAIjiFWz83edZfccDobtykObDoN2328z5/2br0cA=;
        b=uOUT2d2mrTPMuwJ7W+OHlgPo2uhsWD8QeurikIxGkaXus6eBzD4Eswm20gqRcMv8lw
         y9TsgcvSkQT4wac8Jcu7Xka5yr3Bhfdj35eH2PRBvKqC+aAIdpwqiqcMxzQKooB/6WJn
         hquRXE5/cFf54SJx4YJJcORnw+StpESZq8G+g0DYAvA5vvKxRVpZ1PD8q3OBgjBxdXLy
         ifcqFL5okVxG75S3IoOIMaGzzV1oPTBjefdp66v60qHS9FoxF2XvDmaeaXBafadPM1JA
         jQ12ggIyVeGm/iIjos8dQfJVWORp+kUmdRwqKrkqNin6X7D/XxmqPKIFxTlye3FVY/6J
         TCHA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id s23si16032343pga.580.2019.05.13.05.46.50;
        Mon, 13 May 2019 05:46:50 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729945AbfEMMqp (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 5 others); Mon, 13 May 2019 08:46:45 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:39520 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729793AbfEMMqo (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 13 May 2019 08:46:44 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 4DC25E7214918BC2A151;
        Mon, 13 May 2019 20:46:43 +0800 (CST)
Received: from ros.huawei.com (10.143.28.118) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.439.0; Mon, 13 May 2019 20:46:34 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <pbonzini@redhat.com>, <mst@redhat.com>, <imammedo@redhat.com>,
        <shannon.zhaosl@gmail.com>, <peter.maydell@linaro.org>,
        <lersek@redhat.com>, <james.morse@arm.com>,
        <gengdongjiu@huawei.com>, <mtosatti@redhat.com>, <rth@twiddle.net>,
        <ehabkost@redhat.com>, <zhengxiang9@huawei.com>,
        <jonathan.cameron@huawei.com>, <xuwei5@huawei.com>,
        <kvm@vger.kernel.org>, <qemu-devel@nongnu.org>,
        <qemu-arm@nongnu.org>, <linuxarm@huawei.com>
Subject: [PATCH v16 03/10] acpi: add build_append_ghes_notify() helper for Hardware Error Notification
Date:   Mon, 13 May 2019 05:43:01 -0700
Message-ID: <1557751388-27063-4-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557751388-27063-1-git-send-email-gengdongjiu@huawei.com>
References: <1557751388-27063-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.118]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: lKCbnCeF8Xh7

It will help to add Hardware Error Notification to ACPI tables
without using packed C structures and avoid endianness
issues as API doesn't need explicit conversion.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
 hw/acpi/aml-build.c         | 22 ++++++++++++++++++++++
 include/hw/acpi/aml-build.h |  8 ++++++++
 2 files changed, 30 insertions(+)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 555c24f..fb53f21 100644
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
index 1a563ad..90c8ef8 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -411,6 +411,14 @@ build_append_gas_from_struct(GArray *table, const struct AcpiGenericAddress *s)
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
