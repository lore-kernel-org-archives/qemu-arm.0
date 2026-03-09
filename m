Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 774EFFCA198
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Mar 2026 22:02:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vzies-00038U-1P; Mon, 09 Mar 2026 18:01:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1vziep-00037L-SR
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 18:01:00 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1vzien-0004Zx-31
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 18:00:59 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-7986fb839f5so106841017b3.0
 for <qemu-arm@nongnu.org>; Mon, 09 Mar 2026 15:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773093656; x=1773698456; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4UqJ0KkwcXgss5FI5RMGEGc98MAIzsKLiHEjZ3J/bic=;
 b=YBydFiaRBcUuZ9SNgYT85VtToadWqKoCHGvjSf0JZ1inzbscsHa0PWqJ1Azxj6zuSx
 6jZ2G31gGwoSNa5h6jie3x+ko/MFBT6Yo+ZVHEk8Q7jujiDYEZe8JyfoKLlPXF/6qr2s
 gmfWL1FrYEfXBdrIfql1oazGaSdw4/xhGS2c6hrXDtlL2/iRJjjD0On8iPwmkvY2DoWe
 mu9W3F7MmxxMuldcMlY8PPhy0IKNplMw1UBgA8rCAuOQPi7T1MUovMUyeKoHS3tWwak0
 MLOzEEpvViKqZxLfPNYj5ZjQWgd1A5OIdNmWE3VGDuqHwdD2vF/khaH1o8xesyozXJtg
 7gtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773093656; x=1773698456;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=4UqJ0KkwcXgss5FI5RMGEGc98MAIzsKLiHEjZ3J/bic=;
 b=C9WlDlB25O3XUfMRJv0nJBR8C+Ueet3PutqZ+f4+BefZVftldwb3nMZJ9SaSHF0Bkp
 iFhBQop0gDosfAh6K969AolFU5D18C0krp20Zhyz01y8idVR5cQ7cJR5fd+dG1rBY7sq
 GW5HcQSr5Qc5PxfZlHAsNNBpVGwIylszmUsCvCHKBPU/Z75MFY4dK/8OKAhwLhoZHbhV
 L9FJfmEi4tr0BIHqiKvptTPtMX3YNUzHIQNVd/Ka/hX40suFHjtjueF49mJ2rZRlrzx1
 s6OJfJg5IXJj2YdRGb+K2P31em4d9XmqP1/9EIOklnmxj/3zUTViyHMXeJ5CYQPXOSyt
 ZiQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbGOtGGG8XemghVsOeRtdQMe9JsQ5MUV6aOOQp5v2dobr5bBUKfYzH5gsCnlcx16Oganwbfv/KvQ==@nongnu.org
X-Gm-Message-State: AOJu0YzEkT2vzLHsoZedN9VcVfi8r6/yXRzlHNgHqp70xmf/U7oz1/uC
 P0IWoRilOu+b7xw2Z1l7/mLT/AkZXTvTgrMHxRq0Z1BRx0cpyJoBXENj
X-Gm-Gg: ATEYQzzMaWu9YY9ISp7SLGD8trxuEAXeCe8Hf6nPK9DlITclEoTCIgbjm+IbJYuH3qo
 wVCzsinHbTWeGXiJBGxTRoYkSqxoeIijtx8sYaTQAJNQ8eRAOCobI6JNCImSlxvFLDcbb7QpC3z
 7pLVRCa1LrjmDVar+Nps3qgA1CHK6QPKsuGdHf+wVPYyytzM+pki9b8Jhwjff/CsZMK7XYmMsk3
 twYrSYijErwXXqli9QSzYf2KGMflHyQqnUvRGiApvkjybzucnosHAORqGTpz191Zr+qVWiYPdaA
 XDW8jVNI1nz5kIxZpVsRQk/rTHqz+2LLk5EQpg8dflfY7C2+QaPe8nqtmdBzIPzasj7VbbBJWYc
 VTDqiNbBOqJlEoa8YRf+MX6HWXV8RfQjRUAFAyQid6C54yh05MvUHDXsnffE4zz9TMYJd/vbodf
 QQiApmy2SN4GEZKn92zoFsbzDBH3ykVVJPKFU=
X-Received: by 2002:a05:690c:6305:b0:798:752:101b with SMTP id
 00721157ae682-798dd67888dmr121753027b3.1.1773093655923; 
 Mon, 09 Mar 2026 15:00:55 -0700 (PDT)
Received: from [172.26.74.149] ([185.213.193.97])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-7990a54ba7csm5218437b3.19.2026.03.09.15.00.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2026 15:00:55 -0700 (PDT)
From: Gabriel Brookman <brookmangabriel@gmail.com>
Date: Mon, 09 Mar 2026 17:59:45 -0400
Subject: [PATCH v4 13/13] tests/tcg: add test for MTE_STORE_ONLY
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-feat-mte4-v4-13-daaf0375620d@gmail.com>
References: <20260309-feat-mte4-v4-0-daaf0375620d@gmail.com>
In-Reply-To: <20260309-feat-mte4-v4-0-daaf0375620d@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
 Gabriel Brookman <brookmangabriel@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773093641; l=2991;
 i=brookmangabriel@gmail.com; s=20251009; h=from:subject:message-id;
 bh=BR2qvqK3g1qrJmisJ+SFI6LAMFWBhUqYUn2heQVrBI8=;
 b=STvzJdu25MkIR4UqGyc+cKtDJk+xVOeuYof3CSz/AxmgCOC6/rsNMs/bUByxcBAVdTxxgQ6vq
 O1jVnvR8rubD0LMJcOURPSHuEuW9DjrLiCgYOTW9rv9bJzGEdvG+N3z
X-Developer-Key: i=brookmangabriel@gmail.com; a=ed25519;
 pk=m9TtPDal6WzoHNnQiHHKf8dTrv3DUCPUUTujuo8vNrw=
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=brookmangabriel@gmail.com; helo=mail-yw1-x1133.google.com
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
2.52.0


