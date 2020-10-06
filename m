Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp871690lfq;
        Tue, 6 Oct 2020 10:24:22 -0700 (PDT)
X-Received: by 2002:a05:6402:17a6:: with SMTP id j6mr567290edy.322.1602005061964;
        Tue, 06 Oct 2020 10:24:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602005061; cv=none;
        d=google.com; s=arc-20160816;
        b=yxs5rxdlJtdPR93OJCA/8RmR58gg72xM0WwwpfYpLncUJ6W7pkWTzE5EJUnRaqX8m6
         0Md3HUsk0PX31WN44i46XaJyfuzcbFPC1KAlivBIEbvEYoAcpIwSIdXQXYy2YqN+7MD4
         VycGn0Juqsitq64WFOvDa1Aw0rNjvmzM8I0yFpM5s2tYnzC7GogxB0q1cCViJ1/Pv3iu
         5MwcygZKFHUzOq5rcsBYoSarFxGz7lxVLSA5A4X6kACEm3Ziw3XfoVekoTUJ06GLN4Rf
         t0pDln0GQWxebU5l/zpc2MR+XE1eYyCk4mwaMICceDc8NV5vbjR80WVvbKvipd3bdOD6
         WItw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ERee18FoTL0JMAd5NEQQsgDqJQ9rx0tJzGkfHm/LdgI=;
        b=UDpS36Qy19ubtPh2K3uZYaFioX6nvu3EBJHKiJOXyKCZJB9i2Gv9NG2RJQ3kJZLdTD
         UCbCaoPxVnACfUt435HcEWyGtZMP/7m+vLIg1/tGM5UdnjwVenvX0URWjpS0coG9eW+m
         ol1x30saDwWiAaHJTmcXOAavEegkoVZhMoJ2gSMmK+t82CmY1slRDdgkbRWmhPA2tdCk
         Hv2nF4fFvU1BCUMZkC2xf/FA/E9VLrMwTnp3hok8KAKGOedlB1L+8cQOmtW+zgNnetHl
         xJBRYjSCsNv+77e3Xo12xGMixG4M8DMDpmEe7dIgnHXglmGq0FgJubvzJvu8p6icpJOW
         PP1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xqRcutZD;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w12sor2397586ejf.64.2020.10.06.10.24.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 06 Oct 2020 10:24:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xqRcutZD;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ERee18FoTL0JMAd5NEQQsgDqJQ9rx0tJzGkfHm/LdgI=;
        b=xqRcutZD2orO5tu3bOZ+46W0sEzNpHj8u3EtWAvmUvYLtnmi1KhQXfy4dkLJrt2tz2
         BLh02lwqFk/noYcEjKrn0UC62GUc/pd9vm4Y6cypBrIiUynPWqHfR0gYDyyCPbk6FiPw
         XMdRrCQwLpMRIL3GTjfs6v+9R7tFeaoJpYsNqE/IihpfBMGNqy4jKoJKoNrrzDVIXRhE
         O6KeL+m+GnQgyZ6BxjePVHw8LBPR5cF2BnNkNTZM1rpeG8XuI2kJYfYg1KNYok+ocR7q
         CBavTdOmZfx9Blno8jszvaUFIarVcqLgaOHVqmIKME868CKGowCVyeIBKQh2WmZjp2dI
         s66A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ERee18FoTL0JMAd5NEQQsgDqJQ9rx0tJzGkfHm/LdgI=;
        b=IjM1bMRy+SuWqsVDNxZ/mY+2yp2OgYXHTwXFPpir22d6LzcsXYYoVCRnFmnuD6zTwD
         VoCy2GdWXFOz9jSxn0x4xQXGrEpV4dFPxK8f2k3OhyaXCCRZURRi2G0aDB15OzEt06C/
         7YnAh86BrCJZpN8j5ln134HDvdv93A3gJybhHC9nymtpiA1SH7FIKBQvg+vcgMKT76ek
         XCrknEmvh9Msg0WFGKA0kIl2jNMXN6TTCUJBD1Q7H/QBjaQL8srZd0BS1PRgPQhSAzLP
         US2wwglpbYikMCyFqpcBzA95xa5VTp1+vmbGPb185krdhR8e34V7ba8wRElTzXQ5ipLv
         9eNg==
X-Gm-Message-State: AOAM532lymxTA/yiTf/kqbCO7HzIrDVb5nT7t73V2AD8hRTJnGC/xPGJ
	Uv2KXFalS6WLkf6rkRTYw9qJnh2e0CVQ/d2ZBfQ=
X-Google-Smtp-Source: ABdhPJxinL6to301GIvzEhZY+fHkEo+LIkLCEDHs8zyvRlaFm/WEqjSqS6iP19/5fyZKLyb0qPNgvg==
X-Received: by 2002:a17:906:f14b:: with SMTP id gw11mr610720ejb.41.1602005061639;
        Tue, 06 Oct 2020 10:24:21 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain ([185.81.136.21])
        by smtp.gmail.com with ESMTPSA id a22sm2536968ejs.25.2020.10.06.10.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 10:24:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH 1/1] tests/tcg/aarch64: Add bti mmap smoke test
Date: Tue,  6 Oct 2020 12:23:59 -0500
Message-Id: <20201006172359.2998-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201006172359.2998-1-richard.henderson@linaro.org>
References: <20201006172359.2998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: vtbsStUnfQ+4

This tests PROT_BTI, and also does not require special
compiler support.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/aarch64/bti-2.c         | 108 ++++++++++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.target |   7 +-
 2 files changed, 113 insertions(+), 2 deletions(-)
 create mode 100644 tests/tcg/aarch64/bti-2.c

diff --git a/tests/tcg/aarch64/bti-2.c b/tests/tcg/aarch64/bti-2.c
new file mode 100644
index 0000000000..6dc8908b5a
--- /dev/null
+++ b/tests/tcg/aarch64/bti-2.c
@@ -0,0 +1,108 @@
+/*
+ * Branch target identification, basic notskip cases.
+ */
+
+#include <stdio.h>
+#include <signal.h>
+#include <string.h>
+#include <unistd.h>
+#include <sys/mman.h>
+
+#ifndef PROT_BTI
+#define PROT_BTI  0x10
+#endif
+
+static void skip2_sigill(int sig, siginfo_t *info, void *vuc)
+{
+    ucontext_t *uc = vuc;
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
+#define BTYPE_1(DEST)    \
+    "mov x1, #1\n\t"     \
+    "adr x16, 1f\n\t"    \
+    "br x16\n"           \
+"1: " DEST "\n\t"        \
+    "mov x1, #0"
+
+#define BTYPE_2(DEST)    \
+    "mov x1, #1\n\t"     \
+    "adr x16, 1f\n\t"    \
+    "blr x16\n"          \
+"1: " DEST "\n\t"        \
+    "mov x1, #0"
+
+#define BTYPE_3(DEST)    \
+    "mov x1, #1\n\t"     \
+    "adr x15, 1f\n\t"    \
+    "br x15\n"           \
+"1: " DEST "\n\t"        \
+    "mov x1, #0"
+
+#define TEST(WHICH, DEST, EXPECT) \
+    WHICH(DEST) "\n"              \
+    ".if " #EXPECT "\n\t"         \
+    "eor x1, x1," #EXPECT "\n"    \
+    ".endif\n\t"                  \
+    "add x0, x0, x1\n\t"
+
+extern char test_begin[], test_end[];
+
+asm("\n"
+"test_begin:\n\t"
+    BTI_C "\n\t"
+    "mov x2, x30\n\t"
+    "mov x0, #0\n\t"
+
+    TEST(BTYPE_1, NOP, 1)
+    TEST(BTYPE_1, BTI_N, 1)
+    TEST(BTYPE_1, BTI_C, 0)
+    TEST(BTYPE_1, BTI_J, 0)
+    TEST(BTYPE_1, BTI_JC, 0)
+
+    TEST(BTYPE_2, NOP, 1)
+    TEST(BTYPE_2, BTI_N, 1)
+    TEST(BTYPE_2, BTI_C, 0)
+    TEST(BTYPE_2, BTI_J, 1)
+    TEST(BTYPE_2, BTI_JC, 0)
+
+    TEST(BTYPE_3, NOP, 1)
+    TEST(BTYPE_3, BTI_N, 1)
+    TEST(BTYPE_3, BTI_C, 1)
+    TEST(BTYPE_3, BTI_J, 0)
+    TEST(BTYPE_3, BTI_JC, 0)
+
+    "ret x2\n"
+"test_end:"
+);
+
+int main()
+{
+    struct sigaction sa;
+
+    void *p = mmap(0, getpagesize(),
+                   PROT_EXEC | PROT_READ | PROT_WRITE | PROT_BTI,
+                   MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+    if (p == MAP_FAILED) {
+        perror("mmap");
+        return 1;
+    }
+
+    memset(&sa, 0, sizeof(sa));
+    sa.sa_sigaction = skip2_sigill;
+    sa.sa_flags = SA_SIGINFO;
+    if (sigaction(SIGILL, &sa, NULL) < 0) {
+        perror("sigaction");
+        return 1;
+    }
+
+    memcpy(p, test_begin, test_end - test_begin);
+    return ((int (*)(void))p)();
+}
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 491683e91d..d7d33e293c 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -26,11 +26,14 @@ run-plugin-pauth-%: QEMU_OPTS += -cpu max
 endif
 
 # BTI Tests
+# bti-1 tests the elf notes, so we require special compiler support.
 ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_ARMV8_BTI),)
 AARCH64_TESTS += bti-1
-bti-%: CFLAGS += -mbranch-protection=standard
-bti-%: LDFLAGS += -nostdlib
+bti-1: CFLAGS += -mbranch-protection=standard
+bti-1: LDFLAGS += -nostdlib
 endif
+# bti-2 tests PROT_BTI, so no special compiler support required.
+AARCH64_TESTS += bti-2
 
 # Semihosting smoke test for linux-user
 AARCH64_TESTS += semihosting
-- 
2.25.1
