Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0335EB2700
	for <qemu-arm@archiver.kernel.org>; Tue, 10 Feb 2026 20:15:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vpu9I-0007l9-US; Tue, 10 Feb 2026 15:15:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vpu9G-0007VR-9N
 for qemu-arm@nongnu.org; Tue, 10 Feb 2026 15:15:50 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vpu9D-000892-Rh
 for qemu-arm@nongnu.org; Tue, 10 Feb 2026 15:15:49 -0500
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-c6de0527ce1so690210a12.2
 for <qemu-arm@nongnu.org>; Tue, 10 Feb 2026 12:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770754546; x=1771359346; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h2plFct/EpqGzjEx7nOv5ScJhI5BtmBrKmQ1/sromkc=;
 b=Zqqnp3f61y7sry2qU6lK3UMOJqG0/9QW55Tj90+7gQRiHHpCgTuhj/UwIQPlL8LJ9h
 VY6ecKt4SXSoQMF9M+Vw2zFmoSmiikddRt6HlCMjoR6pLfchTBqQcYmWIP5LPmzmbAEz
 Bq+PZ09X3QCQ/imIPOxUpx3fq+GO1U0YLnIv16VgqW7PO6yB7aaIHffFxKRp5hwIYlv8
 pFXeZKh6P7M6escGlENQAhKm3U+nz5xOa6SpCmoPHuQVB/Vwt24Bf4b2n/v+GHKxUQ0P
 S6QLlnORZlibY3wJhWD3nN3LbH7g+eiuPGUdlsIDWwpfYwYndO3zFyB5seUvVzMNQEB3
 nvsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770754546; x=1771359346;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=h2plFct/EpqGzjEx7nOv5ScJhI5BtmBrKmQ1/sromkc=;
 b=qOA0RDbHAIDcmYbNj17JRhcEUCkD+uRTay+SlzGYewsyXNEUnarBc05iwYFKUWgijp
 WGGT0ZZQJbK1abYX0k+MUWmrgNtV6sx3l8CkNovqaOqY88yd7V8oINd/MPwevBSzZ2hV
 bURz3F95CRhDXqNovdUJykUjv0YUFPGrgGUgBJQ94JmF5c129IxvA2ZVDORBZXW6WRSm
 8XZzWTV2MyXr4v+F6oLFUmkyfaSNoFiWtc4zTcDtCoJU3APx4ShbqHLJ/LN8jq2phef1
 FhQH8LFS0wjyR5VimIGmXi1x10Em2LQpviK16FyD3+DipG7G8Xg/NukJw9I9hMriyn6n
 V84Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX03n5HU/YsEbLYmtGAsaCle5sTOC+WOBJ8LUAVbO01DG89curGQTYVFVZl6g5pwyUe8AHsTpGfVg==@nongnu.org
X-Gm-Message-State: AOJu0YwpIS3ufrJ0U7s4iJhaWglb6CAwyNjX4rGmgbp0aocI9Sq8phJH
 An2vRJlHtTc1N3LSzYb4ZiPmUdCqe9dJFivtI/W1Hny69Hppd5EGZOh2IIRLShEuVFU=
X-Gm-Gg: AZuq6aKoOKbRnuM2CjG9N9wo/1qNCYg5v6Q+AetWyrEKLveKq6mh5DHCYnEX1HGhD3u
 bivPYUhvbpVjXU0Wi8JzZGAW3u37MDvaxwfeUDgGuc86K3cqRwhOMsicPRAJYa3eIUYlTKGG37s
 q2ANpctGPlD4d8VFzedA5gWNIymX5aL54w5CD0mfHLNsKHeULWsgUwpy8qqzyCT5RTdLepvFMMJ
 eoE6JVTOsmID5Njsx9qfs17Kp4GwcrpvIgiaNQFjchmbk9gW+tVn7BuM/pyOe7yqGMpOhuk7D8U
 EPSDfV2/nASQu61Hw3NExaQwc/wIZVaAOBZI+mEDnwpLJ7ErHHFnDaAR4GoJ4g+kRiuqtck7s2W
 93saHLn1dk5qh17oouu4bATdSTiMHS+nfgjIQ3dk2/qPqKHjD90Fgr1nhy+uQ5yOp/gCJwZNKzO
 EouSP6nMJRHDUKOfa33NhGWp6hB73pAwfq7N4sTb5/ZJ16Tp38NCsZvIeBWYEaNvMahy3BY2LHg
 Kbp
X-Received: by 2002:a17:902:db07:b0:2a5:8c1c:7451 with SMTP id
 d9443c01a7336-2a9519f5b02mr181073635ad.58.1770754546416; 
 Tue, 10 Feb 2026 12:15:46 -0800 (PST)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ab0b392cb5sm38523225ad.70.2026.02.10.12.15.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 12:15:46 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: anjo@rev.ng, Jim MacArthur <jim.macarthur@linaro.org>, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 01/12] target/arm: extract helper-mve.h from helper.h
Date: Tue, 10 Feb 2026 12:15:29 -0800
Message-ID: <20260210201540.1405424-2-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260210201540.1405424-1-pierrick.bouvier@linaro.org>
References: <20260210201540.1405424-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x52b.google.com
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

A few points to mention:
- We mix helper prototypes and gen_helper definitions in a single header
for convenience and to avoid headers boilerplate.
- We rename existing tcg/helper-mve.h to helper-mve-defs.h to avoid
conflict when including helper-mve.h.
- We move mve helper_info definitions to tcg/mve_helper.c

We'll repeat the same for other helpers.
This allow to get rid of TARGET_AARCH64 in target/arm/helper.h.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/helper-mve.h                            | 14 ++++++++++++++
 target/arm/helper.h                                |  2 --
 target/arm/tcg/{helper-mve.h => helper-mve-defs.h} |  0
 target/arm/tcg/mve_helper.c                        |  4 ++++
 target/arm/tcg/translate-mve.c                     |  1 +
 target/arm/tcg/translate.c                         |  1 +
 6 files changed, 20 insertions(+), 2 deletions(-)
 create mode 100644 target/arm/helper-mve.h
 rename target/arm/tcg/{helper-mve.h => helper-mve-defs.h} (100%)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
new file mode 100644
index 00000000000..32ef3f64661
--- /dev/null
+++ b/target/arm/helper-mve.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#ifndef HELPER_MVE_H
+#define HELPER_MVE_H
+
+#include "exec/helper-proto-common.h"
+#include "exec/helper-gen-common.h"
+
+#define HELPER_H "tcg/helper-mve-defs.h"
+#include "exec/helper-proto.h.inc"
+#include "exec/helper-gen.h.inc"
+#undef HELPER_H
+
+#endif /* HELPER_MVE_H */
diff --git a/target/arm/helper.h b/target/arm/helper.h
index f340a49a28a..44c7f3ed751 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -7,5 +7,3 @@
 #include "tcg/helper-sve.h"
 #include "tcg/helper-sme.h"
 #endif
-
-#include "tcg/helper-mve.h"
diff --git a/target/arm/tcg/helper-mve.h b/target/arm/tcg/helper-mve-defs.h
similarity index 100%
rename from target/arm/tcg/helper-mve.h
rename to target/arm/tcg/helper-mve-defs.h
diff --git a/target/arm/tcg/mve_helper.c b/target/arm/tcg/mve_helper.c
index 63ddcf3fecf..f33642df1f9 100644
--- a/target/arm/tcg/mve_helper.c
+++ b/target/arm/tcg/mve_helper.c
@@ -19,6 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
+#include "helper-mve.h"
 #include "internals.h"
 #include "vec_internal.h"
 #include "exec/helper-proto.h"
@@ -27,6 +28,9 @@
 #include "fpu/softfloat.h"
 #include "crypto/clmul.h"
 
+#define HELPER_H "tcg/helper-mve-defs.h"
+#include "exec/helper-info.c.inc"
+
 static uint16_t mve_eci_mask(CPUARMState *env)
 {
     /*
diff --git a/target/arm/tcg/translate-mve.c b/target/arm/tcg/translate-mve.c
index b1a8d6a65c0..4ca88f4d3a3 100644
--- a/target/arm/tcg/translate-mve.c
+++ b/target/arm/tcg/translate-mve.c
@@ -18,6 +18,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "helper-mve.h"
 #include "translate.h"
 #include "translate-a32.h"
 
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 63735d97898..febb7f1532a 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -28,6 +28,7 @@
 #include "cpregs.h"
 #include "exec/helper-proto.h"
 #include "exec/target_page.h"
+#include "helper-mve.h"
 
 #define HELPER_H "helper.h"
 #include "exec/helper-info.c.inc"
-- 
2.47.3


