Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1225105wrm;
        Fri, 18 Oct 2019 10:45:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwC35jbit2MSge+UHEo8fxYdU7Ue5WhUHv7ntsl/J+0bzrmguLMKbvYP1wA8EhFHSpwd8a/
X-Received: by 2002:ac8:44d9:: with SMTP id b25mr11185682qto.347.1571420737325;
        Fri, 18 Oct 2019 10:45:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571420737; cv=none;
        d=google.com; s=arc-20160816;
        b=TGjREIqYd9m8nf3IbVjmjInVquvaFvTRAG9QAGMaAHXaVGYmxRf4d6h4vWfK5qhDnq
         uYH2K46gh8Jf7PSIsy6KGXCNUNhVHP4+UOcmgdC1yYLGJ8izmbdIahxmSDuak6Z42Okl
         +PlpJR0mYnK9EcyGvQ6wWU2GkCaJpouqMZlQsUCZg27kzTVNjCvgwnpzeOT7mxF5KqBQ
         4UkpRjSRrGEul4oSesE24E6XUanTUAyLz4VEbFOgLScKzM6wo3x4V9h2v6W6/Af0M3VL
         DBE0J7Zf7rSgx6MKekhepUt7nNmCNmKEX++kraZGnoHMVTkmIzFjKhk19n5S7sWXdqAk
         QkhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=+UgAJ6EhcwGdb7pezBRTrZ79eaC+NjRs0dqrTWfzTFo=;
        b=zpnfJFDuskloEjM7pGJASbbI1QlU3U7Luc43UkoVNHHNJgbOe60UaUzMbk5ixWYKbg
         4MuN3b1WBmoy3xbEkPq2/VKrx7q4mlSDLRq/rmZ9WrTHU/hg/CmE/ftnRIZ2+wJYhwHf
         Yqw9+fsDB7vRWmvHqHA9yT14JPtx2taMQncLNZemkibEXnI2sqdN9PNYnB9H4G9iXkZ+
         5NBlqt4yNAdhVGQzio/V4fm6i9oY9iJWWwnSOwYXMcnu16W0M5wJG8Da+O5stsdQ2VOS
         yW9T9hEObg2OwGp96jaesCGCqB1LtpX1NpbLVsFFutlyql+gYUWjFC5NEi8L0ZgiH9bg
         rNfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XlSNcfVE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m128si6295872qkc.22.2019.10.18.10.45.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 10:45:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XlSNcfVE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLWJk-0007Iu-Em
	for alex.bennee@linaro.org; Fri, 18 Oct 2019 13:45:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59072)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iLWIp-0006PB-PG
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 13:44:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iLWIn-0005Ln-Oq
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 13:44:39 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:33193)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iLWIn-0005Kd-Ij
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 13:44:37 -0400
Received: by mail-pl1-x643.google.com with SMTP id d22so3204946pls.0
 for <qemu-arm@nongnu.org>; Fri, 18 Oct 2019 10:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+UgAJ6EhcwGdb7pezBRTrZ79eaC+NjRs0dqrTWfzTFo=;
 b=XlSNcfVErnQtom0GJDyUW051sL+xfl4993QiT/Izb3Ol9gNuFHuxiuVohqlNjAQ+OE
 zXTrPvaoTrd+PB4iEhEdvRrzMcFTRnYLYMvd5OdGWpKewCpDx7vOnAvEjHALLuEMdq3i
 g6oSmw8JPpnS+/K+u1RMC/xBpSnx97gWZcPom0ZoQLCVgJKOjyOjVMwd9ypsfFEBJn/2
 iaF5Qn636yH/0x/patzvI1XMGzC1SCr8enowIZazAXTH/ZNaOh5PiVCCs+dd5pdCbbQw
 ViRY0rdo6TLbmJNk9lJK5Py6vMUpXVQyh6LT96dCpTic4yT6UK4EwL/47GgqCz7SdR14
 w3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+UgAJ6EhcwGdb7pezBRTrZ79eaC+NjRs0dqrTWfzTFo=;
 b=Z5Hi2hHCZN5ttmqaVuEPVLv7ogT6j8QvAZRSDeS7YC3DWJuYJpOUUmqX8LhiQcc0E5
 3OrW2MXXe2gkKX2dgmfTADBZuuhZrCIFe7IElqZDfOWA9x9pJ4l7vAIhvA+tvH3IFUHj
 g2YedRUYr4YgYOa20pyQbSYn0uAOmROEY8+7titf6R2ipboZVlWmdwe2xo8A2dOvHSAY
 gcQkq5CsNjMIX0uDy/HyU6wWDL5N1KgEbkeDJsLyqBBygMQ6BejzpRLTNvcyPUGW18v5
 WEhp87NwaY7TFiNxhKbZugu8enHgWggXQhf6B35z7/VBypxnJ/cHv/yevonGbmz/UE3s
 ImHA==
X-Gm-Message-State: APjAAAV2w3UqeXAfdECa0z3DtLxn199YnRLKtuct62NpvuXij4XDaZg1
 7pMAgeWf0p0H9hih9tCdJqYBHa623vA=
X-Received: by 2002:a17:902:8507:: with SMTP id
 bj7mr10594199plb.73.1571420675884; 
 Fri, 18 Oct 2019 10:44:35 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d20sm7857534pfq.88.2019.10.18.10.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 10:44:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 03/22] target/arm: Split out rebuild_hflags_common_32
Date: Fri, 18 Oct 2019 10:44:12 -0700
Message-Id: <20191018174431.1784-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191018174431.1784-1-richard.henderson@linaro.org>
References: <20191018174431.1784-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GPfT0PW5txRJ

Create a function to compute the values of the TBFLAG_A32 bits
that will be cached, and are used by all profiles.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 69da04786e..f05d042474 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11070,6 +11070,15 @@ static uint32_t rebuild_hflags_common(CPUARMState *env, int fp_el,
     return flags;
 }
 
+static uint32_t rebuild_hflags_common_32(CPUARMState *env, int fp_el,
+                                         ARMMMUIdx mmu_idx, uint32_t flags)
+{
+    flags = FIELD_DP32(flags, TBFLAG_A32, SCTLR_B, arm_sctlr_b(env));
+    flags = FIELD_DP32(flags, TBFLAG_A32, NS, !access_secure_reg(env));
+
+    return rebuild_hflags_common(env, fp_el, mmu_idx, flags);
+}
+
 static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
                                    ARMMMUIdx mmu_idx)
 {
@@ -11141,7 +11150,7 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
     ARMMMUIdx mmu_idx = arm_mmu_idx(env);
     int current_el = arm_current_el(env);
     int fp_el = fp_exception_el(env, current_el);
-    uint32_t flags = 0;
+    uint32_t flags;
 
     if (is_a64(env)) {
         *pc = env->pc;
@@ -11151,12 +11160,11 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
         }
     } else {
         *pc = env->regs[15];
+        flags = rebuild_hflags_common_32(env, fp_el, mmu_idx, 0);
         flags = FIELD_DP32(flags, TBFLAG_A32, THUMB, env->thumb);
         flags = FIELD_DP32(flags, TBFLAG_A32, VECLEN, env->vfp.vec_len);
         flags = FIELD_DP32(flags, TBFLAG_A32, VECSTRIDE, env->vfp.vec_stride);
         flags = FIELD_DP32(flags, TBFLAG_A32, CONDEXEC, env->condexec_bits);
-        flags = FIELD_DP32(flags, TBFLAG_A32, SCTLR_B, arm_sctlr_b(env));
-        flags = FIELD_DP32(flags, TBFLAG_A32, NS, !access_secure_reg(env));
         if (env->vfp.xregs[ARM_VFP_FPEXC] & (1 << 30)
             || arm_el_is_aa64(env, 1) || arm_feature(env, ARM_FEATURE_M)) {
             flags = FIELD_DP32(flags, TBFLAG_A32, VFPEN, 1);
@@ -11166,8 +11174,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
             flags = FIELD_DP32(flags, TBFLAG_A32,
                                XSCALE_CPAR, env->cp15.c15_cpar);
         }
-
-        flags = rebuild_hflags_common(env, fp_el, mmu_idx, flags);
     }
 
     /* The SS_ACTIVE and PSTATE_SS bits correspond to the state machine
-- 
2.17.1

