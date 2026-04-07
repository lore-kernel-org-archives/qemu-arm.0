Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3925FF5136
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Apr 2026 20:01:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wACaM-000436-Iw; Tue, 07 Apr 2026 15:59:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wACaH-0003y6-CN
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 15:59:37 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wACaF-0007JK-Nm
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 15:59:37 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-358e3cc5e7eso2679627a91.0
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2026 12:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775591974; x=1776196774; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BpjBN/H+zc8vKXTIC1giYotC0A5eWy62SJygmBUlOkI=;
 b=nNapWmkHYA9gcMW77wSnA4XxFyzJsPTAYy5VlLeTf+Ol3CY49aebZejiVvwsCj87qW
 zFp3U8pBB150yRtnFzv+r4BfX6BJ+zhrLerMveob1NoBSAp2oQMr+DlHdHG915GP50aa
 3g+13+uc1W00dSESrzeWfmgmPsWc7Y+FuUHd+rzRtanAs4Jh/zjdHZVkpW35dJHDPsG/
 eiNfuOqRCAe/+OyN+uQ9ln8i8DrwZ3pcqo0ab6ttP8R6dJynMVq+LDYxf7O9Kys7qClE
 0vzJLBgyc96PcB6ptYCEkP7bwnx/pHBapWAaTkxfP6n+OedSN6GWruDTnrpYMK1jiwjT
 Iilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775591974; x=1776196774;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BpjBN/H+zc8vKXTIC1giYotC0A5eWy62SJygmBUlOkI=;
 b=pYnuUS0hSpzk0WlCG6yc6Nz76ys0DVBrd+9Om2xDl6MhUa3MuccKqajIsrQ/AknJDX
 GzkzXvVfFeCwQ0HGJvH0gz+VuxS5tZGyK+POLETL/th4VhNFOrjU9vq4gHoNBxZbYz3S
 yziXYZCslBTh/Rf6t0+TwEDeiEdNyl/pHAadKUdxtQW0JqHSukT/0IpWd1kcMoE7ueiI
 EkyABgTV7UVTtkYinvfpG8TnTKeie0BluRsVHSkNlrIouvedghaj8uWHkbnekt5HWtzo
 Ktu4SnNhzyjxb4Qmi+Jux5st/IXz/fvJBWjFJuxx4QhYeXLG58habF+0lvJQxbZZypwR
 d0GQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtoZLAPL7Z+2S0RcoGinU9cAdGvguJMg5EJDpboFaU94NeMiX53EJ7EpSiunF6pi4I82BXYyKn7Q==@nongnu.org
X-Gm-Message-State: AOJu0Yyftw779NxwaX9/dLzPefnHTEOMhLNWPhWaftE372wn6cumXYZ5
 1nIxnEVCg1SZrYieQU8tdPHp20DBQ4hKCjC7sPsIQTQb24yc3GooUnT6vMDPvsQ0Qzk=
X-Gm-Gg: AeBDieu5bkRDIF2GmR3q7/ACr9JnNhgT0UAtcumporehahHt84rbdONQmXqdJrCpiAX
 ymp5hL4nG/qlgRLQ74zKff5PmLR987ctVesqybOkFcbBDwGitdQzyJ7389AO4KAzKW+SvQSBASe
 fSckmMOHhfYTex740pPSP3hXHgQcH5y1UEMrIkWoCiptnOW5eQDv0abgDXC6oUhGTcNL1H8qRrp
 x6H8sYFKQtC+vosHoNYMfHcmbF1yc99gMWS7TS2XIdGghTz2cbba0vetKXg5Gm7WV9NcxFUk89t
 +AhZATxSn0ZFpuKdZ6dwgV4Z7BNKT7+rAhFQrw70gT0e09HnVkg0xsTw+N3RWnyCYhe1nUfXkJz
 dkhWQhoHPqnuZFmSe2mo0AZWI71Gfu32bG5kALWSvns68TDye7rQL12B5DApQmejF5XqTT9RsEB
 wDQnpFdwDPnYutS4urYhNp9XenUrSbSBVWrUzdcJ7rAwHCM1C06YMBqEtLlS+D9oQfU27shAA0F
 H3k
X-Received: by 2002:a17:90b:2b4d:b0:35b:a8cf:7969 with SMTP id
 98e67ed59e1d1-35de687180emr17904131a91.11.1775591974131; 
 Tue, 07 Apr 2026 12:59:34 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35e27c9855csm126911a91.3.2026.04.07.12.59.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2026 12:59:33 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, jim.macarthur@linaro.org,
 Richard Henderson <richard.henderson@linaro.org>, philmd@linaro.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v10 04/21] target/arm/tcg/translate.h: remove TARGET_AARCH64
Date: Tue,  7 Apr 2026 12:59:05 -0700
Message-ID: <20260407195922.196410-5-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407195922.196410-1-pierrick.bouvier@linaro.org>
References: <20260407195922.196410-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1035.google.com
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

We need to stub a64_translate_init and gen_a64_update_pc.
At this point, we don't need to do anything for aarch64_translator_ops
since it's just an external symbol.

We can now include target/arm/tcg/translate.h from common code, since
all target specific bits have been removed, or can be specialized with
specific defines.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


