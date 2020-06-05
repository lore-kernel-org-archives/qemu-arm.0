Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2077232lfc;
        Thu, 4 Jun 2020 21:27:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrMW9Pz5GL3sHfNeGlCi46j+5UwJQdBF6H4aciYYTwGlIoHxJupthCAX++vcnMA42BVeKs
X-Received: by 2002:a25:774a:: with SMTP id s71mr13725177ybc.518.1591331229595;
        Thu, 04 Jun 2020 21:27:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591331229; cv=none;
        d=google.com; s=arc-20160816;
        b=qv8Qax0I+CNo7v6jaO1ukoLdGL1sPA5ecsOxupUQy92wEiKRqLlI6ugq6gtOFzdcIK
         3XnDxgzfxdsQ9gj+h06pH9WzRAP/aa0ZF4jwqkNEgEYQbzZTsAL5WyPIDLcz/TKdSawY
         X00NIeKTInKcpsLjs0vhhipy3NHp7CFG3hPq3IiO1+77huoSHgNQfF1PCY3STFpHPNHd
         662Crb1aPSy7TfHxGLflzDeGAnYZnVUByZgvy1w+Y49iUp7YcEXEtfl1AW0CPwnCEEi0
         6SwaQ3kXrtT/ZecRXl7+aDrbLxDg6yGCZhMEViEmUWzSGBMTWwG1BlFD2MXkD6GGV/vy
         Pbpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Kb6rkAj53RRMvC2rZIPmdOIeGY5NNQOnyCUHmHsi04g=;
        b=m81Osu4T9JU0R1uZWLhaT51kqUtfsF7L/Ew6P9O9pp7vjrznmMAp6PHbjftCTeminV
         pqrIGoN2DHeqnBUP45SuiyuOMm+z7i/roW0fgDFmZc7atlQ3YLwi6zc0A4y/nyNRn3o1
         lDqABWNXWUBTkaRiUQotjXut20FidZKwGYCojehBLHPE+AbuEVH9FOvxCxXIKXCzxbdF
         vt8QZErZNP1zS2IFQTncLCHN+J+SMyCMtFH4q1PK/V+aNdaZMGk9KL2ohZ8MI4beJw+h
         TxTz/a5/uPA1OZ+9+T/bms3TB38y4iuo+XM2rQDx+7N8Rhd+ksMPvRs42Dh8wogVUp55
         9Nzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yvH8g8df;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 128si5574882ybh.37.2020.06.04.21.27.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jun 2020 21:27:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yvH8g8df;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jh3wj-0004rS-04
	for alex.bennee@linaro.org; Fri, 05 Jun 2020 00:27:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jh3nr-0004pI-7i
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 00:17:59 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:39857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jh3nq-0000nA-33
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 00:17:58 -0400
Received: by mail-pl1-x643.google.com with SMTP id v24so3117319plo.6
 for <qemu-arm@nongnu.org>; Thu, 04 Jun 2020 21:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kb6rkAj53RRMvC2rZIPmdOIeGY5NNQOnyCUHmHsi04g=;
 b=yvH8g8dfduLa1IpIp3sKKOzLXGe/K6K2dXH9Ga8tayx7j68WrkKCZGMaYxhBAq3dUl
 WUXs+tBf1IwPtwK29PrMEBPS2Z6CY+/duUtFRMnS3Bd1aKxBMlprfS76J7qDErNg0ag0
 /kKG6iAx+cTcbENv2mTP8k3M39cujyLwIZs/e98FpvOkgBCi/BpOgzdAYmrsFOXvwZBl
 NX8x1XnLp48IfyZjkFgvlamDu9YbE3WsSdMAn0LpTwAfsAYgYSpmadxbQFpbJtQZyQBf
 FCLxqTiQ/iKRTJlMsGO1dSn3Nu6TgP2a17s7O4DDBiZqR4rWBfsFDYJYy8llXuRnrBpY
 tsHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kb6rkAj53RRMvC2rZIPmdOIeGY5NNQOnyCUHmHsi04g=;
 b=sZAltQG5tDa+EQtfHYCmdHKI9XduSmYHRq4qYiOnkbmSO5wapWPX/qT17l25227ji4
 kVwkBhru3W051Wke4kGy/k2TzSRbncMYO/145o1AysE4W8B0IqMV0tnyQmOXk80+dO3h
 cayhV7YCUedzkv3IhjPVLJEYSUlIF+FiHNwAa2u0uVA2fREWekJifzgAnacZKDp0Z5OE
 JXCnLgMq30RpZmlDd9VG+BB2y5zThSnURWxbCxI5ot04ThzO6IJepgKTep7lRu2Kwc4o
 D/l/xTYzxhzFRrKPRmHNRqmy/KLhWUpw2djZVsaXqNr3KYc+0w1j1LxBiILinjqGRiZQ
 JM8g==
X-Gm-Message-State: AOAM531CwUZEGrk7lLxfY/kkH0VtOC0nAyqMV0z+Qxndu5gicfCVWuj2
 rQrMHznPoZMJ+VR4ikxfuvk8WZnXmzo=
X-Received: by 2002:a17:902:b718:: with SMTP id
 d24mr7690094pls.185.1591330676832; 
 Thu, 04 Jun 2020 21:17:56 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id h15sm5440902pgl.12.2020.06.04.21.17.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2020 21:17:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 17/17] tests/tcg/aarch64: Add mte smoke tests
Date: Thu,  4 Jun 2020 21:17:33 -0700
Message-Id: <20200605041733.415188-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200605041733.415188-1-richard.henderson@linaro.org>
References: <20200605041733.415188-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SfocVBEIt64V

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/aarch64/mte.h           | 54 +++++++++++++++++++++++++++++++
 tests/tcg/aarch64/mte-1.c         | 25 ++++++++++++++
 tests/tcg/aarch64/mte-2.c         | 42 ++++++++++++++++++++++++
 tests/tcg/aarch64/mte-3.c         | 47 +++++++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.target |  4 +++
 5 files changed, 172 insertions(+)
 create mode 100644 tests/tcg/aarch64/mte.h
 create mode 100644 tests/tcg/aarch64/mte-1.c
 create mode 100644 tests/tcg/aarch64/mte-2.c
 create mode 100644 tests/tcg/aarch64/mte-3.c

diff --git a/tests/tcg/aarch64/mte.h b/tests/tcg/aarch64/mte.h
new file mode 100644
index 0000000000..7bcc416e6a
--- /dev/null
+++ b/tests/tcg/aarch64/mte.h
@@ -0,0 +1,54 @@
+#include <assert.h>
+#include <string.h>
+#include <stdlib.h>
+#include <stdio.h>
+#include <unistd.h>
+#include <signal.h>
+#include <sys/mman.h>
+#include <sys/prctl.h>
+
+#ifndef PR_SET_TAGGED_ADDR_CTRL
+# define PR_SET_TAGGED_ADDR_CTRL  55
+#endif
+#ifndef PR_TAGGED_ADDR_ENABLE
+# define PR_TAGGED_ADDR_ENABLE    (1UL << 0)
+#endif
+#ifndef PR_MTE_TCF_SHIFT
+# define PR_MTE_TCF_SHIFT         1
+# define PR_MTE_TCF_NONE          (0UL << PR_MTE_TCF_SHIFT)
+# define PR_MTE_TCF_SYNC          (1UL << PR_MTE_TCF_SHIFT)
+# define PR_MTE_TCF_ASYNC         (2UL << PR_MTE_TCF_SHIFT)
+# define PR_MTE_TAG_SHIFT         3
+#endif
+
+#ifndef PROT_MTE
+# define PROT_MTE 0x20
+#endif
+
+#ifndef SEGV_MTEAERR
+# define SEGV_MTEAERR    8
+# define SEGV_MTESERR    9
+#endif
+
+static void enable_mte(int tcf)
+{
+    int r = prctl(PR_SET_TAGGED_ADDR_CTRL,
+                  PR_TAGGED_ADDR_ENABLE | tcf | (0xfffe << PR_MTE_TAG_SHIFT),
+                  0, 0, 0);
+    if (r < 0) {
+        perror("PR_SET_TAGGED_ADDR_CTRL");
+        exit(2);
+    }
+}
+
+static void *alloc_mte_page(void)
+{
+    void *p = mmap(NULL, getpagesize(),
+                   PROT_READ | PROT_WRITE | PROT_MTE,
+                   MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+    if (p == MAP_FAILED) {
+        perror("mmap PROT_MTE");
+        exit(2);
+    }
+    return p;
+}
diff --git a/tests/tcg/aarch64/mte-1.c b/tests/tcg/aarch64/mte-1.c
new file mode 100644
index 0000000000..e62c842e85
--- /dev/null
+++ b/tests/tcg/aarch64/mte-1.c
@@ -0,0 +1,25 @@
+/*
+ * Memory tagging, basic pass cases.
+ */
+
+#include "mte.h"
+
+int main(int ac, char **av)
+{
+    int *p0, *p1, *p2;
+    long c;
+
+    enable_mte(PR_MTE_TCF_NONE);
+    p0 = alloc_mte_page();
+
+    asm("irg %0,%1,%2" : "=r"(p1) : "r"(p0), "r"(1));
+    assert(p1 != p0);
+    asm("subp %0,%1,%2" : "=r"(c) : "r"(p0), "r"(p1));
+    assert(c == 0);
+
+    asm("stg %0, [%0]" : : "r"(p1));
+    asm("ldg %0, [%1]" : "=r"(p2) : "r"(p0), "0"(p0));
+    assert(p1 == p2);
+
+    return 0;
+}
diff --git a/tests/tcg/aarch64/mte-2.c b/tests/tcg/aarch64/mte-2.c
new file mode 100644
index 0000000000..68b5708462
--- /dev/null
+++ b/tests/tcg/aarch64/mte-2.c
@@ -0,0 +1,42 @@
+/*
+ * Memory tagging, basic fail cases.
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
+    int *p0, *p1, *p2;
+    long excl = 1;
+
+    enable_mte(PR_MTE_TCF_SYNC);
+    p0 = alloc_mte_page();
+
+    /* Create two differently tagged pointers.  */
+    asm("irg %0,%1,%2" : "=r"(p1) : "r"(p0), "r"(excl));
+    asm("gmi %0,%1,%0" : "+r"(excl) : "r" (p1));
+    assert(excl != 1);
+    asm("irg %0,%1,%2" : "=r"(p2) : "r"(p0), "r"(excl));
+    assert(p1 != p2);
+
+    /* Store the tag from the first pointer.  */
+    asm("stg %0, [%0]" : : "r"(p1));
+
+    *p1 = 0;
+
+    memset(&sa, 0, sizeof(sa));
+    sa.sa_sigaction = pass;
+    sa.sa_flags = SA_SIGINFO;
+    sigaction(SIGSEGV, &sa, NULL);
+
+    *p2 = 0;
+
+    abort();
+}
diff --git a/tests/tcg/aarch64/mte-3.c b/tests/tcg/aarch64/mte-3.c
new file mode 100644
index 0000000000..6f034cdb01
--- /dev/null
+++ b/tests/tcg/aarch64/mte-3.c
@@ -0,0 +1,47 @@
+/*
+ * Memory tagging, basic fail cases.
+ */
+
+#include "mte.h"
+
+void pass(int sig, siginfo_t *info, void *uc)
+{
+    assert(info->si_code == SEGV_MTEAERR);
+    exit(0);
+}
+
+int main(int ac, char **av)
+{
+    struct sigaction sa;
+    int *p0, *p1, *p2;
+    long excl = 1;
+
+    enable_mte(PR_MTE_TCF_ASYNC);
+    p0 = alloc_mte_page();
+
+    /* Create two differently tagged pointers.  */
+    asm("irg %0,%1,%2" : "=r"(p1) : "r"(p0), "r"(excl));
+    asm("gmi %0,%1,%0" : "+r"(excl) : "r" (p1));
+    assert(excl != 1);
+    asm("irg %0,%1,%2" : "=r"(p2) : "r"(p0), "r"(excl));
+    assert(p1 != p2);
+
+    /* Store the tag from the first pointer.  */
+    asm("stg %0, [%0]" : : "r"(p1));
+
+    *p1 = 0;
+
+    memset(&sa, 0, sizeof(sa));
+    sa.sa_sigaction = pass;
+    sa.sa_flags = SA_SIGINFO;
+    sigaction(SIGSEGV, &sa, NULL);
+
+    /*
+     * Signal for async error will happen eventually.
+     * For a real kernel this should be after the next IRQ (e.g. timer).
+     * For qemu linux-user, we kick the cpu and exit at the next TB.
+     * In either case, loop until this happens (or killed by timeout).
+     */
+    *p2 = 0;
+    while (1);
+}
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index cf84787eb6..2269c264df 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -31,6 +31,10 @@ bti-%: CFLAGS += -mbranch-protection=standard
 bti-%: LDFLAGS += -nostdlib
 endif
 
+# MTE Tests
+AARCH64_TESTS += mte-1 mte-2 mte-3
+mte-%: CFLAGS += -march=armv8.5-a+memtag
+
 # Semihosting smoke test for linux-user
 AARCH64_TESTS += semihosting
 run-semihosting: semihosting
-- 
2.25.1

