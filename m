Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp26184njc;
        Wed, 13 Nov 2024 17:14:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVTaSoc+Ga5dwrmoQq5X85M71IOmatNoZ+GvzPiAO0yjKLw9Q31XRo7jXQ61LUMpGLzw0cB2cc8fW1TfQ==@linaro.org
X-Received: by 2002:a5d:5d88:0:b0:37d:4332:e91d with SMTP id ffacd0b85a97d-38208349f38mr7371865f8f.52.1731546888843;
        Wed, 13 Nov 2024 17:14:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731546888; cv=none;
        d=google.com; s=arc-20240605;
        b=DZKsdpTDVhxQ5F9Uq4bR6lEUSudg+shOAwZo+TnSkW+BrJPW9FsibxUnvPl5njDZsg
         bOirp6iOMai3yDZHORfKK92GKgo1n8xdrGr58xwkLlaBb1F1FxJkPNMfVq7YqvQhovTb
         LlUIwKg8sguI2L/4UDPynbBiA5x9Da6LffNiDXSiZDGLX76epxxSnRJV2xbXuM9QzNFv
         st7BZhRs7fzio52Ut2GYqvqukkwo3GtIAF9phjlmlzAd76lbSNk5AHc2ZbFDZFGRORfM
         Eq8Vtt77S+pozLHRugm3vqChaRp6sACjaa09Ph14P0aBE4Y9+nk1cFW0uNkxVWdoJLT/
         ln4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=b/Mwf2dMLIwY53Hwy+X6Y1uqRqRvCrR6xhY52hogfuU=;
        fh=A2VmEjkM0Ftu/pBeWg5gkDgQdGGWqdYiV01FPJkf7Iw=;
        b=CfAcsOVRmldqqT4bx4+L1T3wqpuxFWjbpx039N+xe7TchXcrniaHSIrFCi0x4ANZxo
         OYt+jAfdA8f81C0CHsybW2/igOIcoipHUbo368oa6HmiHRfpFmdZCmdlhWD1NzXMOcr4
         i4WuCpRRDAVDtCTYtk34uTrfgSPmJ1cJBR/8OKRB/EoyS0EPGwFz84J+RBuVeoy3xnJY
         jxXnbpP0Zjpb6jif5uFgINzybHw6brCUVNwBorr6J9YTOfohGygKo9fUoMLmmOXLCj83
         GGTuGXnw/e07YXA4l1hJzGKqbMtRZmAkH5MWWexWNy236X7Q7u3yRpGDrMT8KEdrCcMu
         W/3Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AZL1G26Y;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-381ed97e681sor4848735f8f.3.2024.11.13.17.14.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 13 Nov 2024 17:14:48 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AZL1G26Y;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731546888; x=1732151688; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b/Mwf2dMLIwY53Hwy+X6Y1uqRqRvCrR6xhY52hogfuU=;
        b=AZL1G26YA2QHA+TgoqF0UeGphBc1yp0C2LLJIhm+C5YX0GraxDMO7r9JlaT+fy1Hj2
         2kYI38TSJrqA7EIud3RViuN6VIqq0sTj9mWhSnF6C5EUNc0zkZtL0j89VLcGAkYk0qXe
         Oxi2KYTsqTm15oN+HKHHsoOmaxE1zSLHx1+uP5dStEmTqrlcy+V77vGxGnz7ZHZw7qxQ
         blKc8KGOPvNWXrN+Sb4iA56kqJG4db3jLVM1lkjGr8l8hR1Qjlz+IYNTZai0e4yhpBJb
         JKG3fNVAwEYQChTLmknN9nG07lUYmFNvZqO8KmZ64/GpX+5UCvRWUciIVeSNHzHM4g1M
         JFlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731546888; x=1732151688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b/Mwf2dMLIwY53Hwy+X6Y1uqRqRvCrR6xhY52hogfuU=;
        b=Zk43kcnwnhKtEvC//8lvawPIA6ieDcsfuXgi/Tgo7hkIgIqw/KxIILb9WT4yWO4nUE
         rmt3A7jJdaxgVr5lZgA2EpcRY6/mr2VBmIXdC6Dys7aRMObTHHneS/R18qVKjp2mMRt9
         b7aCxti74RMOS/fYqm8zsJy7pJFy3hmf0OUmEgwJTCHrdGi6LqxqblfRvmgIvh2Zeadx
         GHjErRErpGtKioj1Kpz1meQLmWxOkjkPaaCbZhaUtVtt2zLhJl2PnsQ1m6CEVgabPd2P
         rDgX5rk4GfthCI926UGcMj5k1C0GO0OhiZ01n/V2ZTaBMnBApUlVIJsSaNNV9IUZ8L60
         X/4A==
X-Forwarded-Encrypted: i=1; AJvYcCXR3iuwqUd/YAcr0xSa+nl9ha6j6RENvqcpf7yLQtsp2fSnUZqpd0CYpHFIj19GcOq/S9hF6OOnmKzgxg==@linaro.org
X-Gm-Message-State: AOJu0Yxxg/4qHzIe1GhkgA7Mzk8ilba1YS+7ohZEnY1ZPzcJz9cBAOGA
	DvRJdCnAxPXLP1+5jz2XVAUOkQwidaTugG3up7gRoJg3e11LMkEcXyL+zc7xiF1OSA==
X-Google-Smtp-Source: AGHT+IGYsjllJjcWqtSFLvVfioihKxt7KGt6nILKJp1/7Hyu2p6hwA9EsQJ1WMNsoFs9SnNIT8G0og==
X-Received: by 2002:a5d:598d:0:b0:380:54f2:3408 with SMTP id ffacd0b85a97d-3820812360bmr6334702f8f.25.1731546888217;
        Wed, 13 Nov 2024 17:14:48 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([176.187.209.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed970d05sm20012547f8f.1.2024.11.13.17.14.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 13 Nov 2024 17:14:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Peter Xu <peterx@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 11/24] exec: Introduce 'user/guest-host.h' header
Date: Thu, 14 Nov 2024 02:12:56 +0100
Message-ID: <20241114011310.3615-12-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241114011310.3615-1-philmd@linaro.org>
References: <20241114011310.3615-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: OXiua0DGYBv8

Extract all declarations related to 'guest from/to host'
address translation to a new "user/guest-host.h" header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/cpu-all.h    | 34 +--------------
 include/exec/cpu_ldst.h   | 47 +--------------------
 include/user/guest-host.h | 87 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 89 insertions(+), 79 deletions(-)
 create mode 100644 include/user/guest-host.h

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 1c40e27672..1c8e0446d0 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -64,39 +64,7 @@
 
 /* MMU memory access macros */
 
-#if defined(CONFIG_USER_ONLY)
-#include "user/abitypes.h"
-
-/*
- * If non-zero, the guest virtual address space is a contiguous subset
- * of the host virtual address space, i.e. '-R reserved_va' is in effect
- * either from the command-line or by default.  The value is the last
- * byte of the guest address space e.g. UINT32_MAX.
- *
- * If zero, the host and guest virtual address spaces are intermingled.
- */
-extern unsigned long reserved_va;
-
-/*
- * Limit the guest addresses as best we can.
- *
- * When not using -R reserved_va, we cannot really limit the guest
- * to less address space than the host.  For 32-bit guests, this
- * acts as a sanity check that we're not giving the guest an address
- * that it cannot even represent.  For 64-bit guests... the address
- * might not be what the real kernel would give, but it is at least
- * representable in the guest.
- *
- * TODO: Improve address allocation to avoid this problem, and to
- * avoid setting bits at the top of guest addresses that might need
- * to be used for tags.
- */
-#define GUEST_ADDR_MAX_                                                 \
-    ((MIN_CONST(TARGET_VIRT_ADDR_SPACE_BITS, TARGET_ABI_BITS) <= 32) ?  \
-     UINT32_MAX : ~0ul)
-#define GUEST_ADDR_MAX    (reserved_va ? : GUEST_ADDR_MAX_)
-
-#else
+#if !defined(CONFIG_USER_ONLY)
 
 #include "exec/hwaddr.h"
 
diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index dac12bd8eb..a26ab49b0b 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -72,52 +72,7 @@
 #include "qemu/int128.h"
 
 #if defined(CONFIG_USER_ONLY)
-
-#include "user/guest-base.h"
-
-#ifndef TARGET_TAGGED_ADDRESSES
-static inline abi_ptr cpu_untagged_addr(CPUState *cs, abi_ptr x)
-{
-    return x;
-}
-#endif
-
-/* All direct uses of g2h and h2g need to go away for usermode softmmu.  */
-static inline void *g2h_untagged(abi_ptr x)
-{
-    return (void *)((uintptr_t)(x) + guest_base);
-}
-
-static inline void *g2h(CPUState *cs, abi_ptr x)
-{
-    return g2h_untagged(cpu_untagged_addr(cs, x));
-}
-
-static inline bool guest_addr_valid_untagged(abi_ulong x)
-{
-    return x <= GUEST_ADDR_MAX;
-}
-
-static inline bool guest_range_valid_untagged(abi_ulong start, abi_ulong len)
-{
-    return len - 1 <= GUEST_ADDR_MAX && start <= GUEST_ADDR_MAX - len + 1;
-}
-
-#define h2g_valid(x) \
-    (HOST_LONG_BITS <= TARGET_VIRT_ADDR_SPACE_BITS || \
-     (uintptr_t)(x) - guest_base <= GUEST_ADDR_MAX)
-
-#define h2g_nocheck(x) ({ \
-    uintptr_t __ret = (uintptr_t)(x) - guest_base; \
-    (abi_ptr)__ret; \
-})
-
-#define h2g(x) ({ \
-    /* Check if given address fits target address space */ \
-    assert(h2g_valid(x)); \
-    h2g_nocheck(x); \
-})
-
+#include "user/guest-host.h"
 #endif /* CONFIG_USER_ONLY */
 
 uint32_t cpu_ldub_data(CPUArchState *env, abi_ptr ptr);
diff --git a/include/user/guest-host.h b/include/user/guest-host.h
new file mode 100644
index 0000000000..8d2079bbbb
--- /dev/null
+++ b/include/user/guest-host.h
@@ -0,0 +1,87 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/*
+ * guest <-> host helpers.
+ *
+ *  Copyright (c) 2003 Fabrice Bellard
+ */
+
+#ifndef USER_GUEST_HOST_H
+#define USER_GUEST_HOST_H
+
+#include "user/abitypes.h"
+#include "user/guest-base.h"
+#include "cpu.h"
+
+/*
+ * If non-zero, the guest virtual address space is a contiguous subset
+ * of the host virtual address space, i.e. '-R reserved_va' is in effect
+ * either from the command-line or by default.  The value is the last
+ * byte of the guest address space e.g. UINT32_MAX.
+ *
+ * If zero, the host and guest virtual address spaces are intermingled.
+ */
+extern unsigned long reserved_va;
+
+/*
+ * Limit the guest addresses as best we can.
+ *
+ * When not using -R reserved_va, we cannot really limit the guest
+ * to less address space than the host.  For 32-bit guests, this
+ * acts as a sanity check that we're not giving the guest an address
+ * that it cannot even represent.  For 64-bit guests... the address
+ * might not be what the real kernel would give, but it is at least
+ * representable in the guest.
+ *
+ * TODO: Improve address allocation to avoid this problem, and to
+ * avoid setting bits at the top of guest addresses that might need
+ * to be used for tags.
+ */
+#define GUEST_ADDR_MAX_                                                 \
+    ((MIN_CONST(TARGET_VIRT_ADDR_SPACE_BITS, TARGET_ABI_BITS) <= 32) ?  \
+     UINT32_MAX : ~0ul)
+#define GUEST_ADDR_MAX    (reserved_va ? : GUEST_ADDR_MAX_)
+
+#ifndef TARGET_TAGGED_ADDRESSES
+static inline abi_ptr cpu_untagged_addr(CPUState *cs, abi_ptr x)
+{
+    return x;
+}
+#endif
+
+/* All direct uses of g2h and h2g need to go away for usermode softmmu.  */
+static inline void *g2h_untagged(abi_ptr x)
+{
+    return (void *)((uintptr_t)(x) + guest_base);
+}
+
+static inline void *g2h(CPUState *cs, abi_ptr x)
+{
+    return g2h_untagged(cpu_untagged_addr(cs, x));
+}
+
+static inline bool guest_addr_valid_untagged(abi_ulong x)
+{
+    return x <= GUEST_ADDR_MAX;
+}
+
+static inline bool guest_range_valid_untagged(abi_ulong start, abi_ulong len)
+{
+    return len - 1 <= GUEST_ADDR_MAX && start <= GUEST_ADDR_MAX - len + 1;
+}
+
+#define h2g_valid(x) \
+    (HOST_LONG_BITS <= TARGET_VIRT_ADDR_SPACE_BITS || \
+     (uintptr_t)(x) - guest_base <= GUEST_ADDR_MAX)
+
+#define h2g_nocheck(x) ({ \
+    uintptr_t __ret = (uintptr_t)(x) - guest_base; \
+    (abi_ptr)__ret; \
+})
+
+#define h2g(x) ({ \
+    /* Check if given address fits target address space */ \
+    assert(h2g_valid(x)); \
+    h2g_nocheck(x); \
+})
+
+#endif
-- 
2.45.2
