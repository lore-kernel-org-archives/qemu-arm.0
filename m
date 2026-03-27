Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BBEC10F2853
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 16:52:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w6AOf-00069b-Uu; Fri, 27 Mar 2026 12:50:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w6AOd-00067l-DO
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 12:50:56 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w6AOb-0005Eh-3V
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 12:50:55 -0400
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-c763c294cccso1611048a12.1
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 09:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774630252; x=1775235052; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OGa6TMkmYmwI7/7vLSYxk6iKMksC7GlEB26vrLcMz2w=;
 b=NLyadloic6PCp8ebOG/J7vzhwD3BwgQ2QtLN5rJCdNF0oEvBu3FhvR1X+FlAvd8ofo
 SkOKDDBUKaoXpENKxQALvqIbYWlx8wHDKyUkoBIOO/ektM1YpvXr5bBItu1O+tnEvr47
 8ZA+cpIgDPuN2HURSKdE2bQNPOudAS9Vrd+cFOTHzBmh7r4STsY9YqB0MoqtrJbnkTFg
 ZhjTxr9+BAn6XqOUhDW/KXO+282LoKl1rMWqI3XGrtt6LPkBg6fO7poei7LVwp+dCAGa
 HWr35J1RDDtT/ZpGstgK/SBJUG1m5bBgSMWjE0AWDDJcYYZtFMrdcxwf+NeILqxBUnlY
 3NJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774630252; x=1775235052;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OGa6TMkmYmwI7/7vLSYxk6iKMksC7GlEB26vrLcMz2w=;
 b=BzzxMQE+UkfRLVnv+tsVtTSgU3rUAM3PX+Wi+wQfxW5YnTF/nXV6kMZP1wYVPYWTaj
 OVzOl8OZuHBqFK8j2lv2Ew4+cl0y/3Ws+ypUNFvmBaTjDNaGcgRBfa9W4rnQz8qybUlI
 JXyWbta3Pi3UQe+XgJMzcnPESHonfQLlWAHWYKwtjotQuwJyMm1HijR8boh7JD0q/uVR
 LLtpxurIxT37eLHmg0OTKVlTbBMo3tdOIdAQvyEQRRlS3d2h5eewGOOdtZgsPkjv5TOD
 Q1SUcPf02S9fXhzm5ClykyzsxsxER0tiMbSXM/wrRMUa2iGBvM34mOfpY7YGISbhY9Go
 L6Bw==
X-Gm-Message-State: AOJu0Yw9u9gQRg79V9oaYdtT26ekxtYjVH0tSD3TxFjmQDdf8w49qLLk
 nwtLcy+ANDYx4JC/a6LYmMu87rFCAVHt6kQn9XUEKSZ86GDQPKwQ7zXN66Piqiayt1I=
X-Gm-Gg: ATEYQzwBc7YzNStJ6e7Svle6PW+2RhoaewqPtCfKrZau393TO4d9ZyghiNtIWZ4GcRl
 /qstLKvvFWI+uF/5RGTo0L9bDMbTPU3UAIUg+3PiUJM4JbHKWiVTELnf3x+Wpxkhn0ybf5hBxBO
 SgRy0rrtYxoDUjo/xzaIVJlj2EW0/st9ccsFtZ59OiDMP3DkfXbyk4cwp5gLtjkqJpMy9xGs0Q8
 vRk2j82DIupOECocPp25PMx/AtZKQrRavzpzzoEeiO4q5VwXLtv6fWUEH403zo0fimdpun5kWC/
 N2D0w2OsR9SQuiyCka1H6FotE6sDo5AS4SeJZdkqSLjGzJWgSgM/d1tlA1xjRbWC0ek4g13bQXv
 z6pWZrCb+qHEx7jq5rKIvgFZJY8NW8w4hdd4LExxgZKXzEkM6yDSrvDc1VnPuLhopaBU61JNwoO
 tH5vBZm7ta0IUDQBXlTd82MuCO39o325NmOwcnmJf/c7RpEfpMq8vP2+mT814A/VNzNz2NBod9f
 Kun
X-Received: by 2002:a05:6a21:998a:b0:39c:1f90:284e with SMTP id
 adf61e73a8af0-39c87c283ccmr3652110637.53.1774630251532; 
 Fri, 27 Mar 2026 09:50:51 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c767399e0casm5514038a12.31.2026.03.27.09.50.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 09:50:51 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, philmd@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, jim.macarthur@linaro.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 04/12] target/arm/tcg/translate.h: remove TARGET_AARCH64
Date: Fri, 27 Mar 2026 09:50:34 -0700
Message-ID: <20260327165042.604105-5-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327165042.604105-1-pierrick.bouvier@linaro.org>
References: <20260327165042.604105-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x536.google.com
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


