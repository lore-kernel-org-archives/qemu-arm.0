Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1035827wrm;
        Fri, 11 Oct 2019 09:14:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqznwbX8R9RKPZQlRXZW9yq6sQTFbJDAZaCqH29jpgAtZ8Lvz8ptZPM7aCrSN04bBJkygbL9
X-Received: by 2002:a17:906:95cc:: with SMTP id n12mr14667260ejy.111.1570810492997;
        Fri, 11 Oct 2019 09:14:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570810492; cv=none;
        d=google.com; s=arc-20160816;
        b=xEgkHbwd7z0YnHiTuZlHd0KQe/5tPuYpZVRHQ2GAirF9diZ9hr//kajDMKvVPyUQYu
         3SFL8owKUJSPj8k9HoB3SIqC9WwZrcmoJdXr4KTQI0jaaGXDqtlVuZS1XquBhRc7pq+p
         m0f2ri1iP8syC2yyYf71txQEbZVnGM0z0DUWigS2QgV5TXh4hz2OSbkOcDPgqBdjhcop
         BnIwuzplENEYHUWp3Wd6A7IU8nYr6z3O4fgb4d7gBoiD+et26t/RontNtSWJnuKYapBt
         mXQ12kyntSd1zy1xQhnNllz3Mf9Vjp85KAmW2K1OwCQMbW4vitLnPXv3iJHuNIc93mtT
         gC/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=Iin/3YIyrPimduLw1VgVV/RDqodmDq3TgBG1S+Tb+Mo=;
        b=E38sbv0TAE7sWOLfzWra/T97KKcOA3y3gC2c4uki0xYCj5IBgjCukzzHFcGGf5hV3T
         CCCgFBYwKiQ15EmGyGSyHYr2U/4b9N4y/JYzwBgzS0gxYRJlKd59lACrxO72U77KmI7j
         HyjctbadZ+7PcZtaLAPnyT8us83gdN+M7dfGy4HOA7hx771Q/q3N00Tmg0DyMmEPz/ty
         c+QbVmThyHQFWc3IDW0CKXNqwzKFyTkExv7x7xHaB1Kd1+Br9p5flVLbRNcopKW4DhyY
         zWZD+q8mwqXrflqcVMCbCzE8KGcpHkjukgViCjfXWmGRvKYXCnDrkbHifrpBWdEZKc2k
         mWew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lU7J01XE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q22si5430684eja.178.2019.10.11.09.14.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Oct 2019 09:14:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lU7J01XE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53545 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIxZ5-0000Fs-NH
	for alex.bennee@linaro.org; Fri, 11 Oct 2019 12:14:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33888)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iIxGx-0002cz-1d
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 11:56:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iIxGw-0007mH-13
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 11:56:06 -0400
Received: from mail-yw1-xc41.google.com ([2607:f8b0:4864:20::c41]:39385)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iIxGv-0007ly-Ta
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 11:56:05 -0400
Received: by mail-yw1-xc41.google.com with SMTP id n11so3642755ywn.6
 for <qemu-arm@nongnu.org>; Fri, 11 Oct 2019 08:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Iin/3YIyrPimduLw1VgVV/RDqodmDq3TgBG1S+Tb+Mo=;
 b=lU7J01XEmy7MwlGMcLEal+OIpkx5U72IeW5sQlWZeUUQtC5BH2JLG+pYtkNuCPJxjO
 Yz/GRsQBIDXjb+YO17oID6BTV2CEolWF2Dm8AZE2kKbj4vxdgtHSNV7P9McwOyAhlGu/
 Z1JndOwbmAcUXggIo4tocmtf9kzatvQwqA4927qeMkFKrq5Qrw0jMhRWDYXPP1O5+hAT
 e4awSXVvlPTzqEeZhVXlT4Ck5ar3PbPpouryt2ROWj55gL4t/UsoRau2E+tu/2WYZrg0
 CxuEgKP+NUnNLaFkfDfzUQ94zHE5acyxLO3I6UpAg9edJsOsjRQJuAcpIsFC8MqTCkfB
 UYpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Iin/3YIyrPimduLw1VgVV/RDqodmDq3TgBG1S+Tb+Mo=;
 b=PtTdpIqQVHsG51+eHxoWj7uL1lDJ28d4/Eqximv+zVGnXe7x5M4byrDSC0wb7Ws3rV
 xQdzAz4/Yl6OhFzfc+4Sj1gWIK+3GDKvLXiT4jyqggVHExFQYmc6INYz2zghVcrWsFhU
 eClpLMZjjU8qjGPLGj3236Xbact9vEjrCurnos4KvMWn2VW0D5iADfI6Bp5Z6P1r+l8j
 5rW8a04tSM0g6z6GaL9L9BMJYhsJRd6tMSYuSg6ATkSp6v0/fCpCY7a+Fvy/hvoMqzm+
 xIVQ60uds0SVDqyURx5v91yZZfmuM9ZDXdswoCbrmcx1PLx2Fzo8r6jqjZhgD8JGTajv
 4Iiw==
X-Gm-Message-State: APjAAAWuq/lVCcdfw5Mcd0pQMM8kaibYdUyq84oOXWC8EdlpQOiwcvzU
 FfGc/wRs+HRvU32bbN98bw9uxg==
X-Received: by 2002:a81:441b:: with SMTP id r27mr2817947ywa.371.1570809365305; 
 Fri, 11 Oct 2019 08:56:05 -0700 (PDT)
Received: from cloudburst.gateway.pace.com (67.216.151.25.pool.hargray.net.
 [67.216.151.25])
 by smtp.gmail.com with ESMTPSA id d17sm2473139ywb.95.2019.10.11.08.56.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 08:56:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 15/20] target/arm: Add HELPER(rebuild_hflags_{a32, a64,
 m32})
Date: Fri, 11 Oct 2019 11:55:41 -0400
Message-Id: <20191011155546.14342-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011155546.14342-1-richard.henderson@linaro.org>
References: <20191011155546.14342-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c41
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
Cc: laurent.desnogues@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dQ5p54KFYx0R

This functions are given the mode and el state of the cpu
and writes the computed value to env->hflags.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h |  4 ++++
 target/arm/helper.c | 24 ++++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 1fb2cb5a77..3d4ec267a2 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -90,6 +90,10 @@ DEF_HELPER_4(msr_banked, void, env, i32, i32, i32)
 DEF_HELPER_2(get_user_reg, i32, env, i32)
 DEF_HELPER_3(set_user_reg, void, env, i32, i32)
 
+DEF_HELPER_FLAGS_2(rebuild_hflags_m32, TCG_CALL_NO_RWG, void, env, int)
+DEF_HELPER_FLAGS_2(rebuild_hflags_a32, TCG_CALL_NO_RWG, void, env, int)
+DEF_HELPER_FLAGS_2(rebuild_hflags_a64, TCG_CALL_NO_RWG, void, env, int)
+
 DEF_HELPER_1(vfp_get_fpscr, i32, env)
 DEF_HELPER_2(vfp_set_fpscr, void, env, i32)
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 37424e3d4d..b2d701cf00 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11220,6 +11220,30 @@ void arm_rebuild_hflags(CPUARMState *env)
     env->hflags = rebuild_hflags_internal(env);
 }
 
+void HELPER(rebuild_hflags_m32)(CPUARMState *env, int el)
+{
+    int fp_el = fp_exception_el(env, el);
+    ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, el);
+
+    env->hflags = rebuild_hflags_m32(env, fp_el, mmu_idx);
+}
+
+void HELPER(rebuild_hflags_a32)(CPUARMState *env, int el)
+{
+    int fp_el = fp_exception_el(env, el);
+    ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, el);
+
+    env->hflags = rebuild_hflags_a32(env, fp_el, mmu_idx);
+}
+
+void HELPER(rebuild_hflags_a64)(CPUARMState *env, int el)
+{
+    int fp_el = fp_exception_el(env, el);
+    ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, el);
+
+    env->hflags = rebuild_hflags_a64(env, el, fp_el, mmu_idx);
+}
+
 void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
                           target_ulong *cs_base, uint32_t *pflags)
 {
-- 
2.17.1

