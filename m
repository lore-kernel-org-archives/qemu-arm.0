Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp2403034lfb;
        Tue, 7 Jun 2022 13:36:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9MEpWtjKMP7hUh+fTbIVmHLLOVZiMNv/UPdQlUnNSIWs6kILJCFscJZkZSFr4JwChFm1S
X-Received: by 2002:a05:622a:1305:b0:2f3:e1b1:c622 with SMTP id v5-20020a05622a130500b002f3e1b1c622mr24172485qtk.137.1654634179439;
        Tue, 07 Jun 2022 13:36:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654634179; cv=none;
        d=google.com; s=arc-20160816;
        b=QfGc3IgyVqyIiXrarpakZPZnnlxES6GHKqWnlQXO7oPho12fe4Srl23i1kDKBTBXmD
         f8XPqCAr53gQUMuCtd8zC94zJ6d7czHeRXCiw+Id5IbrGF0Xf3eW7/vEMyY8LjD3v8OM
         Diqzta6jdME9IyWN2gzpR+f2XQfXqX6srW5pWr5UZvT4RT7O/c6ylO5vW403oOocUsGb
         2Mc44kc9i1gEstIMqNjpPYAFCelPA4BMxFQNd6anNlzl/denQqoU65RQac34Bdr+YSWj
         GyYjb/8Rlhw7ilvzdqOgjfAoYoQrTdDUkj4BHb9a5IaLHndd0DH/jv8yZyCkeO/G8B5R
         apWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5Y1P1Y+Ffb//73mSlBoiFZFZX3qfQHSQssa2vHrkCbU=;
        b=uY8LHAUBCKVCn2IewjocKP1sOu0rPA/DDPaxxp+yNYK39Y8Tu0862bvwlObBt+8CbN
         4sWjM756IfzrP8hILg/EIgkJOvoyDV81JxugQfnEeTSYQjQFpKgFtmtTLLYanKQXv11S
         3RlGZgvmUG/br/YLzyhxdGoEnEa5jwaIvKEqLGqZ4zVb2fBIkHh5NB0xE9ny6D8HXdeV
         SBRC90gjDjhx2Y/nDTzXNhVoYDcuozcuu0DiFvfQwPVlAvvGGPxVDETLppvy1qgJKzFE
         NXJknT0OatsdRSlEwr3e261obdXXZrZ01E4leX840JV5QE1gSJnxmygF3LuPsICf4KDD
         2iRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e7s6XLU3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z18-20020a05622a061200b00304ec1f752asi3838850qta.248.2022.06.07.13.36.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jun 2022 13:36:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e7s6XLU3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyfw2-00050A-Un
	for alex.bennee@linaro.org; Tue, 07 Jun 2022 16:36:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyft5-0007Du-PW
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:33:15 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:46976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyft1-0007Bp-12
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:33:15 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 k5-20020a17090a404500b001e8875e6242so5675467pjg.5
 for <qemu-arm@nongnu.org>; Tue, 07 Jun 2022 13:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5Y1P1Y+Ffb//73mSlBoiFZFZX3qfQHSQssa2vHrkCbU=;
 b=e7s6XLU3e+TZeIlsfNcOEYyQpDmpnKxIhCX8e/s4WsAluW8iDW6yAtUSkPVrwHokYU
 xKxJfUQTPrd2So2zNtGkbMTwWmoofM71hlsU2S6mNC8/2VR01BPmxQYDPwDjyNSmCw9j
 1Tavx57VU0YoFDHjUCIy+DV9aZ1JyYYoogfJ/wbaF1uAW2KryA7/tE2RSlakiKkK998P
 I8NW3wSeiMf1uEq0qjv37ywAaXTjbkxJbDc0mA9NwU7PCHCA3opiUrSVTWDHy7hUCGK9
 k7gUNWdpiAYUCjx5fS5D3rj3Pf2ZLNc0XbfhBj8FSoG5I4D2SH6O6Q2oCsxeNODRgweU
 wmrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5Y1P1Y+Ffb//73mSlBoiFZFZX3qfQHSQssa2vHrkCbU=;
 b=k0aPlIyHAbrnyXGe8zIS8e2jsAlMCw6iTLXGzjftssaRpJSpy78WUEiIDXycjtdsK0
 ASsslkcK+pEFsMkpAGlh3bvF1udKxfL9ktP6F1iNQJnv/2p5P49Fiak4uSwYz3VS/bai
 0HxJpXVUERCmKCrs0IY38OCrVykhlGZdYgMSHkCfuFZMdh5ivwTpvhP6VTVeyhqilNIk
 w35BBptMWq1UFFFiwActYmnUBpRYcn6QalysnMF+EjOUY3t6wouLdHv7dSfJCM4/RiNg
 urGSWx7x+8Xj0QSftvvwX75aL/m5qojafqXl0plPfYuD4HVAvIAetO8mTCEUpe4/OJt4
 MvkQ==
X-Gm-Message-State: AOAM532VjpeLaXkFRQ5Uogtkgddy7S4Sjpcxbnjnd1uwuIHy052d/rS/
 pX20V2mJrShrHZ+AAMZhN1cdMA==
X-Received: by 2002:a17:90a:bc98:b0:1e8:6895:645e with SMTP id
 x24-20020a17090abc9800b001e86895645emr17990399pjr.131.1654633989714; 
 Tue, 07 Jun 2022 13:33:09 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090aba1600b001d9780b7779sm4227856pjr.15.2022.06.07.13.33.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:33:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 02/71] linux-user/aarch64: Introduce sve_vq
Date: Tue,  7 Jun 2022 13:31:57 -0700
Message-Id: <20220607203306.657998-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jnzRw25ucZFR

Add an interface function to extract the digested vector length
rather than the raw zcr_el[1] value.  This fixes an incorrect
return from do_prctl_set_vl where we didn't take into account
the set of vector lengths supported by the cpu.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Add sve_vq_cached rather than directly access hflags.
v3: Rename to sve_vq.
---
 linux-user/aarch64/target_prctl.h | 20 +++++++++++++-------
 target/arm/cpu.h                  | 11 +++++++++++
 linux-user/aarch64/signal.c       |  4 ++--
 3 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/linux-user/aarch64/target_prctl.h b/linux-user/aarch64/target_prctl.h
index 3f5a5d3933..1d440ffbea 100644
--- a/linux-user/aarch64/target_prctl.h
+++ b/linux-user/aarch64/target_prctl.h
@@ -10,7 +10,7 @@ static abi_long do_prctl_get_vl(CPUArchState *env)
 {
     ARMCPU *cpu = env_archcpu(env);
     if (cpu_isar_feature(aa64_sve, cpu)) {
-        return ((cpu->env.vfp.zcr_el[1] & 0xf) + 1) * 16;
+        return sve_vq(env) * 16;
     }
     return -TARGET_EINVAL;
 }
@@ -25,18 +25,24 @@ static abi_long do_prctl_set_vl(CPUArchState *env, abi_long arg2)
      */
     if (cpu_isar_feature(aa64_sve, env_archcpu(env))
         && arg2 >= 0 && arg2 <= 512 * 16 && !(arg2 & 15)) {
-        ARMCPU *cpu = env_archcpu(env);
         uint32_t vq, old_vq;
 
-        old_vq = (env->vfp.zcr_el[1] & 0xf) + 1;
-        vq = MAX(arg2 / 16, 1);
-        vq = MIN(vq, cpu->sve_max_vq);
+        old_vq = sve_vq(env);
 
+        /*
+         * Bound the value of arg2, so that we know that it fits into
+         * the 4-bit field in ZCR_EL1.  Rely on the hflags rebuild to
+         * sort out the length supported by the cpu.
+         */
+        vq = MAX(arg2 / 16, 1);
+        vq = MIN(vq, ARM_MAX_VQ);
+        env->vfp.zcr_el[1] = vq - 1;
+        arm_rebuild_hflags(env);
+
+        vq = sve_vq(env);
         if (vq < old_vq) {
             aarch64_sve_narrow_vq(env, vq);
         }
-        env->vfp.zcr_el[1] = vq - 1;
-        arm_rebuild_hflags(env);
         return vq * 16;
     }
     return -TARGET_EINVAL;
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 015ce12fe2..6e35e30000 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3286,6 +3286,17 @@ static inline int cpu_mmu_index(CPUARMState *env, bool ifetch)
     return EX_TBFLAG_ANY(env->hflags, MMUIDX);
 }
 
+/**
+ * sve_vq
+ * @env: the cpu context
+ *
+ * Return the VL cached within env->hflags, in units of quadwords.
+ */
+static inline int sve_vq(CPUARMState *env)
+{
+    return EX_TBFLAG_A64(env->hflags, VL) + 1;
+}
+
 static inline bool bswap_code(bool sctlr_b)
 {
 #ifdef CONFIG_USER_ONLY
diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 7de4c96eb9..7da0e36c6d 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -315,7 +315,7 @@ static int target_restore_sigframe(CPUARMState *env,
 
         case TARGET_SVE_MAGIC:
             if (cpu_isar_feature(aa64_sve, env_archcpu(env))) {
-                vq = (env->vfp.zcr_el[1] & 0xf) + 1;
+                vq = sve_vq(env);
                 sve_size = QEMU_ALIGN_UP(TARGET_SVE_SIG_CONTEXT_SIZE(vq), 16);
                 if (!sve && size == sve_size) {
                     sve = (struct target_sve_context *)ctx;
@@ -434,7 +434,7 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
 
     /* SVE state needs saving only if it exists.  */
     if (cpu_isar_feature(aa64_sve, env_archcpu(env))) {
-        vq = (env->vfp.zcr_el[1] & 0xf) + 1;
+        vq = sve_vq(env);
         sve_size = QEMU_ALIGN_UP(TARGET_SVE_SIG_CONTEXT_SIZE(vq), 16);
         sve_ofs = alloc_sigframe_space(sve_size, &layout);
     }
-- 
2.34.1

