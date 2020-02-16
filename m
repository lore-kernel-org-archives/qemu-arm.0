Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3917673lfp;
        Sun, 16 Feb 2020 02:22:12 -0800 (PST)
X-Google-Smtp-Source: APXvYqygqRUPKoWs42o1zNoFdS8baQ/0KxOw5m3lU4gZE1FZrkVveb28wPTYJyIi/WN+drfrw/pL
X-Received: by 2002:a9d:6544:: with SMTP id q4mr8099531otl.269.1581848531928;
        Sun, 16 Feb 2020 02:22:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581848531; cv=none;
        d=google.com; s=arc-20160816;
        b=oKZp6uYqdN6Blm/CmjWXN3wsMK8DabK2GyN/uGU+YTy1FaORgP2oM+PXlEhP2RpBlb
         6WNzCeqxZXiEmreFCLz6JEil9RnN+eshX/2PJoTNLsQx3LMGxe8ujSLnDI4FIj9R7mKB
         XspsAnDK7XVl9UCskjhh1tkktJRn9VC3jBmICgyDzBn45LAF1NOhWgcauwIi1oX9qKBy
         s7m7SRngTZW4XwPW1jA3w6h4J81EoxQIuumtdm1AumXOpq2hqyRbZqBcBXH5bAqi1/Mo
         ttcdK7xG6fmQTGIkqWRRIqrLBAPf16HxrTb3WINCzsgJ5dEdyhF8BKaJBlsWcjecEqyI
         3SWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:message-id:date:subject:cc
         :to:from;
        bh=l4Wm86eOYTUyxbo20YvBJuytJaMnkjwkRZM0qqMmTPw=;
        b=hvxhi6IbkVtqC4OwAs5rQFiI2FP3RWmiyQ3xkDRymfn1ZA4eKlgOcZ1vfqRWvlSwP0
         9ltwnMTVI27VBzd0yFlHTa/LQhwDGVhSrEIPPE3hyAc5f3W7Hu1SL/FEvbnc5G2NZ+61
         doWT7vFUecLdbZwdQ7CaoBojcIeqpwd2KFfL9wSituw5gRR/PDidl2+byL6uBHEfCzUD
         JluwLBoEfFW41ZDCSs0W3toHKNmXxgNFa10AUGGMRNrras4RLICw9abTKL+a2RNN2VmB
         MG5Pz+e7rS7lRla8Moh662IEm+88AaoP3vmSzVGZvkogZEYvvAj21HBHviHkm0IWSmIx
         bHiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id z18si5546068otq.121.2020.02.16.02.22.11;
        Sun, 16 Feb 2020 02:22:11 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbgBPKV6 (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Sun, 16 Feb 2020 05:21:58 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:10182 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726116AbgBPKV6 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Sun, 16 Feb 2020 05:21:58 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 163D2AA470891E543A32;
        Sun, 16 Feb 2020 18:21:52 +0800 (CST)
Received: from huawei.com (10.151.151.243) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.439.0; Sun, 16 Feb 2020
 18:21:45 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <mst@redhat.com>, <imammedo@redhat.com>,
        <xiaoguangrong.eric@gmail.com>, <shannon.zhaosl@gmail.com>,
        <peter.maydell@linaro.org>, <fam@euphon.net>, <rth@twiddle.net>,
        <ehabkost@redhat.com>, <mtosatti@redhat.com>,
        <qemu-devel@nongnu.org>, <kvm@vger.kernel.org>,
        <qemu-arm@nongnu.org>, <pbonzini@redhat.com>,
        <james.morse@arm.com>, <lersek@redhat.com>,
        <jonathan.cameron@huawei.com>,
        <shameerali.kolothum.thodi@huawei.com>
CC:     <gengdongjiu@huawei.com>, <zhengxiang9@huawei.com>
Subject: [PATCH v1] acpi: nvdimm: change NVDIMM_UUID_LE to a common macro
Date:   Sun, 16 Feb 2020 18:23:58 +0800
Message-ID: <20200216102408.22987-1-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.18.0.huawei.25
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.151.151.243]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: gA4fK4TVLGXF

The little end UUID is used in many places, so make
NVDIMM_UUID_LE to a common macro to convert the UUID
to a little end array.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
Reviewed-by: Xiang Zheng <zhengxiang9@huawei.com>
---
 hw/acpi/nvdimm.c    | 8 ++------
 include/qemu/uuid.h | 5 +++++
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
index 9fdad6d..232b701 100644
--- a/hw/acpi/nvdimm.c
+++ b/hw/acpi/nvdimm.c
@@ -27,6 +27,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/uuid.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/aml-build.h"
 #include "hw/acpi/bios-linker-loader.h"
@@ -60,17 +61,12 @@ static GSList *nvdimm_get_device_list(void)
     return list;
 }
 
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
+      UUID_LE(0x66f0d379, 0xb4f3, 0x4074, 0xac, 0x43, 0x0d, 0x33,
                      0x18, 0xb7, 0x8c, 0xdb);
 
 /*
diff --git a/include/qemu/uuid.h b/include/qemu/uuid.h
index 129c45f..bd38af5 100644
--- a/include/qemu/uuid.h
+++ b/include/qemu/uuid.h
@@ -34,6 +34,11 @@ typedef struct {
     };
 } QemuUUID;
 
+#define UUID_LE(a, b, c, d0, d1, d2, d3, d4, d5, d6, d7)             \
+  { (a) & 0xff, ((a) >> 8) & 0xff, ((a) >> 16) & 0xff, ((a) >> 24) & 0xff, \
+     (b) & 0xff, ((b) >> 8) & 0xff, (c) & 0xff, ((c) >> 8) & 0xff,          \
+     (d0), (d1), (d2), (d3), (d4), (d5), (d6), (d7) }
+
 #define UUID_FMT "%02hhx%02hhx%02hhx%02hhx-" \
                  "%02hhx%02hhx-%02hhx%02hhx-" \
                  "%02hhx%02hhx-" \
-- 
1.8.3.1
