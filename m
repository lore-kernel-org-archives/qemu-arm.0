Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3826914ejb;
        Tue, 21 Feb 2023 18:34:33 -0800 (PST)
X-Google-Smtp-Source: AK7set8nC+rqaNd8lc/z/7DayGeSvFrZbhsLl2BM/CL+2qTaWF4VBfV7BB0BHFyKnGoQJMAF044M
X-Received: by 2002:ac8:5dc9:0:b0:3b9:ca2b:a923 with SMTP id e9-20020ac85dc9000000b003b9ca2ba923mr12280360qtx.67.1677033273557;
        Tue, 21 Feb 2023 18:34:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677033273; cv=none;
        d=google.com; s=arc-20160816;
        b=wJZ+QKgMioiD5JiA3Q+suu+SUdSx46DkaX5GXQ7qneJCw9dA3eMU9yLToHCZYrTwC1
         52wfu9T8zQHpYFvka71xXltWiA3+TE+pzJCLzLRldbIBE25tC1QmDLxw8oD5KERX24Ei
         vxxloPHWqGa4/Mp8JhtHH8qq5kaG0MaD4v4zc2xyR8EmOGILY5YCPahuZXp/NkQIF27C
         m3Pb5+ggm+6XOHsFpLZqldjPURLZ0BxzxpxFuO1SHKsBirLYLoWqgMXeRGvQhhtFlx7v
         c7tncGiAMP+YbpWgnFeVni0xEgnpMcLvO8/HYyGc4aRc1ZTgVtYU+JguIiPnssDHa9qF
         d6KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=t0f34z6IL5G95kj5EqfJsxy6GdEQaM54Gjt8GKtIdDA=;
        b=yjPPjwoMFEXYDpnY74890PZ0wSVYXVY5StJ2H/t6W/JjyPA2YO1sZc7U7JxIL3j94N
         KqBgxESKQyC+lhptjY2wdB3gdMvGu/f1yHpIsb9IZ3C/YdVh+b5kcutPohej/GmFVw7X
         sleurUmY4Zs+j2KMhiyD7TI6BtkNkIlsbAUfpht7VkKXmwE+6Yfi+pgu9ndZhrWhQvV3
         Mmr235ZL/MTi3ZtuEKZxNe2VcmL4NhQ0cZpdCQNJ9PUAxY2oI5q4t1PrjlbS3ZD2NzZc
         CXsGD4AV7q/pwJRUPTIpwKdax1kmSti6g6fAVqW+A5EEaM3EHZ2E8vjtAMpEGbVG1o5M
         8ivA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AuC22R+l;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h12-20020a05620a284c00b0073b75323d0esi13803381qkp.256.2023.02.21.18.34.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 18:34:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AuC22R+l;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUexL-0007Nj-Ga; Tue, 21 Feb 2023 21:34:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUex2-0007If-01
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 21:33:50 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUewy-0001Xy-WC
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 21:33:47 -0500
Received: by mail-pl1-x62a.google.com with SMTP id c1so7463488plg.4
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 18:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t0f34z6IL5G95kj5EqfJsxy6GdEQaM54Gjt8GKtIdDA=;
 b=AuC22R+l7H/gFLprHvlABcs5KoaOKiHdp+Ft4gk3lknEB7S+hchsvMCpsKVh936Rvq
 7EFm9e1PpCW8CljkqeknlkvxlT1tKVvkw8d73T/vlUyRsHRRX3I2DC4dQfpPtPGBg7Bz
 QVLFuTOXYcCpNHnJt7kIEIaF3+/IkSR65lWhRCXhZNHSsTqV91QgK/uCmzWYxOIZcvD0
 1w25ABthNL2dkFv/iKZAQR9HJSEx9oI4PefRzSPFBmPyHAdR1LZUZez5Mjo4qBQOVJY8
 vMuj9BHGD7sT/qdpWKAaiYAHIVuJUg/stNS51pKstR8gxVRchfD33QJmpm/O1+tdaPn1
 W64g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t0f34z6IL5G95kj5EqfJsxy6GdEQaM54Gjt8GKtIdDA=;
 b=e6NJwJ2J56TNuiICX/HyLWi1Hd9S1WhJg9wdn8SEo0ZeltDVtrn1pJdWju2+BSfJRh
 n2AObDYQ7dwd4SaY95oPtkC1VFiS/Znq566xxi61zw0hRYiGAPe7arjkkVtVsxTm6mHD
 BqqnbIC+BqBCW2qVjSd1Jz6DgcL5/VHhjB3wIUGL1mcFU3p5n6Dq73TG/w7ifTlyl9M/
 d7fr1kAyYsL6k0vkuPMTsZJDQ5aaWzP3pwGlwcsHoltky0vLyBk9iyUEo0ZIumoHiYgx
 ySjiCnZk9xQHSz7Az/SFZo1JjOAKPb4YZTX7XZTup065D0z4wpIt7aPDb/ek1dGYRWvp
 ECuw==
X-Gm-Message-State: AO0yUKUJEdBltWu7l1lPttf+61HUt/dTPfztMgOAVJ8W4Bc7snPyslNB
 gTJeviWtlSECSA4c48wJ0WS3h/2YVSSX48A5RH0=
X-Received: by 2002:a17:903:1d2:b0:19a:a815:2868 with SMTP id
 e18-20020a17090301d200b0019aa8152868mr7401408plh.44.1677033223575; 
 Tue, 21 Feb 2023 18:33:43 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a170902e90300b00198fde9178csm10520112pld.197.2023.02.21.18.33.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 18:33:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 03/25] target/arm: Diagnose incorrect usage of
 arm_is_secure subroutines
Date: Tue, 21 Feb 2023 16:33:14 -1000
Message-Id: <20230222023336.915045-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222023336.915045-1-richard.henderson@linaro.org>
References: <20230222023336.915045-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
X-TUID: RMMS8Dyy2Jky

In several places we use arm_is_secure_below_el3 and
arm_is_el3_or_mon separately from arm_is_secure.
These functions make no sense for m-profile, and
would indicate prior incorrect feature testing.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 7a2f804aeb..cb4e405f04 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2389,7 +2389,8 @@ static inline int arm_feature(CPUARMState *env, int feature)
 void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp);
 
 #if !defined(CONFIG_USER_ONLY)
-/* Return true if exception levels below EL3 are in secure state,
+/*
+ * Return true if exception levels below EL3 are in secure state,
  * or would be following an exception return to that level.
  * Unlike arm_is_secure() (which is always a question about the
  * _current_ state of the CPU) this doesn't care about the current
@@ -2397,6 +2398,7 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp);
  */
 static inline bool arm_is_secure_below_el3(CPUARMState *env)
 {
+    assert(!arm_feature(env, ARM_FEATURE_M));
     if (arm_feature(env, ARM_FEATURE_EL3)) {
         return !(env->cp15.scr_el3 & SCR_NS);
     } else {
@@ -2410,6 +2412,7 @@ static inline bool arm_is_secure_below_el3(CPUARMState *env)
 /* Return true if the CPU is AArch64 EL3 or AArch32 Mon */
 static inline bool arm_is_el3_or_mon(CPUARMState *env)
 {
+    assert(!arm_feature(env, ARM_FEATURE_M));
     if (arm_feature(env, ARM_FEATURE_EL3)) {
         if (is_a64(env) && extract32(env->pstate, 2, 2) == 3) {
             /* CPU currently in AArch64 state and EL3 */
-- 
2.34.1

