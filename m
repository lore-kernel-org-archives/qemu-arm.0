Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1022318wrm;
        Fri, 11 Oct 2019 09:04:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyOciAXIReUjIMhkm7Ibmu+/5BSzTRzBQptOnn6d30HBqvhYGkxTUuXE+pIvFKDZvYNbD2R
X-Received: by 2002:aa7:c2d7:: with SMTP id m23mr14416463edp.206.1570809842474;
        Fri, 11 Oct 2019 09:04:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570809842; cv=none;
        d=google.com; s=arc-20160816;
        b=Hlrt4r3jJUjcnGbCvb241rSqGS5Ij9MdG40l4I5r62uR0Izk7jmfrK8EyGwiUN/3bR
         +sNIlFiQxDU8Kjzt/SsVKDuNXRFlj8E552gI3zoqBBUH3le6WZuOjD6p0VGoLcxVnaxv
         UlW2RhCCyw4U8ZAmEQgnwdhOfK1Gq/YgnxnBPyahhUCTa/FFn4j/UQUhaH/KzZVA/BwO
         CNrWs5IwzJ33e26PqsOd/J80GAuVeGZ+aBOufwMXyC4n6qy2vW2YSf6WMlTSVi6dt5pq
         H1+KsnODfeNDknyhvSOeEhq4hNQGYPCOARhxHlyzpOzUyLew6wCdx6g5JVzhJQhiFK93
         s1sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=20mv2SwJCcd4Z6z1yWs3I8qxDMrWegtCA17Quz1+Bvk=;
        b=anpDGpPHaPEQAh+vCrK9Hvv3zE78ual8NZHQTh2+EBAhUD5zwVZsBjKZtYuOlf2a3o
         u7vI0zpXNAw3RTF6po51VJXnUCJcRX+kdQY42f6OyGwCWsaD7EhvGM1LMPMi9S50+e8H
         Cc6Hd7f1C8JYUJbVJuhUs3cpa/GjDofgLeG5TY1co6t6rOITtjHDiFYvfaBoDzGxMzdH
         xUWZJWt63NOqZ+sWD/nBQ9CqGgTAbiAJG27EY+Wj0qt3aOF6GgFrIJKteRWl0NARcNF0
         PJ0JGzDHJAHVF+mnzNhFoy5Xscewg8P5iMOwTsffZYK5PkWNiFwyFbkt1b60nXNrRpN6
         VpMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wI1VxkTS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qq14si5673770ejb.437.2019.10.11.09.04.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Oct 2019 09:04:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wI1VxkTS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIxOa-00037h-9V
	for alex.bennee@linaro.org; Fri, 11 Oct 2019 12:04:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33622)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iIxGm-0002Il-Kd
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 11:55:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iIxGl-0007cY-GU
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 11:55:56 -0400
Received: from mail-yw1-xc43.google.com ([2607:f8b0:4864:20::c43]:45681)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iIxGk-0007ar-CJ
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 11:55:55 -0400
Received: by mail-yw1-xc43.google.com with SMTP id x65so3633640ywf.12
 for <qemu-arm@nongnu.org>; Fri, 11 Oct 2019 08:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=20mv2SwJCcd4Z6z1yWs3I8qxDMrWegtCA17Quz1+Bvk=;
 b=wI1VxkTSfsDPcY0D4LXTbNeyeaDOil9aLBZPJBvtGAdOpRZIUQsthATLdyZwSU9yUV
 OvjTl2IAwX056fnXwm3bcjUJ0YER/p9KXYRvJoKWJ6qvt8sA3Q/OD9HWvG3cgCSjfaeJ
 4MWfAhzOnRmt9s23xi6k0MJKMbc/z4mgCXbq7jjg7vWPrXtiB75bsVmaxQ4YgiLCu8Wm
 8Y3sjHBT9yr4AQSrNoB5wzU/LrYUfxhHrw6nyD9pNmH7j/iKotOIC0H1CjnC9deUyDyH
 YbsKV8gLDYnPE18HyREFW9+BLw1MMaPrqYKSmbe0N4m7V93QJrR83HeTgLwCzksI/AOa
 ZFFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=20mv2SwJCcd4Z6z1yWs3I8qxDMrWegtCA17Quz1+Bvk=;
 b=bzVSTkc2hVn9a8kfMGHgvaA92YRucptIQHVI4oj9Arqn1yQvPOQVu/61Jv1hql30gx
 jAfetChkCb/GenVTKe8852l+SQdcEHb0iYbpS/eCEyniwNMXAW9gqhTg/g3XdiV8vwKD
 gcvb7s7MpJAbNumJdCIve9r9Phc4ZACHk1rb4QXxs5r/c8iYkjgedsfuWJY1NXzLTD1s
 msSkzR3Sul7ir0aWJrq5TxFyo6YMUYW6+9VCOj21ITq+xi8q/t1KWfdDOtbplG7gi/nG
 Jkc6wRUSw4xm1cZoL4X1YbeCybnfy/zYMgSM3N2XvGFiNk5P+yMtVJd0NS8MfojtxkJl
 dYaA==
X-Gm-Message-State: APjAAAVtabBvCjtDWuurmnbXODmaO9OXBMKoqFBl5n+Mf5B7RfbVyrNU
 JUPqiKxu0cA0nR/tH4LXBD5BAg==
X-Received: by 2002:a81:368a:: with SMTP id d132mr2805565ywa.390.1570809353810; 
 Fri, 11 Oct 2019 08:55:53 -0700 (PDT)
Received: from cloudburst.gateway.pace.com (67.216.151.25.pool.hargray.net.
 [67.216.151.25])
 by smtp.gmail.com with ESMTPSA id d17sm2473139ywb.95.2019.10.11.08.55.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 08:55:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 05/20] target/arm: Split out rebuild_hflags_m32
Date: Fri, 11 Oct 2019 11:55:31 -0400
Message-Id: <20191011155546.14342-6-richard.henderson@linaro.org>
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
X-TUID: 1lsXwG9PrTcj

Create a function to compute the values of the TBFLAG_A32 bits
that will be cached, and are used by M-profile.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 45 ++++++++++++++++++++++++++++++---------------
 1 file changed, 30 insertions(+), 15 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 4c65476d93..d4303420da 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11083,6 +11083,29 @@ static uint32_t rebuild_hflags_common_32(CPUARMState *env, int fp_el,
     return rebuild_hflags_common(env, fp_el, mmu_idx, flags);
 }
 
+static uint32_t rebuild_hflags_m32(CPUARMState *env, int fp_el,
+                                   ARMMMUIdx mmu_idx)
+{
+    uint32_t flags = 0;
+
+    if (arm_v7m_is_handler_mode(env)) {
+        flags = FIELD_DP32(flags, TBFLAG_A32, HANDLER, 1);
+    }
+
+    /*
+     * v8M always applies stack limit checks unless CCR.STKOFHFNMIGN
+     * is suppressing them because the requested execution priority
+     * is less than 0.
+     */
+    if (arm_feature(env, ARM_FEATURE_V8) &&
+        !((mmu_idx & ARM_MMU_IDX_M_NEGPRI) &&
+          (env->v7m.ccr[env->v7m.secure] & R_V7M_CCR_STKOFHFNMIGN_MASK))) {
+        flags = FIELD_DP32(flags, TBFLAG_A32, STACKCHECK, 1);
+    }
+
+    return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
+}
+
 static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
                                    ARMMMUIdx mmu_idx)
 {
@@ -11168,7 +11191,13 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
         }
     } else {
         *pc = env->regs[15];
-        flags = rebuild_hflags_common_32(env, fp_el, mmu_idx, 0);
+
+        if (arm_feature(env, ARM_FEATURE_M)) {
+            flags = rebuild_hflags_m32(env, fp_el, mmu_idx);
+        } else {
+            flags = rebuild_hflags_common_32(env, fp_el, mmu_idx, 0);
+        }
+
         flags = FIELD_DP32(flags, TBFLAG_A32, THUMB, env->thumb);
         flags = FIELD_DP32(flags, TBFLAG_A32, VECLEN, env->vfp.vec_len);
         flags = FIELD_DP32(flags, TBFLAG_A32, VECSTRIDE, env->vfp.vec_stride);
@@ -11204,20 +11233,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
         }
     }
 
-    if (arm_v7m_is_handler_mode(env)) {
-        flags = FIELD_DP32(flags, TBFLAG_A32, HANDLER, 1);
-    }
-
-    /* v8M always applies stack limit checks unless CCR.STKOFHFNMIGN is
-     * suppressing them because the requested execution priority is less than 0.
-     */
-    if (arm_feature(env, ARM_FEATURE_V8) &&
-        arm_feature(env, ARM_FEATURE_M) &&
-        !((mmu_idx  & ARM_MMU_IDX_M_NEGPRI) &&
-          (env->v7m.ccr[env->v7m.secure] & R_V7M_CCR_STKOFHFNMIGN_MASK))) {
-        flags = FIELD_DP32(flags, TBFLAG_A32, STACKCHECK, 1);
-    }
-
     if (arm_feature(env, ARM_FEATURE_M_SECURITY) &&
         FIELD_EX32(env->v7m.fpccr[M_REG_S], V7M_FPCCR, S) != env->v7m.secure) {
         flags = FIELD_DP32(flags, TBFLAG_A32, FPCCR_S_WRONG, 1);
-- 
2.17.1

