Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 373F0F44873
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Apr 2026 14:30:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wBCrb-0002TQ-CS; Fri, 10 Apr 2026 10:29:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wBCrZ-0002Su-US
 for qemu-arm@nongnu.org; Fri, 10 Apr 2026 10:29:37 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wBCrX-0008CH-MB
 for qemu-arm@nongnu.org; Fri, 10 Apr 2026 10:29:37 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4887ca8e529so13764825e9.0
 for <qemu-arm@nongnu.org>; Fri, 10 Apr 2026 07:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775831374; x=1776436174; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZU3XEBSJq8F+ZK30niKXLk5arUCDgwJmRkECq9oNz6c=;
 b=ZXjvDzbtfNgfVQINR37LCO7BMwZnK0PBx8PjjDCi2b2uzypC2afJQGHP/4m7qgrBfb
 TlTCoQzn4HzdUnjMemO8srxC+cMD3arvrf6+KP5gG8RLFMHQD9XGqGVit4gnPiZJojRn
 jz6gw1DEoiCyjjYRIOtnfb7pOOe8I+631cXUG+ePtxQsmCFFUmlVKLAdByvTwmU6qy7C
 yc1Jwji2iRiNPYpzR+wTWH/PRIWkGC04DcfMb4zwNyJFtBST3Yj+YbgWhRSVI2JVffnu
 Js3q/qEX7ij9/4FopGBZMaXd2Rt92X008mQr52FRHQxU14TwaFL2WOdbYSusTeTw4E2j
 9jUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775831374; x=1776436174;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZU3XEBSJq8F+ZK30niKXLk5arUCDgwJmRkECq9oNz6c=;
 b=Jzi7T8flaAN6YLVnYQ+szXLYxuvjaArj5zbLBnLilhBYZjdzfcGksEpOfcGZXPf6pA
 uiLy2jIsdvH6DL97Z6ajn9/thwoET1/7J+CaZLQV2koq5hQ3g8DdeLpKOrsgQ+z1Zwab
 v5WzuomarIxB3SZcIltpMzGGzCZZdiIfr71q1dOLZwwFttY99ouxvugmMVPfgMhUJy5r
 6VFxzQZLlfjeCz1Zn5j/HTdKc8CJMB18epBZMKxMcEjuGtCGK5pMKHtQZU2OzW6W9xmP
 tP9HbHEXeTrsaeMqwx7is6gHEtg+m+ms5wfyT4j4GVkpfKA5BF52TYMX8rPFDCcOtSUC
 Q6gA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnOF6QMCnIR/PEfzF3qWOLzF9VcySq43kSL7H/u2/g9et3zWRTQWBOWCm7Q6P8cRcFnn8w4QCpPQ==@nongnu.org
X-Gm-Message-State: AOJu0YzlHDnLo8uA4nK6yDgTD2ncQIoUeymwctvnkcn/4EPLOHQhw2iR
 ZPSV/VWWff+wvmzRDQlee6rti5S2rHa2autn/J2/7hv5TV+ra6+wVNFLByOuOCVbvEA=
X-Gm-Gg: AeBDieu1G285qP4uOk8YZqY68DtSUE5hu+6Nw07hA9TzXW6Yuo4q4xvOfeOS8itA4Yc
 +5dFtvzTCkAi2qSOPoOhE6KCEMVii2P0RO5UiEebiqy0ib34ljLaER/D9TlKJ9N2Hj1GbYduS5v
 LuWU3iJWBiRj23h9IsBMGUD3n+6rgVeP56876JNJ61P5t/xn2mKQV0vWmENa7tKwvAkvfgKmpg3
 zhaYsdztQD7DIa+tho7ACycZU6oS1mz8808alIAi5ozLvASpCxaq/idxtm7wTSUUdfkQz3p7Re4
 lxrHUAJo7MjlGBd4Qu0bh5DxnFYVSnTyUfGT/vtAFme82n84uHX2p6RV5h2fS9mnwZB9YMrj2Fg
 3ecvcSuSiZdZxOi8aWtQw2va2aB1uOTO4/Z1xRxVyIlo1W+xYhjMUFC92GJPScDO8xb54Dofubx
 8RCfjeuRUB/Tdhxio2v3H7RrGRjxprTKht4Bm1qFve6Fd7z2F+ju1XIrZcBYlv9la1tbgpUAZe
X-Received: by 2002:a05:600c:154d:b0:485:3989:b3e4 with SMTP id
 5b1f17b1804b1-488d685b6ddmr39881125e9.6.1775831374022; 
 Fri, 10 Apr 2026 07:29:34 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d525c931sm78557615e9.0.2026.04.10.07.29.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Apr 2026 07:29:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH-for-11.1 v4] target/arm: Use vaddr type in handle_psci_call()
Date: Fri, 10 Apr 2026 16:29:32 +0200
Message-ID: <20260410142932.33089-1-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

Use 'vaddr' type for @entry, which is the start %pc for the
on-lining vCPU. This allows to remove an unnecessary target_ulong
in hvf_handle_psci_call().

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/hvf/hvf.c  | 2 +-
 target/arm/tcg/psci.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 5fc8f6bbbd9..124644918ef 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1418,7 +1418,7 @@ static bool hvf_handle_psci_call(CPUState *cpu, int *excp_ret)
     bool target_aarch64 = true;
     CPUState *target_cpu_state;
     ARMCPU *target_cpu;
-    target_ulong entry;
+    vaddr entry;
     int target_el = 1;
     int32_t ret = 0;
 
diff --git a/target/arm/tcg/psci.c b/target/arm/tcg/psci.c
index 56754bde951..5df17bd059d 100644
--- a/target/arm/tcg/psci.c
+++ b/target/arm/tcg/psci.c
@@ -68,7 +68,7 @@ void arm_handle_psci_call(ARMCPU *cpu)
     CPUARMState *env = &cpu->env;
     uint64_t param[4];
     uint64_t context_id, mpidr;
-    uint64_t entry;
+    vaddr entry;
     int32_t ret = 0;
     int i;
 
-- 
2.53.0


