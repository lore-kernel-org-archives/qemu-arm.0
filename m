Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1588229lfg;
        Mon, 16 Aug 2021 11:03:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8mmZoMbgzsBcej2QRtwg8SoMRg/JfVbtASC9kpnczFeqBYU1t8m7CDVo1e8qxm5bfo6lb
X-Received: by 2002:a17:906:455:: with SMTP id e21mr17571048eja.310.1629137005482;
        Mon, 16 Aug 2021 11:03:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629137005; cv=none;
        d=google.com; s=arc-20160816;
        b=fxRfxdVPBSwynt4eu+Xslhj2T1KjxfmxgcwqhCmOk4yQr0ZPMn9covBCgy+MHYYk9J
         MeJcNSzv4jy/x8d9BDawXd5vBnfclGTuTw5HLdKcVFH0p5MZtuvHvXft8Kj9QUcC9PD2
         1mjpRmjfoMIZixG/wC71/bt2RzGum8Ycqkx/WdS7VsdQCdNt/n3efNTtAjVzcnZN2qPj
         h1gdsIjygOkFoZ5+uX3/tsRTZkypzEf6T5aggkZapcFbmq4+dw2rhZ9wLyQlL9IQyLv8
         HZXomemf4driK2eq1xBlzVgvH6aO08onwDAgc69BrLQ/ebVqOmkCR+qzGXGvpUUw3voM
         iKLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=YmPi2qilJJvDJ3O0NVJdAsYq7QQh55dLDlkm9RLnuTU=;
        b=j3kIJukegzIVOFWro90N1GE1FuHriH7xryZiTlKLHg8Oy0SSv7itrg0fORAyA60Ht1
         VX7gcHhRcbZskR18o9n15qD8Y0e6W7ixkYHB31ZDuQjfxoygUJQxn4dXx8Dg+Wt9DKda
         2jMEWzdk5MIz2fQx0d6S5Y+Z3pPislS2gaOrsU2QyJZBcgd4cl43L76pPFeetZVXVbvY
         AEi/IeWKyfox+l8Pue5L0hrSpUaSmcJ9ARB+EUjDUE45p2g6qwzQm5khsymfzt71333u
         OWs/IXlSrw9MNRQ24pcSrJ7APuzQ5Yd+IKFy2DpZ0+P7ixcjyc108ct41pk2TOL82roV
         QGPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EOywpDv+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v12si11155799edc.154.2021.08.16.11.03.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Aug 2021 11:03:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EOywpDv+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mFgxI-0002jF-Ff
	for alex.bennee@linaro.org; Mon, 16 Aug 2021 14:03:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFgx7-0002fG-Ai
 for qemu-arm@nongnu.org; Mon, 16 Aug 2021 14:03:13 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:43659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFgx4-0004cA-MI
 for qemu-arm@nongnu.org; Mon, 16 Aug 2021 14:03:13 -0400
Received: by mail-wr1-x432.google.com with SMTP id z9so24751733wrh.10
 for <qemu-arm@nongnu.org>; Mon, 16 Aug 2021 11:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=YmPi2qilJJvDJ3O0NVJdAsYq7QQh55dLDlkm9RLnuTU=;
 b=EOywpDv+/vlm8XMF4r/AD0WAksYJFjQkVcOBaO0UZQ3xMg0tp8eZshtsxb2uX+6Ymy
 De2i0ofSYCteQhnMR/I3jgEOHXkPCc/h0kY/AaDd3bIkl6Qjt0BR661Z4fu2Au4pnepc
 bOR80eaVOQVAd//oRMLGKAOpT5zHkZSLrfraUlMYjszCWfEhJeet9bsCOpw6lNX4YARE
 3JpDQezU07dIatd6nfuuOMJfnskGkf5TTqHnZRYOuNVtpi/I6JBGh8GV3SjomlSJ6Mu/
 jgYkLlbB3ChVVFT577egnd9jjBmy1P4sV7Ro3aNxR96R3xEi2HgShvi+i9dAqecIfnoO
 t6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YmPi2qilJJvDJ3O0NVJdAsYq7QQh55dLDlkm9RLnuTU=;
 b=s5yt3fwGPhO1wNsNalun7wshFbY2+1U+k5TVU326CqaDeX2UUBh9tQI/c/y9neR3NL
 XeSG+Y7Nd0engf15lY61NWTzjxO4rbzjejeuZmhGVZ7RAK3THEF24A3dtur07pjHr5oe
 8NC2ok49gJAZvoXfiQ+2C8gqBlpKfzvXREYHbFTVG1AJBehGdiL/UyWjgQUxOplLC/1m
 cV7YrU+4YuIDtv3U46UyBIp/xCq6cB8CgvlluB/+hyU765UY8FXdRjMVZqzaMKKDjEPd
 p8/TqkfxWRCIyhxdOW/pUMzQOlpYTc8fUU/8oKr2cJ9jdtTvGzdBE8xK2BE4KiPGVN+m
 xSjQ==
X-Gm-Message-State: AOAM533x0hlekagPeaxEFHS9D0IZ37FU723T86gaZCg5j/93OzFN4v48
 C1VQvmsmQoqejAo5ihKPxx+82Ak42aasVw==
X-Received: by 2002:a5d:51cb:: with SMTP id n11mr11707058wrv.221.1629136989237; 
 Mon, 16 Aug 2021 11:03:09 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id u16sm240053wmc.41.2021.08.16.11.03.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 11:03:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/2] target/arm: Implement HSTR.TJDBX
Date: Mon, 16 Aug 2021 19:03:05 +0100
Message-Id: <20210816180305.20137-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210816180305.20137-1-peter.maydell@linaro.org>
References: <20210816180305.20137-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xtULWGqDKEG6

In v7A, the HSTR register has a TJDBX bit which traps NS EL0/EL1
access to the JOSCR and JMCR trivial Jazelle registers, and also BXJ.
Implement these traps. In v8A this HSTR bit doesn't exist, so don't
trap for v8A CPUs.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h       |  1 +
 target/arm/helper.h    |  2 ++
 target/arm/syndrome.h  |  7 +++++++
 target/arm/helper.c    | 17 +++++++++++++++++
 target/arm/op_helper.c | 16 ++++++++++++++++
 target/arm/translate.c | 12 ++++++++++++
 6 files changed, 55 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index cf3c90f768a..fe47a652e3f 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1537,6 +1537,7 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
 #define SCR_ATA               (1U << 26)
 
 #define HSTR_TTEE (1 << 16)
+#define HSTR_TJDBX (1 << 17)
 
 /* Return the current FPSCR value.  */
 uint32_t vfp_get_fpscr(CPUARMState *env);
diff --git a/target/arm/helper.h b/target/arm/helper.h
index 248569b0cd8..b2050d41755 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -73,6 +73,8 @@ DEF_HELPER_2(v7m_vlldm, void, env, i32)
 
 DEF_HELPER_2(v8m_stackcheck, void, env, i32)
 
+DEF_HELPER_FLAGS_2(check_bxj_trap, TCG_CALL_NO_WG, void, env, i32)
+
 DEF_HELPER_4(access_check_cp_reg, void, env, ptr, i32, i32)
 DEF_HELPER_3(set_cp_reg, void, env, ptr, i32)
 DEF_HELPER_2(get_cp_reg, i32, env, ptr)
diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index 39a31260f2d..8dd88a0cb17 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -36,6 +36,7 @@ enum arm_exception_class {
     EC_ADVSIMDFPACCESSTRAP    = 0x07,
     EC_FPIDTRAP               = 0x08,
     EC_PACTRAP                = 0x09,
+    EC_BXJTRAP                = 0x0a,
     EC_CP14RRTTRAP            = 0x0c,
     EC_BTITRAP                = 0x0d,
     EC_ILLEGALSTATE           = 0x0e,
@@ -215,6 +216,12 @@ static inline uint32_t syn_btitrap(int btype)
     return (EC_BTITRAP << ARM_EL_EC_SHIFT) | btype;
 }
 
+static inline uint32_t syn_bxjtrap(int cv, int cond, int rm)
+{
+    return (EC_BXJTRAP << ARM_EL_EC_SHIFT) | ARM_EL_IL |
+        (cv << 24) | (cond << 20) | rm;
+}
+
 static inline uint32_t syn_insn_abort(int same_el, int ea, int s1ptw, int fsc)
 {
     return (EC_INSNABORT << ARM_EL_EC_SHIFT) | (same_el << ARM_EL_EC_SHIFT)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 262e787f690..97a971bebdb 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7602,6 +7602,21 @@ static CPAccessResult access_jazelle(CPUARMState *env, const ARMCPRegInfo *ri,
     return CP_ACCESS_OK;
 }
 
+static CPAccessResult access_joscr_jmcr(CPUARMState *env,
+                                        const ARMCPRegInfo *ri, bool isread)
+{
+    /*
+     * HSTR.TJDBX traps JOSCR and JMCR accesses, but it exists only
+     * in v7A, not in v8A.
+     */
+    if (!arm_feature(env, ARM_FEATURE_V8) &&
+        arm_current_el(env) < 2 && !arm_is_secure_below_el3(env) &&
+        (env->cp15.hstr_el2 & HSTR_TJDBX)) {
+        return CP_ACCESS_TRAP_EL2;
+    }
+    return CP_ACCESS_OK;
+}
+
 static const ARMCPRegInfo jazelle_regs[] = {
     { .name = "JIDR",
       .cp = 14, .crn = 0, .crm = 0, .opc1 = 7, .opc2 = 0,
@@ -7609,9 +7624,11 @@ static const ARMCPRegInfo jazelle_regs[] = {
       .type = ARM_CP_CONST, .resetvalue = 0 },
     { .name = "JOSCR",
       .cp = 14, .crn = 1, .crm = 0, .opc1 = 7, .opc2 = 0,
+      .accessfn = access_joscr_jmcr,
       .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
     { .name = "JMCR",
       .cp = 14, .crn = 2, .crm = 0, .opc1 = 7, .opc2 = 0,
+      .accessfn = access_joscr_jmcr,
       .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
     REGINFO_SENTINEL
 };
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index e98fd863057..70b42b55fd0 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -224,6 +224,22 @@ void HELPER(setend)(CPUARMState *env)
     arm_rebuild_hflags(env);
 }
 
+void HELPER(check_bxj_trap)(CPUARMState *env, uint32_t rm)
+{
+    /*
+     * Only called if in NS EL0 or EL1 for a BXJ for a v7A CPU;
+     * check if HSTR.TJDBX means we need to trap to EL2.
+     */
+    if (env->cp15.hstr_el2 & HSTR_TJDBX) {
+        /*
+         * We know the condition code check passed, so take the IMPDEF
+         * choice to always report CV=1 COND 0xe
+         */
+        uint32_t syn = syn_bxjtrap(1, 0xe, rm);
+        raise_exception_ra(env, EXCP_HYP_TRAP, syn, 2, GETPC());
+    }
+}
+
 #ifndef CONFIG_USER_ONLY
 /* Function checks whether WFx (WFI/WFE) instructions are set up to be trapped.
  * The function returns the target EL (1-3) if the instruction is to be trapped;
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 80c282669f0..80eb1b7eae9 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -6440,6 +6440,18 @@ static bool trans_BXJ(DisasContext *s, arg_BXJ *a)
     if (!ENABLE_ARCH_5J || arm_dc_feature(s, ARM_FEATURE_M)) {
         return false;
     }
+    /*
+     * v7A allows BXJ to be trapped via HSTR.TJDBX. We don't waste a
+     * TBFLAGS bit on a basically-never-happens case, so call a helper
+     * function to check for the trap and raise the exception if needed
+     * (passing it the register number for the syndrome value).
+     * v8A doesn't have this HSTR bit.
+     */
+    if (!arm_dc_feature(s, ARM_FEATURE_V8) &&
+        arm_dc_feature(s, ARM_FEATURE_EL2) &&
+        s->current_el < 2 && s->ns) {
+        gen_helper_check_bxj_trap(cpu_env, tcg_constant_i32(a->rm));
+    }
     /* Trivial implementation equivalent to bx.  */
     gen_bx(s, load_reg(s, a->rm));
     return true;
-- 
2.20.1

