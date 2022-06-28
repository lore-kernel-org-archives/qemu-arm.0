Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2896004lft;
        Mon, 27 Jun 2022 21:54:37 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1voREuhPDcSGy9VvcffZduI60RzFmXA6mFtv5czuQN51X2EElXO0W+2puuz9LC0KajroRoD
X-Received: by 2002:a05:620a:123c:b0:6af:7:c7c5 with SMTP id v28-20020a05620a123c00b006af0007c7c5mr10504088qkj.416.1656392077562;
        Mon, 27 Jun 2022 21:54:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656392077; cv=none;
        d=google.com; s=arc-20160816;
        b=H2H2kj84kgZsYnbeWZS1HVU9kqJKfKL46aNCYaHI9pRabrypJwXmV8O8y6+0R0tU6h
         7DMHhvORZ+RHmSx6R4ogFEOUF/NOuTWkZYOKUVeH3yIQkCHFO/JWzZ9OMAq69+P61l/U
         JBaIvHa7+UBhNavjJbBabFaspIbjEDRuR87gYLnKnI7ex00+UzoL9ebpJaA4rh59Py/Z
         xIEjmkZ7s8oKuYxYX2pdt4DV5M6p3y96NFD1ginEpQ5UnxgZEKQBlWHYuNN4s1w9N6Ht
         4z5HUPTiHwP3o3g1a6lewli6xOvEDVEN1J5b0TAfgchQ3mxKoKpuYrdVtpIONGrF8JJb
         JO1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XzmAsw+HehUgAR34ijj4idKuyBEWb7euFeYY0G4Evdg=;
        b=0zLAdpEkL7JpH8BYE8TGHI4qWtKQhH6Yzm4hHAXdzflJLhQiEhLe1TJUQUcLulB9kk
         pJDWxqxOLOcZ2lzUNvVNmJLl66RjFioNXIZT3DuKxrykqKTPImFjxIs6dUgtsR+G/Vni
         j0zRhqK9aWMLeTEtQ0GBy/79ZPrDn7ZfKmhFFR5kuj68DbuGz2GLOG0O+QZ7/Awy4K4b
         /+MTowMkalXs3Tayvh/GJ+WKhEvLSBQ3bQ0+dqrChpAWQMdnudaDdEP02qd8tSZkrv6j
         phohQDEx1UMIo7KJnHsmneuqSOzfw/v1wZrt9Wyz3E4MOEHW89uNsDjsew5oMhECUiRL
         uCuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gUGPKIvi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m21-20020a05620a24d500b006aef3d36f9bsi8690028qkn.447.2022.06.27.21.54.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jun 2022 21:54:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gUGPKIvi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o63FF-00022C-14
	for alex.bennee@linaro.org; Tue, 28 Jun 2022 00:54:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62ni-0000EV-Ek
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 00:26:10 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:34500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62ng-0004Nu-A4
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 00:26:09 -0400
Received: by mail-pl1-x62f.google.com with SMTP id jh14so9999970plb.1
 for <qemu-arm@nongnu.org>; Mon, 27 Jun 2022 21:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XzmAsw+HehUgAR34ijj4idKuyBEWb7euFeYY0G4Evdg=;
 b=gUGPKIvi4ZWycsTjoR8nwk2UV/r9O8uhCXbDBVxirKqVAPBwE34Pxsvn7s4TZvvUJU
 7wsgMD2ZATeXWLH+l+5GNQHbmuQjt/mRz+ilPXVVgHZ9Mu5vNhfVi+MZaNcBowXwmgDD
 MdhO5VFBLK6A7slOhDRMExECC/9Dp1EauxpwhsYy6K2p7SAcZiPtpoqkNC1PcswtpFV8
 LC59T550tYuqQcSuFs32Q0GqP7hz+VccV+sajI4hTROAdf2FFzfhJiOTC0F9jU1EJ8gI
 F/uJ4VzhwXgCXrgLT2JR/nvpFFfd8LWFOeSJV14wXpFdaLTjPV1JaKaMdIWK1SPEaFvI
 fPTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XzmAsw+HehUgAR34ijj4idKuyBEWb7euFeYY0G4Evdg=;
 b=Ba8PgErIyCgcd/6lrs7RnAX/+aq15vDx1oxEnWrEHGRJL9SdIQz3fbbKUs40G2WIj0
 XHwR5FvVrPZ5A1yb6CiItRQS4cA5CWOX4AKq1r1LYFfV2EcEo4OJz84lb/TGkfe1GANS
 NBaWEF8wQTfQdc7C1wxM5YU+uQ8c2DMGygSbJGv0ayfALLljec897Xvo6iRLgAh3K6il
 gIK+YXudt9eGhfUefxWBZoGou6P+ifzB/kui3HLXTqT538vkwGmjxW0aMUGyDpUejiAv
 W0cDaJHczPAwKU7xbRQkjESey23ug23u+BosZMaNFg+nSRXOOySg2fpf9FhcdlSOSHsd
 UtHQ==
X-Gm-Message-State: AJIora+c6gkZdlJGdJV/pp3l1tGnVdIqjPuQ8sO0NJhSUx3fCbv9+3Pm
 TdX6a2itfUcxvX56prBPItyKEQ==
X-Received: by 2002:a17:90b:4c92:b0:1ec:ea7c:89af with SMTP id
 my18-20020a17090b4c9200b001ecea7c89afmr25144105pjb.195.1656390366971; 
 Mon, 27 Jun 2022 21:26:06 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 k26-20020aa7821a000000b0052517150777sm8160565pfi.41.2022.06.27.21.26.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:26:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 42/45] linux-user/aarch64: Implement PR_SME_GET_VL,
 PR_SME_SET_VL
Date: Tue, 28 Jun 2022 09:51:14 +0530
Message-Id: <20220628042117.368549-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628042117.368549-1-richard.henderson@linaro.org>
References: <20220628042117.368549-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4RPAPxYqvIxU

These prctl set the Streaming SVE vector length, which may
be completely different from the Normal SVE vector length.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/target_prctl.h | 48 +++++++++++++++++++++++++++++++
 linux-user/syscall.c              | 16 +++++++++++
 2 files changed, 64 insertions(+)

diff --git a/linux-user/aarch64/target_prctl.h b/linux-user/aarch64/target_prctl.h
index 40481e6663..f8f8f88992 100644
--- a/linux-user/aarch64/target_prctl.h
+++ b/linux-user/aarch64/target_prctl.h
@@ -10,6 +10,7 @@ static abi_long do_prctl_sve_get_vl(CPUArchState *env)
 {
     ARMCPU *cpu = env_archcpu(env);
     if (cpu_isar_feature(aa64_sve, cpu)) {
+        /* PSTATE.SM is always unset on syscall entry. */
         return sve_vq(env) * 16;
     }
     return -TARGET_EINVAL;
@@ -27,6 +28,7 @@ static abi_long do_prctl_sve_set_vl(CPUArchState *env, abi_long arg2)
         && arg2 >= 0 && arg2 <= 512 * 16 && !(arg2 & 15)) {
         uint32_t vq, old_vq;
 
+        /* PSTATE.SM is always unset on syscall entry. */
         old_vq = sve_vq(env);
 
         /*
@@ -49,6 +51,52 @@ static abi_long do_prctl_sve_set_vl(CPUArchState *env, abi_long arg2)
 }
 #define do_prctl_sve_set_vl do_prctl_sve_set_vl
 
+static abi_long do_prctl_sme_get_vl(CPUArchState *env)
+{
+    ARMCPU *cpu = env_archcpu(env);
+    if (cpu_isar_feature(aa64_sme, cpu)) {
+        return sme_vq(env) * 16;
+    }
+    return -TARGET_EINVAL;
+}
+#define do_prctl_sme_get_vl do_prctl_sme_get_vl
+
+static abi_long do_prctl_sme_set_vl(CPUArchState *env, abi_long arg2)
+{
+    /*
+     * We cannot support either PR_SME_SET_VL_ONEXEC or PR_SME_VL_INHERIT.
+     * Note the kernel definition of sve_vl_valid allows for VQ=512,
+     * i.e. VL=8192, even though the architectural maximum is VQ=16.
+     */
+    if (cpu_isar_feature(aa64_sme, env_archcpu(env))
+        && arg2 >= 0 && arg2 <= 512 * 16 && !(arg2 & 15)) {
+        int vq, old_vq;
+
+        old_vq = sme_vq(env);
+
+        /*
+         * Bound the value of vq, so that we know that it fits into
+         * the 4-bit field in SMCR_EL1.  Because PSTATE.SM is cleared
+         * on syscall entry, we are not modifying the current SVE
+         * vector length.
+         */
+        vq = MAX(arg2 / 16, 1);
+        vq = MIN(vq, 16);
+        env->vfp.smcr_el[1] =
+            FIELD_DP64(env->vfp.smcr_el[1], SMCR, LEN, vq - 1);
+        vq = sme_vq(env);
+
+        if (old_vq != vq) {
+            /* PSTATE.ZA state is cleared on any change to VQ. */
+            env->svcr = FIELD_DP64(env->svcr, SVCR, ZA, 0);
+            arm_rebuild_hflags(env);
+        }
+        return vq * 16;
+    }
+    return -TARGET_EINVAL;
+}
+#define do_prctl_sme_set_vl do_prctl_sme_set_vl
+
 static abi_long do_prctl_reset_keys(CPUArchState *env, abi_long arg2)
 {
     ARMCPU *cpu = env_archcpu(env);
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index cbde82c907..991b85e6b4 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6343,6 +6343,12 @@ abi_long do_arch_prctl(CPUX86State *env, int code, abi_ulong addr)
 #ifndef PR_SET_SYSCALL_USER_DISPATCH
 # define PR_SET_SYSCALL_USER_DISPATCH 59
 #endif
+#ifndef PR_SME_SET_VL
+# define PR_SME_SET_VL  63
+# define PR_SME_GET_VL  64
+# define PR_SME_VL_LEN_MASK  0xffff
+# define PR_SME_VL_INHERIT   (1 << 17)
+#endif
 
 #include "target_prctl.h"
 
@@ -6383,6 +6389,12 @@ static abi_long do_prctl_inval1(CPUArchState *env, abi_long arg2)
 #ifndef do_prctl_set_unalign
 #define do_prctl_set_unalign do_prctl_inval1
 #endif
+#ifndef do_prctl_sme_get_vl
+#define do_prctl_sme_get_vl do_prctl_inval0
+#endif
+#ifndef do_prctl_sme_set_vl
+#define do_prctl_sme_set_vl do_prctl_inval1
+#endif
 
 static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long arg2,
                          abi_long arg3, abi_long arg4, abi_long arg5)
@@ -6434,6 +6446,10 @@ static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long arg2,
         return do_prctl_sve_get_vl(env);
     case PR_SVE_SET_VL:
         return do_prctl_sve_set_vl(env, arg2);
+    case PR_SME_GET_VL:
+        return do_prctl_sme_get_vl(env);
+    case PR_SME_SET_VL:
+        return do_prctl_sme_set_vl(env, arg2);
     case PR_PAC_RESET_KEYS:
         if (arg3 || arg4 || arg5) {
             return -TARGET_EINVAL;
-- 
2.34.1

