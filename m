Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23EC2F46C45
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Apr 2026 15:08:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w9lVY-0002wQ-5v; Mon, 06 Apr 2026 11:04:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9lVS-0002tZ-N5
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 11:04:51 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9lVQ-0003qj-3j
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 11:04:50 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2ab46931cf1so33226145ad.0
 for <qemu-arm@nongnu.org>; Mon, 06 Apr 2026 08:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775487887; x=1776092687; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BpjBN/H+zc8vKXTIC1giYotC0A5eWy62SJygmBUlOkI=;
 b=dI63pOJagXq5djUcRyMXxIbsJ/tDaE2YVI2ZBzp8YlikhSpHZSmt74SmTf9kO6RORR
 me6PLlIE/WPvM7acdEwJvmmdT0H4GGB9EihCGewsSbjOFviO/0rnnPDHRx4t5e9eYLhF
 8pzXKa0ocRW2fKruQYrQPEdc0dSgnaBUyAOjAclqe2Balmn19pBcY+bj21gGlmGc4rh6
 KfUcI/OqTzf9Dwh1xKohCAea0TcIe6klYs80upXWhY7xM5Ff4qceMNhZVgXs0jFVPH8J
 2ZWvlIPxsGmPZzBRaE60Bhzj3HGMBwZM84GaVk6gxB1o42hZ/t5k793VkDQYSp1CngfN
 bs6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775487887; x=1776092687;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BpjBN/H+zc8vKXTIC1giYotC0A5eWy62SJygmBUlOkI=;
 b=rh2Fisx6RudzYPReKoTmgugz7qMdSQFDpau8IYAV57VEOVdN+8OG7CHwDRzULFtJTB
 ZIz9ltrag14QRuiUC9i/SFOB+vnzy7F9x9aefM4AvK/t1I2evZp6HOW5Y+AHx38ahS3z
 nSiBcTfIqQJs7ByBv6x776v6IjKw+euhFZBwpfZCUL+0M0I119zsx0As2IZ9QeGCCQat
 zwn3c1Ly9zUq/MeSWhKE163TIriYOuQC9yA989eSoBHkliuy+TJ6TbubCf9ccjcSu/zG
 rgT4et0kFlc6xy3LwvjGQRecaChuPuzLyxhleesCvJ/GlEg+Qk4Nj6joxVghkRj7Y5hb
 eXeg==
X-Gm-Message-State: AOJu0YxaTyhEy079jnCaQMGmwsLyKM+ocCjlKATZwnyPu7ystrbfkPDh
 rtyxtLAI0V3yIzyILANWU4zToxiK93Tt63tJXqaOJYImc7zLzV60MV4HNaDVTpRnKv9Kz9QC1xn
 w7NabkcZUcQ==
X-Gm-Gg: AeBDietWHSioaad+OhlB+wcY5PhC28t9ZKUAlKZYTU7ioDdQqSrTRlvDm7C/jxVsZAM
 TCn/UwI8AwFnykTlQ9u3F4/VW5On5qFQIyeR2f8D8hN/rPnNfJyAXzbEkp2vF7Nuvlbmeks7XSV
 ALqayesIZS6V5R+cOmXDJ4yuoGL8xN5wYxeCK78QdrrQaIotpWRhEwQK0r73nwg4rzXvU7yU2xy
 3vD6CNU5Gh0Uzmn3YT1DCY/WmlywJQO5wnMNqQThHmT3nLR1ESnDFdSNXgNFs5zd2wfgxUWeB9b
 +5pFQx+fUMwcOXkoKcp+/5cXIxVyuqMrLNCvaEXnbuTohTgxhQfz3+KIuXy06KDgMyws6TJ+nah
 yu3v7LRUUy8YSpzpwsh7EGteuHy4iN0PxLvEwDUPFWCI+EZglNQ+R075b1y1NB37sjM99YoHF6z
 ziY8e7Lib2BML4EolX7q/PqcY20+lcI/aZVCHLt5/vJ9REEKtRInYxnxy8RRcgUNADKgbFgHB93
 9E1
X-Received: by 2002:a17:903:32c3:b0:2ae:5350:3a4e with SMTP id
 d9443c01a7336-2b2821ca1e7mr111285575ad.21.1775487886612; 
 Mon, 06 Apr 2026 08:04:46 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b274979d72sm137770075ad.51.2026.04.06.08.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2026 08:04:46 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 jim.macarthur@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v7 04/14] target/arm/tcg/translate.h: remove TARGET_AARCH64
Date: Mon,  6 Apr 2026 08:04:24 -0700
Message-ID: <20260406150434.407201-5-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260406150434.407201-1-pierrick.bouvier@linaro.org>
References: <20260406150434.407201-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62f.google.com
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


