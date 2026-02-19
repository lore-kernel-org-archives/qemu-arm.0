Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A4EE9A04C
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Feb 2026 04:04:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vsvFH-0008TY-Lq; Wed, 18 Feb 2026 23:02:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vsvF5-0008Ne-OD
 for qemu-arm@nongnu.org; Wed, 18 Feb 2026 23:02:19 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vsvF2-0001E5-77
 for qemu-arm@nongnu.org; Wed, 18 Feb 2026 23:02:19 -0500
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2a871c8b171so2660975ad.3
 for <qemu-arm@nongnu.org>; Wed, 18 Feb 2026 20:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771473735; x=1772078535; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4N3HX+SvrJxNpLSjRFYSmasI3xjsp55w7IRFqv+Mp/s=;
 b=y+6b4lzlIYt5vq0Eztvt3iq4PkP6cbZjITSCZQICl2BJvx8Yw3GDss7R9S0kitHPwo
 LNWNqWBXpR0bDyJFcHmiYB8q86kM4PyqLG/JF45zOxiXDYoED29Zud9GzdOSljhpDUYd
 3VdFesJ3tg3lYD83IgsORYwPdWI6X/K6KsXTKk212Vovj1CGlzW299J6EDCDNN8xYnb0
 LFkJI9oF/V3vrJ2roK3urm8UUYE2keiWEsfA+bELxqSjWPxAJl5NIOJwMK+XCMuis9XF
 4AD+y+YeifOREmMOZAmrxolAZsDUIMOPi1tkwbobdlgUJtje/NaXNocqKW+11fPf5vPK
 9ALQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771473735; x=1772078535;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4N3HX+SvrJxNpLSjRFYSmasI3xjsp55w7IRFqv+Mp/s=;
 b=AsRUy3pPH0qZC/3k80wXXAbH62M2BqSLdWJXMHnNIs9J2OoIOh6L6n9OuTtl9IS3la
 +N54SCj62oAHEULq5ST/IktVLYscKHpmbfEju3BXBxNZsTM8si5b4vCHdHTy72OjHUIm
 gpHc2WNU3qda3OTXUmb/JwnsqxT5/shKkQG0GqPmBS0ZG98nnein8lBNHemQTbvudgq2
 eYk3nMkwQHStewOL5dji+6egWXwO+kuYbNA1a0/mZkt7KujekHOnxsLX4ZJi/GwwMzhb
 3wogvP9grLHSAfs64uRN35V4rqC5gewM0eTJBoaVSHxSfKaM6zgcNXRZwgDj84vBKrvC
 +GCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+8IpPA7WiaGESbNASt/3C0ROoN7NaA5Oo7PdbXFSIQziHGq5/feupkw2VFoGjbwrKafl+P8Lc1A==@nongnu.org
X-Gm-Message-State: AOJu0YzFPTFSWhEymcHRbTZzO73+huDlS5qciH037z7hegmu/P5YPjtD
 uEz1+ST/LmP93iflYadaP/TjHt3kVESGL1aGFj3N3i1G0qARkwYEA5JDdEaOEffnjN4=
X-Gm-Gg: AZuq6aICLRRpspgUObpECMjjkvnz1Kjm9aPM8sTmiiPTWz/kC3xbB8SeHYARZropeBE
 E65dfs16Udd264wvpyVjfzartNI9DlA/kJCtDEzhOTbjGgG1cz9Pd6X6+L+YmmHKxca3HAU6hH/
 eDW+QK+JOd/m8QK6A3H1OyWy989OFubr5ukU4R9EHcAErijCJqcmx7IjgGu6gwEfo3mkxIn4OYQ
 rtjzMIYVYBLUEVEg6dPtN9o83U4dBAJHP6+RvPnWBBDBJflciSngJ5D0VnmAaKe3v67GzOYPsT5
 lWcIssXY1tnKUeVHfwEHEO646hZyfaarLdJJWdA1FWUvehjQNbMIuH1VX3yMl+NipJ2ACb6tWL+
 czN6ORnj1IlGS6s0RSEv36zKGEgxDNQUM/8oD9NNif3TEiwlkHVUFUYbI53f0sajuNQeCwJKWv1
 F3XuTNxM6Xhag6lA1b3lUWmiqRXiYi15hoFHDBvI0Q5fc+QgQwq4g6HQziwtJq07sVSIjBhx1En
 lDK
X-Received: by 2002:a17:902:f687:b0:2a7:3dbe:353d with SMTP id
 d9443c01a7336-2ad50fc5f93mr37643785ad.53.1771473734769; 
 Wed, 18 Feb 2026 20:02:14 -0800 (PST)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad1a73200asm147636225ad.36.2026.02.18.20.02.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Feb 2026 20:02:14 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, anjo@rev.ng,
 Peter Maydell <peter.maydell@linaro.org>,
 Jim MacArthur <jim.macarthur@linaro.org>
Subject: [PATCH v4 06/14] target/arm: extract helper-sme.h from helper.h
Date: Wed, 18 Feb 2026 20:01:42 -0800
Message-ID: <20260219040150.2098396-7-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260219040150.2098396-1-pierrick.bouvier@linaro.org>
References: <20260219040150.2098396-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62c.google.com
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
 target/arm/helper-sme.h                            | 14 ++++++++++++++
 target/arm/helper.h                                |  4 ----
 target/arm/tcg/{helper-sme.h => helper-sme-defs.h} |  0
 target/arm/tcg/sme_helper.c                        |  3 +++
 target/arm/tcg/translate-a64.c                     |  1 +
 target/arm/tcg/translate-sme.c                     |  1 +
 target/arm/tcg/translate-sve.c                     |  1 +
 target/arm/tcg/vec_helper.c                        |  1 +
 8 files changed, 21 insertions(+), 4 deletions(-)
 create mode 100644 target/arm/helper-sme.h
 rename target/arm/tcg/{helper-sme.h => helper-sme-defs.h} (100%)

diff --git a/target/arm/helper-sme.h b/target/arm/helper-sme.h
new file mode 100644
index 00000000000..27c85fdeef1
--- /dev/null
+++ b/target/arm/helper-sme.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#ifndef HELPER_SME_H
+#define HELPER_SME_H
+
+#include "exec/helper-proto-common.h"
+#include "exec/helper-gen-common.h"
+
+#define HELPER_H "tcg/helper-sme-defs.h"
+#include "exec/helper-proto.h.inc"
+#include "exec/helper-gen.h.inc"
+#undef HELPER_H
+
+#endif /* HELPER_SME_H */
diff --git a/target/arm/helper.h b/target/arm/helper.h
index 2f724643d39..b1e83196b3b 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -1,7 +1,3 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
 
 #include "tcg/helper.h"
-
-#ifdef TARGET_AARCH64
-#include "tcg/helper-sme.h"
-#endif
diff --git a/target/arm/tcg/helper-sme.h b/target/arm/tcg/helper-sme-defs.h
similarity index 100%
rename from target/arm/tcg/helper-sme.h
rename to target/arm/tcg/helper-sme-defs.h
diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index 075360d8b8a..7729732369f 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -22,6 +22,7 @@
 #include "internals.h"
 #include "tcg/tcg-gvec-desc.h"
 #include "exec/helper-proto.h"
+#include "helper-sme.h"
 #include "accel/tcg/cpu-ldst.h"
 #include "accel/tcg/helper-retaddr.h"
 #include "qemu/int128.h"
@@ -29,6 +30,8 @@
 #include "vec_internal.h"
 #include "sve_ldst_internal.h"
 
+#define HELPER_H "tcg/helper-sme-defs.h"
+#include "exec/helper-info.c.inc"
 
 static bool vectors_overlap(ARMVectorReg *x, unsigned nx,
                             ARMVectorReg *y, unsigned ny)
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 31fb2ea9cc3..5d261a5e32b 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -19,6 +19,7 @@
 #include "qemu/osdep.h"
 #include "exec/target_page.h"
 #include "helper-a64.h"
+#include "helper-sme.h"
 #include "helper-sve.h"
 #include "translate.h"
 #include "translate-a64.h"
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 463ece97ab8..7d25ac5a51f 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -19,6 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
+#include "helper-sme.h"
 #include "helper-sve.h"
 #include "translate.h"
 #include "translate-a64.h"
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index c68a44aff8c..db25636fa3b 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -19,6 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
+#include "helper-sme.h"
 #include "helper-sve.h"
 #include "translate.h"
 #include "translate-a64.h"
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index bc64c8ff374..a070ac90579 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -21,6 +21,7 @@
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "helper-a64.h"
+#include "helper-sme.h"
 #include "helper-sve.h"
 #include "tcg/tcg-gvec-desc.h"
 #include "fpu/softfloat.h"
-- 
2.47.3


