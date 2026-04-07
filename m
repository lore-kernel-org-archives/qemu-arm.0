Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A694FB5180
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Apr 2026 02:32:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w9wAg-0007Uy-Mo; Mon, 06 Apr 2026 22:28:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9wAf-0007Ue-Qt
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 22:28:05 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9wAd-0006wp-Kv
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 22:28:05 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2addb31945aso33036265ad.1
 for <qemu-arm@nongnu.org>; Mon, 06 Apr 2026 19:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775528880; x=1776133680; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BpjBN/H+zc8vKXTIC1giYotC0A5eWy62SJygmBUlOkI=;
 b=n5xHA50K9RSXYiCmnK/5bu35ek45XxylVITd7NOsV7r+wks7vq01kaCfn5abTo5svR
 UThUqFk3s572SRRH0a0g6vRSSDpV+5wgd9hFvDSkg+Jy1RBzkG1IL4AIMMWSuzWfVezX
 1i2plfcM8Nl/D9+gdbKJkDPmGejjZwgEAgQTZysRkjWQ5nwJsiGz+6aJYcQiLPaiS9SX
 A8FF7uyShaHOJ4lwbqO6J4ByCCTKLG7AGsRG5V10Keienyj2nJ+lzeHEbDaUesNMsepB
 TlHnJkTHyfwz8EEU+81clq0mMae0gM0Zt1m+kxX/qcO+cS0xSk4ZB/stvT/2oNEG6f0L
 w5Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775528880; x=1776133680;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BpjBN/H+zc8vKXTIC1giYotC0A5eWy62SJygmBUlOkI=;
 b=YRUEllWo1me5LVrigK4gxl8IqT3sEQIZwAsTgKha6U31EqMUp/5xWmzW8gQ12Zs9rf
 JzhU077xhzpjjcptgy6M02Xg74jMGeYmu3FpknrpM64Rnm0zDGugnzFSzpC/VreUKWnX
 On4VW1WbcHoXl7oiMqZfmYtNH9cxcU+iDMeHKEVmEApu/kJv3x+6Qb6qo+s3cHa8B61I
 9s7w6JmrcQv2MeofCm9o3Dj1Uv8vPNNpPkni7F+bdzzh5LulIcYBcsTnw7It5sJX2DW1
 pwA16+h6Enku2WhXIsvg+43X0itmWMgGJjOMtWmSpuUZuW9V1oXEZFhd8e48qT8ZrHDp
 qDgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWV9CgKPhjwlc+Q4TDAt9e3v0x/0AV57uyP6znQp10py7gsYjo2OeODUSTEWq6619uqB8vw1ies0Q==@nongnu.org
X-Gm-Message-State: AOJu0YzIfSjxq0i5Vq4B1Hwme+5aTSTLkfvXs34fRCGW89K1CD/hXyD5
 NVZLurNCaxMMrXtqFa0lN3EUhFiwTcSLrmuFxwJm73o/R0BxZ883TV5tCz8WYsbxLEE=
X-Gm-Gg: AeBDietfha7gXX4aGQgiHxuCkCgrPWAe3+AfMXLoPWcQDQ6yktre6YgRIx61QQrZ5IA
 LJ2tuUG5NXRwprera1dMlqHjdBJygHxW/eo3BOybu8mpKIVPQzteYm4E6l80uizL1UrNMYchbg4
 4BLbdeDhQRqM4bmoCzuYlp2Vx7nJ2Ebl87KNeI67jiqeCeNZ4+xrJSk7+HRKa/NjCvMeJ/cQJxk
 TvOeI2jegTT/zNbB+gXShBLM4vxu+vlBnYYD3hyURHD43HOY2uRK1Lw/I7eKzsg4IxMON4BTyqe
 YfUz3oyjUDGn+PCsvMiwee9XlCGsV6fduxTRxwo/PlHlZve3aIwNYDlaApJ39rTDmcq36SFrXhP
 a4RLg8oxlMlPWRvV5S0JIpbb3gDGZIluEwH8XiHNufkxR1qXo6qSxXsRDHux0taDXcFr4bNXFds
 wzp7UcWOSrlf6F0XHF5KjxuVdz3gvM1un0VytdSHBjDe7YwxFtX30U7qvhCsSi9mxjPFsHuQH3i
 wycFHOIWzrzdn0=
X-Received: by 2002:a17:903:9ce:b0:2b0:54dc:63e with SMTP id
 d9443c01a7336-2b28193257amr158742665ad.33.1775528880064; 
 Mon, 06 Apr 2026 19:28:00 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b2749794e8sm161423685ad.53.2026.04.06.19.27.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2026 19:27:59 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, jim.macarthur@linaro.org,
 qemu-arm@nongnu.org
Subject: [PATCH v9 04/20] target/arm/tcg/translate.h: remove TARGET_AARCH64
Date: Mon,  6 Apr 2026 19:27:32 -0700
Message-ID: <20260407022748.57629-5-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407022748.57629-1-pierrick.bouvier@linaro.org>
References: <20260407022748.57629-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x631.google.com
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


