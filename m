Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C34ECCA470
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Oct 2025 22:05:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v6cBN-0005SF-Vm; Wed, 08 Oct 2025 17:58:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6cAM-0004OU-MG
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 17:57:48 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6c9H-0006kg-Sh
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 17:57:45 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-33067909400so279057a91.2
 for <qemu-arm@nongnu.org>; Wed, 08 Oct 2025 14:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759960597; x=1760565397; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bp0yhTPHMN/nvPJ//sZfWUdhLP1BkYQ3HbuDh6ZDRyE=;
 b=P7YRzzW6fcSIWs8GJPbT+CdUSdbWgRlz8KNxUoBsUGQiQnSZgKbIBauFuJOP2sxN/o
 4FC6Fmmzx7NpSE5x81x9WWXSZnUAA6H+Oc0eeTohQfn0KMEquGYeNHOhiJEJg8iShCYP
 4FQM7HAxrrKb44K8HyYpSCUanU1fwAdIjGh6xehAuDaYX4Dr9fDVBus95hPSJlYqGPty
 CmWiav9Y0sq9Cmm5zUmp7qPeMajKOunSwe/bvKss5GUvhDw2u9txcvWFZisEU2C0x+/R
 6cVi351sKOWKq4Foyksa0Ah03XNlGMKFBZe8cHEBEr8Sqb+JLLcfTMhlNCnmZAx66fp6
 ImiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759960597; x=1760565397;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bp0yhTPHMN/nvPJ//sZfWUdhLP1BkYQ3HbuDh6ZDRyE=;
 b=W8jQOMpYfL9FuEHIguI+7arHOaMpC/9iNXgqzVyncXWw2iTjLqfoleC7XWIa7mpRay
 AmO0+LufM5HB7po6VJXU7z0XECnNksShmnQCRKpH/90H3OfKGwYynOhwIgqio+HzWhUG
 8KvajJSqLViuhnpsor1QO6GnKpE0qKJRwFefF8N/U+3XVLJyajavt1t5GRD7Ru01Z+FD
 fgcQRx4d4eoVsP5Ey8lPC/dwSLRgJBrAnoPE3ukHiYuFDjxbE93adelFISxgbeXJHPpO
 ChaNmesYRzir4CAUxaGEftv4bAFiT3o3Ef0IGbGFpPewDFgGjBaWwH4cRb03mm7F4VcO
 5zOw==
X-Gm-Message-State: AOJu0YyxTFi1tfXjSRB913H8qddMDgS6y4FbUSuhGVyej3ohQ6Vb0Swy
 TrpTsOwVxMBsDde2CAmS8qvsQZH9PcQzYEGJmkaVns8y1vJWAxnBAzyQHujzX7NgXbJxhV81NCp
 XiuG/534=
X-Gm-Gg: ASbGncuu3gIubISLuePAuY1JqlzJGre/TdQfKNzdc/bazFtmRi/vtOBiBudEbJIUMzV
 vCUEnnDfKJLMTamesuObgQ6b37vpkJL4Zf9YnVrWtslJ3GHaM9XWtPXcY+zBLKkEJD8L7Dr23mD
 oTQ08Kb6NxayU9UtNqpEhHWwyNYHoDwwOZ0lbcV2PcA2P7IlV0huwy61UWjrWagjmkHIOK3KSB5
 5qrcr3/LNZ0NdTHdHsq10rJyjvr0V6gIECgl322QvBFe/aYCWDfYgdw9Yk4Xrg6JLgoqt609wee
 VOsx7/GzMDAHnQnIGIpDV193W1ODOyF53cY3itg1rkzjged5BB06doGXlLSX+J12yPNAc/2+gis
 gipf2e9A2Hd414j8vFxanZspVBxpW8Gkepmml8eyxZ8r/CpIn5P6JA2aM
X-Google-Smtp-Source: AGHT+IE4QKW7MbO77KJ56cf6yQDVAV0EIsHKOZ3PKTApQMupj3yiOspMxd9q4dwNf0HlhYGsC7JS5Q==
X-Received: by 2002:a17:902:ce81:b0:288:ea7a:56b5 with SMTP id
 d9443c01a7336-2902723b882mr67882945ad.15.1759960597087; 
 Wed, 08 Oct 2025 14:56:37 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034e44ef9sm7354285ad.52.2025.10.08.14.56.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 14:56:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v7 35/73] target/arm: Export cpsr_{read_for,
 write_from}_spsr_elx
Date: Wed,  8 Oct 2025 14:55:35 -0700
Message-ID: <20251008215613.300150-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251008215613.300150-1-richard.henderson@linaro.org>
References: <20251008215613.300150-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h      |  2 ++
 target/arm/helper.c         | 20 +++++++++++++++++++-
 target/arm/tcg/helper-a64.c | 20 --------------------
 3 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 109aa104bf..2a85ab762d 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1897,6 +1897,8 @@ void vfp_clear_float_status_exc_flags(CPUARMState *env);
  */
 void vfp_set_fpcr_to_host(CPUARMState *env, uint32_t val, uint32_t mask);
 bool arm_pan_enabled(CPUARMState *env);
+uint32_t cpsr_read_for_spsr_elx(CPUARMState *env);
+void cpsr_write_from_spsr_elx(CPUARMState *env, uint32_t val);
 
 /* Compare uint64_t for qsort and bsearch. */
 int compare_u64(const void *a, const void *b);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 64b6c21aef..def4edf808 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8896,7 +8896,7 @@ static int aarch64_regnum(CPUARMState *env, int aarch32_reg)
     }
 }
 
-static uint32_t cpsr_read_for_spsr_elx(CPUARMState *env)
+uint32_t cpsr_read_for_spsr_elx(CPUARMState *env)
 {
     uint32_t ret = cpsr_read(env);
 
@@ -8911,6 +8911,24 @@ static uint32_t cpsr_read_for_spsr_elx(CPUARMState *env)
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


