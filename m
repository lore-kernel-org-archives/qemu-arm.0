Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D44C531D0
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Jul 2026 03:12:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wn6Jv-0004SA-0p; Thu, 23 Jul 2026 23:11:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wn6Jt-0004N0-Bx
 for qemu-arm@nongnu.org; Thu, 23 Jul 2026 23:11:29 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wn6Jr-0000SU-L2
 for qemu-arm@nongnu.org; Thu, 23 Jul 2026 23:11:29 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-cb5a6aa8760so852988a12.1
 for <qemu-arm@nongnu.org>; Thu, 23 Jul 2026 20:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784862686; x=1785467486; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=DMNsk5wJCAmLsdn+tzJB2vV8rokeWc1jwCnv2XdFyz4=;
 b=jvtu/hakc26BudxU2XidPcQNnrqt/VWbsEMtzQLHp9OLQOJp5q7bts28qvTeqW85uu
 vuhS18mhO6Zm9S/jmbr7fAEXYek5CaUKQVrAsRGKePqp60DJZK8zh6DIaWguGuHEj6EO
 LNx8Acq9xjLCIIs9EMTht4zzn9D6XE/r2UQGjYvFcs3ztCJluAjvZMVsvyhsCAKptDe6
 envmbut/bfiKxbgvXaXtdgIDzl5bEfOLUPJErBYSZlwaCaTnpPFRXL2BE84phN0BSI5Q
 MXm2YsoVTh2YhvQ4muZjS/FVribMeHcV4aZ78y7ujxLoaCZCQSIL9yrxsbu/4YZuNplf
 spzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784862686; x=1785467486;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=DMNsk5wJCAmLsdn+tzJB2vV8rokeWc1jwCnv2XdFyz4=;
 b=e3ZNRGkr/EZU9H8yVHthwOcx0F5dkhUwgwqFf/XXq39cHtk6lPC1ViFepakQDacxl4
 ZE99MCMXGcsD1P6KWTWIRH5cqSXkDt8BzNp0cq5d8bmYoLsWunZOBOJJEdctkDh+CVc0
 7/cK4zoLWoxqmZtdIwncqH7Gk4tkfzIPOZkse9H7faQJzGKA6HcFXLv1NwwvUvc+XfU6
 Seu7kJBIb0vh4f+CIHa2gOKec9fcs9WTuMjiWo7EsSVHsHA5SwiEAoKUrzB2lqNm56Ae
 NpLS1A1JJMLoanfA5z/SmybMVWvUoDIP8gpxIvSQYczyRXQ/TDgBJqFYMYnQ4XWgEPqD
 MeLA==
X-Gm-Message-State: AOJu0YwUkQ7bum76h9XC3XYfTrkt4B/+zMuJIRebz3rER1v7/FYbuOwd
 gdYk6z2fOijb/L+6eOLERrUp6Tct8iGw0TnwxzGYY7DYOkMr9CVnQe2c5S2yPn4yXksrPB+Iypq
 JQZxD
X-Gm-Gg: AR+sD10QI+0KO/IlEZKTa4QeiKI2EkoHnkExTXE+6SWDBv4btL98UcnVDylAoXGn8DT
 1zonEjbCshxSB4jCUyLXnYkhjeINyOOgxwJLRb6uZU29GVEoifuvwG75x5oJRFDzR3VCwJHZjH8
 +C/mobORGLGIojlaa3JW/xFvUZXhePJsq6ZHcGurkf2Ix63bq6PA77UoSmrnxMwGfeJM3Qe0jxx
 QB+DhNFupyRfdOwtNrQWwa9GCs6LvflM/i/7EkJV7PCdfx8OS1OT/ro1CRVbFkPmzaVORUiy0GA
 xJh3pyYlCDMobsVQT1i8N1u5PyUAnYYbjxCjtgoNa0WZ+oHyv3EOREUxXNgk/0APwJeDECaxQKW
 geupQQeBEqv3uBlsKfcOA+RghkG8OILibIz6KkFLw8TXTK60+admaEiT5SRt2LAI86nzYihbqht
 AXqSAvhbcP/6p3KLDQax3yxu4SDvj0+C77vQ==
X-Received: by 2002:a05:6a20:bb04:b0:3c6:3c5b:fe5f with SMTP id
 adf61e73a8af0-3c63c5c79bemr2399216637.2.1784862686056; 
 Thu, 23 Jul 2026 20:11:26 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbb8f0d872bsm3617697a12.7.2026.07.23.20.11.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2026 20:11:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 2/6] target/arm: Enable writes to SCR_EL3.TID{3,5}
Date: Thu, 23 Jul 2026 20:11:19 -0700
Message-ID: <20260724031123.76597-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724031123.76597-1-richard.henderson@linaro.org>
References: <20260724031123.76597-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
 target/arm/cpu-features.h | 5 +++++
 target/arm/cpu.h          | 2 ++
 target/arm/helper.c       | 3 +++
 3 files changed, 10 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index d6f8b4d065..f0b354445f 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1402,6 +1402,11 @@ static inline bool isar_feature_aa64_idst(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64MMFR2, IDS) != 0;
 }
 
+static inline bool isar_feature_aa64_idte3(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64MMFR2, IDS) >= 2;
+}
+
 static inline bool isar_feature_aa64_half_evt(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64MMFR2, EVT) >= 1;
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ca75e379eb..755554bbdc 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1787,6 +1787,8 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
 #define SCR_EASE              (1ULL << 19)
 #define SCR_NMEA              (1ULL << 20)
 #define SCR_FIEN              (1ULL << 21)
+#define SCR_TID3              (1ULL << 22)
+#define SCR_TID5              (1ULL << 23)
 #define SCR_ENSCXT            (1ULL << 25)
 #define SCR_ATA               (1ULL << 26)
 #define SCR_FGTEN             (1ULL << 27)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 13c935ae6c..971f0fbc08 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -796,6 +796,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         if (cpu_isar_feature(aa64_rng_trap, cpu)) {
             valid_mask |= SCR_TRNDR;
         }
+        if (cpu_isar_feature(aa64_idte3, cpu)) {
+            valid_mask |= SCR_TID5 | SCR_TID3;
+        }
     } else {
         valid_mask &= ~(SCR_RW | SCR_ST);
         if (cpu_isar_feature(aa32_ras, cpu)) {
-- 
2.43.0


