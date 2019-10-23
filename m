Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp1048738wrq;
        Wed, 23 Oct 2019 08:35:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyHs06aYebvCag4ZcXOeTM6ZP4KwOaMCW/MdhnaSvuByOMz8Am19/T06UTTwWmwAOteQmIQ
X-Received: by 2002:a0c:fde8:: with SMTP id m8mr8264772qvu.4.1571844915177;
        Wed, 23 Oct 2019 08:35:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571844915; cv=none;
        d=google.com; s=arc-20160816;
        b=Tft3u5WiQrlwxJAWyEflYTh7EaMlrWMagu9yBrgsnSzv4A4IPvUFBkoroDrWGMqQgA
         quKRhm+r1eS+bZitop/yhc+k5fk++R75k+ey5xcubO9T2f2VNUz3XsQrkpUvkeWIS8n0
         MSXdK+RilDi8Kf8MuEE4EfMkWOgU/WqFeZoSNZAzHwHJLdBIqapjLR0LURZCiDJXb5j+
         U2FthI3BhBVNBHl/9tWCFrgZbYlvnuI6S7HMG4BTbnpszurEvhP8kbpwc886+x9pSx/w
         NazyAWnKQPtnN/PrD6tl+gPk4KRPI0pWq5HFlGZIya8K/62HIYvFD3/iLJ4Rn7Rnu/S+
         gFCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=mDaUYtXyoxKyQ6YIW+CzLKUl72EI9Ve9jhEUulKMydM=;
        b=Ubp87/SD/yN5WklaskFjUI+kcGmheCPACH1CMZTZzYQru91fH2lra7MAL998Um+fz4
         9Smz9RedLdYErFoS4coP5i77Afc3Cb9rYsPlz6yKUPMMVKFbnB9R5/q+27QnCc4Yhv55
         sYQmwosg0M715KIqDiz0UeUrZ1GfmiWZ6Wt4LowgSSVvwtlx8bkw0qmJHI/HwXFDtHNQ
         XtbP8BdSSDRpWZQBLPyds3RB84rhKuqUbYH2rRlb25NzFmLNMVqlT20DoA373nVqfTb8
         G7/hhX6R11QLoOGzkGQ8N9ZY/uh/5DtkLoGQh+h3EjPrEVbrMRSBQZ9dLjXUETGpBLsP
         q2FQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gg4OUCU0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t65si19160261qkf.19.2019.10.23.08.35.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2019 08:35:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gg4OUCU0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNIfK-0002cU-IE
	for alex.bennee@linaro.org; Wed, 23 Oct 2019 11:35:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35153)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iNI8s-00087D-N2
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 11:01:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iNI8r-0001ET-2t
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 11:01:42 -0400
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842]:38831)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iNI8q-000112-Nu
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 11:01:40 -0400
Received: by mail-qt1-x842.google.com with SMTP id o25so19349234qtr.5
 for <qemu-arm@nongnu.org>; Wed, 23 Oct 2019 08:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mDaUYtXyoxKyQ6YIW+CzLKUl72EI9Ve9jhEUulKMydM=;
 b=Gg4OUCU0+YuFSqTxloUy7xv2L7XQ97PXUiiSXzc3OEJN69plKDFY10+lNGtEh/JgPh
 2gmFn56lZzKeCyS4HAQycasM59zb1a6NxSRcubR8fqEHDm8F7sgbUtucEhIWaWQ1cREK
 mbgfkVLrGz6CW3a24YoMkuFJlYIBldjwFt9iuI8u5mPONaSl9QLHwN3H3dFwuaUqVrxL
 nXa2tlQ+h6wh9JrHlGX1dpnvCma4z4lsyr1vr1MpMaBssLlWX512qydTq0QD30cc5X+S
 qMnzKA+fnXAhu+OX4xs8gxUFzlzOhtevyK4NnhzOE71A2tK4DR9fm2nRQNZMKFja+tSw
 3Jag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mDaUYtXyoxKyQ6YIW+CzLKUl72EI9Ve9jhEUulKMydM=;
 b=OveATclErfy5ay67Y1zX4jSzguk3dHQUQoG3wLiJTfS13cKjCiifhV0wgoTnhwQyg9
 jg2/W/RmK8hi6kEyvRMY/wCAZbk/t5ecaL7W/QkyRjhP3R8puIOupnixhk1vlAshx5Oj
 D9Z8gGnAWA5SvMHvGav6typziLGjphGhT8nnw6P+yXU44fPhrCfzHYIpZng4p7JI5YpC
 e1Cp69ymD9F9173O6iy/JbMH27stTaZbkk5XICH+TtbN511eT92FTaaQvyuu2Tk6aXP7
 9nAgejPNOr7DH8YYYcXOaVmFvu33oPGd72kUFIXBFnJWCGNq5LYHq0ovNy8Vx5NY+Kx1
 v6mg==
X-Gm-Message-State: APjAAAXgvDoHU6iGF9b+shFCPC3tdWNiepo2g/9HakaBlgOvc5iBycnE
 n4Kwn3Yr75mwUVEZHxbLTJPsqw==
X-Received: by 2002:ad4:51cb:: with SMTP id p11mr5186448qvq.81.1571842869476; 
 Wed, 23 Oct 2019 08:01:09 -0700 (PDT)
Received: from localhost.localdomain (198-4-20-64.static.cosmoweb.net.
 [64.20.4.198])
 by smtp.gmail.com with ESMTPSA id l189sm11030168qke.69.2019.10.23.08.01.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 08:01:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 05/24] target/arm: Split out rebuild_hflags_m32
Date: Wed, 23 Oct 2019 11:00:38 -0400
Message-Id: <20191023150057.25731-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191023150057.25731-1-richard.henderson@linaro.org>
References: <20191023150057.25731-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::842
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
X-TUID: LnihCXyf7Jct

Create a function to compute the values of the TBFLAG_A32 bits
that will be cached, and are used by M-profile.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
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

