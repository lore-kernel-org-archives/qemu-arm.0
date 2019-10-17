Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1352638wrm;
        Thu, 17 Oct 2019 12:01:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw0wimVx1P+ABmJ6d7G+bGlZDXsEae/xaX/ayApVFZOVjHStWg7VxuT0ymGoiS8iuGYREcB
X-Received: by 2002:aa7:cd0f:: with SMTP id b15mr5460308edw.3.1571338861390;
        Thu, 17 Oct 2019 12:01:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571338861; cv=none;
        d=google.com; s=arc-20160816;
        b=KAURNzON5kVg1nhMwcPpWZ8RndMUWAUKejipto0++u34K2TDOV+GtTyoAEk31fohwD
         NbFDmv+dA/VxkmvZvpZT7GV582zf2A0iSMfdiDgRy3iTQBGpW1ZK5leZX2vXEBu9D3Hy
         pkBB3om7bZthrGUHVRxCeFfqn6kTfT9whlXquDoTyrSq1X4HKfgnoIhfnqiSlA+Vf8n0
         mmr8Q6oz3RMRASFCRKWM3b1zhBgNPNDpcyEk8H6+9VsfNwvDbsU4FDIp/onNfaqy+xU8
         gOYMQyUttUwz9Hid2AdDaTGUOn7NtdNt2Lq22UzVcW3BrsIairbbnAYCFmEtQ67dLGXd
         l5Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=HNW+DKXClNFoWE5mAVnYOdmYoSifNB4F8oskeNBuM9U=;
        b=i55tYLOmfZDrfbyLIA0HzepKMylCoDyrRhDW6cHSuyotMErdr1jxh2uipecjwv9glS
         Rk6k2VKyVkvx0gr8Gzdo4HE3Nz91qet+Q/kHmJQcWLlQIqKbfAM9PBcZSroaaa+DXGwM
         yipYhh76cjMCWs2DyghiIwHE5oO8uvZ6kEctK/wkeXKELz81ygsicRbADMGHH+vs2s0x
         zfgVAzyZ+LZSDdmVc2cBLERj4V/irX+Lel68P/92lGF8z/dxGMu1z3pOTiEGTUKcH52S
         iUtBet6A/MbTnWHYoTVDaUR1VDW8g6L6/WL9cl4m7zaYumZ+LpfJOUFXPo8QCEjtfdQX
         IDSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LkyJU8fo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qh16si1960314ejb.349.2019.10.17.12.01.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 12:01:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LkyJU8fo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLB19-0002bU-QR
	for alex.bennee@linaro.org; Thu, 17 Oct 2019 15:00:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35376)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iLAs9-0001Js-1v
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 14:51:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iLAs6-0000x2-Hj
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 14:51:40 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:46920)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iLAs6-0000tj-7G
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 14:51:38 -0400
Received: by mail-pl1-x641.google.com with SMTP id q24so1544329plr.13
 for <qemu-devel@nongnu.org>; Thu, 17 Oct 2019 11:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HNW+DKXClNFoWE5mAVnYOdmYoSifNB4F8oskeNBuM9U=;
 b=LkyJU8foHBs+uNhCP8dnkCH5uGCvWMuVcHs0nPTcd0FKZlssvwU1OVH3BE/LuuWPA4
 GvIb9Owtax5TrClRNQgtYlUra9mEAsXKlAxWGmAWtDDY5d0yNiqak6cj26TFVpS7xDRK
 U2Q8F0EYFiYE8GYQk6O1zcIccor7WXzjQciP/ZP2yP+SWeNgUx6wicbehnHM3SoB56gX
 S5TAElC6d7GOgFsRufovRWLnEKwoyxRKEEE0GwCwUs+X+bdqIdwtNdAPUeXktF//Xn9h
 XKZCSqyXj4oF6XouBvIfyOwkIT6gkFKs/+/HG8ZyFnFFPWLMKWWcMZ/Va40hCpZOs4oR
 9s+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HNW+DKXClNFoWE5mAVnYOdmYoSifNB4F8oskeNBuM9U=;
 b=rYd1I34dqv0yLQmKrUnSTWTMxy+zickohzPUpExwB+thT0C7eVvXAKlTKDGC5rzjuF
 KKWHs705eA+3QHo4MN2h9NT2sJPmWWVhwItfpklDHZVMDs1YyI2hqb3J94mF379Qvj74
 Q7W2lyvsgjjFFNCrChVhWYhhCq/0fDrTbGJVOe2KDxQP81mao4eMndsRapTNjmXdmUFW
 K+v/eqeIcxNKVyuXQIDKqxZQbMFfTMiXJVEZHxqcvYWOlgIjZABTIOYKds6Y5yHgxUQc
 aOXcIn2/BWMXhcxzaMGiqZh1rgjySI0ee4Mf3iBfOdvNVvRFj+h7joQNmZb0xHKWOKEj
 H6fg==
X-Gm-Message-State: APjAAAXZn2Yr7AoM/ABUrfuRXA0nRz//EEyfq2BBs/L8p8DSgWkm820+
 gWDVB01nHC8e06pz1ikiudYrxHb6zDM=
X-Received: by 2002:a17:902:bf08:: with SMTP id
 bi8mr5364152plb.249.1571338286618; 
 Thu, 17 Oct 2019 11:51:26 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id s97sm5009256pjc.4.2019.10.17.11.51.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 11:51:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 11/20] target/arm: Hoist computation of TBFLAG_A32.VFPEN
Date: Thu, 17 Oct 2019 11:51:01 -0700
Message-Id: <20191017185110.539-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191017185110.539-1-richard.henderson@linaro.org>
References: <20191017185110.539-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yOnTOABFa7pL

There are 3 conditions that each enable this flag.  M-profile always
enables; A-profile with EL1 as AA64 always enables.  Both of these
conditions can easily be cached.  The final condition relies on the
FPEXC register which we are not prepared to cache.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    |  2 +-
 target/arm/helper.c | 14 ++++++++++----
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 4d961474ce..9909ff89d4 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3192,7 +3192,7 @@ FIELD(TBFLAG_A32, XSCALE_CPAR, 4, 2)
  * the same thing as the current security state of the processor!
  */
 FIELD(TBFLAG_A32, NS, 6, 1)
-FIELD(TBFLAG_A32, VFPEN, 7, 1)          /* Not cached. */
+FIELD(TBFLAG_A32, VFPEN, 7, 1)          /* Partially cached, minus FPEXC. */
 FIELD(TBFLAG_A32, CONDEXEC, 8, 8)       /* Not cached. */
 FIELD(TBFLAG_A32, SCTLR_B, 16, 1)
 /* For M profile only, set if FPCCR.LSPACT is set */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 398e5f5d6d..89aa6fd933 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11088,6 +11088,9 @@ static uint32_t rebuild_hflags_m32(CPUARMState *env, int fp_el,
 {
     uint32_t flags = 0;
 
+    /* v8M always enables the fpu.  */
+    flags = FIELD_DP32(flags, TBFLAG_A32, VFPEN, 1);
+
     if (arm_v7m_is_handler_mode(env)) {
         flags = FIELD_DP32(flags, TBFLAG_A32, HANDLER, 1);
     }
@@ -11119,6 +11122,10 @@ static uint32_t rebuild_hflags_a32(CPUARMState *env, int fp_el,
                                    ARMMMUIdx mmu_idx)
 {
     uint32_t flags = rebuild_hflags_aprofile(env);
+
+    if (arm_el_is_aa64(env, 1)) {
+        flags = FIELD_DP32(flags, TBFLAG_A32, VFPEN, 1);
+    }
     return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
 }
 
@@ -11250,14 +11257,13 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
                 flags = FIELD_DP32(flags, TBFLAG_A32, VECSTRIDE,
                                    env->vfp.vec_stride);
             }
+            if (env->vfp.xregs[ARM_VFP_FPEXC] & (1 << 30)) {
+                flags = FIELD_DP32(flags, TBFLAG_A32, VFPEN, 1);
+            }
         }
 
         flags = FIELD_DP32(flags, TBFLAG_A32, THUMB, env->thumb);
         flags = FIELD_DP32(flags, TBFLAG_A32, CONDEXEC, env->condexec_bits);
-        if (env->vfp.xregs[ARM_VFP_FPEXC] & (1 << 30)
-            || arm_el_is_aa64(env, 1) || arm_feature(env, ARM_FEATURE_M)) {
-            flags = FIELD_DP32(flags, TBFLAG_A32, VFPEN, 1);
-        }
         pstate_for_ss = env->uncached_cpsr;
     }
 
-- 
2.17.1

