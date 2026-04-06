Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C838F46C69
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Apr 2026 18:30:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w9oel-0007TA-6V; Mon, 06 Apr 2026 14:26:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9oed-0007O6-61
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 14:26:32 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9oea-0002Ng-Ji
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 14:26:30 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-82ce0a9b41aso1529595b3a.0
 for <qemu-arm@nongnu.org>; Mon, 06 Apr 2026 11:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775499987; x=1776104787; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FGhpyO9gJO4O10TYeQgNeX96IysIFLL6455aGE1zsuw=;
 b=dh/9BQ6f7g4NmVJsSvPU7R3yXrsCOie6vhwy/n03qicuJTGSFpn6vjuvj+R/uCEKZ1
 jfGjtClpq4Y9l8shoVzfAxHuxClGJpvLBBf/9dVIBU+GGn4kWBo1/vIf+r5KD8rsTO5n
 /MZu05Xle1UZDwL1AGdalQJBmzipuKinS2Q2FE1lB6CHGcy1hT+JT4OLd7AkNpReYMp9
 jgk1o//FXuAGzAt5Hcvhy3J9WwesEoAQFfz3X3XgxEC+WsG6gsW14Pf6aTaz82aL/sR6
 8+b6Y2mB7CYMWfnKE9wNTgOVoVx/IMhwRqUbGLPZ1y9xcicDPGQIeKfY/gTQ80u0hSl9
 /VYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775499987; x=1776104787;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FGhpyO9gJO4O10TYeQgNeX96IysIFLL6455aGE1zsuw=;
 b=RCl8ezLrQ6FdawEVMuEqnqe3I/fItJDIIasNxa5+iWSrpWo1whQfPTj+u6wf8fQDFM
 qnje6PB8IMCT3by7nrIrDSLq1GejSTvpNJ/XwCDUbRb/5AxocAu9cqhv5sw6KFW5WWIQ
 hC4UwNBgjuO5gCpEizqWQCo2hMWmyX1I6CW8x18KzTSAWxu4Sf8wpALGMzoSNhAip11M
 4Idge8Rn/IA+o4B1DPlWUSE07Aoh58TplHDsAuiV5CI0oWvoXtQWNc4FEyO2YlD2NRO7
 KlKjEGQfInYpjAedNVNm3Iu2GPhKClzM+Og8Tiz2PDgC9woKJB5VjaglMfsytZNCZRSd
 YPVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1YVJNwh4DZllxvsu7klikFOZ7/Zu/pFx2/mPzB70wAnrXttYjCNU6VLqZ4VG1QbaG3AWovK0QAw==@nongnu.org
X-Gm-Message-State: AOJu0Yzr+XcJupMsxO8tNeMDH0RLnTdgHPMmoREfta8UP4xmQDBsWA1G
 mYhiejnf/EbNSRyRqfEYiVwyZwyI2aF3QUXVQ8q7+Bvnt7gVVCEI0UOc8CwTa8J4M54=
X-Gm-Gg: AeBDiesXfwkKxrqHWKAkdB22300RfhnkGlbO+rKq6C9/dCEqOr3JjE8XPgnObeSem5V
 Szw02Iv2OMXImC/ZHxYL66KN4lSKvyxo8Zw4MDUeuiujhPzhmPEhVpp3+F9l+hbksoz/3gmqiME
 dsts9wMbsTUDOZjAzPEmTOZDODQ284ks1m9rmVf1MB8D8YloqqIvVk6uteJdXzPPXU9g0kBJ2UI
 e5naz16OH8phmtZ/9Huhty1/yLmRLNcCC5SkuRXq+/wb+2M2ksRtI8oxL1yTz9TYUWWyQRD/zXv
 EnqQaUQ5m3Wx7/f+JxLhtGE3VO5oNgzhBZSTLW+D8qbA6nYtDRshEhto5gFZ+TZiXyMmr6o8ly9
 MzX7IQDnL+kqdeVEHbnumSvrFjYe4VMHIu9V7dMZcLfqSRJi1Z0kS04ZP558PXkZ6omfKWAgrRJ
 qR2tKegdLPugkWXxNW4MLnTUk9Z9iV+GH0/CbtTdjtKpwJU7Be+VG0afbWkQS1MEwsHXnM0WZBt
 pGb
X-Received: by 2002:a05:6300:210e:b0:398:9820:f6fa with SMTP id
 adf61e73a8af0-39f2f175104mr13417095637.53.1775499986772; 
 Mon, 06 Apr 2026 11:26:26 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c76c6561fe9sm12765080a12.15.2026.04.06.11.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2026 11:26:26 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, jim.macarthur@linaro.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@linaro.org, qemu-arm@nongnu.org
Subject: [PATCH v8 09/20] target/arm/tcg/op_helper.c: make compilation unit
 common
Date: Mon,  6 Apr 2026 11:25:58 -0700
Message-ID: <20260406182609.193886-10-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260406182609.193886-1-pierrick.bouvier@linaro.org>
References: <20260406182609.193886-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x433.google.com
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


