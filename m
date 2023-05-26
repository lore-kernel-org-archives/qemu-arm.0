Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp812053ejb;
        Thu, 25 May 2023 17:23:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:1ac6:b0:64d:6a78:157e with SMTP id f6-20020a056a001ac600b0064d6a78157emr643668pfv.28.1685060619413;
        Thu, 25 May 2023 17:23:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685060619; cv=none;
        d=google.com; s=arc-20160816;
        b=WTYecV89s4xgnE0bk056RUekz4bGMKWgpzkQ6iD6TFt6ACOWoZI7xMgaYH11wualQE
         mg7S+6xp663L1M5CH+fK5UV7q2JmD3zzi4hQb9kZzYHXZ+HEyF3LpviFJ551NrOxr4t7
         eWmfB22wjs4ccT3OO98USfonkUgTcNlOOR06qFcKg38WipP5fSxlFCigadr4wPykO7EU
         GHLLU70CwZwKBeid20dMetr0TnHJPU57uTY+iGfAYkvPwbkYH+dVTkvrkgI/WSjhwdhm
         5n03PiznTpr1D00GFppiUzOBWnoLefUB6qOsGLRlkRPLGGsYprGwB61W/HLBHIBQNTdH
         IcuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=pGac7UlZVA4AZdD7xsv1J+iiIMdZOvspUsCJpDvtWoE=;
        b=ueSLUpEjAPAXNDZ0BHjxi1KoQEpjNNtVC+kWqlq/37tFHX0QbJwxwfQe8lnx6pWRvE
         KYoJsfxn9irzuH0pZA5pEW7Im7I5BZEZyRs60l1bHi4V3wCkbVfPLPbAZVrkn/YyYF4/
         ytBnY23u3UiDwVi61e2oI+BHZBgP4jhnZ0XN+lHqe6SQyOMRMIw6LMkkZGQK3OQsvuny
         /FDDn844Y2RyJefPa+GkkQdDyUUpuG9IX7FTHjxZQhzaWnMC0l++76l80ca8gPadYceW
         JLT+uM+1tyUfXivjI9zUqpjCpvPD18+TJt6GBV1BhzMGY77EqVlukvKNE0YAWmvj0nPM
         nGmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZSWlFJTO;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y136-20020a62648e000000b0064f98807271sor910577pfb.11.2023.05.25.17.23.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 25 May 2023 17:23:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZSWlFJTO;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685060619; x=1687652619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pGac7UlZVA4AZdD7xsv1J+iiIMdZOvspUsCJpDvtWoE=;
        b=ZSWlFJTOFcRK1Sy5MZLSOtwj/l+plhdh/pw7euLATZrRd6SntatWa0e4bgShZjflCZ
         JrQKiVszYbJNmb6IZqo4khgtb+wFyVvHxQEbsP444yuVMd3FQkWBl9mP8xDpWqPKgZGL
         mzG+D5Dq99qwquplogQr3EUS2qBC05y8MIe3mDGHDSWY6nSs+MjukpHo+bAt+ta7esaV
         O6XB65JcOsFlgpCY5BRmxIAS2xyDVn1XDVqy3VpMHYcgl1BJ/qtFpqSI3mQzzowUMQ8I
         vexjeLdh9Sm/7YaHoDEGP/MNik1e+azX8JCxTm9y/cFzaX/TJy2qorijXglQHvr8+WEu
         bqxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685060619; x=1687652619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pGac7UlZVA4AZdD7xsv1J+iiIMdZOvspUsCJpDvtWoE=;
        b=d5xpm4PfG318NxtwDSPd9sFSxZJgpVni2RVMx2p2s4kupHE0CmrgZeHzcGKz7taA/x
         gVS43Qo0zRUF94GtqJh7a5+IgLprcz09HbHIRzGiRiUTZ2994KQcqKrnEWBxyMqN3pGx
         x3eMjH8iVcIoAnnVZVqrulKOLVW+DoGV+mgUa5H6CqtrIfjBst7scmXI2ih6jIOfNnCL
         oESNlQudcDDHFd2hb5kvtvOeQvABzdd+laPRfaEklDlQf/YUI/I4oF5Y9cG/Tfl2iOfe
         Yq1Mf1PdWfkD8NNaq2rTja192x7pFySle0loBpWY00k8o7s/u5cfDEacS2eDDHJDC3Kh
         Qe7Q==
X-Gm-Message-State: AC+VfDzSwt9T6lA9Vfkgg9BIeTIUK1jqGDwYk79C71AeFyKLRdvNOceo
	+wZ+htOIJboZ2GrdKqWiMWOs56ve
X-Google-Smtp-Source: ACHHUZ5isXcobq+ww90kDT/ZJZA1WPLJOWx6ACOL5Kb24zUM0wi9FKj2DOyw6e1UEEQNGw3X/s7A5Q==
X-Received: by 2002:a05:6a20:430b:b0:10c:3535:162f with SMTP id h11-20020a056a20430b00b0010c3535162fmr123866pzk.0.1685060618826;
        Thu, 25 May 2023 17:23:38 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([2602:ae:1598:4c01:7ac5:31cc:3997:3a16])
        by smtp.gmail.com with ESMTPSA id s188-20020a635ec5000000b0053491d92b65sm1675593pgb.84.2023.05.25.17.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 17:23:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v4 04/16] qemu/atomic128: Add x86_64 atomic128-ldst.h
Date: Thu, 25 May 2023 17:23:22 -0700
Message-Id: <20230526002334.1760495-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230526002334.1760495-1-richard.henderson@linaro.org>
References: <20230526002334.1760495-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: WSWy3RcRxj6L

With CPUINFO_ATOMIC_VMOVDQA, we can perform proper atomic
load/store without cmpxchg16b.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 host/include/x86_64/host/atomic128-ldst.h | 68 +++++++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 host/include/x86_64/host/atomic128-ldst.h

diff --git a/host/include/x86_64/host/atomic128-ldst.h b/host/include/x86_64/host/atomic128-ldst.h
new file mode 100644
index 0000000000..adc9332f91
--- /dev/null
+++ b/host/include/x86_64/host/atomic128-ldst.h
@@ -0,0 +1,68 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Load/store for 128-bit atomic operations, x86_64 version.
+ *
+ * Copyright (C) 2023 Linaro, Ltd.
+ *
+ * See docs/devel/atomics.rst for discussion about the guarantees each
+ * atomic primitive is meant to provide.
+ */
+
+#ifndef AARCH64_ATOMIC128_LDST_H
+#define AARCH64_ATOMIC128_LDST_H
+
+#ifdef CONFIG_INT128_TYPE
+#include "host/cpuinfo.h"
+#include "tcg/debug-assert.h"
+
+/*
+ * Through clang 16, with -mcx16, __atomic_load_n is incorrectly
+ * expanded to a read-write operation: lock cmpxchg16b.
+ */
+
+#define HAVE_ATOMIC128_RO  likely(cpuinfo & CPUINFO_ATOMIC_VMOVDQA)
+#define HAVE_ATOMIC128_RW  1
+
+static inline Int128 atomic16_read_ro(const Int128 *ptr)
+{
+    Int128Alias r;
+
+    tcg_debug_assert(HAVE_ATOMIC128_RO);
+    asm("vmovdqa %1, %0" : "=x" (r.i) : "m" (*ptr));
+
+    return r.s;
+}
+
+static inline Int128 atomic16_read_rw(Int128 *ptr)
+{
+    __int128_t *ptr_align = __builtin_assume_aligned(ptr, 16);
+    Int128Alias r;
+
+    if (HAVE_ATOMIC128_RO) {
+        asm("vmovdqa %1, %0" : "=x" (r.i) : "m" (*ptr_align));
+    } else {
+        r.i = __sync_val_compare_and_swap_16(ptr_align, 0, 0);
+    }
+    return r.s;
+}
+
+static inline void atomic16_set(Int128 *ptr, Int128 val)
+{
+    __int128_t *ptr_align = __builtin_assume_aligned(ptr, 16);
+    Int128Alias new = { .s = val };
+
+    if (HAVE_ATOMIC128_RO) {
+        asm("vmovdqa %1, %0" : "=m"(*ptr_align) : "x" (new.i));
+    } else {
+        __int128_t old;
+        do {
+            old = *ptr_align;
+        } while (!__sync_bool_compare_and_swap_16(ptr_align, old, new.i));
+    }
+}
+#else
+/* Provide QEMU_ERROR stubs. */
+#include "host/include/generic/host/atomic128-ldst.h"
+#endif
+
+#endif /* AARCH64_ATOMIC128_LDST_H */
-- 
2.34.1
