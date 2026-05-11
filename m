Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DED4CD484A
	for <qemu-arm@archiver.kernel.org>; Mon, 11 May 2026 14:03:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wMRDZ-0004nX-Hb; Mon, 11 May 2026 10:02:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wMRCw-000477-10
 for qemu-arm@nongnu.org; Mon, 11 May 2026 10:02:08 -0400
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wMRCs-0006J2-UF
 for qemu-arm@nongnu.org; Mon, 11 May 2026 10:02:05 -0400
Received: by mail-qv1-xf31.google.com with SMTP id
 6a1803df08f44-8acae26e564so43951076d6.2
 for <qemu-arm@nongnu.org>; Mon, 11 May 2026 07:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778508122; x=1779112922; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=foXIRPjA5gS3G5f+1cVTKO/YSOx+Ynfsprdlu+eUN/8=;
 b=r4Pvz2caVt0QQyWCAW7uYmvZQ7GaCxNRRMvIMnObnwGOEIhHhJKdwcDDtOlDo0DTES
 P1G/1tugWIxHc9nZCl2mBtZVdJRcpIKo0s6/WaN40C43AqHpvitG7XOCFyYh8aZtBWP1
 Mt21dUPOFDw1CWSKKTVg/BWuxd4cllQC3nvcyLAIrb3sSqXcu2JoPUeRiGi8V7wLYP7o
 Ehy57lR+C/u0GsY/cxz8ghyTWCPHq6XQp81ZXjjXXsV4rd6Od4l4NWUMbqc6pFUxyfr/
 2n4tncZRZ3z/rzoKPNpI48HyY1DOT6JCNBGFUtiKV7ggq2srq5434TQ+qZXLbM+iSh4Z
 +h7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778508122; x=1779112922;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=foXIRPjA5gS3G5f+1cVTKO/YSOx+Ynfsprdlu+eUN/8=;
 b=F6I2wsicuPMy7kskID1GN7psoPsQJmzRiGgrMiYRTAf87yoCMLxKdldsyWZmwl9LWk
 Oj9hA5n4oRQMbuCiQMloDGAjuKc3CyS/LbnPygSvuaOPMVWRVYjavyTj+bZPCRbx+JHR
 fd8OtzBySplijWJUwbWEyzkFggkhvNdFHP4cIHSujricNZ2ARM9L2adh35HEos0D1LVU
 3GJBDuPNs8pkgUj2ymULp4/xX98BYvd3uGEom+PnjAZdRScOO7JVBdI7d+z2VDr213+y
 yhfCI8VUY6DTgENcFGPL4Jtr+toqMYWN6yyNoMTf4zEGU2V6Sa+MfnVkMl7NUi4ZT0tb
 gibg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9bSn+HWW1k1dgRBVZpYZR5YfGkYB5+B8LpfMigGYxfBYhV2S8apMHs1hBmt/nat9BK1rRVsaN5Fg==@nongnu.org
X-Gm-Message-State: AOJu0YwHA1cfQFQPzEkL0ZF48VwM08gF55TL+CEK4v43iED+AQ/9ZRxB
 4svDvj1H80QN5uma0a+v63DcMq2IQksi4j802yMmusKz7oaQdm0gaHOY
X-Gm-Gg: Acq92OEE5aSx4sP7XxwEkk/AFRv0OsGNWRiyqKnz53tNidxiIp97jLE6GZnxW2PHHsw
 J0ku5NcBG2ErSkNHdUbc2JAvH2ICYN9F61BsE06qyvKoLoo9hkfGsAxyRxugfKLozrPkSbEKxJ6
 QyFwutKk6YZ8EKwTIIfrAfcHxlbXtTgaqEFRxRGAqsIVvgaDsyrBpCvhoVWMYweCYtmNKKWl2FQ
 ndfmC7vQ0mETxeaMuB6t/WEXXlJrvmfmznUmV2FN+lM2SG7VkahPj2f+LZ8BgTJ+ChVx3YGkcRb
 KvWbGpfmle52D+MUWno59DFnCNQKjluIWcxz1R/FAfpIV8Y/4Sxp0nfpgLrlorCECU9Bd0LHENL
 UAVF/kB2clRnM1tXzUKbqsdgVdvUeSmk5qyxVVqTGcfXPyunNEZDvpfamuejB8D9c4dfUWc1x8l
 L1drXHvs/dbh7+lhN1jPkdXoRylfOD5Jn7mSrWObYe
X-Received: by 2002:a05:6214:e6b:b0:8c3:1e96:1297 with SMTP id
 6a1803df08f44-8c31e961420mr126144456d6.26.1778508091988; 
 Mon, 11 May 2026 07:01:31 -0700 (PDT)
Received: from [192.168.1.160] ([2600:4041:54f3:a400:c013:3550:ed5f:a59a])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8bf39c7dd09sm94773756d6.31.2026.05.11.07.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2026 07:01:30 -0700 (PDT)
From: Gabriel Brookman <brookmangabriel@gmail.com>
Date: Mon, 11 May 2026 10:01:13 -0400
Subject: [PATCH v6 15/15] tests/tcg: add test for MTE_STORE_ONLY
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-feat-mte4-v6-15-8557cc1313b9@gmail.com>
References: <20260511-feat-mte4-v6-0-8557cc1313b9@gmail.com>
In-Reply-To: <20260511-feat-mte4-v6-0-8557cc1313b9@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>, 
 Gabriel Brookman <brookmangabriel@gmail.com>, Helge Deller <deller@gmx.de>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778508062; l=2991;
 i=brookmangabriel@gmail.com; s=20251009; h=from:subject:message-id;
 bh=mAwPuGJQelulccRrIcbbltCeg9NHZ8EE7GZcbX8aqAw=;
 b=W6mkoNFIXSNDz4uQfV0q+kWjA4IMRY03K8JabjQGiHTqs1y8j8Vi2jL03yOM3GVVGyc+AdRiU
 QTRPeix4viDBaEIpZVkzX7BGg+VjjlmmLolRrYD+1oi/t10sjygwKBT
X-Developer-Key: i=brookmangabriel@gmail.com; a=ed25519;
 pk=m9TtPDal6WzoHNnQiHHKf8dTrv3DUCPUUTujuo8vNrw=
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=brookmangabriel@gmail.com; helo=mail-qv1-xf31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Added a test that checks that MTE checks are not performed on loads when
MTE_STORE_ONLY is enabled.

Signed-off-by: Gabriel Brookman <brookmangabriel@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/aarch64/Makefile.target |  2 +-
 tests/tcg/aarch64/mte-10.c        | 49 +++++++++++++++++++++++++++++++++++++++
 tests/tcg/aarch64/mte.h           |  4 ++--
 3 files changed, 52 insertions(+), 3 deletions(-)

diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index b491cfb5e1..6203ac9b51 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -64,7 +64,7 @@ AARCH64_TESTS += bti-2
 
 # MTE Tests
 ifneq ($(CROSS_CC_HAS_ARMV8_MTE),)
-AARCH64_TESTS += mte-1 mte-2 mte-3 mte-4 mte-5 mte-6 mte-7 mte-8 mte-9
+AARCH64_TESTS += mte-1 mte-2 mte-3 mte-4 mte-5 mte-6 mte-7 mte-8 mte-9 mte-10
 mte-%: CFLAGS += $(CROSS_CC_HAS_ARMV8_MTE)
 endif
 
diff --git a/tests/tcg/aarch64/mte-10.c b/tests/tcg/aarch64/mte-10.c
new file mode 100644
index 0000000000..46d26fe97f
--- /dev/null
+++ b/tests/tcg/aarch64/mte-10.c
@@ -0,0 +1,49 @@
+/*
+ * Memory tagging, write-only tag checking
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "mte.h"
+
+void pass(int sig, siginfo_t *info, void *uc)
+{
+    exit(0);
+}
+
+int main(int ac, char **av)
+{
+    struct sigaction sa;
+    int *p0, *p1, *p2;
+    long excl = 1;
+
+    enable_mte(PR_MTE_TCF_SYNC | PR_MTE_STORE_ONLY);
+    p0 = alloc_mte_mem(sizeof(*p0));
+
+    /* Create two differently tagged pointers. */
+    asm("irg %0,%1,%2" : "=r"(p1) : "r"(p0), "r"(excl));
+    asm("gmi %0,%1,%0" : "+r"(excl) : "r" (p1));
+    assert(excl != 1);
+    asm("irg %0,%1,%2" : "=r"(p2) : "r"(p0), "r"(excl));
+    assert(p1 != p2);
+
+    /* Store the tag from the first pointer.  */
+    asm("stg %0, [%0]" : : "r"(p1));
+
+    /*
+     * We write to p1 (stg above makes this check pass) and read from
+     * p2 (improperly tagged, but since it's a read, we don't care).
+     */
+    *p1 = *p2;
+
+    /* enable handler */
+    memset(&sa, 0, sizeof(sa));
+    sa.sa_sigaction = pass;
+    sa.sa_flags = SA_SIGINFO;
+    sigaction(SIGSEGV, &sa, NULL);
+
+    /* now we write to badly tagged p2, should fault. */
+    *p2 = 0;
+
+    abort();
+}
diff --git a/tests/tcg/aarch64/mte.h b/tests/tcg/aarch64/mte.h
index 17b932f3f1..7093b93dc7 100644
--- a/tests/tcg/aarch64/mte.h
+++ b/tests/tcg/aarch64/mte.h
@@ -40,10 +40,10 @@
 # define SEGV_MTESERR    9
 #endif
 
-static void enable_mte(int tcf)
+static void enable_mte(int flags)
 {
     int r = prctl(PR_SET_TAGGED_ADDR_CTRL,
-                  PR_TAGGED_ADDR_ENABLE | tcf | (0xfffe << PR_MTE_TAG_SHIFT),
+                  PR_TAGGED_ADDR_ENABLE | flags | (0xfffe << PR_MTE_TAG_SHIFT),
                   0, 0, 0);
     if (r < 0) {
         perror("PR_SET_TAGGED_ADDR_CTRL");

-- 
2.54.0


