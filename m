Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp567581lfm;
        Fri, 10 Apr 2020 04:45:34 -0700 (PDT)
X-Google-Smtp-Source: APiQypLZxd3moVDMa0li8CWXzyhcDks7Qnpf8lTQHivy683fplzDTGFdiYAGEI/VL5RWOD1KnM/S
X-Received: by 2002:a0c:8444:: with SMTP id l62mr4819439qva.239.1586519133938;
        Fri, 10 Apr 2020 04:45:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586519133; cv=none;
        d=google.com; s=arc-20160816;
        b=J4xtkHQZqxCfBxheR7Un+T+FkBnaczRQa08B0stKj+A9voVJGy0GRqtT8p0kHfpEno
         6Q9TmPTOI5VEQysAbCLXJSRHtzc8j9tfNa26Jvq3m2mWj5kWxxpWMu0I7/4ujXQ+Z+mh
         M25VhxnRvzRc7XSo3cSPpVjMZwAznC454ek6kwvedD6p6H0YPu4gfbNkh4K1cX6ANyfE
         7ouRFhAxGcSqXct9mZsFcvKWGz9Un6sP5rEr0RyKK6gWjcY3Tv6t1/P1KhICxHt5NIVX
         6WyAhXB1rUVht2dj4HURfmEpAMihKe/Szt5ezNIYojAX/eIZhkeJ/BNf6dqArtdur8L3
         3keQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=gmMrANRZXrCtP5TjMxvr9yigv7k5Dp9jiMWmIgbu/ng=;
        b=CPHPdRKcZ9y/Bgof+XTuI4JGS0ut6J4+287HbZQ0TZR/wUbc6CsiXKvo5vJZzIMcpi
         4NA+A47OtQCIkGHBmQXK4qQVB0YCZ7R0a+oDV+ANSN3+pOSCuw0iFrclkcfd2ERsRilV
         6CHaXJa3ekvNbkNFscPNqos/ofWbmICGaAhMzPoMDqRczCAgSSBj/ilyr7wIlOSTV8cr
         3ii1IRwdk8ym1jbxggKZ2R8CoiooLXtkTY5QhO/+2vhLMCq3nds+Zf8AO5F8xdJf/bRZ
         Zwb6/PEA/xA6K84ITXICjXxo5UGfZ7pQm/iCZ+e0wiOpR6+eVhIqlnc5MMpthSgxYCaV
         e66g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id w7si879148qvf.49.2020.04.10.04.45.33;
        Fri, 10 Apr 2020 04:45:33 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726626AbgDJLpc (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Fri, 10 Apr 2020 07:45:32 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:52028 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726111AbgDJLpb (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 10 Apr 2020 07:45:31 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 51EEFEFCBB7CCB18A091;
        Fri, 10 Apr 2020 19:45:27 +0800 (CST)
Received: from huawei.com (10.151.151.243) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Fri, 10 Apr 2020
 19:45:17 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <imammedo@redhat.com>, <mst@redhat.com>,
        <xiaoguangrong.eric@gmail.com>, <peter.maydell@linaro.org>,
        <shannon.zhaosl@gmail.com>, <fam@euphon.net>, <rth@twiddle.net>,
        <ehabkost@redhat.com>, <mtosatti@redhat.com>,
        <qemu-devel@nongnu.org>, <kvm@vger.kernel.org>,
        <qemu-arm@nongnu.org>, <pbonzini@redhat.com>
CC:     <gengdongjiu@huawei.com>, <zhengxiang9@huawei.com>,
        <Jonathan.Cameron@huawei.com>, <linuxarm@huawei.com>
Subject: [PATCH v25 01/10] acpi: nvdimm: change NVDIMM_UUID_LE to a common macro
Date:   Fri, 10 Apr 2020 19:46:30 +0800
Message-ID: <20200410114639.32844-2-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.18.0.huawei.25
In-Reply-To: <20200410114639.32844-1-gengdongjiu@huawei.com>
References: <20200410114639.32844-1-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.151.151.243]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: ib4zqILhfUoV

The little end UUID is used in many places, so make
NVDIMM_UUID_LE to a common macro to convert the UUID
to a little end array.

Reviewed-by: Xiang Zheng <zhengxiang9@huawei.com>
Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
 hw/acpi/nvdimm.c    | 10 +++-------
 include/qemu/uuid.h |  9 +++++++++
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
index eb6a37b..a747c63 100644
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
index 129c45f..c55541b 100644
--- a/include/qemu/uuid.h
+++ b/include/qemu/uuid.h
@@ -34,6 +34,15 @@ typedef struct {
     };
 } QemuUUID;
 
+/**
+ * convert UUID to little-endian array
+ * The input parameter is the member of  UUID
+ */
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
