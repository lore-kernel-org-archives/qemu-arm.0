Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp458974ocs;
        Sat, 1 Oct 2022 09:23:38 -0700 (PDT)
X-Received: by 2002:a05:620a:4614:b0:6cc:9eb5:98b0 with SMTP id br20-20020a05620a461400b006cc9eb598b0mr9783779qkb.631.1664641418159;
        Sat, 01 Oct 2022 09:23:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664641418; cv=none;
        d=google.com; s=arc-20160816;
        b=BxbxYIYJU9kSFnlXzfpmGpGxugQuyYsKmP+BnrCFUFIJHTHQjKtguUUnq1IfrgT/MZ
         5YQgjvKdiqoQLvmybV+VhxvAR3VMypr1F5//lYXCwywYnzCCdlIichG0zvqo5V56KftL
         /euxMxefwhdRFbHBr3KD42lfAqiqCxIQ87Rf08nSyrzNjFi7pyWL+y4fv8GpfMSOdyKz
         tUgiSt7egsa8+gn5PvR5lGacc+5PKjXDNzBrSIcrWuZd3R0z3hxVAHN26xYhgF/ZCc0B
         PB62T+cWCkEpqMz9ISEiyHx3Bwo+elArmJhr5oZF7/3Kk2eEX2oc0+gyCaWwBQZzQO51
         QFfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=6Tnfc5rXfCku9MasFsfztuydoPYwIjiauClakmhLN0A=;
        b=HshzSpvR9fmK0LJ6baX37siHF2k29wZnjxIHUGhVVL/jGYuho4KRB1ggyTy3QpFZCR
         NiwchHNDEE09+ztHXTLNGGVLQuESyYPL5RTxjFntm84YylC5JwD8ncrSQtzGXSl9IGzb
         aerf6zVeTbL6DMX7KDcR/C3mtsqleol9Hf40MmhjM9uUle/upvI0D2/SDV3JDlb5vEf5
         VSQHknulvOskwYfX0yE7s0Xgh2dRtR1bNdXBnRDIV8o7fGDoluGU43vjbyzAGGJYJP40
         gO68pT29T3nTtkp/Sw/eSgsVNuRmK1xph5ULuhiL30yRmNZyvbKqvMgmpfN29W0DUji2
         Y6lA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EvjkrmHC;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r20-20020ac867d4000000b0035cbcc014e2sor2760383qtp.68.2022.10.01.09.23.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 01 Oct 2022 09:23:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EvjkrmHC;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=6Tnfc5rXfCku9MasFsfztuydoPYwIjiauClakmhLN0A=;
        b=EvjkrmHCJzh9pvhJhXid6iFFNxK7GGiyvCnoXwsWpuW4aUVEsYpMrWxs5WtQBz1C9u
         Vk98uNPVRXH6i+p97Kq1Mgf98xA2wM5rInMUMp4M1zesAM2H/6bcmzaofMKgMCkhDIGE
         LMnFxx15UHjyAaHqiCOqVMOxEIQ+CNPDEks1+/4g49F2GYUtNKqo/FFYuwS/U8Lvf3Hm
         J2G8s9xvHLv2RvnHYou/CxkmCZcfYqpJtiF1q1gRxtXg1CIjdgQyXgxspqXWmMmn0QKi
         J/EeWoOvsz8wq0Sc0wvCxLdM+i54uZC1wkqMe8mIdhaFc8u+yIl8QFkey4NXNRRqduvn
         xIVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=6Tnfc5rXfCku9MasFsfztuydoPYwIjiauClakmhLN0A=;
        b=rVeQP9UbzJOLwZeprw8S90MLNJMzK0J7jfeVYmMQxGgRPl4ZInq47tzCiIaiDKbcrZ
         Ve6e7VrEP9FoYz9XsQ3Gaxfud6Ms7Hph1Io2Xxm6nos+La4ZNFArDk6M7bJAGlAt4e1j
         CXRhYKOwLVeSRPLg8a0lG0qdjUY/pUx4Ig8VzsExT8/vhjoCISt0PXe1BZaLmnTEp8v3
         sZxGu8hw4Wz2w9AfY3pKGc+e/0uDxyF9QvqQZAfTk4jIrAof0z9IB+2pb096jgawJy1V
         3Lng49olraIAgb4heRMyfz+l9yec7n+R0FZFsO/4Q7mwDmJFgxJUBs8+pJ1Zzs1zngoR
         Y3hg==
X-Gm-Message-State: ACrzQf1OlrdNO573lKMNCezbLP0643NLjYcG+90ShukmVMZstJgR3w5M
	RAqcXo451DvL15EGkyh8qbbyQpKh
X-Google-Smtp-Source: AMsMyM61PU8VMEVdykE/halpW/Vjok+sDU1/X3s1JOeI2blWYnTwXe/ZZHBaUA7b/HbrY/qGC6Qq6Q==
X-Received: by 2002:a05:622a:1c7:b0:35d:4a61:f2c7 with SMTP id t7-20020a05622a01c700b0035d4a61f2c7mr10802438qtw.578.1664641417854;
        Sat, 01 Oct 2022 09:23:37 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
        by smtp.gmail.com with ESMTPSA id t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Oct 2022 09:23:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 06/42] target/arm: Add is_secure parameter to v7m_read_half_insn
Date: Sat,  1 Oct 2022 09:22:42 -0700
Message-Id: <20221001162318.153420-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: O7c/6a9r2WlK

Remove the use of regime_is_secure from v7m_read_half_insn, using
the new parameter instead.

As it happens, both callers pass true, propagated from the argument
to arm_v7m_mmu_idx_for_secstate which created the mmu_idx argument,
but that is a detail of v7m_handle_execute_nsc we need not expose
to the callee.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
