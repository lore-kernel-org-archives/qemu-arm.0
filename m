Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F80C87FD3
	for <qemu-arm@archiver.kernel.org>; Sun,  3 Aug 2025 01:42:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiNir-0007Qw-5U; Sat, 02 Aug 2025 21:41:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiNim-0007MQ-CP
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 21:41:08 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiNik-0004g7-Vq
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 21:41:08 -0400
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-e8e14cf9e2aso2842449276.0
 for <qemu-arm@nongnu.org>; Sat, 02 Aug 2025 18:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754185266; x=1754790066; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bVijz1T025lZJ/0hSUgdbY6zZhdSlCvkQ88R5dahVgQ=;
 b=iN4zf7bkrJW/UTac4RH0Mb6v2sk4g4YEo+ttCfP+kX2sGl7Pt42Zypiiofjx0Cvgla
 ZfPCcLKjJId7DWHjqK0NPaeCt21UEmV1KFAEqCTYWf0T+gDYz3vu+kE4Id+lx0lGHrJO
 kHyji1lzaYfqxChHgf/vKSeewi5MdbvKocNkUcoU8W/4Z1XMbWNN+SqiWywgskhLBmuz
 B2En9yRWHogMii0Ry/e19rmzqrnLwsheHotDnfT1vzWp6UEvlgylpBSwFv029mdUY6Ad
 BSSkWdgHB8aJTaxwj7B4ouPywYzPrAfjaxOLQYvFr8NOxccOnl3xoSkzk42P41FE888A
 WnRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754185266; x=1754790066;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bVijz1T025lZJ/0hSUgdbY6zZhdSlCvkQ88R5dahVgQ=;
 b=cgbgO2b+6JnE0bTgXjH47SyCbgti51xGEPEwS7sIaQYPBrywTX9hAOAMkgogmkT6mI
 MvwvcIVH9F9K1uvv202OinvX1dHJPF2mwpYuoAwAx1jcLwLh7YjKZSpKZaJnIVL4eCWS
 d0OfH5hhVFxWhiEaDl4S2ZWmx2DNiyNbuY/TkaUKf2cjzkCcRnFhR/GMk/s6Dt35IfwA
 HP8Df4SZIHZ9kyfk4hJtlxO/FhM3a/HinIOKnmwj6xKc2GkYV7QLz0AkhGvkzSM7FXFp
 ilvzCyEnVboznRoDC12fJxqvkhjLGV9qrPANWuKPp7C7VBKlNvkmmoVdCSy7xm4qInwO
 N0MA==
X-Gm-Message-State: AOJu0Yy6Ij1g+N9S1edUyZ3i+JT/yix7ucTGFZO62SuDXf6onEp4R7NH
 Li94Yr6IKagXWhnmCOMAjDdsExvjxMNKZZ5lWKrgikRq0WexXYaFdQe535DdT7zLmtyBpA3bgn4
 8HpDJEFA=
X-Gm-Gg: ASbGncutevJTmSHIa+7pk1b200gR/9IVS+en74rf04cktY28iyAqAwZmRNz95YPsXCo
 aFksriQYAhr5wCRT5q8xL5wC05DJHW+8wLhHWZ01439GWdTRI39WzzvzhmC+gzgnxK/BY4Gm1y6
 X4Drvf/PzLokIIc9OcpJa3u5gxxusiUYNw+9hOr7+0XWaJIklVYWrnLQT1ZGhPsGCtt9Wnxa6xX
 grpGQltG5vDL9VRMZuoyYHlmnG6ymtDdlJDLvmnWxIyaKc+e1vQy1N131Fovt9i/hDAmgr2DVO7
 cewaJFkCiyWrOqLDR8mHJQUaZpIZcKE0D4OvtJ0Km8GxuoFizc3uSbmXAaZLDbbnXzyW9ji+Io3
 NfMRiEailTUe+tNxpDWf+5SossAI/z2N3B+SzgSY25TiTiISuNxOOBsu8dXrPigY=
X-Google-Smtp-Source: AGHT+IHYOxrli1+B327BispI/154hb0g20GLFZl4GQAb2zXK0zlHyZMfErHuA7xH34NfC39v+ErcLA==
X-Received: by 2002:a05:690c:d8c:b0:71a:27d2:2bdd with SMTP id
 00721157ae682-71b7f62d7famr69968637b3.13.1754185265918; 
 Sat, 02 Aug 2025 18:41:05 -0700 (PDT)
Received: from stoup.. ([172.58.111.133]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-71b5a6031a1sm18753227b3.86.2025.08.02.18.41.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 18:41:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 09/11] target/arm: Implement CB (immediate)
Date: Sun,  3 Aug 2025 11:40:17 +1000
Message-ID: <20250803014019.416797-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250803014019.416797-1-richard.henderson@linaro.org>
References: <20250803014019.416797-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=richard.henderson@linaro.org; helo=mail-yb1-xb35.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 41 ++++++++++++++++++++++++++++++++++
 target/arm/tcg/a64.decode      |  2 ++
 2 files changed, 43 insertions(+)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index f3970ac599..c47d4d0a0b 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -1766,6 +1766,47 @@ static bool trans_CBH_cond(DisasContext *s, arg_CBH_cond *a)
     return do_cb_cond(s, a->cc, a->imm, 16, a->rt, a->rm);
 }
 
+static bool trans_CB_cond_imm(DisasContext *s, arg_CB_cond_imm *a)
+{
+    static const TCGCond cb_cond[8] = {
+        [0] = TCG_COND_GT,
+        [1] = TCG_COND_LT,
+        [2] = TCG_COND_GTU,
+        [3] = TCG_COND_LTU,
+        [4] = TCG_COND_NEVER,  /* reserved */
+        [5] = TCG_COND_NEVER,  /* reserved */
+        [6] = TCG_COND_EQ,
+        [7] = TCG_COND_NE,
+    };
+    TCGCond cond = cb_cond[a->cc];
+    TCGv_i64 t;
+
+    if (!dc_isar_feature(aa64_cmpbr, s) || cond == TCG_COND_NEVER) {
+        return false;
+    }
+
+    t = cpu_reg(s, a->rt);
+    if (!a->sf) {
+        TCGv_i64 tt = tcg_temp_new_i64();
+
+        if (is_signed_cond(cond)) {
+            tcg_gen_ext32s_i64(tt, t);
+        } else {
+            tcg_gen_ext32u_i64(tt, t);
+        }
+        t = tt;
+    }
+
+    reset_btype(s);
+    DisasLabel match = gen_disas_label(s);
+
+    tcg_gen_brcondi_i64(cond, t, a->imm6, match.label);
+    gen_goto_tb(s, 0, 4);
+    set_disas_label(s, match);
+    gen_goto_tb(s, 1, a->imm9);
+    return true;
+}
+
 static void set_btype_for_br(DisasContext *s, int rn)
 {
     if (dc_isar_feature(aa64_bti, s)) {
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index fa94631123..02e0aa1fe4 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -213,6 +213,8 @@ CB_cond         sf:1 1110100 cc:3 rm:5 00 ......... rt:5    imm=%imm9
 CBB_cond        0    1110100 cc:3 rm:5 10 ......... rt:5    imm=%imm9
 CBH_cond        0    1110100 cc:3 rm:5 11 ......... rt:5    imm=%imm9
 
+CB_cond_imm     sf:1 1110101 cc:3 imm6:6 0 ......... rt:5   %imm9
+
 BR              1101011 0000 11111 000000 rn:5 00000 &r
 BLR             1101011 0001 11111 000000 rn:5 00000 &r
 RET             1101011 0010 11111 000000 rn:5 00000 &r
-- 
2.43.0


