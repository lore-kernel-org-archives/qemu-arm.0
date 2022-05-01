Received: by 2002:a05:6512:2248:0:0:0:0 with SMTP id i8csp476350lfu;
        Sat, 30 Apr 2022 23:26:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwuwRSCu8fq5FSXuGga1d1aQqwSIQI4h3lK8w2odTR+8aHP0xoDtTXE0pySwn8UIA6B8GJz
X-Received: by 2002:a05:6214:226c:b0:456:3a0b:64a9 with SMTP id gs12-20020a056214226c00b004563a0b64a9mr5253918qvb.78.1651386361988;
        Sat, 30 Apr 2022 23:26:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651386361; cv=none;
        d=google.com; s=arc-20160816;
        b=CGOz/kVuT0RNcpWdsnoM+nxHTan3FZPMCvyRyn+qkAkibCocdetZeIuZVwlHHh2/0b
         rLaD+3ATGlF0prtm2viF2BVmKoRWXKk5MHPCOUaC3p32IVhcTsRpGfyGpRCLDamdFe70
         pyzUUTgtbFWMTwSvd0Uo24JjdBe0W1eLUvLQGBVaOj7T8aUAB5IdH5VRgJdpTsc1tawj
         SYXX6jM3ErONRpfkocHwHgqp9p9Kui0uUp2C2Gwkh1w6LmskMx0L4YGzRYhbC2qENKbv
         9S1wev9+OCY2rwrpALCedACmjkO3ZrjmW+ww5XCscPA76cnNUzTVklq0gO+Ff6mmNIcN
         qwVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=abpiSeB9GnhU+yu70oxG40w5Q8oxipcU81kEqVLhpps=;
        b=BvZ4VMZFPNIOfchp9zTdEuBept3SFoBkfxzbtcBdUWVWOvLNEMEJFBsC+W17nBdMKl
         j5IcBT2VC/qfrbynsQxoURCVAxS7wEVB9WsRtBjjHR0Tooqa1TFiilmgVyFCmB9i3goY
         mhRCxudm/4hLRDonGGFa38P7HFHsIW/4F2V00eisQ4SQjxK3Br1ysSL7jFGGz1DcGW4/
         TiAYI+iKxhDSYPcgxoJ1k9zOU2p+0qMrrRrJ60PCMMbJw+cbastH/UBivmzxJsy8wX8z
         o45dbCaxlQV9btYAdXTBrl1xDP0mOQ3p29nWqqOxWyr98YAS3X7wOiGzvbbK5K+24XN3
         ID+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=b9u21RCg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j3-20020ac85f83000000b002f38747190dsi4370285qta.165.2022.04.30.23.26.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 30 Apr 2022 23:26:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=b9u21RCg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nl31t-0007I5-Fc
	for alex.bennee@linaro.org; Sun, 01 May 2022 02:26:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2UD-00077p-BK
 for qemu-arm@nongnu.org; Sun, 01 May 2022 01:51:14 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:39673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2U8-0001RY-JF
 for qemu-arm@nongnu.org; Sun, 01 May 2022 01:51:12 -0400
Received: by mail-pg1-x52d.google.com with SMTP id i62so9500966pgd.6
 for <qemu-arm@nongnu.org>; Sat, 30 Apr 2022 22:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=abpiSeB9GnhU+yu70oxG40w5Q8oxipcU81kEqVLhpps=;
 b=b9u21RCgodWMMhGgzTIQktwXbRmudRM1BXXHmpVcpbWKEq7XVioI9AhStJJc3thwvm
 WSTLv1ll7kTlMNPPakeQhT3URRI++TPIzbJNGiC8u6Q75lEja940KvLT7gloLFKeyXUq
 zd4hSjkcfdNSXgPu6G1MIzd+pvBefgEUHDJp1WkgUlZrQTb883lmg9j7JK/ssh4XeEfM
 eHkVxgiqePOUTvjWYViX0SvhSdBi8eznsmUjXqnEXVVu8ZbjDpVNeeXoZr+mdwkQzijg
 GXxILFPEm2ZCCfutpJTytoeEnCX3uFSwBkwJ3Xt8IKa+TOEIwHNBqddJ5urFPq+fWvNM
 GZBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=abpiSeB9GnhU+yu70oxG40w5Q8oxipcU81kEqVLhpps=;
 b=Wx6ZezK3znffqx3iC2N/fpo2R+rMlQGM0S3RZ+i2XK6LpY+COVmA8pGfCMsoq0tfiz
 0NtIVt+1Kak9+YDwMzlITDJqicdNTRD1wSZ3SojUqnzHVbNEd9iAqSBYZJr5eTiZHtUd
 pydw5kpFPiGbw8pJ5MokYBw/XsWsCDGEjDW64c5wrI58NYXsic8Mef50xcM2+Y91wTGP
 RYooVb7ZaeTFax5JlknuaP0MWu6PIgZAlHoaW22/KtZbV5v1g+yMcoC/6G5+6YBnEdhz
 LW9y5zohs9dh/LWOsi0XquyUcdn7mNXrc5apikxXRiPjlXkoacMz9m+ilOeWi6RcAWaD
 KMew==
X-Gm-Message-State: AOAM533gaS4jtm7/X/cOkrzYNPXpuxydKq99f7DKTcs8vxk8tXvoBnjz
 9VaBLOavyFVstTVUYLIb8LgyIw==
X-Received: by 2002:a63:e849:0:b0:3c1:cf88:7b17 with SMTP id
 a9-20020a63e849000000b003c1cf887b17mr4821354pgk.590.1651384265316; 
 Sat, 30 Apr 2022 22:51:05 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 cm18-20020a17090afa1200b001cd8e9ea22asm17310342pjb.52.2022.04.30.22.51.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 22:51:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 37/45] target/arm: Implement ESB instruction
Date: Sat, 30 Apr 2022 22:50:19 -0700
Message-Id: <20220501055028.646596-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
References: <20220501055028.646596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wMYrMSpidB+h

Check for and defer any pending virtual SError.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Retain m-profile check; improve comments.
---
 target/arm/helper.h        |  1 +
 target/arm/a32.decode      | 16 ++++++++------
 target/arm/t32.decode      | 18 ++++++++--------
 target/arm/op_helper.c     | 43 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-a64.c | 17 +++++++++++++++
 target/arm/translate.c     | 23 ++++++++++++++++++++
 6 files changed, 103 insertions(+), 15 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index b463d9343b..b1334e0c42 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -54,6 +54,7 @@ DEF_HELPER_1(wfe, void, env)
 DEF_HELPER_1(yield, void, env)
 DEF_HELPER_1(pre_hvc, void, env)
 DEF_HELPER_2(pre_smc, void, env, i32)
+DEF_HELPER_1(vesb, void, env)
 
 DEF_HELPER_3(cpsr_write, void, env, i32, i32)
 DEF_HELPER_2(cpsr_write_eret, void, env, i32)
diff --git a/target/arm/a32.decode b/target/arm/a32.decode
index fcd8cd4f7d..f2ca480949 100644
--- a/target/arm/a32.decode
+++ b/target/arm/a32.decode
@@ -187,13 +187,17 @@ SMULTT           .... 0001 0110 .... 0000 .... 1110 ....      @rd0mn
 
 {
   {
-    YIELD        ---- 0011 0010 0000 1111 ---- 0000 0001
-    WFE          ---- 0011 0010 0000 1111 ---- 0000 0010
-    WFI          ---- 0011 0010 0000 1111 ---- 0000 0011
+    [
+      YIELD      ---- 0011 0010 0000 1111 ---- 0000 0001
+      WFE        ---- 0011 0010 0000 1111 ---- 0000 0010
+      WFI        ---- 0011 0010 0000 1111 ---- 0000 0011
 
-    # TODO: Implement SEV, SEVL; may help SMP performance.
-    # SEV        ---- 0011 0010 0000 1111 ---- 0000 0100
-    # SEVL       ---- 0011 0010 0000 1111 ---- 0000 0101
+      # TODO: Implement SEV, SEVL; may help SMP performance.
+      # SEV      ---- 0011 0010 0000 1111 ---- 0000 0100
+      # SEVL     ---- 0011 0010 0000 1111 ---- 0000 0101
+
+      ESB        ---- 0011 0010 0000 1111 ---- 0001 0000
+    ]
 
     # The canonical nop ends in 00000000, but the whole of the
     # rest of the space executes as nop if otherwise unsupported.
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index 78fadef9d6..f21ad0167a 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -364,17 +364,17 @@ CLZ              1111 1010 1011 ---- 1111 .... 1000 ....      @rdm
   [
     # Hints, and CPS
     {
-      YIELD      1111 0011 1010 1111 1000 0000 0000 0001
-      WFE        1111 0011 1010 1111 1000 0000 0000 0010
-      WFI        1111 0011 1010 1111 1000 0000 0000 0011
+      [
+        YIELD    1111 0011 1010 1111 1000 0000 0000 0001
+        WFE      1111 0011 1010 1111 1000 0000 0000 0010
+        WFI      1111 0011 1010 1111 1000 0000 0000 0011
 
-      # TODO: Implement SEV, SEVL; may help SMP performance.
-      # SEV      1111 0011 1010 1111 1000 0000 0000 0100
-      # SEVL     1111 0011 1010 1111 1000 0000 0000 0101
+        # TODO: Implement SEV, SEVL; may help SMP performance.
+        # SEV    1111 0011 1010 1111 1000 0000 0000 0100
+        # SEVL   1111 0011 1010 1111 1000 0000 0000 0101
 
-      # For M-profile minimal-RAS ESB can be a NOP, which is the
-      # default behaviour since it is in the hint space.
-      # ESB      1111 0011 1010 1111 1000 0000 0001 0000
+        ESB      1111 0011 1010 1111 1000 0000 0001 0000
+      ]
 
       # The canonical nop ends in 0000 0000, but the whole rest
       # of the space is "reserved hint, behaves as nop".
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 76499ffa14..390b6578a8 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -960,3 +960,46 @@ void HELPER(probe_access)(CPUARMState *env, target_ulong ptr,
                      access_type, mmu_idx, ra);
     }
 }
+
+/*
+ * This function corresponds to AArch64.vESBOperation().
+ * Note that the AArch32 version is not functionally different.
+ */
+void HELPER(vesb)(CPUARMState *env)
+{
+    /*
+     * The EL2Enabled() check is done inside arm_hcr_el2_eff,
+     * and will return HCR_EL2.VSE == 0, so nothing happens.
+     */
+    uint64_t hcr = arm_hcr_el2_eff(env);
+    bool enabled = !(hcr & HCR_TGE) && (hcr & HCR_AMO);
+    bool pending = enabled && (hcr & HCR_VSE);
+    bool masked  = (env->daif & PSTATE_A);
+
+    /* If VSE pending and masked, defer the exception.  */
+    if (pending && masked) {
+        uint32_t syndrome;
+
+        if (arm_el_is_aa64(env, 1)) {
+            /* Copy across IDS and ISS from VSESR. */
+            syndrome = env->cp15.vsesr_el2 & 0x1ffffff;
+        } else {
+            ARMMMUFaultInfo fi = { .type = ARMFault_AsyncExternal };
+
+            if (extended_addresses_enabled(env)) {
+                syndrome = arm_fi_to_lfsc(&fi);
+            } else {
+                syndrome = arm_fi_to_sfsc(&fi);
+            }
+            /* Copy across AET and ExT from VSESR. */
+            syndrome |= env->cp15.vsesr_el2 & 0xd000;
+        }
+
+        /* Set VDISR_EL2.A along with the syndrome. */
+        env->cp15.vdisr_el2 = syndrome | (1u << 31);
+
+        /* Clear pending virtual SError */
+        env->cp15.hcr_el2 &= ~HCR_VSE;
+        cpu_reset_interrupt(env_cpu(env), CPU_INTERRUPT_VSERR);
+    }
+}
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index b80313670f..5a02e076b7 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1454,6 +1454,23 @@ static void handle_hint(DisasContext *s, uint32_t insn,
             gen_helper_autib(cpu_X[17], cpu_env, cpu_X[17], cpu_X[16]);
         }
         break;
+    case 0b10000: /* ESB */
+        /* Without RAS, we must implement this as NOP. */
+        if (dc_isar_feature(aa64_ras, s)) {
+            /*
+             * QEMU does not have a source of physical SErrors,
+             * so we are only concerned with virtual SErrors.
+             * The pseudocode in the ARM for this case is
+             *   if PSTATE.EL IN {EL0, EL1} && EL2Enabled() then
+             *      AArch64.vESBOperation();
+             * Most of the condition can be evaluated at translation time.
+             * Test for EL2 present, and defer test for SEL2 to runtime.
+             */
+            if (s->current_el <= 1 && arm_dc_feature(s, ARM_FEATURE_EL2)) {
+                gen_helper_vesb(cpu_env);
+            }
+        }
+        break;
     case 0b11000: /* PACIAZ */
         if (s->pauth_active) {
             gen_helper_pacia(cpu_X[30], cpu_env, cpu_X[30],
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 4e19191ed5..87a899d638 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -6239,6 +6239,29 @@ static bool trans_WFI(DisasContext *s, arg_WFI *a)
     return true;
 }
 
+static bool trans_ESB(DisasContext *s, arg_ESB *a)
+{
+    /*
+     * For M-profile, minimal-RAS ESB can be a NOP.
+     * Without RAS, we must implement this as NOP.
+     */
+    if (!arm_dc_feature(s, ARM_FEATURE_M) && dc_isar_feature(aa32_ras, s)) {
+        /*
+         * QEMU does not have a source of physical SErrors,
+         * so we are only concerned with virtual SErrors.
+         * The pseudocode in the ARM for this case is
+         *   if PSTATE.EL IN {EL0, EL1} && EL2Enabled() then
+         *      AArch32.vESBOperation();
+         * Most of the condition can be evaluated at translation time.
+         * Test for EL2 present, and defer test for SEL2 to runtime.
+         */
+        if (s->current_el <= 1 && arm_dc_feature(s, ARM_FEATURE_EL2)) {
+            gen_helper_vesb(cpu_env);
+        }
+    }
+    return true;
+}
+
 static bool trans_NOP(DisasContext *s, arg_NOP *a)
 {
     return true;
-- 
2.34.1

