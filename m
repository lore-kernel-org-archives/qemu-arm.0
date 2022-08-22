Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp913312ejc;
        Mon, 22 Aug 2022 06:33:25 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6YasxF+fnwACqAYVK8Y8GhRcPnVQq+Y+hV7Jh0HRKJOXJthwPnMOWknOfJb6KK+32mjvWP
X-Received: by 2002:a0c:9d01:0:b0:474:4c67:8f96 with SMTP id m1-20020a0c9d01000000b004744c678f96mr15556485qvf.32.1661175205197;
        Mon, 22 Aug 2022 06:33:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661175205; cv=none;
        d=google.com; s=arc-20160816;
        b=BNpiWC9j6RbCYcTvIyZgzNGvIavUJ+9O6K5fYxA9m8GpdDy+6F971uP4HRg7BgI4ko
         3+EmR4KACsZGL2aPALHXPgdu0ACiHlIcojN7tZPLKtX5kGlkGSGxIyG8YHl66qTpEmbb
         Kibr80Ol8mUjuvx0H4mXClIZtaajK7bvrxAW02iAqQbHFgAMGIeFnOaGa6/zqL2dWK1M
         ELGbYDDDtNVZ7j187CVb8ZIA/zz+XcLwQN2yooxtycDQRGlop+m6Wv6qO/QK9yjcDvrl
         wBEqo0q7sfpKz4122IHyUnNS1smOpEe8CKUB5QDkaoomZCtKqoX1J8YmxxsfWClNnP3b
         /dxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vD+of0yf04XIK3wSlDEJY0alv64T6b7yHWK7FZo8BaI=;
        b=DcAhyw5yH8fOcsMsdmwOofD+5uG/282f5UOh0OoC9+Uo7icnlo3eTa8rqq17tqN0l+
         AQIbtsmIAbbwkBKcZYo00pBjtQLFJ3cJzhVYimJ4yN9VYE/OB4OdSZKtQJjYtRAUt0vp
         n2iVCH2QLqlvGRSkCsnLBUvZd+cjpNg98KjqWeI39JVmuTIeKmJ0gnNlLB775+50OJ3t
         HjCi/lEXqPRSKmWFb8Y9Q8sEUa9Kc30eKo4dDi0AnoKHPd+x4th+OH5xp3nnnotWBFg/
         /au4RDfpbn/VpMH2s7A17cJp4jzrXeUlpimxGAQYCLme7cP8FRfV5IFJe1NkmKcd7o4y
         DfIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tfLW+4yB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r2-20020a0562140c8200b00496a6862c05si4628975qvr.203.2022.08.22.06.33.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Aug 2022 06:33:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tfLW+4yB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQ7YS-0001YU-Ng
	for alex.bennee@linaro.org; Mon, 22 Aug 2022 09:33:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ7PZ-0006ER-Ii
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 09:24:13 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:40511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ7PX-0001gZ-KW
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 09:24:13 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 h204-20020a1c21d5000000b003a5b467c3abso7761292wmh.5
 for <qemu-arm@nongnu.org>; Mon, 22 Aug 2022 06:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=vD+of0yf04XIK3wSlDEJY0alv64T6b7yHWK7FZo8BaI=;
 b=tfLW+4yBtFeAnedxTh1SZ1u4El1droQQ7cxOdJUdrrxFG3dEUEi4Rwxdr3PDspX5dB
 eK8TcdfHcLi10mYg0Sj4hJfMvTNs3jajaBzhLc7aLHNXBDcWHIaj/Fcm9aniyBMD0KIc
 BJI6fQMdgUerIKBuU/b+JMuUPnFu2cATjvLlVVI9tP4JGHcoTN/TK5BOnzz6k2kOtegm
 v4TRsMnIqzW7mTEcLuCCFhtHNm6Ppy1+i8u/EBDHTDEZZAL6/Bw2SZC++rd5MBf8aPx3
 /VqAb6M4Cd+Q19EU71VAn3Pmik1Ow3rKbbSZWRbCWAstkZufaTNycG5CViRUgJ+lx2lR
 8tqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=vD+of0yf04XIK3wSlDEJY0alv64T6b7yHWK7FZo8BaI=;
 b=yZLIeB3nJpLJ196Pb/P/ecNTdVGxbITAR/rbdq23+3sbRFQqnDBV5gPWyE3E/oVq8G
 rOCxgDYIzdv078zPOymM5f6J2VSgcxniyPHebeibqkNOcoYMgdDEDMwYQOBCM3cJser5
 D9Jrt/YfWkXvwTRh/AMZQW/7dAhWv124Fwpi1voONuV3qQDT2uwSR9diDVmpIDjPo8pl
 /E1iKXXsZTqu1etvjpHDp7FTMiT6toHuA9KrOtFBcGeJaWHi54dSriyYM4vqBKm0s+VD
 B5nwjwyebdhKBuH0cM7AZh+gpSzvilRElBh0tkyfTg++4RUI68xpWmS7Le3iWfykCNDv
 qITQ==
X-Gm-Message-State: ACgBeo067fzhcNSeeNR4KARBW5pTV12iDw8I/M984RrtENiqx3Z2DMwC
 rLCEpAR4tnPaGqApk4DBECrAPi8V+bv7rw==
X-Received: by 2002:a05:600c:3d91:b0:3a5:4132:b6a0 with SMTP id
 bi17-20020a05600c3d9100b003a54132b6a0mr11515151wmb.126.1661174650005; 
 Mon, 22 Aug 2022 06:24:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020adff98c000000b0021f13097d6csm11527946wrr.16.2022.08.22.06.24.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 06:24:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 09/10] target/arm: Support 64-bit event counters for
 FEAT_PMUv3p5
Date: Mon, 22 Aug 2022 14:23:57 +0100
Message-Id: <20220822132358.3524971-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220822132358.3524971-1-peter.maydell@linaro.org>
References: <20220822132358.3524971-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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
X-TUID: k1pfk5WQ1Jnu

With FEAT_PMUv3p5, the event counters are now 64 bit, rather than 32
bit.  (Previously, only the cycle counter could be 64 bit, and other
event counters were always 32 bits).  For any given event counter,
whether the overflow event is noted for overflow from bit 31 or from
bit 63 is controlled by a combination of PMCR.LP, MDCR_EL2.HLP and
MDCR_EL2.HPMN.

Implement the 64-bit event counter handling.  We choose to make our
counters always 64 bits, and mask out the top 32 bits on read or
write of PMXEVCNTR for CPUs which don't have FEAT_PMUv3p5.

(Note that the changes to pmenvcntr_op_start() and
pmenvcntr_op_finish() bring their logic closer into line with that of
pmccntr_op_start() and pmccntr_op_finish(), which already had to cope
with the overflow being either at 32 or 64 bits.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h       |  1 +
 target/arm/internals.h |  3 +-
 target/arm/helper.c    | 62 ++++++++++++++++++++++++++++++++++++------
 3 files changed, 57 insertions(+), 9 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 1f6ccc6f217..be79394dcc7 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1332,6 +1332,7 @@ FIELD(CPTR_EL3, TTA, 20, 1)
 FIELD(CPTR_EL3, TAM, 30, 1)
 FIELD(CPTR_EL3, TCPAC, 31, 1)
 
+#define MDCR_HLP      (1U << 26)  /* MDCR_EL2 */
 #define MDCR_SCCD     (1U << 23)  /* MDCR_EL3 */
 #define MDCR_HCCD     (1U << 23)  /* MDCR_EL2 */
 #define MDCR_EPMAD    (1U << 21)
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 83526166de0..bf60cd5f845 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1256,6 +1256,7 @@ enum MVEECIState {
 /* Definitions for the PMU registers */
 #define PMCRN_MASK  0xf800
 #define PMCRN_SHIFT 11
+#define PMCRLP  0x80
 #define PMCRLC  0x40
 #define PMCRDP  0x20
 #define PMCRX   0x10
@@ -1267,7 +1268,7 @@ enum MVEECIState {
  * Mask of PMCR bits writable by guest (not including WO bits like C, P,
  * which can be written as 1 to trigger behaviour but which stay RAZ).
  */
-#define PMCR_WRITABLE_MASK (PMCRLC | PMCRDP | PMCRX | PMCRD | PMCRE)
+#define PMCR_WRITABLE_MASK (PMCRLP | PMCRLC | PMCRDP | PMCRX | PMCRD | PMCRE)
 
 #define PMXEVTYPER_P          0x80000000
 #define PMXEVTYPER_U          0x40000000
diff --git a/target/arm/helper.c b/target/arm/helper.c
index d22debcd57b..133ca39700f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1084,7 +1084,8 @@ static CPAccessResult pmreg_access_ccntr(CPUARMState *env,
  * We use these to decide whether we need to wrap a write to MDCR_EL2
  * or MDCR_EL3 in pmu_op_start()/pmu_op_finish() calls.
  */
-#define MDCR_EL2_PMU_ENABLE_BITS (MDCR_HPME | MDCR_HPMD | MDCR_HPMN | MDCR_HCCD)
+#define MDCR_EL2_PMU_ENABLE_BITS \
+    (MDCR_HPME | MDCR_HPMD | MDCR_HPMN | MDCR_HCCD | MDCR_HLP)
 #define MDCR_EL3_PMU_ENABLE_BITS (MDCR_SPME | MDCR_SCCD)
 
 /* Returns true if the counter (pass 31 for PMCCNTR) should count events using
@@ -1193,6 +1194,32 @@ static bool pmccntr_clockdiv_enabled(CPUARMState *env)
     return (env->cp15.c9_pmcr & (PMCRD | PMCRLC)) == PMCRD;
 }
 
+static bool pmevcntr_is_64_bit(CPUARMState *env, int counter)
+{
+    /* Return true if the specified event counter is configured to be 64 bit */
+
+    /* This isn't intended to be used with the cycle counter */
+    assert(counter < 31);
+
+    if (!cpu_isar_feature(any_pmuv3p5, env_archcpu(env))) {
+        return false;
+    }
+
+    if (arm_feature(env, ARM_FEATURE_EL2)) {
+        /*
+         * MDCR_EL2.HLP still applies even when EL2 is disabled in the
+         * current security state, so we don't use arm_mdcr_el2_eff() here.
+         */
+        bool hlp = env->cp15.mdcr_el2 & MDCR_HLP;
+        int hpmn = env->cp15.mdcr_el2 & MDCR_HPMN;
+
+        if (hpmn != 0 && counter >= hpmn) {
+            return hlp;
+        }
+    }
+    return env->cp15.c9_pmcr & PMCRLP;
+}
+
 /*
  * Ensure c15_ccnt is the guest-visible count so that operations such as
  * enabling/disabling the counter or filtering, modifying the count itself,
@@ -1269,9 +1296,11 @@ static void pmevcntr_op_start(CPUARMState *env, uint8_t counter)
     }
 
     if (pmu_counter_enabled(env, counter)) {
-        uint32_t new_pmevcntr = count - env->cp15.c14_pmevcntr_delta[counter];
+        uint64_t new_pmevcntr = count - env->cp15.c14_pmevcntr_delta[counter];
+        uint64_t overflow_mask = pmevcntr_is_64_bit(env, counter) ?
+            1ULL << 63 : 1ULL << 31;
 
-        if (env->cp15.c14_pmevcntr[counter] & ~new_pmevcntr & INT32_MIN) {
+        if (env->cp15.c14_pmevcntr[counter] & ~new_pmevcntr & overflow_mask) {
             env->cp15.c9_pmovsr |= (1 << counter);
             pmu_update_irq(env);
         }
@@ -1286,9 +1315,13 @@ static void pmevcntr_op_finish(CPUARMState *env, uint8_t counter)
 #ifndef CONFIG_USER_ONLY
         uint16_t event = env->cp15.c14_pmevtyper[counter] & PMXEVTYPER_EVTCOUNT;
         uint16_t event_idx = supported_event_map[event];
-        uint64_t delta = UINT32_MAX -
-            (uint32_t)env->cp15.c14_pmevcntr[counter] + 1;
-        int64_t overflow_in = pm_events[event_idx].ns_per_count(delta);
+        uint64_t delta = -(env->cp15.c14_pmevcntr[counter] + 1);
+        int64_t overflow_in;
+
+        if (!pmevcntr_is_64_bit(env, counter)) {
+            delta = (uint32_t)delta;
+        }
+        overflow_in = pm_events[event_idx].ns_per_count(delta);
 
         if (overflow_in > 0) {
             int64_t overflow_at;
@@ -1375,6 +1408,8 @@ static void pmswinc_write(CPUARMState *env, const ARMCPRegInfo *ri,
                           uint64_t value)
 {
     unsigned int i;
+    uint64_t overflow_mask, new_pmswinc;
+
     for (i = 0; i < pmu_num_counters(env); i++) {
         /* Increment a counter's count iff: */
         if ((value & (1 << i)) && /* counter's bit is set */
@@ -1388,9 +1423,12 @@ static void pmswinc_write(CPUARMState *env, const ARMCPRegInfo *ri,
              * Detect if this write causes an overflow since we can't predict
              * PMSWINC overflows like we can for other events
              */
-            uint32_t new_pmswinc = env->cp15.c14_pmevcntr[i] + 1;
+            new_pmswinc = env->cp15.c14_pmevcntr[i] + 1;
 
-            if (env->cp15.c14_pmevcntr[i] & ~new_pmswinc & INT32_MIN) {
+            overflow_mask = pmevcntr_is_64_bit(env, i) ?
+                1ULL << 63 : 1ULL << 31;
+
+            if (env->cp15.c14_pmevcntr[i] & ~new_pmswinc & overflow_mask) {
                 env->cp15.c9_pmovsr |= (1 << i);
                 pmu_update_irq(env);
             }
@@ -1597,6 +1635,10 @@ static uint64_t pmxevtyper_read(CPUARMState *env, const ARMCPRegInfo *ri)
 static void pmevcntr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                              uint64_t value, uint8_t counter)
 {
+    if (!cpu_isar_feature(any_pmuv3p5, env_archcpu(env))) {
+        /* Before FEAT_PMUv3p5, top 32 bits of event counters are RES0 */
+        value &= MAKE_64BIT_MASK(0, 32);
+    }
     if (counter < pmu_num_counters(env)) {
         pmevcntr_op_start(env, counter);
         env->cp15.c14_pmevcntr[counter] = value;
@@ -1616,6 +1658,10 @@ static uint64_t pmevcntr_read(CPUARMState *env, const ARMCPRegInfo *ri,
         pmevcntr_op_start(env, counter);
         ret = env->cp15.c14_pmevcntr[counter];
         pmevcntr_op_finish(env, counter);
+        if (!cpu_isar_feature(any_pmuv3p5, env_archcpu(env))) {
+            /* Before FEAT_PMUv3p5, top 32 bits of event counters are RES0 */
+            ret &= MAKE_64BIT_MASK(0, 32);
+        }
         return ret;
     } else {
       /* We opt to behave as a RAZ/WI when attempts to access PM[X]EVCNTR
-- 
2.25.1

