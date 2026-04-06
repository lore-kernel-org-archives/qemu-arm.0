Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82817F46C47
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Apr 2026 15:05:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w9lVW-0002v7-Qh; Mon, 06 Apr 2026 11:04:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9lVR-0002sG-8j
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 11:04:49 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9lVO-0003qP-FI
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 11:04:49 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2b23fcf90b2so39231875ad.3
 for <qemu-arm@nongnu.org>; Mon, 06 Apr 2026 08:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775487885; x=1776092685; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bt74HgDQm6QWm4ci9bJjS4WKY7nrk6DWez5uAlhy+BI=;
 b=VmHQQXMnmFc3cpHK+lQmJPF4Pb1ZYQB3g4/6ybwrJ8qSp7oQXOCsntad+yk+tXEvko
 cU0SnHUv1uooC/tq45pdxqBN7Ior4TmHGpeUIhSh0P/M+sNGgGBq4fKBT1ayZBXJb4cE
 3v13xox6PThmLMcdU5O35AkNz+skaEoE1R7NV7OMg6ilEPNblgfljLSNOlvAUBhwjnZZ
 bS+Dpyr8e3RLXUSmnqOWlWaoUmbiYdhZlIqsLDW1KPFRIsZqr/w1j6xDHC6MrSM50m/g
 Kuu5V8LjrPp7kdPvPSmz7LuhaB7cJ8xcPPiEwZc2KlTUrcMvPSMo31zDaBoB+mrF1WUU
 usKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775487885; x=1776092685;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Bt74HgDQm6QWm4ci9bJjS4WKY7nrk6DWez5uAlhy+BI=;
 b=d4id16Q6DybITllvpjZ0sETnT1jfanhkJAP7ppyY7Chf70HoRGl9lV2xecNJSkASeR
 99E3r9MiSvHbPiv3/V5IhhzAudJFyKkfMR7MaBJSo+UCxzUvR1iDggUoncrX7PWgJ687
 dBLIa1TDGbWSApqpca328Z5lexmCx9+dQHWugEOqNTjXqNLTzQHWtT8aqX3+9+Wb3vXj
 hq1vAURfex9N6q3R/8lJ/c9rJxZ66zUJRLJuT43myfytt8MI/AliwBln79abylzVH8LC
 ff80u2QwdT+hnN2e+6Yu6uK/Xg2lVJWAS/MH8OSQ3SyFyjdJ26m1U+pyZXdNq53BU+o0
 /V8A==
X-Gm-Message-State: AOJu0YygAE1yTpaElVJask/0pD4gd7UvrYO4ksJ+9T6kghGG+1kN+h0N
 LGT/K5s86VS7BlsXX0Msq6ZoqcNLpoHui8rgVf+PMM+GnRoy6Psm2xDCcHkwxfLSwJg=
X-Gm-Gg: AeBDieuNqrlIZVS/Px4fO7ITAeAxEFz67ZZSpPQWcL7LVCrIAgQIY1HPm2Na0TWya0J
 dcH6iTKyFI5JqdrA8qzB4/Z2KPuhjRmHFvZCCJs/yJle39nBRx2c2DAAyhaBqQY2QDchemL4Aj4
 1xmqSTl8OmUH+u7FCabWX7yo8VPZUdlAUZu7AicgStoJP5vWJXiYa7nr9YA9mxUP0ITU5Mn+Qjv
 YnyCkjl323mQuTmCMGeaTmFqCJM/qOimnq2PU3XK0OVCfMD0eMbx5xvTPZP8ADNtZDPQNbRO0Qv
 aK4+4EJrUhQNTJOFUNC/dYX3ut3nnqTXd1UeOpdCU2rW1ZxgzK/fToeXYU8HlpG7yN/32mFwb1a
 KGwLm3BD2UoKJ4ogqJz6TEiz2Y62y6kgLyc6xJJgyExgSUyWqIsqNGW0DkZEFIrAMCkRQdESn7e
 unF8c5e7FzllGAGd7EJ5iIoV0Y5/MIu4d09Thwit3vpiNYwKrN2GGAe1ms4UY6u9lW3EgSFihSr
 JA9
X-Received: by 2002:a17:903:a86:b0:2b2:4d78:eeb4 with SMTP id
 d9443c01a7336-2b281779e2bmr132654585ad.22.1775487885065; 
 Mon, 06 Apr 2026 08:04:45 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b274979d72sm137770075ad.51.2026.04.06.08.04.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2026 08:04:44 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 jim.macarthur@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v7 02/14] target/arm/translate.h: remove tcg-op.h include
Date: Mon,  6 Apr 2026 08:04:22 -0700
Message-ID: <20260406150434.407201-3-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260406150434.407201-1-pierrick.bouvier@linaro.org>
References: <20260406150434.407201-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62f.google.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


