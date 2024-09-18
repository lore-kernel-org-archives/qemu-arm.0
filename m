Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp980367njg;
        Wed, 18 Sep 2024 12:29:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWHJg/TD0aBs6Fstrrioia85RZm46Fss2hA3tYaCA8m/UzWrAGXIfTz0rrLbeb6zptSQHTPfwnTaAuerQ==@linaro.org
X-Google-Smtp-Source: AGHT+IH1+NMXqB4ifvsVH9ibsc0QYncUMJ7Bjpq5HFzOZ62dwkHd4jxvXOLKTfPyrMBR25NaPaMM
X-Received: by 2002:ac8:5907:0:b0:457:d1e9:fc1f with SMTP id d75a77b69052e-458603f5479mr376689431cf.40.1726687787658;
        Wed, 18 Sep 2024 12:29:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726687787; cv=none;
        d=google.com; s=arc-20240605;
        b=jjg7QQeev7uS3HfOBAJeCJZP/li5Sao5LLY71CM+of+7hiLfVfpq9X1C9+b7ONNSKs
         0yOKYPQkrW9zLSvctGh2C7E4Xhxth9PgFN7re2WwrFqh3h2GLzxYa/7M99kDBpy/TktM
         75VkPfxN6fcURELr9EGZn1W/p5VDFHvUudG20eCs/ZBdsofP6/cysPdAwVlXjGk6pg6o
         +8YvKqLDgKg7aHI1za3nrIG4ozuj1Nf4139To2fpwMRGVLda2sY0j1oF0LuvSWIng8Ys
         tXeWu+cVjXX1eZLm3EP+bK7pLNb+yIe3b6VDx9bsgwrpDq1lFVDNOTIvyxiCptau4z3z
         h+gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=LH2iO35jx1TQ4g6EFz+L7zqP2G1PAY0VCA+0NbB5ci8=;
        fh=2mssAqYKJuMcD/Ya5YUzhxP7uPixmdZ7O75Bi0gtEhM=;
        b=IRUuXIaI+dCxOIdwuTEh9/RRbEzFtJySPEWFfRJgg0N2Nnk2HG+eLd+ANmd3grn4En
         ApK4gtzPh4vlYwSA6FrWYlSapPe8m+dg9Xvf6glPhGQ+gy2SYrSz3b8KchbZIcveIIdm
         BxhGtLQBMIwZkeex4jpnJWo0rGGqPJNDn+hHN705nTTL+jhwzJVXGXLL1EP8cgUyD9Fq
         dEdajDgx6V9xr+xwL5kABpBBi2cy9o8aJ8MuljN1kT9pUMuuYv+ef6soofCSLh4AI3TB
         /PC6jXdJq8ELfbmfCjky57dIC14ncEnIKZY32B4GQqGLd2zWpAz9xYaO0BAw+NAOeEgf
         SkEA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=SWNU0u0X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45b178ed76bsi1203351cf.294.2024.09.18.12.29.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2024 12:29:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=SWNU0u0X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sr0Gy-0005Yo-IB; Wed, 18 Sep 2024 15:23:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3qyjrZgUKCOYbIdQXOWWOTM.KWUYMUc-IZUVWVOVc.WZO@flex--tavip.bounces.google.com>)
 id 1sr0Gu-0005IY-UL
 for qemu-arm@nongnu.org; Wed, 18 Sep 2024 15:23:28 -0400
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3qyjrZgUKCOYbIdQXOWWOTM.KWUYMUc-IZUVWVOVc.WZO@flex--tavip.bounces.google.com>)
 id 1sr0Gs-0007NO-9B
 for qemu-arm@nongnu.org; Wed, 18 Sep 2024 15:23:27 -0400
Received: by mail-pf1-x44a.google.com with SMTP id
 d2e1a72fcca58-71985a317fcso49526b3a.1
 for <qemu-arm@nongnu.org>; Wed, 18 Sep 2024 12:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1726687404; x=1727292204; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=LH2iO35jx1TQ4g6EFz+L7zqP2G1PAY0VCA+0NbB5ci8=;
 b=SWNU0u0XM1j05zkWPKa4tq3HAJObz4EacyEiIjLCjZdcgCcRRZBGhY4MvLdd+O5+7l
 A9flK2I9tl/tW3QxscYh4NrlxrwKJ2R46JDeRX0XbVFopa8OlmOB4Hf5J8IHmAHZPPNV
 jnC6jCV35oxj9l4lJIjC+YkQVE7dZ9wPxXc0b6NB0hkHvByJAejUuSl/kAtLXFsLI9fI
 boJDRNGYRNfSAGt80X1pdA0UkDCgvui1alRavuKTZHlMmdtAYjzgM9nsvmPOF+5HWOyd
 Uy8PEUj9HFY9ml3slB3447oWI/U2vspYTCqRRM0EZuBJ4OnWVMLF/+JQEmpWfy2+oTvb
 kujQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726687404; x=1727292204;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LH2iO35jx1TQ4g6EFz+L7zqP2G1PAY0VCA+0NbB5ci8=;
 b=PHZthtMX2Lka9TZN8/hwzPVsCGsE65NqZglq+1FTNKDh6wOOUuYBvK8Rt40tU7nHo9
 tjVlFGHAm6DEf+tGhLNHgLB/Tr/RMdKr+AH16b1+fR40CnXO+Wx6uOmBo8C5U4v/v3lW
 Y8ddhuFhO7eaL00XpDn5K660FiBt3TUIzzJIGAx3Fg1pmtzGcK2cbdGZIJTZkz5Q/EfK
 bzZXXJE0gLzSSsER1OPp++JUTvg3/oVBmlCfk8ux3Mt5SovMYISs7aBlt+rpZV4RNjX2
 yxdWEPCJMhZO8Rq0Rqun/HwR6QbaMhpr9sN78L2hNAMyHNig9cFdiJy62OfjIqzbzwuk
 tSZA==
X-Gm-Message-State: AOJu0YxWbfj6pJJf6n2nFQDnfFnOre/GFpqHQkU/dLKEPkfEXdhe0wzw
 QyRplH8UaSR1SGXocOljK6wjyH8eFzyKGXG4syjKRAyc62BDOufHKfso6rHWHsKji7w7pMO9Gg=
 =
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a05:6a00:6f28:b0:70e:9de1:992e
 with SMTP id
 d2e1a72fcca58-71926060114mr60644b3a.1.1726687403885; Wed, 18 Sep 2024
 12:23:23 -0700 (PDT)
Date: Wed, 18 Sep 2024 12:22:43 -0700
In-Reply-To: <20240918192254.3136903-1-tavip@google.com>
Mime-Version: 1.0
References: <20240918192254.3136903-1-tavip@google.com>
X-Mailer: git-send-email 2.46.0.662.g92d0881bb0-goog
Message-ID: <20240918192254.3136903-16-tavip@google.com>
Subject: [PATCH 15/25] tests/qtest: add register access macros and functions
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
 peter.maydell@linaro.org, marcandre.lureau@redhat.com, berrange@redhat.com, 
 eduardo@habkost.net, luc@lmichel.fr, damien.hedde@dahe.fr, 
 alistair@alistair23.me, thuth@redhat.com, philmd@linaro.org, jsnow@redhat.com, 
 crosa@redhat.com, lvivier@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::44a;
 envelope-from=3qyjrZgUKCOYbIdQXOWWOTM.KWUYMUc-IZUVWVOVc.WZO@flex--tavip.bounces.google.com;
 helo=mail-pf1-x44a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: 5YrP+gAOvBW7

Add utility macros for accessing register or register bit fields in
tests, e.g.:

  REG32_WRITE(FLEXCOMM, PSELID, persel);
  g_assert(REG32_READ_FIELD(FLEXCOMM, PSELID, PERSEL) == persel);

Signed-off-by: Octavian Purdila <tavip@google.com>
---
 tests/qtest/reg-utils.h | 70 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 tests/qtest/reg-utils.h

diff --git a/tests/qtest/reg-utils.h b/tests/qtest/reg-utils.h
new file mode 100644
index 0000000000..e09aaf3333
--- /dev/null
+++ b/tests/qtest/reg-utils.h
@@ -0,0 +1,70 @@
+/*
+ * Register access utilities for device tests.
+ *
+ * Copyright (C) 2024 Google LLC
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+#ifndef _REG_UTILS_H
+#define _REG_UTILS_H
+
+#include "libqtest-single.h"
+#include "hw/registerfields.h"
+
+#ifdef DEBUG_REG
+#define debug(fmt, args...) fprintf(stderr, fmt, ## args)
+#else
+#define debug(fmt, args...)
+#endif
+
+#define _REG_OFF(mod, reg) (A_##mod##_##reg)
+
+#define REG32_READ(mod, reg)                                            \
+    ({                                                                  \
+        uint32_t value;                                                 \
+        value = readl(mod##_BASE + _REG_OFF(mod, reg));                 \
+        debug("[%s] -> %08x\n", #reg, value);                           \
+        value;                                                          \
+    })
+
+#define REG32_WRITE(mod, reg, value)                                    \
+    do {                                                                \
+        debug("[%s] <- %08x\n", #reg, value);                           \
+        writel(mod##_BASE + _REG_OFF(mod, reg), value);                 \
+    } while (0)
+
+#define REG_FIELD_VAL(v, mod, reg, field)                               \
+    FIELD_EX32(v, mod##_##reg, field)                                   \
+
+#define REG32_READ_FIELD(mod, reg, field)                   \
+    REG_FIELD_VAL(REG32_READ(mod, reg), mod, reg, field)
+
+#define REG32_WRITE_FIELD(mod, reg, field, val)                         \
+    do {                                                                \
+        uint32_t _tmp = REG32_READ(mod, reg);                           \
+        _tmp = FIELD_DP32(_tmp, mod##_##reg, field, val);               \
+        REG32_WRITE(mod, reg, _tmp);                                    \
+    } while (0)
+
+#define REG32_WRITE_FIELD_NOUPDATE(mod, reg, field, val)                \
+    do {                                                                \
+        uint32_t _tmp = FIELD_DP32(0, mod##_##reg, field, val);         \
+        REG32_WRITE(mod, reg, _tmp);                                    \
+    } while (0)
+
+#define WAIT_REG32_FIELD(ns, mod, reg, field, val)                      \
+    do {                                                                \
+        clock_step(ns);                                                 \
+        g_assert_cmpuint(REG32_READ_FIELD(mod, reg, field), ==, val);   \
+    } while (0)
+
+#define REG32_READ_FAIL(mod, reg) \
+    readl_fail(mod##_BASE + _REG_OFF(mod, reg))
+
+#define REG32_WRITE_FAIL(mod, reg, value) \
+    writel_fail(mod##_BASE + _REG_OFF(mod, reg), value)
+
+#endif /* _REG_UTILS_H */
-- 
2.46.0.662.g92d0881bb0-goog

