Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp484969njk;
        Thu, 23 Jan 2025 15:44:22 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUl+KO9cqwTogdptzTpGhrbLZFG85VHQ0QF8rkYQkKVLUE4pqkfhhxF8ZshZCS+h95LlSsEEeR66b5ckg==@linaro.org
X-Received: by 2002:a05:600c:4fcf:b0:434:e892:1033 with SMTP id 5b1f17b1804b1-438bd052fedmr10829435e9.2.1737675862718;
        Thu, 23 Jan 2025 15:44:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737675862; cv=none;
        d=google.com; s=arc-20240605;
        b=F/a2meKtJveATl2uDCifpoX3fjdSiBdpRTW3lz2/vmQ+tiL4O6E+B6myAEDBXA7yel
         MpLOoZib3nU5OqLW49bAkA1f7s544VN+jGptpGeHbXbZQRRHBDvMeOEtPC5KeyZmH3xo
         PY4D+oHoObYpBQdvMkeMlPWmRpXZV6y8FpLPXF8XvQFG8gFEQ1hD28CG8W5jhCdONFUK
         7a6dtL4BrRe7gU6OK0nZnzhRM/e6wsotUmb4SmxL2g6i6wvcN0yDxhReUf2IpslFgwRq
         0i3od5vOIsmXbUCanQbCNrsGZOX3pPphxRqsHyk8ko66mJY+34nRMQgPpoBcQSa4QdBJ
         FdMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=7gr0bDqRAyX8smxLdEX+9XpZH40OE0aprdKko/M9qp4=;
        fh=yPcJd2Q/wdUN+JFVYkaWiB2iJCYrVehQ8aS7/yeIvYE=;
        b=YCxk70CPgrwelvmX2J/QhtGNlCOt+3oFnCIaHYcbUAohrvGEIbWoZbgq/6gIOKRLQC
         pyeH/+sFMoaYP9IZsCu7M8la1rziB2WN/z4xj8X53s/0GHNeGy+KjhtU5vf5kQJZxKEq
         dL4/BoSDNonsiqF1dsAAYZeojlfTpJmdBkwyLpZMs/rfhAzmGJSBvHPfU3rrsAAg6J9b
         u8KjwviqA/FryNkZv/HO7pl1AYUvFpxZ2o/15X9rnRMfuRE2TIljt5ftYXrDEgcBVVw3
         BEQQv7gjmGYajPXPEGZO6tEydtWzYOt8Eg5xljTn+a9ATFeNtqXN3OStUZxUULHRRyH0
         GaKA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gNVrTAsy;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38c2a17d411sor266026f8f.2.2025.01.23.15.44.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 23 Jan 2025 15:44:22 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gNVrTAsy;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737675862; x=1738280662; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7gr0bDqRAyX8smxLdEX+9XpZH40OE0aprdKko/M9qp4=;
        b=gNVrTAsyJzr89ug3FiQ4LXJFYhzKCJEZDsPSq04GhuoLNXvGpEHUUYlrdr+uj8Mbko
         t7Zt3EoV7SsKM+5M2g1Cmzz65LqVVN1/o6q0j3+2IS+i0stAbb5QJOSniXarRn+ioi2L
         mPAx2VqTUegDVNTh7DHWNO3A3t1rOgY3YuEV4j8S8SEW6LaS3P8qc+1S3JeHp1VW+4qY
         01yEC5+9BGaJDCCXA7Ujfg9A7zAygDFIg5vQ96ekHJmS4MUhaijRtju3mFtYxmurDGLy
         mGctr3KEWx/lmqrhB3nJMaWG9jHXHkivyN8gXVLBv1q1pPSvYNoIA7J6g/xhhFSXlDXc
         fDaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737675862; x=1738280662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7gr0bDqRAyX8smxLdEX+9XpZH40OE0aprdKko/M9qp4=;
        b=HKes5XZNIEIKZg+CoLLxQ5R41vg42Se5O7LaRLEu7CDe48rsnFJIP5sfnNffBK3hcW
         ccqGPXIILTJAc7mjgNVFPEz7bqZjsT5Ywc4D+ZaU1CthD2MNhZY/EG1jh9qiCLhApLdG
         223qPG2zHZU1NrFNJqHQLatXP+av9EAHPJaqnOdgk1fE3yL0kn1DrcIJUbWEogtW0ISB
         6czgU5nfp7rVMeIu4yaj4sLolQoItdVQbJG71L7zH9Jftc+O8Aq7C+XhSgIU6oJnWnZx
         8Fbf4c/I8GxqL0Z7W+yD4jXke/m2AH4DJXjm8YXj+gBHpjufRzQTGP16wk8L6ITlcE5q
         q8ig==
X-Forwarded-Encrypted: i=1; AJvYcCVgMCuiJeGNOqb7nFAa7i/g4Uebum2YEY7hukAD4MvKomtvn0m+zX39KGyEi9XykVdaVmiod2I5AQPn+g==@linaro.org
X-Gm-Message-State: AOJu0YzYXswCkBzcKnz7l31ABJXE8aASvoSuQxtwO9Vn235lUGxK+oKf
	FkH/4BbIXNwpl1AXQPjheSRiaZ8Z8CFuLkEOv2Cce6PPgoGdvaWpzW8LVKfu4F5tGw==
X-Gm-Gg: ASbGnctTrO/IxCMeRlh8LHChw2+7JP9LUNJEoejBMXZhapy2EmOtZ/bc7XFV9BFACIA
	VGej4VkUPax24cIqia+R5vkN891QJNaVw11BBc9DXJXVSsAkofd0uMpfiMFgtsemX9xRk18E3zg
	gkW5u37yQwjfF7OSgmS+thAjsYor6lTUHKtKx3Ty1drxi58yUkzMyV15koVwsXdJXNOjHbDNoGD
	84obs6MqfozALlHYVSwjO+G1kWkOHpHeNUi8eF1Ac0JZTP0VBCq7sEsZmBN1xs/6vN9eMXSa0NO
	hyRSERdC4RBM9szETBBp/NG0ymRIVLMILONm8JeJfb9lFU2J/n/NNnM=
X-Google-Smtp-Source: AGHT+IFO1I6JtHdZSiAttwFg1MlQL9TeL6Qp22FcnpRuMJ6TxX0mL0F5rCxwJt2t6SeC+o26N2z+Yw==
X-Received: by 2002:a5d:5885:0:b0:386:3213:5b80 with SMTP id ffacd0b85a97d-38c2b7cdc55mr1203868f8f.24.1737675862142;
        Thu, 23 Jan 2025 15:44:22 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1764c8sm979124f8f.3.2025.01.23.15.44.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 23 Jan 2025 15:44:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	qemu-s390x@nongnu.org,
	xen-devel@lists.xenproject.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH 01/20] qemu/compiler: Absorb 'clang-tsa.h'
Date: Fri, 24 Jan 2025 00:43:55 +0100
Message-ID: <20250123234415.59850-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123234415.59850-1-philmd@linaro.org>
References: <20250123234415.59850-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: kL5t+dwcPNNI

We already have "qemu/compiler.h" for compiler-specific arrangements,
automatically included by "qemu/osdep.h" for each source file. No
need to explicitly include a header for a Clang particularity.

Suggested-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 bsd-user/qemu.h                  |   1 -
 include/block/block_int-common.h |   1 -
 include/block/graph-lock.h       |   2 -
 include/exec/page-protection.h   |   2 -
 include/qemu/clang-tsa.h         | 114 -------------------------------
 include/qemu/compiler.h          |  87 +++++++++++++++++++++++
 include/qemu/thread.h            |   1 -
 block/create.c                   |   1 -
 tests/unit/test-bdrv-drain.c     |   1 -
 tests/unit/test-block-iothread.c |   1 -
 util/qemu-thread-posix.c         |   1 -
 11 files changed, 87 insertions(+), 125 deletions(-)
 delete mode 100644 include/qemu/clang-tsa.h

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 3eaa14f3f56..4e97c796318 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -40,7 +40,6 @@ extern char **environ;
 #include "target.h"
 #include "exec/gdbstub.h"
 #include "exec/page-protection.h"
-#include "qemu/clang-tsa.h"
 #include "accel/tcg/vcpu-state.h"
 
 #include "qemu-os.h"
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index bb91a0f62fa..ebb4e56a503 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -28,7 +28,6 @@
 #include "block/block-common.h"
 #include "block/block-global-state.h"
 #include "block/snapshot.h"
-#include "qemu/clang-tsa.h"
 #include "qemu/iov.h"
 #include "qemu/rcu.h"
 #include "qemu/stats64.h"
diff --git a/include/block/graph-lock.h b/include/block/graph-lock.h
index dc8d9491843..2c26c721081 100644
--- a/include/block/graph-lock.h
+++ b/include/block/graph-lock.h
@@ -20,8 +20,6 @@
 #ifndef GRAPH_LOCK_H
 #define GRAPH_LOCK_H
 
-#include "qemu/clang-tsa.h"
-
 /**
  * Graph Lock API
  * This API provides a rwlock used to protect block layer
diff --git a/include/exec/page-protection.h b/include/exec/page-protection.h
index bae3355f62c..3e0a8a03331 100644
--- a/include/exec/page-protection.h
+++ b/include/exec/page-protection.h
@@ -40,8 +40,6 @@
 
 #ifdef CONFIG_USER_ONLY
 
-#include "qemu/clang-tsa.h"
-
 void TSA_NO_TSA mmap_lock(void);
 void TSA_NO_TSA mmap_unlock(void);
 bool have_mmap_lock(void);
diff --git a/include/qemu/clang-tsa.h b/include/qemu/clang-tsa.h
deleted file mode 100644
index ba06fb8c924..00000000000
--- a/include/qemu/clang-tsa.h
+++ /dev/null
@@ -1,114 +0,0 @@
-#ifndef CLANG_TSA_H
-#define CLANG_TSA_H
-
-/*
- * Copyright 2018 Jarkko Hietaniemi <jhi@iki.fi>
- *
- * Permission is hereby granted, free of charge, to any person obtaining
- * a copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without
- * limitation the rights to use, copy, modify, merge, publish,
- * distribute, sublicense, and/or sell copies of the Software, and to
- * permit persons to whom the Software is furnished to do so, subject to
- * the following conditions:
- *
- * The above copyright notice and this permission notice shall be
- * included in all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
- * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
- * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
- * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
- * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
- * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
- * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
- */
-
-/* http://clang.llvm.org/docs/ThreadSafetyAnalysis.html
- *
- * TSA is available since clang 3.6-ish.
- */
-#ifdef __clang__
-#  define TSA(x)   __attribute__((x))
-#else
-#  define TSA(x)   /* No TSA, make TSA attributes no-ops. */
-#endif
-
-/* TSA_CAPABILITY() is used to annotate typedefs:
- *
- * typedef pthread_mutex_t TSA_CAPABILITY("mutex") tsa_mutex;
- */
-#define TSA_CAPABILITY(x) TSA(capability(x))
-
-/* TSA_GUARDED_BY() is used to annotate global variables,
- * the data is guarded:
- *
- * Foo foo TSA_GUARDED_BY(mutex);
- */
-#define TSA_GUARDED_BY(x) TSA(guarded_by(x))
-
-/* TSA_PT_GUARDED_BY() is used to annotate global pointers, the data
- * behind the pointer is guarded.
- *
- * Foo* ptr TSA_PT_GUARDED_BY(mutex);
- */
-#define TSA_PT_GUARDED_BY(x) TSA(pt_guarded_by(x))
-
-/* The TSA_REQUIRES() is used to annotate functions: the caller of the
- * function MUST hold the resource, the function will NOT release it.
- *
- * More than one mutex may be specified, comma-separated.
- *
- * void Foo(void) TSA_REQUIRES(mutex);
- */
-#define TSA_REQUIRES(...) TSA(requires_capability(__VA_ARGS__))
-#define TSA_REQUIRES_SHARED(...) TSA(requires_shared_capability(__VA_ARGS__))
-
-/* TSA_EXCLUDES() is used to annotate functions: the caller of the
- * function MUST NOT hold resource, the function first acquires the
- * resource, and then releases it.
- *
- * More than one mutex may be specified, comma-separated.
- *
- * void Foo(void) TSA_EXCLUDES(mutex);
- */
-#define TSA_EXCLUDES(...) TSA(locks_excluded(__VA_ARGS__))
-
-/* TSA_ACQUIRE() is used to annotate functions: the caller of the
- * function MUST NOT hold the resource, the function will acquire the
- * resource, but NOT release it.
- *
- * More than one mutex may be specified, comma-separated.
- *
- * void Foo(void) TSA_ACQUIRE(mutex);
- */
-#define TSA_ACQUIRE(...) TSA(acquire_capability(__VA_ARGS__))
-#define TSA_ACQUIRE_SHARED(...) TSA(acquire_shared_capability(__VA_ARGS__))
-
-/* TSA_RELEASE() is used to annotate functions: the caller of the
- * function MUST hold the resource, but the function will then release it.
- *
- * More than one mutex may be specified, comma-separated.
- *
- * void Foo(void) TSA_RELEASE(mutex);
- */
-#define TSA_RELEASE(...) TSA(release_capability(__VA_ARGS__))
-#define TSA_RELEASE_SHARED(...) TSA(release_shared_capability(__VA_ARGS__))
-
-/* TSA_NO_TSA is used to annotate functions.  Use only when you need to.
- *
- * void Foo(void) TSA_NO_TSA;
- */
-#define TSA_NO_TSA TSA(no_thread_safety_analysis)
-
-/*
- * TSA_ASSERT() is used to annotate functions: This function will assert that
- * the lock is held. When it returns, the caller of the function is assumed to
- * already hold the resource.
- *
- * More than one mutex may be specified, comma-separated.
- */
-#define TSA_ASSERT(...) TSA(assert_capability(__VA_ARGS__))
-#define TSA_ASSERT_SHARED(...) TSA(assert_shared_capability(__VA_ARGS__))
-
-#endif /* #ifndef CLANG_TSA_H */
diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
index d904408e5ed..af0a9b17ff9 100644
--- a/include/qemu/compiler.h
+++ b/include/qemu/compiler.h
@@ -207,6 +207,93 @@
 # define QEMU_USED
 #endif
 
+/* http://clang.llvm.org/docs/ThreadSafetyAnalysis.html
+ *
+ * TSA is available since clang 3.6-ish.
+ */
+#ifdef __clang__
+#  define TSA(x)   __attribute__((x))
+#else
+#  define TSA(x)   /* No TSA, make TSA attributes no-ops. */
+#endif
+
+/* TSA_CAPABILITY() is used to annotate typedefs:
+ *
+ * typedef pthread_mutex_t TSA_CAPABILITY("mutex") tsa_mutex;
+ */
+#define TSA_CAPABILITY(x) TSA(capability(x))
+
+/* TSA_GUARDED_BY() is used to annotate global variables,
+ * the data is guarded:
+ *
+ * Foo foo TSA_GUARDED_BY(mutex);
+ */
+#define TSA_GUARDED_BY(x) TSA(guarded_by(x))
+
+/* TSA_PT_GUARDED_BY() is used to annotate global pointers, the data
+ * behind the pointer is guarded.
+ *
+ * Foo* ptr TSA_PT_GUARDED_BY(mutex);
+ */
+#define TSA_PT_GUARDED_BY(x) TSA(pt_guarded_by(x))
+
+/* The TSA_REQUIRES() is used to annotate functions: the caller of the
+ * function MUST hold the resource, the function will NOT release it.
+ *
+ * More than one mutex may be specified, comma-separated.
+ *
+ * void Foo(void) TSA_REQUIRES(mutex);
+ */
+#define TSA_REQUIRES(...) TSA(requires_capability(__VA_ARGS__))
+#define TSA_REQUIRES_SHARED(...) TSA(requires_shared_capability(__VA_ARGS__))
+
+/* TSA_EXCLUDES() is used to annotate functions: the caller of the
+ * function MUST NOT hold resource, the function first acquires the
+ * resource, and then releases it.
+ *
+ * More than one mutex may be specified, comma-separated.
+ *
+ * void Foo(void) TSA_EXCLUDES(mutex);
+ */
+#define TSA_EXCLUDES(...) TSA(locks_excluded(__VA_ARGS__))
+
+/* TSA_ACQUIRE() is used to annotate functions: the caller of the
+ * function MUST NOT hold the resource, the function will acquire the
+ * resource, but NOT release it.
+ *
+ * More than one mutex may be specified, comma-separated.
+ *
+ * void Foo(void) TSA_ACQUIRE(mutex);
+ */
+#define TSA_ACQUIRE(...) TSA(acquire_capability(__VA_ARGS__))
+#define TSA_ACQUIRE_SHARED(...) TSA(acquire_shared_capability(__VA_ARGS__))
+
+/* TSA_RELEASE() is used to annotate functions: the caller of the
+ * function MUST hold the resource, but the function will then release it.
+ *
+ * More than one mutex may be specified, comma-separated.
+ *
+ * void Foo(void) TSA_RELEASE(mutex);
+ */
+#define TSA_RELEASE(...) TSA(release_capability(__VA_ARGS__))
+#define TSA_RELEASE_SHARED(...) TSA(release_shared_capability(__VA_ARGS__))
+
+/* TSA_NO_TSA is used to annotate functions.  Use only when you need to.
+ *
+ * void Foo(void) TSA_NO_TSA;
+ */
+#define TSA_NO_TSA TSA(no_thread_safety_analysis)
+
+/*
+ * TSA_ASSERT() is used to annotate functions: This function will assert that
+ * the lock is held. When it returns, the caller of the function is assumed to
+ * already hold the resource.
+ *
+ * More than one mutex may be specified, comma-separated.
+ */
+#define TSA_ASSERT(...) TSA(assert_capability(__VA_ARGS__))
+#define TSA_ASSERT_SHARED(...) TSA(assert_shared_capability(__VA_ARGS__))
+
 /*
  * Ugly CPP trick that is like "defined FOO", but also works in C
  * code.  Useful to replace #ifdef with "if" statements; assumes
diff --git a/include/qemu/thread.h b/include/qemu/thread.h
index 7eba27a7049..6f800aad31a 100644
--- a/include/qemu/thread.h
+++ b/include/qemu/thread.h
@@ -3,7 +3,6 @@
 
 #include "qemu/processor.h"
 #include "qemu/atomic.h"
-#include "qemu/clang-tsa.h"
 
 typedef struct QemuCond QemuCond;
 typedef struct QemuSemaphore QemuSemaphore;
diff --git a/block/create.c b/block/create.c
index 72abafb4c12..6b23a216753 100644
--- a/block/create.c
+++ b/block/create.c
@@ -24,7 +24,6 @@
 
 #include "qemu/osdep.h"
 #include "block/block_int.h"
-#include "qemu/clang-tsa.h"
 #include "qemu/job.h"
 #include "qemu/main-loop.h"
 #include "qapi/qapi-commands-block-core.h"
diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index 98ad89b390c..7410e6f3528 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -28,7 +28,6 @@
 #include "system/block-backend.h"
 #include "qapi/error.h"
 #include "qemu/main-loop.h"
-#include "qemu/clang-tsa.h"
 #include "iothread.h"
 
 static QemuEvent done_event;
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index 1de04a8a13d..26a6c051758 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -29,7 +29,6 @@
 #include "system/block-backend.h"
 #include "qapi/error.h"
 #include "qapi/qmp/qdict.h"
-#include "qemu/clang-tsa.h"
 #include "qemu/main-loop.h"
 #include "iothread.h"
 
diff --git a/util/qemu-thread-posix.c b/util/qemu-thread-posix.c
index 6fff4162ac6..b2e26e21205 100644
--- a/util/qemu-thread-posix.c
+++ b/util/qemu-thread-posix.c
@@ -17,7 +17,6 @@
 #include "qemu-thread-common.h"
 #include "qemu/tsan.h"
 #include "qemu/bitmap.h"
-#include "qemu/clang-tsa.h"
 
 #ifdef CONFIG_PTHREAD_SET_NAME_NP
 #include <pthread_np.h>
-- 
2.47.1
