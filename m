Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp685440lfq;
        Fri, 15 Jan 2021 15:07:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyyEjpdI6iCOBEirRWBWNiklM8E77ajtFqqeRVtcTqJum41fI8hXtDYmOdplp0FZZlA6+Iw
X-Received: by 2002:a25:c54b:: with SMTP id v72mr20851019ybe.258.1610752079459;
        Fri, 15 Jan 2021 15:07:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610752079; cv=none;
        d=google.com; s=arc-20160816;
        b=aJzhDyndcbaCf/X/Qr/exSTZ0fVm99wZUO3AAbINxPsM1tnjmKvDFMKD7OWncZnn1n
         zQJMs5VI5vR9WexvEd2JHYC7Chv2JPsm8XJN0jpGzbNP2gPC/ehsuHJczjdE+rVWeM/a
         y6KWMF44tqlF9u8ZVnAKokqDX2y0i4GNfNXZJKWbFrH2RtxkhTut0Idg07gQDpbmBxZl
         X0JVZoZ+7n3EC3ksH0kMKllof1CURB1KGUwVDdMkATI7i0dIcfflgQnrAsOfPOS7pogJ
         dcJbI2KwBFtXq1WocxaDqTuj871mnGNVkq50Qaivpt06B/nODxfFvnZcw/0FN/RKLp7h
         t4nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=tHmvo/lrgkE+wi7yTJ56b6ape2S0MwV/XIHtk24Q15o=;
        b=g3Urlsxqg8KIbvlpmOwQAVoIBY91lizliFPrr5jc7NCakjKBDdGuVWNQxvWXKuaO1m
         tWUWizHFU/W3gtHzYR9jJ2LreIzuMx2cWM05PEEm87MCxooAdzwu4D6jGXiBf0JWSBfl
         GjjFQF1nd3fsrZDIubdmt2rtkRmN2E3AzIOobx4Kmzy4ukYd0+5U/7u4cZDASJxBXrrx
         dFb+5UUDIdJpmrwqpsNMhm83Mp+jvchoUiqX1sFQC3ga+tcz+meS/MuAchRLLIdBYSdv
         3TwTRPzAkTcyguvuN9lx8w4aHUB8uuTbkiascquQPFJYMciwnDS0D9fICzyaXirJLGtR
         6UBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PVQmPkDZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g205si9122876ybg.317.2021.01.15.15.07.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Jan 2021 15:07:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PVQmPkDZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l0YCE-0004ev-Q4
	for alex.bennee@linaro.org; Fri, 15 Jan 2021 18:07:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0XsH-0003i9-MQ
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:47:21 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:38709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0Xs6-0005GS-NP
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:47:21 -0500
Received: by mail-pf1-x430.google.com with SMTP id y205so584029pfc.5
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 14:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tHmvo/lrgkE+wi7yTJ56b6ape2S0MwV/XIHtk24Q15o=;
 b=PVQmPkDZuObSBMkVwP5TC2YbQzB6YZQzbNKRTYz3x3rJSlCRRm0EoPoK+HCBeT+qJr
 urbUWkSE4m9Gr4Fq/sWX64x07lVAHJRHqAU/GEXnEDERyNBHqEtxng4fF+kWGLJV8stJ
 /QUkhOlXkY0dwVqvr8yqRy5T6kUj2KzXKPBcmzGrtKOqOz0hq9dvKCD7+372kFaB3OyF
 /Jzq9QAh4+6pz8D7bvPvV7BO+GV/cdoBEKrLGwmZ17KQjOQEmEgBhlPl4yQzpQhWyin0
 TDppDi9gSmVa3mxyPXHEe4hCqFdmweQSGp2s08cMaBJUncCnCGcf5uBdgxrn8WtIGuFf
 oDLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tHmvo/lrgkE+wi7yTJ56b6ape2S0MwV/XIHtk24Q15o=;
 b=rKASMZn2r/FGW0i7bR86ZgeBUkHJGANhUqxx19TRV4Ax+U4vSjs2Ferv7+yIqQG/Fn
 F8vimgLJBEtoBdZbNfn/9BOrbvOAb3hgKwukCMnmIjhFLPxZE8M3z0alAVO1JdAZ0t8A
 ob4rXVnNm9m+TlLxvKXLnOnBEzN8AseSlIknhmRgVa4eCRzi4EhayydvX59E+uDKp2R/
 25IwAY2aE4TC2Zh/kyqK4OiV2j3QNWcUyKyEuokDyXu5fjUvnfi1RQrnPwvl4Bqckdt9
 K6nb6ts1f7/7a9I9Qm49NsIQrOZYvqpiaexuQBi0rGnbUPFSCHJ9SLlR6Sty0oBv0Von
 GlZA==
X-Gm-Message-State: AOAM531Thk+K+QA35mzWgAAW5Vt1bnIvVOm40w9Whb0Gb+K85TI+S/4D
 b1r6qQZEEijB0a33JToglvDuUe3q7IyI8nOv
X-Received: by 2002:a63:d650:: with SMTP id d16mr14809092pgj.277.1610750829482; 
 Fri, 15 Jan 2021 14:47:09 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id s13sm9521700pfd.99.2021.01.15.14.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 14:47:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 13/21] linux-user/aarch64: Implement PR_MTE_TCF and
 PR_MTE_TAG
Date: Fri, 15 Jan 2021 12:46:37 -1000
Message-Id: <20210115224645.1196742-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115224645.1196742-1-richard.henderson@linaro.org>
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dmIwJ+NRXXTf

These prctl fields are required for the function of MTE.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/target_syscall.h |  9 ++++++
 linux-user/syscall.c                | 44 +++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/linux-user/aarch64/target_syscall.h b/linux-user/aarch64/target_syscall.h
index 820601dfcc..76f6c3391d 100644
--- a/linux-user/aarch64/target_syscall.h
+++ b/linux-user/aarch64/target_syscall.h
@@ -33,5 +33,14 @@ struct target_pt_regs {
 #define TARGET_PR_SET_TAGGED_ADDR_CTRL 55
 #define TARGET_PR_GET_TAGGED_ADDR_CTRL 56
 # define TARGET_PR_TAGGED_ADDR_ENABLE  (1UL << 0)
+/* MTE tag check fault modes */
+# define TARGET_PR_MTE_TCF_SHIFT       1
+# define TARGET_PR_MTE_TCF_NONE        (0UL << TARGET_PR_MTE_TCF_SHIFT)
+# define TARGET_PR_MTE_TCF_SYNC        (1UL << TARGET_PR_MTE_TCF_SHIFT)
+# define TARGET_PR_MTE_TCF_ASYNC       (2UL << TARGET_PR_MTE_TCF_SHIFT)
+# define TARGET_PR_MTE_TCF_MASK        (3UL << TARGET_PR_MTE_TCF_SHIFT)
+/* MTE tag inclusion mask */
+# define TARGET_PR_MTE_TAG_SHIFT       3
+# define TARGET_PR_MTE_TAG_MASK        (0xffffUL << TARGET_PR_MTE_TAG_SHIFT)
 
 #endif /* AARCH64_TARGET_SYSCALL_H */
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index ebb4e2898c..0316497636 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -10952,10 +10952,46 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
             {
                 abi_ulong valid_mask = TARGET_PR_TAGGED_ADDR_ENABLE;
                 CPUARMState *env = cpu_env;
+                ARMCPU *cpu = env_archcpu(env);
+
+                if (cpu_isar_feature(aa64_mte, cpu)) {
+                    valid_mask |= TARGET_PR_MTE_TCF_MASK;
+                    valid_mask |= TARGET_PR_MTE_TAG_MASK;
+                }
 
                 if ((arg2 & ~valid_mask) || arg3 || arg4 || arg5) {
                     return -TARGET_EINVAL;
                 }
+
+                if (cpu_isar_feature(aa64_mte, cpu)) {
+                    switch (arg2 & TARGET_PR_MTE_TCF_MASK) {
+                    case TARGET_PR_MTE_TCF_NONE:
+                    case TARGET_PR_MTE_TCF_SYNC:
+                    case TARGET_PR_MTE_TCF_ASYNC:
+                        break;
+                    default:
+                        return -EINVAL;
+                    }
+
+                    /*
+                     * Write PR_MTE_TCF to SCTLR_EL1[TCF0].
+                     * Note that the syscall values are consistent with hw.
+                     */
+                    env->cp15.sctlr_el[1] =
+                        deposit64(env->cp15.sctlr_el[1], 38, 2,
+                                  arg2 >> TARGET_PR_MTE_TCF_SHIFT);
+
+                    /*
+                     * Write PR_MTE_TAG to GCR_EL1[Exclude].
+                     * Note that the syscall uses an include mask,
+                     * and hardware uses an exclude mask -- invert.
+                     */
+                    env->cp15.gcr_el1 =
+                        deposit64(env->cp15.gcr_el1, 0, 16,
+                                  ~arg2 >> TARGET_PR_MTE_TAG_SHIFT);
+                    arm_rebuild_hflags(env);
+                }
+
                 env->untagged_addr_mask = (arg2 & TARGET_PR_TAGGED_ADDR_ENABLE
                                            ? MAKE_64BIT_MASK(0, 56) : -1);
                 return 0;
@@ -10964,6 +11000,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
             {
                 abi_long ret = 0;
                 CPUARMState *env = cpu_env;
+                ARMCPU *cpu = env_archcpu(env);
 
                 if (arg2 || arg3 || arg4 || arg5) {
                     return -TARGET_EINVAL;
@@ -10971,6 +11008,13 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                 if (env->untagged_addr_mask != -1) {
                     ret |= TARGET_PR_TAGGED_ADDR_ENABLE;
                 }
+                if (cpu_isar_feature(aa64_mte, cpu)) {
+                    /* See above. */
+                    ret |= (extract64(env->cp15.sctlr_el[1], 38, 2)
+                            << TARGET_PR_MTE_TCF_SHIFT);
+                    ret = deposit64(ret, TARGET_PR_MTE_TAG_SHIFT, 16,
+                                    ~env->cp15.gcr_el1);
+                }
                 return ret;
             }
 #endif /* AARCH64 */
-- 
2.25.1

