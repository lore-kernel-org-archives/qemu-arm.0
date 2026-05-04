Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4536CD3427
	for <qemu-arm@archiver.kernel.org>; Mon,  4 May 2026 15:51:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wJvZn-0000uH-AD; Mon, 04 May 2026 11:51:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wJvZl-0000tg-M0
 for qemu-arm@nongnu.org; Mon, 04 May 2026 11:51:17 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wJvZj-0006Bs-S3
 for qemu-arm@nongnu.org; Mon, 04 May 2026 11:51:17 -0400
Received: by mail-qt1-x82f.google.com with SMTP id
 d75a77b69052e-50e63771eb0so43667951cf.3
 for <qemu-arm@nongnu.org>; Mon, 04 May 2026 08:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777909875; x=1778514675; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=KO7Mq8JRuwohDcM/67cxG4Kl5R8QIg4FU/azGfOw7c8=;
 b=jtuyI9dxjFpAhNiqXWaBZaFGsLaHFLRL/69rUsniFzrDLp8QJpXc8WBhdpfvXlZn+l
 +7ej13xczyziLv/iuQCVaNLKyI8s0HeOXhB8Ish9ldP38zuMR7YRy4OCg4al6OtJyljf
 RxZV2BlImVoM037xiRQkWCkx7MiNVtc841Y8PfvWzrhK9uDFUYr2Kdhmpr3OaU5KMCGY
 dmaIaO8OjbD8D8J11BuiKHq7TBrY2BzVI7zCfy3pzYzYIfBuGkZememn5Mdfz8L8YjYI
 PBSdXfCSMoenCEwO57sG1WmVU624o2TdLABYfc7dRVk50BqWF2x9Bs+hdTAlqfs2QU2I
 423A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777909875; x=1778514675;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=KO7Mq8JRuwohDcM/67cxG4Kl5R8QIg4FU/azGfOw7c8=;
 b=Ba2HuJznGMEde+wxZkImppK4ia7okDWVmAk+2O5TwDusACW/PMf4LtDzhOt6rLP3a2
 s/NscA4aK24b2cPElqKRMe6TyoN3UMrRIDQ0Z6xsrhHKezWFmhqF/Pc1VmihqaqKoY4q
 rZ+cAVGlK8L7D/ib7PNG20bFaNi0y7csfbsFWPn+I3LFvw7ASIl6gfF05t9PJY66ts3J
 u5wnxpaPA8XADHgXKtcXYDvnJnBzssGYOAYluh1rTKtLalle9Obq3rWDBsOzm/EQVFqr
 FA2PYgFkn8hPTsoEfn1r0Q555rPZPBKhjReN0VQV6UFzEhzWGc+U+76Vh08z5G+V/5EQ
 PJ/Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ8hY8CJIZCG+hynR3u1HDKVaSlKY1SiZkzb+XFtVq7hmBjwCo6jL+1zR6j+iiK+mr1YkOeXtu7Tcw==@nongnu.org
X-Gm-Message-State: AOJu0YxvDldUpiB2A38rAcaGEMHTok0YqY5lMnvua+dMup9B0YeXJXeH
 FvirWEKngQD68ujD5qni9MxOclmniA16aoOivY3q8pH5mYqlcO6wXmlc
X-Gm-Gg: AeBDietjB6vxa8TJam3FQJ8Fi0BHKutfU+N8yQPdjWfd64LYfH/HwZjJjYmDH2Sjsoh
 8FvokZhLgscPuIEFYSzKFLwa+gScGHaNOHF8m6qA5ahAgtq5B4k0oCRgpbW0IAkqhExozWZJNQh
 ndKlrnEU/qF1j4VwHTUSouQvT2VSFXaIPnVce/yUPKcH5cRSEa1+f7XZq85AXEUJRt+jbXV/QB0
 Ou25ClUu/Py5xPnlV0JmCFEqXL/3ZdJXvfQhH47TKRJjtn0iC/HAXsk8XSyTpt45xvw1ozKp99e
 PP6K7EKQF76fVPLccRAEumaC3WKCPBmT78uJjXC7ZocLZuqbGKACm4b68gc0tEzK2Zk8pDw+LOP
 rD7qHKErNv6KgbsYmCgCHLVJdAeDIs1JgqTx1HiDUBkAx5SsKwKLHm4ZY4G1g2wTRGz6KyCTqcs
 u/R9+O7O7mivUkDofZduq9wbAE+7Qxotttji3xe4yLkkl57LsqyEQ=
X-Received: by 2002:a05:622a:54e:b0:50d:aae1:7070 with SMTP id
 d75a77b69052e-5104bf6c541mr142645831cf.48.1777909874649; 
 Mon, 04 May 2026 08:51:14 -0700 (PDT)
Received: from [192.168.1.164] ([2600:1009:a021:c665:5296:905f:3e4a:eb90])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51040931552sm99599011cf.12.2026.05.04.08.51.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2026 08:51:14 -0700 (PDT)
From: Gabriel Brookman <brookmangabriel@gmail.com>
Date: Mon, 04 May 2026 11:50:37 -0400
Subject: [PATCH v5 04/15] linux-user: add MTE_STORE_ONLY to prctl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-feat-mte4-v5-4-232a648e63c6@gmail.com>
References: <20260504-feat-mte4-v5-0-232a648e63c6@gmail.com>
In-Reply-To: <20260504-feat-mte4-v5-0-232a648e63c6@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>, 
 Gabriel Brookman <brookmangabriel@gmail.com>, Helge Deller <deller@gmx.de>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777909867; l=4942;
 i=brookmangabriel@gmail.com; s=20251009; h=from:subject:message-id;
 bh=3NUHlDKCw8l8rqmAwbaWm0eM8fht4yd8LR/eAfpLXkM=;
 b=qaor9hF4vUH0Y5C2PSDNFkZo239y6H4EkDjtaT+bpxkAmJpegOR/RoWzOFUD//lvnAR06k1IT
 UOZq0fombvQCtuNPHUdjUQOLxo7Ah0nYTB/H+S1kA0CXy2N1Zox78yQ
X-Developer-Key: i=brookmangabriel@gmail.com; a=ed25519;
 pk=m9TtPDal6WzoHNnQiHHKf8dTrv3DUCPUUTujuo8vNrw=
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=brookmangabriel@gmail.com; helo=mail-qt1-x82f.google.com
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


