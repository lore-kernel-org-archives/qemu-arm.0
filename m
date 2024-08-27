Received: by 2002:a17:504:26c2:b0:1be9:327d:8ee3 with SMTP id j2csp19441nji;
        Mon, 26 Aug 2024 23:47:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVG8jHR7zEI0aAWdCkGDRW+vYrsjr2NyP76utuMpMPbKXWwU0KuKsjDeJoCKyQzWIHgZBMDKBQOCT+8Bg==@linaro.org
X-Google-Smtp-Source: AGHT+IFGLONeTLmg0yqFxW9IhGqITSeY4B6lquEHsUyULD2rND8JU2sYbAjrys4G/pjQaqstJEHs
X-Received: by 2002:a05:620a:c4b:b0:79d:5b21:804a with SMTP id af79cd13be357-7a6896e3855mr1787528585a.14.1724741226949;
        Mon, 26 Aug 2024 23:47:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724741226; cv=none;
        d=google.com; s=arc-20160816;
        b=jCJCrP1cXFFORhGg1Bvq0rx00uWU6VXV9nntsphnmPIYMXiF00Pscijvf0gn/yVNxj
         CzixrLAFUT6MWnSsQLTLKa3PXfo66cxOQn3QQXv/YvfYYF7DFR81/SQhiqK61wpnyYLX
         UvzqsZe4c/N3h0wWQW1vcOO9sB9bnlVQ+6t+f77SLuOi0h4qcZ+mgWY8YVfiUL3xQs7T
         UA0medfbfHF7L7QOtMfVffBL5jfeSKPT3bL2NL8a5HzZAUwrD9q7ReSWIVrXLdH0349C
         L25n0cIU+tezVsyoHO7zUuvuyzl4Agpl6dX0iUq5eT+S+Szig4opJXw20+kf9APePwkh
         4msA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=QAb7sPO/VgRC8CdmRh6+IgA62zqKsaHlo0fRBlzqmbo=;
        fh=2mssAqYKJuMcD/Ya5YUzhxP7uPixmdZ7O75Bi0gtEhM=;
        b=Hcn+7HE8Ahbzl2ly8eN0HVLtYO5W1XIH9yhF/3aomcRFkK1ru2LwfqyFvy3iOp0SO9
         2wmOPRw7OajsmUTnra3mZT6WDWXHZEJblsV6XKhWi9p9Z7no08VMvaom100BI/RDBTlQ
         4uN+Bp7EjFqptiPhWF7BdjqRjLE7KP1zWrSRe6msqPuRm085O8tFPI8Z7wmflxyY1rif
         DcL6kh1KbOnpxDoOjA81bdTrzLDN0GV6wK66KoBRWWTvOMn73/wbZNQ3rPLT0kD4BTsG
         S89Nkmqm0GTIoU+ieIWvp+rdtDHg3LYOMjcsBL/8lJVdpEDFDo3iaLOQWzvsIoadYdXh
         uYAw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=mXEiDGiC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a67f411f54si1230299985a.526.2024.08.26.23.47.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Aug 2024 23:47:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=mXEiDGiC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sipyN-0004dM-EB; Tue, 27 Aug 2024 02:46:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3JXbNZgUKCIQ1i3qxowwotm.kwuymu2-izuvwvov2.wzo@flex--tavip.bounces.google.com>)
 id 1sipy9-00041H-Gd
 for qemu-arm@nongnu.org; Tue, 27 Aug 2024 02:46:31 -0400
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3JXbNZgUKCIQ1i3qxowwotm.kwuymu2-izuvwvov2.wzo@flex--tavip.bounces.google.com>)
 id 1sipy4-000699-2O
 for qemu-arm@nongnu.org; Tue, 27 Aug 2024 02:46:19 -0400
Received: by mail-pg1-x549.google.com with SMTP id
 41be03b00d2f7-7d2159ebf3dso712726a12.2
 for <qemu-arm@nongnu.org>; Mon, 26 Aug 2024 23:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1724741157; x=1725345957; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=QAb7sPO/VgRC8CdmRh6+IgA62zqKsaHlo0fRBlzqmbo=;
 b=mXEiDGiCmMUPWgan5Tq+yp6CEk6FNy03Wb6/T3NG3R37+7T2tSVUNAgeRxpZUilQDl
 uRzXpBgriJQYBkgq8+RSpOUfo2cMgCnP2HkHVWwbq4qtsF791CfSf7O7NjLiiT2JA0/p
 ATtiblQ878KrjAu84kjrjd3gh9O1aGt3+Cg0piVLUipnDVGNZ+n9NSpudoJvMheHaUQ/
 Ceqb4btT5pXzdeXFmh6NDqpEpVZoMkoM26Gb1gTC9UoTkW7Uyymz7Pj3CCw1uDFoOu+G
 Y7g2SKilieAuQXCn3BWZEd5VlzCknRkzstFLsUfNlbJu30Ppqa0+1I8LMVXuYi364OOJ
 cJbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724741157; x=1725345957;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QAb7sPO/VgRC8CdmRh6+IgA62zqKsaHlo0fRBlzqmbo=;
 b=DLdBEZt1zVCTpHut3vN65bJ28/4rh5y5TuiE76FdorBHp8zc1ExhVxk4OY9X3LxuXA
 +DtlvWARpzqI78apRwobl6kPLm1C7gnEnu3j0btBUQyna0UbJ1SC7rN9SGrQ3VDDh9gQ
 3hk/lbB9ZJS5e1MJ+hOJ9e+3NptID5tgztcQcy7o61MEO04esNIPoLMo4swRhAGm9Q1r
 Z6t4dGfH5Va8jzMOVLsiZ+umEskcCS8VJT3SJfRooB30qfIpzOPEWV3Fp38AmC3rrJzL
 dxsPkmFHPZQLqxrk2m/1L01f0KP69CjetupeT/WIzZCSunwZ/XJwezT2QuwEEKxUCfSx
 cnzw==
X-Gm-Message-State: AOJu0YzX03as1WTQXoPFiecedkDqAWtgmvoTSBnREUuhnGZLeo37vdlk
 Ab2JdZWP5jUfRzchDquLMe2B1s8NQqcEgZKUCywrm3Fyl0hpHG7lflW98tHXAIbyWXwLYMTxog=
 =
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a17:903:1210:b0:1fc:369b:c1b5
 with SMTP id
 d9443c01a7336-204df43252emr843855ad.5.1724741157078; Mon, 26 Aug 2024
 23:45:57 -0700 (PDT)
Date: Mon, 26 Aug 2024 23:45:18 -0700
In-Reply-To: <20240827064529.1246786-1-tavip@google.com>
Mime-Version: 1.0
References: <20240827064529.1246786-1-tavip@google.com>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
Message-ID: <20240827064529.1246786-15-tavip@google.com>
Subject: [RFC PATCH v3 14/24] tests/qtest: add register access macros and
 functions
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
 peter.maydell@linaro.org, marcandre.lureau@redhat.com, berrange@redhat.com, 
 eduardo@habkost.net, luc@lmichel.fr, damien.hedde@dahe.fr, 
 alistair@alistair23.me, thuth@redhat.com, philmd@linaro.org, jsnow@redhat.com, 
 crosa@redhat.com, lvivier@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::549;
 envelope-from=3JXbNZgUKCIQ1i3qxowwotm.kwuymu2-izuvwvov2.wzo@flex--tavip.bounces.google.com;
 helo=mail-pg1-x549.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
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
X-TUID: LtWbLx4pCrw1

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
2.46.0.295.g3b9ea8a38a-goog

