Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5227677lfh;
        Thu, 2 Jun 2022 16:00:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRxJ68eIl7nyGhj1rGgnOGYmBxWVZPcQHJnw3YbU2i6vXrs3cw8Gxz4784COqf1jvG+bZK
X-Received: by 2002:a05:622a:1754:b0:302:79cd:855d with SMTP id l20-20020a05622a175400b0030279cd855dmr5488798qtk.571.1654210831082;
        Thu, 02 Jun 2022 16:00:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654210831; cv=none;
        d=google.com; s=arc-20160816;
        b=RUALjXCHOFOKGPKIg80nX41nAZNePNrHNjjxUwJpzkL1gpnI4B6BF4IJLjSMX9xYq1
         KwizBZhcqr6GI6yHNqEEKmC0PDrXJYxuC8BN3PkUTjpy6Mysuw0CGbBEC3+4/di4qBaX
         q22wV+4ktTm6Y1PhYzVcyOR6w1RcsMQEWAQTZX/zB7I1SVGVJCWgFoKzLRuq5r4V4cJg
         MBc0TqhJiqh1oZo0rnMq27kqs1xo+3UmG8BavxhkV96Vn2Pk8sRnj7yhutDDdZ2ZUSnS
         RTQ5R6OXV9xeE4H5hnSAzyLy7SE7/m/KmnUqr2CnCR5hQMqGCdBFuMke/JfMQ6pLdq/K
         L2zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LhGeTTc5zjX7U0kCCpIqQRg/F4IwvyDy51EbtKdkfIA=;
        b=vzhlJHtzPTzUWl57n8PuUhh6GXsgU6Iv2K0pdIz5N8O4qlznUbdd1ha4ClXv3T/Vp8
         ygI51VZfkHLkkAwNDcRhOrwCVFJvmveI9+rcKFbILJNqRmMLGTjJzQeitK7Gv2lJIXnl
         rd+ccsXyHGrXENTUN/iS4FlX6iU+QNFoeec4C+GSbyHfm5b4VnDUxaALlO8XOWgKbmdm
         oqZa3l2AWkKUI+fliz809RP1iPduKtX/n3KJnGTRITpXo07AWXu4vgvEEvbVZE7oB8ZU
         8vF+EmAu9VtG7KyilifSl7U8ZoRvKGf+7/n317Zcj/XaH6ImGI+Rjwc6DlkS+DyoZPwN
         rUBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=battyZXz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o15-20020a05622a008f00b002f3e2226beasi2514510qtw.234.2022.06.02.16.00.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jun 2022 16:00:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=battyZXz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwtnq-0004IA-Jr
	for alex.bennee@linaro.org; Thu, 02 Jun 2022 19:00:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskS-0001iu-Kr
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:52:59 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:36707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskQ-0000up-Tu
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:52:56 -0400
Received: by mail-pl1-x636.google.com with SMTP id u18so5552431plb.3
 for <qemu-arm@nongnu.org>; Thu, 02 Jun 2022 14:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LhGeTTc5zjX7U0kCCpIqQRg/F4IwvyDy51EbtKdkfIA=;
 b=battyZXzGMcXgwqTIxlqa+WlrhE0J0uLCTA1YJTvqZrdmFkCXwqDUnHCv9iVFquWOF
 3juQYSw9sSHjuCyj2OvaiOVNp8gh9fVGiiQNxVi5A5lzer54jF1EKrOacJERNvLOaVhG
 sRpm53ADVTZlvZFHRrx8zA8mF77tadfwfftyQuuC4AFPZrUpfOwPNSPld0khb2FT3SxZ
 +JfaRlouYCOXZ+64T4tyFS2eSQOEezaHSYBr97ji9BeWvm9gd5Cyf9ThY0QqDERsV/ne
 sfMb/nhqn/pEPlbxkj+pKliGqfCu30TzXBDAH/geXSumDabjyMX0ttVF8+2FdNc12B+R
 xAnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LhGeTTc5zjX7U0kCCpIqQRg/F4IwvyDy51EbtKdkfIA=;
 b=NUOnFbHj9GMZAKDI5qKKpsxGKjCxe3xmJki0hkKwyYZ7TVBCghHLyhkTU4xsDObZh8
 dB3uiiUWOe7LbcjRuyXIJ2n97l/51JS6ZJE86oUp77jsPrCcmuMhLvVX3Jbm1Ch3uE5Q
 8vvu8oEW9m0K01T0qV7H5s642IbnjAjGahqe+7n6AMinN3iJsV8uxxC+xoHZSK24ckW8
 I0QycWd3dk7pcv+Jk63L0SDMxtQPDZI198QjGc3IDpOpqootlx21WvCMuHL019NpFLAS
 xLIu9qsDjbL9d8BD/YJU614dXAIwV1MdoFMu81jllK/HRWM8O1nx3kuSB9TX1CNXsydT
 npzQ==
X-Gm-Message-State: AOAM532BYV95kv2VhMwx454IaJpFwcn8qIHupoCL2W+YnsnUzfkFoOVl
 LBQVZ6V4H982XIZoBOLFzZrQs0xslgKnnw==
X-Received: by 2002:a17:902:b588:b0:161:64fe:af8c with SMTP id
 a8-20020a170902b58800b0016164feaf8cmr6973422pls.26.1654206774062; 
 Thu, 02 Jun 2022 14:52:54 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a170902ed8e00b0015edfccfdb5sm4039605plj.50.2022.06.02.14.52.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:52:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 68/71] linux-user/aarch64: Implement PR_SME_GET_VL,
 PR_SME_SET_VL
Date: Thu,  2 Jun 2022 14:48:50 -0700
Message-Id: <20220602214853.496211-69-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
X-TUID: gH4EJNGnDF98

These prctl set the Streaming SVE vector length, which may
be completely different from the Normal SVE vector length.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/target_prctl.h | 48 +++++++++++++++++++++++++++++++
 linux-user/syscall.c              | 16 +++++++++++
 2 files changed, 64 insertions(+)

diff --git a/linux-user/aarch64/target_prctl.h b/linux-user/aarch64/target_prctl.h
index 3c2ef734fe..01282bd78c 100644
--- a/linux-user/aarch64/target_prctl.h
+++ b/linux-user/aarch64/target_prctl.h
@@ -10,6 +10,7 @@ static abi_long do_prctl_sve_get_vl(CPUArchState *env)
 {
     ARMCPU *cpu = env_archcpu(env);
     if (cpu_isar_feature(aa64_sve, cpu)) {
+        /* PSTATE.SM is always unset on syscall entry. */
         return sve_vq_cached(env) * 16;
     }
     return -TARGET_EINVAL;
@@ -27,6 +28,7 @@ static abi_long do_prctl_sve_set_vl(CPUArchState *env, abi_long arg2)
         && arg2 >= 0 && arg2 <= 512 * 16 && !(arg2 & 15)) {
         uint32_t vq, old_vq;
 
+        /* PSTATE.SM is always unset on syscall entry. */
         old_vq = sve_vq_cached(env);
 
         /*
@@ -49,6 +51,52 @@ static abi_long do_prctl_sve_set_vl(CPUArchState *env, abi_long arg2)
 }
 #define do_prctl_sve_set_vl do_prctl_sve_set_vl
 
+static abi_long do_prctl_sme_get_vl(CPUArchState *env)
+{
+    ARMCPU *cpu = env_archcpu(env);
+    if (cpu_isar_feature(aa64_sme, cpu)) {
+        return sme_vq_cached(env) * 16;
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
+        old_vq = sme_vq_cached(env);
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
+        vq = sme_vq_cached(env);
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
index a7f41ef0ac..e8d6e20b85 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6346,6 +6346,12 @@ abi_long do_arch_prctl(CPUX86State *env, int code, abi_ulong addr)
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
 
@@ -6386,6 +6392,12 @@ static abi_long do_prctl_inval1(CPUArchState *env, abi_long arg2)
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
@@ -6437,6 +6449,10 @@ static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long arg2,
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

