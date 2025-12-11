Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01EC0D4335B
	for <qemu-arm@archiver.kernel.org>; Thu, 11 Dec 2025 23:45:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vTqKv-0003Q8-Qg; Thu, 11 Dec 2025 18:44:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vTqKs-0003NL-NX
 for qemu-arm@nongnu.org; Thu, 11 Dec 2025 18:44:38 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vTqKq-0003Wv-Jq
 for qemu-arm@nongnu.org; Thu, 11 Dec 2025 18:44:38 -0500
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-7a9c64dfa8aso515615b3a.3
 for <qemu-arm@nongnu.org>; Thu, 11 Dec 2025 15:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765496675; x=1766101475; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jpcJFT2k5nHygp8suhE8+fSew2JESztmRXmXovsEsMw=;
 b=OXZRexR7ltmxc2p7P24jyZoOT+tEFLNDMZ1uVdKJhyNCGT8/0lq1+x4WLejSUFKPA2
 ro4x3EgFzH2lg4OV8z9RU2ARGK0/Ta+tMOx7FI7KDeFIYS0k5C9zlKmpCAoDE1pbLPrQ
 9YZVPpg46HNhx6jtXY8HwQOh53OhHOmC/MqhZM3iKyZnuJa+1MVjmYQjQUEtkLdhkC4d
 5YMwT+5w+bEAkhGGrb6CZJT4+VBkzaXgegrkoILwU5YWx+rueMvlK+d4uzrvvq2q7AUH
 wfgkw9s6kZ999FiUzWJ27tmjjmvkubRTtQfB+x4rIV2VRsI/aLENBGn/91rGTHieio3b
 evDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765496675; x=1766101475;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jpcJFT2k5nHygp8suhE8+fSew2JESztmRXmXovsEsMw=;
 b=VJKi1ozccwlIRzEHXRkicWyxg00DghEmUS+mk3FG9qQIfCGxjhmDpXY6YX3pH9c82/
 fiiegBDo/Nc7MGgYsVzDoCvIAWir0QsNrwvMeHu+H3+Vg7FBC22f2OlZW+5SqgT9pNbl
 wIzPpnDoirNrvcxPPteLw2otVhTMNrE1XQ6lkY/pdFQUQEr633Jf3kjl5i18dRg9lUO7
 ELJ/UqS9smPGwohbE6loRfMXExmCkyLF6uatRloDzl834Zzuc3FufPivvphjeC7Ng5OM
 LNiB+POsqCQxTjHE9D67EJyCh1JBHkz5s8YjSGsGzx0qp5vN0bsuI+Jy4UUxmM9ld0Uc
 Vpbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcbks3pGkqxN2VQVCPhTqbLhigsphvvu3022GhSK3MiuMLLRhEAYlSan1297CYlG5FIlROdo0n/A==@nongnu.org
X-Gm-Message-State: AOJu0Yyg4uWsctj9P9kAgH3tJpjIVmE2+gdxU417XHu7U2HPaH1lQxC2
 s9eMyirTZDq27FUUP8zfXNKd3lt0nQdEEfW245QjN7DmXhapti3I44pEOUOlqOz1MdE=
X-Gm-Gg: AY/fxX74i91Fwv9aIUwAHT5r3BsFm1d9lppq4MnQ01jwZpMvLutWaN7c9RYKEgnt9Tf
 B6NLBfxkZ8C6tEnWM5GhEfhnRulXczK3ZfLXk3zgKUhSOiXtBArHKFqNRT5PclnFPT6mDI2Ymc3
 pI1RZ7/wgq9BJLBkNLkVWkDjGslJR+LFJwDTofEYpWFmlNf4W4d/gdplByN8Vd6xS0v3CJ4B6W5
 rLOXKJ49Raj3EHNAQsp/uSY8JDyXuEsTzqaWupIuLWKcmr2fy++2h1w8ZSnfV11eDdxQVFWRapm
 YqNHmQAbsAOjo7KOjmt49cKmO/ZIhscIoJVpY8x4Gx6kQSYWSC529pssWqVD7hZE+SnxUR/rTnQ
 AhpqLWV0XDjDGeP+Yv6gKBU4PaDuSdg4KfUvyp5s6NPorN5+SuMLQmnds3BSaip1fZJ7PSfXAC/
 HldtREdKDlEF1POOYcA4cxvF3VIa+hlzSV7ZuekJ7wYYh1PTIcq4UwyDzqaFZFTP62rrGx9GjVU
 A==
X-Google-Smtp-Source: AGHT+IF/DpPvfoCBwE0KcZlFwwnUpppqOP+B4y3lL33Yd2nemBLu8aQEA2u6ufPbhs5nVgzzJCfSWQ==
X-Received: by 2002:a05:6a20:3d8a:b0:366:55c4:c5a8 with SMTP id
 adf61e73a8af0-369adad45a1mr209248637.25.1765496675064; 
 Thu, 11 Dec 2025 15:44:35 -0800 (PST)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c0c2599228dsm3370410a12.1.2025.12.11.15.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 15:44:34 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 Tao Tang <tangtao1634@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 1/2] target/arm: Move ARMSecuritySpace to a common header
Date: Thu, 11 Dec 2025 15:44:25 -0800
Message-ID: <20251211234426.2403792-2-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251211234426.2403792-1-pierrick.bouvier@linaro.org>
References: <20251211234426.2403792-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Tao Tang <tangtao1634@phytium.com.cn>

The ARMSecuritySpace enum and its related helpers were defined in the
target-specific header target/arm/cpu.h. This prevented common,
target-agnostic code like the SMMU model from using these definitions
without triggering "cpu.h included from common code" errors.

To resolve this, this commit introduces a new, lightweight header,
include/hw/arm/arm-security.h, which is safe for inclusion by common
code.

The following change was made:

- The ARMSecuritySpace enum and the arm_space_is_secure() and
arm_secure_to_space() helpers have been moved from target/arm/cpu.h
to the new hw/arm/arm-security.h header.

This refactoring decouples the security state definitions from the core
CPU implementation, allowing common hardware models to correctly handle
security states without pulling in heavyweight, target-specific headers.

Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Link: https://lists.nongnu.org/archive/html/qemu-arm/2025-09/msg01288.html
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/hw/arm/arm-security.h | 54 +++++++++++++++++++++++++++++++++++
 target/arm/cpu.h              | 25 +---------------
 2 files changed, 55 insertions(+), 24 deletions(-)
 create mode 100644 include/hw/arm/arm-security.h

diff --git a/include/hw/arm/arm-security.h b/include/hw/arm/arm-security.h
new file mode 100644
index 00000000000..9664c0f95e9
--- /dev/null
+++ b/include/hw/arm/arm-security.h
@@ -0,0 +1,54 @@
+/*
+ * ARM security space helpers
+ *
+ * Provide ARMSecuritySpace and helpers for code that is not tied to CPU.
+ *
+ *  Copyright (c) 2003 Fabrice Bellard
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HW_ARM_ARM_SECURITY_H
+#define HW_ARM_ARM_SECURITY_H
+
+#include <stdbool.h>
+
+/*
+ * ARM v9 security states.
+ * The ordering of the enumeration corresponds to the low 2 bits
+ * of the GPI value, and (except for Root) the concat of NSE:NS.
+ */
+
+ typedef enum ARMSecuritySpace {
+    ARMSS_Secure     = 0,
+    ARMSS_NonSecure  = 1,
+    ARMSS_Root       = 2,
+    ARMSS_Realm      = 3,
+} ARMSecuritySpace;
+
+/* Return true if @space is secure, in the pre-v9 sense. */
+static inline bool arm_space_is_secure(ARMSecuritySpace space)
+{
+    return space == ARMSS_Secure || space == ARMSS_Root;
+}
+
+/* Return the ARMSecuritySpace for @secure, assuming !RME or EL[0-2]. */
+static inline ARMSecuritySpace arm_secure_to_space(bool secure)
+{
+    return secure ? ARMSS_Secure : ARMSS_NonSecure;
+}
+
+#endif /* HW_ARM_ARM_SECURITY_H */
+
+
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 39f2b2e54de..efbef0341da 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -31,6 +31,7 @@
 #include "exec/page-protection.h"
 #include "qapi/qapi-types-common.h"
 #include "target/arm/multiprocessing.h"
+#include "hw/arm/arm-security.h"
 #include "target/arm/gtimer.h"
 #include "target/arm/cpu-sysregs.h"
 #include "target/arm/mmuidx.h"
@@ -2102,30 +2103,6 @@ static inline int arm_feature(CPUARMState *env, int feature)
 
 void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp);
 
-/*
- * ARM v9 security states.
- * The ordering of the enumeration corresponds to the low 2 bits
- * of the GPI value, and (except for Root) the concat of NSE:NS.
- */
-
-typedef enum ARMSecuritySpace {
-    ARMSS_Secure     = 0,
-    ARMSS_NonSecure  = 1,
-    ARMSS_Root       = 2,
-    ARMSS_Realm      = 3,
-} ARMSecuritySpace;
-
-/* Return true if @space is secure, in the pre-v9 sense. */
-static inline bool arm_space_is_secure(ARMSecuritySpace space)
-{
-    return space == ARMSS_Secure || space == ARMSS_Root;
-}
-
-/* Return the ARMSecuritySpace for @secure, assuming !RME or EL[0-2]. */
-static inline ARMSecuritySpace arm_secure_to_space(bool secure)
-{
-    return secure ? ARMSS_Secure : ARMSS_NonSecure;
-}
 
 #if !defined(CONFIG_USER_ONLY)
 /**
-- 
2.47.3


