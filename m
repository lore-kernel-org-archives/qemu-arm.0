Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp12669wrs;
        Tue, 20 Aug 2019 14:32:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwHVk323uLn4O0ous9dv+NOcTO/MJbbdODo22fEQi3jQ8YYd6hwRF9WIilXtBFa4Nh1pfH2
X-Received: by 2002:a0c:e4c1:: with SMTP id g1mr14956097qvm.92.1566336776393;
        Tue, 20 Aug 2019 14:32:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566336776; cv=none;
        d=google.com; s=arc-20160816;
        b=tP+FA+M/fUa4VKxo+1ubKf6pIoGa/zlXja+FkRUPD4IMRK9dKjW7z0Q2Bk5jkmbmer
         5CPHkjVXcterlpo4JXLUUIm7F4HN3Vore6QAjEXT45Y7U+QHBvG6Id3+XSV+AHKI5e4S
         izmSL5y/yx7bqP5Fbhp/JKCCz6UL2keId5w7sshcZLJ+og9Feo7vt/F2DzjSykhmXjUn
         d9ZCKYYJZdJ0+FK+MoRTzBze+2t85nJUfZLUvhi/cKKhbyqNTDx5kSK40AhouMEgjNig
         LT/Vvgj+o2TJ7UUgAt2NQCH5URUAWFV6stl3Bc7bc/huk16uXZU7kW2zdAIicVZedp7I
         YuSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=8b+r+7+wrJNiKK+el1m+NNiACbtE+S7w+cGIQmCdH8g=;
        b=Vq+BJ4Fa7UT4SJx/ADlWjieNALpoSwc5OL662ibytZKxgYxlwdL1aT/t+mKY6ByXwq
         nLV9JlGzmTdoRbwyd7e+8JC/oX38xFu0bG8iYfAQzWBl1gBPVULOkEKNdcShUozct/NO
         FwFGCBNwQlfIZ2sNFWDWHdbtfWKGotXRHaNz0RZiA/9qMT1Zm319r59JJo9TY1yVNZi+
         IpcL3INgvbGGW4gVNhrYVxVSBPSPygRbrDFyMmQ+bej4bjrJyupkOua39V3fgdP+uiF3
         4dx6QscQoXOiwbP/j7ckksFdx5FL/T8jDQVkcBYtM1KxKeI+B+kpqEP2cnUVg+z8rLrH
         XLWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=srraqAe9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s7si11302802qkc.12.2019.08.20.14.32.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Aug 2019 14:32:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=srraqAe9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i0BkN-00065b-E8
	for alex.bennee@linaro.org; Tue, 20 Aug 2019 17:32:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53974)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i0BM1-0000KW-Of
 for qemu-arm@nongnu.org; Tue, 20 Aug 2019 17:07:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i0BLz-0000AQ-Cg
 for qemu-arm@nongnu.org; Tue, 20 Aug 2019 17:07:45 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:43114)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i0BLz-00005d-33
 for qemu-arm@nongnu.org; Tue, 20 Aug 2019 17:07:43 -0400
Received: by mail-pg1-x543.google.com with SMTP id k3so2704pgb.10
 for <qemu-arm@nongnu.org>; Tue, 20 Aug 2019 14:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=8b+r+7+wrJNiKK+el1m+NNiACbtE+S7w+cGIQmCdH8g=;
 b=srraqAe90z7WTNHwfkHfQkfGqnTVgX31c7VXOoaffni+fDLjsAZQ1G25thp+51wEwv
 EmEjuk4m7ZhknJE0TtV+5+RuyK9gA8IFRioNHsjPRR+p0uuGtQYrn2Cho3ff7e3THz3R
 6q9hx4CcC0WgMusZjgwkuEtq1E9E5mAjknbq0Pp5hVZs/pfDoJdvYGr30vHn9frBbroX
 x4k9LKbUmxmGybX7/7Fe5ZTl/AFlFtHOTP9y8SsQ2WZB1L6xi+eLUR3ai0i6o5FTACG8
 bhDIx3Wmr2AaYFfkXI6k56s3V8YbIRUl+HSVpEzMTnDuvDPB9QdUdfk0DMiTBJGeFE99
 DN1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=8b+r+7+wrJNiKK+el1m+NNiACbtE+S7w+cGIQmCdH8g=;
 b=ThyR8zWxIci57HvhoKN6DziM7NlswacktU7oQEhvv44f0qlqiSlcP4f5nwb3Jt3T8l
 3U7e+jZirRvR5fOREvX1W+j6eJZkPzf93+vX4QEe03QQwNXUC2aq5khpya1P8MTWrx5a
 sYhW1Cz5ORROPVv1lcJQsxhK/QUbsUS8Ikjxbr0WYD/gGPPfWUVBYdnw/2mp56lLMwLr
 6yoIwcgxqYyQiXWoj82ZJgBv9QeMYp5IVjOrW4grGgdSV6lgESk4vdz+akWCvp7B/nl4
 eiCK8tcta33K+aJGcTILCCbyqdcW7h63fTIFxpg1GwvPh3guZZKCtmySrmgfR04nGNct
 Lfbw==
X-Gm-Message-State: APjAAAWsQ6CEJUXLFLxNSX16KATns7jVfyC8YLseeGrhizXmaUcPJoF5
 hjIXHAldMjZcKFEesYNDeu5gEg==
X-Received: by 2002:aa7:842f:: with SMTP id q15mr31988912pfn.250.1566335258741; 
 Tue, 20 Aug 2019 14:07:38 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id k22sm21690743pfk.157.2019.08.20.14.07.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 14:07:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 20 Aug 2019 14:07:15 -0700
Message-Id: <20190820210720.18976-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190820210720.18976-1-richard.henderson@linaro.org>
References: <20190820210720.18976-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: [Qemu-arm] [PATCH v5 12/17] target/arm: Add arm_rebuild_hflags
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
X-TUID: qtxMYwMyZ5MB

This function assumes nothing about the current state of the cpu,
and writes the computed value to env->hflags.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    |  6 ++++++
 target/arm/helper.c | 30 ++++++++++++++++++++++--------
 2 files changed, 28 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9606222942..602c879395 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3293,6 +3293,12 @@ void arm_register_pre_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook,
 void arm_register_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook, void
         *opaque);
 
+/**
+ * arm_rebuild_hflags:
+ * Rebuild the cached TBFLAGS for arbitrary changed processor state.
+ */
+void arm_rebuild_hflags(CPUARMState *env);
+
 /**
  * aa32_vfp_dreg:
  * Return a pointer to the Dn register within env in 32-bit mode.
diff --git a/target/arm/helper.c b/target/arm/helper.c
index b905d61898..83ae33dae5 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11160,17 +11160,35 @@ static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
     return rebuild_hflags_common(env, fp_el, mmu_idx, flags);
 }
 
+static uint32_t rebuild_hflags_internal(CPUARMState *env)
+{
+    int el = arm_current_el(env);
+    int fp_el = fp_exception_el(env, el);
+    ARMMMUIdx mmu_idx = arm_mmu_idx(env);
+
+    if (is_a64(env)) {
+        return rebuild_hflags_a64(env, el, fp_el, mmu_idx);
+    } else if (arm_feature(env, ARM_FEATURE_M)) {
+        return rebuild_hflags_m32(env, fp_el, mmu_idx);
+    } else {
+        return rebuild_hflags_a32(env, fp_el, mmu_idx);
+    }
+}
+
+void arm_rebuild_hflags(CPUARMState *env)
+{
+    env->hflags = rebuild_hflags_internal(env);
+}
+
 void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
                           target_ulong *cs_base, uint32_t *pflags)
 {
-    ARMMMUIdx mmu_idx = arm_mmu_idx(env);
-    int current_el = arm_current_el(env);
-    int fp_el = fp_exception_el(env, current_el);
     uint32_t flags, pstate_for_ss;
 
+    flags = rebuild_hflags_internal(env);
+
     if (is_a64(env)) {
         *pc = env->pc;
-        flags = rebuild_hflags_a64(env, current_el, fp_el, mmu_idx);
         if (cpu_isar_feature(aa64_bti, env_archcpu(env))) {
             flags = FIELD_DP32(flags, TBFLAG_A64, BTYPE, env->btype);
         }
@@ -11179,8 +11197,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
         *pc = env->regs[15];
 
         if (arm_feature(env, ARM_FEATURE_M)) {
-            flags = rebuild_hflags_m32(env, fp_el, mmu_idx);
-
             if (arm_feature(env, ARM_FEATURE_M_SECURITY) &&
                 FIELD_EX32(env->v7m.fpccr[M_REG_S], V7M_FPCCR, S)
                 != env->v7m.secure) {
@@ -11204,8 +11220,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
                 flags = FIELD_DP32(flags, TBFLAG_A32, LSPACT, 1);
             }
         } else {
-            flags = rebuild_hflags_a32(env, fp_el, mmu_idx);
-
             /*
              * Note that XSCALE_CPAR shares bits with VECSTRIDE.
              * Note that VECLEN+VECSTRIDE are RES0 for M-profile.
-- 
2.17.1

