Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp2435540lfb;
        Tue, 7 Jun 2022 14:49:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzo/fKuSH3VMXmsZLyB624k5B1cYv55thp6oR/863qgVKKBFb6c68hoADSsH8VLv5esqivq
X-Received: by 2002:ac8:598d:0:b0:305:98:b95b with SMTP id e13-20020ac8598d000000b003050098b95bmr429667qte.204.1654638571503;
        Tue, 07 Jun 2022 14:49:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654638571; cv=none;
        d=google.com; s=arc-20160816;
        b=AUUXOSBACeUL5aImRHnn+vZeGIk3Wpb7Ne3wvmM5a6WA8qHJx6cBPdJOARGZRG0POP
         nx4zmDWf8JqE+aX29P5eDbzwmHaB0Ns2VY5jB8snrXcTHsS8QDFiOk8QR6q0PbmXNHjf
         YRjFPi18YPZ/o35ovig0fwTPYD0j6rM/Kf07DrvO1bd66mmljE5JABiSncxajDrU2iw+
         Zys+G58q8JRH46knAmNt+hSeTirO8GvsKkhoQ4pApzjlb9K8WBEUhCPssOxdgtaUfIIX
         RBSXGGvx4Su4ddBP7eIUEKtAXoYWxlRZy92eqxXTMNj954pfwenUpP+ynKwvrbrEU8n5
         hcAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=E7DCQA7E2hAFRFgfvTFqXzlLXs1UhLAZLgu67MB30tY=;
        b=tHbs638RtqqptcAFQSvdFmjD2XNo9gRS/eNx1uBUn+1yMaDbK7Ys/DMwe4l5RZGT3U
         5ZzT1zRXY21QNMG729ZlyyarcjmdVoRKnqcyNmCh9oGle/CvkgzJbBHwc0xsasilUtoZ
         rGbLYYBWON41eozKCdO3Vmwv7BoBljvO3M5VGUbugklhpZG2CY+RcB6QtFrm4SLWNQr7
         mt3eqILQ+y6COlvsAj10bHqK5uA1k6kp9/rso4UK8pYP6wTuJua4e+IvVr+znZ1biJ6g
         B2PKvT0Vpr8/CbMCoyP0CyBxfQakN0rwAn0wIQ4756yC6bx+lTft/WcZMegFMyTOklMz
         ZGXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O7653sds;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u8-20020a05620a454800b006a372fa611esi12175148qkp.269.2022.06.07.14.49.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jun 2022 14:49:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O7653sds;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyh4t-0003W2-09
	for alex.bennee@linaro.org; Tue, 07 Jun 2022 17:49:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfx1-0007bp-1U
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:37:19 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:37660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwt-0008O1-OY
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:37:18 -0400
Received: by mail-pl1-x633.google.com with SMTP id t2so15809308pld.4
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E7DCQA7E2hAFRFgfvTFqXzlLXs1UhLAZLgu67MB30tY=;
 b=O7653sdsd6y4tvW4Dxc9xiT2b4myVtNemCW+AxSt/jkCT53nY/+Bn7YTQalxGc0a4j
 qGoN7fAzpg3/bkAbKGk7yner+UlAozz48wUrpkDtJBLGHWtZT2aYUcGFmIHQWmLw1MRx
 h4pKRfGpqL1ieWKf3LeB7IGiRJ2Ky17Zn2Z7319Li0R+4eIKT4EB6cXUCo1EEEwrOBZX
 reF8tec9/UFRlil4qNFis+fibngQz/+gc+j1z8ou6rsnLOQerN5SH6MSf7DzMS7Zyl+q
 9r+3XWTiRuUCJRH22jl6ulIgzT9Ik8hQFomCmmXwDhled0+s3v2GriyiInHd1+NZkQmC
 72eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E7DCQA7E2hAFRFgfvTFqXzlLXs1UhLAZLgu67MB30tY=;
 b=27ByhInCbMOUHE6he6PJN30UzgGdoDma1+ZP6fGw6SmOo/sjgiwt5+27PTUZSuW4f5
 tdXG700iq1Msbtult62e8xod+VeQFmt8lSWmI622HISYiRas+slRF4v+jE/C4yeBsl7x
 sGtQ3qqo8ruzRSgG1ThUOvdqd7kUlaLwQK1+4WujPijoozDVn9v0b/VhjbGI9A7Yqdrp
 xJkCXevRwYNQZuw1LfsK/6juZYz2ncu9iBtwFimJJ8ZuglT0r1BsTZnm8K1wnhzXeUta
 V8BsE6WekfXYy3mKC/w3JXXFATpFb7Zq+fs1uNs3nTY+GcNnqO9OeeMjWgAM2X4mDeY0
 mWsQ==
X-Gm-Message-State: AOAM531uiz4t1Jx14lpkfPV0zXy5KXT2E4061RdtOfwzFPBah0FvX9ti
 XRFZhF2ZHGmFxVe8SIixbf1/YwQVth0yiw==
X-Received: by 2002:a17:902:d481:b0:167:770b:67c with SMTP id
 c1-20020a170902d48100b00167770b067cmr13569253plg.77.1654634230508; 
 Tue, 07 Jun 2022 13:37:10 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s18-20020aa78d52000000b0050dc76281fdsm13235645pfe.215.2022.06.07.13.37.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:37:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 68/71] linux-user/aarch64: Implement PR_SME_GET_VL,
 PR_SME_SET_VL
Date: Tue,  7 Jun 2022 13:33:03 -0700
Message-Id: <20220607203306.657998-69-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OcNOVku1Vcpc

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

