Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp276635ejb;
        Sat, 20 May 2023 09:29:13 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5z8gQoT0+CmP3ilKd+A/i2zO8yFWJvXe1scFYCroWq3qtpezDxHlo8yS3IxO4rPANjE8yp
X-Received: by 2002:a05:6214:5298:b0:616:58f1:2844 with SMTP id kj24-20020a056214529800b0061658f12844mr11020825qvb.45.1684600153748;
        Sat, 20 May 2023 09:29:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684600153; cv=none;
        d=google.com; s=arc-20160816;
        b=ByDve9++W2vsOqLKow8Y/lpIFZuoBdN5In5YtH9U0AmG7qPA8t+0pqIOhfPGSNosgG
         hAbv3fBHPpkLbRq6x75n5AqETuTquKF72rKT0FpDgyxYR5AKSHAB8WBaXwXAIpQq+bUN
         QhK3cBFqu6KD6JlZfkUrXELv5BTsimFKjOWdJFNP8IeOEVmsmhPnwvR8HR35wsuPmUfS
         fYxI9TlFWPngDmkpRVCd6gDdY7bjKJlxk5q4D4jivhkK20YyAzZU5aBx7ho5+j8R9C/R
         tvPmW/VdHm2YSZvgIpvZYaWbv6ldXzVmNwryiL2AZ8LGPp7UuJPhaktwYYqDUznwtLg7
         OU4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=SUpVnyemWEPOpO605ffDicbCJQoqq3GtxGHxc5DnjBc=;
        b=YZDwsq03ZTa9VgLTM29lNGHHAudtcvfyfS2+eUkpIxK/oRKTk+uOpdrFocsOU1rwoe
         UG9qK/3D5T7GdY4q/F+oL8ghSCvEFl7dgSCB4vFfHfUjRnHHT+wpZ3ik5kBJJ3l6l36J
         QFhqb+Ro7+FPvHQwvrU1KEgse5M01FwbEXj2bmuQxVoh0uFskaxz311oxwVhd7oOJqwV
         JzfuNjf1ccqLqPD0Q3CE21Ao+0ibdQDNShWle18ylT+PjLbHw+chTF5lwHzM9zLtCWS6
         lejDM4Bft8ktOI7ec4VvRFOwfqVScAfexk91O3RTCQlLiFGQJXF42y2WdU0Lsgg9lmd3
         Zw2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tsLk+47i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q3-20020ad45ca3000000b0061b60d73584si1234668qvh.548.2023.05.20.09.29.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 20 May 2023 09:29:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tsLk+47i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q0PQG-0003jW-Me; Sat, 20 May 2023 12:27:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q0PQ5-0003ef-7D
 for qemu-arm@nongnu.org; Sat, 20 May 2023 12:27:02 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q0PQ2-000392-FZ
 for qemu-arm@nongnu.org; Sat, 20 May 2023 12:27:00 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1ae615d5018so26546965ad.1
 for <qemu-arm@nongnu.org>; Sat, 20 May 2023 09:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684600015; x=1687192015;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SUpVnyemWEPOpO605ffDicbCJQoqq3GtxGHxc5DnjBc=;
 b=tsLk+47irudQUM9AhQj4lU+z/0Vqob39hWiHRZQyxpzh8u1vnhjsqccVnqTvXmQtRq
 Fk/cWvoflknTP0XHXU3OXgL/Eh3v47Ku4zHGmUKsfYdnWBzf/9shiPxbvcKpZnDdNIIV
 cejUNPq7T1tJ/PXUKjc6FxC4maxN6uflFA6yBp2x9rl3fsTR8zKPok0ZxOMhJabaf87n
 tTMi8cuZORfUPkfzta4LsjNe00C+uFJpfV1JMUmgJyMugNMTCfatibFW723w1K75k3hz
 a2DKv6vziKgMtcCmvdJ7l93WyWFFU5VwsJYIyR8ByIFgCrcwLTatC9uwdbEQRJfj6mf4
 L9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684600015; x=1687192015;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SUpVnyemWEPOpO605ffDicbCJQoqq3GtxGHxc5DnjBc=;
 b=IY7Jqz8Dr4+pSWzqiwSanPjkfoVDANfWpDBKloIiKdQdKzRDCPb/M1JeBemjXt/S91
 xonZGCBn72OVszFMsmcqByxdQzI8WDeDIyE7VzNXMhx25xaWCoSH3eExofnhp27JQZvb
 ghdx3FBXBJusBwAOZK+qobSYwUHOv5KJBkV4nz42TrmMMvUT2PdYUUQ4WhTi75fQyFEB
 qbMrbnhfIjCpICaB/9cffQk13j3Aoae3MJcFrQWG1jLVMEme9TUU9TjTr9vTyELGWVl/
 cg0KRtiO9bW+Obod19vcTLgHEDnlWtvwypgdNjB42D7f7CkA8B2frL9If/A0KrKpf1cu
 2j7A==
X-Gm-Message-State: AC+VfDz0BNmp9L/ClFj+PMnbdv3f0jF+K2H6fspPQDKStL4oI/hu8gEu
 nnm7My2C99ZFhuoSoIZU25MMndJA//iBUnVK4Mg=
X-Received: by 2002:a17:902:f7d6:b0:1aa:fec9:5219 with SMTP id
 h22-20020a170902f7d600b001aafec95219mr5812680plw.61.1684600015618; 
 Sat, 20 May 2023 09:26:55 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:d078:d94e:cb2b:a055])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170903230c00b001a5260a6e6csm1697104plh.206.2023.05.20.09.26.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 May 2023 09:26:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 11/27] include/host: Split out atomic128-ldst.h
Date: Sat, 20 May 2023 09:26:18 -0700
Message-Id: <20230520162634.3991009-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230520162634.3991009-1-richard.henderson@linaro.org>
References: <20230520162634.3991009-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: m7jqhtHMASOq

Separates the aarch64-specific portion into its own file.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 host/include/aarch64/host/atomic128-cas.h  |  2 +-
 host/include/aarch64/host/atomic128-ldst.h | 49 ++++++++++++++
 host/include/generic/host/atomic128-ldst.h | 57 +++++++++++++++++
 include/qemu/atomic128.h                   | 74 +---------------------
 4 files changed, 108 insertions(+), 74 deletions(-)
 create mode 100644 host/include/aarch64/host/atomic128-ldst.h
 create mode 100644 host/include/generic/host/atomic128-ldst.h

diff --git a/host/include/aarch64/host/atomic128-cas.h b/host/include/aarch64/host/atomic128-cas.h
index 1247995419..33f365ce67 100644
--- a/host/include/aarch64/host/atomic128-cas.h
+++ b/host/include/aarch64/host/atomic128-cas.h
@@ -1,6 +1,6 @@
 /*
  * SPDX-License-Identifier: GPL-2.0-or-later
- * Compare-and-swap for 128-bit atomic operations, generic version.
+ * Compare-and-swap for 128-bit atomic operations, aarch64 version.
  *
  * Copyright (C) 2018, 2023 Linaro, Ltd.
  *
diff --git a/host/include/aarch64/host/atomic128-ldst.h b/host/include/aarch64/host/atomic128-ldst.h
new file mode 100644
index 0000000000..c2e7b44bc5
--- /dev/null
+++ b/host/include/aarch64/host/atomic128-ldst.h
@@ -0,0 +1,49 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Load/store for 128-bit atomic operations, aarch64 version.
+ *
+ * Copyright (C) 2018, 2023 Linaro, Ltd.
+ *
+ * See docs/devel/atomics.rst for discussion about the guarantees each
+ * atomic primitive is meant to provide.
+ */
+
+#ifndef AARCH64_ATOMIC128_LDST_H
+#define AARCH64_ATOMIC128_LDST_H
+
+/* Through gcc 10, aarch64 has no support for 128-bit atomics.  */
+#if !defined(CONFIG_ATOMIC128) && !defined(CONFIG_USER_ONLY)
+/* We can do better than cmpxchg for AArch64.  */
+static inline Int128 atomic16_read(Int128 *ptr)
+{
+    uint64_t l, h;
+    uint32_t tmp;
+
+    /* The load must be paired with the store to guarantee not tearing.  */
+    asm("0: ldxp %[l], %[h], %[mem]\n\t"
+        "stxp %w[tmp], %[l], %[h], %[mem]\n\t"
+        "cbnz %w[tmp], 0b"
+        : [mem] "+m"(*ptr), [tmp] "=r"(tmp), [l] "=r"(l), [h] "=r"(h));
+
+    return int128_make128(l, h);
+}
+
+static inline void atomic16_set(Int128 *ptr, Int128 val)
+{
+    uint64_t l = int128_getlo(val), h = int128_gethi(val);
+    uint64_t t1, t2;
+
+    /* Load into temporaries to acquire the exclusive access lock.  */
+    asm("0: ldxp %[t1], %[t2], %[mem]\n\t"
+        "stxp %w[t1], %[l], %[h], %[mem]\n\t"
+        "cbnz %w[t1], 0b"
+        : [mem] "+m"(*ptr), [t1] "=&r"(t1), [t2] "=&r"(t2)
+        : [l] "r"(l), [h] "r"(h));
+}
+
+# define HAVE_ATOMIC128 1
+#else
+#include "host/include/generic/host/atomic128-ldst.h"
+#endif
+
+#endif /* AARCH64_ATOMIC128_LDST_H */
diff --git a/host/include/generic/host/atomic128-ldst.h b/host/include/generic/host/atomic128-ldst.h
new file mode 100644
index 0000000000..e7354a9255
--- /dev/null
+++ b/host/include/generic/host/atomic128-ldst.h
@@ -0,0 +1,57 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Load/store for 128-bit atomic operations, generic version.
+ *
+ * Copyright (C) 2018, 2023 Linaro, Ltd.
+ *
+ * See docs/devel/atomics.rst for discussion about the guarantees each
+ * atomic primitive is meant to provide.
+ */
+
+#ifndef HOST_ATOMIC128_LDST_H
+#define HOST_ATOMIC128_LDST_H
+
+#if defined(CONFIG_ATOMIC128)
+static inline Int128 atomic16_read(Int128 *ptr)
+{
+    Int128Alias r;
+
+    r.i = qatomic_read__nocheck((__int128_t *)ptr);
+    return r.s;
+}
+
+static inline void atomic16_set(Int128 *ptr, Int128 val)
+{
+    Int128Alias v;
+
+    v.s = val;
+    qatomic_set__nocheck((__int128_t *)ptr, v.i);
+}
+
+# define HAVE_ATOMIC128 1
+#elif !defined(CONFIG_USER_ONLY) && HAVE_CMPXCHG128
+static inline Int128 atomic16_read(Int128 *ptr)
+{
+    /* Maybe replace 0 with 0, returning the old value.  */
+    Int128 z = int128_make64(0);
+    return atomic16_cmpxchg(ptr, z, z);
+}
+
+static inline void atomic16_set(Int128 *ptr, Int128 val)
+{
+    Int128 old = *ptr, cmp;
+    do {
+        cmp = old;
+        old = atomic16_cmpxchg(ptr, cmp, val);
+    } while (int128_ne(old, cmp));
+}
+
+# define HAVE_ATOMIC128 1
+#else
+/* Fallback definitions that must be optimized away, or error.  */
+Int128 QEMU_ERROR("unsupported atomic") atomic16_read(Int128 *ptr);
+void QEMU_ERROR("unsupported atomic") atomic16_set(Int128 *ptr, Int128 val);
+# define HAVE_ATOMIC128 0
+#endif
+
+#endif /* HOST_ATOMIC128_LDST_H */
diff --git a/include/qemu/atomic128.h b/include/qemu/atomic128.h
index 10a2322c44..3a8adb4d47 100644
--- a/include/qemu/atomic128.h
+++ b/include/qemu/atomic128.h
@@ -42,78 +42,6 @@
  */
 
 #include "host/atomic128-cas.h"
-
-#if defined(CONFIG_ATOMIC128)
-static inline Int128 atomic16_read(Int128 *ptr)
-{
-    Int128Alias r;
-
-    r.i = qatomic_read__nocheck((__int128_t *)ptr);
-    return r.s;
-}
-
-static inline void atomic16_set(Int128 *ptr, Int128 val)
-{
-    Int128Alias v;
-
-    v.s = val;
-    qatomic_set__nocheck((__int128_t *)ptr, v.i);
-}
-
-# define HAVE_ATOMIC128 1
-#elif !defined(CONFIG_USER_ONLY) && defined(__aarch64__)
-/* We can do better than cmpxchg for AArch64.  */
-static inline Int128 atomic16_read(Int128 *ptr)
-{
-    uint64_t l, h;
-    uint32_t tmp;
-
-    /* The load must be paired with the store to guarantee not tearing.  */
-    asm("0: ldxp %[l], %[h], %[mem]\n\t"
-        "stxp %w[tmp], %[l], %[h], %[mem]\n\t"
-        "cbnz %w[tmp], 0b"
-        : [mem] "+m"(*ptr), [tmp] "=r"(tmp), [l] "=r"(l), [h] "=r"(h));
-
-    return int128_make128(l, h);
-}
-
-static inline void atomic16_set(Int128 *ptr, Int128 val)
-{
-    uint64_t l = int128_getlo(val), h = int128_gethi(val);
-    uint64_t t1, t2;
-
-    /* Load into temporaries to acquire the exclusive access lock.  */
-    asm("0: ldxp %[t1], %[t2], %[mem]\n\t"
-        "stxp %w[t1], %[l], %[h], %[mem]\n\t"
-        "cbnz %w[t1], 0b"
-        : [mem] "+m"(*ptr), [t1] "=&r"(t1), [t2] "=&r"(t2)
-        : [l] "r"(l), [h] "r"(h));
-}
-
-# define HAVE_ATOMIC128 1
-#elif !defined(CONFIG_USER_ONLY) && HAVE_CMPXCHG128
-static inline Int128 atomic16_read(Int128 *ptr)
-{
-    /* Maybe replace 0 with 0, returning the old value.  */
-    Int128 z = int128_make64(0);
-    return atomic16_cmpxchg(ptr, z, z);
-}
-
-static inline void atomic16_set(Int128 *ptr, Int128 val)
-{
-    Int128 old = *ptr, cmp;
-    do {
-        cmp = old;
-        old = atomic16_cmpxchg(ptr, cmp, val);
-    } while (int128_ne(old, cmp));
-}
-
-# define HAVE_ATOMIC128 1
-#else
-/* Fallback definitions that must be optimized away, or error.  */
-Int128 QEMU_ERROR("unsupported atomic") atomic16_read(Int128 *ptr);
-void QEMU_ERROR("unsupported atomic") atomic16_set(Int128 *ptr, Int128 val);
-# define HAVE_ATOMIC128 0
-#endif /* Some definition for HAVE_ATOMIC128 */
+#include "host/atomic128-ldst.h"
 
 #endif /* QEMU_ATOMIC128_H */
-- 
2.34.1

