Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp6004905wrm;
        Tue, 15 Oct 2019 09:47:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxLpEHkvCTSroCZrhPzz9Ge/oJq5hthzQVSDbcN7q/hXmyGbmLspd6c5PP8DoFnNMFDJL+k
X-Received: by 2002:a17:906:70c7:: with SMTP id g7mr36293779ejk.9.1571158050056;
        Tue, 15 Oct 2019 09:47:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571158050; cv=none;
        d=google.com; s=arc-20160816;
        b=GQ2eisSBi00/9949VBa/QBbeuO562pmSO9LgV1tGh2d3V/8C+FW4cFfHeE2UlDCasW
         zi3upfd7EFdqj19BDRvYGCDHKgc5OwOoCR++bDgLZlAVqxt0efDtGgB2cOPiVc/m6+4z
         kSHYmI/GGeAxlLCjbqEKfRSm+guPuTd/RSCvuXVUK8/XYYcLjBgIU5xlrmZX9gYo3DWd
         Y8kWX9dNC1Lzyu4WNbm6+zaGS5Qfsh17hcYHK72kE8PVO6LOwpC3IIoyGohsxmNR4O54
         wxRTPyXxl5eiKtjYqB7Ahoa7SMR694y++5b6sd6RsB7LSbHKB586Ps919WNqyxNOQaIs
         EEgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=m4O3Xy7tWLBs5UuOTJ5dzdaA6h4n+q00OCHjnj+1vK8=;
        b=xvmBf0RE66Xop9D79E8tHqcZs25Znn3wge2xZ/Id3047yYCY7iGVL3j1av2DVRybvR
         elB6z+FOw9A0S6SyigE3gb2ZQMGZ9HtFgMljH5Y1/Eeoju7PmC14awtlqY2jdf+nRDZs
         7CIOKG0eXxASqJZTgLiaOVEseJOZnqmFbGlXlsVpZ3dhLzImlzhUbj5rEMMjkBBe2V44
         aihg80vJg0R+vxERSL8JYcAfHEk/M0hHtNG9o+X8SJtyT3byPu1c6yXXHFaPD6DSZq/C
         TXANp917v/l63VJ5KpKV6dVh0rEZKchSOlyXlFEcGOifcBOUCMdjJQBouFPl/2TBIHEK
         lmWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="TE/G92PH";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k6si15698023edb.235.2019.10.15.09.47.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Oct 2019 09:47:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="TE/G92PH";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iKPyq-0006vc-L5
	for alex.bennee@linaro.org; Tue, 15 Oct 2019 12:47:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42577)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iKPn2-0008H4-BC
 for qemu-arm@nongnu.org; Tue, 15 Oct 2019 12:35:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iKPn1-0000IC-1p
 for qemu-arm@nongnu.org; Tue, 15 Oct 2019 12:35:16 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:40798)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iKPn0-0000Gy-S7
 for qemu-arm@nongnu.org; Tue, 15 Oct 2019 12:35:14 -0400
Received: by mail-pf1-x442.google.com with SMTP id x127so12816472pfb.7
 for <qemu-arm@nongnu.org>; Tue, 15 Oct 2019 09:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=m4O3Xy7tWLBs5UuOTJ5dzdaA6h4n+q00OCHjnj+1vK8=;
 b=TE/G92PHYDbz91JtzP8GE/LU/s06l3o0trtKUl5FKEffqZNPOpEurSJ4FBzjfTISD2
 /lVZYw4s7DqW8g51X+BQGYyef8qCiqeZQkP1oa2JYc4Z4RWEbVsh8IOILSWCt5WFAvRk
 1wZWvB3gjOBEqH9+qVTuKKK8GsPbhtS2fXeXMmiaT37Y8x1mIi+NvekCyxln1O2opmLk
 HXhwRP/Aya9Zv2VSKw2UTYCrNZgGuw/9/+0AqTpgvGdYAWvEv50/iZ+g9yXhbxiYWWOP
 zmvDOpPmx9E/dJR+hDtYU50QacP12Vze4l+2axHMBELlJueUPJJzv0bY4qhvcOUWlElp
 ZZlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=m4O3Xy7tWLBs5UuOTJ5dzdaA6h4n+q00OCHjnj+1vK8=;
 b=sp84YCaz+9v9Qkm7ifWYQ8va0XcXBoKP5WGuzNc+99w+M7AQDekpjt9BMla8BEMMO+
 NDiPRa3poh5/3V386IDRO4qccDaSQZR4Y+/hSbdUTabGtT0tgfT4bYfowpNhykDbp+sB
 Jrl3DHVCrw8/SY9YhPC7sjSrAtrSCu1zbGZjE+wwDCoRzGjswyGjv3bSyH1qe5Xg/f+B
 P9yHjam6mCBsP0913hyfYWt4LJvIIrRYBF5cmi6xZMIT0IXYZc260O1KLQP41p7t9L7j
 MbM/d52MGcmNhY4eV6vvDJVIvZBhrgMkT/mDUYAT4wg7FlFJ4/+8/rEd4Qwws/VR8FvL
 HRbA==
X-Gm-Message-State: APjAAAXVhzWEz41voUR7VafGpF2/SbcRD3NwNbxNznsVDOq4Ua1dy+fl
 H8Ndh3qoZjw4BRlfaZsKF5FyWA==
X-Received: by 2002:a17:90a:654b:: with SMTP id
 f11mr43562323pjs.49.1571157313791; 
 Tue, 15 Oct 2019 09:35:13 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id m22sm22011593pgj.29.2019.10.15.09.35.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 09:35:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/3] tests/tcg/aarch64: Add mte smoke tests
Date: Tue, 15 Oct 2019 09:35:07 -0700
Message-Id: <20191015163507.12153-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191015163507.12153-1-richard.henderson@linaro.org>
References: <20191015163507.12153-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
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
Cc: elver@google.com, icb@rice.edu, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lp25q3NvviI5

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/aarch64/mte-1.c         | 27 +++++++++++++++++++++
 tests/tcg/aarch64/mte-2.c         | 39 +++++++++++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.target |  5 ++++
 3 files changed, 71 insertions(+)
 create mode 100644 tests/tcg/aarch64/mte-1.c
 create mode 100644 tests/tcg/aarch64/mte-2.c

diff --git a/tests/tcg/aarch64/mte-1.c b/tests/tcg/aarch64/mte-1.c
new file mode 100644
index 0000000000..18bfb1120f
--- /dev/null
+++ b/tests/tcg/aarch64/mte-1.c
@@ -0,0 +1,27 @@
+/*
+ * Memory tagging, basic pass cases.
+ */
+
+#include <assert.h>
+
+asm(".arch armv8.5-a+memtag");
+
+int data[16 / sizeof(int)] __attribute__((aligned(16)));
+
+int main(int ac, char **av)
+{
+    int *p0 = data;
+    int *p1, *p2;
+    long c;
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
index 0000000000..2991b7df69
--- /dev/null
+++ b/tests/tcg/aarch64/mte-2.c
@@ -0,0 +1,39 @@
+/*
+ * Memory tagging, basic fail cases.
+ */
+
+#include <assert.h>
+#include <signal.h>
+#include <stdlib.h>
+
+asm(".arch armv8.5-a+memtag");
+
+int data[16 / sizeof(int)] __attribute__((aligned(16)));
+
+void pass(int sig)
+{
+    exit(0);
+}
+
+int main(int ac, char **av)
+{
+    int *p0 = data;
+    int *p1, *p2;
+    long excl = 1;
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
+    signal(SIGSEGV, pass);
+    *p2 = 0;
+
+    assert(0);
+}
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 0040b68dd0..0971c244b7 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -32,4 +32,9 @@ run-semihosting: semihosting
 # AARCH64_TESTS += bti-1
 bti-1: LDFLAGS += -nostdlib -Wl,-T,$(AARCH64_SRC)/bti.ld
 
+# We need binutils-2.32 to assemble this test case.
+# AARCH64_TESTS += mte-1 mte-2
+mte-%: CFLAGS += -O -g
+run-mte-%: QEMU += -cpu max,x-tagged-pages=on
+
 TESTS += $(AARCH64_TESTS)
-- 
2.17.1

