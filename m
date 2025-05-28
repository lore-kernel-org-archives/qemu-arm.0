Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp5367903njc;
        Wed, 28 May 2025 03:03:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW+t4A9mzZL0bN/0FUgMRGE/tqEHP6m1Ic536X8WNivfstPmVAtAse3aO2KZRaqQmLsC8iyG8f8Ir2SIQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHVTG0a6nO+O/bwPAGOmtkLrKoULPIf2AmnsBnrfY0ar4PxPGvObHvf6QlAaKbUPZfHukz6
X-Received: by 2002:a05:6102:4b1c:b0:4bb:e5bf:9c79 with SMTP id ada2fe7eead31-4e42418db3bmr14182984137.22.1748426604794;
        Wed, 28 May 2025 03:03:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748426604; cv=none;
        d=google.com; s=arc-20240605;
        b=fILXD6o657nBHQPLq8X4H8ndO5XnsaImvQ6fvm3JvsyoKBHHxWwXS7vPFCKARoZZ85
         TjC0gpTvh3IXzQZLWTu1Xb8lDpMPq3Jz865e+Bwh/TMh60qupxbMjLh16DGfXyP++4Aj
         5fLZovG/VawiMLkpZYvdxEdfeKscRBN/qgUVcUBePanpqwNnTPoxFfA7MtksZeSy37LV
         utyxrCZKGweCNWIC4yAJMbuv/PSEbfdWBmNi2vkJNOl/HsUysPpwOqbQgV6Q5ZFyKDEQ
         mL8VTV2ez03s4ckZUGLb7YQoGq6L/yN1j9yLS3kUQ2L8LhXIAHjOt65djz/mLCZ1DDwc
         jvkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Dxkn4qLxCfduF+Ckn9JcjV37FeKi59jt7wAnZKjHoMM=;
        fh=fWw9l+Tqx6SppQIssOIDge+vOObRQF8eTjVKG6g5YgE=;
        b=geyF2a8o3GRr6c6pOmTTssIT6icFngjEDNaGrfzghGA0hQV5Ls3lXCqO19I/6ywuJr
         QBKjlMgjTEjpato4jnK6LYlFj77uB0Pm8hcQc4sjED+xvSMwr/7wxvvYuGL8n/Y7iDzZ
         JVJAMqcsjQMBHTrp+pcpD6rcQV7I2RgA+F/SfpbnWy4YT5YglItJvnavBnwrBa8I63+L
         qVNpvVsb0HotIbuDG8vKSXGc2Bg1AvMXfrVMJFvCJcUtVS7QgG6heDVXs1gfRvhL1fzs
         BfJQXhU/ZwcZfVkxLOOLJq3famqf13nb04vv7G8raXgy7XpwsC8UFbdkIy5zUNAzaYv0
         AS4Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="J/zThksU";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-5306683f7e3si212500e0c.37.2025.05.28.03.03.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 May 2025 03:03:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="J/zThksU";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uKDcW-0008Iz-UT; Wed, 28 May 2025 06:02:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1uKDcO-0008Dp-RW
 for qemu-arm@nongnu.org; Wed, 28 May 2025 06:02:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1uKDcL-0006Y0-Ii
 for qemu-arm@nongnu.org; Wed, 28 May 2025 06:02:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748426556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dxkn4qLxCfduF+Ckn9JcjV37FeKi59jt7wAnZKjHoMM=;
 b=J/zThksUllm0SNZEBV5Lire9abyZ06gVewTWtsNCBrGiHu7Jc//y81dm/CjEHVnX4SlvRG
 2M7bcJzP3PgENyTMPbxy2r6eZH5p19C/tM7BfIeD3py4QfaXeOry4dB2FCPZShtWgK4enQ
 JZ374T/Hw7Q8wXe03A8Do7ACw4Aa96M=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-441-2Zthm1B9P2OxX2rA2hXFdQ-1; Wed,
 28 May 2025 06:01:08 -0400
X-MC-Unique: 2Zthm1B9P2OxX2rA2hXFdQ-1
X-Mimecast-MFC-AGG-ID: 2Zthm1B9P2OxX2rA2hXFdQ_1748426467
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 3ECA4180098D; Wed, 28 May 2025 10:01:07 +0000 (UTC)
Received: from gshan-thinkpadx1nanogen2.rmtau.csb (unknown [10.64.136.65])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C873919560AF; Wed, 28 May 2025 10:01:01 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Jonathan.Cameron@huawei.com,
 mchehab+huawei@kernel.org, mst@redhat.com, imammedo@redhat.com,
 anisinha@redhat.com, gengdongjiu1@gmail.com, peter.maydell@linaro.org,
 pbonzini@redhat.com, shan.gavin@gmail.com
Subject: [PATCH v2 3/3] target/arm/kvm: Support multiple memory CPERs injection
Date: Wed, 28 May 2025 20:00:33 +1000
Message-ID: <20250528100033.159576-4-gshan@redhat.com>
In-Reply-To: <20250528100033.159576-1-gshan@redhat.com>
References: <20250528100033.159576-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) DKIMWL_WL_HIGH=-2.907, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: W309aCc4h4GE

In the combination of 64KB host and 4KB guest, a problematic host page
affects 16x guest pages. In this specific case, it's reasonable to
push 16 consecutive memory CPERs. Otherwise, QEMU can run into core
dump due to the current error can't be delivered as the previous error
isn't acknoledges. It's caused by the nature the host page can be
accessed in parallel due to the mismatched host and guest page sizes.

Imporve push_ghes_memory_errors() to push 16x consecutive memory CPERs
for this specific case. The maximal error block size is bumped to 4KB,
providing enough storage space for those 16x memory CPERs.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/acpi/ghes.c   |  2 +-
 target/arm/kvm.c | 46 +++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 34ff682048..43d52f5e2e 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -33,7 +33,7 @@
 #define ACPI_HEST_ADDR_FW_CFG_FILE          "etc/acpi_table_hest_addr"
 
 /* The max size in bytes for one error block */
-#define ACPI_GHES_MAX_RAW_DATA_LENGTH   (1 * KiB)
+#define ACPI_GHES_MAX_RAW_DATA_LENGTH   (4 * KiB)
 
 /* Generic Hardware Error Source version 2 */
 #define ACPI_GHES_SOURCE_GENERIC_ERROR_V2   10
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index e31fcde797..c346bd7b49 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -11,6 +11,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include <sys/ioctl.h>
 
 #include <linux/kvm.h>
@@ -2337,10 +2338,53 @@ static void push_ghes_memory_errors(CPUState *c, AcpiGhesState *ags,
                                     uint64_t paddr)
 {
     GArray *addresses = g_array_new(false, false, sizeof(paddr));
+    uint64_t val, start, end, guest_pgsz, host_pgsz;
     int ret;
 
     kvm_cpu_synchronize_state(c);
-    g_array_append_vals(addresses, &paddr, 1);
+
+    /*
+     * Sort out the guest page size from TCR_EL1, which can be modified
+     * by the guest from time to time. So we have to sort it out dynamically.
+     */
+    ret = read_sys_reg64(c->kvm_fd, &val, ARM64_SYS_REG(3, 0, 2, 0, 2));
+    if (ret) {
+        goto error;
+    }
+
+    switch (extract64(val, 14, 2)) {
+    case 0:
+        guest_pgsz = 4 * KiB;
+        break;
+    case 1:
+        guest_pgsz = 64 * KiB;
+        break;
+    case 2:
+        guest_pgsz = 16 * KiB;
+        break;
+    default:
+        error_report("unknown page size from TCR_EL1 (0x%" PRIx64 ")", val);
+        goto error;
+    }
+
+    host_pgsz = qemu_real_host_page_size();
+    start = paddr & ~(host_pgsz - 1);
+    end = start + host_pgsz;
+    while (start < end) {
+        /*
+         * The precise physical address is provided for the affected
+         * guest page that contains @paddr. Otherwise, the starting
+         * address of the guest page is provided.
+         */
+        if (paddr >= start && paddr < (start + guest_pgsz)) {
+            g_array_append_vals(addresses, &paddr, 1);
+        } else {
+            g_array_append_vals(addresses, &start, 1);
+        }
+
+        start += guest_pgsz;
+    }
+
     ret = acpi_ghes_memory_errors(ags, ACPI_HEST_SRC_ID_SYNC, addresses);
     if (ret) {
         goto error;
-- 
2.49.0

