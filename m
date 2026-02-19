Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9648AE9A03B
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Feb 2026 04:04:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vsvF7-0008Oh-18; Wed, 18 Feb 2026 23:02:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vsvF5-0008NP-JX
 for qemu-arm@nongnu.org; Wed, 18 Feb 2026 23:02:19 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vsvF1-0001Df-Ct
 for qemu-arm@nongnu.org; Wed, 18 Feb 2026 23:02:19 -0500
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2a7bced39cfso5087555ad.1
 for <qemu-arm@nongnu.org>; Wed, 18 Feb 2026 20:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771473734; x=1772078534; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H0/6jyx5lBSzvidGPzp44soUpJA5ox0vbl/G+VGissc=;
 b=ENUfSap/wOBmp9hibQ1Uw9KjVT1BNAW8ZCpaokYkQb2UHErawr40cI8UaQ6KlhIacG
 rvrnxlesmZr/0LIUSFrelsUsxITV1yFz5CwFvW/jrH7YJACzONpp5FXJjcf4LTAOonLk
 vexVXnXd413CYCVl61ijagE/U5jp2omoGggCIDxTiCZCvVzeHu2KK2CILTN9EyiV9M0/
 iN2TdAHr2To8UtAU/tjLGfsyEQH/Ujwf6IfxPSde5j+roDXwu0sCHt+Wrtlf5K3nHtzf
 ddBuJW9GihD6Rlb41JAsRWCTDyiiMtrRVG+C7ACAfa8kvz5NNlgs/rwStFMS90cFcQXD
 GwtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771473734; x=1772078534;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=H0/6jyx5lBSzvidGPzp44soUpJA5ox0vbl/G+VGissc=;
 b=KjI6Ark+lykXwcyAow84JNZ7grMfmL48WzOXSoKzpEtFiBwSm7vObR7wZj8oPhWYwK
 AecHpajzdJQ/KiXGSs2Af/mHa/RB0RCcoDaq6KSjsDAliQlfE3qHQgt8WYJNBQx0b65B
 Aa8FiPTeqW/wCMd1Ks0KFB/3Ms/cSd6wKhbgFzPKteFCKZVKvASP5j9D1SnE+fN8co3+
 8nhzIUrT2U43yC0gmHueo54NcgAGkfhhsf8XCH+K3gZu0yB4qTfMt1bkmlGy/jXC15t4
 SnLu1tM6ccelZTZyKSqmRLeue5v7qC39TEUviRBS+CWi3VBUSNhWFmrbkW+v4G+fb/5c
 KIag==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzurJ8jtBbQqTKEfq6YfmmhQMpc0mMqseNAiex+wnNK8MKJuwek/V1o5Z/k3nYRvfk3jk7Q8BR/A==@nongnu.org
X-Gm-Message-State: AOJu0Yxmi6TmgM53ElE4YDsZbwSYNUwIHAajdqNRg5ziZ+OhAGzkDLqY
 WS3f9ly/esoii8s8oyHeEq6+GAkCd0Y7c7ipnFA2UEIVNCadqiE2tpKeThgNvXs8Q14=
X-Gm-Gg: AZuq6aKuOnRcOyagn+2FWmn33L3VBjNiWm9y+F+p+p8vsP7PNSCxrFHRbpqSOVKiQfU
 C3aanvFcA23x0pf9jPmkPtuJSngTUOToYKfRVo6ap88r6LUCjLUc0tlrz9wAmCXDlAX5ukwdh13
 sNk7yTeEDruvbWdapQWqCtjc/R31f/ji83qd4058xb774j1J5YU9nqFL0+JGmClMnNERpOxo9Zy
 J9VkrzKgvt10lgrocmt1F5Ij2BZ6L+oGHg0TpGfoo5IXRJcXcRJY5xoUgRw0EgGrIeM7xI4klnX
 Wf8ZMeLt+HDi0XM4nBIES1XCYzysB9pDinwaw3wac//cpkiJ0CNbBbFUq6aKA/LysMXlUS0eL2M
 MzUYeCws54ftesvfzVm+EwI/lNBsM6NyF+6ONVykHhIsxmWi4MRD63zg/+nvIX9SESMHJj+NTKI
 Q88gJpiozIkzW68nIvWFLlNrjMj9ba7SSRxHgARTBRk+g49KWaeppA6xAdR49vQ+9+IVeLbooLk
 RZx
X-Received: by 2002:a17:902:d48c:b0:2aa:e6c8:2c73 with SMTP id
 d9443c01a7336-2ad50f33f69mr42566625ad.37.1771473733869; 
 Wed, 18 Feb 2026 20:02:13 -0800 (PST)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad1a73200asm147636225ad.36.2026.02.18.20.02.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Feb 2026 20:02:13 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, anjo@rev.ng,
 Peter Maydell <peter.maydell@linaro.org>,
 Jim MacArthur <jim.macarthur@linaro.org>
Subject: [PATCH v4 05/14] target/arm: extract helper-sve.h from helper.h
Date: Wed, 18 Feb 2026 20:01:41 -0800
Message-ID: <20260219040150.2098396-6-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260219040150.2098396-1-pierrick.bouvier@linaro.org>
References: <20260219040150.2098396-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62a.google.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/helper-sve.h                            | 14 ++++++++++++++
 target/arm/helper.h                                |  1 -
 target/arm/tcg/{helper-sve.h => helper-sve-defs.h} |  0
 target/arm/tcg/gengvec64.c                         |  3 ++-
 target/arm/tcg/sve_helper.c                        |  3 +++
 target/arm/tcg/translate-a64.c                     |  1 +
 target/arm/tcg/translate-sme.c                     |  2 ++
 target/arm/tcg/translate-sve.c                     |  2 ++
 target/arm/tcg/vec_helper.c                        |  1 +
 9 files changed, 25 insertions(+), 2 deletions(-)
 create mode 100644 target/arm/helper-sve.h
 rename target/arm/tcg/{helper-sve.h => helper-sve-defs.h} (100%)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
new file mode 100644
index 00000000000..ae4f46c70a0
--- /dev/null
+++ b/target/arm/helper-sve.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#ifndef HELPER_SVE_H
+#define HELPER_SVE_H
+
+#include "exec/helper-proto-common.h"
+#include "exec/helper-gen-common.h"
+
+#define HELPER_H "tcg/helper-sve-defs.h"
+#include "exec/helper-proto.h.inc"
+#include "exec/helper-gen.h.inc"
+#undef HELPER_H
+
+#endif /* HELPER_SVE_H */
diff --git a/target/arm/helper.h b/target/arm/helper.h
index 79f8de1e169..2f724643d39 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -3,6 +3,5 @@
 #include "tcg/helper.h"
 
 #ifdef TARGET_AARCH64
-#include "tcg/helper-sve.h"
 #include "tcg/helper-sme.h"
 #endif
diff --git a/target/arm/tcg/helper-sve.h b/target/arm/tcg/helper-sve-defs.h
similarity index 100%
rename from target/arm/tcg/helper-sve.h
rename to target/arm/tcg/helper-sve-defs.h
diff --git a/target/arm/tcg/gengvec64.c b/target/arm/tcg/gengvec64.c
index c425d2b1490..c7bdd1ea82f 100644
--- a/target/arm/tcg/gengvec64.c
+++ b/target/arm/tcg/gengvec64.c
@@ -18,10 +18,11 @@
  */
 
 #include "qemu/osdep.h"
+#include "cpu.h"
+#include "helper-sve.h"
 #include "translate.h"
 #include "translate-a64.h"
 
-
 static void gen_rax1_i64(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m)
 {
     tcg_gen_rotli_i64(d, m, 1);
diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index 0600eea47c7..16e528e41a6 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -25,6 +25,7 @@
 #include "exec/target_page.h"
 #include "exec/tlb-flags.h"
 #include "helper-a64.h"
+#include "helper-sve.h"
 #include "tcg/tcg-gvec-desc.h"
 #include "fpu/softfloat.h"
 #include "tcg/tcg.h"
@@ -38,6 +39,8 @@
 #include "user/page-protection.h"
 #endif
 
+#define HELPER_H "tcg/helper-sve-defs.h"
+#include "exec/helper-info.c.inc"
 
 /* Return a value for NZCV as per the ARM PredTest pseudofunction.
  *
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 1a54337b6a8..31fb2ea9cc3 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -19,6 +19,7 @@
 #include "qemu/osdep.h"
 #include "exec/target_page.h"
 #include "helper-a64.h"
+#include "helper-sve.h"
 #include "translate.h"
 #include "translate-a64.h"
 #include "qemu/log.h"
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 091c56da4f4..463ece97ab8 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -18,6 +18,8 @@
  */
 
 #include "qemu/osdep.h"
+#include "cpu.h"
+#include "helper-sve.h"
 #include "translate.h"
 #include "translate-a64.h"
 
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 64adb5c1ce3..c68a44aff8c 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -18,6 +18,8 @@
  */
 
 #include "qemu/osdep.h"
+#include "cpu.h"
+#include "helper-sve.h"
 #include "translate.h"
 #include "translate-a64.h"
 #include "fpu/softfloat.h"
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index 7451a283efa..bc64c8ff374 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -21,6 +21,7 @@
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "helper-a64.h"
+#include "helper-sve.h"
 #include "tcg/tcg-gvec-desc.h"
 #include "fpu/softfloat.h"
 #include "qemu/int128.h"
-- 
2.47.3


