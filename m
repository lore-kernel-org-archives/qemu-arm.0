Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp558049lfg;
        Sat, 21 Aug 2021 13:09:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOPL6yiq6vcdM3+2FrvVriIk0Jg0oPg3c4y6W/zfwO5C9c5Dug0n+LmClrIJSOD0HHoVJM
X-Received: by 2002:a6b:c8c7:: with SMTP id y190mr14484718iof.210.1629576550513;
        Sat, 21 Aug 2021 13:09:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629576550; cv=none;
        d=google.com; s=arc-20160816;
        b=wyNKKR4QrVyl+4dX588nvObSrbQFqYOTVVtfe0FFAwPASKxjOEj4LYHADNZRkZcTg9
         zCi2ipWzNKPVwLbBh8+q/fvA4KZ0iNpdVqvlbODYul4Pjh+sh8DbCHldrV2FkdeSZJoM
         q+dUklzO29ON0h/eP8jY3vf3BrN02/IhTtQWiOBHW7xJFqTTLrfaOK4sEJ9e37HU8Nf4
         oXJJ4V9I4t2aqd26NyO4FhFDkSrmZwbPCxv3lZNmd4Y3HI++ECC+e0fFxnQ0Ma1cF52Y
         lUTSMNs87LXLFTGq4sD66NoP5ikJhV1Q05KfCUpLFaVunRQkhvnO2J4iC0595QtXT7eB
         28pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Y0WTE2RfE+PmoTGLshyvWonUTc3RdZZ7/tjZ5VZamls=;
        b=VuiOjdfutJAwdfWxM6czAeEhGYxJi7JVhrxIsdLUbaGQ3TZq5powdWHvXNCZZx4ybO
         lNHJZD1jS2xgwpXmnDVydiXfy1Kpc5m8h1NSeGvsE4RaV6K6u72+15Xoc65cFg7seNmK
         5/j8XNad3mwMzGHN2iQV2kcml1FX2kD0sSMt8F7hKPIKu8nJ3Fk8ddfd1aUZTAvQyYfo
         r7UtlfaF/J+0TqzntbD56s0ifZIBF/ZuyLoT9FKM4b9jmQoaWOZS2CGOGMypovXQausH
         tHlrM7aoy8JStScwHD6IQhvzqHOHaMGFbgbK9hQU5Cwi4QD7QjZh9sOqSNfO0CjPInsS
         +bFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PWp2PQBw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u11si2626400jau.60.2021.08.21.13.09.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Aug 2021 13:09:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PWp2PQBw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mHXIj-0000Ga-R3
	for alex.bennee@linaro.org; Sat, 21 Aug 2021 16:09:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHXA2-0002IT-GX
 for qemu-arm@nongnu.org; Sat, 21 Aug 2021 16:00:10 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:36863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHX9y-0004Xb-KL
 for qemu-arm@nongnu.org; Sat, 21 Aug 2021 16:00:10 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 u13-20020a17090abb0db0290177e1d9b3f7so16094559pjr.1
 for <qemu-arm@nongnu.org>; Sat, 21 Aug 2021 13:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y0WTE2RfE+PmoTGLshyvWonUTc3RdZZ7/tjZ5VZamls=;
 b=PWp2PQBwm6yih3kMRLxKtVC1jHnJcj/Q6UwlxcnDY8oLtHHtLzU+x1Op1YlQ17AkD8
 MYZI43enOXjq4wZdXsj7kpRxQfaIw6a+nxLkww9ygejATzo35r+BZGvPM5lHJ61m8E48
 vW6CRID2uU0RGW2XwlYtWPbxOrdpSyPxBYejPrfvuxRw55xSe0xqI6CayZ1br138wvD9
 RhGknyWHDqWqdR1QshncqgLsoRZZSQdHmveSU+vga4z3CgNt43K4l+N//SYB6AZYBB4L
 NrkuuO4syr+0q9K9Lcqr6YMXA4oZoUoc6QoqikLQ5Dxqu2+erx+x6WqAn5jHcJE99fq2
 Fd1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y0WTE2RfE+PmoTGLshyvWonUTc3RdZZ7/tjZ5VZamls=;
 b=oA7Nk9z4hx9Uwkenh6lvFOF+/zTwn0CttHVhopoPn1+YzToyHpzuDJKSL+FSYwjqpO
 p9pV4INz49WZEobSTTySPqvYO4MLKtgYMoOozuRH1efyNFQEv5zbafiK+vAs7xjpOgCG
 AsXYn/33XPHaSIiRK2xlCPkxTL4aKdYdS5yXcOenSP6N6Ypkbw4yeOcYNePvjNY/lS2N
 Mwdm2OpXDh642Ni9lyiGZkiE5l2Eg2qvY4DfZLmpplhSOBIglw4+X5dRXIasMwhl4PWP
 nzA/XLn32qriWYVWBAn+qkx/18N2rPqnyjcc1AVyg1sddTNkrPWcTfk0qTYA6+12mwco
 zlyw==
X-Gm-Message-State: AOAM530l3QjgSN8Ie3/wo9z/+dNTjDjWTOd3yNN8K6ukUf6p/beWZvsK
 TdZYG1ErL244Ql2e9qPnHQPONQ==
X-Received: by 2002:a17:902:6949:b029:12c:591a:2ed7 with SMTP id
 k9-20020a1709026949b029012c591a2ed7mr21968741plt.14.1629576005146; 
 Sat, 21 Aug 2021 13:00:05 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id h13sm12562257pgh.93.2021.08.21.13.00.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 13:00:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 8/8] tests/tcg: Add arm and aarch64 pc alignment tests
Date: Sat, 21 Aug 2021 12:59:58 -0700
Message-Id: <20210821195958.41312-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210821195958.41312-1-richard.henderson@linaro.org>
References: <20210821195958.41312-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NaWzyu6hdoJg

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/aarch64/pcalign-a64.c   | 37 +++++++++++++++++++++++++
 tests/tcg/arm/pcalign-a32.c       | 46 +++++++++++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.target |  4 +--
 tests/tcg/arm/Makefile.target     |  4 +++
 4 files changed, 89 insertions(+), 2 deletions(-)
 create mode 100644 tests/tcg/aarch64/pcalign-a64.c
 create mode 100644 tests/tcg/arm/pcalign-a32.c

diff --git a/tests/tcg/aarch64/pcalign-a64.c b/tests/tcg/aarch64/pcalign-a64.c
new file mode 100644
index 0000000000..6b9277f919
--- /dev/null
+++ b/tests/tcg/aarch64/pcalign-a64.c
@@ -0,0 +1,37 @@
+/* Test PC misalignment exception */
+
+#include <assert.h>
+#include <signal.h>
+#include <stdlib.h>
+#include <stdio.h>
+
+static void *expected;
+
+static void sigbus(int sig, siginfo_t *info, void *vuc)
+{
+    assert(info->si_code == BUS_ADRALN);
+    assert(info->si_addr == expected);
+    exit(EXIT_SUCCESS);
+}
+
+int main()
+{
+    void *tmp;
+
+    struct sigaction sa = {
+        .sa_sigaction = sigbus,
+        .sa_flags = SA_SIGINFO
+    };
+
+    if (sigaction(SIGBUS, &sa, NULL) < 0) {
+        perror("sigaction");
+        return EXIT_FAILURE;
+    }
+
+    asm volatile("adr %0, 1f + 1\n\t"
+                 "str %0, %1\n\t"
+                 "br  %0\n"
+                 "1:"
+                 : "=&r"(tmp), "=m"(expected));
+    abort();
+}
diff --git a/tests/tcg/arm/pcalign-a32.c b/tests/tcg/arm/pcalign-a32.c
new file mode 100644
index 0000000000..3c9c8cc97b
--- /dev/null
+++ b/tests/tcg/arm/pcalign-a32.c
@@ -0,0 +1,46 @@
+/* Test PC misalignment exception */
+
+#ifdef __thumb__
+#error "This test must be compiled for ARM"
+#endif
+
+#include <assert.h>
+#include <signal.h>
+#include <stdlib.h>
+#include <stdio.h>
+
+static void *expected;
+
+static void sigbus(int sig, siginfo_t *info, void *vuc)
+{
+    assert(info->si_code == BUS_ADRALN);
+    assert(info->si_addr == expected);
+    exit(EXIT_SUCCESS);
+}
+
+int main()
+{
+    void *tmp;
+
+    struct sigaction sa = {
+        .sa_sigaction = sigbus,
+        .sa_flags = SA_SIGINFO
+    };
+
+    if (sigaction(SIGBUS, &sa, NULL) < 0) {
+        perror("sigaction");
+        return EXIT_FAILURE;
+    }
+
+    asm volatile("adr %0, 1f + 2\n\t"
+                 "str %0, %1\n\t"
+                 "bx  %0\n"
+                 "1:"
+                 : "=&r"(tmp), "=m"(expected));
+
+    /*
+     * From v8, it is CONSTRAINED UNPREDICTABLE whether BXWritePC aligns
+     * the address or not.  If so, we can legitimately fall through.
+     */
+    return EXIT_SUCCESS;
+}
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 2c05c90d17..1d967901bd 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -8,8 +8,8 @@ VPATH 		+= $(ARM_SRC)
 AARCH64_SRC=$(SRC_PATH)/tests/tcg/aarch64
 VPATH 		+= $(AARCH64_SRC)
 
-# Float-convert Tests
-AARCH64_TESTS=fcvt
+# Base architecture tests
+AARCH64_TESTS=fcvt pcalign-a64
 
 fcvt: LDFLAGS+=-lm
 
diff --git a/tests/tcg/arm/Makefile.target b/tests/tcg/arm/Makefile.target
index 5ab59ed6ce..f509d823d4 100644
--- a/tests/tcg/arm/Makefile.target
+++ b/tests/tcg/arm/Makefile.target
@@ -29,6 +29,10 @@ run-fcvt: fcvt
 	$(call run-test,fcvt,$(QEMU) $<,"$< on $(TARGET_NAME)")
 	$(call diff-out,fcvt,$(ARM_SRC)/fcvt.ref)
 
+# PC alignment test
+ARM_TESTS += pcalign-a32
+pcalign-a32: CFLAGS+=-marm
+
 ifeq ($(CONFIG_ARM_COMPATIBLE_SEMIHOSTING),y)
 
 # Semihosting smoke test for linux-user
-- 
2.25.1

