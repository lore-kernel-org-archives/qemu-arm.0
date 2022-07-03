Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2439695lft;
        Sun, 3 Jul 2022 01:43:11 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uWpqy+eIBybVSGu8tELTzOG0nSxYlfW8Ywa9zLqgPI/pYF2iZYTUquHo+kRAUXHJfo+O2A
X-Received: by 2002:a05:6902:110a:b0:66d:2b65:1783 with SMTP id o10-20020a056902110a00b0066d2b651783mr24577016ybu.574.1656837791559;
        Sun, 03 Jul 2022 01:43:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656837791; cv=none;
        d=google.com; s=arc-20160816;
        b=QHONVB1huA7aVvw7X9/Ac+BAHMeCWJqmjBpyW4cLpcmh30QSGYS+oUO8sS0YxJJMvF
         GZZ0d851+ZQ7d9Sfi8wxOKDGpIVsYJ/1gyWNkY2wXqLN9A0/VjQidm9lVyN9Fwiu1aUQ
         ayJvO1nIUwqihX95e5hc1oQbJ0g1AhofYgoE7J3xtOapBk58+ef9x98NNBlwdQKhWg44
         w/iMU0IWaXjtW2nwz3biabtVkhKC8rjTchngYg0/QuQs35N/0tTCEfOMUbvLK4MQTgJS
         +rQYImYQgLEfczCxLcwhmN3A0SuLJC7rUFyVgK02TNBlL9JZxb5oCHlux9WAATMj2ZDC
         LipQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=nKGjUZfBkhVbWA12ORMzUOT3YB96l6xmhnKiB3/6fQo=;
        b=N1tmpryMkQj7JMXtOUX4w20ceGJ91B/ytjuOI4xm2p7tRsEGoVPiKiK8i7G1pvEKen
         uQWxIV6QHkNGPzC6QLIhbTgoFMozZSgNE0NuVkvHhFuu9b27d0jwaXy7APP8Oyet/X7J
         2sjszi3WdI4lNf8LijFc5An1sjpiiX8KI3P9CUU9Z/z52Nfgd5UEKuPY2sXCrQ/RTkdY
         8uAWI7zY/Wcuh5JZoBFJbjL2hoAIWebmANR8T0iPiu7I50fBf1ik+72ThK52qERsGjXo
         ZQSo39C73p7C5XbysxKs1IityQIuHJHK0FsdQ2OKT4C6XuHi4SupUUpQi6kzj1mO5IhK
         /Qmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=agMKJwUK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 20-20020a811414000000b0031778f7ccf6si35471731ywu.79.2022.07.03.01.43.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Jul 2022 01:43:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=agMKJwUK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7vCA-0005C0-Bi
	for alex.bennee@linaro.org; Sun, 03 Jul 2022 04:43:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uvU-0000En-VP
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:25:56 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:46674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uvT-0006DR-Cg
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:25:56 -0400
Received: by mail-pg1-x52c.google.com with SMTP id s27so6222702pga.13
 for <qemu-arm@nongnu.org>; Sun, 03 Jul 2022 01:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nKGjUZfBkhVbWA12ORMzUOT3YB96l6xmhnKiB3/6fQo=;
 b=agMKJwUKdHCinJ3LQndFn5l7HYb5kNt5zEtXit1Bs8CM6lSvIuDBcoGL0faYcNnLb5
 Sf58nAskBLQTKf8hLR6YUTczfFgiBvV0HfU9N2BEAVEnEG+kygvaOHEPaxMAqMVurRtB
 zL+zHLGZcZuWHwaRd/L1K1pXtvcH8gNDqsbbNlojzJuv7JXsw84n/bk0KXYraLCGU+px
 jprBkcniHGacEDQcGUtVXubpTEBitJ7UBC9B+jh60wQQfx7PpBJbzUOZXy6isIoizwgE
 GaAhqoodT47e5EX+c0rFPsv2R9rcVmvthZcDhZbfEVdYexL+bhL3wsDYKbVZMRbNCs4d
 bCtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nKGjUZfBkhVbWA12ORMzUOT3YB96l6xmhnKiB3/6fQo=;
 b=6kYZSFZjOAu/AH7N4NnRlS0PtWsHUW0aBb5/pKuuuFnaSLb5D0ugtEBJDKIv4N4BUp
 975ZcnNcS6eYuINwG6YPY6AH3Q7abQRYzVs3HrhVCE+Y7YbmwbdE+ZDxR7eZ8/GW2PYY
 dSA+xE3sTGu8KwHcpZNSGE0CSshxuTbS9U9UeirXkValPqbnS5A3x6gyipraUG0oLMKv
 kCzd7aNmerdfqWCQwkPVD+WRCT3zCuGK+lc+dCWFyVlOE/z0b3jqfTrVXcvq388X2ZRP
 P4ItMypdo3MgiFyYVEY0hnRO6Dap4hgb6d3pwA8dpx5iVOGFOuFsPOyL6tA49XWuK1ei
 DNmg==
X-Gm-Message-State: AJIora/XYKcEbCT/+t0uQbs8443GhpOmbTtJVVsmUphKIkpY69jmg5ns
 dnrhjUw0e1w9Gnb+IXUZnc5fsQ==
X-Received: by 2002:a63:e648:0:b0:412:22fa:6fbb with SMTP id
 p8-20020a63e648000000b0041222fa6fbbmr3330126pgj.24.1656836754099; 
 Sun, 03 Jul 2022 01:25:54 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm13569112plb.57.2022.07.03.01.25.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:25:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 29/62] target/arm: Add is_secure parameter to
 v7m_read_half_insn
Date: Sun,  3 Jul 2022 13:53:46 +0530
Message-Id: <20220703082419.770989-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E9BlNbPnE2Ts

Remove the use of regime_is_secure from v7m_read_half_insn.
As it happens, both callers pass true, but that is a detail
of v7m_handle_execute_nsc we need not expose to the callee.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/m_helper.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 5ee4ee15b3..203ba411f6 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -1981,7 +1981,7 @@ static bool do_v7m_function_return(ARMCPU *cpu)
     return true;
 }
 
-static bool v7m_read_half_insn(ARMCPU *cpu, ARMMMUIdx mmu_idx,
+static bool v7m_read_half_insn(ARMCPU *cpu, ARMMMUIdx mmu_idx, bool secure,
                                uint32_t addr, uint16_t *insn)
 {
     /*
@@ -2003,8 +2003,7 @@ static bool v7m_read_half_insn(ARMCPU *cpu, ARMMMUIdx mmu_idx,
     ARMMMUFaultInfo fi = {};
     MemTxResult txres;
 
-    v8m_security_lookup(env, addr, MMU_INST_FETCH, mmu_idx,
-                        regime_is_secure(env, mmu_idx), &sattrs);
+    v8m_security_lookup(env, addr, MMU_INST_FETCH, mmu_idx, secure, &sattrs);
     if (!sattrs.nsc || sattrs.ns) {
         /*
          * This must be the second half of the insn, and it straddles a
@@ -2109,7 +2108,7 @@ static bool v7m_handle_execute_nsc(ARMCPU *cpu)
     /* We want to do the MPU lookup as secure; work out what mmu_idx that is */
     mmu_idx = arm_v7m_mmu_idx_for_secstate(env, true);
 
-    if (!v7m_read_half_insn(cpu, mmu_idx, env->regs[15], &insn)) {
+    if (!v7m_read_half_insn(cpu, mmu_idx, true, env->regs[15], &insn)) {
         return false;
     }
 
@@ -2125,7 +2124,7 @@ static bool v7m_handle_execute_nsc(ARMCPU *cpu)
         goto gen_invep;
     }
 
-    if (!v7m_read_half_insn(cpu, mmu_idx, env->regs[15] + 2, &insn)) {
+    if (!v7m_read_half_insn(cpu, mmu_idx, true, env->regs[15] + 2, &insn)) {
         return false;
     }
 
-- 
2.34.1

