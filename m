Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C5EACD37BE
	for <qemu-arm@archiver.kernel.org>; Mon, 11 May 2026 14:02:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wMRCX-000431-IZ; Mon, 11 May 2026 10:01:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wMRCJ-0003xN-8Z
 for qemu-arm@nongnu.org; Mon, 11 May 2026 10:01:35 -0400
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wMRC9-00063W-5g
 for qemu-arm@nongnu.org; Mon, 11 May 2026 10:01:21 -0400
Received: by mail-ua1-x931.google.com with SMTP id
 a1e0cc1a2514c-944168e8c5fso2489377241.2
 for <qemu-arm@nongnu.org>; Mon, 11 May 2026 07:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778508073; x=1779112873; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=KO7Mq8JRuwohDcM/67cxG4Kl5R8QIg4FU/azGfOw7c8=;
 b=AtfdCcx+yj6+q1dqcUWZKQYaAxWXBZBedzj4zOAll7s7+UusBaZYA2tjamJMQo0LaW
 3VdP/WEv1AhNRU2m8QM9Bv/Ftm64xBO7upzaWRyTwCvuxaYc1IqDtxMBx1lFJdn7uuOk
 8bsYijPkMJd/L2v6fviyC3N7YRYDOrpUSUyKeSdRRrQ4vnnaqJr7wIC65c8qmxWUn+iF
 +3U+9krUC91HkoKoGnzlt1Vfa70ztr2qc96gQqkNR/JKwEyuQId3lO6aU5LL6h7yJoKT
 An8IPkQseOm8Dh3xR8V95jtX8GwADz/GrQk3iaSplfhG6u7O1YXd+nx9OqGfieT9302d
 iQeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778508073; x=1779112873;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=KO7Mq8JRuwohDcM/67cxG4Kl5R8QIg4FU/azGfOw7c8=;
 b=MHwVNDtbTtvHbp5lriCJ79KdVnDhACFAJKAjiBdLE0zDtEU+32eKpD6wIbFl7Eynyl
 qV6WC+9RU00ddpk3MNCyLxebQmsT1f1Jg81Ox8OoyZMb7IE6f6qcC3kED/5NC6RG8LAZ
 AifSgXehc0DBUGUKtEAO/fCILLg6p66AIdeqgklJuX4UL45nWGmVFRTGTqOXeorYhb0o
 fDzs18mfMXs2zUPVY+BJiCby9sSt7WVebHkUDXSxyNtTfd3oSKkGvHb1a7jHA4NAym4N
 eefyCM6+/NDb7+ZWTxTRGscVpTcj0rgsxS4XFIMAA6gRHcuVQgYRjWg2jDlos+kxBQSb
 mfog==
X-Forwarded-Encrypted: i=1;
 AFNElJ+Aq7AyVKPpLt7d+IaO9MhBircyvXS+e48S6eUiCyuDlMWB3vB1YpXYAnk37U5ET2T1gH7dhZE7VA==@nongnu.org
X-Gm-Message-State: AOJu0YywnwaJXqWJvjF32/o+wllmGjS+V8TtrI8CXpY8Pbd2AseHeKOn
 7+Gr+o+Y+rRJKhsb2tZSb8gAKLKB/XArR3mV84251IwwN+1iKjPo8KcQ
X-Gm-Gg: Acq92OG4u5VrY3QIT2q6cT7vg3rBGs7Oc0dT6DWsnlljgvdLtDILkq1OpzmEYWjHFdQ
 aiXBL0p0h7nPbTMbIW+Tkz8pA/Hi0Bh5vSKo3hBITKPskj7zXDOE8srV+hiLOVhCsHc1tib0Hx5
 7e469YRtSn+IxUGh/Xgrpl2Oi2+mVYtFy9THfzaVxc57ow0Ti+1DfJ1kVDgl4AWCtMAbF1IJ6LX
 Qx0ctbB+k7bBhCuNR76x8JQZjrL9XroYDY3oaurlPGlwy4jPHnWapS4AKterS+l+vmzyyj4PZ+R
 MpR7HaN+L/NgKZiAS9XMwcM0Y0pj31Fi0S6pOjwpOg3WDgFMAe3+hVZ0Aj4JgCvKoDrt70aN9Pg
 /dUfMCRt+wmYkFOtM8ftoYMpriraoRhuY60UBOWUfqL8ApTCr534UBoWSWzvj0O5RpyvQADuxLp
 7Cqu02XqsIFzAoU8A2DttUFlG4q5o31W9WNgrncb00
X-Received: by 2002:a67:ef42:0:b0:631:28c1:154e with SMTP id
 ada2fe7eead31-63128c11dfbmr6905313137.16.1778508071517; 
 Mon, 11 May 2026 07:01:11 -0700 (PDT)
Received: from [192.168.1.160] ([2600:4041:54f3:a400:c013:3550:ed5f:a59a])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8bf39c7dd09sm94773756d6.31.2026.05.11.07.01.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2026 07:01:10 -0700 (PDT)
From: Gabriel Brookman <brookmangabriel@gmail.com>
Date: Mon, 11 May 2026 10:01:02 -0400
Subject: [PATCH v6 04/15] linux-user: add MTE_STORE_ONLY to prctl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-feat-mte4-v6-4-8557cc1313b9@gmail.com>
References: <20260511-feat-mte4-v6-0-8557cc1313b9@gmail.com>
In-Reply-To: <20260511-feat-mte4-v6-0-8557cc1313b9@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>, 
 Gabriel Brookman <brookmangabriel@gmail.com>, Helge Deller <deller@gmx.de>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778508062; l=4942;
 i=brookmangabriel@gmail.com; s=20251009; h=from:subject:message-id;
 bh=3NUHlDKCw8l8rqmAwbaWm0eM8fht4yd8LR/eAfpLXkM=;
 b=3OHSB36w0QVpFZCmvTh4TzglFIT8Qb+/BuQREkd8pinTR0dwZ4cxyjxp8VVkrlKwRpdfJiE5K
 oUSplSABADGAlikrVPS9t9VbKJKtywISZKropMQpQH0KidV4bW6Vsk1
X-Developer-Key: i=brookmangabriel@gmail.com; a=ed25519;
 pk=m9TtPDal6WzoHNnQiHHKf8dTrv3DUCPUUTujuo8vNrw=
Received-SPF: pass client-ip=2607:f8b0:4864:20::931;
 envelope-from=brookmangabriel@gmail.com; helo=mail-ua1-x931.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Linux-user processes can now control whether MTE_STORE_ONLY is enabled
using the prctl syscall.

Signed-off-by: Gabriel Brookman <brookmangabriel@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/mte_user_helper.c | 11 ++++++++++-
 linux-user/aarch64/mte_user_helper.h | 14 +++++++++-----
 linux-user/aarch64/target_prctl.h    |  6 +++++-
 target/arm/gdbstub64.c               |  2 +-
 tests/tcg/aarch64/mte.h              |  3 +++
 5 files changed, 28 insertions(+), 8 deletions(-)

diff --git a/linux-user/aarch64/mte_user_helper.c b/linux-user/aarch64/mte_user_helper.c
index a5b1c8503b..b5c4dafcda 100644
--- a/linux-user/aarch64/mte_user_helper.c
+++ b/linux-user/aarch64/mte_user_helper.c
@@ -10,7 +10,7 @@
 #include "qemu.h"
 #include "mte_user_helper.h"
 
-void arm_set_mte_tcf0(CPUArchState *env, abi_long value)
+void arm_set_tagged_addr_ctrl(CPUArchState *env, abi_long value)
 {
     /*
      * Write PR_MTE_TCF to SCTLR_EL1[TCF0].
@@ -32,4 +32,13 @@ void arm_set_mte_tcf0(CPUArchState *env, abi_long value)
         tcf = 2;
     }
     env->cp15.sctlr_el[1] = deposit64(env->cp15.sctlr_el[1], 38, 2, tcf);
+
+    /*
+     * If MTE_STORE_ONLY is enabled, set the corresponding sctlr_el1 bit
+     */
+    if (value & PR_MTE_STORE_ONLY) {
+        env->cp15.sctlr_el[1] |= SCTLR_TCSO0;
+    } else {
+        env->cp15.sctlr_el[1] &= ~SCTLR_TCSO0;
+    }
 }
diff --git a/linux-user/aarch64/mte_user_helper.h b/linux-user/aarch64/mte_user_helper.h
index 0c53abda22..8a46f743f4 100644
--- a/linux-user/aarch64/mte_user_helper.h
+++ b/linux-user/aarch64/mte_user_helper.h
@@ -20,15 +20,19 @@
 # define PR_MTE_TAG_SHIFT       3
 # define PR_MTE_TAG_MASK        (0xffffUL << PR_MTE_TAG_SHIFT)
 #endif
+#ifndef PR_MTE_STORE_ONLY
+# define PR_MTE_STORE_ONLY      (1UL << 19)
+#endif
 
 /**
- * arm_set_mte_tcf0 - Set TCF0 field in SCTLR_EL1 register
+ * arm_set_tagged_addr_ctrl - Set TCF0 and TCSO0 fields in SCTLR_EL1 register
  * @env: The CPU environment
- * @value: The value to be set for the Tag Check Fault in EL0 field.
+ * @value: The value to be set for the Tag Check Fault and Tag Check Store Only
+ * in EL0 field.
  *
- * Only SYNC and ASYNC modes can be selected. If ASYMM mode is given, the SYNC
- * mode is selected instead. So, there is no way to set the ASYMM mode.
+ * Only SYNC and ASYNC modes can be selected for TCF0. If ASYMM mode is given,
+ * the SYNC mode is selected instead. So, there is no way to set the ASYMM mode.
  */
-void arm_set_mte_tcf0(CPUArchState *env, abi_long value);
+void arm_set_tagged_addr_ctrl(CPUArchState *env, abi_long value);
 
 #endif /* AARCH64_MTE_USER_HELPER_H */
diff --git a/linux-user/aarch64/target_prctl.h b/linux-user/aarch64/target_prctl.h
index 621be5727f..d91e75d60d 100644
--- a/linux-user/aarch64/target_prctl.h
+++ b/linux-user/aarch64/target_prctl.h
@@ -168,6 +168,9 @@ static abi_long do_prctl_set_tagged_addr_ctrl(CPUArchState *env, abi_long arg2)
     if (cpu_isar_feature(aa64_mte, cpu)) {
         valid_mask |= PR_MTE_TCF_MASK;
         valid_mask |= PR_MTE_TAG_MASK;
+        if (cpu_isar_feature(aa64_mte_store_only, cpu)) {
+            valid_mask |= PR_MTE_STORE_ONLY;
+        }
     }
 
     if (arg2 & ~valid_mask) {
@@ -176,7 +179,7 @@ static abi_long do_prctl_set_tagged_addr_ctrl(CPUArchState *env, abi_long arg2)
     env->tagged_addr_enable = arg2 & PR_TAGGED_ADDR_ENABLE;
 
     if (cpu_isar_feature(aa64_mte, cpu)) {
-        arm_set_mte_tcf0(env, arg2);
+        arm_set_tagged_addr_ctrl(env, arg2);
 
         /*
          * Write PR_MTE_TAG to GCR_EL1[Exclude].
@@ -185,6 +188,7 @@ static abi_long do_prctl_set_tagged_addr_ctrl(CPUArchState *env, abi_long arg2)
          */
         env->cp15.gcr_el1 =
             deposit64(env->cp15.gcr_el1, 0, 16, ~arg2 >> PR_MTE_TAG_SHIFT);
+
         arm_rebuild_hflags(env);
     }
     return 0;
diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index a4fa740caf..0c3e5b30bd 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -684,7 +684,7 @@ int aarch64_gdb_set_tag_ctl_reg(CPUState *cs, uint8_t *buf, int reg)
      * expose options regarding the type of MTE fault that can be controlled at
      * runtime.
      */
-    arm_set_mte_tcf0(env, tcf);
+    arm_set_tagged_addr_ctrl(env, tcf);
 
     return 1;
 #else
diff --git a/tests/tcg/aarch64/mte.h b/tests/tcg/aarch64/mte.h
index 0805676b11..17b932f3f1 100644
--- a/tests/tcg/aarch64/mte.h
+++ b/tests/tcg/aarch64/mte.h
@@ -20,6 +20,9 @@
 #ifndef PR_TAGGED_ADDR_ENABLE
 # define PR_TAGGED_ADDR_ENABLE    (1UL << 0)
 #endif
+#ifndef PR_MTE_STORE_ONLY
+# define PR_MTE_STORE_ONLY        (1UL << 19)
+#endif
 #ifndef PR_MTE_TCF_SHIFT
 # define PR_MTE_TCF_SHIFT         1
 # define PR_MTE_TCF_NONE          (0UL << PR_MTE_TCF_SHIFT)

-- 
2.54.0


