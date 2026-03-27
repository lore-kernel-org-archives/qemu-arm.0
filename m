Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA5C10F2855
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 16:52:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w6AOg-0006AA-MQ; Fri, 27 Mar 2026 12:50:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w6AOc-00066q-Cm
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 12:50:54 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w6AOZ-0005Ds-7B
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 12:50:53 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-829b8b6c4d0so2098494b3a.0
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 09:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774630250; x=1775235050; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jE9dWySPWaDpusKqPLgrQj/rUnbESAV94dTG6aMNmPU=;
 b=Shu0yy2VDbebNn5hz/N/qZzJ81ygE+2ezWead4QR6JyMndL/A1WUfSkU6Xkvz3Xd8e
 92F9eFJVYpHbPZXvflJ0rJOieiUxrJ09S1mHsKx3A2nAvQsTFjw38z4+xVLIujRoX1lr
 5vOwmKO2pGM34XpvVrQXkpvXFsB8oBqi/lTkj50chJ8Y+SX/XtO3fBylrjCNjL18nyav
 XDmHBbLhr7QKQLPh7omzLL8kw86agg97XJA7u4+lCx6HYsJUuRlxjpQXoRIkJxP4HfJj
 wb9uozg7uUVdDQfFKagqEjvOwCV9K4kjT7te9tfrS8LfG8jgXWAm1eolmDpy+iF2jWsX
 9N7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774630250; x=1775235050;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jE9dWySPWaDpusKqPLgrQj/rUnbESAV94dTG6aMNmPU=;
 b=cIt+NUh1qfwWAvqPIfWcNSknMoS9htlwxchovyr81CegCb6U9Nyeo6rOwG3o4AGYqk
 qWyM3MehMC39RqdRsaZcuwx16gri117g1qkDRV5Wbd9xbpA/QDR2Q6BFVXlJEtZHF9Z2
 gO1+iAndC7vrb9nntS7cxrvasJ8TjF0VqH5b02686eVOOxdvX/aIioc2OJcq/ePy8ejN
 hBMG+DAzstzw0pYWrxj9z2S+17o6u8rn/WiuhtvzhmDLpKaPXrqqk8NPFfaB7WS+r4J6
 fHCi69W3g+gzR+kL55Og/4Xuk1ii/aMYqhnOP/IlUzVb7Ov6vy/a52EoI9CFA1tYrawz
 P3oQ==
X-Gm-Message-State: AOJu0Yy/wZoIObqN/GMnBH3RcWVWKKCXc4fUzl9Ksk/CN1svagYuggoG
 ZEsR1hYqzymRGxJQ/Q2KifI6FetSTrMUBs1yvBlZsteX0x8vsh+Lp+bT9+EbNFuI34M=
X-Gm-Gg: ATEYQzwFS+sa6V685vs5Ds9MRFgCpbGvoYzW/Udzx+iEOXZRMmgaPVxHJp4ZCEMPjV6
 37v1ySkF3qXbAIurJTN8kIqwh8JoBKlryE9uVHUtDrNCMf99R4aIdVYkzajU2Qf9uVzclU9zJxs
 nCApZPhSeiUXDUnDufxgT8Gbsd0qr/7ORO75ASHGUu4lDEnkbgevlSolWfftZK++nle2nwFdhlx
 v8xrLB3MNGs9XPcAugl4Tca3H7437kC70+KcvKQw3JJcVZgOBYltz8G6eDzmDEm9Jy/LshudmXB
 zz4uRZKAg0rJvL+g2ObAknxRerzKBcWxexCPn1a/SwDdcB0vhVorVrwpnFSi0h3jxiRhpNh+yyV
 5oxBAKYwiIY3b8sTGFmbFKmDY/AKwTkzX5CaTaFTV3LZjVMEThpVzcCjbLRg/K2s4TDES6kaubg
 9SMkeVftgL8CsEEc8cwQmed7yJUaRKV/QCMYMg9zc0ro7sb5WtPzGi83S1C377kWmWWIpF41m4W
 b2P
X-Received: by 2002:a05:6a20:431d:b0:39b:ff0b:8ae0 with SMTP id
 adf61e73a8af0-39c878ecc30mr3686012637.28.1774630249694; 
 Fri, 27 Mar 2026 09:50:49 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c767399e0casm5514038a12.31.2026.03.27.09.50.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 09:50:49 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, philmd@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, jim.macarthur@linaro.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 02/12] target/arm/translate.h: remove tcg-op.h include
Date: Fri, 27 Mar 2026 09:50:32 -0700
Message-ID: <20260327165042.604105-3-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327165042.604105-1-pierrick.bouvier@linaro.org>
References: <20260327165042.604105-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x429.google.com
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

Include tcg-op-common.h instead, and include target specific tcg-op.h in
files needing it. This intermediate step allows to clean up every file
(TCGv, tcg_gen.*_tl.*) in separate commits.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/translate.h     | 2 +-
 target/arm/tcg/translate-a64.c | 1 +
 target/arm/tcg/translate-sme.c | 1 +
 target/arm/tcg/translate-sve.c | 1 +
 target/arm/tcg/translate.c     | 1 +
 5 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index 3e3094a463e..6d52606f9b7 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -2,7 +2,7 @@
 #define TARGET_ARM_TRANSLATE_H
 
 #include "cpu.h"
-#include "tcg/tcg-op.h"
+#include "tcg/tcg-op-common.h"
 #include "tcg/tcg-op-gvec.h"
 #include "exec/translator.h"
 #include "exec/translation-block.h"
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 5d261a5e32b..35ad7530c4b 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -23,6 +23,7 @@
 #include "helper-sve.h"
 #include "translate.h"
 #include "translate-a64.h"
+#include "tcg/tcg-op.h"
 #include "qemu/log.h"
 #include "arm_ldst.h"
 #include "semihosting/semihost.h"
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 7d25ac5a51f..08254b088ed 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -23,6 +23,7 @@
 #include "helper-sve.h"
 #include "translate.h"
 #include "translate-a64.h"
+#include "tcg/tcg-op.h"
 
 /*
  * Include the generated decoder.
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 5bace3fda1a..aa7d72a35ef 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -23,6 +23,7 @@
 #include "helper-sve.h"
 #include "translate.h"
 #include "translate-a64.h"
+#include "tcg/tcg-op.h"
 #include "fpu/softfloat.h"
 
 
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index f9d1b8897d2..56ef1e0eb59 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -22,6 +22,7 @@
 
 #include "translate.h"
 #include "translate-a32.h"
+#include "tcg/tcg-op.h"
 #include "qemu/log.h"
 #include "arm_ldst.h"
 #include "semihosting/semihost.h"
-- 
2.47.3


