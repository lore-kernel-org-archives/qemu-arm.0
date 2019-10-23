Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp1011577wrq;
        Wed, 23 Oct 2019 08:05:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy4FAFJVJHlwRLjJtiVNfJJxyxs1k2cMBTc+0vZgrd23JDG6i3eJZWCv9q2UnGgbNhnCKdq
X-Received: by 2002:a17:906:4806:: with SMTP id w6mr34392492ejq.44.1571843155040;
        Wed, 23 Oct 2019 08:05:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571843155; cv=none;
        d=google.com; s=arc-20160816;
        b=HBJjLt7RQvlWAqdZ4Dlc4Kcrh73x3qzQbISMOnreUPrIR1ZsTysH4jxMBJxmuUpZ/G
         2/hnUI9s+btNnOQgwr5FTgy9/y4SGxgo1BmrCtyyaaXARkrfGNz51vMUttd1hOH0NMAe
         5tnlleFwYG4PUA8lKyXVaI5ZCSNOIdtMSfTe/JyKfv8SyerYsNZyQAxCTycWHk9p4Y1C
         THnD+bUBc7CKOApwJlKFm2xdCHxbg5zBpqVPKdlkzDyZLy+fjXwJp3wZX79cGXf6938j
         gleQvVfTcF8okB2LjfRLiKk6MmTYpcZs3gQRaiW+LhrYaVWvfbw/u3wd3UcfFvvHLvEl
         659A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=+UgAJ6EhcwGdb7pezBRTrZ79eaC+NjRs0dqrTWfzTFo=;
        b=GsoDi4vJRBpVA22g++0DoHhYpHWja5j/8FxpK2PCqr1d5gyQ5fhGK/4znLSmPkIlJx
         HcCn+4mat1UAO4zAJOKOV33dss65p3UqfHPqX7ZBnfHx1S4nuKUgNBsHfvbzqAfeiAOg
         rPtXK2vGJVpNu3eZyL4FlEDvwTrnQbB+KkXvtuTASQBfKV+88a++XZkwYizP1THmBpIh
         iOZFdKfrj6aDAN+oty9EPoWCJyxzwi04DTqK2w+VQ3cDAU8XnEUendUEVvaP8KCf8NLZ
         tZ2FbfHQHXBAgK5gcI8wbmAex9BNr924DqNtiILvLEToLeFxW5U6hEebqu38BYP3l5E2
         dctw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PgnrO0uP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b44si14940166ede.451.2019.10.23.08.05.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2019 08:05:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PgnrO0uP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNICv-0002iQ-A7
	for alex.bennee@linaro.org; Wed, 23 Oct 2019 11:05:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34976)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iNI8k-00082E-Ln
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 11:01:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iNI8c-000196-Q8
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 11:01:29 -0400
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742]:46375)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iNI8X-0000za-4I
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 11:01:24 -0400
Received: by mail-qk1-x742.google.com with SMTP id e66so20021162qkf.13
 for <qemu-arm@nongnu.org>; Wed, 23 Oct 2019 08:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+UgAJ6EhcwGdb7pezBRTrZ79eaC+NjRs0dqrTWfzTFo=;
 b=PgnrO0uPpTiYTYsbXPpY87h8Z0eBFe3G++ZOjFoT6Wu3rV+AblsG3Jrtl/PhuHdYq8
 DplElLgxVtc81TN7i+dBHdKGP/hcZZqP64CmIX8TqdP7rV4V6p3Begod0zD7ceggmlQC
 RXxeCK1syyeLApzjg17+yPc0D6vOcJnCflqlR7YeboQbls0QJJVCp/wFtvBH2ReJ6lM+
 vkJ67izP6YTWzKKXwtbPIEDPZRc5gTjKxs9u0ngb2+02A9KASpBkc5b09ZRH6/APzcAV
 QmrLUlVbmej/KoVE3QWUJ2vlWNiAljtW5ZoPOkJjdg+JDgwjC8Y096KCS1VTDONvpVqy
 2D5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+UgAJ6EhcwGdb7pezBRTrZ79eaC+NjRs0dqrTWfzTFo=;
 b=HsEAXaFsEmnDcaESCSKcaV5k5klwWAI9HXBOZ8VaG/9Wnxl+6zsEL53ALcJaQtjugQ
 0KZPK6xLKJRdujjKDYnkTnajYD+xeMgSUgUzma88q2wSdJBtKeDvIEFuO0VwpXy3xVIe
 Q0IWPR4LLi430jXesMk4HZwE4vRq/b07+X1sntVJ2W4ZFNw6CANbJTbkK2erV6NEC+F7
 IiooZKR+bo8TMeK1ichlBePH9YAJVYFh+djum0dIIhRFXfD3eCuHPb0e65sTpHz75zD0
 IAC9GA+4pfwH90u+FFR4ZKYWZufVdseJ0KTanZ091OtgE0FCpQNWLwL5Tg0DTUHD8KZC
 NN6g==
X-Gm-Message-State: APjAAAX3mu2CTt2bJh3WKyRzUFDhqSg7084/r1v6gp+tIrLXHzySXTQC
 dxvuWn6FQ57iUn13HCrmBepr/g==
X-Received: by 2002:a37:4dca:: with SMTP id a193mr8751748qkb.292.1571842865717; 
 Wed, 23 Oct 2019 08:01:05 -0700 (PDT)
Received: from localhost.localdomain (198-4-20-64.static.cosmoweb.net.
 [64.20.4.198])
 by smtp.gmail.com with ESMTPSA id l189sm11030168qke.69.2019.10.23.08.01.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 08:01:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 03/24] target/arm: Split out rebuild_hflags_common_32
Date: Wed, 23 Oct 2019 11:00:36 -0400
Message-Id: <20191023150057.25731-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191023150057.25731-1-richard.henderson@linaro.org>
References: <20191023150057.25731-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::742
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
X-TUID: i0LaEc+k2bMc

Create a function to compute the values of the TBFLAG_A32 bits
that will be cached, and are used by all profiles.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 69da04786e..f05d042474 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11070,6 +11070,15 @@ static uint32_t rebuild_hflags_common(CPUARMState *env, int fp_el,
     return flags;
 }
 
+static uint32_t rebuild_hflags_common_32(CPUARMState *env, int fp_el,
+                                         ARMMMUIdx mmu_idx, uint32_t flags)
+{
+    flags = FIELD_DP32(flags, TBFLAG_A32, SCTLR_B, arm_sctlr_b(env));
+    flags = FIELD_DP32(flags, TBFLAG_A32, NS, !access_secure_reg(env));
+
+    return rebuild_hflags_common(env, fp_el, mmu_idx, flags);
+}
+
 static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
                                    ARMMMUIdx mmu_idx)
 {
@@ -11141,7 +11150,7 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
     ARMMMUIdx mmu_idx = arm_mmu_idx(env);
     int current_el = arm_current_el(env);
     int fp_el = fp_exception_el(env, current_el);
-    uint32_t flags = 0;
+    uint32_t flags;
 
     if (is_a64(env)) {
         *pc = env->pc;
@@ -11151,12 +11160,11 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
         }
     } else {
         *pc = env->regs[15];
+        flags = rebuild_hflags_common_32(env, fp_el, mmu_idx, 0);
         flags = FIELD_DP32(flags, TBFLAG_A32, THUMB, env->thumb);
         flags = FIELD_DP32(flags, TBFLAG_A32, VECLEN, env->vfp.vec_len);
         flags = FIELD_DP32(flags, TBFLAG_A32, VECSTRIDE, env->vfp.vec_stride);
         flags = FIELD_DP32(flags, TBFLAG_A32, CONDEXEC, env->condexec_bits);
-        flags = FIELD_DP32(flags, TBFLAG_A32, SCTLR_B, arm_sctlr_b(env));
-        flags = FIELD_DP32(flags, TBFLAG_A32, NS, !access_secure_reg(env));
         if (env->vfp.xregs[ARM_VFP_FPEXC] & (1 << 30)
             || arm_el_is_aa64(env, 1) || arm_feature(env, ARM_FEATURE_M)) {
             flags = FIELD_DP32(flags, TBFLAG_A32, VFPEN, 1);
@@ -11166,8 +11174,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
             flags = FIELD_DP32(flags, TBFLAG_A32,
                                XSCALE_CPAR, env->cp15.c15_cpar);
         }
-
-        flags = rebuild_hflags_common(env, fp_el, mmu_idx, flags);
     }
 
     /* The SS_ACTIVE and PSTATE_SS bits correspond to the state machine
-- 
2.17.1

