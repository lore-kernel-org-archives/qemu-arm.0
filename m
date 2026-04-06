Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A34F46C4A
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Apr 2026 15:07:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w9lVj-00035Z-GC; Mon, 06 Apr 2026 11:05:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9lVi-00034h-6g
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 11:05:06 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9lVg-000406-Ar
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 11:05:05 -0400
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-c766cf593daso2823110a12.3
 for <qemu-arm@nongnu.org>; Mon, 06 Apr 2026 08:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775487903; x=1776092703; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FGhpyO9gJO4O10TYeQgNeX96IysIFLL6455aGE1zsuw=;
 b=Z2bFQWjre+WEJltX4vGtJcFXD7rFrUGo5ddkiaAPtbowxdqRm0iJ0R9++G0lsvXyy9
 +FO2dz99A3eYomVxEE7DuszwwRTdDnOCsFCKAggXJNUJXYr2SIo6yMcoCLjFVLA+O7rL
 XLHwbmJgiINF7Jz53dZF8dBrQFI90c2LTHQ3hr7wY5S7fO3BHylwWumAMkaDS9lSs1Wa
 rD94RQOqtAqWTwueLnvH8aoq+mYfnMXpIcuNoHx9pqg97VB3x9Ogh1t5aDnRr92PMqYk
 J7/PoAbhFhm2X2Rqjh9mdpCRVDL9NdUCCYHMvG4jifMQr6SnymUEVpmq4gEWtnSHUeaK
 qryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775487903; x=1776092703;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FGhpyO9gJO4O10TYeQgNeX96IysIFLL6455aGE1zsuw=;
 b=qz91tON4JDMzjzQdFbGiIXB3xBbs8iiTSRTGQ+jyJtNTFNKI9NFcWIJdEkwBbSPbK8
 0L6MxtzqsqN/M/eX42lcAzwBh2uJip0oMqIqXGbSh5MHjdezCi3xrcmcvNTYkKA63sQ3
 KFoij0bnA0XQlgfW6wR+7V1Dln2usBYkcdNDxVuPBx8ceGgHK27gzy3HgDqEK7e6VKqs
 gk4gaMOUtamH5dBGpt8W+OgKlHMBynUPykyVNQBdCzR3LEZunfBIDgGdZRkTXsIIgGPv
 lZnCQTIqQALEckhbmO1nBgOzYr7v0JKITSC1LEUMDh8MdywM/EXJoDBt5WtGzbdbq/kK
 aa8w==
X-Gm-Message-State: AOJu0YztNcg8l0X3GBvZQyRCFHlhuFrholY0H89GmsofxU1kM5G67iWT
 W1FocLF2QLv1OEnJ+GYRG7o2C6YlL/klx7vBuSeUJxxlb7G3Cq8HeMK6WasnP2PYU2c=
X-Gm-Gg: AeBDiestwoOCC7k4YQmOD5gjByKXesyHRpbSZF72EyzoFP39DVwN431yUkCXiUkHrzn
 wn64sW0EHUXD2c9oRvTmuW1mHb9Dc89WWOEnMim3geXe7s42PRTAAeB1CYizPofq5CXC1FzWIde
 eQ+y6T/A26XvEsccxkkS4oT4AM1bLv9y9Jn7QoeaD+9bbcE7DCuf4dZt8xsXovQEti2HGD0y5bx
 u8Pp9rJC+/lGU+zjlg+WZA/I5CSX+YirKLmsnkpt9Pk7Cvcnz3uxDkHIBHubwvzB7xKt/4P0o/z
 UYRzs0Ai6w2r39nY1kjM+AqH+b8u7YI5bP4yJOjX8GP2rxBCYHYe+IG1rl78nAy472VUhsYSrDa
 bSBpUmMMOpqTniFrEj6tSXdJjG9+EEGiTMEKkbnkLGCDK8YLpMmbNr7C4kNb9yLuysPwoERPxYG
 Om3XAwIugQhEKt2bXNUbwF/ZFIojLC7jPrTz0e3GmOD8pNhoJ43oP18NguA19at1O4ELnoiUl9z
 91J
X-Received: by 2002:a17:902:d2c8:b0:2b2:523f:50d with SMTP id
 d9443c01a7336-2b281802cacmr137309205ad.29.1775487902680; 
 Mon, 06 Apr 2026 08:05:02 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b274979d72sm137770075ad.51.2026.04.06.08.05.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2026 08:05:02 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 jim.macarthur@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v7 09/14] target/arm/tcg/op_helper.c: make compilation unit
 common
Date: Mon,  6 Apr 2026 08:04:29 -0700
Message-ID: <20260406150434.407201-10-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260406150434.407201-1-pierrick.bouvier@linaro.org>
References: <20260406150434.407201-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x531.google.com
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

Remove unused header accel/tcg/cpu-ldst.h that has target specifics.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/op_helper.c | 1 -
 target/arm/tcg/meson.build | 3 ++-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index aa14f15eb62..75ad53ec6c6 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -23,7 +23,6 @@
 #include "helper.h"
 #include "internals.h"
 #include "cpu-features.h"
-#include "accel/tcg/cpu-ldst.h"
 #include "accel/tcg/probe.h"
 #include "cpregs.h"
 
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 70beec7a6c9..1fa26670587 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -37,7 +37,6 @@ arm_ss.add(files(
   'translate.c',
   'm_helper.c',
   'mve_helper.c',
-  'op_helper.c',
 ))
 
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
@@ -74,6 +73,7 @@ arm_common_system_ss.add(
   'debug.c',
   'hflags.c',
   'neon_helper.c',
+  'op_helper.c',
   'psci.c',
   'tlb_helper.c',
   'tlb-insns.c',
@@ -93,6 +93,7 @@ arm_user_ss.add(
   'debug.c',
   'hflags.c',
   'neon_helper.c',
+  'op_helper.c',
   'tlb_helper.c',
   'translate-m-nocp.c',
   'translate-mve.c',
-- 
2.47.3


