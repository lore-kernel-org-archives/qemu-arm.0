Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2539486wrt;
        Sun, 13 Jan 2019 17:27:11 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4/miTQWCXtfLGjDxmwA/OKLbqmWQarU4u8tQas/fDtean5M/3wMlAYZAjH4LAqWMUH7Rzf
X-Received: by 2002:a1c:22c5:: with SMTP id i188mr9844089wmi.39.1547429230982;
        Sun, 13 Jan 2019 17:27:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547429230; cv=none;
        d=google.com; s=arc-20160816;
        b=tPGd1KYxd2UdViLfHC1bo9IK8SxbhN/mMgn/LOjhFvT4vR6YYrqk3qy5u6ylozTFDt
         wHmB/i0rouLDEd4s0tSA2H1w0TEppzwSTZQIflw9Bvzrv+6qlc7YPw8U/sTbr6HPT6FT
         4jJGYccFMIPkC8L2FdJDMuRPrgDhibK2paRpOEIy99CHK1Z3QcV9iC1kt+gXVc9UrR8X
         qhVB2iWAUGXyho70NDkYIHd8Jdbogc/H4QfIvXgJ0mxDZy7JG+Ksl4bVyjGrQ3v+HvZN
         sLUDqXZjQrtNPH3Qab8KnJ3Vt6cDvEE6jLtt/cNn3v4uDkur7S10RHdRbj1isu5Gmyvm
         pPXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=RF1blEfpbrvZ+eBn0f+rgZeNzRwB/ONHSYLlKUEqtWI=;
        b=Xq4ZVolSKSgak4FQGm1iRpkNCG+IzRCRexcDZQxtnWuW1dFDwPXbPVY2sqbZA+/V4e
         5fG5vu+HBMONNKziM/lhbbTzMWjx3xlXB8HRaEAUaRMLzux0k0uU/T7ZEQ5Sa83QMI13
         NFu1ROICO2TXkpIRoNyn+Xpmoq5kSJmI39in/5jN4c28DCyLmzlYHwF4oKbhrQtdmDxK
         14HOknb7+AG/02CkknpaoSRsiV2xcbcZi9rW1/lLAu1TJ6Tud/VdUE1kZ9a+ODVgIplg
         5i5heX/DT82mGz7NAxuLm5K0F+lwQcOLS7I9oJx4oRDza+2o6sf1WwHY5NMHu4DHMLud
         g/GQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TER98Q5N;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y13si19645738wrr.124.2019.01.13.17.27.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 13 Jan 2019 17:27:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TER98Q5N;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:58029 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gir1y-0008TO-2g
	for alex.bennee@linaro.org; Sun, 13 Jan 2019 20:27:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37308)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1giqnv-0006IC-OV
	for qemu-devel@nongnu.org; Sun, 13 Jan 2019 20:12:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1giqnt-0001GQ-Qj
	for qemu-devel@nongnu.org; Sun, 13 Jan 2019 20:12:39 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:37888)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1giqns-0001Ak-Hq
	for qemu-devel@nongnu.org; Sun, 13 Jan 2019 20:12:37 -0500
Received: by mail-pl1-x641.google.com with SMTP id e5so9337421plb.5
	for <qemu-devel@nongnu.org>; Sun, 13 Jan 2019 17:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RF1blEfpbrvZ+eBn0f+rgZeNzRwB/ONHSYLlKUEqtWI=;
	b=TER98Q5N6GjPCbtLDkMn3VrHvVgGRs+wB5pJFd9MMnkdgn7NxlUpK+XOaWcZtzBTxs
	pIG8UFDbpYYyaP6qHYjPWlofs7KADcBr7nUNlAckxouBHXDmpCReKjyhz4HdyH5HWQ6k
	yB9qzT+LbWtvG6kv9oXpdBs5Ka8gEh6y0qPSQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=RF1blEfpbrvZ+eBn0f+rgZeNzRwB/ONHSYLlKUEqtWI=;
	b=Jw/Exn9dd8pthK+Wh9/ThzgKsn1cYksc7Zls0hrGVmKlfkEC6yXnAN/jmcJBZv6ees
	wh1L/fV/QfG2lmF4GUvAopRwQJy2O/zj79i8f/QIDEuAplMH1fHxE3pa0/kU8Xvw3g4t
	dhm0Rnykc9bhmJcxbNs/3eO1DnNAbs0iVVv5/PhMrPpY8UAKYqogz9UINiVDlqrw+xUN
	47oquWsvlz9yB3EZ48qithRAw7EF0swJ5NM02VYgcfvQinYPuo8yRy7NIHr9c6tEzvo4
	nh6OCpWPLDv6i3A8cMiIvNzqKru4HvvYj7RnZcLSIuX5m0+7TF2Y+Qz3U1NTCA+ep/ls
	bXhA==
X-Gm-Message-State: AJcUukfcMFmarHxdDh1t6hmE4jCJJ30bzaoOF36+k6qzwIBGjsxQyNhr
	Mr68z5sZxbl3JXm30B12gb0Hz955AQmG7w==
X-Received: by 2002:a17:902:a5ca:: with SMTP id
	t10mr23323052plq.139.1547428345209; 
	Sun, 13 Jan 2019 17:12:25 -0800 (PST)
Received: from cloudburst.twiddle.net
	([2001:8000:1064:7600:4085:6ae6:1bde:1c45])
	by smtp.gmail.com with ESMTPSA id
	5sm159602229pfz.149.2019.01.13.17.12.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 13 Jan 2019 17:12:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 14 Jan 2019 12:11:22 +1100
Message-Id: <20190114011122.5995-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190114011122.5995-1-richard.henderson@linaro.org>
References: <20190114011122.5995-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: [Qemu-devel] [PATCH 17/17] tests/tcg/aarch64: Add mte smoke tests
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5bLuetLGpZtn

??? Requires a quite recent aarch64 assembler.  Use .inst instead?

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/aarch64/mte-1.c         | 27 +++++++++++++++++++++
 tests/tcg/aarch64/mte-2.c         | 39 +++++++++++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.target |  4 ++++
 3 files changed, 70 insertions(+)
 create mode 100644 tests/tcg/aarch64/mte-1.c
 create mode 100644 tests/tcg/aarch64/mte-2.c

diff --git a/tests/tcg/aarch64/mte-1.c b/tests/tcg/aarch64/mte-1.c
new file mode 100644
index 0000000000..740bf506f1
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
+    asm("stg [%0]" : : "r"(p1));
+    asm("ldg %0, [%1]" : "=r"(p2) : "r"(p0));
+    assert(p1 == p2);
+
+    return 0;
+}
diff --git a/tests/tcg/aarch64/mte-2.c b/tests/tcg/aarch64/mte-2.c
new file mode 100644
index 0000000000..4d2004ab41
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
+    asm("stg [%0]" : : "r"(p1));
+
+    *p1 = 0;
+    signal(SIGSEGV, pass);
+    *p2 = 0;
+
+    assert(0);
+}
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 3d56e7c6ea..1c4ebe894c 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -19,4 +19,8 @@ AARCH64_TESTS += bti-1
 bti-1: LDFLAGS += -nostartfiles -nodefaultlibs -nostdlib
 run-bti-1: QEMU += -cpu max,guarded_pages=on
 
+AARCH64_TESTS += mte-1 mte-2
+mte-%: CFLAGS += -O -g
+run-mte-%: QEMU += -cpu max
+
 TESTS:=$(AARCH64_TESTS)
-- 
2.17.2

