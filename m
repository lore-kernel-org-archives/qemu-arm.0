Received: by 2002:a05:7108:5790:0:0:0:0 with SMTP id cd16csp5190943gdb;
        Wed, 14 Sep 2022 05:44:40 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5uTyv8/dztfJH4ezWRo26VtT6t8iphEoqn8YeEogEdGcoIrwAii8KCx5qrCU4tAOdFybZh
X-Received: by 2002:a05:6214:c29:b0:4aa:b050:5ed7 with SMTP id a9-20020a0562140c2900b004aab0505ed7mr30757122qvd.15.1663159480804;
        Wed, 14 Sep 2022 05:44:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663159480; cv=none;
        d=google.com; s=arc-20160816;
        b=vjqVFlxb/Gk6vYyMQX+K+FKSMExVluMVpsYIlTVx3DpzViHFjw8rBlSO6+rLJRhUH4
         E0uqIUJZ8VS5G6nom71yExy8bfwyE2jsphSGeflpXf7CQEGimTO7f8sjOd6FXY3yb274
         bibCHAbp5YVo2RFVTwhfTNRUvQxfolgIR9wj7EIMdy3nl3lclxpeRJhjVo7mZb9QZffg
         g6Y/+rJHaktG4jgQfCoTxbgDdfzZ1ZDhX+O2V5Ao6HvAcFnjM9jPMVUFl1s6X1d+gcVs
         1th/1D3v6mG98wZSip1Zipk9vmGAVWkKbyc7tS04DZjzCtaB+FGhC2iOYjVVW2c7Ugpu
         zoTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PzQ7HFDyU7lDe3IC5gWQsNSOhu4RpaCEIUnJKd3sdMI=;
        b=HnvVfpUlr2VgMSyCOVAkxe6sWrYFDg6NGQwWPiXqPCFiwP0mdt9pPFfFwyCjgyd9s+
         7HNEQ/7TV08O0QQM2H49lSrB64wdgf9EkD2d3eYYNGiWmD/xgNOWNQlGnBTgKP8dp9Sw
         VI06SpMa3cIbYCL6dhnLXMeWPAGuaAdB3J57MO22TAQN6LYKqkpgE3RpUZfhi9QLUpov
         kqNMEHEHscKxmelZO+YyTbd77iFl8Z6M4pCjat/l2ckyMApUx7A2t3Pe0TdC6a8Dz8MW
         HXMiEgCuq5onhkhOGEvFpwaxFANyoKnKMKX9Y2KQuDAUdymsZzWHWpGXXyCy8TIW2KhL
         u2fw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IfD5jf+t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ay16-20020a05620a179000b006ce3f1af125si1276416qkb.80.2022.09.14.05.44.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Sep 2022 05:44:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IfD5jf+t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oYRku-0003mP-EI
	for alex.bennee@linaro.org; Wed, 14 Sep 2022 08:44:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwW-0000GE-9d
 for qemu-arm@nongnu.org; Wed, 14 Sep 2022 07:52:36 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:41670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwM-0008Vs-Al
 for qemu-arm@nongnu.org; Wed, 14 Sep 2022 07:52:35 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 az24-20020a05600c601800b003a842e4983cso11390397wmb.0
 for <qemu-arm@nongnu.org>; Wed, 14 Sep 2022 04:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=PzQ7HFDyU7lDe3IC5gWQsNSOhu4RpaCEIUnJKd3sdMI=;
 b=IfD5jf+tzB6R6bqd2UFwtYFZjFYQkp0AmOT381SsBqkBw/tSflxVW9HP8djT+mXxVc
 edrklaiMuXjlTjsxac8I1rht8TuX9dUIdQrg81/GB10lcq9u7H/OA9vy+z3lPbgNouyF
 3+K1FVTrCBlAgbfhQueWonrhq3rVkThnv3APakNL+vjUXKMR7wGVWGhdBerF0li8lBNm
 5shUos06flX6R1RD+dIfAs/w1muQtN0e8++gDhsfjsdH/PYJixP4+2ZGtqvWxEtgT3QO
 8Zg/Mb3GkNRfDdiG6gt4kfBdU9oo9NQ0XdprJKyCZqRuBeozG0rjr0y/o23O3j/PcAkA
 XBIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=PzQ7HFDyU7lDe3IC5gWQsNSOhu4RpaCEIUnJKd3sdMI=;
 b=wL91aPoWRhviqJC435Z5PFq2p0Sg98lJnaf2U6+ypTuPtQGhZmKGoGWRhOP7yl6b25
 erbEug33fSSK0GjVfYk739oG+X5MtqHTemAl2gRC8AhsjwPWXzaY7H0zMJSFhq/6eSeQ
 rFcnyQSTPrPY38WR7y0Fe/eoCicfS9XPIdUCpjn0969WbzZ1PE5VYi5b2CzSp09C868F
 X78AeMhWU+tsq7x1mDZ5Lbwwd/jpZIOQvx0g8fU9O7z1n8LpHzbJH0lvXdFQxGy0EGWD
 f48fg9maU7Onq6zBwmO3Fa1IYMu6W8jtfCrwIwA1BET4ajjbAr+8tea8JRP2igmN3L/I
 UKeA==
X-Gm-Message-State: ACgBeo1uXMkMuSnRshrP5IXhJMktrEskHixtQv0BkoWSBKHbkjV7dP4m
 YdxXLs2Lh1bSsYOpsksoSwwe/g==
X-Received: by 2002:a1c:c91a:0:b0:3a6:38bf:2c36 with SMTP id
 f26-20020a1cc91a000000b003a638bf2c36mr2858336wmb.38.1663156345005; 
 Wed, 14 Sep 2022 04:52:25 -0700 (PDT)
Received: from stoup.. ([89.101.193.70]) by smtp.gmail.com with ESMTPSA id
 t9-20020a5d6909000000b0022a3a887ceasm13712970wru.49.2022.09.14.04.52.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 04:52:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 06/20] target/arm: Implement ID_DFR1
Date: Wed, 14 Sep 2022 12:52:03 +0100
Message-Id: <20220914115217.117532-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914115217.117532-1-richard.henderson@linaro.org>
References: <20220914115217.117532-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
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
X-TUID: ZttJvJbWgoU4

From: Peter Maydell <peter.maydell@linaro.org>

In Armv8.6, a new AArch32 ID register ID_DFR1 is defined; implement
it. We don't have any CPUs with features that they need to advertise
here yet, but plumbing in the ID register gives it the right name
when debugging and will help in future when we do add a CPU that
has non-zero ID_DFR1 fields.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220819110052.2942289-5-peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    | 1 +
 target/arm/helper.c | 4 ++--
 target/arm/kvm64.c  | 2 ++
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index fcc5927587..fa24ce9f96 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -983,6 +983,7 @@ struct ArchCPU {
         uint32_t mvfr1;
         uint32_t mvfr2;
         uint32_t id_dfr0;
+        uint32_t id_dfr1;
         uint32_t dbgdidr;
         uint32_t dbgdevid;
         uint32_t dbgdevid1;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0737851925..7ff03f1a4b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7581,11 +7581,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
               .resetvalue = cpu->isar.id_pfr2 },
-            { .name = "RES_0_C0_C3_5", .state = ARM_CP_STATE_BOTH,
+            { .name = "ID_DFR1", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 5,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
-              .resetvalue = 0 },
+              .resetvalue = cpu->isar.id_dfr1 },
             { .name = "ID_MMFR5", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 6,
               .access = PL1_R, .type = ARM_CP_CONST,
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 2d737c443e..1197253d12 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -643,6 +643,8 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
                               ARM64_SYS_REG(3, 0, 0, 3, 2));
         err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_pfr2,
                               ARM64_SYS_REG(3, 0, 0, 3, 4));
+        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_dfr1,
+                              ARM64_SYS_REG(3, 0, 0, 3, 5));
         err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_mmfr5,
                               ARM64_SYS_REG(3, 0, 0, 3, 6));
 
-- 
2.34.1

