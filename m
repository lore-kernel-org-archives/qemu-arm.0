Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1027885wrm;
        Fri, 11 Oct 2019 09:08:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzjv/H9przx1PYd0iNSx7R43lnleTQG/P/KkypcP5c8Ep2XEGSScYMNo4q7eJ9/SW/Y6fIO
X-Received: by 2002:a05:6214:1234:: with SMTP id p20mr17085643qvv.204.1570810097208;
        Fri, 11 Oct 2019 09:08:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570810097; cv=none;
        d=google.com; s=arc-20160816;
        b=tNZ0mzAgfRVLWiBuRblUJ5Z2jP/fzYsex/UDwfMwAxbBpFfOVo4OSa2vWvmfTntIjG
         ohSQgC3jQtkW1gbqkIuG1BqN7wWxrfHAZgiBU/J65ovJkIo7xRmgQXnMg1pKPWvqzU+Q
         NF1wHppKQ/bcur4sB5/MyYO4JgAaXFnJOFsj+Jki1ESY12hobwVLHZ6QYZfRiqLgQDT1
         lQDdNerrJoS7HVY/CzzBmMZioXHDUuOBDcX1rfZ+LFPT97lJVFyO8MiJG4Yf6hRjSpUj
         SawME9x+/xp/2rSXKHSVwqXoHwkOXro9iVBFc8PJG13ldaGk8NXR6Ljyl8tx5AONfgQC
         V9Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=liE7k7KCDLaE4P9fXyFmPEwyl1E5DGcmCPn5aQ0Fr1o=;
        b=gyPpObcTEPK1N3SjLB4CAZveXfev9OjaoqhWZbVeksTys2nJUdLZsHDJKgot0p0D/e
         5b4+KStC7gLXT9ADdONpsokjMb/4BLRvcuO7mHynzIoKkJrolGIdfF+mxLPMe11qRgNe
         JKydnVKobYB06TZEGI0Ax56AVTWwj5e1xWfc7YGCPnf06e5jpPmJJP13ZmC2C089w32J
         ZRh59EnwVdEqFsB7u5JVaIKrDD43YavbwFb5C7cjqefkUWzXcZYL06nHSeUVi4gih9cM
         xFHDYOY6FVVTYy0gGOWxbDTn702bQwYXDuKTjCaV0WiJJ/eBx5C5D59o6B8lkZlA0SvF
         9l7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uOz6AHkd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 198si10076787qkj.34.2019.10.11.09.08.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Oct 2019 09:08:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uOz6AHkd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIxSg-0000H8-RP
	for alex.bennee@linaro.org; Fri, 11 Oct 2019 12:08:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33812)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iIxGu-0002Xo-7S
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 11:56:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iIxGs-0007jS-Vy
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 11:56:04 -0400
Received: from mail-yw1-xc43.google.com ([2607:f8b0:4864:20::c43]:35654)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iIxGs-0007j2-O0
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 11:56:02 -0400
Received: by mail-yw1-xc43.google.com with SMTP id r134so3654368ywg.2
 for <qemu-arm@nongnu.org>; Fri, 11 Oct 2019 08:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=liE7k7KCDLaE4P9fXyFmPEwyl1E5DGcmCPn5aQ0Fr1o=;
 b=uOz6AHkd2d3q7ZVJfUDbFm+UrMVRxVL3WE/P8wG7lVudDqO0pAIurHwyg13Zy3JwOO
 W38gZMAutEp/EXIBFoZI/UTgKmr/J2KzNbc7Tjr0IVUUKcqRIEvMa+g4nwbTtHUsDqwI
 ZbSd+S0uOUDh/WboDzSpBxJs3QltLfF5jrJQilj3gwfyZzSt847AV1ny+oSne2bD9afL
 mX87w3Defe3sOZaUzOAkYgk+CVw3468VRKqckP1oEyEFhv7UUIqQOgZIkXjukn1QSASI
 XxRRX/hzaCG4NTLPetFVPuYQZT2PcMyVhfV7HP0obG8Qh6oZ5GAgMA+dlxgr1fRYMdNJ
 h/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=liE7k7KCDLaE4P9fXyFmPEwyl1E5DGcmCPn5aQ0Fr1o=;
 b=Ar6DqlrQfxZpRPeDygmzkXMDO8bOdfe/QGs1SLwTCJqxuOCyQ6XPcw/j3YINzGVFTG
 3YWoVA3wp5jCW1hmygQKKWiwO5KiQd6orPWpNaEliP8NlssCa44rPWFLgmal7M852wr8
 UlA2dylJTSCZEO5DQ1ZHVJtPCugKCuLwtLZYMMuoJjQrFr9WB/IzuIdnMQZRo2eJyK/E
 xAnTvdEM2zOXMU3FlgkWfILf0QYwcyuRCMEqLDW1WNdVudSTiESbUGhj9ywHkRvz+iks
 yTBC3yPq2LCvR2hKBj3gaPkNtK9Th7U90q3bFk9W8zI+cF8IjiRRm1oCwCXvhC72medH
 S+HQ==
X-Gm-Message-State: APjAAAUOJUWZ6tlJFlvg3JBucKqnEDMKrZayap87+g17tPffHqz5Wbta
 DMB2CnM+6JpD0mB37U1CoviJ9w==
X-Received: by 2002:a81:2cc6:: with SMTP id s189mr2934231yws.154.1570809361992; 
 Fri, 11 Oct 2019 08:56:01 -0700 (PDT)
Received: from cloudburst.gateway.pace.com (67.216.151.25.pool.hargray.net.
 [67.216.151.25])
 by smtp.gmail.com with ESMTPSA id d17sm2473139ywb.95.2019.10.11.08.56.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 08:56:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 12/20] target/arm: Add arm_rebuild_hflags
Date: Fri, 11 Oct 2019 11:55:38 -0400
Message-Id: <20191011155546.14342-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011155546.14342-1-richard.henderson@linaro.org>
References: <20191011155546.14342-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c43
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
Cc: laurent.desnogues@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xBOU1n1lALML

This function assumes nothing about the current state of the cpu,
and writes the computed value to env->hflags.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    |  6 ++++++
 target/arm/helper.c | 30 ++++++++++++++++++++++--------
 2 files changed, 28 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9909ff89d4..d844ea21d8 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3297,6 +3297,12 @@ void arm_register_pre_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook,
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
index 89aa6fd933..85de96d071 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11198,17 +11198,35 @@ static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
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
@@ -11217,8 +11235,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
         *pc = env->regs[15];
 
         if (arm_feature(env, ARM_FEATURE_M)) {
-            flags = rebuild_hflags_m32(env, fp_el, mmu_idx);
-
             if (arm_feature(env, ARM_FEATURE_M_SECURITY) &&
                 FIELD_EX32(env->v7m.fpccr[M_REG_S], V7M_FPCCR, S)
                 != env->v7m.secure) {
@@ -11242,8 +11258,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
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

