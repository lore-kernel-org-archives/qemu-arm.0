Received: by 2002:a05:7108:5790:0:0:0:0 with SMTP id cd16csp5207370gdb;
        Wed, 14 Sep 2022 06:05:38 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6CltTHwc5LmBKn6ovS+tk0Z41+x6s2UqflZEccs+1N4vteT5Qd6x5ZgIpCrqBqaaQp7fVt
X-Received: by 2002:a05:620a:29d1:b0:6bb:6c7a:34c2 with SMTP id s17-20020a05620a29d100b006bb6c7a34c2mr26064112qkp.743.1663160738712;
        Wed, 14 Sep 2022 06:05:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663160738; cv=none;
        d=google.com; s=arc-20160816;
        b=hIg2ZA+xvp+Of2QPFrziTGhP0op6h83Y/fxiEgQV0GQWMWvA1vxmgqJaAYG+siMMr6
         pQZFt2SJEHJ888eC76nmpM7N4OhOGkzZEvII7x1K2F/oxvCeHca+J5Jz0bdMqcmnQb97
         YGMIFDYYgjt63woeg5JcPe49fXbf1wyvAhvP4JJ4yth7DTo6Ta1TAT/rRKgpkT64i/pL
         X4C3aRKSo612IGBfC62dWk5QA9JmoDPe4zoKWDENz3SGHigK/d+7tZ1iDAVWSfBI0oJ+
         22f/Iwz0xZU9ri++Q9SbZwSjXwjqUa+2FSLlRuYyqlXWgbMHg+PgwG1vrJIN2fQ71r5x
         LPGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=08B8gQb2lmpmsncem0SFN7qjCMuyv6NQI4M/MAS7Oc4=;
        b=0yTsfm9EpwXmaNGVYqIrmwu1ah+uwRj5cw6Vz6FBdELz/jeEdHxC9KxzeGRmpu42v0
         4FVltnkud7dmwwdITCexXPTkdw5inuq9fazJa25uAS3oB/ALMQudFRyc6dfHEJNlnP0h
         XtyNuRIIz7vyN0Dd5wgHAcVsLO2wJUl9WbZWCRsLpXCkezi6TXU8mY0xU0Jx1+F75F/R
         z/tAl8OdQ8oaj/K8q67FKE+QAXshn0oaxpaUu0x1ngeuhpNK6agduMaJymOhv9fs63fY
         aqq1o3lnT1xk9SSzWctbytEYJK8V2vaKYR0tqxiw6JK8RVmW75DmN1lfuL4qmGhkRTur
         pirg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w+X8lKz4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w21-20020a05620a445500b006ce8e4bbb3dsi745399qkp.2.2022.09.14.06.05.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Sep 2022 06:05:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w+X8lKz4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oYS59-00013U-Lp
	for alex.bennee@linaro.org; Wed, 14 Sep 2022 09:05:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwb-0000Vl-JZ
 for qemu-arm@nongnu.org; Wed, 14 Sep 2022 07:52:42 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:50731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwS-00005k-7c
 for qemu-arm@nongnu.org; Wed, 14 Sep 2022 07:52:41 -0400
Received: by mail-wm1-x333.google.com with SMTP id ay36so1814290wmb.0
 for <qemu-arm@nongnu.org>; Wed, 14 Sep 2022 04:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=08B8gQb2lmpmsncem0SFN7qjCMuyv6NQI4M/MAS7Oc4=;
 b=w+X8lKz4CgWH26KyKERUhL2HiTwlZQYH9eiTMJlNGmRcnkN5cA84RnB0fhX1RZmdKs
 3DYoBTFKtxxFkzxxab0AymTjbfuYoZIdOookm/Kvw7SQfXR/Khye66k6vGSqnXqdKLSP
 uNzOMOZ0iXBrDxPTEHiyUarFsk9Rkj+whNC2C5sMKiZFbT0fkDcrUiLvMAOQiJ9tGa7S
 N4iD+UPwchzkE60uNSTwAu5aECRIf1UEx2T5Ocn8bdFoLjfifXAW+IN0cYM16AhehthY
 LJwKWV5XIQ+DsCfOrUNy9QJEJVy5HXBY+I95rrxxfxSs8GXg8ZzlVsHn7lgJXJOC1cp3
 OU/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=08B8gQb2lmpmsncem0SFN7qjCMuyv6NQI4M/MAS7Oc4=;
 b=XlHKbT7mZ+UL1a0x8oPqiX4N3MCoyziaJR+5sZkiCkyBbzJaE1T7QgYg0coZ+5vb4/
 0DSOEj38gGWHtRcEj9XSn3x9tdK0/6U27o/J1fErRsrrzqK7RSSsiIV0gJV0wC+FK/rC
 pf6H2l++z7WXoQGHnbwjgqXbrhIFhHujqEa55dbjqFbY2ADlLO/OdAYllqcRF2S6/1DH
 yRtquw+5Ai9ORwJk+kBS4sHsHExEZhuJvS0r6rTCgaQkEYh6rjpB5z6bctS8E4A0aPi5
 vzDuuGUQK0pefsV4irsm0XNPRkyqwxGCYgJX8BDCnSQ7tADGkZHwDRIBSzQgJ+h/nUyz
 cslg==
X-Gm-Message-State: ACgBeo39+vO8dhZh75le6+WoeXUu2gxPfw7VgY713YZVs2+zhBgXeOBM
 /EQcQkrvSjLgS3TaOyCjLpYKXkyXuEPSNdJi
X-Received: by 2002:a05:600c:3844:b0:3a6:123:5ac5 with SMTP id
 s4-20020a05600c384400b003a601235ac5mr2793863wmr.102.1663156350871; 
 Wed, 14 Sep 2022 04:52:30 -0700 (PDT)
Received: from stoup.. ([89.101.193.70]) by smtp.gmail.com with ESMTPSA id
 t9-20020a5d6909000000b0022a3a887ceasm13712970wru.49.2022.09.14.04.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 04:52:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 12/20] target/arm: Ignore PMCR.D when PMCR.LC is set
Date: Wed, 14 Sep 2022 12:52:09 +0100
Message-Id: <20220914115217.117532-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914115217.117532-1-richard.henderson@linaro.org>
References: <20220914115217.117532-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: VESoh5jF7LbU

From: Peter Maydell <peter.maydell@linaro.org>

The architecture requires that if PMCR.LC is set (for a 64-bit cycle
counter) then PMCR.D (which enables the clock divider so the counter
ticks every 64 cycles rather than every cycle) should be ignored.  We
were always honouring PMCR.D; fix the bug so we correctly ignore it
in this situation.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220822132358.3524971-5-peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index a348c7407d..f1b20de16d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1172,6 +1172,17 @@ static void pmu_update_irq(CPUARMState *env)
             (env->cp15.c9_pminten & env->cp15.c9_pmovsr));
 }
 
+static bool pmccntr_clockdiv_enabled(CPUARMState *env)
+{
+    /*
+     * Return true if the clock divider is enabled and the cycle counter
+     * is supposed to tick only once every 64 clock cycles. This is
+     * controlled by PMCR.D, but if PMCR.LC is set to enable the long
+     * (64-bit) cycle counter PMCR.D has no effect.
+     */
+    return (env->cp15.c9_pmcr & (PMCRD | PMCRLC)) == PMCRD;
+}
+
 /*
  * Ensure c15_ccnt is the guest-visible count so that operations such as
  * enabling/disabling the counter or filtering, modifying the count itself,
@@ -1184,8 +1195,7 @@ static void pmccntr_op_start(CPUARMState *env)
 
     if (pmu_counter_enabled(env, 31)) {
         uint64_t eff_cycles = cycles;
-        if (env->cp15.c9_pmcr & PMCRD) {
-            /* Increment once every 64 processor clock cycles */
+        if (pmccntr_clockdiv_enabled(env)) {
             eff_cycles /= 64;
         }
 
@@ -1228,8 +1238,7 @@ static void pmccntr_op_finish(CPUARMState *env)
 #endif
 
         uint64_t prev_cycles = env->cp15.c15_ccnt_delta;
-        if (env->cp15.c9_pmcr & PMCRD) {
-            /* Increment once every 64 processor clock cycles */
+        if (pmccntr_clockdiv_enabled(env)) {
             prev_cycles /= 64;
         }
         env->cp15.c15_ccnt_delta = prev_cycles - env->cp15.c15_ccnt;
-- 
2.34.1

