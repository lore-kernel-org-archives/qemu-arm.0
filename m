Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58918CDE002
	for <qemu-arm@archiver.kernel.org>; Wed, 24 Jun 2026 13:48:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wcNnZ-0001iW-Ce; Wed, 24 Jun 2026 09:37:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wcNnR-0001b1-Lv
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 09:37:42 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wcNnQ-00015g-4H
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 09:37:41 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-45eeba68948so724324f8f.1
 for <qemu-arm@nongnu.org>; Wed, 24 Jun 2026 06:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782308258; x=1782913058; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DY8kuxxNwlc1FK61o3Rtv6tRPc70RdExCw4u34E/thM=;
 b=C/s9YA7OkkM/iZOA1LtiwOEWM9QSxktiXDsc1Q+x9EqHpV7Iis4rm9mLJydyygcrAK
 DweexJ0biAhYZpbgBDUJJni2G0+DRa74Mj2h3uV8n7T35IrBD2T7gYoyF3ASwOYffiqP
 +gbobjBdFSGha5nUwQQbjD+5t0jU1VJ+Ddadx8bKhBx5+DIIj2LPJIgstwu00vmlsu3K
 iQJF2VbZJ/aKqycPLOVk00LpTkP9PS0WxPAIH+J9y7m9VH0aNOU0vlJ/3opoouYcaTGx
 9Zh9779wxQUkyCHxRX4DB5hsSQ/ScLoow+Pl47HCwVCJXSAOedSGPvQljMULfBrkhwsK
 /I/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782308258; x=1782913058;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=DY8kuxxNwlc1FK61o3Rtv6tRPc70RdExCw4u34E/thM=;
 b=tLhagXe5pqU7coH16CAS++oRP2+ISBBiDXo4R4AjQRedLDxz0CnMRXFviE9VYojWRX
 hXqUQ/f7MuhDMrFMJthgBHMhI3kd/Jc0Fzb4GxqrjLXBDpzEUsgT300SMjM+nO5wp66D
 iFghmETyOdKplqm+9haiMwILmCPpK4BNOOc7GsvTNywynQXdUsEdq+gm1SKmE0MHImQZ
 zjZX/tewO2b1FvpAwdOgM+6xRnUDki7tK3QwhgSM+NAmb6MS3lVvxo70aMSlaicAPe8S
 p2DkogoR+0PllmF0XuIlJ8akQe8hnNNI8Js3S5+pZ983ydqRqMMEPN01I2cotv2eTBo9
 YM+A==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp8I+aCB9kbBz5W9s8STvUFG08mgh9PWcTcAOSm+KcrIfSMN71M8tnNdpyQi/hTCrLWR77Y+DblUw==@nongnu.org
X-Gm-Message-State: AOJu0YzGRswuLoekXTALyuORnZ7tAk8hXzRaHnbUG/d+jnUlI91ehGf6
 zJPJrhHMav1W39Uya360sWF+hyEIw8bG2S2oTtyuq+vT6sbGpmyq13BIUIyr5mqO5Pi3YEFswbw
 pTbAIvHE=
X-Gm-Gg: AfdE7cktIDfyWm0a1tUNZ+Q+Q4yj58TKepS1heSM5Mw3Z5CJO5GPN90HNL0VmtxJ/k5
 QzriooB5y/V6NGmt9/y7vQCLTDIk2lZVb+RamLfZmi6uSXM/XAGJPWUAt1oRqiAxwxzWXEEULAn
 Vvmg6QEzRaEJx+9zF7PWNTVL5esn9kXQOtZGnsyo8DvjP6koBDTLKo1JYq4NphGj0rBAf66+XKD
 BdBEAZ6U0oVKjj17dc9lmL4aF0iDXDjn537DX+zpwGyJOXL4ZhJ88Gx6z4k7XpLOUAszsWwGHAc
 /KXx2pwmRZFBw1VQVLN15BlCCsgD9CWznePEAFWKUfJpyIWKWKA1IDWRr8MRh9Q9Nv9X5DNfLPW
 WBe3bnfwoCAAMJubiw/6lUC85ZZtebUE1LlbQeATf09tAu6352E0Cy2VG+dc3mlIEY6LbykeEgI
 WAvGT0nU58bwRLoz+vtjSEPvebbQ==
X-Received: by 2002:a05:6000:2911:b0:43b:5672:efe with SMTP id
 ffacd0b85a97d-46c04a35bd8mr5927872f8f.9.1782308258474; 
 Wed, 24 Jun 2026 06:37:38 -0700 (PDT)
Received: from [127.0.1.1] ([2a10:d582:31e:0:2e21:1ee8:260f:9a76])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c1e840efdsm6646334f8f.5.2026.06.24.06.37.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 06:37:37 -0700 (PDT)
From: Jim MacArthur <jim.macarthur@linaro.org>
Date: Wed, 24 Jun 2026 14:37:26 +0100
Subject: [PATCH v2 2/6] target/arm/tcg: Allow vector FP conversions with FPRCVT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-jmac-fprcvt-v2-2-dc6cf8e512b6@linaro.org>
References: <20260624-jmac-fprcvt-v2-0-dc6cf8e512b6@linaro.org>
In-Reply-To: <20260624-jmac-fprcvt-v2-0-dc6cf8e512b6@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Alex Bennee <alex.bennee@linaro.org>, 
 Jim MacArthur <jim.macarthur@linaro.org>
X-Mailer: b4 0.13.0
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=jim.macarthur@linaro.org; helo=mail-wr1-x42c.google.com
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

FEAT_FPRCVT allows the vector forms of FCVTXX and [US]CVTF in streaming
mode which would otherwise only be available in nonstreaming mode.

Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
---
 target/arm/tcg/translate-a64.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 07f985a5f0..1a0868eaf0 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -9915,7 +9915,14 @@ static bool do_cvtf_f(DisasContext *s, arg_fcvt *a, MemOp src_mop_int,
                       bool is_signed)
 {
     TCGv_i64 tcg_int;
-    int check = fp_access_check_scalar_hsd(s, a->esz);
+    int check;
+
+    /* FEAT_FPRCVT allows vector forms in streaming mode */
+    if (dc_isar_feature(aa64_fprcvt, s)) {
+        s->is_nonstreaming = false;
+    }
+
+    check = fp_access_check_scalar_hsd(s, a->esz);
 
     if (check <= 0) {
         return check == 0;
@@ -10120,7 +10127,14 @@ static bool do_fcvt_f(DisasContext *s, arg_fcvt *a,
                       ARMFPRounding rmode, bool is_signed)
 {
     TCGv_i64 tcg_int;
-    int check = fp_access_check_scalar_hsd(s, a->esz);
+    int check;
+
+    /* FEAT_FPRCVT allows vector forms in streaming mode */
+    if (dc_isar_feature(aa64_fprcvt, s)) {
+        s->is_nonstreaming = false;
+    }
+
+    check = fp_access_check_scalar_hsd(s, a->esz);
 
     if (check <= 0) {
         return check == 0;

-- 
2.43.0


