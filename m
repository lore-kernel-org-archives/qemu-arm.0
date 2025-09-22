Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8027CA100F
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 18:59:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0ldw-0007Pa-5r; Mon, 22 Sep 2025 14:52:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lcM-0005IN-WD
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:50:41 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lc4-0004Te-H9
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:50:30 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-77f198bd8eeso1487050b3a.3
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 11:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758567011; x=1759171811; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xDM1aWiuntpb3ZU1rgv8XRUZ2PXq26slIHJuXs5kBF0=;
 b=OUX2eV4IyTF9yHj/2s0qi0i35zsdrMvf6jiL93lmNy8vAqhTsBBv8VWgX68nNrEMXH
 A6qQ2ZaabmJAWNVq93qodiaM807ckIlpHu5NAOzkj+qHsIYcvGqChajTeHy9/fvleEWg
 JCuqWWXPKqnJZXKtEgrAPhNvieOCdy/5gPMb1TIwJ8VrUEYfM3uYQZdSUy+9lMLFpyWM
 ZDnAn59cl4r5i18GIJiwluXhE+gLT8mJ2VT3qBbAGc3LirBY/gAJyh1wwClfBNIxTgZF
 K70YA9TW39HeWn5xF8cpAxpvA207rJHbPF7o6JqTiT/Xc1W4rjLkFcrt3YEHIPjKEM+W
 58zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758567011; x=1759171811;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xDM1aWiuntpb3ZU1rgv8XRUZ2PXq26slIHJuXs5kBF0=;
 b=jZnpJMWT1wiNsEaS6Yo1O9tXlwzwOXehdULSAi/yAu9bAGlsNb5IQxCcqHGcvvssuC
 /0E0/RKRK+Ny3hClwIkRVXSYxk+ORZHgupxJwBQM+WuZavfY/yEGIQmnXJNFfLtCSgIK
 AMOw3mPiLfJO2FXBSOPIp5YQ6xEFmtBEjQ+1yTucvsT99H4TbJDQdz4LeQEAGYeQe+k8
 g+7EV2mE4ehhxWAfkk0cUyz+n0dFTHYqNbkKrjKzshEE0HpGRQ33eD8peTCZsmeugUzJ
 aYZ4vZ8SMs2BBoQ1uI4g/6Ni/Fq+sIHclF7kpvWkgopVSLIqaXjew/b9U61b/6O0U8pn
 ov9w==
X-Gm-Message-State: AOJu0Yw/b95h/B9oRikipN85zxVfWIVn/FB8DOE87bKqS9quqkuOEMm9
 6T7RKsFQFvRT2iG9FctYY9HXKcfKY14SY7xaHyxEdnoPi8OSFpdPiT9E7FF2zIB5Ko8xmBj0Kum
 fNguW
X-Gm-Gg: ASbGncsm/d/96C9p+m8W9YhT9bXZC0QZ/jwCMsV+7Yj2lUWBrFw7Dz/fYSMztyc6ld+
 gZ6PrC8gAg5NbKharA0bfWkm4BZA14gC6lqIEIJBkpC3VB0cvLIUN8VfMYdpoLCw2rQl7yqvOqh
 /l5Xk9ZfTdjsFNTHmY8VauCtF5tu9Fs7rjlrOICFq2JGkbHjzyBgSxi4p0wW8cyIzuZkbppQL18
 0Ai6tJD5VVjQQ39Jb5URTaR7fNhb9uhj+O6NLwzaVBM5U8lo08bkp5Uqc8d/tJcQlHv7gbIVvhA
 W1lBkg6ojhm6Nig0yZWMq6Oxsf7Yw7ve6sbRHq0wEyOSHqQpxEl3/quGT7+sCskJG7Isn5HBCkf
 LfQZq714q8z79thee31GrQYG5kyJG
X-Google-Smtp-Source: AGHT+IG7G1oX6iI1DdDs2Ay8qkX+3z4V0xpHri1fABrzgvWBTy55bjVVTB7Jmj/JmMTbkY3CvilkGA==
X-Received: by 2002:a05:6a00:1945:b0:777:b207:47b2 with SMTP id
 d2e1a72fcca58-77e4cc3daa6mr16691349b3a.2.1758567010733; 
 Mon, 22 Sep 2025 11:50:10 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77e5fe6de75sm10583861b3a.19.2025.09.22.11.50.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 11:50:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 38/76] target/arm: Export cpsr_{read_for,
 write_from}_spsr_elx
Date: Mon, 22 Sep 2025 11:48:46 -0700
Message-ID: <20250922184924.2754205-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922184924.2754205-1-richard.henderson@linaro.org>
References: <20250922184924.2754205-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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

Move cpsr_write_from_spsr_elx from tcg/helper-a64.c to
helper.c, so that it's present with --disable-tcg.
Declare both in internals.h.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h      |  2 ++
 target/arm/helper.c         | 20 +++++++++++++++++++-
 target/arm/tcg/helper-a64.c | 20 --------------------
 3 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index f72e95a5ba..3766a4ccfe 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1892,6 +1892,8 @@ void vfp_clear_float_status_exc_flags(CPUARMState *env);
  */
 void vfp_set_fpcr_to_host(CPUARMState *env, uint32_t val, uint32_t mask);
 bool arm_pan_enabled(CPUARMState *env);
+uint32_t cpsr_read_for_spsr_elx(CPUARMState *env);
+void cpsr_write_from_spsr_elx(CPUARMState *env, uint32_t val);
 
 /* Compare uint64_t for qsort and bsearch. */
 int compare_u64(const void *a, const void *b);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 3b9e7a822e..3f32eb7a9d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8882,7 +8882,7 @@ static int aarch64_regnum(CPUARMState *env, int aarch32_reg)
     }
 }
 
-static uint32_t cpsr_read_for_spsr_elx(CPUARMState *env)
+uint32_t cpsr_read_for_spsr_elx(CPUARMState *env)
 {
     uint32_t ret = cpsr_read(env);
 
@@ -8897,6 +8897,24 @@ static uint32_t cpsr_read_for_spsr_elx(CPUARMState *env)
     return ret;
 }
 
+void cpsr_write_from_spsr_elx(CPUARMState *env, uint32_t val)
+{
+    uint32_t mask;
+
+    /* Save SPSR_ELx.SS into PSTATE. */
+    env->pstate = (env->pstate & ~PSTATE_SS) | (val & PSTATE_SS);
+    val &= ~PSTATE_SS;
+
+    /* Move DIT to the correct location for CPSR */
+    if (val & PSTATE_DIT) {
+        val &= ~PSTATE_DIT;
+        val |= CPSR_DIT;
+    }
+
+    mask = aarch32_cpsr_valid_mask(env->features, &env_archcpu(env)->isar);
+    cpsr_write(env, val, mask, CPSRWriteRaw);
+}
+
 static bool syndrome_is_sync_extabt(uint32_t syndrome)
 {
     /* Return true if this syndrome value is a synchronous external abort */
diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
index 6d77fd0113..eaea7859d3 100644
--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -615,26 +615,6 @@ static int el_from_spsr(uint32_t spsr)
     }
 }
 
-static void cpsr_write_from_spsr_elx(CPUARMState *env,
-                                     uint32_t val)
-{
-    uint32_t mask;
-
-    /* Save SPSR_ELx.SS into PSTATE. */
-    env->pstate = (env->pstate & ~PSTATE_SS) | (val & PSTATE_SS);
-    val &= ~PSTATE_SS;
-
-    /* Move DIT to the correct location for CPSR */
-    if (val & PSTATE_DIT) {
-        val &= ~PSTATE_DIT;
-        val |= CPSR_DIT;
-    }
-
-    mask = aarch32_cpsr_valid_mask(env->features, \
-        &env_archcpu(env)->isar);
-    cpsr_write(env, val, mask, CPSRWriteRaw);
-}
-
 void HELPER(exception_return)(CPUARMState *env, uint64_t new_pc)
 {
     ARMCPU *cpu = env_archcpu(env);
-- 
2.43.0


