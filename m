Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp629251lfr;
        Fri, 16 Apr 2021 11:31:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:22d6:b029:247:9c54:de70 with SMTP id f22-20020a056a0022d6b02902479c54de70mr9233159pfj.1.1618597872902;
        Fri, 16 Apr 2021 11:31:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618597872; cv=none;
        d=google.com; s=arc-20160816;
        b=rPGBgCZ5JBXlZgo79WnKJ03yXc9zPJt3FG3cZFrXmXhdBjdHDQWzP3v4xGiGk9Mt3n
         pSqNAh9dN3Pvfw5EwuGni7XbqrM2mJwbeiFjStIvfe5FUCbdqm9DLdODJS/gcQYgxsIO
         yZscLax9Hr9JL5ocGRLF2/Gc6svgvRYBknYZF+qCc4qkosbsMullLhFiiCjdAR5uHnK+
         IHuH9UNLeN2ZzNpFnpbpFneBB38/STNzSDLFNRh4XrzWqu/Fvthhh7I2ElErx9d7GnQx
         IaYOGziy6voJk0CEdCFLmB8lhLJlnQqOzha/Ygq+JkCTRjk2OaIavVL/XT+UcQQKIQhi
         eflg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ArcUUYgFNH5v/yku39T/BAW6N5EhX13DVLb3URS9HQI=;
        b=t4cZEFL0HyjSyik5/zi6WSE0NFxr8LcysPMi7mKWVe2IfEx4QCCLXq613ds/Z2nvhn
         F/uZXAZvHr0GgotBttTpSjzEtb5j/REXUlxfEUmyf8ELEI7Zp2xGyDi9t5+87DmDkIMU
         5Sk5Wu7hUe0cbA+FSI1C2RhTYFxW1g05FQBxvlkhiGe5n5vOXfds4KqU6eMR7gwXsU9C
         ChYF0D+YC6e3ML4at/5aoaE0GvgaEDkKTQzuTZ064OH0KI2Yj9qRUy3JuxBpAPTSI/J9
         0NyUiUvVAnp9jAo6/CSVL9KcK/ztmGe8/SrS5EAjl5Em48Ysrqn9AX/7gDF5mwSd5WHC
         jogQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R24xOu9e;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n13sor3487767pgq.16.2021.04.16.11.31.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 16 Apr 2021 11:31:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R24xOu9e;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ArcUUYgFNH5v/yku39T/BAW6N5EhX13DVLb3URS9HQI=;
        b=R24xOu9eEldG3P4DNtDmpW9KXSrjmN67QugiM8TuhsYHAulvw4vmIDxDhYSGgjdHcd
         1M6JAxyeISuXV1S37XmUHyp1VSFZgxELrP9kop9928f0j5SEbNi2eJCVTKx5aswUqgPT
         DiHB2j9lCJ9aVC/AnWDGFfi8xLC0+T6M0u9ew6nrFCqPONz/iLH0EzS0BtNtT46TMr6T
         +z2qlueaILhd99lzMnJ99ArSJ4EX5Hco/HX9+MFVHPERdRM3pbDonAw7FeCMgXzjfI6z
         BUGbvrkw2B9I/uOXenXxwA4DQbedkfIf1CfNuoFZCAKBMGUkFTPlwFWctdtimYDJMpaB
         LatQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ArcUUYgFNH5v/yku39T/BAW6N5EhX13DVLb3URS9HQI=;
        b=qMawGV8dnZCI8y+2RjPRmVqpNlvVYmV7q2mLVBvK3rQWMwXYPc2ROLoTTgY0dP/ILU
         yaDDmVq6SUQIRFjSkc/owmORa/gQgClPd6bQaJIi6GwBahFfpgGEs9z/HlnX28kai26P
         dKTKncriujD6k/wFAxo0VBrqAMmpBA2C+OJbtVXyrg+JHfrZ0vbpKWpvyfjfviysZi1R
         ULrHEdaZcAun0yfBaIHHKOBCKbEJSTfRBmopg61eIGYHvC9ZidVoucrtGK3eBLpkhmyv
         puLZugxLusnH3GIi0bD2i0AuIRBsTPgMaKEMuAHVz8At0RpyXLsiHlvjqnybC+xFlHWM
         W2Vw==
X-Gm-Message-State: AOAM530F5akuhotvWpAqgrRtPakzT7lCHvKuC8Mn16BBGUGWP1UByst9
	sgLSmNG1ylDVei5kDwIkqbksuXdr
X-Google-Smtp-Source: ABdhPJyUQfjCLel9d2unx9Cm5wdZAZZ0AON/JJ0tsNOEyWh4+dsGM5Zm7JHGAErnVsKPcwTcLoHI5Q==
X-Received: by 2002:a65:6907:: with SMTP id s7mr403990pgq.296.1618597872419;
        Fri, 16 Apr 2021 11:31:12 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain ([71.212.131.83])
        by smtp.gmail.com with ESMTPSA id p18sm3057307pju.3.2021.04.16.11.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 11:31:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v5 4/9] test/tcg/aarch64: Add mte-5
Date: Fri, 16 Apr 2021 11:31:01 -0700
Message-Id: <20210416183106.1516563-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416183106.1516563-1-richard.henderson@linaro.org>
References: <20210416183106.1516563-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: qlnoPeAKctpu

Buglink: https://bugs.launchpad.net/bugs/1921948
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/aarch64/mte-5.c         | 44 +++++++++++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.target |  2 +-
 2 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 tests/tcg/aarch64/mte-5.c

diff --git a/tests/tcg/aarch64/mte-5.c b/tests/tcg/aarch64/mte-5.c
new file mode 100644
index 0000000000..6dbd6ab3ea
--- /dev/null
+++ b/tests/tcg/aarch64/mte-5.c
@@ -0,0 +1,44 @@
+/*
+ * Memory tagging, faulting unaligned access.
+ *
+ * Copyright (c) 2021 Linaro Ltd
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "mte.h"
+
+void pass(int sig, siginfo_t *info, void *uc)
+{
+    assert(info->si_code == SEGV_MTESERR);
+    exit(0);
+}
+
+int main(int ac, char **av)
+{
+    struct sigaction sa;
+    void *p0, *p1, *p2;
+    long excl = 1;
+
+    enable_mte(PR_MTE_TCF_SYNC);
+    p0 = alloc_mte_mem(sizeof(*p0));
+
+    /* Create two differently tagged pointers.  */
+    asm("irg %0,%1,%2" : "=r"(p1) : "r"(p0), "r"(excl));
+    asm("gmi %0,%1,%0" : "+r"(excl) : "r" (p1));
+    assert(excl != 1);
+    asm("irg %0,%1,%2" : "=r"(p2) : "r"(p0), "r"(excl));
+    assert(p1 != p2);
+
+    memset(&sa, 0, sizeof(sa));
+    sa.sa_sigaction = pass;
+    sa.sa_flags = SA_SIGINFO;
+    sigaction(SIGSEGV, &sa, NULL);
+
+    /* Store store two different tags in sequential granules. */
+    asm("stg %0, [%0]" : : "r"(p1));
+    asm("stg %0, [%0]" : : "r"(p2 + 16));
+
+    /* Perform an unaligned load crossing the granules. */
+    asm volatile("ldr %0, [%1]" : "=r"(p0) : "r"(p1 + 12));
+    abort();
+}
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 05b2622bfc..928357b10a 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -37,7 +37,7 @@ AARCH64_TESTS += bti-2
 
 # MTE Tests
 ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_ARMV8_MTE),)
-AARCH64_TESTS += mte-1 mte-2 mte-3 mte-4 mte-6
+AARCH64_TESTS += mte-1 mte-2 mte-3 mte-4 mte-5 mte-6
 mte-%: CFLAGS += -march=armv8.5-a+memtag
 endif
 
-- 
2.25.1
