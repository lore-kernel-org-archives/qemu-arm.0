Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F4AC87FCF
	for <qemu-arm@archiver.kernel.org>; Sun, 27 Jul 2025 08:17:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufwRd-0003u5-EL; Sun, 27 Jul 2025 04:09:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwPg-0003ER-1D
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:07:20 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwPd-0004qE-5E
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:07:19 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-23dea2e01e4so45488715ad.1
 for <qemu-arm@nongnu.org>; Sun, 27 Jul 2025 01:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753603636; x=1754208436; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7TXE+y1w22n/yh7OLtHbJKv3G2qNUuDgGnZZzftavGg=;
 b=ovIlMz0lFiyBmvs73NTtlOng3R2mT3E+pk/aqSIWGvPXKNWwW1gjvy841dzeXhHmOi
 1UPdqLVNtZZi7YqDFJSTFm7tl/rany1vnFCfjKckUfUF4Cyw8An91CMA8A2hgscIAPEP
 83fcz3X4W4G6EGKmI+03djaPl0QiApAVmkcGetwh8+8vsv198LVdjDddJXtxGGUIYTGG
 c+Wb6SWNKAeIyl+55F62AcfKXiTivhbBCDpI6lkyh9vFF+L9DH8sJGjaAfnsBhOn7yqd
 22LSPDZsgBrZCZk2bEObf0RxIS/ROppHFUwpfpOtT7UhwQGEX0oxOm/I13/06uDtq3Jt
 X84A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753603636; x=1754208436;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7TXE+y1w22n/yh7OLtHbJKv3G2qNUuDgGnZZzftavGg=;
 b=WatX/hmQE4v1ojbimS+vQclD3pLR0ilm2zThIHAfiYTanNY+ujuHDo/tfIngvi6EYC
 6PmQ71kXh1VRQdXtkqgvIfay958KH329NB8plcBqxurYDpUx3fn7q45xla5R7GuPwfSp
 RlRh1KGI0tARcyjjmUbMaSUnBLqC8y5M2Hcuck7sWceX78BZ3HDtP2qkvqrrAzkIZ0gg
 /39fB84VBWjfQTt+dPyzetQPXwA+qQe7X3dBeVxBWEdhnbUqTyoE2UfJpA6KwrsLy4PI
 V90cuIJSbZUCclRCGXyPCxOVhIlHT//sFRpPZisC/NzZjhb0q5XZk7MfkDCQ3VOyQXGJ
 KBZg==
X-Gm-Message-State: AOJu0YwjnOFGK5Fi+2XrcWMt48nwqcUP9NKNTX7LpS2ZPSQugxfQSF90
 Nnvm/DHc8WpsFTY/cAW7rD0PEWlxwT1Tor2nWFIYmFHkG26NrrUEEa4SBob86Ssfq8U=
X-Gm-Gg: ASbGncuuarn6cgGhDWFTNhknfuuooWa+CpcX8sFCLmmQ8aMGPOZtVeab+6LI2OaNNOj
 A/GijwEBaFBTL/r8wa7+TNjZE5bMZR7s3yWMr+1UvPrWUsJiHM5M2X4DFl6kIJf0HhiVRT69xJN
 WKqtpdkfCu6MG3j5OZg8U65oXCEIp2naMQUt18EFVIEZ+ncH98egLd4TS7HNtNxKQFk7tMUCoe1
 jJBFZ29AhW1DSfY9j2i/bxMguYdXPdjdbV3OW79TZ4xCFennRbHue2FhzCq65HqoIE8OylyXRTo
 SUPeUV+QZuX7HX7cVsoyVuyj69C9hHNHDn6p1xcNyLrw4yhxt/MBq9Hi+94uEaxy74CZFG4blf1
 3S842KiUhjG/mybilYqsrEaGCM3/4NimP1BYPBFjCzQVYWPcUptB+Z7MoOVVYt8roWF7yt1M01+
 TOVAC59AGFYg==
X-Google-Smtp-Source: AGHT+IG3jzsa0TkAhyaIVt1nPobzgt1cxaK0VlCFf9jdct5cTr6wNOOaSykvTNwinGs5nqyMhyepLw==
X-Received: by 2002:a17:903:1a2b:b0:235:ea29:28da with SMTP id
 d9443c01a7336-23fb302247emr129933255ad.17.1753603635826; 
 Sun, 27 Jul 2025 01:07:15 -0700 (PDT)
Received: from localhost.localdomain (syn-098-150-199-049.res.spectrum.com.
 [98.150.199.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24011d5bcbesm3908065ad.10.2025.07.27.01.07.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 01:07:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 65/82] target/arm: Add gcs record for BLR with PAuth
Date: Sat, 26 Jul 2025 22:02:37 -1000
Message-ID: <20250727080254.83840-66-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727080254.83840-1-richard.henderson@linaro.org>
References: <20250727080254.83840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
 target/arm/tcg/translate-a64.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 4c3cc3d943..a945fd3b33 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -1831,20 +1831,20 @@ static bool trans_BRAZ(DisasContext *s, arg_braz *a)
 
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
+    tcg_gen_mov_i64(cpu_reg(s, 30), link);
+
     gen_a64_set_pc(s, dst);
     set_btype_for_blr(s);
     s->base.is_jmp = DISAS_JUMP;
@@ -1881,19 +1881,20 @@ static bool trans_BRA(DisasContext *s, arg_bra *a)
 
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
+    tcg_gen_mov_i64(cpu_reg(s, 30), link);
+
     gen_a64_set_pc(s, dst);
     set_btype_for_blr(s);
     s->base.is_jmp = DISAS_JUMP;
-- 
2.43.0


