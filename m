Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E7FCCCD184
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Oct 2025 22:16:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v6cBv-0006xv-9m; Wed, 08 Oct 2025 17:59:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6cAW-0004TF-50
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 17:57:58 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6c9I-0006kR-F7
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 17:57:54 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-267facf9b58so1971795ad.2
 for <qemu-arm@nongnu.org>; Wed, 08 Oct 2025 14:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759960596; x=1760565396; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9TlVHZpayQS/myvCVeAjxeyWQxv6D3ZZ+dMoMBNlFQc=;
 b=B0TtU5gZXVA4ReBA/hrI7UWMLvNkqAHHXIlgLk+ugEXTw0BrRlON7u4HM9zTzFklXi
 YaxOjE6hG7OaAGsvwjBUxP5Wajk8tZK/GgC7NIS1jvOHH3bSACY0F6U5J5mVImKmFqbP
 8bn5vQlfvWNGlqu/HKMD3ZNtG9ccyRzqMUZSUk3+z6xE30bZqLmQ59gCJwGN2icoGCcM
 2tczL5Nu0MHO0qtjNMiZD/PS1d37GNYYvGDZ6D8xOWRNLVVWK6VChOTxsY+0rSC9bZRm
 n7QW0ZdEo3Mm/IFKcib6s6FPGRix2CsYRbKGFG1sXPJ1XwwN5vNQZXUDEvz7VAbOUooW
 lL6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759960596; x=1760565396;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9TlVHZpayQS/myvCVeAjxeyWQxv6D3ZZ+dMoMBNlFQc=;
 b=kekJHbSu7FFECeHnW8SA41RwCWVSDWKs8Z3Imu/AaOZq5EzkL+iPeO4Yk8Xk7ze8cX
 tk7H1SQLzfm3tQRQuL1G7gKuiSLM64FOkf1OvYipYSEJRGLVPUAB7UAr7gJuIiHWJXxJ
 NtDWoGw5BAj8F0RTcO0yWWG15gUFLE0ne4HQFEzozOz1frVLq6cKLN0D+RiFTIIU7UTh
 WnMYsgqLX+VOWr2dd14podSvDDaWJ5oYRtgmWVxe136vpLpnThWQuupy0VOVdRYiQxP+
 7TQ7CHfUD8Ubksqx29HVLUnGgjM4NYN+xd3lc/f73PR6Ra5FgSa0oAjwznUJp/lJzGoF
 Wh8g==
X-Gm-Message-State: AOJu0Yzn1fRI4Ibs/jllPMsFDbokou77r9zyudNpQ3GxHRZfzgeLEDJ2
 xEraEYbI/Q3Emzk/OU36vcyDx8D4TIdkeXm3gBTDEoB5Kb/e8IP/FhDaVzxgjZTZqQc=
X-Gm-Gg: ASbGncvcHPdUXrwCC+VhbLi1bMa6xfcHhPNwsUsPwuOGhX5FWjdchiCUGA7Vl/chszN
 n+w1FzaikEfbiclZ7BfKsUwGe7hexHOy/vUBmjjm3wfrDPYSk2ehK0oZfbb4jOVEpU3hkTOz0c9
 lAWE9mngX69OOaekGVuAFIJQTOexdUps2hCXL/i48u7vEg37R4e3bKYFHGQdIp/U+C7tJZjoQWK
 sPBeGlQL3FmCJcjQSR6+3MMYSPl/c5dTfWSGFQnimbfu5b/coI64p5yfu7NVWnqH6Ce+bCrIWC1
 +rWhO1yTjd0GzGyIqW1ZOgQEZwmqXkhqcjZtJfiza4Bkekc9CR4kWjjEbiurxExLH77e85D9pYZ
 mZh9E57wpanIAVWZRWfrj7Npxykx5rJDZ6XVXkAkhircyMV6WfRXDSc05
X-Google-Smtp-Source: AGHT+IE0p8RUt69UVrY3m+ydEzkfC65aZWzrgJQ6t+dvNsP8c96qXcbMKX7L8EG9pyyaowt36WsPmA==
X-Received: by 2002:a17:902:8a89:b0:27e:ec72:f67 with SMTP id
 d9443c01a7336-29027356abdmr47862115ad.6.1759960596465; 
 Wed, 08 Oct 2025 14:56:36 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034e44ef9sm7354285ad.52.2025.10.08.14.56.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 14:56:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v7 34/73] target/arm: Make helper_exception_return system-only
Date: Wed,  8 Oct 2025 14:55:34 -0700
Message-ID: <20251008215613.300150-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251008215613.300150-1-richard.henderson@linaro.org>
References: <20251008215613.300150-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-a64.h    | 5 ++++-
 target/arm/tcg/helper-a64.c    | 2 ++
 target/arm/tcg/translate-a64.c | 8 ++++++++
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/helper-a64.h b/target/arm/tcg/helper-a64.h
index 85023465b7..b6008b5a3a 100644
--- a/target/arm/tcg/helper-a64.h
+++ b/target/arm/tcg/helper-a64.h
@@ -80,7 +80,6 @@ DEF_HELPER_3(vfp_ah_maxh, f16, f16, f16, fpst)
 DEF_HELPER_3(vfp_ah_maxs, f32, f32, f32, fpst)
 DEF_HELPER_3(vfp_ah_maxd, f64, f64, f64, fpst)
 
-DEF_HELPER_2(exception_return, void, env, i64)
 DEF_HELPER_FLAGS_2(dc_zva, TCG_CALL_NO_WG, void, env, i64)
 
 DEF_HELPER_FLAGS_3(pacia, TCG_CALL_NO_WG, i64, env, i64, i64)
@@ -145,3 +144,7 @@ DEF_HELPER_FLAGS_5(gvec_fmulx_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32
 DEF_HELPER_FLAGS_5(gvec_fmulx_idx_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_5(gvec_fmulx_idx_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_5(gvec_fmulx_idx_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
+
+#ifndef CONFIG_USER_ONLY
+DEF_HELPER_2(exception_return, void, env, i64)
+#endif
diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
index 71c6c44ee8..6d77fd0113 100644
--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -576,6 +576,7 @@ uint32_t HELPER(advsimd_rinth)(uint32_t x, float_status *fp_status)
     return ret;
 }
 
+#ifndef CONFIG_USER_ONLY
 static int el_from_spsr(uint32_t spsr)
 {
     /* Return the exception level that this SPSR is requesting a return to,
@@ -787,6 +788,7 @@ illegal_return:
     qemu_log_mask(LOG_GUEST_ERROR, "Illegal exception return at EL%d: "
                   "resuming execution at 0x%" PRIx64 "\n", cur_el, env->pc);
 }
+#endif /* !CONFIG_USER_ONLY */
 
 void HELPER(dc_zva)(CPUARMState *env, uint64_t vaddr_in)
 {
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 78b2881a15..43c9bfef93 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -1870,6 +1870,9 @@ static bool trans_BLRA(DisasContext *s, arg_bra *a)
 
 static bool trans_ERET(DisasContext *s, arg_ERET *a)
 {
+#ifdef CONFIG_USER_ONLY
+    return false;
+#else
     TCGv_i64 dst;
 
     if (s->current_el == 0) {
@@ -1889,10 +1892,14 @@ static bool trans_ERET(DisasContext *s, arg_ERET *a)
     /* Must exit loop to check un-masked IRQs */
     s->base.is_jmp = DISAS_EXIT;
     return true;
+#endif
 }
 
 static bool trans_ERETA(DisasContext *s, arg_reta *a)
 {
+#ifdef CONFIG_USER_ONLY
+    return false;
+#else
     TCGv_i64 dst;
 
     if (!dc_isar_feature(aa64_pauth, s)) {
@@ -1918,6 +1925,7 @@ static bool trans_ERETA(DisasContext *s, arg_reta *a)
     /* Must exit loop to check un-masked IRQs */
     s->base.is_jmp = DISAS_EXIT;
     return true;
+#endif
 }
 
 static bool trans_NOP(DisasContext *s, arg_NOP *a)
-- 
2.43.0


