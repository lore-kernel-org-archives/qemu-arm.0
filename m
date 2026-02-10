Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15618EB2700
	for <qemu-arm@archiver.kernel.org>; Tue, 10 Feb 2026 20:16:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vpu9a-0008Bl-5D; Tue, 10 Feb 2026 15:16:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vpu9H-0007er-Rh
 for qemu-arm@nongnu.org; Tue, 10 Feb 2026 15:15:51 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vpu9F-00089U-Hl
 for qemu-arm@nongnu.org; Tue, 10 Feb 2026 15:15:51 -0500
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2aad1bb5058so13791675ad.0
 for <qemu-arm@nongnu.org>; Tue, 10 Feb 2026 12:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770754548; x=1771359348; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H0/6jyx5lBSzvidGPzp44soUpJA5ox0vbl/G+VGissc=;
 b=HIVBLZ68sYoPn99PhpnZQaA3jH/3pyz3p+wiC72j3bN1JtAyjDM4bDTIXcRDvOJTut
 QavWbV/1SKTMmOtUvaTLhPLXP72DXMQhHAlt7LT/Qm075Wat3ELRGRTDaIw/1NKhyJfO
 wsH7JkAl7X+tQ7j1SpX1YTDTnExlMohatvzLRU9JMjniSRVVgMIu2wSf8qMwec66wPgR
 +FA63V6XH7IOpVfpteUztNTS92vwgNg7XV477IfroTh/To4EVwrE2h0rlLaBEGBLgHVS
 iephecWKNMgOVw69PGZ8apS9mLfQ0vn27j/shIhQuOnYZ+2oL4prwdZJhDuwNkIZXMht
 k5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770754548; x=1771359348;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=H0/6jyx5lBSzvidGPzp44soUpJA5ox0vbl/G+VGissc=;
 b=vrp6kaqEDPnVavK1JdLmRj6EhiwLXGS1+8U3KXwm3wuINS8eVUT9HJBHepZlh+1gSr
 KTfgO9WOMrO9v45V6MAmXLotMS+sY5gkpSMBWirNTBlFG1D0cMvO1CMuiPSW8OhhVhZ6
 z+4ox5DYUxpZjSuzbLxNn2s0iW4tibcZdQMTB1DaUedzrp9C/De+HggPieQgByISFwnK
 /hW3AlmIafZ86h4kRuh7Fs+y0nkXz+AQBkpoPWL0wTneDJtvUZFWTr6LxvkxODVK8lXQ
 oPBvy2mXoT5SpppHzK7w2F9bfUqJtmJ4qXZS+XatjpfdXnhtb613I/cvNv96G0N7kThT
 IGQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9hMcYCXpgiuXe+uEbeLzU2RDtPRvcc+tBCg6VxLz4yiSNIvkvpbm2RBpw3QQqVtYWZu6TzTdC7g==@nongnu.org
X-Gm-Message-State: AOJu0YwGSzdNqjc6B2yV1OuESvc+AL6THCQ+tjBZnAJmjI2VqWFZ7TfS
 cgumeCwlnwPJD5ihZXF2J5P6MIrrOXG60Y+qbBdZowr29puIRsUsJDwTVY8akDXXYgs=
X-Gm-Gg: AZuq6aKhy1O5/bCiCyljnXWk5KkWXF2omlrMCST18p+X3yyEXSllpMgE+v+ApAd2RjJ
 zTN93EwQ/Al1Fm34ltMIYJ+61cRso8esPsG+Kv7qFCAe+ZQqGlu8R2Sd1X7dpZXEtAQkkBwYANj
 AS7ILyT9X5biL+zs4wXpHT81X1mrurbjsyYDjKQSrPBuPgfSPVSCmk8jAjOxXpBaZVhso4+hLcF
 CgpbcNmULUF2xMlCHQvRU56YG/Me06ofrhOlDiUIpuCDpHAhDk1JMbGVkSD+BR0kto2Olxe4vig
 k/aBKdBAL0GRzYTWekqqO1Cxb7lAa1h+osHvFUOBAqTReoXtA4epiPQm2oKiCWFntRdV724uBFw
 wD6VflcyoqvFvv5nvntmLAY9YnV4dWtL/a0gqlLL/O5yrh6Ag9xnK6+0E5ZEKJOiVy0OYALnpw5
 uOrf3kvtrLOBRqFbcjgVCRt9MPUGPfPFrBZ4+jo8N9edBLy1YE0IWckBiSVr3ay5fMOFu6DDX67
 qQ7
X-Received: by 2002:a17:902:da91:b0:2a0:c5a6:c8df with SMTP id
 d9443c01a7336-2a9516cd2fbmr174890375ad.21.1770754547963; 
 Tue, 10 Feb 2026 12:15:47 -0800 (PST)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ab0b392cb5sm38523225ad.70.2026.02.10.12.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 12:15:47 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: anjo@rev.ng, Jim MacArthur <jim.macarthur@linaro.org>, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 03/12] target/arm: extract helper-sve.h from helper.h
Date: Tue, 10 Feb 2026 12:15:31 -0800
Message-ID: <20260210201540.1405424-4-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260210201540.1405424-1-pierrick.bouvier@linaro.org>
References: <20260210201540.1405424-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x634.google.com
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


