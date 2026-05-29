Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF9DCD6E4A
	for <qemu-arm@archiver.kernel.org>; Fri, 29 May 2026 19:53:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wT3Gr-00068y-1h; Fri, 29 May 2026 15:53:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wT3Gf-00057Z-Ut
 for qemu-arm@nongnu.org; Fri, 29 May 2026 15:53:19 -0400
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wT3Ge-0005dF-Ab
 for qemu-arm@nongnu.org; Fri, 29 May 2026 15:53:17 -0400
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-69de16f5e80so1744866eaf.0
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 12:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780084395; x=1780689195; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=foXIRPjA5gS3G5f+1cVTKO/YSOx+Ynfsprdlu+eUN/8=;
 b=HHmkrOkBrcTks/IkabWW4KsGC4aV6ee1wbEl+RABifJ85Y/Kas2IyVaKrVan/Ge1nc
 tmzPxuJ1M29aJ4ZDsL/Ar0SDwRbnp3wGjhwiNd/DcXftlivRItDYuaAICZsC5DWLm0Lu
 uNi8iiLIFTxItwnXRxc6ELCCoMTUztG2TrcFgzj7wzAf7mxtS8B295PYSN39PT44ehuP
 nC6AxGTP9Kff8e7Aj/Tnkwp84ry22cDa9Mcr8sZ/z5xRKtESWXdQtRT76dce4629gduu
 uhJZJZGa/qXFSXQbaVzTGvD3qarjzJSjGsM4+q2hu0uo2awxhHdvipiQBhUWum7LDr5j
 WPQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780084395; x=1780689195;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=foXIRPjA5gS3G5f+1cVTKO/YSOx+Ynfsprdlu+eUN/8=;
 b=QmGo10AQih8dDNPTLG0hMY1wYANEXA8dYEwEOQfb8JzqzTmyJITCqEEcbUc4J4UD2Q
 ZHeX8rrltIoRXPhE8BYRp+7xh11TEjgaJAdXeOc4t/mEBgSDbCtzWp978e6Rst4gO517
 6RMRsAPk12ALhnEboA9TJsFRIT1ObbCMZ1zjHETLcH5n4iOAZzT7U5imkpJRIcdBXgP2
 WmkmvwcMP8EHmvaOxcg2ED/hehKlxPFx86+tP+D+8nJSvPP2zMBR1jU1AWD5IfS+GoK+
 0l1kk6jYjZInv2/aZLNPrnWJl0wj9sImKyJvWF+ZlLsocKLuTfV3M1xE1psnGq3tjoXC
 erag==
X-Forwarded-Encrypted: i=1;
 AFNElJ9C3ielikWpINdpfDaGmr1tN7uqKo/W6PPEtLLRwzkZWm64n3mgJ8ArKyBRlJZqhSUNCa9KvSDBjA==@nongnu.org
X-Gm-Message-State: AOJu0YwOuuB3CFLWMYUYRx8T6LmEceKE+kTgTQDRDMSXlDsd85Szra0W
 pVEDe/Ut8DKCWtai7gAJrILPXxpGL+DNC8OVhpVaD0+SzqnU6Ckj3i7KDTT7UOM2
X-Gm-Gg: Acq92OHoJyBhgQraIwOhSoGUbC17Y8Ten8Z1Ygty99KY0c+PEXuLibMtJVyp6cx7b0F
 g6hhqIxIgg349kvr3ckfe+4abhTCFtlg9PYqLIrhyXxZwYSyiKcVWlj43WZecOBewMP4OtBFcDn
 3o4CP3Ex40aNpq+izMZ5J/35vjNP1f2wYyoEzbWcwBem3As9qR9wGFiuyGJR0uhbdKcXrt15qyr
 QPifws0fNVB/naMSbEPdAKhRfHAVOFr0763lTg0GXXryqG39LKVY7EeW5DFbIEJ1QNdApSllgFc
 3Ddpf/RP0nM48CGVozHVOTPz21u5J5s8Rs2/ZwfMj1d4XfVHS2eRsAPjt8zkzQAmcO38GTBhpbX
 a2lqiF+4ZUrtIC5d/3gxB/bFeHVdeOqYwwQ27XFPfjyfCEYVucqKVZ/uoa5vEtFeTmTKOOp7na5
 902hIvkKDtyKAlt+GK1LBwnJRFP5hVATNNeVgDgVP8UkQ=
X-Received: by 2002:a05:6820:827:b0:696:8ccc:5588 with SMTP id
 006d021491bc7-69e103cc45bmr388456eaf.42.1780084395206; 
 Fri, 29 May 2026 12:53:15 -0700 (PDT)
Received: from [10.21.163.79] ([146.74.94.63])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-69e06587eecsm1626692eaf.0.2026.05.29.12.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 12:53:14 -0700 (PDT)
From: Gabriel Brookman <brookmangabriel@gmail.com>
Date: Fri, 29 May 2026 12:52:55 -0700
Subject: [PATCH v7 15/15] tests/tcg: add test for MTE_STORE_ONLY
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-feat-mte4-v7-15-ccbd3c14eb3c@gmail.com>
References: <20260529-feat-mte4-v7-0-ccbd3c14eb3c@gmail.com>
In-Reply-To: <20260529-feat-mte4-v7-0-ccbd3c14eb3c@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>, 
 Gabriel Brookman <brookmangabriel@gmail.com>, Helge Deller <deller@gmx.de>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780084373; l=2991;
 i=brookmangabriel@gmail.com; s=20251009; h=from:subject:message-id;
 bh=mAwPuGJQelulccRrIcbbltCeg9NHZ8EE7GZcbX8aqAw=;
 b=3JpN1NWhlsn+xZKv7pYxFrPc/dCM75WHtfx+BtUY8UlprEmsG6bf517qrCKRKFEkb7YjRLXq+
 g4erT6/54WnCP+5+NMQ4mwYUBWY8xz3kZb90ZhiDl8Mee0yvwg68hTj
X-Developer-Key: i=brookmangabriel@gmail.com; a=ed25519;
 pk=m9TtPDal6WzoHNnQiHHKf8dTrv3DUCPUUTujuo8vNrw=
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2c;
 envelope-from=brookmangabriel@gmail.com; helo=mail-oo1-xc2c.google.com
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


