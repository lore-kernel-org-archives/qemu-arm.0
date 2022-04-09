Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp175505lfq;
        Fri, 8 Apr 2022 17:18:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxvK9VZSkJbX8yiuQpLAI3mx1nWfjjE1423M9aiGE07U6FUpW8RU/GNSrNpXEruUHVsXUO
X-Received: by 2002:a05:6214:5001:b0:441:2e9b:3997 with SMTP id jo1-20020a056214500100b004412e9b3997mr18647997qvb.103.1649463526560;
        Fri, 08 Apr 2022 17:18:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649463526; cv=none;
        d=google.com; s=arc-20160816;
        b=FsWAx3osi23Yg/RvEtdP6Sl6G0MK/Icow7O43sDBJm96ROl775aZG5AccVvmhviU58
         mTpmyf6X6FTDnA1gZDQ00pcxPLjvLHqcQ+ZzrKc1uFhDJ/fS2+j4MIubPwYWkvEfP597
         MW50j3vErHCK006VZV1B9F654eQyvH604RdCcvw+cpATQrNaW94wEqsTECGo4a/Hm7rk
         Pbzm7MGGUIFJVNsmjD8pn26Xgpn+EcJgKS5/1q1M2GjQCn9IfQRdcZDtWAg3IYxOY6oX
         WiurFxOVeJiCzxMiIzCz5rLAwkXVeuMEmyfmoRv3hvCwOiCJTsk5jvpkcaoeTFWxCxfG
         7CRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=cIY+bgtJHMt/2+Zrm+Ge6EoREEHsHthKWWaUH9R3MJM=;
        b=voryuT0iZBN+TjIVD1cJakUfNmwpEjhq+1DfEJ6s0na6juMB6hBqq9ViuD0dWCjfqf
         PBmBoLffCeEr2UVylmkkLuQ4LC3bVZzN9asTJnJwinZAYllZINg09nBPwA1jb3Z/9tVz
         bxgC4t2SC5w8PNf0ar8asC8HJr1zu7LdsEST/XJmWiawI6s5ukJXAwHQeXjOrBM/18Vr
         nSc0n2T/pdn2k4wn/JQSrAawdquTqIjjjuuYO8+DGbXXB0vleRjpWJ2JLr/3QnC29Iya
         K03+SoExkmXtphkJU6zTfnasTAqyx79/nZp76iHuHXRQ8xX7Vr3jRSWmQLA5IFOhmDVp
         MXyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dCQgfZbI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k15-20020a05620a414f00b00699fa9c8cf3si1431418qko.712.2022.04.08.17.18.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Apr 2022 17:18:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dCQgfZbI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ncyoQ-0002Qx-2K
	for alex.bennee@linaro.org; Fri, 08 Apr 2022 20:18:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncye0-000058-0E
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 20:08:00 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:33259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncydx-0003VW-Tq
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 20:07:59 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 q36-20020a17090a17a700b001cb57a8da1cso1284812pja.0
 for <qemu-arm@nongnu.org>; Fri, 08 Apr 2022 17:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cIY+bgtJHMt/2+Zrm+Ge6EoREEHsHthKWWaUH9R3MJM=;
 b=dCQgfZbI/0AdGP5jpMZI4VnCvpf8UOWXDkBs8466lC0gyWQ6j+LhtUgrzy/DXL0ESb
 lG8OlU/m2fF6sutFCgeh16Ap7zOBCdV9wyD1Vop4+p9mUOlLzBA2Rjf+cp+V/9jAh9O0
 M2fHHOFuOiaGoHbqjuCAtIgFmtgYxjZbxmfFE62ODErrYbFEzZdrtFiIyRJjc30DL/l7
 H04Vkq1u01IMqpZ9DhXNCqqS3pl3oP7P7qdSwdaNlMMu0O9JyljBXaXmaze6F89wD4BU
 uQv43cLYOw5bjqUhuS/S5eInPf9k58W703TySPkyL6hJ5voPJ7iTWKFTJVknosRfIzVu
 yxXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cIY+bgtJHMt/2+Zrm+Ge6EoREEHsHthKWWaUH9R3MJM=;
 b=4HlAWMXu1X5g26qjDAvnmmQ1nlIHTkdI74BP42AIJ+LFwG3HG7G8yF6SVEdNAn8xrB
 OAw/L9fL28/IIadys52XJr0r/qV+Wm90BGbtddBw4LpDq35gZyMOalkqJt7RcqKQ/Vn1
 LdIR3D8l0murLN4MBodWJm4U9snJhbv5wVe27SkyfE5ptXywbSRd0K2KAXwaRviVemXj
 KAfzPZDJw26dsJ5p43B3fZ4YmSiBEwDgIWwOBz4Hzqc0NUZE2RqytQTTis/0aSgE6aI6
 xCVs2BRaFOvbhHWOMn3dgNowEEU12VFaTPD99/IoDa0yNaJBp5ocuyaTfaxL7GqhOwGn
 CTfg==
X-Gm-Message-State: AOAM5326nhecHjSDdQemQpKHicwGhKvEp9aDVW4sxca7DF6hB/3MsB8c
 Ow1yyCkIvD276u9yvzz9Z1tYXizHJlM8NQ==
X-Received: by 2002:a17:902:da8e:b0:158:2837:7fe8 with SMTP id
 j14-20020a170902da8e00b0015828377fe8mr4246489plx.64.1649462876435; 
 Fri, 08 Apr 2022 17:07:56 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 t69-20020a637848000000b0039831d6dc23sm22073961pgc.94.2022.04.08.17.07.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 17:07:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/16] target/arm: Implement ESB instruction
Date: Fri,  8 Apr 2022 17:07:40 -0700
Message-Id: <20220409000742.293691-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220409000742.293691-1-richard.henderson@linaro.org>
References: <20220409000742.293691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wGH0HSlT2hll

Check for and defer any pending virtual SError.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h        |  1 +
 target/arm/a32.decode      | 16 +++++++++-----
 target/arm/t32.decode      | 18 +++++++--------
 target/arm/op_helper.c     | 45 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-a64.c |  7 ++++++
 target/arm/translate.c     | 10 +++++++++
 6 files changed, 82 insertions(+), 15 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index b463d9343b..bb7f901668 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -54,6 +54,7 @@ DEF_HELPER_1(wfe, void, env)
 DEF_HELPER_1(yield, void, env)
 DEF_HELPER_1(pre_hvc, void, env)
 DEF_HELPER_2(pre_smc, void, env, i32)
+DEF_HELPER_1(esb, void, env)
 
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
index 70b42b55fd..f50424b301 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -972,3 +972,48 @@ void HELPER(probe_access)(CPUARMState *env, target_ulong ptr,
                      access_type, mmu_idx, ra);
     }
 }
+
+void HELPER(esb)(CPUARMState *env)
+{
+    /*
+     * QEMU does not have a source of physical SErrors, so we are
+     * only concerned with virtual SErrors.
+     *
+     * During translation, we have already checked: RAS enabled,
+     * EL2 present (enabled check done in arm_hcr_el2_eff), and
+     * PSTATE.EL in {EL0, EL1}.  This function corresponds to
+     * AArch64.vESBOperation(), noting that the AArch32 version
+     * is not functionally different.
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
index 9333d7be41..cc54dff83c 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1469,6 +1469,13 @@ static void handle_hint(DisasContext *s, uint32_t insn,
             gen_helper_autib(cpu_X[17], cpu_env, cpu_X[17], cpu_X[16]);
         }
         break;
+    case 0b10000: /* ESB */
+        if (dc_isar_feature(aa64_ras, s) &&
+            arm_dc_feature(s, ARM_FEATURE_EL2) &&
+            s->current_el <= 1) {
+            gen_helper_esb(cpu_env);
+        }
+        break;
     case 0b11000: /* PACIAZ */
         if (s->pauth_active) {
             gen_helper_pacia(cpu_X[30], cpu_env, cpu_X[30],
diff --git a/target/arm/translate.c b/target/arm/translate.c
index bf2196b9e2..b42ca53d99 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -6275,6 +6275,16 @@ static bool trans_WFI(DisasContext *s, arg_WFI *a)
     return true;
 }
 
+static bool trans_ESB(DisasContext *s, arg_ESB *a)
+{
+    if (dc_isar_feature(aa32_ras, s) &&
+        arm_dc_feature(s, ARM_FEATURE_EL2) &&
+        s->current_el <= 1) {
+        gen_helper_esb(cpu_env);
+    }
+    return true;
+}
+
 static bool trans_NOP(DisasContext *s, arg_NOP *a)
 {
     return true;
-- 
2.25.1

