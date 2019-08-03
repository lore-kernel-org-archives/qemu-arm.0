Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp2281629wrv;
        Sat, 3 Aug 2019 14:08:14 -0700 (PDT)
X-Received: by 2002:a17:902:3081:: with SMTP id v1mr140342555plb.169.1564866494717;
        Sat, 03 Aug 2019 14:08:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564866494; cv=none;
        d=google.com; s=arc-20160816;
        b=OuEFFieYEa0pVWHGxhfT7QarIKrU38I4Xv4pE0+H9gnOAw1tsrLshmWiwf5sFbxCAq
         Fx7Cgwkcdc5vw7Sk30fsWgWUrD7Y15TGHJerEunDCANsUcA4PG07rVQpepkAJj+JMEG9
         EmZ1+1/fx04fU2Huuc9p8LZHsYhYL0k7MUFR+rVdxZDxcNSPoYLDkNrYVYqjpwSvszLJ
         7h6EAopsixSVNSgjPvPymUr2ObBJdcL0cqvxtkTSopQp5u3nX2YQD0H/h9mbnuGOll/7
         IWuXeftp1I0HDb+fNNEJcu6Lr8W1D9EuCD6uxNn9Q4HAnGLONwX1rHE0xFLIaI8doWiK
         JiGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=hqDSppWw6vFGW1wxYzaEvtXw5fh6OAkiiQRpVHdER/Q=;
        b=t9XShnPIlz4bo/V7nru5YrSw3Qg9J57+DjhYAtbAVfu+8PpvYeolFL2ckZpuPnec19
         ZzWhaO39foItg7QqzbirfNJmrEfvg5z4mtzK4DueQNSmXh1oxAiRwutLcShgpeBXFtXQ
         BeASKxfGjVWD55/OEOCe9tuIPqcp/Ij5zbv+PG0xsxkKFfxI6saEAacMQDo59ZDEIW78
         1Qp8s/5I+u1QzYko6E2mbM0UrOMO9lGv8QKBjIlitllkx4w/lo62fo8ZB4osb3uIUsHk
         RYpmurCWs8+1LFZuqpB2i8gRhCA2BogvnnpEhmgLMoMxnOEAQ7J1+VNTM+UGiuAnh/UL
         FlLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wXt7I3zB;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id j13sor35931415pgb.72.2019.08.03.14.08.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 Aug 2019 14:08:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wXt7I3zB;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=hqDSppWw6vFGW1wxYzaEvtXw5fh6OAkiiQRpVHdER/Q=;
        b=wXt7I3zB3wMa4+YLho9mQUxPzGQBbZhOb362mB0lupmEWE5Ts5RvEoLDu8UMmPJ16A
         SsoSkjCXr6uWvF0RInoU3J/L5jkRaBe1XYxZ+aLOYjfq61vjnWvOjz6MsAIJ+KGps+dP
         Z6CJXwPSprvhq9I9y74vl96j3jmzv03HxjdCYgvAPcXky2VC/Bx8fnzlk9EblFtwRb+J
         m5OWJrUu4nILp0jOk5n6kdsSSIeD/eZGSdqtTSD7wkMp79ulM1J446NIGP8yF9ZLQCb+
         MW8a3DtPA1epzLqQYc9cx9tv2xfmO/EyAHjtGFlLO34AJq3UjLE+s5fmwLrl9NWMCVA0
         r5SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=hqDSppWw6vFGW1wxYzaEvtXw5fh6OAkiiQRpVHdER/Q=;
        b=ZVLA+ykqHqwv6mNoqkxH20gMxdkxRxyYPmecwXK9FCsKPbg05stvHnOI9XL+NmvQjM
         IyblFxeM8PYYOm79mk2ZC9g/475XozG0KGq/HwpzENMiUKV2OIHO5WQipSkARemjrkWe
         G1mVpcvRf4Acb2Lp+WCYYdiIE2K5dt/EzoNVgYE6wId5TsdAhHDEMGb+2N1woF1R1bW+
         jrU1tTHIROu1sINsR8IoDCSDXe1Ckfg9/ARSg+3ZUmlnP+UBCWefb6zasy41rkbmdE7z
         2SZC8oDwpB3YuDV5jgKZKbC1PhNcgzXGCKX9+a0uEe0RAMTqUEPHu88DlChTRaR0SCOT
         GJAQ==
X-Gm-Message-State: APjAAAXWE5Q/owEcEJAHqlE7hfPQx5++hiv/aS4gVTri++YfGd0n3zXp
	bXyarQvCOoCGwXdsERoK5p0zWBUw
X-Google-Smtp-Source: APXvYqwZEeskjI8RRA9mcN66+3I83TnEbWS/spXp0EmaAZHS7uSYx4Pljs5hUjxTeqbiZSETogAfsQ==
X-Received: by 2002:a63:3006:: with SMTP id w6mr8164127pgw.440.1564866494221;
        Sat, 03 Aug 2019 14:08:14 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id x25sm110129644pfa.90.2019.08.03.14.08.13
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 03 Aug 2019 14:08:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org,
	Dave.Martin@arm.com
Subject: [PATCH v7 6/6] tests/tcg/aarch64: Add bti smoke test
Date: Sat,  3 Aug 2019 14:08:03 -0700
Message-Id: <20190803210803.5701-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190803210803.5701-1-richard.henderson@linaro.org>
References: <20190803210803.5701-1-richard.henderson@linaro.org>
X-TUID: WAgAMAxkGIld

This will build with older toolchains, without the upstream support
for -mbranch-protection.  Such a toolchain will produce a warning
in such cases,

ld: warning: /tmp/ccyZt0kq.o: unsupported GNU_PROPERTY_TYPE (5) \
type: 0xc0000000

but the still places the note at the correct location in the binary
for processing by the runtime loader.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/aarch64/bti-1.c         | 77 +++++++++++++++++++++++++++++++
 tests/tcg/aarch64/bti-crt.inc.c   | 69 +++++++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.target |  3 ++
 tests/tcg/aarch64/bti.ld          | 15 ++++++
 4 files changed, 164 insertions(+)
 create mode 100644 tests/tcg/aarch64/bti-1.c
 create mode 100644 tests/tcg/aarch64/bti-crt.inc.c
 create mode 100644 tests/tcg/aarch64/bti.ld

diff --git a/tests/tcg/aarch64/bti-1.c b/tests/tcg/aarch64/bti-1.c
new file mode 100644
index 0000000000..2aee57ea7a
--- /dev/null
+++ b/tests/tcg/aarch64/bti-1.c
@@ -0,0 +1,77 @@
+/*
+ * Branch target identification, basic notskip cases.
+ */
+
+#include "bti-crt.inc.c"
+
+/*
+ * Work around lack of -mbranch-protection=standard in older toolchains.
+ * The signal handler is invoked by the kernel with PSTATE.BTYPE=2, which
+ * means that the handler must begin with a marker like BTI_C.
+ */
+asm("skip2_sigill1:\n\
+	hint	#34\n\
+	b	skip2_sigill2\n\
+.type skip2_sigill1,%function\n\
+.size skip2_sigill1,8");
+
+extern void skip2_sigill1(int sig, siginfo_t *info, ucontext_t *uc)
+    __attribute__((visibility("hidden")));
+
+static void __attribute__((used))
+skip2_sigill2(int sig, siginfo_t *info, ucontext_t *uc)
+{
+    uc->uc_mcontext.pc += 8;
+    uc->uc_mcontext.pstate = 1;
+}
+
+#define NOP       "nop"
+#define BTI_N     "hint #32"
+#define BTI_C     "hint #34"
+#define BTI_J     "hint #36"
+#define BTI_JC    "hint #38"
+
+#define BTYPE_1(DEST) \
+    asm("mov %0,#1; adr x16, 1f; br x16; 1: " DEST "; mov %0,#0" \
+        : "=r"(skipped) : : "x16")
+
+#define BTYPE_2(DEST) \
+    asm("mov %0,#1; adr x16, 1f; blr x16; 1: " DEST "; mov %0,#0" \
+        : "=r"(skipped) : : "x16", "x30")
+
+#define BTYPE_3(DEST) \
+    asm("mov %0,#1; adr x15, 1f; br x15; 1: " DEST "; mov %0,#0" \
+        : "=r"(skipped) : : "x15")
+
+#define TEST(WHICH, DEST, EXPECT) \
+    do { WHICH(DEST); fail += skipped ^ EXPECT; } while (0)
+
+
+int main()
+{
+    int fail = 0;
+    int skipped;
+
+    /* Signal-like with SA_SIGINFO.  */
+    signal_info(SIGILL, skip2_sigill1);
+
+    TEST(BTYPE_1, NOP, 1);
+    TEST(BTYPE_1, BTI_N, 1);
+    TEST(BTYPE_1, BTI_C, 0);
+    TEST(BTYPE_1, BTI_J, 0);
+    TEST(BTYPE_1, BTI_JC, 0);
+
+    TEST(BTYPE_2, NOP, 1);
+    TEST(BTYPE_2, BTI_N, 1);
+    TEST(BTYPE_2, BTI_C, 0);
+    TEST(BTYPE_2, BTI_J, 1);
+    TEST(BTYPE_2, BTI_JC, 0);
+
+    TEST(BTYPE_3, NOP, 1);
+    TEST(BTYPE_3, BTI_N, 1);
+    TEST(BTYPE_3, BTI_C, 1);
+    TEST(BTYPE_3, BTI_J, 0);
+    TEST(BTYPE_3, BTI_JC, 0);
+
+    return fail;
+}
diff --git a/tests/tcg/aarch64/bti-crt.inc.c b/tests/tcg/aarch64/bti-crt.inc.c
new file mode 100644
index 0000000000..bb363853de
--- /dev/null
+++ b/tests/tcg/aarch64/bti-crt.inc.c
@@ -0,0 +1,69 @@
+/*
+ * Minimal user-environment for testing BTI.
+ *
+ * Normal libc is not built with BTI support enabled, and so could
+ * generate a BTI TRAP before ever reaching main.
+ */
+
+#include <stdlib.h>
+#include <signal.h>
+#include <ucontext.h>
+#include <asm/unistd.h>
+
+int main(void);
+
+void _start(void)
+{
+    exit(main());
+}
+
+void exit(int ret)
+{
+    register int x0 __asm__("x0") = ret;
+    register int x8 __asm__("x8") = __NR_exit;
+
+    asm volatile("svc #0" : : "r"(x0), "r"(x8));
+    __builtin_unreachable();
+}
+
+/*
+ * Irritatingly, the user API struct sigaction does not match the
+ * kernel API struct sigaction.  So for simplicity, isolate the
+ * kernel ABI here, and make this act like signal.
+ */
+void signal_info(int sig, void (*fn)(int, siginfo_t *, ucontext_t *))
+{
+    struct kernel_sigaction {
+        void (*handler)(int, siginfo_t *, ucontext_t *);
+        unsigned long flags;
+        unsigned long restorer;
+        unsigned long mask;
+    } sa = { fn, SA_SIGINFO, 0, 0 };
+
+    register int x0 __asm__("x0") = sig;
+    register void *x1 __asm__("x1") = &sa;
+    register void *x2 __asm__("x2") = 0;
+    register int x3 __asm__("x3") = sizeof(unsigned long);
+    register int x8 __asm__("x8") = __NR_rt_sigaction;
+
+    asm volatile("svc #0"
+                 : : "r"(x0), "r"(x1), "r"(x2), "r"(x3), "r"(x8) : "memory");
+}
+
+/*
+ * Create the PT_NOTE that will enable BTI in the page tables.
+ * This will be created by the compiler with -mbranch-protection=standard,
+ * but as of 2019-03-29, this is has not been committed to gcc mainline.
+ * This will probably be in GCC10.
+ */
+asm(".section .note.gnu.property,\"a\"\n\
+	.align	3\n\
+	.long	4\n\
+        .long	16\n\
+        .long	5\n\
+        .string	\"GNU\"\n\
+	.long	0xc0000000\n\
+	.long	4\n\
+	.long	1\n\
+        .align  3\n\
+	.previous");
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 31ba9cfcaa..68135c6ee8 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -18,4 +18,7 @@ run-fcvt: fcvt
 AARCH64_TESTS += pauth-1 pauth-2
 run-pauth-%: QEMU += -cpu max
 
+AARCH64_TESTS += bti-1
+bti-1: LDFLAGS += -nostdlib -Wl,-T,$(AARCH64_SRC)/bti.ld
+
 TESTS:=$(AARCH64_TESTS)
diff --git a/tests/tcg/aarch64/bti.ld b/tests/tcg/aarch64/bti.ld
new file mode 100644
index 0000000000..a5ef98f8a2
--- /dev/null
+++ b/tests/tcg/aarch64/bti.ld
@@ -0,0 +1,15 @@
+ENTRY(_start)
+
+PHDRS
+{
+  text PT_LOAD FILEHDR PHDRS;
+  prop 0x6474e553 ;  /* PT_GNU_PROPERTY */
+}
+
+SECTIONS
+{
+  . = 1M + SIZEOF_HEADERS;
+  .note.gnu.property : { *(.note.gnu.property) } :text :prop
+  .text : { *(.text) *(.rodata) } :text
+  /DISCARD/ : { *(.note.gnu.build-id) }
+}
-- 
2.17.1
