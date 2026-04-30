Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98E4FF8875
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 00:23:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wIF9s-0006eg-2e; Wed, 29 Apr 2026 20:21:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIF9l-0006Vv-W2
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:21:30 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIF9k-0006JO-6n
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:21:29 -0400
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-c7973bbc16dso196117a12.0
 for <qemu-arm@nongnu.org>; Wed, 29 Apr 2026 17:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777508485; x=1778113285; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y5SZ2AUA7BYXKc3EOO2JfsbSox2Kf5n1BI6zKR3SCrI=;
 b=glwGKjGgicHtHgrifnx5Bvg7syHA2+ixbhkFwbLq6Py8Y6Bpr6Bzra8M8aPRwZ0ZPV
 L1PGAsDKdZEZh1OglREV0BmoBH6weItGpRsyIz2/LmjiIAX1SVbS28J3etH57stTYS6I
 5TMCuWZbgg/7wFzHiuv3HyY7jVbqQxs0e5VLsMQGRZLANeTf6PBYdfGRnB5oUihg9CxY
 bRTgv2v7ZQMVOdw/z3IYYOMuIhJRZRQSneOuTUwJH7hq8LzfP6KHfD5cxs0eLvycNORF
 S8sWjCMHVQYN7HACTT8C6SDsrduYDW8jElbp/rqRN2EDRUx6CjnmJv0psmbnb5Fc8f6t
 M1rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777508485; x=1778113285;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=y5SZ2AUA7BYXKc3EOO2JfsbSox2Kf5n1BI6zKR3SCrI=;
 b=Vlnm5e/sJjXLg4V7YfseeX9xGRI7xKgoEiJXUYAPPUCxFIhbll5HhmN35oLcTC8nRD
 NgDkA2G9eF16l9iqelPcJDTO9Wu40waO4EJOXkbckmr4JgTN4dQLiioFaEJIBY7iLqQQ
 Cb//QPvAIvV5C+oLPmSRV5Hk3gN2mmbF6JdP766+m8xoZPawi8b6f3NR2NmpdjmuOIAp
 1uwSjArNGZerovNc0olONwLzUraKd6LuycURrnjb2No78Oe2YRBldhCUzeS4zbEXrnDT
 VvVGqLcgF5RQVBeq4uSZuLVcH8N7QOfVGQSLng5eWcf4AiVzZ4DHxV7gqW+T2qOvM8bL
 WG6g==
X-Gm-Message-State: AOJu0YyVw2vSiOkO8dU9qrlUNUoNCzrbd6pjp5bRijCFei9bv1Z1yA//
 usX7D5/iyF2Bw1IiJVs77vdaPIJumxv3tEhbTuosFaHrZetjL6Lcng9W+kvChqdP46o=
X-Gm-Gg: AeBDieu6vUsUQHf9r8I+kTbOAjNtWZCxxtCzhH6BSZBUfP99PxruA7Mt49jE2BmM6aE
 WOwyjgX2zX8CTXIt6dsCqV/LTZCKRk/lFnN5OaX1x8+xW1QGsrX1vbITWaHopE87l+op7VdkBW8
 0zhXG9/u7QuIN5C0rWpm7vz+YJTFTKqahD9sOr/9EqbZczzKp1c9FBVXT7cyDlvjTS3LKWKdSWO
 6WQdpi4ISb3CFw6HcI1HIFFScMvR72gHijGdQUsx3cih0PuCGUGY/1YvFGCE2xwzJHbkjd3PuvV
 /8MbNRob1uGn2cRXEeGwVeTyJIw58+NmKRbb/BjChso0tGxlSDNogJDqLk4K946w4bjYVddKe1K
 O/iiS6vXdpBTn/vWoOB8Fqxng3DuTQj9xJQlHKW+a4pHEnq/j7EC+FDWrWr5xdaQoXYtlBY/mN1
 oR9WpYH78HOrpZxWbcszIE6odKWSdcm87qS3pH5cYT
X-Received: by 2002:a05:6a00:a15:b0:82c:21b8:4a1f with SMTP id
 d2e1a72fcca58-834fdb0ab80mr848113b3a.5.1777508485040; 
 Wed, 29 Apr 2026 17:21:25 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-834ed5cd3b8sm3461727b3a.16.2026.04.29.17.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2026 17:21:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 15/47] target/arm: Implement ID_AA64FPFR0
Date: Thu, 30 Apr 2026 10:20:14 +1000
Message-ID: <20260430002046.59739-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430002046.59739-1-richard.henderson@linaro.org>
References: <20260430002046.59739-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-features.h    |  9 +++++++++
 target/arm/helper.c          | 13 +++++++++++--
 target/arm/cpu-sysregs.h.inc |  1 +
 3 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 35e281699c..60a16ef398 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -401,6 +401,15 @@ FIELD(ID_AA64SMFR0, I16I64, 52, 4)
 FIELD(ID_AA64SMFR0, SMEVER, 56, 4)
 FIELD(ID_AA64SMFR0, FA64, 63, 1)
 
+FIELD(ID_AA64FPFR0, F8E5M2, 0, 1)
+FIELD(ID_AA64FPFR0, F8E4M3, 1, 1)
+FIELD(ID_AA64FPFR0, F8MM4, 26, 1)
+FIELD(ID_AA64FPFR0, F8MM8, 27, 1)
+FIELD(ID_AA64FPFR0, F8DP2, 28, 1)
+FIELD(ID_AA64FPFR0, F8DP4, 29, 1)
+FIELD(ID_AA64FPFR0, F8FMA, 30, 1)
+FIELD(ID_AA64FPFR0, F8CVT, 31, 1)
+
 FIELD(ID_DFR0, COPDBG, 0, 4)
 FIELD(ID_DFR0, COPSDBG, 4, 4)
 FIELD(ID_DFR0, MMAPDBG, 8, 4)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 6263a3cb3b..ec027ed00c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6456,11 +6456,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_tid3,
               .resetvalue = 0 },
-            { .name = "ID_AA64PFR7_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+            { .name = "ID_AA64FPFR0_EL1", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 7,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_tid3,
-              .resetvalue = 0 },
+              .resetvalue = GET_IDREG(isar, ID_AA64FPFR0) },
             { .name = "ID_AA64DFR0_EL1", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 0,
               .access = PL1_R, .type = ARM_CP_CONST,
@@ -6691,6 +6691,15 @@ void register_cp_regs_for_features(ARMCPU *cpu)
                                R_ID_AA64SMFR0_I16I64_MASK |
                                R_ID_AA64SMFR0_SMEVER_MASK |
                                R_ID_AA64SMFR0_FA64_MASK },
+            { .name = "ID_AA64FPFR0_EL1",
+              .exported_bits = R_ID_AA64FPFR0_F8E5M2_MASK |
+                               R_ID_AA64FPFR0_F8E4M3_MASK |
+                               R_ID_AA64FPFR0_F8MM4_MASK |
+                               R_ID_AA64FPFR0_F8MM8_MASK |
+                               R_ID_AA64FPFR0_F8DP2_MASK |
+                               R_ID_AA64FPFR0_F8DP4_MASK |
+                               R_ID_AA64FPFR0_F8FMA_MASK |
+                               R_ID_AA64FPFR0_F8CVT_MASK },
             { .name = "ID_AA64MMFR0_EL1",
               .exported_bits = R_ID_AA64MMFR0_ECV_MASK,
               .fixed_bits = (0xfu << R_ID_AA64MMFR0_TGRAN64_SHIFT) |
diff --git a/target/arm/cpu-sysregs.h.inc b/target/arm/cpu-sysregs.h.inc
index b99579f773..6e8b335b8f 100644
--- a/target/arm/cpu-sysregs.h.inc
+++ b/target/arm/cpu-sysregs.h.inc
@@ -3,6 +3,7 @@ DEF(ID_AA64PFR0_EL1, 3, 0, 0, 4, 0)
 DEF(ID_AA64PFR1_EL1, 3, 0, 0, 4, 1)
 DEF(ID_AA64PFR2_EL1, 3, 0, 0, 4, 2)
 DEF(ID_AA64SMFR0_EL1, 3, 0, 0, 4, 5)
+DEF(ID_AA64FPFR0_EL1, 3, 0, 0, 4, 7)
 DEF(ID_AA64DFR0_EL1, 3, 0, 0, 5, 0)
 DEF(ID_AA64DFR1_EL1, 3, 0, 0, 5, 1)
 DEF(ID_AA64AFR0_EL1, 3, 0, 0, 5, 4)
-- 
2.43.0


