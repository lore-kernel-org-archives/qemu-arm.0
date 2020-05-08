Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2521538lfb;
        Thu, 7 May 2020 19:17:53 -0700 (PDT)
X-Google-Smtp-Source: APiQypIatX7m9FObREcQk5hGTUlZV1uGKd8Hhad973dhhMrSqeSnPCMMJMP9AtRmr6O41rtjR6Ne
X-Received: by 2002:a50:8b42:: with SMTP id l60mr295399edl.55.1588904272941;
        Thu, 07 May 2020 19:17:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588904272; cv=none;
        d=google.com; s=arc-20160816;
        b=KQR/b3N2336iSMgwOnoXDYLOutuWgZCWTwaPK/0u8lqWfLMIU8O5Q+QYMmbJrELnaq
         yxCN83cgQl/LYXCySN0Ja3UVnH8lQcQRWdb4MY+3frRgYI38PIixJlqiIQbxl4Al5m0H
         664GgH23NMOMv3a6x3dFvao4sf3E/JvtACPB71s0mhlW7E9d/kyjuawxLIknFpo/S81m
         G26NRSABi87Z+1D7FKJQNiPFRwlCczn3D8UprQlgF9okfZ8caJooLJt9Q+uGXTeE5A/K
         kG3OFqjB6usHQka2GJjS0xK4K799k0CdIQqxzzRgxXEJ/RAP1mw8F1wlLh/DL4K5Cp78
         FhnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=+NrsFRkaV14TWrOWDAwx6NygpFySVhKg7ieQpXgSzvU=;
        b=TrE0Og6wkl34Yw7M0roQQCMmHNYCspszwBYnDq4yRNlULTiu1lJD6KU4EwIkUT1UhE
         6Lc4zyCeaniiIoxrbWZcLSaOpcQvOYOfgtpprFGbebTcrvqPCYbYLKVwQIEjbpUEMKDX
         T3GyBx8hABSn3ws1WWL/EefCguSRNxMgggCxO+6LQ+MCfjMVT7b0ok2mALXKpR1ZAymx
         yVtQJyPWAfgGPwrhMh9cKF8Tqdn9weM1IToBf90FJcVPFr0ccyZ1bifrYzO40LuD9AzL
         iWF+ymsDOZ7ot++qhrRcVEonyV6eN9LfoxO+03lV0PoUfiaSt6NsZvDj46HV9plsnpUL
         rsnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id g24si124136ejb.433.2020.05.07.19.17.52;
        Thu, 07 May 2020 19:17:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727086AbgEHCRw (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Thu, 7 May 2020 22:17:52 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4343 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726930AbgEHCRv (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 7 May 2020 22:17:51 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 4C25BBB27AEB7C00B24F;
        Fri,  8 May 2020 10:17:46 +0800 (CST)
Received: from huawei.com (10.151.151.243) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Fri, 8 May 2020
 10:17:36 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <imammedo@redhat.com>, <mst@redhat.com>,
        <xiaoguangrong.eric@gmail.com>, <peter.maydell@linaro.org>,
        <shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>,
        <fam@euphon.net>, <rth@twiddle.net>, <ehabkost@redhat.com>,
        <mtosatti@redhat.com>, <qemu-devel@nongnu.org>,
        <kvm@vger.kernel.org>, <qemu-arm@nongnu.org>
CC:     <gengdongjiu@huawei.com>, <zhengxiang9@huawei.com>,
        <Jonathan.Cameron@huawei.com>, <linuxarm@huawei.com>
Subject: [PATCH RESEND v26 01/10] acpi: nvdimm: change NVDIMM_UUID_LE to a common macro
Date:   Fri, 8 May 2020 10:19:21 +0800
Message-ID: <20200508021930.37955-2-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200508021930.37955-1-gengdongjiu@huawei.com>
References: <20200508021930.37955-1-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.151.151.243]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: pgcaSAdD7wkW

The little end UUID is used in many places, so make
NVDIMM_UUID_LE to a common macro to convert the UUID
to a little end array.

Reviewed-by: Xiang Zheng <zhengxiang9@huawei.com>
Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
Change since v25:
1. Address Peter's comments to add a proper doc-comment comment for
   UUID_LE macros.
---
 hw/acpi/nvdimm.c    | 10 +++-------
 include/qemu/uuid.h | 27 +++++++++++++++++++++++++++
 2 files changed, 30 insertions(+), 7 deletions(-)

diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
index fa7bf8b..9316d12 100644
--- a/hw/acpi/nvdimm.c
+++ b/hw/acpi/nvdimm.c
@@ -27,6 +27,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/uuid.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/aml-build.h"
 #include "hw/acpi/bios-linker-loader.h"
@@ -34,18 +35,13 @@
 #include "hw/mem/nvdimm.h"
 #include "qemu/nvdimm-utils.h"
 
-#define NVDIMM_UUID_LE(a, b, c, d0, d1, d2, d3, d4, d5, d6, d7)             \
-   { (a) & 0xff, ((a) >> 8) & 0xff, ((a) >> 16) & 0xff, ((a) >> 24) & 0xff, \
-     (b) & 0xff, ((b) >> 8) & 0xff, (c) & 0xff, ((c) >> 8) & 0xff,          \
-     (d0), (d1), (d2), (d3), (d4), (d5), (d6), (d7) }
-
 /*
  * define Byte Addressable Persistent Memory (PM) Region according to
  * ACPI 6.0: 5.2.25.1 System Physical Address Range Structure.
  */
 static const uint8_t nvdimm_nfit_spa_uuid[] =
-      NVDIMM_UUID_LE(0x66f0d379, 0xb4f3, 0x4074, 0xac, 0x43, 0x0d, 0x33,
-                     0x18, 0xb7, 0x8c, 0xdb);
+      UUID_LE(0x66f0d379, 0xb4f3, 0x4074, 0xac, 0x43, 0x0d, 0x33,
+              0x18, 0xb7, 0x8c, 0xdb);
 
 /*
  * NVDIMM Firmware Interface Table
diff --git a/include/qemu/uuid.h b/include/qemu/uuid.h
index 129c45f..9925feb 100644
--- a/include/qemu/uuid.h
+++ b/include/qemu/uuid.h
@@ -34,6 +34,33 @@ typedef struct {
     };
 } QemuUUID;
 
+/**
+ * UUID_LE - converts the fields of UUID to little-endian array,
+ * each of parameters is the filed of UUID.
+ *
+ * @time_low: The low field of the timestamp
+ * @time_mid: The middle field of the timestamp
+ * @time_hi_and_version: The high field of the timestamp
+ *                       multiplexed with the version number
+ * @clock_seq_hi_and_reserved: The high field of the clock
+ *                             sequence multiplexed with the variant
+ * @clock_seq_low: The low field of the clock sequence
+ * @node0: The spatially unique node0 identifier
+ * @node1: The spatially unique node1 identifier
+ * @node2: The spatially unique node2 identifier
+ * @node3: The spatially unique node3 identifier
+ * @node4: The spatially unique node4 identifier
+ * @node5: The spatially unique node5 identifier
+ */
+#define UUID_LE(time_low, time_mid, time_hi_and_version,                    \
+  clock_seq_hi_and_reserved, clock_seq_low, node0, node1, node2,            \
+  node3, node4, node5)                                                      \
+  { (time_low) & 0xff, ((time_low) >> 8) & 0xff, ((time_low) >> 16) & 0xff, \
+    ((time_low) >> 24) & 0xff, (time_mid) & 0xff, ((time_mid) >> 8) & 0xff, \
+    (time_hi_and_version) & 0xff, ((time_hi_and_version) >> 8) & 0xff,      \
+    (clock_seq_hi_and_reserved), (clock_seq_low), (node0), (node1), (node2),\
+    (node3), (node4), (node5) }
+
 #define UUID_FMT "%02hhx%02hhx%02hhx%02hhx-" \
                  "%02hhx%02hhx-%02hhx%02hhx-" \
                  "%02hhx%02hhx-" \
-- 
1.8.3.1
