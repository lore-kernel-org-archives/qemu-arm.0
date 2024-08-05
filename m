Received: by 2002:a17:505:1e8b:b0:1be9:327d:8ee3 with SMTP id mw11csp986371njb;
        Mon, 5 Aug 2024 13:17:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWIMJfDSzsoGlqtCW4sOsy8DHMXV9ltfJNB1xtLnTnD3gj78zpyhCspncw/CJsRgDvX6kCqT65jluCWWndt6VrVtDpPwYVz
X-Received: by 2002:a05:6a20:9f86:b0:1c4:c879:b77f with SMTP id adf61e73a8af0-1c6995ab1c0mr12454743637.27.1722889050352;
        Mon, 05 Aug 2024 13:17:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722889050; cv=none;
        d=google.com; s=arc-20160816;
        b=w6YQCLdaIuNDWLIfP1MviM8U0M0T+cTq+4MBD+JTv/p6KoUDxU1ikrwB0pue2JvWhW
         w61e4xfHQMgHts/ZMbZszlCEAVdeuPBqWEL5Q9b2i3/PiBOCil/e7b0XXi8XVAxuTue9
         Nhvga9tRGyExkJgCqY/3RK34D8/hwiJODhspu/p33NPrQarkpQefdbTptFzRTezImcp/
         5fAB0B7AvMuKyjpY1zFNJjhhvkKUNXMjWbazsYrVy2elDOQqsFsWRYB0g8QUf8ypGVnM
         P3ffseF27M3S89Au9BwN25CDBhotPds/9yIFaNzIjzKPt4NiRJUDlDMLLOl4yPSQWIpu
         0WGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=SynE1NM0itYAW6y78a0dTYINIivdU1VNZIPOm/FZTSQ=;
        fh=lyuBHWRuy/u8Yekx5G15svYHm5IifVn7Ph3i0w7uIJk=;
        b=iqqb7GUGGcfd9u0tN2HsFnQjvegVnSOlykjj+sCC5T6EpMllVpGXaE8dxloY6eQy9H
         y8vPZoauHQjFB22fYWMiiFT2CGQAJFX+RSIukKCDlxZ3Qxpi5Mt65MtjVF6mJ2mCLSb3
         xOpqp9rxp2hlO99kwjSoWwwowm+3EOG/Cg704/MvZfOe/+NYxRjxXNeykUymsUQ1MgB+
         YLqHUY8oY9LUvcBoN6f1D8Eys6erxCrbTCsuUt1hpXaDpfYzxZkos9i1MqaGtZDRHb+o
         81pvTCN7moul+jZPO8Qk0onfgHW1qbT/BAIUjPTlOSwU/CE7WJPQVL0TH//qaSyW3uko
         2xUQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=C2s1XXw1;
       spf=pass (google.com: domain of 3wtoxzgukc8azg1ovmuumrk.iusgrk3.hkttkkrotgxu.uxm@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3WTOxZgUKC8Azg1ovmuumrk.iusgrk3.hkttkkrotgxu.uxm@flex--tavip.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <3WTOxZgUKC8Azg1ovmuumrk.iusgrk3.hkttkkrotgxu.uxm@flex--tavip.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id 41be03b00d2f7-7b5297d3219sor9980132a12.1.2024.08.05.13.17.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 Aug 2024 13:17:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3wtoxzgukc8azg1ovmuumrk.iusgrk3.hkttkkrotgxu.uxm@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=C2s1XXw1;
       spf=pass (google.com: domain of 3wtoxzgukc8azg1ovmuumrk.iusgrk3.hkttkkrotgxu.uxm@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3WTOxZgUKC8Azg1ovmuumrk.iusgrk3.hkttkkrotgxu.uxm@flex--tavip.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722889050; x=1723493850; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SynE1NM0itYAW6y78a0dTYINIivdU1VNZIPOm/FZTSQ=;
        b=C2s1XXw1v/ch/vXOKk4sJLoJZPIDCj+yn9KRaxQOxhVx9iBDfkhRNYjfruwjLGGEmc
         1cbdAb8JMdo10CPcNIbGXEsc8LKTiK0ar0dbNLPGwd4FYPTwcYkctHyinXgIA3DoPGYU
         5BrPh4HT6WHWdX/tRCf7yimq1zEv+0JSIm4rSKS0cy6EILFdOYIs+Cqtp/hmOvhxVb/W
         piCwgiU92warhh+gCO8KjmykmZZLGyqDhqxRs709OMT8AlP0ePVwDiOI46vscWsfeck5
         RWYVUCf4YXfCFwxYvP1dhCrX4Ou488TrnOXQZhm5m/t7k2BB0i8YL/XF+JJ6EtGpHo3K
         owEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722889050; x=1723493850;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SynE1NM0itYAW6y78a0dTYINIivdU1VNZIPOm/FZTSQ=;
        b=dA1fIPl02XxQF1KgEJjEFYbb23Khc6MphXK5XlOMcZejjsrA32/I+z1Qnw8jf6JWH4
         zow4R6bweduDdWvr41RlDcHOO3WZN1YEQ0si9JqWLGEkiOjHIXulL1yv2QY9LQRkw6Vp
         R1dQVSv9a7BJLGXhyXKhusPenTB5B2oW1wTzuu6NQcfFzsxgctWCD7fZIHPu281+b+C8
         q70PBunZ5mxukARLaVMfhbnaFwDT5lseogjFnovRDaZ6PcsW8prE5t6W9EqH6SLAGR7/
         jSNK/pvW+yJ+gwKFaBXG8/ntg+QWC+vIb8iCUBZ2zqGUGgSRawaAhbsHrfXizlNlLkAr
         p2sg==
X-Forwarded-Encrypted: i=1; AJvYcCWw7olxwmvfXtihbUB8KHjrv68Ly1EJaL1BzKZR1N+xp55cgPJh1oHqXjZaV7gYpMM9u1AI6POpWGLhbvulHZKU461R+stY
X-Gm-Message-State: AOJu0Yy7BItIpPJNQQE2uHqq215uUUDNDdF7usVTG6yCgxS2ChXrs9Sb
	P9N2/O9cGgok1fgTvqU97dg/3U8WTCQ8GJphCAMk+mLfuFQU3ti7Shi5Qk2/wSiv1L4CWz6EYA=
	=
X-Google-Smtp-Source: AGHT+IFfBSsEqahvMxIS6/LupdiNY3e6rJCtmeO4bkS0j6KTqHR7pmRUWlSDt8ZH4z2nOAzbSbhP6de15w==
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a17:90a:1fc9:b0:2c8:632:7efe with SMTP id
 98e67ed59e1d1-2cff0c5c916mr186752a91.4.1722889049713; Mon, 05 Aug 2024
 13:17:29 -0700 (PDT)
Date: Mon,  5 Aug 2024 13:17:00 -0700
In-Reply-To: <20240805201719.2345596-1-tavip@google.com>
Mime-Version: 1.0
References: <20240805201719.2345596-1-tavip@google.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Message-ID: <20240805201719.2345596-6-tavip@google.com>
Subject: [RFC PATCH 05/23] hw: add register access utility functions
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
	alex.bennee@linaro.org, thuth@redhat.com, peter.maydell@linaro.org, 
	marcandre.lureau@redhat.com, alistair@alistair23.me, berrange@redhat.com, 
	philmd@linaro.org, jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-TUID: 4vp9mv4ILLiI

Add register access utility functions for device models, like checking
aligned access and reading and writing to a register backstore.

Signed-off-by: Octavian Purdila <tavip@google.com>
---
 include/hw/regs.h | 89 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)
 create mode 100644 include/hw/regs.h

diff --git a/include/hw/regs.h b/include/hw/regs.h
new file mode 100644
index 0000000000..8d0da0629d
--- /dev/null
+++ b/include/hw/regs.h
@@ -0,0 +1,89 @@
+/*
+ * Useful macros/functions for register handling.
+ *
+ * Copyright (c) 2021 Google LLC
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef HW_REGS_H
+#define HW_REGS_H
+
+#include "exec/hwaddr.h"
+#include "exec/memattrs.h"
+
+#define BITS(hi, lo)       (BIT(hi + 1) - BIT(lo))
+#define BIT_IS_SET(v, b)   (((v) & BIT(b)) != 0)
+
+/*
+ * reg32_aligned_access
+ * @addr: address to check
+ * @size: size of access
+ *
+ * Check if access to a hardware address is 32bit aligned.
+ *
+ * Returns: true if access is 32bit aligned, false otherwise
+ */
+static inline bool reg32_aligned_access(hwaddr addr, unsigned size)
+{
+    if (size != 4 || addr % 4 != 0) {
+        return false;
+    }
+    return true;
+}
+
+/*
+ * reg32_write
+ * @base: base address
+ * @addr: register offset in bytes
+ * @val: value to write
+ * @wr_bits_array: RW bitmask array
+ *
+ * Update the RW/WO bits of a 32bit register backstore with a given value
+ * (discarding updats to the RO bits). The RW/WO bits are encoded in the
+ * @wr_bits_array with bits set being RW and bits unset being RO.
+ *
+ * Usage example:
+ *
+ * wr_bits_array[] = {
+ *    [REG1_ADDR/4] = 0xFF000000, // MSB byte writable
+ *    [REG2_ADDR/4] = 0xFF,       // LSB byte writable
+ *    // all other registers are read-only
+ * };
+ *
+ * // backstore is updated to 0x12000000
+ * reg32_write(&backstore, REG1_ADDR, 0x12345678, wr_bits_array);
+ * // backstore is updated to 0x78
+ * reg32_write(&backstore, REG2_ADDR, 0x12345678, wr_bits_array);
+ */
+static inline uint32_t reg32_write(void *base, uint32_t off, uint32_t val,
+                                   const uint32_t *rw_bits_array)
+{
+    uint32_t *ptr = base + addr;
+    uint32_t old_value = *ptr;
+    uint32_t mask = rw_bits_array ? rw_bits_array[addr / 4] : 0xFFFFFFFF;
+
+    /* set WO/RW bits */
+    *ptr |= val & mask;
+    /* clear RO bits */
+    *ptr &= val | ~mask;
+
+    return old_value;
+}
+
+/*
+ * reg32_read
+ * @base: base address
+ * @addr: register offset in bytes
+ *
+ * Returns: 32bit value from register backstore
+ */
+static inline uint32_t reg32_read(void *base, uint32_t addr)
+{
+    return *(uint32_t *)(base + addr);
+}
+
+#endif /* HW_REGS_H */
-- 
2.46.0.rc2.264.g509ed76dc8-goog
