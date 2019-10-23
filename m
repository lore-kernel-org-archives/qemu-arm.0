Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp1011203wrq;
        Wed, 23 Oct 2019 08:05:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxxDyY8WfeF42L2l2WXWgWm5BcOBYJA1VnKJDYb3vSOC4bzXky/3JJE7R/5jCR+SDaKXJvU
X-Received: by 2002:adf:dd4d:: with SMTP id u13mr9010577wrm.104.1571843139126;
        Wed, 23 Oct 2019 08:05:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571843139; cv=none;
        d=google.com; s=arc-20160816;
        b=RTGPbaHVse32JBESWfrGRX3FOT40+htXh4q3zaBJjaL9PbvFasGcUxiXMtOARA/+9P
         FCk6RpCOHfI4cYDi1TC5FBiQxCMUAZGAZqJr26Fa2rFTG+mMhkjp/MjyVcQikeB92ycK
         QDI7z3q+Mpc+Ijz1MADT1G4+biqRxUjlFsgr5JFX9Iy39Ggfa4/B3gwOCnXTpkJyyToL
         RbvOzRNmpYoNM72NhNkFE5S3/5lAydKnEoBXs+P6TpP2maYGB6x8Uv2ENAlAEe0hcrIR
         H5Ey7rWCk5cdV05PxZMQuK99xJ4w6lQDg1Vp0Bw8b/HJrqwyxRlxv1gndqR7idwnLeUU
         ObOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=O5qTDR4/yunqOnDsae4ZjoUIG4TsLVXzaOK/t5hnYkI=;
        b=C8Kyw24JlqRYhZOF2d4CPgvp+IHyo+wpF+MukuY9HJ/Fq+ZsvfZBpzz2a0x8ak7fp8
         8/Tm7sEpLBev0SM06PnjmFuSLNB+3GErZBhIjqboadEIBW6l0Gs37t3VPzoa8ZDaS4x+
         YhTIDkqCczd8MCzBuv0zaQWLlt/76AaNluFpCbJMWNIkF7u02oCgrcifonFlv1ZzRp0K
         B7HB6KhXEprGSv972LhH+ge6WJgTRDJUiYZAPnZDCQUGGKltx2k2J+KSuqH39ZKN6Fqp
         xv4xpXenXDbejudrZ5VSzmgVZBvXijqbnEGLkRJwH00ampZFDXpLUyJgeDUOD+4Pv0is
         An+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Pet1fu4e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c29si3097363edb.223.2019.10.23.08.05.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2019 08:05:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Pet1fu4e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNICf-0002JI-Mi
	for alex.bennee@linaro.org; Wed, 23 Oct 2019 11:05:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34975)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iNI8k-00081h-SS
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 11:01:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iNI8a-00018F-NP
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 11:01:28 -0400
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843]:43322)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iNI8W-00013b-L6
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 11:01:21 -0400
Received: by mail-qt1-x843.google.com with SMTP id t20so32711159qtr.10
 for <qemu-arm@nongnu.org>; Wed, 23 Oct 2019 08:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O5qTDR4/yunqOnDsae4ZjoUIG4TsLVXzaOK/t5hnYkI=;
 b=Pet1fu4e7LakqP3u68K6uZ+/Iyt//Fgw/D84p3kOucDpKrfxCMc6K6Ei7qH/Rd3ndI
 IzFfX3iilQ1P34GmmOeaHEYgFTJSnpE3sZ9chPuAgzbp3DE/POVFkGni955VtV4VcsZc
 UnndodFZ9UZ6YNzsJ7fWr2bKHC6yi6RIHH6W+j68aQwzLHGYIN3pnPXQ1f9PQkNHgLJI
 760t9YTGtvDWeoCpeBJmTrMCz6cjslMIfiuVOBG7QqjIOd1ml8R/zjf56XDOMIQH/8fl
 7OFEu0heiQV+lDYbvg1Un4UzVooGs9sEFYUdKM814h8piOv7prGL2uopxkbQI8KzOPJO
 QlPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O5qTDR4/yunqOnDsae4ZjoUIG4TsLVXzaOK/t5hnYkI=;
 b=FMxaYN/bVv3iK0v04/rPrcJzd77vcqfkNbC2O7x9Soz7GiadZmRGoo51bv0yPr+lF9
 avQi7hRVZr2SpqVIy84iWUj16v9x5a2qi3TywrgvB/F8kXreEJROdFGzbA8xAeehXExL
 UbRsyQN9/NgftTuXLWCtfwLi1s/Af+JLSD7hmAmhXR4spDAxllOizMZXkfgZzkVD+uTm
 mdTEzwKGREwHAurMaejcnLQNvlL713BkbJ1kjc+AAYGQfDBOuMYJQMH1PU/avzVIPhf6
 T+JAUMu4WjmXFI500bjO4c+GmymaEN/pvO0Zw+aQZX7b6G3Hcnts30/88sgorr5quTSX
 UpsA==
X-Gm-Message-State: APjAAAVaojZb/FT61MQWUNQUCdBAgs6dfq48aTUmBOgyB8Xa2G5roQ7z
 /cLiJk4PNsDQn8nhkkxftuRf5w==
X-Received: by 2002:ac8:6c9:: with SMTP id j9mr9311096qth.81.1571842870635;
 Wed, 23 Oct 2019 08:01:10 -0700 (PDT)
Received: from localhost.localdomain (198-4-20-64.static.cosmoweb.net.
 [64.20.4.198])
 by smtp.gmail.com with ESMTPSA id l189sm11030168qke.69.2019.10.23.08.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 08:01:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 06/24] target/arm: Reduce tests vs M-profile in
 cpu_get_tb_cpu_state
Date: Wed, 23 Oct 2019 11:00:39 -0400
Message-Id: <20191023150057.25731-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191023150057.25731-1-richard.henderson@linaro.org>
References: <20191023150057.25731-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::843
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
X-TUID: csXw2QLPF6vb

Hoist the computation of some TBFLAG_A32 bits that only apply to
M-profile under a single test for ARM_FEATURE_M.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 49 +++++++++++++++++++++------------------------
 1 file changed, 23 insertions(+), 26 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index d4303420da..296a4b2232 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11194,6 +11194,29 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
 
         if (arm_feature(env, ARM_FEATURE_M)) {
             flags = rebuild_hflags_m32(env, fp_el, mmu_idx);
+
+            if (arm_feature(env, ARM_FEATURE_M_SECURITY) &&
+                FIELD_EX32(env->v7m.fpccr[M_REG_S], V7M_FPCCR, S)
+                != env->v7m.secure) {
+                flags = FIELD_DP32(flags, TBFLAG_A32, FPCCR_S_WRONG, 1);
+            }
+
+            if ((env->v7m.fpccr[env->v7m.secure] & R_V7M_FPCCR_ASPEN_MASK) &&
+                (!(env->v7m.control[M_REG_S] & R_V7M_CONTROL_FPCA_MASK) ||
+                 (env->v7m.secure &&
+                  !(env->v7m.control[M_REG_S] & R_V7M_CONTROL_SFPA_MASK)))) {
+                /*
+                 * ASPEN is set, but FPCA/SFPA indicate that there is no
+                 * active FP context; we must create a new FP context before
+                 * executing any FP insn.
+                 */
+                flags = FIELD_DP32(flags, TBFLAG_A32, NEW_FP_CTXT_NEEDED, 1);
+            }
+
+            bool is_secure = env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_S_MASK;
+            if (env->v7m.fpccr[is_secure] & R_V7M_FPCCR_LSPACT_MASK) {
+                flags = FIELD_DP32(flags, TBFLAG_A32, LSPACT, 1);
+            }
         } else {
             flags = rebuild_hflags_common_32(env, fp_el, mmu_idx, 0);
         }
@@ -11233,32 +11256,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
         }
     }
 
-    if (arm_feature(env, ARM_FEATURE_M_SECURITY) &&
-        FIELD_EX32(env->v7m.fpccr[M_REG_S], V7M_FPCCR, S) != env->v7m.secure) {
-        flags = FIELD_DP32(flags, TBFLAG_A32, FPCCR_S_WRONG, 1);
-    }
-
-    if (arm_feature(env, ARM_FEATURE_M) &&
-        (env->v7m.fpccr[env->v7m.secure] & R_V7M_FPCCR_ASPEN_MASK) &&
-        (!(env->v7m.control[M_REG_S] & R_V7M_CONTROL_FPCA_MASK) ||
-         (env->v7m.secure &&
-          !(env->v7m.control[M_REG_S] & R_V7M_CONTROL_SFPA_MASK)))) {
-        /*
-         * ASPEN is set, but FPCA/SFPA indicate that there is no active
-         * FP context; we must create a new FP context before executing
-         * any FP insn.
-         */
-        flags = FIELD_DP32(flags, TBFLAG_A32, NEW_FP_CTXT_NEEDED, 1);
-    }
-
-    if (arm_feature(env, ARM_FEATURE_M)) {
-        bool is_secure = env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_S_MASK;
-
-        if (env->v7m.fpccr[is_secure] & R_V7M_FPCCR_LSPACT_MASK) {
-            flags = FIELD_DP32(flags, TBFLAG_A32, LSPACT, 1);
-        }
-    }
-
     if (!arm_feature(env, ARM_FEATURE_M)) {
         int target_el = arm_debug_target_el(env);
 
-- 
2.17.1

