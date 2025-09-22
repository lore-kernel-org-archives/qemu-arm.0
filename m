Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8021DCAC592
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 18:55:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0ldM-0006Vc-NC; Mon, 22 Sep 2025 14:51:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lcI-0005EM-GB
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:50:27 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lc3-0004TE-PA
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:50:26 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-77f2e960728so1971246b3a.2
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 11:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758567010; x=1759171810; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=48M255vDXUg+h3ahPw5Hxn6mwDdmXJFvoCKvpfhtzJg=;
 b=NIPOFXT+JNirVsxNyO1TiQWDeJtzd9MzDAO5JGIBjBMa7ZjcOM7UOQZMw/Ua5sbmxl
 G9W0lGTBXT0AbY4FqOTgeVB8FRFvcaBMempMnuXlvmkEonB1HSi6sjciW95EoTRzWR4M
 TMoGfThjnjKuY51MDMt36MQRQzYJAv7LuLpOj6n7708IQtavi+mjRno+RYnzdROsz5Dv
 bJycKxOFHVjOJF7SYjObnYCiVoC8JdUD+Pjj92u129zw3L8k6Eg2doVNbo6fa2lFYMov
 NEAIJzfVj35WJRPYu+UlLNqqkubP+NRxye7x8DOOR3qFKImkTp+b+BOG/8nZ2wC8DzR/
 5qvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758567010; x=1759171810;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=48M255vDXUg+h3ahPw5Hxn6mwDdmXJFvoCKvpfhtzJg=;
 b=K5p3/bqwGaYqZYLogp2e6CvJxplhFYK3IshfAYQH6vEPZ3/mLbmbzz4jZgis1axn3v
 tcEnknilddAjpBugnp9lKQCJv1/n5eoFNBbrN54ZI+eRUMxj1ekrU7AWJu0cmrJWA5vZ
 3bEQmZRY2JxvWzGYk7UeXW9r3igKn9QUaJ2aZeL+V7wx7W9+WbXIwiauqkjQQHs6mU+Z
 T3U0x2h7VLI0HtktgL0s3tvvRJjoODEqKlHYJULy7ZkanHRHXuRL5BR22c8dGNOEQbMp
 OZPoMXYlIwHioq+CETpvegtcmDMXrRjZC0n83QJkjeZUVaBluZpq4Uq9YMLq1VUmyU9o
 SQ3Q==
X-Gm-Message-State: AOJu0YxlsiNeGdgBtm2l6uc51C5tARD55YjdeTOG5tdEfBrMeu8MNcd7
 RUTuoH4bjKEfauB2YRxL1FA4MUyPw3oakEeMiGvi/ZMZp/JCS1CI0xXa+qK7Di+buyw=
X-Gm-Gg: ASbGncsrVGAy5jTkMjotpk17MrszxTLtAmEJszRtXKtf5Gy5vBceqMaTL+qJ3GQNRs0
 XVsyEoMa1Rw+bLCujkwIeTy0GDD672tu8/T7IYFHQsqI3//j16PSbnY4mZu1i1Zhi+82dkudi0J
 j9qxICQOYzdlNbC1WjoCC9TIvQfQ1Zor0mSwF3p13nfWBAL0a7VRwkEkX4zF+WmnmTWrH3G5HUv
 GboSqMehyPSsvCotAJGMj9PglpUUHfqYfHDNU7Lj4dqfRyJ0wAEZWWrsL60FGQSXuQQAgHcDb5D
 3/W7SiFl0divbIXp6S5kQY9HNjIXaJTgPqMhYnOMKECineQhQ94bSU48wBRrkYs1QCdMTBfB4+Y
 gfkeVYaeF+PWfoaxjtG8D6DbtMV9Z
X-Google-Smtp-Source: AGHT+IG6pj8AQ8C/K2XSJnWEqFbt0j7WlNorN+oVg5XDfQr8pXP6GohDsx+iOr0YsVOrIE5YyNoOSw==
X-Received: by 2002:a05:6a21:3290:b0:24a:d857:fcab with SMTP id
 adf61e73a8af0-2cfdaf0bcdemr137108637.23.1758567009880; 
 Mon, 22 Sep 2025 11:50:09 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77e5fe6de75sm10583861b3a.19.2025.09.22.11.50.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 11:50:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 37/76] target/arm: Make helper_exception_return system-only
Date: Mon, 22 Sep 2025 11:48:45 -0700
Message-ID: <20250922184924.2754205-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922184924.2754205-1-richard.henderson@linaro.org>
References: <20250922184924.2754205-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
index 9dfcf4f993..ce5d597c93 100644
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


