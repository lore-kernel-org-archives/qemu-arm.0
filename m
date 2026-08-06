Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FCB2C56205
	for <qemu-arm@archiver.kernel.org>; Thu,  6 Aug 2026 16:40:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ws18G-0006l3-5x; Thu, 06 Aug 2026 12:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ws18E-0006kD-5Q
 for qemu-arm@nongnu.org; Thu, 06 Aug 2026 12:39:46 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ws18C-0000Hn-Hz
 for qemu-arm@nongnu.org; Thu, 06 Aug 2026 12:39:45 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2ce87c7e3bbso22544345ad.1
 for <qemu-arm@nongnu.org>; Thu, 06 Aug 2026 09:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786034382; x=1786639182; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=LaQaHfv4P6MPUegXLFMZw8cHU7pJYmdlkVEOwBnBYgg=;
 b=j2jB4lBlGpdWd9TH9GJtUlesZiKkoUfQAH7YGpX2onvpvFJfRs1OqC9/DIJVZcPZKt
 Ifiy7Cc7m1qN19CkC99a1JWY2fEvfWKabirZKLezKALs2LYblimeYMAwVrXaiopF97ON
 fDAiAAWcZRl3NImXnilxh+In2Pvtwq/tgJ9p3CeIOICFwjHs52GUhMw4WTrCISAoX4fY
 uCnIDjBW5KDpb/Q9DsKDONjiq5kMy/BswEmxWmVthu+b9Ay1LLtIYVUjnIfayResxHon
 6PSYAYjlocjxD1iZB4z9I5+T2EvS6i07EWe5SWe+VlpZinRX804L1gU66oLY26g8TlSS
 FPrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786034382; x=1786639182;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=LaQaHfv4P6MPUegXLFMZw8cHU7pJYmdlkVEOwBnBYgg=;
 b=hG15zuy+5XGeNfRtJLYn8HgtzlvXBqRYL428GjAHWMto0FfFpveBRlMkdybh9/rcml
 z5tW/wKsj7rBWWLj56h3wwZCQHl2Xr1F0t+0hvrqruRQ3nTQiAXVoGONfvCM4AGgiBSn
 ktGcFYW/HLMquhp4sX49ZQxmLjoOCaEuNlVVImBa8sLjXjUU4NQjvG6CYxSLCqRyzYva
 J/zDP2jZzxd2mhpSglPr7B6TYMCybOzL8mAq6FLOOlJXIduJcnloknW6GScHzm6SgNdo
 il+pJZGCMCI/yOrV/1dccDmV/gCaAgsm8pdys2Mx0brtEtM+ZKkWwa3s58MZ20aqaFvL
 VdQw==
X-Gm-Message-State: AOJu0YwKsG9kO1eRcnb2HXLsg5kyMclAr0gV4X01sMEPc9GDESSq8Qj3
 HopYcNrVbg7cQwgMSUsBw273TtYJtPyFobZ1rFqrNJKNIaLmn68kTGjCfxpMDiftsiNFDM5VOAl
 Sm4OR
X-Gm-Gg: AR+sD10ua/COqOyLYqxm+ckuvH0OHO16rqypblaWkJM8RIEDn+P+agvWHDMfPFuUiuN
 j0Bi09iDwVC5Baqqbqbt1rWq3nP8kFHEf8K0wxTE28xLxLbYZxj4xZJtgQxe+Y+t3T13D5oJezo
 mYvDQmTByi8tWqbk1oNOJIVoV72pBtpjNcHQAyvP7FcDV9yG8/Q6rCGg7ZGZI9iRh9Bv3PptmAH
 X1PTeLoJ6gymCujhiboQ4KqR9YMP+42Fuhhf1l3AJgvuMsz/1/J0e/5PaQeRhcrxepDnzJqqc3M
 H1RCJLxBwIwBO0eGfz7UtoEl3KJeUSqyRz50DjYSXGsLxS3htF3wZpbDYf1d/mvs8W9LVycG1wk
 ytms7eMpj9RPgig40OYMwRu4x3RR+ro+eaqgtqVJgsKp7Pe3WNvi8OxfYPVWnctH0WjeEcktZIf
 ZqjeUU1fBYcM1jwUOGJHzJsyWlhPuKT8IxokEGJ01wq/woMSC5GQIsS1rox7ppANRr8x00LhZzP
 NrxeJXzmtNPJXinOI3s
X-Received: by 2002:a17:902:fdad:b0:2bf:9760:b94d with SMTP id
 d9443c01a7336-2d0ca7fd072mr206644015ad.15.1786034382419; 
 Thu, 06 Aug 2026 09:39:42 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d0aa4ec8c7sm34280735ad.80.2026.08.06.09.39.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2026 09:39:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 2/7] target/arm: Pass ARMCPU to aarch64_aa32_a57_init
Date: Thu,  6 Aug 2026 09:39:34 -0700
Message-ID: <20260806163939.328201-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806163939.328201-1-richard.henderson@linaro.org>
References: <20260806163939.328201-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

There's no reason to pass Object when ARMCPU is more appropriate.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 2 +-
 target/arm/cpu-max.c   | 5 ++---
 target/arm/cpu64.c     | 2 +-
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 4026f67579..9c9196475b 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1813,7 +1813,7 @@ void aarch64_max_tcg_initfn(Object *obj);
 void aarch64_add_pauth_properties(Object *obj);
 void aarch64_add_sve_properties(Object *obj);
 void aarch64_add_sme_properties(Object *obj);
-void aarch64_aa32_a57_init(Object *obj, bool aa32_only);
+void aarch64_aa32_a57_init(ARMCPU *cpu, bool aa32_only);
 void aarch64_host_initfn(Object *obj);
 
 /* Return true if the gdbstub is presenting an AArch64 CPU */
diff --git a/target/arm/cpu-max.c b/target/arm/cpu-max.c
index 089f514bd8..d7f2500353 100644
--- a/target/arm/cpu-max.c
+++ b/target/arm/cpu-max.c
@@ -16,9 +16,8 @@
 #include "target/arm/internals.h"
 #include "target/arm/cpregs.h"
 
-void aarch64_aa32_a57_init(Object *obj, bool aa32_only)
+void aarch64_aa32_a57_init(ARMCPU *cpu, bool aa32_only)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
     ARMISARegisters *isar = &cpu->isar;
     const bool aarch64_enabled = !aa32_only;
 
@@ -205,7 +204,7 @@ static void cpu_max_initfn(Object *obj)
 
     assert(tcg_enabled() || qtest_enabled());
 
-    aarch64_aa32_a57_init(obj, !aarch64_enabled);
+    aarch64_aa32_a57_init(cpu, !aarch64_enabled);
 
     if (!aarch64_enabled) {
         aa32_max_features(cpu);
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 2816735577..e3ee0253a0 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -688,7 +688,7 @@ void aarch64_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp)
 
 static void aarch64_a57_initfn(Object *obj)
 {
-    aarch64_aa32_a57_init(obj, false);
+    aarch64_aa32_a57_init(ARM_CPU(obj), false);
 }
 
 static void aarch64_a53_initfn(Object *obj)
-- 
2.43.0


