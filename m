Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5475EF46C66
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Apr 2026 18:28:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w9oer-0007ad-JZ; Mon, 06 Apr 2026 14:26:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9oeq-0007ZO-Fi
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 14:26:44 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9oem-0002Rq-4U
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 14:26:44 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-82a893d289bso1782437b3a.0
 for <qemu-arm@nongnu.org>; Mon, 06 Apr 2026 11:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775499998; x=1776104798; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LlPwFDDr+q5Z7Q+lOvT8JYJLE7NSR8Cfyj45g3xJxl8=;
 b=YDNqmZO0A7sQSkRUtowXqkNHqnCpuRqAXXl8CGTaR1nH2yhPYxiFBOlRWTq8HF25zT
 aFanykQXRrwpefMwY5zwfOjYXe4RPYI5iTrqfukU9lcL8kqPdhUiIzT8wupwBN+FlqbP
 0FDB5zj2I6LBRBU5GHrkH5dGDVPJGIdxpovPe7hmDuQjvQWGd5i/YzPOx4XHhFZjtVwn
 isP/Ee0S3uXR+6XUHfL87HJ5vC5rNuIzpFJQ8CmT4p5TfJhVEKYukRRazU6ss491sdhB
 uF2PygJZZp5ijMhwBqBG/6UMb1YUwhn1cVHivswAUN7j2ohnDetgK9XVZb0fcDroV3Zv
 2beA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775499998; x=1776104798;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LlPwFDDr+q5Z7Q+lOvT8JYJLE7NSR8Cfyj45g3xJxl8=;
 b=jMK6Wd2/9yU/tavreGxDrZTG9j4RLuBXClxPq6FQ/kVU8iFnBOkhW9ipUOUp4osxwj
 4U5T6GCeb42XdaGhLKalqVjDnUjg9Hz+HYayyBg2em8fyu5bcR7x1VY8zWZauB2aNXvr
 3yyhTbL7/HXLNHbPDjkwP8sY7bXd8cuV7b5vLIKLqA0+y7YB2IvjezAsynqQYS090ntb
 BAf0RLXP7lvpkhxInYOxp6er9YI9dZDCkL3RwnAKNnILbGCz4pjOUVUEGs6GkAkSBOKp
 1v2Xj82IUw8HFN67Ml25kuXGegGTUYZRob04iU0KfQLW0gcGREQfLi+HCYS1YJHu/DM2
 Svyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOip9JJZCMAWMbw1ZPbJ0d26a0OUryip6OEM0yYBc6dHaFeMv2MSUuIwH2M4YXKm2zUGObysTbIQ==@nongnu.org
X-Gm-Message-State: AOJu0YwGKASFbzf1mQx4x/BSuUk4Rx0+8qL93VaKFTa70r5NnHZOlNnb
 hq8iVIWi+pnlgx4teq/nvIAbunCafgluPoc6XOH2LzbxBJF5ZUpo/0Jr1gm6Jx8pC2o=
X-Gm-Gg: AeBDievHeoQDqFm4w8lujvQumEykR4yKl2fSfHHHkJLZmvfSVRC6VczVMOj/w+WXm/2
 WVk+BqneTJkJz27+A4RQH2ckrb3YOu9CkKtLFUPCCzRK697Jyz0HlQadkg8w/sjCGBm1ZlvOYX1
 vac7R7Bc5+QjB0ierCw9px9AAXa+w+H2QbR7bicIZcxqYKr1oiSZZtzCMR+WVBKU0GaIK14PuFB
 iD4Rhb78cokBMmuBXIZljVltO6vYegYc0jV+nhE8iaJyotCPF4db40gaDmxZEG0tY9tk5l/VwvJ
 qb15wqR30HcAG0SxqZj4z1ixQ8UeL1yqSo1g6ejEBZONYgoiGhyLLJLSkOV4mmJKyyq8D5IpGpK
 OC7g5Tg2zntWl7Qdhitk51Vdhm+yZQ32x62qEH9rbMN4+6/ziqcrkVQ+54wEUjRg8HdQ9V8KmD9
 3EFoRKqYwUhMLOToX78MZl2LxwMj9Bi7e0pzZ6ekMC3NjvolWlzJGqYgvK5cEIMLJTDCcQtMCok
 P5F
X-Received: by 2002:a05:6a21:6d8f:b0:39b:d9f1:6d05 with SMTP id
 adf61e73a8af0-39f2f2b0043mr13468146637.53.1775499998365; 
 Mon, 06 Apr 2026 11:26:38 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c76c6561fe9sm12765080a12.15.2026.04.06.11.26.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2026 11:26:37 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, jim.macarthur@linaro.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@linaro.org, qemu-arm@nongnu.org
Subject: [PATCH v8 19/20] target/arm/tcg/translate.c: remove TARGET_AARCH64
Date: Mon,  6 Apr 2026 11:26:08 -0700
Message-ID: <20260406182609.193886-20-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260406182609.193886-1-pierrick.bouvier@linaro.org>
References: <20260406182609.193886-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x434.google.com
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

We extract aarch64_translate_code function, and stub it accordingly.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/internals.h         |  2 ++
 target/arm/tcg/stubs32.c       |  7 +++++++
 target/arm/tcg/translate-a64.c |  8 ++++++++
 target/arm/tcg/translate.c     | 19 ++++++++-----------
 4 files changed, 25 insertions(+), 11 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 8ec27508473..2850edcb198 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -381,6 +381,8 @@ void arm_init_cpreg_list(ARMCPU *cpu);
 
 void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu);
 void arm_translate_init(void);
+void aarch64_translate_code(CPUState *cs, TranslationBlock *tb,
+                            int *max_insns, vaddr pc, void *host_pc);
 void arm_translate_code(CPUState *cs, TranslationBlock *tb,
                         int *max_insns, vaddr pc, void *host_pc);
 
diff --git a/target/arm/tcg/stubs32.c b/target/arm/tcg/stubs32.c
index c5a0bc61f47..3945dc49e5e 100644
--- a/target/arm/tcg/stubs32.c
+++ b/target/arm/tcg/stubs32.c
@@ -3,6 +3,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "target/arm/internals.h"
 #include "target/arm/tcg/translate.h"
 
 
@@ -15,3 +16,9 @@ void a64_translate_init(void)
 {
     /* Don't initialize for 32 bits. Call site will be fixed later. */
 }
+
+void aarch64_translate_code(CPUState *cs, TranslationBlock *tb,
+                            int *max_insns, vaddr pc, void *host_pc)
+{
+    g_assert_not_reached();
+}
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index ebab9f36f08..db3990576c0 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -10948,3 +10948,11 @@ const TranslatorOps aarch64_translator_ops = {
     .translate_insn     = aarch64_tr_translate_insn,
     .tb_stop            = aarch64_tr_tb_stop,
 };
+
+void aarch64_translate_code(CPUState *cpu, TranslationBlock *tb,
+                            int *max_insns, vaddr pc, void *host_pc)
+{
+     DisasContext dc = {};
+     translator_loop(cpu, tb, max_insns, pc, host_pc,
+                     &aarch64_translator_ops, &dc.base, TCG_TYPE_I64);
+}
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index aea38507ef4..9a971325144 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -6906,19 +6906,16 @@ static const TranslatorOps thumb_translator_ops = {
 void arm_translate_code(CPUState *cpu, TranslationBlock *tb,
                         int *max_insns, vaddr pc, void *host_pc)
 {
-    DisasContext dc = { };
-    const TranslatorOps *ops = &arm_translator_ops;
     CPUARMTBFlags tb_flags = arm_tbflags_from_tb(tb);
-    TCGType addr_type = is_a64(cpu_env(cpu)) ? TCG_TYPE_I64 : TCG_TYPE_I32;
 
-    if (EX_TBFLAG_AM32(tb_flags, THUMB)) {
-        ops = &thumb_translator_ops;
-    }
-#ifdef TARGET_AARCH64
     if (EX_TBFLAG_ANY(tb_flags, AARCH64_STATE)) {
-        ops = &aarch64_translator_ops;
+        aarch64_translate_code(cpu, tb, max_insns, pc, host_pc);
+    } else {
+        DisasContext dc = { };
+        translator_loop(cpu, tb, max_insns, pc, host_pc,
+                (EX_TBFLAG_AM32(tb_flags, THUMB)
+                 ? &thumb_translator_ops
+                 : &arm_translator_ops),
+                &dc.base, TCG_TYPE_I32);
     }
-#endif
-
-    translator_loop(cpu, tb, max_insns, pc, host_pc, ops, &dc.base, addr_type);
 }
-- 
2.47.3


