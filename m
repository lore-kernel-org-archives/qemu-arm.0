Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF34C531CC
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Jul 2026 03:12:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wn6Ju-0004PM-9q; Thu, 23 Jul 2026 23:11:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wn6Jt-0004Mk-4D
 for qemu-arm@nongnu.org; Thu, 23 Jul 2026 23:11:29 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wn6Jr-0000SN-1i
 for qemu-arm@nongnu.org; Thu, 23 Jul 2026 23:11:28 -0400
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-ca97d139d5fso824412a12.0
 for <qemu-arm@nongnu.org>; Thu, 23 Jul 2026 20:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784862685; x=1785467485; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=q0Y2kbYj1Z9WDVTfcWIJ9pgR9UbigNT5bBBvGAanz2I=;
 b=j1SnJZSpI/5jb2BDmaCUsAEuR2pIxezJBGPRB5CEj7gjRdm3SAJ94rEz3PJYyh3vmQ
 FCd4YMUHbiZf+k0arAcYgpgWtqGB83kaMZcGsyEc9lT9PrVUHZ8T1Kl8a19+VRrdXDfd
 CoVYnD1Sihto2664EmCgKziVG7kb+89mKIZP4SvgPwIbo/e/pCon8T6dcMVCv97JJ5g8
 V4vQLSQfR3wtg5R1BMq10LSmgsAu4yQBVI+XSOx6vgBQIwu0iJvj8UF3iMW+RHc2JxOU
 53vn6ihilU7paOL4q92q2QmF1VnjoDNQhy5+BJmLExcB26cpqyyabEZgXamBIzImiNZ0
 JtPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784862685; x=1785467485;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=q0Y2kbYj1Z9WDVTfcWIJ9pgR9UbigNT5bBBvGAanz2I=;
 b=JDvS2/2GTGISapjQSCyD8cNt/aeNgYXefLGDQAl9MhplO8wjFHaLj2/W9hHv+Mtbw+
 fKgPdDk3qGXjNM6pkjTJ/YXrdktn0qL53NIrRoGEu+0X0jwj3RMAW9bCB9eaESWt/a0D
 7zssCBILId2Z3KmFs0Xg7jhRuFVoQHqh446ERbpUkm+bjLb9G9oX0vW5tM5ac/c3qMjf
 iLo3pbEiMZVpqQZGD2cYi0jKaJ0Zu2TkfjJVjWD4ANEuGa5jVRNcINglQwpXKmV65scW
 PlLH3oIAp8lAjpR9rMOnbSAy2If52CRVr6WpjvGqbi1GskzJP8Xx2uI8vO9WJqyvw6Ug
 FU6A==
X-Gm-Message-State: AOJu0YwL154gkWV2ybmUxKxuR8yVZgEtOVZm+kHbvM/4pkHkJ4krmMdN
 Sjz66ik18WkBROHHZ2fJY+wHW1k8GOMpX0V5erBGXBQaYaXKMQq0bjTVXQCXtlDvGF8=
X-Gm-Gg: AR+sD106G4SekUIWcZkKgVOD011JeObU12sOW50GIg3LuDFhAd0kmAMZoz6upwC+YRM
 3li8IbtTsVwFtpnmG7OXHp1Q4PmGQTTb3WvjCJ6UlfCqyPdWsMjn2aRh9cMyLnLYUE2LqZp/MRA
 cJ9Njd1H16uLQfuNw/38/tefvUVq6wAgI/asRq0osewTOvtYCSs3FlQJlwAgR6FvhTuPPP7A09g
 PK58WTsg9WmOCskIL9kVmB8yEAM51v/vgnJkLHmWXfiJ3YrSOt2k8cA1DHgQ5DZjMth9lWdUN2L
 AuArkxZgXenV3MFnWCQwqp562ifO5CnVgKSL+qUdkFgtrXGIngevOaT32uucFDh7s+Sv9bBNNUB
 L4VZc7LQS6PqcsQL2OfC9iagKn47CPcRq0gpDRpJl140GvX6p2+JuUCQclzuLLT1BuTE+KgTw0E
 qCv8s03yONWEUx6Nx+t/XYN+TB111zNolXAw==
X-Received: by 2002:a05:6a20:e593:b0:3bf:8f49:4038 with SMTP id
 adf61e73a8af0-3c44b190a80mr6222159637.39.1784862685391; 
 Thu, 23 Jul 2026 20:11:25 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbb8f0d872bsm3617697a12.7.2026.07.23.20.11.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2026 20:11:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 1/6] target/arm: Rename isar_feature_aa64_idst
Date: Thu, 23 Jul 2026 20:11:18 -0700
Message-ID: <20260724031123.76597-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724031123.76597-1-richard.henderson@linaro.org>
References: <20260724031123.76597-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Rename from isar_feature_aa64_ids to match the feature name: FEAT_IDST.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-features.h      | 2 +-
 target/arm/tcg/op_helper.c     | 2 +-
 target/arm/tcg/translate-a64.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 75f0fc4169..d6f8b4d065 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1397,7 +1397,7 @@ static inline bool isar_feature_aa64_fwb(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64MMFR2, FWB) != 0;
 }
 
-static inline bool isar_feature_aa64_ids(const ARMISARegisters *id)
+static inline bool isar_feature_aa64_idst(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64MMFR2, IDS) != 0;
 }
diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index f040a3fc87..d4186b3d0a 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -1135,7 +1135,7 @@ const void *HELPER(access_check_cp_reg)(CPUARMState *env, uint32_t key,
         break;
     case CP_ACCESS_UNDEFINED:
         /* CP_ACCESS_UNDEFINED is never direct to a specified EL */
-        if (cpu_isar_feature(aa64_ids, cpu) && isread &&
+        if (cpu_isar_feature(aa64_idst, cpu) && isread &&
             arm_cpreg_in_idspace(ri)) {
             /*
              * FEAT_IDST says this should be reported as EC_SYSTEMREGISTERTRAP,
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index ff880eab8d..b45e1b28b2 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2675,7 +2675,7 @@ static void gen_sysreg_undef(DisasContext *s, bool isread,
      */
     uint32_t syndrome;
 
-    if (isread && dc_isar_feature(aa64_ids, s) &&
+    if (isread && dc_isar_feature(aa64_idst, s) &&
         arm_cpreg_encoding_in_idspace(op0, op1, op2, crn, crm)) {
         syndrome = syn_aa64_sysregtrap(op0, op1, op2, crn, crm, rt, isread);
     } else {
-- 
2.43.0


