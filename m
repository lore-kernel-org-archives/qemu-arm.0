Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp2966wrs;
        Tue, 20 Aug 2019 14:21:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz9tWEeYBctNXov60JgVXbvpxCV90XVGMgF9oVLuuqjrCi6wJ1BlWa8k+Nd4cTADjB1FwcA
X-Received: by 2002:ac8:53d4:: with SMTP id c20mr27232330qtq.121.1566336115953;
        Tue, 20 Aug 2019 14:21:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566336115; cv=none;
        d=google.com; s=arc-20160816;
        b=BXBuVKu9/+LMX8Ze7wLX/3qUMAAr+UdBff3zF1L+qdg5XisppH+fHTDkiT+ehn6ccR
         n/gB1A0bTZ5RXA+63stmIK28nYSimZ1kFWODvv5OAClmTlzm7wiNuAAisxkHn/28y4RJ
         35vM9f+OuHsLxxq7AePzPr/yolWiJgxIJRO/ZPrzLxqF+oBzeow+deP7uurPvk8bFGbu
         ARrAA7Pmo2ByhTpYHknvi5AjhUjsgscKbWgXwFP+ut1sD/Me5/boQk4rsj3uhMbTyMOJ
         eNCxp5DT3+auIWF62yWTaREgNWnuhKi96pVUYptfEmZEFmvL0m1rfAVJgZZuwNeMnb/9
         vnwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=e9JxmSYIPzvjXwg6KhVgyDZPyIfxwEg/5iC1Ikkx2MA=;
        b=aXOXviTYI9BFxt/4Yo9WG2GuVKAIbgkev+6Ifj2SSS0xqRlpCb8hIA+SJdjR4YnEHG
         r8isASxNctrSN25x4SYe2gcl04UfOeTMSrgI0PcWm5h1eMuOQ5LMW3tOIGoO1I3MfMVV
         ZKJo9UR1cb+mlmSKuxB5YVOK/gwagEtsBaau5kGU3+bPSDPJnZOFZdDaZqPHmqKu34cj
         BUYsdBBsOl7ilqL+g1NDtf2F4IIDirMlW0R8ww9QQOEaTruBQKWsSW1Lm9z5XFkl+EAM
         qfAkBg080BUGPPmL+9+3WdL1zG6Ze/7zj98IaPHJRY5M6yCyBpUhSQWEm5HUxQc+WdxV
         HlSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="ZFHXAqr/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f24si11105474qkm.220.2019.08.20.14.21.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Aug 2019 14:21:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="ZFHXAqr/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i0BZj-0003uP-6v
	for alex.bennee@linaro.org; Tue, 20 Aug 2019 17:21:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53990)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i0BM2-0000L3-4C
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 17:07:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i0BM0-0000CW-OJ
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 17:07:45 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:40083)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i0BM0-0000Al-IQ
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 17:07:44 -0400
Received: by mail-pg1-x544.google.com with SMTP id w10so10984pgj.7
 for <qemu-devel@nongnu.org>; Tue, 20 Aug 2019 14:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=e9JxmSYIPzvjXwg6KhVgyDZPyIfxwEg/5iC1Ikkx2MA=;
 b=ZFHXAqr/U/RJlJBk7dhCErP99x5UtAihlIOgjkNAdm5yabz+MR/jDv1f/N4S8qaaCP
 axi8d6vxlffOqlgOPSJhhzztY7N3QyOHsXKrR+zq1SxOOKSJhct9SmyfSbYqc29RJkLE
 bOVeenlI0UvRR2wvshtneYqfC5zEBqfetSJ6ZZ1b1ZtNg27GqjqIa9KOkb3zdUDo6+Hd
 umhulWmTjBMqUGd+Pts4/2qzWEGZigrrccZiN1nsijEiODqhMkX4RfoI6/nY1BzArXrl
 lV6IC3IMbtDxzejgRf9vbgnCisBwgaVdc6EVEdVsGdtEBmszF10snEKbogkFOkw6ASJ1
 c+Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=e9JxmSYIPzvjXwg6KhVgyDZPyIfxwEg/5iC1Ikkx2MA=;
 b=TDQl2DESnfQ/7E7gnqFMu/i5wjNb61+OZL2pkQOxjdoz2fOpf3JbgoOYsPBitJvFgy
 tNzVzLN/GDkMej/1cYHWG2jV08yOmvpetWQqwXV1HQBC2nMLYDfNWtAu4Ej1kVK3pHF5
 9h6VkQ+ZD9R3q+UJlFs+wfB1cKCdRAJys4YgbO4H/NAPCq35CnWnyFuAoNo7H0shCuQm
 HM+JbH2+0n/euxEk2F+0GEj8fXnOe4uJOfUlPimbe3ElaAGLUWeGqx9ONDLLed17Z2w7
 5nlKT/FLE0hqjBrw0tl/xidkIzTLJ5W7IvSdd0Px2nQhEHOHDkTzqwUnCt32ecnLKxkt
 8xvw==
X-Gm-Message-State: APjAAAX0HpaeumX1K45z3tGlWqIgNFge+ii3Y4aaqeK7SJw9PRqFfPMw
 x37qr+j6xESduHTwKK0mtuiK2i73qas=
X-Received: by 2002:a63:5648:: with SMTP id g8mr25942057pgm.81.1566335262751; 
 Tue, 20 Aug 2019 14:07:42 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id k22sm21690743pfk.157.2019.08.20.14.07.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 14:07:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 20 Aug 2019 14:07:18 -0700
Message-Id: <20190820210720.18976-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190820210720.18976-1-richard.henderson@linaro.org>
References: <20190820210720.18976-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: [Qemu-devel] [PATCH v5 15/17] target/arm: Add
 HELPER(rebuild_hflags_{a32, a64, m32})
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
X-TUID: Ldk8k9Wc1m6+

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
index 7a94495788..53a7bd796b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11182,6 +11182,30 @@ void arm_rebuild_hflags(CPUARMState *env)
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

