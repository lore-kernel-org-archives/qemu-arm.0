Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD9AF8A15E
	for <qemu-arm@archiver.kernel.org>; Thu, 16 Apr 2026 11:13:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wDKeZ-0005rS-KO; Thu, 16 Apr 2026 07:12:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wDKeX-0005po-Sv
 for qemu-arm@nongnu.org; Thu, 16 Apr 2026 07:12:58 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wDKeV-0004C5-L9
 for qemu-arm@nongnu.org; Thu, 16 Apr 2026 07:12:57 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-488b3f8fa2bso5020765e9.1
 for <qemu-arm@nongnu.org>; Thu, 16 Apr 2026 04:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776337974; x=1776942774; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hHF4jmysHEoMGaoQmGTkv09M59NSp+KdqlbbYIyd3Sw=;
 b=PjUwGKPuZ8OSHZ9U/+cjcC0ianTNOYVmM5h233Ngnaiaqrm6Nz5t6OQsXvN88Hq4YT
 ayEO5c5K1Uw0lZz/ioxf2PKupmZkw5hQv5UmFTBAgZqXrb7eKHvh8Uy/Y/dyswyuMb13
 R29Cxko8SS+184QUwqFrq8YUkZ7J0YL7akRmu4uasoQHDZV8W+WESK3c8SArgP3CiNjH
 c57QyfyH76cskO6q2imkrQ3u75ToRAYTBZHHS2bijxW505KkrEnjCpL2b6MCC74tfc60
 gaR0wnXCwsxfhAGQuYiontZa9T9bGX0J7hHKhTN2jKP/6svGW275cuRkf6ZN73EtTxja
 nMqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776337974; x=1776942774;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hHF4jmysHEoMGaoQmGTkv09M59NSp+KdqlbbYIyd3Sw=;
 b=dOPyec++JQWYaBj9weV97Go/LQHf0yNLgWif2BxWzAcCM7wjY5XDR8Q9kG3rx34W4a
 Q7bDL3x1xeRd81iF/HNhGHSWGdRqXOK2SMSf+R4oAitH+kpkoSAhyhQbliQB2r1UYx2i
 OT0yJkOPY+1J+SrKM/yGu5JRE1uuRxDzOnEf4JOXLg95/inud3e9Wt1r0wAsWdGIrsWi
 xXmVnH59cp1VMw47MARpl/Hm+b8JX5gk74iPT7aQJkvFbCiLt00Q3FB8oGCHUfzmCahd
 +xnGkoOVefGpaznZYfkMp4l4gxz7osNB27d1KK2Z3g62twUDX8DcVIKO4LgkMJpLdOAQ
 QYMA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/xDQC40RWOp7lJJI31xpXdxlrvpspyEIgoJEDhRHBDvFoOP409zv/WcAtWpMAEoAvCGIJ/g4qJxQ==@nongnu.org
X-Gm-Message-State: AOJu0YzXrWR5PGjnn3HVu/ivNypEJ5Gf3cCCydxmWEHy0Ssvcxv6kWfX
 Ia3VFfYTVUNA3NDDywhvTuGqplYqMGq4xHWRxa9J8gyPzp5+ZcuBigm+t0dk61wKmvk=
X-Gm-Gg: AeBDiesNPgcNxYXOyj+NyuCfRjA+VXj8wqVWJhlXsnOsC5tP6eaI0L7GL9oyJ2cF7+5
 mESaI0td0OACOAsXOCrtOmfvBiqUw3ehAGB0Pn6WWm9ubc5PFo2BLImHwjSXoXFMgUezRuS6U0b
 JUqLGwsdOQOdVFqDGcoJByoyaEkINay+2SiPHerjfoFxDYv1x17m1LDkDsVeaVqrtJin/fRKKUq
 9b5KbqDwEolKMNCHFAOLLASpPFBzgha6dOWrpDISHmwAHNQaC3/WFRjaoXqXiFXzYMIpsoJmwIA
 UKGkjMEJZJgrHV+YW7di6EQl3gsWBLru/nOtTvcihoajpGiyR8wspZ01suxlozIk+m+jJeiv4F6
 xf/63X1y2Bu7Z4lawsnyuKVZ3C9gbvi5Lcn+HuKPDwrJj3HmBfhT9h/s6PuSeP5b0DQ1QDnxBIU
 ymjjvlOACDVzUESc2o1K3rJ3l6u+l1xPTqumIY
X-Received: by 2002:a05:600c:a101:b0:488:9ec1:4976 with SMTP id
 5b1f17b1804b1-488f45c6406mr34888935e9.8.1776337973763; 
 Thu, 16 Apr 2026 04:12:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a10:d582:31e:0:8f74:d82:f9ec:90cd])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43ead2decafsm11513078f8f.0.2026.04.16.04.12.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2026 04:12:53 -0700 (PDT)
From: Jim MacArthur <jim.macarthur@linaro.org>
Date: Thu, 16 Apr 2026 12:12:40 +0100
Subject: [PATCH 3/3] tests/tcg/aarch64/system/rme_gdi.c: Very basic test of GDI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-jmac-feat_rme_gdi-v1-3-d9fa0781ed58@linaro.org>
References: <20260416-jmac-feat_rme_gdi-v1-0-d9fa0781ed58@linaro.org>
In-Reply-To: <20260416-jmac-feat_rme_gdi-v1-0-d9fa0781ed58@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Jim MacArthur <jim.macarthur@linaro.org>
X-Mailer: b4 0.13.0
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=jim.macarthur@linaro.org; helo=mail-wm1-x32d.google.com
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

Simply tests GDI's prerequisites; that if GDI is enabled then
so are FEAT_RME and FEAT_RME_GPC2.

Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
---
 tests/tcg/aarch64/system/rme_gdi.c | 56 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/tests/tcg/aarch64/system/rme_gdi.c b/tests/tcg/aarch64/system/rme_gdi.c
new file mode 100644
index 0000000000..0921b791bd
--- /dev/null
+++ b/tests/tcg/aarch64/system/rme_gdi.c
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ *
+ * FEAT_RME_GDI Feature presence and enabled bits test
+ *
+ * Copyright (c) 2026 Linaro Ltd
+ *
+ */
+
+#include <stdint.h>
+#include <minilib.h>
+
+#define ID_AA64PFR0_EL1 "S3_0_C0_C4_0"
+#define ID_AA64MMFR4_EL1 "S3_0_C0_C7_4"
+
+int main()
+{
+    uint64_t mmfr4;
+    uint64_t pfr0;
+    int rme_status;
+    int rmegdi_status;
+
+    asm("mrs %[pfr0], " ID_AA64PFR0_EL1 "\n\t"
+        : [pfr0] "=r" (pfr0));
+
+    /* rme_status is 1 for RME, 2 for RME + GPC2, 3 for RME+GPC3 */
+    rme_status = (pfr0 >> 52) & 0xF;
+
+    asm("mrs %[mmfr4], " ID_AA64MMFR4_EL1 "\n\t"
+        : [mmfr4] "=r" (mmfr4));
+
+    rmegdi_status = ((mmfr4 >> 28) & 0xF);
+
+    switch (rmegdi_status) {
+    case 0:
+        ml_printf("SKIP: GDI not implemented\n");
+        return 0;
+    case 1:
+        /* GDI is implemented, so continue testing */
+        break;
+    default:
+        ml_printf("FAIL: GDI status is %d, only values 0 and 1 are defined\n",
+                  rmegdi_status);
+        return 1;
+    }
+
+    if (rmegdi_status != 0) {
+        /* Check FEAT_RME and FEAT_RME_GPC2 also present */
+        if (rme_status < 2) {
+            ml_printf("FAIL: GDI is %d, but RME is %d; RME should be >= 2\n",
+                      rmegdi_status, rme_status);
+            return 1;
+        }
+    }
+    return 0;
+}

-- 
2.43.0


