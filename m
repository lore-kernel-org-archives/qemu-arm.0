Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 413FDE9129D
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Feb 2026 04:24:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1voDM7-0004Jy-Nn; Thu, 05 Feb 2026 23:22:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1voDM7-0004JZ-3H
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 23:22:07 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1voDM3-0003Q0-FM
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 23:22:06 -0500
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-c61342a69b9so95955a12.0
 for <qemu-arm@nongnu.org>; Thu, 05 Feb 2026 20:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770351722; x=1770956522; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SLG6GFjz6gMYPUgqxMsYfEaJwPICYaIcXQ6XuIJ4wGg=;
 b=TUOTn8GEggHHjtDWJ9x7FP7zDZGoct7wP0HprIrwdy1nHlxftdD+rPymEbwCAsctKi
 K/eYxDrZggOkB61uwlRtiB0OUfO6xyaBnrVPeVedYaa870bwqRfmeSL/IOY01236oYaW
 fB+xybqeik8fv4TRQ0dNRFWhAovA8/YgiaVdUQrDu6PhxES+xaL/qFfMvx7GJhcl15vl
 cgOaQRPBQJTPIBRrZLlWGtedn9sAuBlpukhyGRlQRr8dcXiPnOuOiDI2JqN40W/eBSCa
 bAs2PucrE5WTJXZVskagMLSzkOsMOxEc2GV6gccR3Ceg2oDu8S0o+nnVLSvM+skpVAFk
 SSug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770351722; x=1770956522;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SLG6GFjz6gMYPUgqxMsYfEaJwPICYaIcXQ6XuIJ4wGg=;
 b=nJ0pdjGxdRUWH1j4DLsmWutkZ4V/FR9IO4bW2iwMp/Ub9vZcIY14wkJnoA1V4KYrUa
 6jl0cgu546jQ306Lj4GP6WEfrK6UyxDB6pFqnz1AUOo6v+HJTozDEQek+4iS7eTpq5UB
 V6isAGHxY19vLXTz4BZykyNAb83SwKStdHaH4E6J8j6UtgaoiBjk9vw0Cpovv53bj79J
 Q8+HeZ7/9l3BK3VEJ4appQV9ElkJ5n2ESa1mLdcf23NXV5SWdP5HNvnA2cxNT6Ea6hTN
 D26epqrh0aKEsCq4CyKT7Qo4LTJ5ckgPiyW2zgpaGYKF9DjdDSKWdIqut/B+kjq8a7yM
 UpdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0UDKYahIIrjIqVYTliWDMsEAqoB7toQJKgEx2OYwNL6rkQOIYhf3KfRduxmkjog7THjlBdiptxg==@nongnu.org
X-Gm-Message-State: AOJu0YzfgNLxABkuwt7SJzDj6FKSMSTpis8z95TJHnTDtTm8bbnMjKnC
 v+uU7baNEULuHyyN8DqPva1eTrAkg9mUwBnj/XukyK2neAAmaTII3+KGM/oAtokRrq0=
X-Gm-Gg: AZuq6aLbEuVvP2cVLeHY2OpOLGEHjm//0Kl2ALcLsFXP5tr9HmGljBySLT9OTLjdjFk
 DJNwm34+0xjvpUFefeRbWlIFuCbqLJKR44YL8UOC8xb+4wngoLTL6XarBvwSQ83pfXrbLNOrrp3
 ZUxBwCMrGdiA7el2RkdJNd+1T12x6UtIwpRlJr1xrn9bPDmoS4tkfbc9FtGfBnZ8tIhMCcDL6JF
 aHOizXYqy77H2mhsE4SHZgexg6aQnGRQcfLNhibLV4ZUWaWKfsmVVqBHFWFteksgiccXOnFkdjN
 R2fylPK5QGaKxLNTZt2XPCMIVBZ23FF2nq9zL2Sgrr1hTthtSJ5kZRYOoaYP7mLuab3nBhSMXPX
 1xv9xl80VwYIYZnwApuwB4CU6BauygvHq84oXp5ix5bQtK6o0qc7xrvUj9bCFIgAwPjAPQUwDBA
 HeBypt6nqaULwqw2HlZSC9Ks8P3A5L1L02//YuHRc1QN3lBUouqq/x4sS0OtIT6q4i
X-Received: by 2002:a17:90b:3a05:b0:33b:a906:e40 with SMTP id
 98e67ed59e1d1-354b3c3823amr1156910a91.2.1770351721846; 
 Thu, 05 Feb 2026 20:22:01 -0800 (PST)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8244168fdf5sm926914b3a.17.2026.02.05.20.22.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Feb 2026 20:22:01 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: anjo@rev.ng, Richard Henderson <richard.henderson@linaro.org>,
 Jim MacArthur <jim.macarthur@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 02/12] target/arm: extract helper-mve.h from helper.h
Date: Thu,  5 Feb 2026 20:21:40 -0800
Message-ID: <20260206042150.912578-3-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260206042150.912578-1-pierrick.bouvier@linaro.org>
References: <20260206042150.912578-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x52c.google.com
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


