Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A7B10F284B
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 16:46:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w6AJo-00072l-5U; Fri, 27 Mar 2026 12:45:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w6AIz-0006eB-Ng
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 12:45:09 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w6AIv-00038W-50
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 12:45:03 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2adff872068so10015755ad.1
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 09:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774629897; x=1775234697; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jE9dWySPWaDpusKqPLgrQj/rUnbESAV94dTG6aMNmPU=;
 b=Dzxb8WoyXaj2u9iHMP5djNLm9SKxQpNrpexH7wcLCnAx03r7AXfqjdDlQUq7ubCbvb
 9sIzbI2Nx4LFepeYq4nFwqi3JLa6f5cQ9A78AtkFr5bFPqU2RdyLcndRMgsoWHIVRiJw
 fi9o8x98dlaIW0Xhg1w/OTYOzGrkDlkXyPU3zKDrPUVVIOd1NvuizmkgeMdYqtRAOeyN
 JnZbjiTyLI8WSYo4zj+0UABLfg68JarSzk0VAcwWy/SjGNwQhyYnl9lZnAbPjScJIey4
 YPGBL/Xh1DQqbDfIQ/VX6IaslrZOD+xYBReB10suvHHgYGKgyKADHxSS65ZgxDIXlX5+
 fsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774629897; x=1775234697;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jE9dWySPWaDpusKqPLgrQj/rUnbESAV94dTG6aMNmPU=;
 b=Vw4gq3dq2FgYklonfM8qNP/ACjMiwyzfNypZipGNPAuz8MzaDcXhVxmBlTLJbcn+7/
 rmg1UW+2pQz4s9uWRECZXQOeLEvmM+lFB4b3OrTSdtMNF6/hS3b18STYIViAoofABJBU
 hpE81TfLKbQUboobSDZq3MegjYQvB6wxxxN5Rtc6NhCWNe3ixR4sUAmbKOot7aFkpIGD
 89rjPXrKlgzSIQcUBAgBgLZGkZ9YZqvxMer09k+PYswY061JzvD2q7gZnY6lbu11X321
 gsajpsRdVVj1uq86Q3Y7lQB3oXL2IdJYHXLhuu/a/Gl43ZKHqofwIvNkVhFFc+8Nip4H
 3oKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsbrjfwxFHTqQbNDB0efyMXez/sRy32z6BZv0bWZ5bXSjUKhIvZ8Cdt0XlCIaFwBALO1h673ft1g==@nongnu.org
X-Gm-Message-State: AOJu0YybEtO0stL0FZcIfkmO1au7M9fQDtAPx56FfcaMcjCvPBKqGcXq
 JggktY4lE9QcgALSBqJk36Ve3J9PsXu3sfwhUR7MLPZa/9lLIlCGeOPqqYcCcyRL9po=
X-Gm-Gg: ATEYQzxKv4SUbmMxmv8gyiKK1nixRFK1MR2UAsZ4ObHwDyoAwvHk3rGCicIJ+V3f0s7
 8ejSxEiSvKtVWGxV1JlfqkErBBdiD7AVSPPbVPmcivO9Y4vIqNBXUD1coPVMAM18qGUJ5buxedT
 sNpz4qvBI6dnVP8ZGtXNSpiCaHXten2Bmwxhr2nmQ2G+ZaXqkPQzbcCn6UJWJDAP+sZx9rKrRd4
 T5GcEDT94dz9KYNPIpH5XpC8YqOHGjtkDPUU/TY1p3OzI3HtcD4fOTVHN4F62RlZJRdqssiEsKr
 LPMMX9IDXRLaYizalZgE3fJtkLtzQMtJb1I8wZ2F5zyG8gOEfzSNigfP3spaxcqI65X9s0CrOtg
 dMx0w+pufaH20UW/DDKarrn9/p2VPZy0hUgS5DL/zp6UR/tXXtUa/dh5eFv01YVnYW33DmDKJzo
 cAJ096GP53e1mvdDvFD1bvq5zHOwsYSL6EXc04A6B9NBfHdQLZYkE426ghNzMVXLrchSoNXF06f
 bxF
X-Received: by 2002:a17:903:2405:b0:2b0:afbe:4e14 with SMTP id
 d9443c01a7336-2b0cdcf7f99mr33635725ad.40.1774629897270; 
 Fri, 27 Mar 2026 09:44:57 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b0bc882339sm63890655ad.43.2026.03.27.09.44.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 09:44:56 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, jim.macarthur@linaro.org,
 qemu-arm@nongnu.org, philmd@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 02/12] target/arm/translate.h: remove tcg-op.h include
Date: Fri, 27 Mar 2026 09:44:39 -0700
Message-ID: <20260327164449.596767-3-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327164449.596767-1-pierrick.bouvier@linaro.org>
References: <20260327164449.596767-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x632.google.com
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


