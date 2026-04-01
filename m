Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7652C10FCAC9
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Apr 2026 19:22:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w8180-0006Yr-Tw; Wed, 01 Apr 2026 15:21:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w817m-0006TC-Pk
 for qemu-arm@nongnu.org; Wed, 01 Apr 2026 15:21:12 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w817k-0002yh-92
 for qemu-arm@nongnu.org; Wed, 01 Apr 2026 15:21:10 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-35d94f4ee36so29420a91.3
 for <qemu-arm@nongnu.org>; Wed, 01 Apr 2026 12:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775071266; x=1775676066; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bt74HgDQm6QWm4ci9bJjS4WKY7nrk6DWez5uAlhy+BI=;
 b=JF3umuXq9eHqDKKeVc/k3IX3AnkKlVoIV6H/LAfjgiPp9NeOUHP2/Bg34srX3poBIC
 OcqSwZFuDR8jJERWhYlEG99dhaftBrg50VNVfcKP3uS+TBoIpjJWLNt89ewVKiaS/7mR
 JmN8MqRfv+g13ST95KDPMAZd7UGdfx8njCE/YEaQNYwJFUGO1mOw25jbXjNJG6V2YlRU
 LWi+dH2WrYUPCoTUEcqp9Ubcyj7N52DlPNuWY0jfC6NdSOmphZtdUPbRy1JuVd6MiGo/
 VZaSv5g5oxia0qxTzdUqgf6GZzB8j7duOD1w21sM2QKd8uHrDpdjfjQ9bymEtX9szo2q
 4A3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775071266; x=1775676066;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Bt74HgDQm6QWm4ci9bJjS4WKY7nrk6DWez5uAlhy+BI=;
 b=f+Jd6P8h0GJtgGvrbBVAEgYoPacMjNqz4loubNNdrLpooM93i+aYMBpPnXCuOFvM4W
 kbSNLh8sK6QcQG7obD9fQeurnSz/Y/bCFBCbt5hiGDdCX3DcakgRFK9Kei002OxhTEjw
 TVCoLg3W/qMM64DBT13Mq8HIK/ijG1KBxMac45d/IABV0yMcQvwWZSO2+PjrExaTtzQS
 1xLIl45cMHWsxV0b7+NwJFR4ErtOIaAoBw5WrDDH/sJnhCNxOQE+6VlRD68bDoXaroUO
 1bDq0JPRyIr/c1QdOJBLplrm0Pq1lQyPLUnHk9/UtOcQmwd31pXXMdYpkr4tUF1efszE
 88Fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2fE91RuAKrEB7NTwzEJZh1ORTMYnABKqIMt4lz17KxFPSXHOclYekxGIREo99+FeQPOIRslLtrA==@nongnu.org
X-Gm-Message-State: AOJu0YxJ51zeRaLCkTJhtBS7dHYoKPNrE6DFiApLmzkijZjqYjlnLsLu
 ZQwkNzkQbRLOz69S3xg+P0JibP/TAtWF5vxNwaffRALKCujYdheF/c0/e7WIaU97/yY=
X-Gm-Gg: ATEYQzz74zOpwtje8ioHD9WjKqqnQB43zDLejzB//Om41Kd4vOE+f29RWrUAaLchJjF
 lns1OMr3iWq1YzuQDq94iuf2ybQYrp6cpkOUQQh4ISvS64kFhTWT5UMKduploNliwKHkgo0INNv
 RizpeNU+/9liC9YF2xpHqFZsoXBBAA0Jule98eOKIh/UFMNvJfPurf1POfuSM0zyKMaTjnXhlRz
 q6Z2Ha5O5tEkQTy31v7RS+95QPZ/4ysq3fmf1MGvPGOXhKe5MphidhvXei1KEgRKFz+kft12jwY
 cfGq7NfHwepTn/TJJL5IIXxGaT2j9g5Q/iyqk8RROyURcF2FSnFTnPLAWJa2WPJSjtTZ9O7zPph
 n+XUpHU9WPX9F7MbnYElVTvyC7OYyEP64vQmoVXOTY5JjACHOcZTVcdeJZp51cdEw3YfvlGJrgY
 YmxuWIx8wpCtv7RvhR04u5oLaLMl03VC3xNHoD+7bmzpAmvhuvUGCVqjibPssDshumXAg3mzzq4
 i3S
X-Received: by 2002:a17:90b:4e88:b0:35d:a2aa:3b05 with SMTP id
 98e67ed59e1d1-35dc6e7ab50mr4264387a91.5.1775071266223; 
 Wed, 01 Apr 2026 12:21:06 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35dbe41b11fsm5633113a91.0.2026.04.01.12.21.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Apr 2026 12:21:05 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 jim.macarthur@linaro.org, Richard Henderson <richard.henderson@linaro.org>,
 philmd@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 02/12] target/arm/translate.h: remove tcg-op.h include
Date: Wed,  1 Apr 2026 12:20:47 -0700
Message-ID: <20260401192057.1182724-3-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260401192057.1182724-1-pierrick.bouvier@linaro.org>
References: <20260401192057.1182724-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x102f.google.com
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


