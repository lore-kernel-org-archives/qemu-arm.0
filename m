Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6548EF4368E
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Apr 2026 11:03:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wDgyg-0005s2-Gc; Fri, 17 Apr 2026 07:03:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wDgyd-0005qd-F1
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 07:03:11 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wDgyb-0002pV-Tg
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 07:03:11 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-43d74086e5bso496826f8f.0
 for <qemu-arm@nongnu.org>; Fri, 17 Apr 2026 04:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776423788; x=1777028588; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hHF4jmysHEoMGaoQmGTkv09M59NSp+KdqlbbYIyd3Sw=;
 b=DjLR1kvuiRdUy9dXQrApIcOMUArAcQYTSRQ4ntsIHb4wmJfYQ0nrEDPs0U97megcSl
 nmbb669UbG+SoyhWu1AFoAwvHC4mZI0rgxjNi+VJY60jWA1gjBWFZlpiBsCaSLRL3swI
 qbUtQteuWV6qLwYKrz55hT7HLsggAuPQDb2EqgXV7Iv4NY72utoGsS40gVv5VarGRM76
 wlSpPTj39n7IXtlBVfQM9Z7xn2cnxdGcnhN7RDwT4QSME/zl9GJxT2TY1se6BoiQPFch
 08EAADfBEojrPT+upW6LKKHIJ4jnI571+mqunMWgyhCKlMJp/NFTsMBEtPSqkunMN3wy
 Vwaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776423788; x=1777028588;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hHF4jmysHEoMGaoQmGTkv09M59NSp+KdqlbbYIyd3Sw=;
 b=qAlEd5N87Uz/X1A01vzMLCM5yDOwelJ+2Rv+qRzlVqALil4XxLMMAYHy3M5KGDrltH
 zSoZ90dmRVb47ru8arlVVu+zV0bXBVPiYqsUMgWzGUPA2wkA1JQzwzi9/FjMf08z4gPP
 Yr5etWozOYnQp4Z64GHQf3oq9MHp9tuttS4VtvzWbQfaR/Nj0gbZh4ZEVJ6WJxM+uPKk
 hsDnwTLb3MemSRSgh+MppZ46tHaOvPmpHw53oRERt2Br/Q3UOgXJnPpCo3Ii48DehkPD
 ygthqQgNKTu/MIDnXmJcrlR/idtDMt8r6P/B83HeXA67D+YvSlJ6fLcqZv66myyEM64o
 D2Tg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/MGd3rb4HZMxpyJMhPJj+YRzapp8+ar2xZp5ChzVeMaTgshYU1D4fjaG9naa4bglS/K2XSpe10jw==@nongnu.org
X-Gm-Message-State: AOJu0Yx6tLBZm1CUQW//KZpQFHtYKsZ6xQyKko5Q3Rm7cpzv6izSdrAx
 gD66V+c9XnQ4kufomkJthYuTfRHjSL0/PTX+bZdj/5F+JiNIKqGD95/SEf3eGZNprE4=
X-Gm-Gg: AeBDievzfcOC15wjklj4c0aWzNs0k3FAxZzwaRC6fP71CHxYYZ6qZfDy3LXlq+XiOJl
 enkj3TO8a8FToY1pBMCOIPIFVK5e8BQZTicJ2gmWhjXiLnf0mlx9YXxJFNLxeTRtP/vvE+jkS3p
 j9RWcpdsmwRT/KJIK6XW0UdKcIKzjCncFniF0tTo5mPlLe475y0cxwLctpWVotQg7IYYgV1xxU7
 iEU0dKUhSMQsyqX4zCtQm+L6Uv/1TqLpnSNk4xlAlJegfyMJ1hNxKtWzWVcrTrcVw8zk4a+aRAj
 /tPRbVGihp1euBQdg60W5kWh+CJ2JsBl6rwn77jqkybLG18e7FlQIjJoIBJnE1BWzdmpp/z7PUc
 lzq6PllV93sQKOwlgtT/oZvTyrh/cE82dUvPDZcfNaWxqX3x/nf7CcEtG5b+PogrIO8hyk4Y3pl
 F8321RM9LHzHqGuGsvxYr/fKWb5OD9+xUQSC8++nOhNN4Ar81Z
X-Received: by 2002:a5d:4350:0:b0:43f:e721:76b8 with SMTP id
 ffacd0b85a97d-43fe72178cbmr1166798f8f.37.1776423788029; 
 Fri, 17 Apr 2026 04:03:08 -0700 (PDT)
Received: from [127.0.1.1] ([2a10:d582:31e:0:d023:c0db:d3ea:590d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e59f97sm3811934f8f.37.2026.04.17.04.03.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 04:03:07 -0700 (PDT)
From: Jim MacArthur <jim.macarthur@linaro.org>
Date: Fri, 17 Apr 2026 12:02:56 +0100
Subject: [PATCH v2 4/4] tests/tcg/aarch64/system/rme_gdi.c: Very basic test
 of GDI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-jmac-feat_rme_gdi-v2-4-7cf5131aeb60@linaro.org>
References: <20260417-jmac-feat_rme_gdi-v2-0-7cf5131aeb60@linaro.org>
In-Reply-To: <20260417-jmac-feat_rme_gdi-v2-0-7cf5131aeb60@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Jim MacArthur <jim.macarthur@linaro.org>
X-Mailer: b4 0.13.0
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=jim.macarthur@linaro.org; helo=mail-wr1-x429.google.com
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


