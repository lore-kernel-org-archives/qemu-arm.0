Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1354195wrm;
        Thu, 17 Oct 2019 12:02:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyTz0/7axq4Rt7iPqkcdW33HuocytZwIo4c03+0QjHOa1uQxaUbp2dQ+ChVJ996U/CC75We
X-Received: by 2002:a37:553:: with SMTP id 80mr4887660qkf.353.1571338934758;
        Thu, 17 Oct 2019 12:02:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571338934; cv=none;
        d=google.com; s=arc-20160816;
        b=igTb1932t3z2w/+Gg9atybuRwptHkKA+xMED2eGKL3mIeC1Bve/CWzpTDe9J5CLGgO
         OQISLihdgeWK5sWqyKIbk8cyD6wy35Z4xVDnKWsZjgsk0RerZhDh+e5vld+Ev/4oc1XC
         jp8KfUH7oDOzjdriS9mKv21eAfOc+YFJeiKZncPzEf1Glj+w05IocHJrcZKK4UB61Yt1
         K9YZynGqm5zCkWBVV05qp5jlsIvM4n+VWJqHyo4nVtHY+wvr2QOSU9hXnCSiqyIbRywN
         NRt1oasPaU5shhdgjyLYWZdp5d0gaKCqt8Yvh2wwItmZSUWtTtE+DBnPovyjGHMs3rMx
         XfRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ksJ29EsO4EC0RqRT/ptTGb/nh233vty3hFHL48/i7gI=;
        b=tPMgFf4Q1IwRRi5pM7+A7+bnb69JT+NBf7BHbQvlWA8GCYrpZZtd2F1R3Vb0znGfm0
         SD38kdJIlvEyGtxkwPsEv2DTeLiYypRqsleK7fEIV9yCMqjtcl0pjMiqORJ61v9+FkIr
         QqhbuZc9DN9oqERlyka0ieIBTP0BnjqHq28nMJZaE9R4soOgQeugKes//NrXaG6cJb9F
         ztSXfmhQXsvyIi1GcGFV8U6ahENRHuIyY35Evvb0U3M3FQz4537m7ChpmOv+Z9Cr6m25
         HmVNvC8BMZRZ2j5kjfBj3jS2u2/xNRezcyQq4R2/VAh1UgZHjGDXLzwOxGZkVj5TVECP
         nC4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="SXGvP0/a";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c28si3247014qvc.111.2019.10.17.12.02.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 12:02:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="SXGvP0/a";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLB2L-0004qi-RC
	for alex.bennee@linaro.org; Thu, 17 Oct 2019 15:02:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35287)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iLAs7-0001Hh-TB
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 14:51:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iLAs6-0000wP-EL
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 14:51:39 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:44695)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iLAs6-0000uk-4h
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 14:51:38 -0400
Received: by mail-pg1-x544.google.com with SMTP id e10so1847218pgd.11
 for <qemu-arm@nongnu.org>; Thu, 17 Oct 2019 11:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ksJ29EsO4EC0RqRT/ptTGb/nh233vty3hFHL48/i7gI=;
 b=SXGvP0/aPjZW/oFXhMmNuaGEV4bjpX608aNzrFC7TlEbbPFSMI+wQvU2E9jV+yZ0p7
 bT97NzOr3Ug0rEjwUpks4DPJ7tY1o3aJ/Mhk7ZC14H83DlPlp746ASUct0VTAJapvoyk
 YOZWsmExontfuIlIAfIBYT+Q47+Cbe/2vbngw8UOh0NrTZHGAm6ffCwA3qWNWvSrh6Jk
 y4pnQzMfN5AeBdaZCsdfvjaalInsT46V3Ytc+vF4q/KK2Ok3bFsQnao9YlB7Be86WdqO
 pQKSpBhgAjSk8buNzny9vp3j6zd8yAJKmgzY8LVLUfWQjWZfzE/cOrl+QiiXsb7HUY6T
 Sk0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ksJ29EsO4EC0RqRT/ptTGb/nh233vty3hFHL48/i7gI=;
 b=WTRs05vaE+IqstPcZAOkas1ZI1IqqvndGrdyqxLqULgOhokZiPwmjJVvfMdfK8HWkM
 kSPEGcQlc7+dyxfcgYdzaJjYbUluaLNZ7PwdpI5bBpxAqBwJWUFubR8XkmmKUZ6JxlWD
 Toy8X+9rvMLbQnYadReDB6b235Hu8aLKwFqWuAMjZmTAQzzNt1qWPSegqQZwuxtNNthw
 67O8FVCggaQPEGBkW0IP0e8mTgIvpOprWaAcu1R/I06nCCnOcjeil2vFkkHGEVu7mbnd
 elsNffDPvucBjajucTT9iso20uW6OeP/9bseG1+jMQFYaL630qorMJMgzA6puY8GZqT/
 p1XQ==
X-Gm-Message-State: APjAAAUaS/HRldDWYlh1G3J11TTSMYWNKynZmXOxtKtu440keQkP+qXT
 x5xOG3pDo60267tLWwFO2ESx4Q==
X-Received: by 2002:a65:400b:: with SMTP id f11mr5791836pgp.57.1571338291875; 
 Thu, 17 Oct 2019 11:51:31 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id s97sm5009256pjc.4.2019.10.17.11.51.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 11:51:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 15/20] target/arm: Add HELPER(rebuild_hflags_{a32, a64,
 m32})
Date: Thu, 17 Oct 2019 11:51:05 -0700
Message-Id: <20191017185110.539-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191017185110.539-1-richard.henderson@linaro.org>
References: <20191017185110.539-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
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
X-TUID: B9SuaSlS1Xpg

This functions are given the mode and el state of the cpu
and writes the computed value to env->hflags.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
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

