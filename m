Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEEE1C531CC
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Jul 2026 03:08:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wn6Ex-0003jl-LS; Thu, 23 Jul 2026 23:06:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wn6Ew-0003in-AJ
 for qemu-arm@nongnu.org; Thu, 23 Jul 2026 23:06:22 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wn6Eu-000847-Fw
 for qemu-arm@nongnu.org; Thu, 23 Jul 2026 23:06:22 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-382ef647e20so1385949a91.1
 for <qemu-arm@nongnu.org>; Thu, 23 Jul 2026 20:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784862378; x=1785467178; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=XTEJryM2mS5sdwgtms25LDwrZ2fdC0GJ9Y4cXSQ9TQg=;
 b=ewTnCndQ5Dwy/X9IFOtsuI2e8L9y7BGIIT1ZpkrEiyr9HM5ZT7a0bAQWGoEAqN/N8K
 uVaoETCmlVgziKp/bCByyf3hngFlfr4H1yge9S9xwjLrLKzhxxgkHU+HwfOzUs0hIXmX
 4S42Af0naTVVUuAMwz/0IQUCkt91UemgzZH9MLIMBqupAFLJBi5f/9tJ6mbojb3YGXFV
 230EELxGZIS+U7cmEpmkjWx9YKMd0OV7qbn2A+tRIwseSJw72vKQkeStmC2YRhkJRWgq
 X97DZbTqhHJXZnZEffL5HopriIoBLBySpR6SbDYuoGKW5AQCUQJ1Bm98hzEmFKlpyDQm
 LHPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784862378; x=1785467178;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=XTEJryM2mS5sdwgtms25LDwrZ2fdC0GJ9Y4cXSQ9TQg=;
 b=HiC2b65JHlivuyAAg6F5e8A7J6cfkdjK8QSqsp4fvffSviTrwyjOnCURWPwGqP0/aJ
 cpN6+/h3cziIbpRgsgXpx7JmsfYRHRVyPjcwOoFGxH8fdGhj2uKiJKQdwCTgwatINnXa
 GgKNskKqEET93ojIhEkDP9gUNMozFW56bmxFUZK8LJTFlIRdAk5ts6Lx/KgxaSF+2TnA
 3lCm+2Xg7MAVW7vPo76AFAzhphLDtbuYFqoCCG2wgGpCqZ87p5z+jGiuNdv7j/1OoM5r
 B/NmwoFDDAq5N0qrDRufUFDvdT3W+T50rLq9jrYJdpf6xrY8ZMu1nWlSW6CMhIWK4LAL
 G7Fw==
X-Gm-Message-State: AOJu0Ywg5ksFkyO/ZUdzeLeoT8PC6MwYDXGQm6L8aBFAv26JrrOQLOl/
 HR6eCHRACD+GDgDOrEc1vkWeULG52x+Fh+aAonCFuvjLsxVVbTQ+oQe7p3cgvXCrZquD9ejFrTm
 6KhRK
X-Gm-Gg: AR+sD11e310Nz1V4yBUXcIUjPdM5vI28P5xBbQdFcHMI10f9vT+phujkfJo2iAhNlsc
 JxRnw6cWliZ4YqZt/jFyfM0Aaox58OmjJE1qQVipYAq+uKQKGyw0AE/6Cv8RzODMzDNHSf3m2JQ
 5uCbhCgBkCmEGkukIuQDaukamrA4yYnhTWY7X6RGn5cX+mJ4X5jaF25OFelnB/FwAneY1L3LyIN
 ZvV7jl+41JTlG/oPMhdaJtYilnhJNTWvtBFulQgAvP1iqw78TomvbTS5mHCMzlsiVrKvrIPC8B9
 LvBAUTR5y0zuOXpTOHNv9ANK5JLZj8HLMifxF9D0DVH2fygdyp5grPRbxNmSxq0n6v69xbiXcdY
 pFf83D2yMICPU0KSNucfdGn/ONKMmRaTin7CV+7vPGfIgSD1EiMQq7XLWwl2ux7B+agPQysjujF
 jKeLNeyh0R9kFD+gARnkMZwdsv0BTVoQFPGw==
X-Received: by 2002:a17:90b:5241:b0:38d:858c:834d with SMTP id
 98e67ed59e1d1-38ec650c9d7mr5939554a91.17.1784862378516; 
 Thu, 23 Jul 2026 20:06:18 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38f03ad0e0csm750777a91.7.2026.07.23.20.06.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2026 20:06:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 1/6] target/arm: Add FGWTE3_EL3
Date: Thu, 23 Jul 2026 20:06:11 -0700
Message-ID: <20260724030616.76180-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724030616.76180-1-richard.henderson@linaro.org>
References: <20260724030616.76180-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
 target/arm/cpregs.h       |  1 +
 target/arm/cpu-features.h |  5 +++++
 target/arm/cpu.h          |  2 +-
 target/arm/helper.c       | 19 +++++++++++++++++++
 4 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 391c0e322b..34592679e4 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -385,6 +385,7 @@ typedef enum CPAccessResult {
 /* Indexes into fgt_write[] */
 #define FGTREG_HFGWTR 0
 #define FGTREG_HDFGWTR 1
+#define FGTREG_FGWTE3 2
 /* Indexes into fgt_exec[] */
 #define FGTREG_HFGITR 0
 
diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index fb5ed25ad0..75f0fc4169 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1467,6 +1467,11 @@ static inline bool isar_feature_aa64_asid2(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64MMFR4, ASID2) != 0;
 }
 
+static inline bool isar_feature_aa64_fgwte3(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64MMFR4, FGWTE3) != 0;
+}
+
 /*
  * Note the E2H0 ID fields is signed, increasingly negative as more
  * isn't implemented.
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 03a30afcbe..ca75e379eb 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -553,7 +553,7 @@ typedef struct CPUArchState {
          * FEAT_FGT2 will add more elements to these arrays.
          */
         uint64_t fgt_read[2]; /* HFGRTR, HDFGRTR */
-        uint64_t fgt_write[2]; /* HFGWTR, HDFGWTR */
+        uint64_t fgt_write[3]; /* HFGWTR, HDFGWTR, FGWTE3 */
         uint64_t fgt_exec[1]; /* HFGITR */
 
         /* RME registers */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index af45234ad2..d410a9a1ec 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6331,6 +6331,21 @@ static const ARMCPRegInfo fpmr_reginfo[] = {
     }
 };
 
+static void fgwte3_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                         uint64_t value)
+{
+    env->cp15.fgt_write[FGTREG_FGWTE3] |= value;
+}
+
+static const ARMCPRegInfo fgwte3_reginfo[] = {
+    { .name = "FGWTE3_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 1, .opc2 = 5,
+      .access = PL3_RW, .resetvalue = 0,
+      .writefn = fgwte3_write, .raw_writefn = raw_write,
+      .fieldoffset = offsetof(CPUARMState, cp15.fgt_write[FGTREG_FGWTE3])
+    },
+};
+
 void register_cp_regs_for_features(ARMCPU *cpu)
 {
     /* Register all the coprocessor registers based on feature bits */
@@ -7642,6 +7657,10 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_arm_cp_regs(cpu, ccsidr2_reginfo);
     }
 
+    if (cpu_isar_feature(aa64_fgwte3, cpu)) {
+        define_arm_cp_regs(cpu, fgwte3_reginfo);
+    }
+
     define_pm_cpregs(cpu);
     define_gcs_cpregs(cpu);
 }
-- 
2.43.0


