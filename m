Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E1ECCA100F
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 18:50:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0lc9-000555-3n; Mon, 22 Sep 2025 14:50:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lbz-0004xf-3R
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:50:08 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lbo-0004Av-Fz
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:50:06 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-77f2e960728so1970911b3a.2
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 11:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758566994; x=1759171794; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BGgbkOYgstOm3FLiDI4TAuGXBCVfOMBg0ypvUcABhs8=;
 b=ZMpk7uo5CnwrCxE2xvV9kd3Z+Lj35CWm7V57kHOjafNpMNEW5CXwHNVLuXtMNMd1ly
 7FIKvQBzDiH6lauAjN0BvNKQG06a1UbBL6mxz7n+LfASFLyH4Mo8Y3i4EaTGTDH+HUwg
 tRk3lE+UoGIQ0SpUNZsTImyIP2bqW8+pP28bwvnYcBY8CwjGiPSCyUQh0SGjao5TmfN3
 s1MK8j/5A2Q21xmLRKGdt/c1ChkpFWzdR+6S4k81VxGtcuD5tW2QsOpoEUu/WDUKiqky
 q4NXnKR2VmJShVUGuLhE4QgO3ZimBXlnLGx/kqMcKMsEGlCENdlxYqB5ODiBUORDeqTX
 b7Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758566994; x=1759171794;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BGgbkOYgstOm3FLiDI4TAuGXBCVfOMBg0ypvUcABhs8=;
 b=oWkZVJK1ROAH/UXLEZ83mgbhBRyKV6/tfbjjR70fmqqvwFQNU2fGDSObTOtnHjwmLx
 lKDPzkTLlnS0zsWuh2fz+kUFUf8KGkhN6TipNKYAhq4tLNQQECGLEULAsPlpmzeyiF+T
 GfNYy+rcIwjRjlVmYHbCkE6ze5SPn8Vun+Nq9o+r2apNVePOsCDtknBO+cSHxrmd3DWZ
 aDcDX18+TGbPSo+aEWhcB7/x93U9UP1zmyLCATzClbWTp0xTK6bqNl2Ror8ll7AUF4ts
 GjWCtaNYuJwuSPpZmNlFSQia/gzBmSIRbQT6lzN8MDVdvxcBN4r+GjwCk8dBWwofE6Ku
 ntrg==
X-Gm-Message-State: AOJu0Yz/nxfxZsw+Za5LDL1xeWonTcZRmEv4oIrdGnKGODVQMKXoZirj
 gkbjJ688EaPtrf42eylB53KlIH/shpLTABpWnu0fe2827dVe2XUc+tXrBaqkWkIZvfk=
X-Gm-Gg: ASbGncvIofJUTy5PM0ExIWfi2GBEjU1U1Kwb59fqCGwiXO0XYRXX/f6gMxlKmg3MS1q
 HkIFYKFul2tYlnHMWdyO3dhI+d50XYrdPwwEM5hMrk68HDvjUbeRnMfIVUuTnRmJwMAb+u1tpwk
 4luAruTLYQzFOcTAmNtx34u626lVtNRxRk1XrAowgtN25ctdVd+lgY1Do1INLdJTV9WO90KlGGB
 WnbHl7X/f8d2u2l0783isz9E1s6X9/Hz/4ogmqaHdf4aOq7kYRI9+/gglYuN2dKvGbz7zQVI+rm
 fJWFDLUlM2o5/geqjX5vSfssTMoOFTq+FE8PAa+ocfuhxxHvI8qwQhXYT8qZsV1n0M9nGvVVQVz
 bcAPfZZeFLRGzhfcsaG9r3sxg+JdC
X-Google-Smtp-Source: AGHT+IEXhlhum1r7tAymTwLclKht9P9QQvFDoXQWtYxlYmcPX4xpfx1wgWnz0frEgA9HV/+gX+HRSA==
X-Received: by 2002:a05:6a21:6da0:b0:2c8:85a5:c421 with SMTP id
 adf61e73a8af0-2cfda85d44amr144819637.18.1758566993781; 
 Mon, 22 Sep 2025 11:49:53 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77e5fe6de75sm10583861b3a.19.2025.09.22.11.49.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 11:49:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 20/76] target/arm: Convert arm_mmu_idx_to_el from switch to
 table
Date: Mon, 22 Sep 2025 11:48:28 -0700
Message-ID: <20250922184924.2754205-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922184924.2754205-1-richard.henderson@linaro.org>
References: <20250922184924.2754205-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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

In an effort to keep all ARMMMUIdx data in one place, begin construction
of an info table describing all of the properties of the mmu_idx.  Begin
with the access EL.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h       |  3 +--
 target/arm/mmuidx-internal.h | 29 +++++++++++++++++++++++++
 target/arm/helper.c          | 27 ------------------------
 target/arm/mmuidx.c          | 41 ++++++++++++++++++++++++++++++++++++
 target/arm/meson.build       |  7 +++++-
 5 files changed, 77 insertions(+), 30 deletions(-)
 create mode 100644 target/arm/mmuidx-internal.h
 create mode 100644 target/arm/mmuidx.c

diff --git a/target/arm/internals.h b/target/arm/internals.h
index a2ee5f8739..c29682da7d 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -34,6 +34,7 @@
 #include "system/memory.h"
 #include "syndrome.h"
 #include "cpu-features.h"
+#include "mmuidx-internal.h"
 
 /* register banks for CPU modes */
 #define BANK_USRSYS 0
@@ -984,8 +985,6 @@ static inline ARMMMUIdx core_to_aa64_mmu_idx(int mmu_idx)
     return mmu_idx | ARM_MMU_IDX_A;
 }
 
-int arm_mmu_idx_to_el(ARMMMUIdx mmu_idx);
-
 /* Return the MMU index for a v7M CPU in the specified security state */
 ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate);
 
diff --git a/target/arm/mmuidx-internal.h b/target/arm/mmuidx-internal.h
new file mode 100644
index 0000000000..29bba4ecb5
--- /dev/null
+++ b/target/arm/mmuidx-internal.h
@@ -0,0 +1,29 @@
+/*
+ * QEMU Arm software mmu index internal definitions
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef TARGET_ARM_MMUIDX_INTERNAL_H
+#define TARGET_ARM_MMUIDX_INTERNAL_H
+
+#include "mmuidx.h"
+#include "tcg/debug-assert.h"
+#include "hw/registerfields.h"
+
+
+FIELD(MMUIDXINFO, EL, 0, 2)
+FIELD(MMUIDXINFO, ELVALID, 2, 1)
+
+extern const uint32_t arm_mmuidx_table[ARM_MMU_IDX_M + 8];
+
+#define arm_mmuidx_is_valid(x)  ((unsigned)(x) < ARRAY_SIZE(arm_mmuidx_table))
+
+/* Return the exception level associated with this mmu index. */
+static inline int arm_mmu_idx_to_el(ARMMMUIdx idx)
+{
+    tcg_debug_assert(arm_mmuidx_is_valid(idx));
+    tcg_debug_assert(FIELD_EX32(arm_mmuidx_table[idx], MMUIDXINFO, ELVALID));
+    return FIELD_EX32(arm_mmuidx_table[idx], MMUIDXINFO, EL);
+}
+
+#endif /* TARGET_ARM_MMUIDX_INTERNAL_H */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index f66868f9ef..ea343e9d48 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9639,33 +9639,6 @@ int fp_exception_el(CPUARMState *env, int cur_el)
     return 0;
 }
 
-/* Return the exception level we're running at if this is our mmu_idx */
-int arm_mmu_idx_to_el(ARMMMUIdx mmu_idx)
-{
-    if (mmu_idx & ARM_MMU_IDX_M) {
-        return mmu_idx & ARM_MMU_IDX_M_PRIV;
-    }
-
-    switch (mmu_idx) {
-    case ARMMMUIdx_E10_0:
-    case ARMMMUIdx_E20_0:
-    case ARMMMUIdx_E30_0:
-        return 0;
-    case ARMMMUIdx_E10_1:
-    case ARMMMUIdx_E10_1_PAN:
-        return 1;
-    case ARMMMUIdx_E2:
-    case ARMMMUIdx_E20_2:
-    case ARMMMUIdx_E20_2_PAN:
-        return 2;
-    case ARMMMUIdx_E3:
-    case ARMMMUIdx_E30_3_PAN:
-        return 3;
-    default:
-        g_assert_not_reached();
-    }
-}
-
 #ifndef CONFIG_TCG
 ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate)
 {
diff --git a/target/arm/mmuidx.c b/target/arm/mmuidx.c
new file mode 100644
index 0000000000..309b1d68df
--- /dev/null
+++ b/target/arm/mmuidx.c
@@ -0,0 +1,41 @@
+/*
+ * QEMU Arm software mmu index definitions
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "mmuidx-internal.h"
+
+
+#define EL(X)  ((X << R_MMUIDXINFO_EL_SHIFT) | R_MMUIDXINFO_ELVALID_MASK)
+
+const uint32_t arm_mmuidx_table[ARM_MMU_IDX_M + 8] = {
+    /*
+     * A-profile.
+     */
+    [ARMMMUIdx_E10_0]           = EL(0),
+    [ARMMMUIdx_E10_1]           = EL(1),
+    [ARMMMUIdx_E10_1_PAN]       = EL(1),
+
+    [ARMMMUIdx_E20_0]           = EL(0),
+    [ARMMMUIdx_E20_2]           = EL(2),
+    [ARMMMUIdx_E20_2_PAN]       = EL(2),
+
+    [ARMMMUIdx_E2]              = EL(2),
+
+    [ARMMMUIdx_E3]              = EL(3),
+    [ARMMMUIdx_E30_0]           = EL(0),
+    [ARMMMUIdx_E30_3_PAN]       = EL(3),
+
+    /*
+     * M-profile.
+     */
+    [ARMMMUIdx_MUser]           = EL(0),
+    [ARMMMUIdx_MPriv]           = EL(1),
+    [ARMMMUIdx_MUserNegPri]     = EL(0),
+    [ARMMMUIdx_MPrivNegPri]     = EL(1),
+    [ARMMMUIdx_MSUser]          = EL(0),
+    [ARMMMUIdx_MSPriv]          = EL(1),
+    [ARMMMUIdx_MSUserNegPri]    = EL(0),
+    [ARMMMUIdx_MSPrivNegPri]    = EL(1),
+};
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 07d9271aa4..91630a1f72 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -6,7 +6,12 @@ arm_ss.add(files(
 
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'cpu64.c',
-  'gdbstub64.c'))
+  'gdbstub64.c'
+))
+
+arm_common_ss.add(files(
+  'mmuidx.c',
+))
 
 arm_system_ss = ss.source_set()
 arm_common_system_ss = ss.source_set()
-- 
2.43.0


