Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp4578536lft;
        Wed, 6 Jul 2022 02:46:45 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t6p+ktE6L6jT6G+18NAzPAErdQ1XLHt57IO1iDVi/FJe8H3pFW1OpENeNQRkn3MyoFxPI8
X-Received: by 2002:a05:6214:5005:b0:472:e6b0:1fb2 with SMTP id jo5-20020a056214500500b00472e6b01fb2mr16110171qvb.124.1657100805814;
        Wed, 06 Jul 2022 02:46:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657100805; cv=none;
        d=google.com; s=arc-20160816;
        b=h7c/jp7h4uWvavEd30dj1c15ss5ivdvNar8GlkXYhqcO17lzklXRJkAxpiY6TnAMPM
         9xB8Bdi/u7kEbFD2gE5novOKz+DqG0s6iCoR/HoQ0af87OfO+wirsR6coMxmdMUW5hvj
         of2t+ovXmtc6cWU4wDl4FuJFEHF8q1/meCNmjXhhmcjiac3hXUr5Jq2XPlXk+FUGes2A
         afjfoajYACx/cY1PwEqSnSPu2jiPec8+iYYVdUgZHOP3WU0PNJmnfT0uKrf7gzc3cIdy
         pKFxl0wn0wRoeCAwsZ1xhRKbmScG6bpu/JNDIKPpaODc48wdc6Ubd1ayjAHiGj3h5i5j
         uP2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=V2fLCOd7w5RVaZMEE/2yClzk5I5RfuvEjcRKKU0Ql6A=;
        b=bZslw6MaPWK0RTWmh17eIwfomio2yUhJimvSPL8bdKT1ARFE5KFu1YlxCEzItHm87J
         1B6TN/bVFCK4EZwGlBashViFtyp77FIRzFksRvu2jKffLQFg0aqF/l3zgpf60otdYXhz
         mYurN+SvveY53BTiVMuVFHRL8oIS6qNLtnkNxwa+6r8FCp9QmQJUvI6PU9sbPudLxpuX
         ZUotpXwc4O92IhrzIcW5vkLpvTjVb0IPQqqUu+slwqRejuLDt91bDnKuWGFwfxknFZIZ
         ygta9EBWSM6WilaFiLXZt/b4vllHbp6FNXa0ZPdvW/zNG07gqVyxf5PSITHWokJnQbc6
         B5xA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qsZ5LjNo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g10-20020a05620a108a00b006a711bb7498si19321758qkk.277.2022.07.06.02.46.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Jul 2022 02:46:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qsZ5LjNo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o91cL-0002oL-6x
	for alex.bennee@linaro.org; Wed, 06 Jul 2022 05:46:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90PN-0000e9-6L
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:29:17 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:43894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90PI-0001Dr-1B
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:29:13 -0400
Received: by mail-pf1-x434.google.com with SMTP id t3so579943pfq.10
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 01:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V2fLCOd7w5RVaZMEE/2yClzk5I5RfuvEjcRKKU0Ql6A=;
 b=qsZ5LjNo8Qf/WXeTA2oQWiDDZhX9rW/OtwK3zFruCPowC2ujdFiBHmv7ALVXOLS+/3
 d4yrA0cvtSXI2ehE8qT3NthGNd0ioOvdML1qmjNThtCsfM77JJgYU3MzAp+GzY3RwyUZ
 NUgAMC3wguD6RX6vL7GCgBwlJPgc11+qcOfyHGvVcR+zE9rZ9BCQaoC0hUhR1GghXsLK
 F1+Nqqbg1qevx0nqpDIAjMADIiYcgUlmOvi8YHi9XITsjSQHVfl8qbxAZpX486F3pspB
 5DSGuNsWoifBs0Fdbw3mBhZ9ojFunocO+nhjD3dRz9uiODj5HejSm4KLL2WxPAGU+gQo
 2lcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V2fLCOd7w5RVaZMEE/2yClzk5I5RfuvEjcRKKU0Ql6A=;
 b=W0SQdbVThWz0N17FQH18ZtHE2fu68lmqd0PNY3+cCXsyMqJChOzFPvBvqLzMoN0cCj
 t2bytoFuWRPO0qMOVREsEiMRXvV/kIH6RbIxQdmAeTe0PAAMTYSr/1X+bpjpfxpc17UV
 wlW8rM8oRtCVzvJ0db8kD7RohWIp5RHByJuPv/Mj7i+9qOiY7pc1SmWI/CsobD7Kh3Qn
 WCG94aep3Rjgt9qKjPboRmAXq0lSfZKGHqlF/dg8zlzXJY3K2LEDaZmBdqdMQ39cdkCi
 3ggp9zKU+Hd7HPt+x1IwPWVTeCOM8sKyoA4GRyB90pXLHWKkIZa240KTEcFCNXxvcq9d
 3SjQ==
X-Gm-Message-State: AJIora+aAws2W4w6B/IztupyzpnQUjvLYGDdq6LnmGM4P74wgNqyG1xU
 DSTJkIYXud8Tg8dfXJvjkawCO6wH1OmO5Jk0
X-Received: by 2002:a63:20a:0:b0:411:909f:8ae2 with SMTP id
 10-20020a63020a000000b00411909f8ae2mr32602128pgc.132.1657096150724; 
 Wed, 06 Jul 2022 01:29:10 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 c17-20020a170903235100b0016bdf53b303sm6700529plh.205.2022.07.06.01.29.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:29:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 41/45] linux-user: Rename sve prctls
Date: Wed,  6 Jul 2022 13:54:07 +0530
Message-Id: <20220706082411.1664825-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: reKb/MV2LxGn

Add "sve" to the sve prctl functions, to distinguish
them from the coming "sme" prctls with similar names.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/target_prctl.h |  8 ++++----
 linux-user/syscall.c              | 12 ++++++------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/linux-user/aarch64/target_prctl.h b/linux-user/aarch64/target_prctl.h
index 1d440ffbea..40481e6663 100644
--- a/linux-user/aarch64/target_prctl.h
+++ b/linux-user/aarch64/target_prctl.h
@@ -6,7 +6,7 @@
 #ifndef AARCH64_TARGET_PRCTL_H
 #define AARCH64_TARGET_PRCTL_H
 
-static abi_long do_prctl_get_vl(CPUArchState *env)
+static abi_long do_prctl_sve_get_vl(CPUArchState *env)
 {
     ARMCPU *cpu = env_archcpu(env);
     if (cpu_isar_feature(aa64_sve, cpu)) {
@@ -14,9 +14,9 @@ static abi_long do_prctl_get_vl(CPUArchState *env)
     }
     return -TARGET_EINVAL;
 }
-#define do_prctl_get_vl do_prctl_get_vl
+#define do_prctl_sve_get_vl do_prctl_sve_get_vl
 
-static abi_long do_prctl_set_vl(CPUArchState *env, abi_long arg2)
+static abi_long do_prctl_sve_set_vl(CPUArchState *env, abi_long arg2)
 {
     /*
      * We cannot support either PR_SVE_SET_VL_ONEXEC or PR_SVE_VL_INHERIT.
@@ -47,7 +47,7 @@ static abi_long do_prctl_set_vl(CPUArchState *env, abi_long arg2)
     }
     return -TARGET_EINVAL;
 }
-#define do_prctl_set_vl do_prctl_set_vl
+#define do_prctl_sve_set_vl do_prctl_sve_set_vl
 
 static abi_long do_prctl_reset_keys(CPUArchState *env, abi_long arg2)
 {
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 669add74c1..cbde82c907 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6362,11 +6362,11 @@ static abi_long do_prctl_inval1(CPUArchState *env, abi_long arg2)
 #ifndef do_prctl_set_fp_mode
 #define do_prctl_set_fp_mode do_prctl_inval1
 #endif
-#ifndef do_prctl_get_vl
-#define do_prctl_get_vl do_prctl_inval0
+#ifndef do_prctl_sve_get_vl
+#define do_prctl_sve_get_vl do_prctl_inval0
 #endif
-#ifndef do_prctl_set_vl
-#define do_prctl_set_vl do_prctl_inval1
+#ifndef do_prctl_sve_set_vl
+#define do_prctl_sve_set_vl do_prctl_inval1
 #endif
 #ifndef do_prctl_reset_keys
 #define do_prctl_reset_keys do_prctl_inval1
@@ -6431,9 +6431,9 @@ static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long arg2,
     case PR_SET_FP_MODE:
         return do_prctl_set_fp_mode(env, arg2);
     case PR_SVE_GET_VL:
-        return do_prctl_get_vl(env);
+        return do_prctl_sve_get_vl(env);
     case PR_SVE_SET_VL:
-        return do_prctl_set_vl(env, arg2);
+        return do_prctl_sve_set_vl(env, arg2);
     case PR_PAC_RESET_KEYS:
         if (arg3 || arg4 || arg5) {
             return -TARGET_EINVAL;
-- 
2.34.1

