Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3879342wrg;
        Tue, 14 May 2019 04:22:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzwmrhbK64IA+pMCCn41c9OdMw1zndvnfQIpxteMPY64icw8rcinrrnWuZ6/iLriUqlzgbW
X-Received: by 2002:a63:7989:: with SMTP id u131mr28946492pgc.180.1557832925811;
        Tue, 14 May 2019 04:22:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557832925; cv=none;
        d=google.com; s=arc-20160816;
        b=hdIlljiWnnj3KNHRfGRpEUm8Z5VuFWZt+hZeC3P/qtAtko0J1L8f8wnmE5JLZWaMiw
         eS9kj7+h0qOxwy5bCh+3nXU4GPON0jg2ON547dDEIsu4H2EVia5c/YlrcZ9fCyeOZ+4q
         Nje0AD9JzA/ANI6/MGLDB3FpcArXeaxf/Ck2bpklEOvW3uUwmxfx/HP/379jIz52fCre
         7vRDNXOp2EBcBcH6JP9kgvnzBR+6hWaG2s/QFYeHYah+Q9n74P+SQz0k0FtA9jrlEgJy
         jBkBsWJYiTmDuf3X+9D+ozqzzLfbuZcAOm1ErrX38P110nhf8tpEYIu6tclVhC8OlxLL
         Jf4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=CppaNZPgjiMA0RVTPrttMqmMlAsh9JEqURmMcfAC8TI=;
        b=IX0dj52TOMCnupz4FtPdBBBExf42RGb08LdvoNOaJtqnX9vUMERWX+hM3OKikXaTSY
         lF8Iq8sO7JsEsK3JEaEszzDNOMJTLeO8cDsC6FDhHsXR4zwbStvG66bPqbUpqMgNct7G
         bmVpSVigfhQZboWGQVPJi0mhAjiThumIfFsRYsJBqJ0OEXs8ft64XogVRZG7OHJqKDJG
         YLT+XzR41MCS2EnV+QV1oQ7IPoZXfdvVF37IsinQWfmuPph53xWA/fYFZe0jbm9fqQdi
         NmmhovydTNVp5IqjevkFFf7yUFXWdE+sPEHYMMRNtOn9dZoHZIKQfBrAGL4Das82RJOa
         KzzA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id 202si20024040pgh.575.2019.05.14.04.22.05;
        Tue, 14 May 2019 04:22:05 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726394AbfENLWC (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 5 others); Tue, 14 May 2019 07:22:02 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:7642 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726342AbfENLWC (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 14 May 2019 07:22:02 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 62B9D52063AC7E564E84;
        Tue, 14 May 2019 19:22:00 +0800 (CST)
Received: from ros.huawei.com (10.143.28.118) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.439.0; Tue, 14 May 2019 19:21:52 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <pbonzini@redhat.com>, <mst@redhat.com>, <imammedo@redhat.com>,
        <shannon.zhaosl@gmail.com>, <peter.maydell@linaro.org>,
        <lersek@redhat.com>, <james.morse@arm.com>,
        <gengdongjiu@huawei.com>, <mtosatti@redhat.com>, <rth@twiddle.net>,
        <ehabkost@redhat.com>, <zhengxiang9@huawei.com>,
        <jonathan.cameron@huawei.com>, <xuwei5@huawei.com>,
        <kvm@vger.kernel.org>, <qemu-devel@nongnu.org>,
        <qemu-arm@nongnu.org>, <linuxarm@huawei.com>
Subject: [PATCH v17 04/10] acpi: add build_append_ghes_generic_data() helper for Generic Error Data Entry
Date:   Tue, 14 May 2019 04:18:17 -0700
Message-ID: <1557832703-42620-5-git-send-email-gengdongjiu@huawei.com>
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
X-TUID: ukLWiL1OVWni

It will help to add Generic Error Data Entry to ACPI tables
without using packed C structures and avoid endianness
issues as API doesn't need explicit conversion.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
 hw/acpi/aml-build.c         | 32 ++++++++++++++++++++++++++++++++
 include/hw/acpi/aml-build.h |  6 ++++++
 2 files changed, 38 insertions(+)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index fb53f21..102a288 100644
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
index 90c8ef8..a71db2f 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -419,6 +419,12 @@ void build_append_ghes_notify(GArray *table, const uint8_t type,
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
