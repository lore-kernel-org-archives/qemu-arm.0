Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp276563ejb;
        Sat, 20 May 2023 09:29:03 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7JpSham3U+6o7cR6u/G0G6CaL8lKxqwkCfQHd/TPgSoA6fohXTn36K7tfBb7J43r+PVBmz
X-Received: by 2002:a05:6214:3016:b0:623:9219:499b with SMTP id ke22-20020a056214301600b006239219499bmr10222988qvb.42.1684600143008;
        Sat, 20 May 2023 09:29:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684600142; cv=none;
        d=google.com; s=arc-20160816;
        b=nWtphtNxd3ehAgPFYiNLYqxTI78LnZVXqRpGeSazM3M+Z3kPuDMST1VdxAhhdhxnir
         uOFRxzf9Wq1YTnIoQGhA06SvMt4lGg4pExr8WyUCkKg2N0RztdyYp/rtHEm7TMYQftjq
         VM1hNxE1nhr2ZhS9xzsMN7ZmI3h1Wekdbbm2a576mAPQtJQQXHtcdKYu6jvNZfUhEOjt
         AjT2ir0xHptITQOCgFIH0Z15by4fraLKuuEDiL6GjYHuRHT/7vf4gCf2ZHQ1UGOkJn/n
         7ej635DEQ895Qvwx4QmoX7OX8KqOLs0Bgwx1MjNL7/Z/PEvfCIb5D5kRJ9lRfan6xmIP
         f/Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=FvkUN9jgmDAOLN4anBgxZjSYCqoddaXAUfRdd1Denco=;
        b=F4aNQPrUbDUUZZBiqNXVSNbABnKN5aiLHc8pB5ymGlNsrUzMCv9otGh0zU3Fvint8u
         9j9cE6Gi1RAOS9BYEI+f9j3WQPru2QHDCuVzjNkJ6U1l6SWMczFI5trpIJRgvGXgvEeN
         BrfPpm0IKw345jn1NJSj9r4mo6o8b0apgnoS+5o6XbXwNkLw0JQQDzLOwc7maeDHhrtV
         Ajq90bsPEfAORPRsfgyB/oVZ3JcJ+PI3eTg98aD2X7Eug28OD1elOgXMPWqbo40AWCG9
         aVipfxrN+14w4MAndyShfK7fx5SNqrr1zDSzqqu9KMLw6SqiEb3NPZgD5JehntkL6Bbr
         u/BA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fa3ZDap4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c10-20020a05620a11aa00b007579f4e7fabsi1072115qkk.215.2023.05.20.09.29.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 20 May 2023 09:29:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fa3ZDap4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q0PQo-0004Xp-3K; Sat, 20 May 2023 12:27:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q0PQK-0003p5-KS
 for qemu-devel@nongnu.org; Sat, 20 May 2023 12:27:16 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q0PQG-0003EU-Hu
 for qemu-devel@nongnu.org; Sat, 20 May 2023 12:27:16 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1ae58e4b295so27664005ad.2
 for <qemu-devel@nongnu.org>; Sat, 20 May 2023 09:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684600030; x=1687192030;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FvkUN9jgmDAOLN4anBgxZjSYCqoddaXAUfRdd1Denco=;
 b=fa3ZDap4SA2JE2/yoWHCOSK40WvRXSEpoCEObqBLDos563HTiYYqiHGXjrTP7kAAC0
 Oh+YQwnP5n3se3wmgzjjZlWSl4WZaJlYO32M8B/7Uvf1EWmaVN5tVrmKKx0dCilW8uQM
 P9BD8/80ksebA5CmjtRWA2WhS4IDrXAqFkMo8kgfOVO96ckI85womNRfGn+0QJWKgfqF
 n6rQDveuB/wIZyxcIwfL9wKQDIVSe8Ixa1te28NICKwroR/sXSbkXVZT2ngrm800xAHd
 nQLeRLGijWRj0IMQK4cME/fK0i+p+q7OxfgbFlSKmQ5JtP6LV2voM9G/UXzlO235M2EP
 eHMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684600030; x=1687192030;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FvkUN9jgmDAOLN4anBgxZjSYCqoddaXAUfRdd1Denco=;
 b=NAM2on8RQoXJnIdOjZWLJQ2uDP9VDL02bD93jT3JpjJW3YYecxHoFzz3nBXDCS0+J7
 lY8QZihTj8RJWc//DrO0kIzMoREnObFudw3/WuDfd9Djs+h+caLmmRBKgFdqRHlaRiL9
 NqpM8CFVUVvQuld9fuXJMiCGV8l7VDpAkQV0DlXlKuBv4soTQblIJMnrCnN4eUydpEnl
 L/jtj5/xR+9+6CX1QmL3zDi3o/STc44sOiELz0galL+Ki3HmlVClTP1numZwowNVZxGI
 Zd7kZ/B92ZQIpnxFnfYIrJ7vxQpyqvPMajQDCxZCbAtRs8cG2RcV8CT7WJD/vncPmSvd
 DgnQ==
X-Gm-Message-State: AC+VfDw0noJxkOEXHe3bNlqW9y/XDEntt36TFapUsfXQtSPF+++9UFqA
 k21inFEk3PxNxGErIXmP1MtE7KzvKDWdcNKEi0Y=
X-Received: by 2002:a17:903:2310:b0:1ad:164:74fc with SMTP id
 d16-20020a170903231000b001ad016474fcmr8419787plh.20.1684600030124; 
 Sat, 20 May 2023 09:27:10 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:d078:d94e:cb2b:a055])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170903230c00b001a5260a6e6csm1697104plh.206.2023.05.20.09.27.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 May 2023 09:27:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 27/27] qemu/atomic128: Add x86_64 atomic128-ldst.h
Date: Sat, 20 May 2023 09:26:34 -0700
Message-Id: <20230520162634.3991009-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230520162634.3991009-1-richard.henderson@linaro.org>
References: <20230520162634.3991009-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: sA7UwftMn6xw

With CPUINFO_ATOMIC_VMOVDQA, we can perform proper atomic
load/store without cmpxchg16b.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 host/include/x86_64/host/atomic128-ldst.h | 54 +++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 host/include/x86_64/host/atomic128-ldst.h

diff --git a/host/include/x86_64/host/atomic128-ldst.h b/host/include/x86_64/host/atomic128-ldst.h
new file mode 100644
index 0000000000..4be9071d3f
--- /dev/null
+++ b/host/include/x86_64/host/atomic128-ldst.h
@@ -0,0 +1,54 @@
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
+#include "host/cpuinfo.h"
+#include "tcg/debug-assert.h"
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
+    Int128Alias r;
+
+    if (HAVE_ATOMIC128_RO) {
+        asm("vmovdqa %1, %0" : "=x" (r.i) : "m" (*ptr));
+    } else {
+        r.i = __sync_val_compare_and_swap_16(ptr, 0, 0);
+    }
+    return r.s;
+}
+
+static inline void atomic16_set(Int128 *ptr, Int128Alias val)
+{
+    if (HAVE_ATOMIC128_RO) {
+        asm("vmovdqa %1, %0" : "=m"(*ptr) : "x" (val.i));
+    } else {
+        Int128Alias old;
+        do {
+            old.s = *ptr;
+        } while (!__sync_bool_compare_and_swap_16(ptr, old.i, val.i));
+    }
+}
+
+#endif /* AARCH64_ATOMIC128_LDST_H */
-- 
2.34.1

