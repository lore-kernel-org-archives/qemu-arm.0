Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 257E7C87FD2
	for <qemu-arm@archiver.kernel.org>; Sat,  2 Aug 2025 23:34:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiLkF-0006dA-RO; Sat, 02 Aug 2025 19:34:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLiT-0001Yv-2L
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:32:43 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLiR-0005ES-4k
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:32:40 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-741a0ec1a05so315081a34.2
 for <qemu-arm@nongnu.org>; Sat, 02 Aug 2025 16:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754177558; x=1754782358; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RAF23I8Ky/4FVd+dyZVZ6YbCp7h0YfAKI01Ox5TbjXk=;
 b=KnqH2F/2EZcVh48eSzBDgJhjwvU8BPvy4Zi83tvg6wvFKPHkeog3nxnxHwQqQBOw+K
 iiFkKAaIhIClWLLeF/L5GN7kj2kzTj/DxJO3HRFJkH0GQgVw7rJLm0o6rsD5/vxm+LWd
 Z65k8PPRkjDSzcAsT6pxx2FcVWPMl0R/42d9quzlYdhVJLmYBE8FPFhlhpx01AUjmfV+
 h54JtIIRn0qDmuYXUpEyp/i0RF1dZVMRMAu0ozGbi517taxwS5pSHLjJDMscv4+WfWDr
 ymOT6dH8yOCCweXrECgenypVkidqKegq/rFUZ2VHWRU9TOoA6FpeLAS8ZfmaEg8Zq5Jh
 IbEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754177558; x=1754782358;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RAF23I8Ky/4FVd+dyZVZ6YbCp7h0YfAKI01Ox5TbjXk=;
 b=lG8CwoKl3ymn/TqbvJ/S4Kx02dAczDHYA4Tv4G39vdEHM92efoL5L+AJNWfFS39KdM
 8JxgNFapc1sOUKY6U77s698JNSpM/y6rNn0EH+XfFDgd1YqioT3QuLX68Si5tWA6N46F
 PkO+j74CzaBntAiZo/o2ZjmDVlAv8nczhnUefFaXAwE7tKaqo2YJ0LV9rTHiG74IRtlO
 M5Gm1ZPMdUJqYufWAmXyco8NxAvvxjkLo1PudsW9kYZJRPfMY4JHjP0bdrHy+EPKaMcJ
 k9Bt5Hc0wPYtGB/g6l6JRrvgc3QH2Rsvok5pzF+RB/38o9KQ5gjyC3nfXQswCs+LMrCS
 38Hg==
X-Gm-Message-State: AOJu0YzM+u3YaWkam2dCiAhxjahCRsVG31fPLBgmCLb/io3cglzEXNF8
 t+D0GLsr5uywHArSpxV4IrfC8xseToZ9OtdWgsd9YjjEWbIIbfSeT+BCJlVuj/SqGd8=
X-Gm-Gg: ASbGncvJ0f5lXWaUbRlnCCviFfCTThDEt/mixMvae0YfYav1IbW+THooqBVZM5Cu0ov
 9FfPiRdVuDaOtIxW0QNdDPxtrdF7AHnl0nPN9h1SUX2hJdgtT6JdKU2DgvHbEGqDWIrTa28Lq5A
 uLUBJ9rjomqyBwaj8vPUF2KbLgo453Zt58h0IY0v0kTciXdmZfpqBX3ixgiNwXFTVoEMTpvuDkf
 vX3AOkt2oezBoHHGMbiw5O0B0KK1+qOoen+qZuKPbzPEUsM5rxTBxjjL5MTusLxailnr9KK8o3n
 upcdLoFmdTv2Uh7BFh1rRIYTvMYRUfy8t66Q+RXo0n4bfqspUSeA3YCLsnqmpudTwgNJ7aVgPHu
 oGS+411Yx0JNcCe2KoEHw92WkHiCgL1YtWY9H66GmAMQngHDtKyoZ
X-Google-Smtp-Source: AGHT+IGQwz2fA5L1AljGXK1xEAwQcEG0elim4DRUdy9xsU0ebbukkeaQBiBxRpmKjuNt+E26yA0jpg==
X-Received: by 2002:a05:6871:400c:b0:307:15a8:2dc8 with SMTP id
 586e51a60fabf-30b675d13ecmr2554555fac.12.1754177557885; 
 Sat, 02 Aug 2025 16:32:37 -0700 (PDT)
Received: from stoup.. ([172.58.111.133]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-30b8e3c9b32sm71031fac.24.2025.08.02.16.32.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 16:32:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 33/85] target/arm: Convert arm_mmu_idx_to_el from switch to
 table
Date: Sun,  3 Aug 2025 09:29:01 +1000
Message-ID: <20250802232953.413294-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250802232953.413294-1-richard.henderson@linaro.org>
References: <20250802232953.413294-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
index b6499683cc..2dc82330ec 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -34,6 +34,7 @@
 #include "system/memory.h"
 #include "syndrome.h"
 #include "cpu-features.h"
+#include "mmuidx-internal.h"
 
 /* register banks for CPU modes */
 #define BANK_USRSYS 0
@@ -986,8 +987,6 @@ static inline ARMMMUIdx core_to_aa64_mmu_idx(int mmu_idx)
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
index 9447d7ba59..8985ad8c8a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9895,33 +9895,6 @@ int fp_exception_el(CPUARMState *env, int cur_el)
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


