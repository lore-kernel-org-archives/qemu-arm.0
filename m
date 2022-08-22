Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp979551ejc;
        Mon, 22 Aug 2022 08:28:01 -0700 (PDT)
X-Received: by 2002:a17:90a:ad45:b0:1fa:f352:4522 with SMTP id w5-20020a17090aad4500b001faf3524522mr16079087pjv.176.1661182080775;
        Mon, 22 Aug 2022 08:28:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661182080; cv=none;
        d=google.com; s=arc-20160816;
        b=wQsojbJID214VuIbEsV7paIFqzWYIZiNnLyR/eF17FJl4BnBwDMNcj31eICze1ObJn
         vUD0yh14Gd1S2T6i46+OTl5MYS9FsDX8gGho+sDceEKoXgFiZCUgTa8aD68NQA4QOmlh
         EyB0mp9ebLIkqo9Ac4Fb15862I3N13ZWY7mZvWTwiDZUXIPMJv4jCTCj18KrduXLWxQf
         6bDzs4eJTiQyy3we3BInHfbapuZ7cO6uWY+QTLekDoKw+j4cdWva3L6IG/yJydcnFskZ
         XxM4DBtE2/8dcqsO0G633ukSPR2c2YHIyWZls4b6mQ+FYtbyGjcyPQJvVbdpZsHlCrha
         fBbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=LXSL+H12LObvuYlmrtCN7YFFVJ00RtMPHZQZ6vrA/8I=;
        b=uZW8xLryAymXP4NWKreDirP5/5GbOONa4KiL7YthnsjPVZXUsUvber7+jGM3zOp1QX
         iug9wuocxModLhpNti0qJhFfmZloxHumeNTdZ8uSQ/+7SLJ/bnhRcQGylFY4dYf8dWdF
         WYhlNjXjFiYK4eTMGGkV5+wN3nk1DwMA9BpfV6CQ0n2yN9lLE5DM3aLU0NtqZ3piJCBD
         8kGuz/m9As6/9N3izB96H7wnJqR9/0446lhiwANvJnbH6lOze13bbiDFrFP/UBT0aUep
         V9bm/9TYLkfArLxOEm36IHzQl2AK/RLrt0VZ88MoyKan+J0SzrQMRY9Lp1ndEQyQAE1n
         epGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hiB0GAnk;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s10-20020a17090b070a00b001f24e75b90bsor4651423pjz.41.2022.08.22.08.28.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 Aug 2022 08:28:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hiB0GAnk;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=LXSL+H12LObvuYlmrtCN7YFFVJ00RtMPHZQZ6vrA/8I=;
        b=hiB0GAnk+Yh/9CXaY0oXI99cgG3JnZgMav8Adunl9JiKpZGzCeelI04FMsThHz/0vb
         Wgtusw2ynNl2eMfhQhha5/VuRO+mHiq8YGtydzHR25ziBscYKfPSx9VZSN/zIau64yr9
         rG30O965ecDHmHIhGBk/BxHdE/0jWZAOYtzdYLB07tvuH4WkU4FeoLv+/5YJJi6Vs9jk
         2fk4zl/6P4EIr4ALnwyLQ6uBD+3UNGqnNUIvJQEODZgNzjLYzoUOnS4HPzgKu7H0ZgdX
         IT3qxp+9x4W1pfFFQWYJy/jOU9rhH2nA2CUbGCWNi0hCffdmZmR6g0k2wRJbTGgazQx6
         iWLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=LXSL+H12LObvuYlmrtCN7YFFVJ00RtMPHZQZ6vrA/8I=;
        b=RaKi4dVt4GmDW21s2YjenV3fwYmYIuqjO0H2p08T850/GGns2vHtQapMtGRmZ6GvNZ
         A9dcOkNjJ8v7IT3F4/4aZRrOVcOBfoO23nUDwFahKB9j1PZ3YftcdZxDNz3G8wBpOqNt
         UnnZUXmbwObtc23ai0maJV3R12/OVGwYj99yaE7R9o6VslVUxEIQh6XyXt3V3H+IUdIs
         cyI2VTxEWCGE2cXG9A0XD47tL9hQQdUq55WNqaJYFJ+xkIx3GdrLzb9RStZZbNbnfYoK
         nY6m0Iyn04xb8ejIo8EMrT5rATXi6dmpRh4DPLFIVf1hm19ZmKz2uZAsyF4ceDjPgfYH
         Cs6Q==
X-Gm-Message-State: ACgBeo0/rOrNTvJPLagFisyA2iCeXQnB9OVpAqgu4OnYc+X/u4Kf2GOK
	lJdWFo5fQTMleQTX1v/aZF6++no/
X-Google-Smtp-Source: AA6agR6NtHwXsBuW2EJGGSDE37g+WPPNhzf0BkWVMsiV2vnJq+EnDOupPlVAo0X7XSWClvxYrNvXyA==
X-Received: by 2002:a17:90a:ab14:b0:1fa:b97f:c28b with SMTP id m20-20020a17090aab1400b001fab97fc28bmr23699834pjq.71.1661182080305;
        Mon, 22 Aug 2022 08:28:00 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([71.212.157.236])
        by smtp.gmail.com with ESMTPSA id q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 08:27:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 22/66] target/arm: Add is_secure parameter to v7m_read_half_insn
Date: Mon, 22 Aug 2022 08:26:57 -0700
Message-Id: <20220822152741.1617527-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 29xaE4qrQy9G

Remove the use of regime_is_secure from v7m_read_half_insn, using
the new parameter instead.

As it happens, both callers pass true, propagated from the argument
to arm_v7m_mmu_idx_for_secstate which created the mmu_idx argument,
but that is a detail of v7m_handle_execute_nsc we need not expose
to the callee.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
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
