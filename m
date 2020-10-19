Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3965725lfa;
        Mon, 19 Oct 2020 08:23:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9SJr6zALfhAjmXU1T0pXrsTApyBepKl8mMrDs1Uxf2Uk4daL1H9flTIPMVC8HgkAUGobi
X-Received: by 2002:a25:344d:: with SMTP id b74mr240689yba.500.1603121013934;
        Mon, 19 Oct 2020 08:23:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603121013; cv=none;
        d=google.com; s=arc-20160816;
        b=mfo/K0hfXsSa4e3Vt9+YCJ85fAi5NogE+nJHKmuSJkRkH+rqgT9SrlqaE+5/3RYwiQ
         wj23jtN/C3yHEpK2nkgcwqz+r6l0vHGv/roeDht38bSRYVUKP9UUWBrOwckLBlsrffc6
         atEAs6bArDzHq7VeC5QqpamFY5omIwee+K2TWN+QSzec17+WBXWDQqe4eEv8tFEhdT1L
         POMng8QRBx2EH1T9pF9hLRvOuQPKKLntDEDznNGeunpHYdTfIaYapE1os9taY7f0+3EG
         lZE7E3MQxahmxPwZ8FLROaCbAE8bTEmqd8pEzzqFTy0uCL0QAzlW28L8DRcZeP1CL58b
         QVgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=60CXa9EVUwZSuD/TaM/4vLu3CrMpUPxjQs1jlsMOoMs=;
        b=AzIkGH4WngZt2rKO+C+Gtnsc2rqzbbTJafJTYs49q5fcZuTQrycWjWr3Djebp7a+PI
         yZsFVG9vusWtWJkpOdgthQzu3HaaYOFYYG0+yRSkj1jUuG6cnGdcuoCmfBETWCWo8mJO
         YCjCYUCyWfhh8SGZ/L7CQLTeaOqi6BP9LvyF3LQOVx2xV+S+GWZ9Jm9M6T2ggPIOIR2m
         2a3dxwMCwsZlO3PikhPkVLjUOLXTpNdJrJRTIGgXcjeBf/agAxQ4K7Hen2QDQsHdwLjA
         YIwXWrJNpE51FSarFvUPEQGq+WRUY69Cv7Ar+Ix9P6R2wepZGCuuVwftpHBxTvtzxJPU
         dbNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hNmizyZD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c73si236224ybf.305.2020.10.19.08.23.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Oct 2020 08:23:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hNmizyZD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kUX0X-0002HH-9W
	for alex.bennee@linaro.org; Mon, 19 Oct 2020 11:23:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUWqf-00070P-Hg
 for qemu-arm@nongnu.org; Mon, 19 Oct 2020 11:13:21 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:53743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUWqb-0002mF-0K
 for qemu-arm@nongnu.org; Mon, 19 Oct 2020 11:13:21 -0400
Received: by mail-wm1-x344.google.com with SMTP id f21so179963wml.3
 for <qemu-arm@nongnu.org>; Mon, 19 Oct 2020 08:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=60CXa9EVUwZSuD/TaM/4vLu3CrMpUPxjQs1jlsMOoMs=;
 b=hNmizyZDP2pel4ajJU+5apBtwUYjPPBUb09FuMN+454ruGVlIT/Lv7mFjkf5k3y3Gw
 MlnrqIVe3OkfhcDaKts6K3XWI647o00iY+UytB93+UwAy7fKfxvlYmLDCKK3bws2H/CF
 r9KTMuGelHm/QgqbJgj9qY5muEHuoYBuKhV5heBi6wU5Gmo2Mq+wVdmbm2hhTud0x+Zu
 lX/TydvOT7RyhzFtV6WdTaI6ONSnV1i2dNy6LEU8+QqFFbCuAJGWtH0vSys1kUlDlLbX
 1SPrjDpmrGJxyJWzRLF2rRXu7p9+XLluMVwd3cBpxvsHjoG4YewStN/jQXtqL9t534du
 F2lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=60CXa9EVUwZSuD/TaM/4vLu3CrMpUPxjQs1jlsMOoMs=;
 b=oWgAfPJJqAt+mYhfTlrAcx3mseL1aN3VVvOwba00Mdxpd/fMKqDq4RmnSbo9opfYw9
 22cJw2ZWYftl9SvEWOlIfaWcxYg/1PD5whjAy82ATtb1rLkKqhNIADBjR4ci324pmTnh
 LnoWi8a7sk0jFDzis23lSakClZo90GYNeLNOIA5RzMMdYu1l1a5DSga6SGhg4e08HWkU
 EvPrnugBiqZZR1MLjbsNUywnhSVTZGvamYTR3UKLIziehzt5jQU5i2vLnw+00U1siouD
 rlUbSMK3Vo1ShaAvnImFa6A6sG/oK9HhNQSD5ZjQwa5bsezPUCWcvk9I4+6+/YB7Fkwr
 sFWg==
X-Gm-Message-State: AOAM53306RM7kq3WblQJqPTaiPGXhQJKhdPejG1I2gxmXrVJd6Vs8CAo
 BDVIdN4k9cbgOVU2CPfq1iUQ6MJNmlLXgQ==
X-Received: by 2002:a1c:59c3:: with SMTP id n186mr46877wmb.32.1603120395484;
 Mon, 19 Oct 2020 08:13:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y14sm309918wma.48.2020.10.19.08.13.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 08:13:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 10/10] target/arm: Implement FPSCR.LTPSIZE for M-profile
 LOB extension
Date: Mon, 19 Oct 2020 16:13:01 +0100
Message-Id: <20201019151301.2046-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201019151301.2046-1-peter.maydell@linaro.org>
References: <20201019151301.2046-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x344.google.com
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
X-TUID: 9jrcsOyVJP1Q

If the M-profile low-overhead-branch extension is implemented, FPSCR
bits [18:16] are a new field LTPSIZE.  If MVE is not implemented
(currently always true for us) then this field always reads as 4 and
ignores writes.

These bits used to be the vector-length field for the old
short-vector extension, so we need to take care that they are not
misinterpreted as setting vec_len. We do this with a rearrangement
of the vfp_set_fpscr() code that deals with vec_len, vec_stride
and also the QC bit; this obviates the need for the M-profile
only masking step that we used to have at the start of the function.

We provide a new field in CPUState for LTPSIZE, even though this
will always be 4, in preparation for MVE, so we don't have to
come back later and split it out of the vfp.xregs[FPSCR] value.
(This state struct field will be saved and restored as part of
the FPSCR value via the vmstate_fpscr in machine.c.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h        | 1 +
 target/arm/cpu.c        | 9 +++++++++
 target/arm/vfp_helper.c | 6 ++++++
 3 files changed, 16 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a432f301f11..49cd5cabcf2 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -549,6 +549,7 @@ typedef struct CPUARMState {
         uint32_t fpdscr[M_REG_NUM_BANKS];
         uint32_t cpacr[M_REG_NUM_BANKS];
         uint32_t nsacr;
+        int ltpsize;
     } v7m;
 
     /* Information associated with an exception about to be taken:
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 186ee621a65..07492e9f9a4 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -255,6 +255,15 @@ static void arm_cpu_reset(DeviceState *dev)
         uint8_t *rom;
         uint32_t vecbase;
 
+        if (cpu_isar_feature(aa32_lob, cpu)) {
+            /*
+             * LTPSIZE is constant 4 if MVE not implemented, and resets
+             * to an UNKNOWN value if MVE is implemented. We choose to
+             * always reset to 4.
+             */
+            env->v7m.ltpsize = 4;
+        }
+
         if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
             env->v7m.secure = true;
         } else {
diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index c3d01d781b6..bf608d7aef3 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -174,6 +174,12 @@ uint32_t HELPER(vfp_get_fpscr)(CPUARMState *env)
             | (env->vfp.vec_len << 16)
             | (env->vfp.vec_stride << 20);
 
+    /*
+     * M-profile LTPSIZE overlaps A-profile Stride; whichever of the
+     * two is not applicable to this CPU will always be zero.
+     */
+    fpscr |= env->v7m.ltpsize << 16;
+
     fpscr |= vfp_get_fpscr_from_host(env);
 
     i = env->vfp.qc[0] | env->vfp.qc[1] | env->vfp.qc[2] | env->vfp.qc[3];
-- 
2.20.1

