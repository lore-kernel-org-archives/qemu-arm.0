Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp3199277wrw;
        Thu, 8 Nov 2018 02:18:47 -0800 (PST)
X-Google-Smtp-Source: AJdET5dicPzs7CSFKpDuXa8ZnB/FB2gk5BBALmkgsSlgM8D028uKYOmQW+mKW9Bbw+NfKYCftQ29
X-Received: by 2002:a63:907:: with SMTP id 7-v6mr3279001pgj.121.1541672326975;
        Thu, 08 Nov 2018 02:18:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541672326; cv=none;
        d=google.com; s=arc-20160816;
        b=ycKnpkG83NuxWd1ZQJ4ymJzwgUVDXn6JQRXfw6/roNW+K0hvVprESqeTOSqwUW5hJ5
         TPw+OHP4fms/7+unyGYNJR6oTFp0UYZF3rIeURjG38Ec+5nn8nWXT2iXErzzfhtWgEVq
         Ub/3h5g0Lwmu0KUx8MTTNjmEN0vDMhVzFnjadVq/aYwn+08/W23WOlfcSAo1+KW0nS6D
         qIyBNolT6w4qaas79ngipC53u5bn6UlogfIyCUF5SaNYsuQvTG0Hczmm9Dx7I0LOWW5b
         QI84L4kME3FZbeu/8tOmcudE9SJHqU4n+zybNeg0mvUL+N0Sv2dnocp34jyFzPoPm8wH
         lIvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=MK4hudOr1pHlO4VX4t0JcQ+x7qwzKjyN10IBpTEDc18=;
        b=kdkd0HHl4aprsQ8PTAzEo7u9dtoDIbtd2Xk8V15AIPhm1Y+Aoc8eZMWNeQ9zdpOWNc
         6LkL1tpAiy5gi/BFVDipvHEzFN22ZhW8UlCN0Vc7a1F1I6kHsejcXcQSoKxh6Uvy1hxH
         zWY4+EvUpcDFdsCTcMdibGH1g49dCFR8IaSWCnYwUGn+hz91wTOmc8jB21EClfs9rTWr
         PbWgrVL0XNUeDIYrkcsvgUOl/TGMBsh20RkeQaRdTyebEyZj03P4vvGk9odsRn0flX9j
         /p7a2j9Nj1i73NbKmdXrFLbbCeLn0mwZin6BJcnu9MIb1YS263uuyLUFpedWfu7wQrfE
         nv7w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id v26-v6si3400052pge.101.2018.11.08.02.18.46;
        Thu, 08 Nov 2018 02:18:46 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727024AbeKHTx2 (ORCPT <rfc822;francois.ozog@linaro.org>
        + 4 others); Thu, 8 Nov 2018 14:53:28 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:14616 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726405AbeKHTx1 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 8 Nov 2018 14:53:27 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 399EBD2116A33;
        Thu,  8 Nov 2018 18:18:39 +0800 (CST)
Received: from ros.huawei.com (10.143.28.118) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.408.0; Thu, 8 Nov 2018 18:18:33 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <imammedo@redhat.com>, <mst@redhat.com>,
        <peter.maydell@linaro.org>, <pbonzini@redhat.com>,
        <mtosatti@redhat.com>, <rth@twiddle.net>, <ehabkost@redhat.com>,
        <kvm@vger.kernel.org>, <shannon.zhaosl@gmail.com>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
        <gengdongjiu@huawei.com>
Subject: [PATCH v15 02/10] acpi: add build_append_ghes_notify() helper for Hardware Error Notification
Date:   Thu, 8 Nov 2018 02:15:45 -0800
Message-ID: <1541672153-15529-3-git-send-email-gengdongjiu@huawei.com>
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
X-TUID: hkR/DFZeOUiV

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
