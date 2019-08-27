Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp5001113wrs;
        Tue, 27 Aug 2019 02:42:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzpEuOvzwzKumT7zu/p0bEocuEDHjkcYpV2YL0AM/U/RgF9MOXpsd0oBSH+4mr2oK6YI2s6
X-Received: by 2002:aed:2c84:: with SMTP id g4mr22431389qtd.344.1566898944876;
        Tue, 27 Aug 2019 02:42:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566898944; cv=none;
        d=google.com; s=arc-20160816;
        b=XstRxxdRRiRMQVbYiPvoMpbwuYNJpcm+bckNGcwb5AufijhsyiWke8C07lM1haFNap
         C8bT+GX0cp5vK8E6rRyCdhJ8a2U9RUJjGmEJvnSCeHUwfzmpNwwvkOHvrtQjUIPCdJAM
         23Ko3YonJqhhM665wX+GbL+QqOb7XdzN3dTowz5i+2bKOsUy2iXIWPJKopWOWCczs00B
         ASuYE2KTvTy19E+OiovWc+ANBs8qHXuLiDCiB05zwjmiWp0ZaPR6NRuX9EaVh6xvTqQi
         DNLY4AdfdZkfx7irzGtAu0FCyHF7ubIkM+zkRXNeucTJcMqWKJJy4xjKXca59Oo6/E97
         arqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from;
        bh=49ebX+rPBR3QOfAbGpxK4VrZcDSi5NkbEnjkgnslt/s=;
        b=j+nX2q5588Dec5K/ukk9xEjPCSTfZgKwAWuqfUlhQUaAyVW3bsz8pU30B7uX5jSq09
         oCY90M4ONFtBC1dKhLNHVeJ0hrcX6P2wPu/ZhNxJjX8YhlC3Y041Ce+fInHDmbodkVu5
         WEIz0xTgqPzCDP5awxHCijeGl43rGf/918H/f8aKPb3V7RVDkeFG8pleNB7FLtTeggaP
         pCc+cffHFPyzDzMy3a+dm1tCOLDd7YotwmY6/J10JCzKZCaTHzoZhZvCQe464UZlo1WZ
         fb32hL/U7sG/K+jkRepQiq0bg2LY9yDmCSIi2L0mN9MJPkbAk4NSTkky94Bxre0Wg9zS
         Au/w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 44si10380364qtv.162.2019.08.27.02.42.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Aug 2019 02:42:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i2Xzc-0005YD-Az
	for alex.bennee@linaro.org; Tue, 27 Aug 2019 05:42:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50962)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gengdongjiu@huawei.com>) id 1i2XzR-0005VL-CE
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 05:42:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <gengdongjiu@huawei.com>) id 1i2XzQ-0005kt-7j
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 05:42:13 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2256 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
 id 1i2XzP-0005gF-Tz; Tue, 27 Aug 2019 05:42:12 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id B140040871412A3A6220;
 Tue, 27 Aug 2019 17:42:03 +0800 (CST)
Received: from localhost.localdomain (10.151.151.249) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.439.0; Tue, 27 Aug 2019 17:41:56 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>, <gengdongjiu@huawei.com>, <linuxarm@huawei.com>
Date: Tue, 27 Aug 2019 17:41:55 +0800
Message-ID: <1566898915-3129-1-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.151.151.249]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.191
Subject: [Qemu-arm] [PATCH] hw/arm/boot: Load the Non Linux initrd to the
 memory
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SsOB190wbhgQ

Except support linux operation system, qemu also supports other
operation system which is non linux, such as microkernel system.

But now Qemu only load linux initrd, so change it to load both
linux and Non-linux initrd Image.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com> 
---
 hw/arm/boot.c | 45 +++++++++++++++++++++++----------------------
 1 file changed, 23 insertions(+), 22 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index a830655e1a..2e6c17975a 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -1056,30 +1056,31 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
         exit(1);
     }
     info->entry = entry;
-    if (is_linux) {
-        uint32_t fixupcontext[FIXUP_MAX];
 
-        if (info->initrd_filename) {
-            initrd_size = load_ramdisk_as(info->initrd_filename,
-                                          info->initrd_start,
-                                          info->ram_size - info->initrd_start,
-                                          as);
-            if (initrd_size < 0) {
-                initrd_size = load_image_targphys_as(info->initrd_filename,
-                                                     info->initrd_start,
-                                                     info->ram_size -
-                                                     info->initrd_start,
-                                                     as);
-            }
-            if (initrd_size < 0) {
-                error_report("could not load initrd '%s'",
-                             info->initrd_filename);
-                exit(1);
-            }
-        } else {
-            initrd_size = 0;
+    if (info->initrd_filename) {
+        initrd_size = load_ramdisk_as(info->initrd_filename,
+                                      info->initrd_start,
+                                      info->ram_size - info->initrd_start,
+                                      as);
+        if (initrd_size < 0) {
+            initrd_size = load_image_targphys_as(info->initrd_filename,
+                                                 info->initrd_start,
+                                                 info->ram_size -
+                                                 info->initrd_start,
+                                                 as);
         }
-        info->initrd_size = initrd_size;
+        if (initrd_size < 0) {
+            error_report("could not load initrd '%s'",
+                         info->initrd_filename);
+            exit(1);
+        }
+    } else {
+        initrd_size = 0;
+    }
+    info->initrd_size = initrd_size;
+
+    if (is_linux) {
+        uint32_t fixupcontext[FIXUP_MAX];
 
         fixupcontext[FIXUP_BOARDID] = info->board_id;
         fixupcontext[FIXUP_BOARD_SETUP] = info->board_setup_addr;
-- 
2.17.1

