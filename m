Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 497A5F436BB
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Apr 2026 16:44:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wDmIX-0003UM-GJ; Fri, 17 Apr 2026 12:44:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wDmI4-0003OF-SE
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 12:43:38 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wDmI1-0004ry-Jz
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 12:43:35 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-488a88aeec9so13473285e9.2
 for <qemu-arm@nongnu.org>; Fri, 17 Apr 2026 09:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776444212; x=1777049012; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CoM5YIgDCI4LaK2PcP9hwlCuHqwwsV6FnJoskoTZop4=;
 b=L1DEPqMMO8PA+XCP4exq6cwa66CjOcBcHoV8dcaJpW6IheqPNqQoOgNRyI/QJQ97Rb
 EyGbhCu6uinFuw3uFxUwLaRriO/Iaby0d1LWz3l8F4/LyJuElG9t1SNroSJ4MTc4YcPU
 npM1ywheVtOZF92ZDwY6BHxGZBNx0GpOicPqxDs6ZYdL0KKXEgAyatP1+mnaHVreRG3A
 Qkvr4RsU47lB55jmJAWplSRapSs+pAcLzAeABn01zg4YvPqQBDSD+PoyBKuktZb6I86V
 5r13ohkPY3G3IJs12oH8Oac1PA/6tuJ+W38KhgtedXuWIW1sKqKvDrLS9ocF1aVTHFry
 KvNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776444212; x=1777049012;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CoM5YIgDCI4LaK2PcP9hwlCuHqwwsV6FnJoskoTZop4=;
 b=Wh3qkt7kXwJKiMXFH38M29j6grbHhoE8lN4XER5N51ngnc2NttZ5FbfReK4RPJiHLa
 ola/ftLL51F7hOd2LYQTgrEjE5CPKxZieFdqqU+5I5rxT8tgj7AHemiGB2AWDMZbtamn
 ckEOySKsfFwn2fwSCR8fMCzANlxmlOd0UKeI/0H5ZbxJMR0NCe2etnUcHh9lHlmUQ3Z0
 jI1tGVHZ4YRI1uQn/066uqNDhI0N+WAcrC2qR8tKiwonJ46dkLMCIXhitjbZu8lUZCc0
 VNmIIGXn+EBX+r0I1kkxvJVkiTsNaprdVNeYfyG8DODTUdO0rZWCC++Jfmk74v4gbqZP
 RC8Q==
X-Gm-Message-State: AOJu0YyfToAhik6OEWSZPKLOUSWnQz8OPg56k5ua0mIDWzRl5kjamyNR
 086ATSsoneAHNWtJQuVJMrk/P3ekj82Il1SsymH63BiVwAoJwYQxg4MGiRdTsAuL7JI=
X-Gm-Gg: AeBDiesjmcP8kGfovaohl1ovYpjEpPUUGUXCCt0y1J4sAXhdEVenuYG2pQu/FQOEHR2
 U2SM5bofa+FuubLgnlmm0YM3WOa/8WA5uLHLU6l42njBoRMRBKwjXXP8K9TKagqHSUunpmwuD8o
 XK0Z6RTjmLUe7Uun2953iQ9QuL0zMG1C2O9JylwMtsBta/ATw94Hq9s991Ov4A5wOiuuF5YA1n7
 gsahwaKXxR4QAmsA1qs7M54lp3SiyBE9Abpj7Obx1iVJ7QF3CDPXOkh5h1IgStRpl6wZifj8PZG
 Ki6bGHRS1vLodc69hUzN2rJKLAbO/cH8WCSUrQ99+cIRg/AE7axLfqHhUVNMZeITQHXwLejn3wc
 Bw4NeBFsfloYoUd7a+7jLsiR2/TL1BWzooLlfzdvQzqoExhGQyXAj+xSi14q3r1jRACGJ1HPHSu
 fZwaN2XYfg/r/VP9c0DlOhpUBJsXhueSHlIQ==
X-Received: by 2002:a05:600c:c089:b0:487:1fc:14f9 with SMTP id
 5b1f17b1804b1-488fb771576mr37520525e9.15.1776444211998; 
 Fri, 17 Apr 2026 09:43:31 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb794e26sm29177745e9.6.2026.04.17.09.43.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 09:43:30 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B459A5F9CE;
 Fri, 17 Apr 2026 17:43:28 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 3/7] tests/tcg: convert aarch64 asid2 test to use sysreg
 helpers
Date: Fri, 17 Apr 2026 17:43:23 +0100
Message-ID: <20260417164328.1009132-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260417164328.1009132-1-alex.bennee@linaro.org>
References: <20260417164328.1009132-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

While we are at it we can reduce the number of temporary variables
needed and fix a format string error.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/aarch64/system/asid2.c | 35 ++++++++++++++------------------
 1 file changed, 15 insertions(+), 20 deletions(-)

diff --git a/tests/tcg/aarch64/system/asid2.c b/tests/tcg/aarch64/system/asid2.c
index 7d5466af34a..8c93024b858 100644
--- a/tests/tcg/aarch64/system/asid2.c
+++ b/tests/tcg/aarch64/system/asid2.c
@@ -9,10 +9,11 @@
 
 #include <stdint.h>
 #include <minilib.h>
+#include "sysregs.h"
 
-#define ID_AA64MMFR3_EL1 "S3_0_C0_C7_3"
-#define ID_AA64MMFR4_EL1 "S3_0_C0_C7_4"
-#define TCR2_EL1 "S3_0_C2_C0_3"
+#define ID_AA64MMFR3_EL1 S3_0_C0_C7_3
+#define ID_AA64MMFR4_EL1 S3_0_C0_C7_4
+#define TCR2_EL1 S3_0_C2_C0_3
 
 int main()
 {
@@ -23,7 +24,7 @@ int main()
      * not enabled and read as the written value if A2 is enabled.
      */
 
-    uint64_t out;
+    uint64_t read_tcr2;
     uint64_t idreg3;
     uint64_t idreg4;
     int tcr2_present;
@@ -31,11 +32,8 @@ int main()
 
     /* Mask is FNG1, FNG0, and A2 */
     const uint64_t feature_mask = (1ULL << 18 | 1ULL << 17 | 1ULL << 16);
-    const uint64_t in = feature_mask;
-
-    asm("mrs %[idreg3], " ID_AA64MMFR3_EL1 "\n\t"
-        : [idreg3] "=r" (idreg3));
 
+    idreg3 = read_sysreg(ID_AA64MMFR3_EL1);
     tcr2_present = ((idreg3 & 0xF) != 0);
 
     if (!tcr2_present) {
@@ -43,33 +41,30 @@ int main()
         return 0;
     }
 
-    asm("mrs %[idreg4], " ID_AA64MMFR4_EL1 "\n\t"
-        : [idreg4] "=r" (idreg4));
-
+    idreg4 = read_sysreg(ID_AA64MMFR4_EL1);
     asid2_present = ((idreg4 & 0xF00) != 0);
 
-    asm("msr " TCR2_EL1 ", %[x0]\n\t"
-        "mrs %[x1], " TCR2_EL1 "\n\t"
-        : [x1] "=r" (out)
-        : [x0] "r" (in));
+    /* write the feature mask and read back */
+    write_sysreg(feature_mask, TCR2_EL1);
+    read_tcr2 = read_sysreg(TCR2_EL1);
 
     if (asid2_present) {
-        if ((out & feature_mask) == in) {
+        if ((read_tcr2 & feature_mask) == feature_mask) {
             ml_printf("OK\n");
             return 0;
         } else {
             ml_printf("FAIL: ASID2 present, but read value %lx != "
                       "written value %lx\n",
-                      out & feature_mask, in);
+                      read_tcr2 & feature_mask, feature_mask);
             return 1;
         }
     } else {
-        if (out == 0) {
+        if (read_tcr2 == 0) {
             ml_printf("TCR2_EL1 reads as RES0 as expected\n");
             return 0;
         } else {
-            ml_printf("FAIL: ASID2, missing but read value %lx != 0\n",
-                      out & feature_mask, in);
+            ml_printf("FAIL: ASID2, missing but read value %lx != %lx\n",
+                      read_tcr2 & feature_mask, feature_mask);
             return 1;
         }
     }
-- 
2.47.3


