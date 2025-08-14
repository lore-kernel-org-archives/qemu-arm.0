Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E11ECA0EDC
	for <qemu-arm@archiver.kernel.org>; Thu, 14 Aug 2025 13:14:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umXef-0004Pu-4A; Thu, 14 Aug 2025 09:06:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXdc-00036c-5A
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:05:03 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXdP-0005Ij-T7
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:04:58 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-76e2e629fc4so1024945b3a.0
 for <qemu-arm@nongnu.org>; Thu, 14 Aug 2025 06:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755176684; x=1755781484; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zUATJGpL2aZmNHvgdIJrCiimV4Ex+T+dDBuXOQXlrRM=;
 b=VQCW5FfuPuK1puZq4Wmpa0JrLyZJVHMGOt2MhX77FgFoOzgsmD11+1bMgbhs02qgx2
 e1BDpMtIspILdedS0f3Y5EhLIVjYEIivGRLK+cTnnBlDrjWZLRNm6XPdTfYQFQjgAgoT
 DU4egfwaIgn3Ne8rl0YbvThgrniz4ksAZMPlyi7p+NWM3lkP3upvVQ+kPflZepvitC74
 6o/WztHlfdkTo6sSmJKfjq+RjZjr8G6fYficBJo/kpOkAHJVE882Wk3W4NK67jQOn+pk
 v94g8niIUhoPIXhZ9dAcCksmnVRFAQ8o+o1vUjAhuRp2ktHKXl/itrovPBy7iv4BsN1r
 A3Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755176684; x=1755781484;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zUATJGpL2aZmNHvgdIJrCiimV4Ex+T+dDBuXOQXlrRM=;
 b=jo2lqq/5GjKHizS8v4h0OZvjGnmpvftsz1Ps57XHM31jZuiXJ+7Vz4+5bPEaaVOYVt
 JcO3FBWGT7hp5/w+UiCGOyQUlAWnQuIIxeiqTtxVSkgTvTrSAsJDBw8PH6RbywaJ6Ew1
 hyDJZ3YkheMyw/hhjg6ZFVde8zAH1LrIl+AODxV2zjblJF3Li7AddhKTqT//ShIUc/jn
 Ot9aWxlQVPkVJ/jL83DJXcTNCZpOX61n218PPSgwGxlAxpCHSMnzcrDCN6SumI8F0rrk
 oShhXeqJnYYjfe0ce2SHX/syA1fnxNykq6YvWBWXaQA4VYVyaYfd3qqu1dJuuySECzyx
 l4ow==
X-Gm-Message-State: AOJu0YxpmtO9gewZNPJX7UbNmGWzXBE5MzyeGGpqddxJyrOYN/th8LGu
 yY7N2dlEn2yHUJIQHX50Y2BbcxoMKrAT7N34bVIIinoZmus6X4gjeMrOQyeDwuamR1E=
X-Gm-Gg: ASbGnctL9OaJHvDXzkm8Y2ySlsyw1Dlrc5jhkkk6WIwtC9TaQDWfu6Cg2I7NzttLnnT
 THo+hQS/c3jVgnCpQK8MBhyS3GblInCx7DvO4Dw4pZ0/MfK571Hx7C4pDJgv9OVkoCXG16JBzN8
 h0YFXoit95/YK4D6FlgqVF3/lqE66N0oXZ1ewLS9a1pzobBxRwdOovhPbmrQlWX0Vx2BsVqWoXH
 gxwiTdYkXhbUEU/jR9EXpN6afLwnYAbV3t0TYMHQeU5jynY56Lm3X/5fk95g9tI2p6yehN13RaF
 z+qp1F58YFdkGtZog6FL0ToAm2uQvjZ+5yIU21997cdB8LYmFTWIMaTcT+oEF3YdW7roOz7v0Nz
 cSufsnb3nLNHixDOcuNQQvm+m7g1a6HrAepwAcodt+ItBz/w=
X-Google-Smtp-Source: AGHT+IFV3CkynLpXycITZt6NVyg51oEddwnNqu2toXxNeMuBwWdA0u6guxJHRV/xtjr/9f+zeag0Ug==
X-Received: by 2002:a05:6a00:7095:b0:76b:caa5:9a32 with SMTP id
 d2e1a72fcca58-76e2fb315b1mr4497765b3a.11.1755176683611; 
 Thu, 14 Aug 2025 06:04:43 -0700 (PDT)
Received: from localhost.localdomain ([206.83.105.236])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bcce6f6fesm34480631b3a.26.2025.08.14.06.04.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 06:04:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 67/85] target/arm: Add gcs record for BLR
Date: Thu, 14 Aug 2025 22:57:34 +1000
Message-ID: <20250814125752.164107-68-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814125752.164107-1-richard.henderson@linaro.org>
References: <20250814125752.164107-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 957ec232a8..62cc565229 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -1782,15 +1782,15 @@ static bool trans_BR(DisasContext *s, arg_r *a)
 
 static bool trans_BLR(DisasContext *s, arg_r *a)
 {
-    TCGv_i64 dst = cpu_reg(s, a->rn);
-    TCGv_i64 lr = cpu_reg(s, 30);
-    if (dst == lr) {
-        TCGv_i64 tmp = tcg_temp_new_i64();
-        tcg_gen_mov_i64(tmp, dst);
-        dst = tmp;
+    TCGv_i64 link = tcg_temp_new_i64();
+
+    gen_pc_plus_diff(s, link, 4);
+    if (s->gcs_en) {
+        gen_add_gcs_record(s, link);
     }
-    gen_pc_plus_diff(s, lr, curr_insn_len(s));
-    gen_a64_set_pc(s, dst);
+    gen_a64_set_pc(s, cpu_reg(s, a->rn));
+    tcg_gen_mov_i64(cpu_reg(s, 30), link);
+
     set_btype_for_blr(s);
     s->base.is_jmp = DISAS_JUMP;
     return true;
-- 
2.43.0


