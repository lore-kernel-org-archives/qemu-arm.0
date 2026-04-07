Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7204FB5180
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Apr 2026 02:30:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w9wAg-0007Un-4U; Mon, 06 Apr 2026 22:28:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9wAd-0007Tb-V5
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 22:28:04 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9wAa-0006wN-A6
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 22:28:02 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2ab46931cf1so36446035ad.0
 for <qemu-arm@nongnu.org>; Mon, 06 Apr 2026 19:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775528879; x=1776133679; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bt74HgDQm6QWm4ci9bJjS4WKY7nrk6DWez5uAlhy+BI=;
 b=aTC83TlWjeEXZYrD/CPgmD677lb+95WqDBZ/2A8DZQ1el6CDThI7C8kgefjR6F+Iht
 oKyFG+MwylgAXp2mkXN8zZ3u0Y4ikxAT/U/uLSmYgcVO6U0d/Q4xyQ41ZJFACkgMbfLH
 WXOG+E0BZb0ptHLxp4bjLionuObBbiDBHTaK7uJDkDPZp9m3zosaUbkYVVtLktCt1iim
 CYiBzib0EQR4MPyNo5lgZPAQCFWdbHpN6++B1IvLuzbJP+uAYo0fMklgAUiCunTV0sKG
 C4+iEVK87Qmtm33zW57WRxFl5hR1vaYvLyd23QrcT3kaDtTz1sMnccYUzE/jIKc5Xd5f
 1Kqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775528879; x=1776133679;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Bt74HgDQm6QWm4ci9bJjS4WKY7nrk6DWez5uAlhy+BI=;
 b=FjT+M6VtiNfie26s5h+LzDrETXjV456axnXERG4m6X9pVhVWuvzWJpfFN5UrJAFK5W
 O1DxEga5ds4pGqtZOsziCFc5y3HOe9amU2dLvRI+lG31noBfV7Io9iXUyhq4lsA+rEmo
 sWruybfzRDHP/ONjFuw2elApsVxlQ0KCL8j67hpl+yNm/5wA4CjF3Dwa8ZALKa6g1BMM
 Yc4Ex+HuxnHDTDHImdFUAJyq1Rxf56zS9aPaV86SJFJcvYYd0rhnqrYkDl7keRUik2NG
 YUqkY67rzyMdsBz7PYvIkKVNndMYcImi2rhcl976E1MDEILTM1r7WRH1UoyLAFi60pxQ
 fOOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhNaPrsKF25E8lAGjlmid3CuPz89oO8S2TTLQfNNHrNYmtcj/vzTwarMhSSzg4yMVAcYLZAf1pYA==@nongnu.org
X-Gm-Message-State: AOJu0YwC5cE1HAoexcS9rRiaF9CZln/3EhQdzxRAwWST+AhR4KVECsmx
 Op1RmSLHgQ4I9c5nsruJsFXCkNNeOeVzQlif7rkuJoInmFU5Q1IzaPvaGY1cZGGj7x4=
X-Gm-Gg: AeBDieup8EH3Ro0VzbdQV4bhSYIU1Zw398UQHJp5SV7Zu9axrSVbDuwuhGbUbK4KAqY
 BRzR+3Lf+YyJ7J8tcLsd7xuCbE0g5d/0A6cdHPfM2zxphhElFPCnSy76/3AbTJPJtRZwCLIJMRq
 HVoOaXcLE+zjXVrbL4IzOaDjZqyA3ODHmBs++4RuHD4E06vnFBD2G2A1XLl+qwbFkLMT6qftSFo
 v7PCeCWRshDqgWspGbRIFQmIriX5QPHiZ948WKX4HadbPGAl2CjSnT1vOBzbnwkF8bhMtrbO3Ml
 OcGc9orwi+7noE0QyOyihIi42S5pPKFjUPmSkDwdeEtidIhpQo7d5uKFmTnUucAS/gVemXrTz0L
 gv2Sn42ejqpYcIsPrnRt2pqJbM+XwEfjuormW1WpQdobI6X033UI788bLIUU1GzrsnahxNgnUZB
 HbD9q8xoEa37SmyHi1h5lNEdomHve7kJdteb1FdQ4sWVqfQKXbpbSx1sWv3LGhfL2WhxWX3va7j
 46c
X-Received: by 2002:a17:902:db04:b0:2ae:5346:d4e6 with SMTP id
 d9443c01a7336-2b277e8072cmr166329035ad.28.1775528878499; 
 Mon, 06 Apr 2026 19:27:58 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b2749794e8sm161423685ad.53.2026.04.06.19.27.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2026 19:27:58 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, jim.macarthur@linaro.org,
 qemu-arm@nongnu.org
Subject: [PATCH v9 02/20] target/arm/translate.h: remove tcg-op.h include
Date: Mon,  6 Apr 2026 19:27:30 -0700
Message-ID: <20260407022748.57629-3-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407022748.57629-1-pierrick.bouvier@linaro.org>
References: <20260407022748.57629-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x633.google.com
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


