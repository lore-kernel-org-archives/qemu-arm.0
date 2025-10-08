Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41744CCA470
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Oct 2025 22:11:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v6cDw-0001kD-Ic; Wed, 08 Oct 2025 18:01:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6cCy-0000p5-0W
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 18:00:28 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6cCT-0007Ou-95
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 18:00:26 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-782a77b5ec7so258998b3a.1
 for <qemu-arm@nongnu.org>; Wed, 08 Oct 2025 14:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759960792; x=1760565592; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n7Mihnevvi2zwV4aea8YsxDOm/2e8epQtaNRT/1I7W8=;
 b=fqxbih3WKEFmlEU7oXLFS1LB0hI+7LPDEzroTQRemzBRcP+3vOgB/+M1grVtM9sX9k
 XtIAPcgrcjTDY/OKvfbc1KFpJqiYwjKO1laeYMWU/uiO8sVUP+/SI41FFQAOZzo2E3C3
 o/QqKgVjT1+Zrf0rZDALGFffh3GJbl1hpkzQTFNm9GNzMAfHIdu1r//RUbj2Q7RgONLd
 cONaiN+zqrGNRnut5wXBb2e/ZX47ogDSlVx9sUnBIWQfcFbVQJVDcUBZhrre/VqK13XN
 KyHL6dUcjmMNc/7PJShScSatrkMOVVdsnTsfhfVaRD0La9cNoNQjKT/tvI/FhPd1/q+m
 MPZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759960792; x=1760565592;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n7Mihnevvi2zwV4aea8YsxDOm/2e8epQtaNRT/1I7W8=;
 b=mMHWoxdgWCnb85rdCA0pulcYfPHPt5wK6UBzjKl4BD7PAeHwj5LebXGfiD0U3EovZx
 BKIwJ5txg+5EGfw5C22mV5nz/I946Ius0/CB58eHwnWvKQY3pZO36GVU864Z51Guew/v
 Yum1t2xefr8k/NOxLTtvt6F0F/CH3Ono7vK3NaqLr/1+Rp7PsvWFYXalkiMY8byEy3eW
 ewKCnkIHMMYlqO7rtL0M7yR/8I1AKhPD0VFRT36247zKimFOtUDJJIbsM64JAjaIeA2D
 qPM1fTyRD0yxzo8cXxrK5S1iOOXOsMmnxqqLlSfLQamRmvsCHD4JwTX1RbBRgC5zRFyf
 xMCw==
X-Gm-Message-State: AOJu0YxH2Q0rckpipaM2yRUeNEHsRmRdMsBYzca81PqK6iqZoyvb+9BZ
 a2eu4hRIutWDWMbhJtsMoHwyj73U/gMtJdDEc6toVyD0p0VF0or6pfpQXkhNxR3nLabruOPyzlz
 8Uv5c3JQ=
X-Gm-Gg: ASbGncsI/ykXhXNkYcH6YvK0jvxiC1QBcSVm7Hk5Mmfr6wr1v5XTg0bLAYjJLZy0eYy
 C+3uO41yBAlGRxUyn7avvA5P6LCTWPozfhYLcFWaHZN7UYQ55PoEl/IZ6kk345RDK4/ua5fuK0E
 savRGkdL3+JRrVpAtpExQ+36Bky+h6yn/CjxIwOqCrd5DhzdUGZQppOJGSrzwnslgqjcluotdOK
 UtQYZ+VoNfWU/DcAtGk33wGDCuZh9ROJZ6JhzV3D+lPQMj0DPtcT1nkwylGN2YssA3SN/TPyngG
 datXXJp9kwJMbfyuE0/WFpAb6BMUfY5X4IfZKj78b/mnsIGce0rEgrDsvTIQmOqEtfg+MUGazRp
 RHzPxXWn2Mo1I1OsUpeD64YR+VV40tNPN3IcTonFCK4D42pTkJ0P+ANDu
X-Google-Smtp-Source: AGHT+IERGU4TKTt/9qkmaCpyW8+IubaqX/vkWFUmaTk6yHXMmkRYkjFsLQwBiz4ccUD1/KoJW9KEiw==
X-Received: by 2002:a05:6a00:3e08:b0:781:1f28:eadd with SMTP id
 d2e1a72fcca58-7938763716amr4832906b3a.20.1759960791851; 
 Wed, 08 Oct 2025 14:59:51 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-794e1fc9db6sm740724b3a.66.2025.10.08.14.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 14:59:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 57/73] target/arm: Add gcs record for BLR with PAuth
Date: Wed,  8 Oct 2025 14:55:57 -0700
Message-ID: <20251008215613.300150-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251008215613.300150-1-richard.henderson@linaro.org>
References: <20251008215613.300150-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index fcfa4223f5..9c3de0cf71 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -1842,21 +1842,21 @@ static bool trans_BRAZ(DisasContext *s, arg_braz *a)
 
 static bool trans_BLRAZ(DisasContext *s, arg_braz *a)
 {
-    TCGv_i64 dst, lr;
+    TCGv_i64 dst, link;
 
     if (!dc_isar_feature(aa64_pauth, s)) {
         return false;
     }
-
     dst = auth_branch_target(s, cpu_reg(s, a->rn), tcg_constant_i64(0), !a->m);
-    lr = cpu_reg(s, 30);
-    if (dst == lr) {
-        TCGv_i64 tmp = tcg_temp_new_i64();
-        tcg_gen_mov_i64(tmp, dst);
-        dst = tmp;
+
+    link = tcg_temp_new_i64();
+    gen_pc_plus_diff(s, link, 4);
+    if (s->gcs_en) {
+        gen_add_gcs_record(s, link);
     }
-    gen_pc_plus_diff(s, lr, curr_insn_len(s));
     gen_a64_set_pc(s, dst);
+    tcg_gen_mov_i64(cpu_reg(s, 30), link);
+
     set_btype_for_blr(s);
     s->base.is_jmp = DISAS_JUMP;
     return true;
@@ -1892,20 +1892,21 @@ static bool trans_BRA(DisasContext *s, arg_bra *a)
 
 static bool trans_BLRA(DisasContext *s, arg_bra *a)
 {
-    TCGv_i64 dst, lr;
+    TCGv_i64 dst, link;
 
     if (!dc_isar_feature(aa64_pauth, s)) {
         return false;
     }
     dst = auth_branch_target(s, cpu_reg(s, a->rn), cpu_reg_sp(s, a->rm), !a->m);
-    lr = cpu_reg(s, 30);
-    if (dst == lr) {
-        TCGv_i64 tmp = tcg_temp_new_i64();
-        tcg_gen_mov_i64(tmp, dst);
-        dst = tmp;
+
+    link = tcg_temp_new_i64();
+    gen_pc_plus_diff(s, link, 4);
+    if (s->gcs_en) {
+        gen_add_gcs_record(s, link);
     }
-    gen_pc_plus_diff(s, lr, curr_insn_len(s));
     gen_a64_set_pc(s, dst);
+    tcg_gen_mov_i64(cpu_reg(s, 30), link);
+
     set_btype_for_blr(s);
     s->base.is_jmp = DISAS_JUMP;
     return true;
-- 
2.43.0


