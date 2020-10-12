Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1170945lfa;
        Mon, 12 Oct 2020 09:05:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGdshfI56dIf2Yj6m9J0JY1H+Vbv1DaqX8gq+jywGDm7olzp6tXHuEsBUYeuCRXBp1k7hZ
X-Received: by 2002:a25:4149:: with SMTP id o70mr21116663yba.31.1602518753062;
        Mon, 12 Oct 2020 09:05:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602518753; cv=none;
        d=google.com; s=arc-20160816;
        b=FWkngyv3IXBab/BGhqJE05mGU+H3uS8O4TNTyY++tivb33DffaADjSADbySUneMTYM
         3Tg+tF9bBL+UFKRbzSKO8w73qj837KTrfvbGtrX8jLb3MDMhbJb+ehqR3eojgYszwIPf
         qmG2h1qO3KiDAFrHJSCMW6glDsuhzjlGjwFrYewUtxZQZPi/toEMjGPQVttVHoMdyhKQ
         btZFd9A+iwhmp15OhtPxsaUrq2g9do59i0TKWzl88uXg0lgd8ziOXXi6tcc4LHBVqk0N
         qPyOvyv16mxZKetmLtkJh+2EZbcI+EJgXjq22TB/u4gwRFBToJLeREJNdnqWXWMt/HZ6
         uLyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=xt8K6d2MSfZD0aUx3007ahLfcJglQMjANJEKAe+3790=;
        b=gesxFXZ8AmyjTFJrDjNLn3T1jv61ufpg4F5MVM+2K1AuHSOXT8dQO2J44WlkmdAPBh
         reb7ZeBQge8CBBnES9cW+bO6Ho3w2/yeO/LRAr6Bbtc82/3EZKmLtWhTK85aWckX4obD
         gvONF4eT5o/vRK9kuFWGsCsiW2EzMX2pobCWehmZuJVFEV+FqsZ79Wd9qKwPDN9K/4co
         rC+0L3vpcTn5xCPwzVxO+hjAd/ljZxoaVqxsh0l8vDqw3gZz4VnnWS2VHWeaPoJHd2sf
         HX5a1+hapo4xbdIHKMS+8L4Y8db8JRn0jSRJHeOvoiEN1dfc4fCW5cjsdH/kkZk4+C2o
         k5dg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FYE+9Ecv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p184si14081706yba.367.2020.10.12.09.05.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Oct 2020 09:05:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FYE+9Ecv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kS0Ke-00075y-Dh
	for alex.bennee@linaro.org; Mon, 12 Oct 2020 12:05:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRztn-0003kv-2L
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 11:38:07 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:41291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRztf-0007mj-ON
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 11:38:06 -0400
Received: by mail-wr1-x441.google.com with SMTP id s9so7600506wro.8
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2020 08:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xt8K6d2MSfZD0aUx3007ahLfcJglQMjANJEKAe+3790=;
 b=FYE+9Ecvyaoe9jzyxtZsaIzYUKdFehhxLQhRlKWZo3PdXiNEH6joJiRvM4Kr06kFSj
 VnyWPc7y1HssryWF9Pw1v4yZlqOKvgWg7cijQO5vvvJEPYOfw83Ng1mnGqE/d8Q0sdLv
 drgrc2eCGo1tLId4USPRk5e0Oq/Z2FsCKUGslXnaVxDzaaKlTYhf1+mYJ+zkT7PxGlPB
 nnsL/+Mqp6AWqxGpSjRMMXb94z9xeKMIqIhlV+ETMMCdnPVf8Quxz5BuWcWIQsu4iDTA
 tgaatqkUs6r9S94kmaqN643cWHFcYmfS3oVoiRiDuPTR1Ws76WL7YOr5pKZB+9DAjNBN
 3N/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xt8K6d2MSfZD0aUx3007ahLfcJglQMjANJEKAe+3790=;
 b=Lo8kpsUrzqj1BlPij540qBe0HYG5U6FP7r8bVMvp/HO6OddRhz8CoX+pZ0uU0GfFRe
 zyUy6rYcocC2W7luIJQ/dy6KWIIRI9pds+frQwjYO/AzkMnj+1yb4naxTV26Icua755/
 PPZpCmmQJ/3/6nTI2XpgiaoQgnhQK52nHT1VNRk+dWsTy1oNVWALChx0vqnmZFhwSu8T
 7JPHXgThOdNRfZD5X887v8Q8v2DWkiIqLQXFQr7J0LKVjOcBGP9ZDZCUNYuz9kihDhz7
 KlgS4fImziK8BVLh2e1KEZ2uXPkMDXKNjAep81TCJBPGAsfaXLDzrpzZ7qwmVpHLKEtt
 0Oag==
X-Gm-Message-State: AOAM532EADKRefdg9pT0+XVIxCW248koF/cDe1tbH02CYUJNxc3U0+Nf
 MoGl64ld42fQfIzqsCI3/wNKlf7EFySPRIuY
X-Received: by 2002:adf:fa0e:: with SMTP id m14mr29112212wrr.134.1602517078193; 
 Mon, 12 Oct 2020 08:37:58 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y66sm7095961wmd.14.2020.10.12.08.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 08:37:57 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 09/10] target/arm: Implement FPSCR.LTPSIZE for M-profile LOB
 extension
Date: Mon, 12 Oct 2020 16:37:45 +0100
Message-Id: <20201012153746.9996-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201012153746.9996-1-peter.maydell@linaro.org>
References: <20201012153746.9996-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: unu8zpi7JaTD

If the M-profile low-overhead-branch extension is implemented, FPSCR
bits [18:16] are a new field LTPSIZE.  If MVE is not implemented
(currently always true for us) then this field always reads as 4 and
ignores writes.

These bits used to be the vector-length field for the old
short-vector extension, so we need to take care that they
are not misinterpreted as setting vec_len.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c        |  5 +++++
 target/arm/vfp_helper.c | 25 +++++++++++++++++++++----
 2 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 186ee621a65..baae826f94f 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -255,6 +255,11 @@ static void arm_cpu_reset(DeviceState *dev)
         uint8_t *rom;
         uint32_t vecbase;
 
+        if (cpu_isar_feature(aa32_lob, cpu)) {
+            /* LTPSIZE is constant 4 if MVE not implemented */
+            env->vfp.xregs[ARM_VFP_FPSCR] |= 4 << 16;
+        }
+
         if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
             env->v7m.secure = true;
         } else {
diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 5666393ef79..350150adbf1 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -189,8 +189,10 @@ uint32_t vfp_get_fpscr(CPUARMState *env)
 
 void HELPER(vfp_set_fpscr)(CPUARMState *env, uint32_t val)
 {
+    ARMCPU *cpu = env_archcpu(env);
+
     /* When ARMv8.2-FP16 is not supported, FZ16 is RES0.  */
-    if (!cpu_isar_feature(any_fp16, env_archcpu(env))) {
+    if (!cpu_isar_feature(any_fp16, cpu)) {
         val &= ~FPCR_FZ16;
     }
 
@@ -198,8 +200,14 @@ void HELPER(vfp_set_fpscr)(CPUARMState *env, uint32_t val)
         /*
          * M profile FPSCR is RES0 for the QC, STRIDE, FZ16, LEN bits
          * and also for the trapped-exception-handling bits IxE.
+         * From v8.1M with the low-overhead-loop extension bits
+         * [18:16] are used for LTPSIZE and (since we don't implement
+         * MVE) always read as 4 and ignore writes.
          */
         val &= 0xf7c0009f;
+        if (cpu_isar_feature(aa32_lob, cpu)) {
+            val |= 4 << 16;
+        }
     }
 
     vfp_set_fpscr_to_host(env, val);
@@ -212,9 +220,18 @@ void HELPER(vfp_set_fpscr)(CPUARMState *env, uint32_t val)
      * (which are stored in fp_status), and the other RES0 bits
      * in between, then we clear all of the low 16 bits.
      */
-    env->vfp.xregs[ARM_VFP_FPSCR] = val & 0xf7c80000;
-    env->vfp.vec_len = (val >> 16) & 7;
-    env->vfp.vec_stride = (val >> 20) & 3;
+    if (cpu_isar_feature(aa32_lob, cpu)) {
+        /*
+         * M-profile low-overhead-loop extension: [18:16] are LTPSIZE
+         * and we keep them in vfp.xregs[].
+         */
+        env->vfp.xregs[ARM_VFP_FPSCR] = val & 0xf7cf0000;
+    } else {
+        /* Those bits might be the old-style short vector length/stride */
+        env->vfp.xregs[ARM_VFP_FPSCR] = val & 0xf7c80000;
+        env->vfp.vec_len = (val >> 16) & 7;
+        env->vfp.vec_stride = (val >> 20) & 3;
+    }
 
     /*
      * The bit we set within fpscr_q is arbitrary; the register as a
-- 
2.20.1

