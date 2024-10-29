Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp319499njj;
        Tue, 29 Oct 2024 08:13:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVzruQ8UpEDsz9WbFznCDWgd5cIhQD6z4+1D616WU2jVt6Ol93RK0kEF1PZHCTZreUcl/kN0SxNq4u/8Q==@linaro.org
X-Google-Smtp-Source: AGHT+IH81STtIBl8SjX5eFec14FztY4QrJBTxJeqFcGwrGYf01fNcAofRDpYdtx8ofs69OXfo9GN
X-Received: by 2002:a05:620a:4491:b0:7b1:3c19:a665 with SMTP id af79cd13be357-7b1a9b91ab5mr395509385a.19.1730214787123;
        Tue, 29 Oct 2024 08:13:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730214787; cv=none;
        d=google.com; s=arc-20240605;
        b=WtdpE1YGl0sFKWHHiM8Rh5gtbkKyB9jEoRzIOWck9FGLm6gT+lEqbBopHPWjZifrxy
         DX5zSTe+huUP7JBL9W1OMpREx4zFg3uPEPjO7Rvi0WirbUpt51RImnZ0BMWCVI1KcV4X
         vwDueROOF2ZAdB1rSMKc8jiuzA/wco0slIUFFZy/n9cQyJBq1ai3kYKnsHDP4+Tee9bI
         +FwvT1VTcEdXMdYZ+rV24IXx5iTkmizG2nGEOyoj3cJJtPGaJC9x98Hawn2iZpWqrhU2
         DI00Mo0OJ6PnLKpdbQoEx2OupQ5zT2OkV2wIQQeWTZ/Lis3WgIkw9eIv4g6UMTdjo7dS
         EJvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=dknCWSvVj+vWyVYJJ1Ez77BInxMJDBp2lSUr7yhH5zA=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=QSTyn304NTy3pE215Yt/6a7zwg2T/Ser+jh5EnkbAU8H0vflOGHZvtnxnrce6e8gMX
         FkPJ/0gsqtfTkxPzMTx1NI/ivhSxGgoDZqHC8LPCTKp/eo34aOKJZUyZGQK4LbluC8XQ
         Twgl5uPQolEOs2nIdgNdquXp3WEthdgYPzKJjpH8FwesmC7CUaF7sCjVepsE2jR0ehMd
         crVsSGV+GxC2kITehkMRgkAV4p6k8AxpZLu1jpNh8anruPOo6LySl8OGvtGF5T39vnDW
         8ZExwzH/JgbEM/2KClJlr6fn5x8/FeasbC1nVzPSpQu00eSJolwWGs8zg08O2ENMPNeW
         RnFQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yHW6Wtft;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-510047a2e5dsi2472965e0c.267.2024.10.29.08.13.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Oct 2024 08:13:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yHW6Wtft;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t5ntA-0001rM-Ok; Tue, 29 Oct 2024 11:12:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t5ns1-0000c0-FL
 for qemu-arm@nongnu.org; Tue, 29 Oct 2024 11:10:58 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t5nrw-0007fd-SI
 for qemu-arm@nongnu.org; Tue, 29 Oct 2024 11:10:57 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-37d473c4bb6so4890238f8f.3
 for <qemu-arm@nongnu.org>; Tue, 29 Oct 2024 08:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730214651; x=1730819451; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=dknCWSvVj+vWyVYJJ1Ez77BInxMJDBp2lSUr7yhH5zA=;
 b=yHW6WtftA35UFMaHCRPtzBn8MMLT5Z9FyEOq0pmrehq2IIVPi9waMQj+aKHb5U1vrh
 Nbt0OUtK5C6Dz/5EKs7FnaAwxUBslD8EGaWIDIRtFTWRcXbBXMbjFCAPu87diBllVzrq
 MGER+1skamBTFJPRehQK0rhqoP2gQzbW5lu1pu6TGDY5I3ARE91HyUGnclU1TjSjGyJp
 8XFZps4TE+a+8D6Tg4L9eguGI6uLfT8LPYaU5uArK3VI16VQR6x9Af42l3FcfpyiJy7c
 22pbB74wW1dA+eFwDoVDZQGUJtMouEEaqpSgfamlCmpQ+BTnBvBAnsc1suv45Yj/ZTWP
 lyZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730214651; x=1730819451;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dknCWSvVj+vWyVYJJ1Ez77BInxMJDBp2lSUr7yhH5zA=;
 b=B5QcprAUxmCoHaYKY9CJ/r4i76vWxr6jyZxMJ7nFWR416PjyIgGyebvyGtuW5OErPV
 +13NsdozA06gAtIwMnho7mg/rQuPjCgkabFSoXM9rRfX5zKphjD5e6jO0MayJowPKN0v
 lfDbQtp34BWqYiUwDZuGGb/TrP08cnLBrCwh4mB+wJKTXRrrbc9xmgHnmf5JCQtAFVxw
 IRW6XjS6PA6xv6x7W7WTOTGTCHdEHYiXBCiUs1vkyDGhNMb/I4fGz7URGG17djSFjwTl
 lDbIIuWb5/22lgqhAvFi0Ux107QS9X/cCQ7mYEGqZ+GVy+LSvjNgYcGDgtaIP2CpsYgZ
 ktcA==
X-Gm-Message-State: AOJu0Yz2O1h3vDBaB3fGgf4W6OeE0XNYpKtZiXWxqOs0iYvUtEMYXXJP
 2dequXKoAsxMkvc9oOSYhfKkyiWNJcA+R16j6T0p73tyP/Bqk2ywd6Kue8Nf986eA0ifmlOWWir
 0
X-Received: by 2002:a5d:5508:0:b0:37d:51b7:5e08 with SMTP id
 ffacd0b85a97d-3806117ea93mr10332755f8f.18.1730214651219; 
 Tue, 29 Oct 2024 08:10:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4319360cc2esm146835865e9.44.2024.10.29.08.10.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 08:10:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PULL 03/18] target/arm: Store FPSR cumulative exception bits in
 env->vfp.fpsr
Date: Tue, 29 Oct 2024 15:10:33 +0000
Message-Id: <20241029151048.1047247-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241029151048.1047247-1-peter.maydell@linaro.org>
References: <20241029151048.1047247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: TVbYCqHAtQnq

Currently we store the FPSR cumulative exception bits in the
float_status fields, and use env->vfp.fpsr only for the NZCV bits.
(The QC bit is stored in env->vfp.qc[].)

This works for TCG, but if QEMU was built without CONFIG_TCG (i.e.
with KVM support only) then we use the stub versions of
vfp_get_fpsr_from_host() and vfp_set_fpsr_to_host() which do nothing,
throwing away the cumulative exception bit state.  The effect is that
if the FPSR state is round-tripped from KVM to QEMU then we lose the
cumulative exception bits.  In particular, this will happen if the VM
is migrated.  There is no user-visible bug when using KVM with a QEMU
binary that was built with CONFIG_TCG.

Fix this by always storing the cumulative exception bits in
env->vfp.fpsr.  If we are using TCG then we may also keep pending
cumulative exception information in the float_status fields, so we
continue to fold that in on reads.

This change will also be helpful for implementing FEAT_AFP later,
because that includes a feature where in some situations we want to
cause input denormals to be flushed to zero without affecting the
existing state of the FPSR.IDC bit, so we need a place to store IDC
which is distinct from the various float_status fields.

(Note for stable backports: the bug goes back to 4a15527c9fee but
this code was refactored in commits ea8618382aba..a8ab8706d4cc461, so
fixing it in branches without those refactorings will mean either
backporting the refactor or else implementing a conceptually similar
fix for the old code.)

Cc: qemu-stable@nongnu.org
Fixes: 4a15527c9fee ("target/arm/vfp_helper: Restrict the SoftFloat use to TCG")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20241011162401.3672735-1-peter.maydell@linaro.org
---
 target/arm/vfp_helper.c | 56 ++++++++++++-----------------------------
 1 file changed, 16 insertions(+), 40 deletions(-)

diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 203d37303bd..62638d2b1f9 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -59,32 +59,6 @@ static inline int vfp_exceptbits_from_host(int host_bits)
     return target_bits;
 }
 
-/* Convert vfp exception flags to target form.  */
-static inline int vfp_exceptbits_to_host(int target_bits)
-{
-    int host_bits = 0;
-
-    if (target_bits & 1) {
-        host_bits |= float_flag_invalid;
-    }
-    if (target_bits & 2) {
-        host_bits |= float_flag_divbyzero;
-    }
-    if (target_bits & 4) {
-        host_bits |= float_flag_overflow;
-    }
-    if (target_bits & 8) {
-        host_bits |= float_flag_underflow;
-    }
-    if (target_bits & 0x10) {
-        host_bits |= float_flag_inexact;
-    }
-    if (target_bits & 0x80) {
-        host_bits |= float_flag_input_denormal;
-    }
-    return host_bits;
-}
-
 static uint32_t vfp_get_fpsr_from_host(CPUARMState *env)
 {
     uint32_t i;
@@ -99,15 +73,14 @@ static uint32_t vfp_get_fpsr_from_host(CPUARMState *env)
     return vfp_exceptbits_from_host(i);
 }
 
-static void vfp_set_fpsr_to_host(CPUARMState *env, uint32_t val)
+static void vfp_clear_float_status_exc_flags(CPUARMState *env)
 {
     /*
-     * The exception flags are ORed together when we read fpscr so we
-     * only need to preserve the current state in one of our
-     * float_status values.
+     * Clear out all the exception-flag information in the float_status
+     * values. The caller should have arranged for env->vfp.fpsr to
+     * be the architecturally up-to-date exception flag information first.
      */
-    int i = vfp_exceptbits_to_host(val);
-    set_float_exception_flags(i, &env->vfp.fp_status);
+    set_float_exception_flags(0, &env->vfp.fp_status);
     set_float_exception_flags(0, &env->vfp.fp_status_f16);
     set_float_exception_flags(0, &env->vfp.standard_fp_status);
     set_float_exception_flags(0, &env->vfp.standard_fp_status_f16);
@@ -164,7 +137,7 @@ static uint32_t vfp_get_fpsr_from_host(CPUARMState *env)
     return 0;
 }
 
-static void vfp_set_fpsr_to_host(CPUARMState *env, uint32_t val)
+static void vfp_clear_float_status_exc_flags(CPUARMState *env)
 {
 }
 
@@ -216,8 +189,6 @@ void vfp_set_fpsr(CPUARMState *env, uint32_t val)
 {
     ARMCPU *cpu = env_archcpu(env);
 
-    vfp_set_fpsr_to_host(env, val);
-
     if (arm_feature(env, ARM_FEATURE_NEON) ||
         cpu_isar_feature(aa32_mve, cpu)) {
         /*
@@ -231,13 +202,18 @@ void vfp_set_fpsr(CPUARMState *env, uint32_t val)
     }
 
     /*
-     * The only FPSR bits we keep in vfp.fpsr are NZCV:
-     * the exception flags IOC|DZC|OFC|UFC|IXC|IDC are stored in
-     * fp_status, and QC is in vfp.qc[]. Store the NZCV bits there,
-     * and zero any of the other FPSR bits.
+     * NZCV lives only in env->vfp.fpsr. The cumulative exception flags
+     * IOC|DZC|OFC|UFC|IXC|IDC also live in env->vfp.fpsr, with possible
+     * extra pending exception information that hasn't yet been folded in
+     * living in the float_status values (for TCG).
+     * Since this FPSR write gives us the up to date values of the exception
+     * flags, we want to store into vfp.fpsr the NZCV and CEXC bits, zeroing
+     * anything else. We also need to clear out the float_status exception
+     * information so that the next vfp_get_fpsr does not fold in stale data.
      */
-    val &= FPSR_NZCV_MASK;
+    val &= FPSR_NZCV_MASK | FPSR_CEXC_MASK;
     env->vfp.fpsr = val;
+    vfp_clear_float_status_exc_flags(env);
 }
 
 static void vfp_set_fpcr_masked(CPUARMState *env, uint32_t val, uint32_t mask)
-- 
2.34.1

