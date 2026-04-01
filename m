Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A981E10FCACC
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Apr 2026 19:23:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w8185-0006fS-Fw; Wed, 01 Apr 2026 15:21:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w817t-0006Uv-QE
 for qemu-arm@nongnu.org; Wed, 01 Apr 2026 15:21:20 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w817m-0002zA-9p
 for qemu-arm@nongnu.org; Wed, 01 Apr 2026 15:21:13 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-35da1af3e10so47509a91.3
 for <qemu-arm@nongnu.org>; Wed, 01 Apr 2026 12:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775071268; x=1775676068; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BpjBN/H+zc8vKXTIC1giYotC0A5eWy62SJygmBUlOkI=;
 b=P4MUwBpSRXqj8y8v1dldHoq+Sqr3rbIEK7Nx6LZG4CUmNmTDVw7gcPyc4681GK5sLj
 3CAGyOafon/m6m2brTPsX79m9fOpfOMAcuEAtRCL+45RO6NfwyXuN4JduDpBHxzXYmzX
 bbWku0n7rjmypQB6QuUMn2+jELGuDmfnPY6YfueLfNsRrJRBOL+N+7RJa58qb7Qxm2cB
 vHD5wAA9m28N0cJISuXqO8B+gRqgQCH6JffKjbRgKLEJoidsGLC/TjpQNExx4ng4ekVT
 Qmi8K2V0YOqI1fdH0ob/O3QV5j85otHqROWFNwpZygJUTdE593PmiibXowqpfAlZUCWi
 DBUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775071268; x=1775676068;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BpjBN/H+zc8vKXTIC1giYotC0A5eWy62SJygmBUlOkI=;
 b=Or2sEvuwtJ71UTI2KkQ/uZKfH/Oi3/TI9I5KU1+IuEWuUwlNnLe+wewz52sDF5S+Mv
 +nGn4XQATsw/z3hPj86/LdyceeEl9585khpDMjSciFc6NaZ01pYJSvNEGGziXcJ+QeFJ
 VMSk0uznsWiR1a2rwDAjYcc3ZPl0Fml4MzAvswQjkQggiEaAavW7bJABeOEJkanOLuwJ
 pNjl6/RDhbQuiBenjAfTu4hq5eMBOxADa8WiO8QTy735pg961JNT78yKQORuqniUK4fk
 L91TzISmp0M05ga7oRuSVHk2JYDU8CMVfPeVbMUsgDhJ7BJXRfS2UhN+tAY6mnJkXsQ4
 dQmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwPZ4MV7OYxdDRcTSZY/d9N8HN4rm//iVAaM8v2INachjB4kOhaTN40sQImWU2fCgYJOVEH3d+DQ==@nongnu.org
X-Gm-Message-State: AOJu0YzLyk/fHh7hTm070h9MignscyS3Aw1HKPxxv8kgb4QuxVb2bv+O
 lXfLElI/p2JTNGM7fE9u3RyKEOdblGId+jVW+FKWBf2NEjRYyyvmJ5Hn11Lql9SNyoQ=
X-Gm-Gg: ATEYQzzmmWysaHpFezUgdTCUyaogKHhi+BgXhV7Vf+iWWMvM3JkXnljVvlV5kCfU2GC
 LugKL8mBf7urp69hjyw4KrZjlV4s5Duf2a6+7+jcpKwrQXYYHqVSBWTlKC0wVw2rshr/slqtP0y
 lXZC6BEWwEH2g5ymq/5i/JUjQfpzQVeMEkboSptaig9PAcLHbV6eT8L7XBVc0wqhqCnDl9V1hOA
 MnojJxOVWBE8SB06aBjHmEc/GBeyRUM3qF7JTs8goCERSza1Mhob5FaKxPoOruDUve7b60tnLQe
 P1V/gK+p7d0/hCC43NuqOKbOdJAVBwZj8dcJRXk9hLcZ+RPHGHLYiWR8czs6U19PqurS6aRrdJb
 PQnIoWolvmF5EZbibRX+7Z6Q/hJQ/AJTXcOKWlFNsHmcaxzYLlrVCA/5/LEh8fQmNyxvpoRiEXB
 NjOuSyvzRHbdlUbFq88EHYaevsHkD3yRpmFZEW2bun2jkB6ci6aiW4ybV1thlDnx/gX0eUvhetq
 4xP
X-Received: by 2002:a17:90b:2d8b:b0:35c:30a8:31f with SMTP id
 98e67ed59e1d1-35dc6e7ab92mr4887381a91.2.1775071267787; 
 Wed, 01 Apr 2026 12:21:07 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35dbe41b11fsm5633113a91.0.2026.04.01.12.21.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Apr 2026 12:21:07 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 jim.macarthur@linaro.org, Richard Henderson <richard.henderson@linaro.org>,
 philmd@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 04/12] target/arm/tcg/translate.h: remove TARGET_AARCH64
Date: Wed,  1 Apr 2026 12:20:49 -0700
Message-ID: <20260401192057.1182724-5-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260401192057.1182724-1-pierrick.bouvier@linaro.org>
References: <20260401192057.1182724-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1030.google.com
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


