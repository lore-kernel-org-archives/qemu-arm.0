Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB41210F284E
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 16:46:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w6AJd-0006xb-Bd; Fri, 27 Mar 2026 12:45:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w6AJ3-0006ec-SF
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 12:45:11 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w6AIz-00039B-IV
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 12:45:09 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2aecefc7503so16579245ad.1
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 09:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774629899; x=1775234699; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OGa6TMkmYmwI7/7vLSYxk6iKMksC7GlEB26vrLcMz2w=;
 b=h2ljZiciT1Ik4VA/f+R4xnNVGcPuqbgvDY+fULzf2pINNJqQ0EHoMEMJb0HOVEki0Z
 b+G9dOIOM2x5+tTVU85jC5zuKS8CjLQgcMMSwwTFyJzIxiZH/s3y/H6HKQtS+I5wgumm
 qk6VrZsYwXZpbwpLEbEtk07njpFbEBAwGEXCUzY+YqbqkQyKT+ikqA4VY0OfAcHYoR/2
 JemHCcH81c7DOWVOgcfxmP1Xtm+fOeg8Dbmhh6cBt+O6jQb9JGylNJOo/ZxNf4KwOM0v
 NG4QfCV4iZjkzU2O1ZHgrtv7kGr61Jvwe6xu2SVH8mrUm4WJalWy0Bt9MDit0rnhG4a5
 tlOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774629899; x=1775234699;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OGa6TMkmYmwI7/7vLSYxk6iKMksC7GlEB26vrLcMz2w=;
 b=WQXgVPX31E8f2d1uq1khRm6p3FJD7xhl+bOttG8LptEiCJLwK7gT5fCxJ/sUnYvC1j
 2DcVeWnJbsloqmUVbUsExFpQUnqR7A/9dnUsQ14mX9L0n/KtC1f4jXzFXg2iWpTFbS99
 eKLJYPi7Um+LYhkMy7WXIYdVV//LNnyNZ64X3zt43Apr9VE4x+naH7iaq+JlhQ4PUHIB
 jLFDJ3C2uObosNmc+zVbRzn1qaUdHMCG3GFfsbiZoMYLIsfPUwflcRtUGFz7wMT9ZrBn
 dljTdaqiWH57HbvMlZFI3Eco8+4AzPJLKczUCpa9oshXOyLCqyZjyiR+3ec8jPkrjuIg
 gsTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLTldAgRZkmCxS4qRyOKKoOQyVGAuFFVKwK6I5nuehGcnpd1v/JZM+JlmlrrsoAvftrgdS28lnww==@nongnu.org
X-Gm-Message-State: AOJu0Yw8PPwqvd+ZBvwpnFW5g2QPdPl7M3PAaOMYemFHopwHT1LjXiCF
 mdadbyJSuNZ4auEX7MBvjs17NDXpizxMxzRGlAHgmgB0DfRJsUfBVepq0wgFSeF6K1E=
X-Gm-Gg: ATEYQzxEr/DaS+WsV6sHktbAKMLocncbMdKpJBe87oN1KpFUEaUhx5PXv278ieIroJr
 hX89kYDpHXFS2296AVqr3b+P6Ael62u2HQXYd0uJ8XSd/KZvMVV2nGxoEQO0EV/k/F+SqQ7dVC/
 uepbX9U+kHWfy2Ns2kYzHGBvvgI10C22iYKcZXHfyOc/cSaPcZMqkaSnZrNVSMRD8n/u45eNWDM
 Mdz/i3KH+q9cXw0cBEjY3Vf89dr+ZNv3A53NBC/fQfzVpJteAgI9h6cE+w1qHnzIb9+V5SmC6pK
 Ry/d4vn17qJ2rDK3+OUeh5s/bFc4nxubVbpPEeDCosSJy+xwyMpoKdQSFQodsZ3fRvn1m1H8dFF
 8GZhIoOP1xtF0rCZWkXD1gDZOmw4haF4vb4Af8mD53LQHGBJ4u2sxyTjOghnIlZXLE3FUshtDRB
 sKDLdDX5tNh49VgZRFMBKM3HFqOC/kPrLeQZPE+CSiRXEELeRe3ZH/bKplY3tgHiOEErdnI/Xlk
 ogD
X-Received: by 2002:a17:903:a86:b0:2b0:603e:e13c with SMTP id
 d9443c01a7336-2b0cdc9eacfmr33490565ad.33.1774629898980; 
 Fri, 27 Mar 2026 09:44:58 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b0bc882339sm63890655ad.43.2026.03.27.09.44.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 09:44:58 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, jim.macarthur@linaro.org,
 qemu-arm@nongnu.org, philmd@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 04/12] target/arm/tcg/translate.h: remove TARGET_AARCH64
Date: Fri, 27 Mar 2026 09:44:41 -0700
Message-ID: <20260327164449.596767-5-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327164449.596767-1-pierrick.bouvier@linaro.org>
References: <20260327164449.596767-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x630.google.com
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

We need to stub a64_translate_init and gen_a64_update_pc.
At this point, we don't need to do anything for aarch64_translator_ops
since it's just an external symbol.

We can now include target/arm/tcg/translate.h from common code, since
all target specific bits have been removed, or can be specialized with
specific defines.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/translate.h | 10 ----------
 target/arm/tcg/stubs32.c   | 17 +++++++++++++++++
 target/arm/tcg/meson.build |  1 +
 3 files changed, 18 insertions(+), 10 deletions(-)
 create mode 100644 target/arm/tcg/stubs32.c

diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index e28eac54afb..77fdc5f3a17 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -357,19 +357,9 @@ static inline int curr_insn_len(DisasContext *s)
 /* CPU state was modified dynamically; no need to exit, but do not chain. */
 #define DISAS_UPDATE_NOCHAIN  DISAS_TARGET_10
 
-#ifdef TARGET_AARCH64
 void a64_translate_init(void);
 void gen_a64_update_pc(DisasContext *s, int64_t diff);
 extern const TranslatorOps aarch64_translator_ops;
-#else
-static inline void a64_translate_init(void)
-{
-}
-
-static inline void gen_a64_update_pc(DisasContext *s, int64_t diff)
-{
-}
-#endif
 
 void arm_test_cc(DisasCompare *cmp, int cc);
 void arm_jump_cc(DisasCompare *cmp, TCGLabel *label);
diff --git a/target/arm/tcg/stubs32.c b/target/arm/tcg/stubs32.c
new file mode 100644
index 00000000000..c5a0bc61f47
--- /dev/null
+++ b/target/arm/tcg/stubs32.c
@@ -0,0 +1,17 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "target/arm/tcg/translate.h"
+
+
+void gen_a64_update_pc(DisasContext *s, int64_t diff)
+{
+    g_assert_not_reached();
+}
+
+void a64_translate_init(void)
+{
+    /* Don't initialize for 32 bits. Call site will be fixed later. */
+}
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 5f591560551..3e96c77df73 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -21,6 +21,7 @@ gen_a32 = [
 
 arm_ss.add(gen_a32)
 arm_ss.add(when: 'TARGET_AARCH64', if_true: gen_a64)
+arm_ss.add(when: 'TARGET_AARCH64', if_false: files('stubs32.c'))
 
 arm_ss.add(files(
   'cpu32.c',
-- 
2.47.3


