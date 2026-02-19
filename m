Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14529E9A04C
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Feb 2026 04:03:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vsvF5-0008NG-Co; Wed, 18 Feb 2026 23:02:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vsvF4-0008MB-76
 for qemu-arm@nongnu.org; Wed, 18 Feb 2026 23:02:18 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vsvEz-0001DP-RC
 for qemu-arm@nongnu.org; Wed, 18 Feb 2026 23:02:17 -0500
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2a7bced39cfso5087415ad.1
 for <qemu-arm@nongnu.org>; Wed, 18 Feb 2026 20:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771473732; x=1772078532; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZBh+fW1mApPtLG6aGnrKPAIWmAmzNuN5929rjSWR418=;
 b=jubqbz5CatuhHK8bQ74J/CFroNI+AdO0ysG2eVHg7AxEvc30juLYDAgp6YlaaLt0SE
 RRNs3oenEIdaMccQmLIvPYsd0L2mkwgPbn/v4arTkuoM6h8uCvbyPfVT5NHv3ZGcCvsx
 BZbUTD5Cotdw58oHoLuEDzMDuQ6jbCFWiRlFqpsmx9VBXbmmc/Y4LYqhTic8x7xwmH7Y
 J0NC+VFl3yUxO772wLZ+HhytVNBdqSFuiNPekgCesG/wV0yJMph2gwqv74F3q3jkghWY
 xGPGUWYrIrZVn2RdaQYf7QvYnr5Xczo6W4inhslfoAckq0WddPe8/DanMg6ZLZK6n6pN
 Ytpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771473732; x=1772078532;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZBh+fW1mApPtLG6aGnrKPAIWmAmzNuN5929rjSWR418=;
 b=HborXcS1MCp2Fhf3kOSXfbIl8Df5wdJ4OIbnOywRR0rpkyBSKI83adrr23Wv+Kf5oq
 qJrjBvCRiotM+B++IcMW1fz6pVPDZCi7INLF5g6IIMd2kuAbIh/5nXbhb5vthNfjmdcz
 VHMtZKlM3PdDz/3v5QtsJFt6bkZw447kyiSmP156uP8hunl/2ZKHx0FHMHisEg6f+lkF
 5Ovlx6S33Y0qVfntL1/NyPea/emn2jIMYjJeACAp0p19+MyhHqIgSYMOwYoQiukOU+ae
 4GaOXoht+/U5WPJdNm7aUk7hOPZBpN4zn0eMlVZb78kFouWgdJQy6DUgPkjx5X3T+Vfg
 LXEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVw19pY5Dbxz/hOFka0Jk1kf0yagaCY/lJ7KYKyX+jNzTIuHT5tdbTVCDX2U6l696ybz2eR7RjUKA==@nongnu.org
X-Gm-Message-State: AOJu0Yy4Bh0PT5oc8NAXcOWS699JYzkGn/5tFcgDCOw8ZVeHozpbF00y
 Mc7EkA4BcXVE/XLE4Jot6rYLL4f2cJJFjrNkcMUOlaOK0IBlWzzNa8Xqhpn/+DCEOpw=
X-Gm-Gg: AZuq6aITi6H+ShtOJ1DodJ/MbqHP+c03SgbeTbY+L0//l011fX39yIcGgD1sBsKi6Hb
 PMIjTxfeLARhebomVTyj0ZiCmkcOtV/nmFnnnTSsSp1/OghJfTHmOmKwCL/Z/0WHjQVmLyEO2vw
 S5i2Ath1kzrch7Ra/VwXjfoiAErwIwBB69yNoIgmO21NhK2oZUgC02ozJJpaz54GO6pfX3AU386
 mgrsCEKVCTFXLQHxMoVlCwuVN9NggSFTJKHUJ3ifVpCFbBatP7gBt6UHSe9uex1+t4EkyETeRjA
 TO3oNjB92nlOjbR8FDUgJl8/pf+k0OP2au8VCbLPlSxtDYt3cL49vAeMMibuZtZqDFdHkXqM9tE
 nWXAe+2QXGRb5Dhp76jCN8iHZGUJ2aNtpnRj7na59dap6stc7ET1vQcau1oQF1I84t7g5JuZwfE
 A/9+l+IHa4LOBdbV8xKl3AlFIk2mVKRCL2Fhqh/HAkUNj8tHNx98d3WG3WZW0ElzCICIo3TZm99
 YpY
X-Received: by 2002:a17:903:46cc:b0:2a9:48ce:b5f5 with SMTP id
 d9443c01a7336-2ad50f8e23cmr33186185ad.51.1771473731894; 
 Wed, 18 Feb 2026 20:02:11 -0800 (PST)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad1a73200asm147636225ad.36.2026.02.18.20.02.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Feb 2026 20:02:11 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, anjo@rev.ng,
 Peter Maydell <peter.maydell@linaro.org>,
 Jim MacArthur <jim.macarthur@linaro.org>
Subject: [PATCH v4 03/14] target/arm: extract helper-mve.h from helper.h
Date: Wed, 18 Feb 2026 20:01:39 -0800
Message-ID: <20260219040150.2098396-4-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260219040150.2098396-1-pierrick.bouvier@linaro.org>
References: <20260219040150.2098396-1-pierrick.bouvier@linaro.org>
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
index c90b0106f75..580ec86c68c 100644
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


