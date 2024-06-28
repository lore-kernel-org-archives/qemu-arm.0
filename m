Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp163351njm;
        Fri, 28 Jun 2024 07:25:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWzbTLYUk++AKYcmQMtt9TVafy4MbRLtZiOw3ROX4JmwSDSGr7Uimb0PdRqRb4C5cLS2Yi0NMX5o1/ovwdET5QmTpfSx0Hq
X-Google-Smtp-Source: AGHT+IGIyoQ3AQYgct/2GkRl7bc3r7b/6VJ1YTl+Z9tRiIh5Tuyl7G2e7Wi2a5+mtCd3mdrI6lw1
X-Received: by 2002:a5d:6c6c:0:b0:366:eb2f:4f81 with SMTP id ffacd0b85a97d-366eb2f4fd1mr13289251f8f.45.1719584747825;
        Fri, 28 Jun 2024 07:25:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719584747; cv=none;
        d=google.com; s=arc-20160816;
        b=mMOjeoGPUMTd5YMSQlp7+XxwNnD6rRhG+jAzidppD6DIB0T9MVEdCZX35Wyw7fDwa7
         D7XWlj0WLIqAeqD/iSOUZBFahVA0kRk4auk/6HRn+Kt24uK4s16BSFoUGCtXAuh/cvEb
         cDKu81+Jp14KTCm9vQjDDtHmR9wGUxakybMugIOFy6jedS6JOqdmKIJXJhL2piIcdw10
         wKDys8rK3/gIQ16FmORygHyk4Xq42zphUflruetQ2fEd0nDNfXg0sf9pIpgJy4go2lPS
         yvf4CaY0zXL1IUFTzBtvcyL9e6GldyOUgY92RkJ8DfQ4Hn9Pq162hB/C+N6MTz6fSZWm
         eM0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=5WGCqT/zJ/6jWyQj6H8tv7sDpgdxpP7lpEWytAwcBKE=;
        fh=309UtPKQnavU0XXryFhSTEx59/NOxQrpEyXaJiZTTHU=;
        b=PHkL80q2dr4bhqS1J78dMU88L9pQWgn2w+nJ7w7tlQ2CUHP5AzDP3TLu2AnJCEkwTh
         8rqR8r5ZEaSyB35XTAcfJj4JQDLKT94lwBMy3mvIQnI1TQkjm9P7iCfdJn/RiUypwoT1
         w9wpnoOkdt7pz6cwxrrAJ6MJ/elIpmma/xahKW28uJp0iWc6CUZXWihaU+R6UDa4sD++
         NMasPe8aQqBk8NiwfahPjQnZjHNXmyezwALW1phSSKRPO8EkCfqABIGoG8CF+aNxPcC9
         eAqfpU14dX/hbvxqPMuXS7XncQZcmtOnB45Egq8ViieGnMx+gkVvBK0d7tz4m+QHnXNS
         dr+w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O04UBU1Z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3675a0beed6si1065890f8f.145.2024.06.28.07.25.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jun 2024 07:25:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O04UBU1Z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sNCWR-0002Zq-PC; Fri, 28 Jun 2024 10:24:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sNCWP-0002ZN-PF
 for qemu-devel@nongnu.org; Fri, 28 Jun 2024 10:24:17 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sNCWA-0004Wb-8v
 for qemu-devel@nongnu.org; Fri, 28 Jun 2024 10:24:16 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-42561c16ffeso5668665e9.3
 for <qemu-devel@nongnu.org>; Fri, 28 Jun 2024 07:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719584638; x=1720189438; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5WGCqT/zJ/6jWyQj6H8tv7sDpgdxpP7lpEWytAwcBKE=;
 b=O04UBU1Zany4F+s9lOH4NywnV3fxaXZ/9QTLIBu3yI2/Bcg3RUdKt7faMEmsqmogm9
 /EMW8gtvaj1EP3Hdv+8tZTi3qi+BQN4fgHb/aZLyDoIXCMMtfjg1lafTavOiLFLsOS3K
 AjaTrQrX68LAvTMlep9y4NUy25f9AS622h2X44Hhz2hTtZIUTk2Mxcjc2yh+eFK816h+
 RQzGHtAYr85D4zIUtxlLue2RfTBWBpguCOZZbJNYNLQdjyxkDFIfqtqwzVj+KKsCDoYP
 XVi5fy05H8J4xWfpjRA5+CivXZzIcKp1in4yQqx/+hTw0A3WE9jMuARWWoi3EvNFhTiB
 I74g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719584638; x=1720189438;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5WGCqT/zJ/6jWyQj6H8tv7sDpgdxpP7lpEWytAwcBKE=;
 b=NB8t9lV/uiSW6oZOYFOCDvohKGfGSFw1vtOyfos/dyCJdZPtpNWUU1sVGrkvSc41eK
 Fha+6EJ45MQqaVFue8zrlE2Rtl8bYflgq/NIwl/e3yPaStkAa2qJ+SI1mPzVrVyCC4Cv
 jSJPCrrR53Sp+o43yKUXlEfQ/yv7Lah1oobbl+HWQaXvtoTeb+yDewlkdH7gElBnIm3f
 fRihy6VpbpcPcrmdMX0+t1p4ybLfmKRHnJbL+B78uGvm11uScX4kPf8z+IZjYR+vKBcm
 cpuXYnCLqCFOgSz92V28q/OEvcuGtJ+2iQXg53R8Fq81oqf86yo4wwgN0Dp7Ck3Pqtje
 1tJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMF2lERz/EpME9s7dIj3490eB0P1tvbW0QIU999Ioo4Fv8iPMK49uEl7dug34RfF2zJXD3yD+4AWKWU+Rw2yNv3pCaJ4E=
X-Gm-Message-State: AOJu0Ywtkd8EPBGDVamnOkbTAz/eAXB3r+FjlHg5HNcO46r5p49cV+SS
 fH9hJsJdekh7sTyaAFmzpZDjAYAsnccKL3dVBoyUQYRY7U+6sT6nLiuGKqRpiZc=
X-Received: by 2002:a05:600c:3b16:b0:425:52c7:1f14 with SMTP id
 5b1f17b1804b1-42552c71f73mr54134245e9.24.1719584638047; 
 Fri, 28 Jun 2024 07:23:58 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af55c0asm37180945e9.15.2024.06.28.07.23.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 07:23:57 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 9/9] target/arm: Allow FPCR bits that aren't in FPSCR
Date: Fri, 28 Jun 2024 15:23:47 +0100
Message-Id: <20240628142347.1283015-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240628142347.1283015-1-peter.maydell@linaro.org>
References: <20240628142347.1283015-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Ml8BGd4WTwDk

In order to allow FPCR bits that aren't in the FPSCR (like the new
bits that are defined for FEAT_AFP), we need to make sure that writes
to the FPSCR only write to the bits of FPCR that are architecturally
mapped, and not the others.

Implement this with a new function vfp_set_fpcr_masked() which
takes a mask of which bits to update.

(We could do the same for FPSR, but we leave that until we actually
are likely to need it.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/vfp_helper.c | 54 ++++++++++++++++++++++++++---------------
 1 file changed, 34 insertions(+), 20 deletions(-)

diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 586c33e9460..9406e32f3da 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -113,11 +113,12 @@ static void vfp_set_fpsr_to_host(CPUARMState *env, uint32_t val)
     set_float_exception_flags(0, &env->vfp.standard_fp_status_f16);
 }
 
-static void vfp_set_fpcr_to_host(CPUARMState *env, uint32_t val)
+static void vfp_set_fpcr_to_host(CPUARMState *env, uint32_t val, uint32_t mask)
 {
     uint64_t changed = env->vfp.fpcr;
 
     changed ^= val;
+    changed &= mask;
     if (changed & (3 << 22)) {
         int i = (val >> 22) & 3;
         switch (i) {
@@ -167,7 +168,7 @@ static void vfp_set_fpsr_to_host(CPUARMState *env, uint32_t val)
 {
 }
 
-static void vfp_set_fpcr_to_host(CPUARMState *env, uint32_t val)
+static void vfp_set_fpcr_to_host(CPUARMState *env, uint32_t val, uint32_t mask)
 {
 }
 
@@ -239,8 +240,13 @@ void vfp_set_fpsr(CPUARMState *env, uint32_t val)
     env->vfp.fpsr = val;
 }
 
-void vfp_set_fpcr(CPUARMState *env, uint32_t val)
+static void vfp_set_fpcr_masked(CPUARMState *env, uint32_t val, uint32_t mask)
 {
+    /*
+     * We only set FPCR bits defined by mask, and leave the others alone.
+     * We assume the mask is sensible (e.g. doesn't try to set only
+     * part of a field)
+     */
     ARMCPU *cpu = env_archcpu(env);
 
     /* When ARMv8.2-FP16 is not supported, FZ16 is RES0.  */
@@ -248,22 +254,24 @@ void vfp_set_fpcr(CPUARMState *env, uint32_t val)
         val &= ~FPCR_FZ16;
     }
 
-    vfp_set_fpcr_to_host(env, val);
+    vfp_set_fpcr_to_host(env, val, mask);
 
-    if (!arm_feature(env, ARM_FEATURE_M)) {
-        /*
-         * Short-vector length and stride; on M-profile these bits
-         * are used for different purposes.
-         * We can't make this conditional be "if MVFR0.FPShVec != 0",
-         * because in v7A no-short-vector-support cores still had to
-         * allow Stride/Len to be written with the only effect that
-         * some insns are required to UNDEF if the guest sets them.
-         */
-        env->vfp.vec_len = extract32(val, 16, 3);
-        env->vfp.vec_stride = extract32(val, 20, 2);
-    } else if (cpu_isar_feature(aa32_mve, cpu)) {
-        env->v7m.ltpsize = extract32(val, FPCR_LTPSIZE_SHIFT,
-                                     FPCR_LTPSIZE_LENGTH);
+    if (mask & (FPCR_LEN_MASK | FPCR_STRIDE_MASK)) {
+        if (!arm_feature(env, ARM_FEATURE_M)) {
+            /*
+             * Short-vector length and stride; on M-profile these bits
+             * are used for different purposes.
+             * We can't make this conditional be "if MVFR0.FPShVec != 0",
+             * because in v7A no-short-vector-support cores still had to
+             * allow Stride/Len to be written with the only effect that
+             * some insns are required to UNDEF if the guest sets them.
+             */
+            env->vfp.vec_len = extract32(val, 16, 3);
+            env->vfp.vec_stride = extract32(val, 20, 2);
+        } else if (cpu_isar_feature(aa32_mve, cpu)) {
+            env->v7m.ltpsize = extract32(val, FPCR_LTPSIZE_SHIFT,
+                                         FPCR_LTPSIZE_LENGTH);
+        }
     }
 
     /*
@@ -276,12 +284,18 @@ void vfp_set_fpcr(CPUARMState *env, uint32_t val)
      * bits.
      */
     val &= FPCR_AHP | FPCR_DN | FPCR_FZ | FPCR_RMODE_MASK | FPCR_FZ16;
-    env->vfp.fpcr = val;
+    env->vfp.fpcr &= ~mask;
+    env->vfp.fpcr |= val;
+}
+
+void vfp_set_fpcr(CPUARMState *env, uint32_t val)
+{
+    vfp_set_fpcr_masked(env, val, MAKE_64BIT_MASK(0, 32));
 }
 
 void HELPER(vfp_set_fpscr)(CPUARMState *env, uint32_t val)
 {
-    vfp_set_fpcr(env, val & FPSCR_FPCR_MASK);
+    vfp_set_fpcr_masked(env, val, FPSCR_FPCR_MASK);
     vfp_set_fpsr(env, val & FPSCR_FPSR_MASK);
 }
 
-- 
2.34.1

