Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58553CA0FFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 17:04:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usOEP-0008RT-1e; Sat, 30 Aug 2025 12:15:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usERL-0007Rd-1S
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:47:51 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usERI-00050X-E1
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:47:50 -0400
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-b4c6fee41c9so1943291a12.1
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 22:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756532866; x=1757137666; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s4O/Df2srkFicGVgbJE0q2IGU0RhnxZd3TgyrSwbJEQ=;
 b=BkLT+vqY0tgK+aQTy7oPXBpq7hlbBGCEPLIoz1VZCgaQbxUNGWGP3q98D4p+4C4xCI
 pw26pl/yRw0Yr8XJnoFTpWjPcYim22oQisogd9fhOtZ+SV3OqB24XNDuZSKylp3jVUaO
 /p/Hw31xyNK2A5UJuU6pd2b3QrEB2GATtM7jlwv8Pm+ybPrBFSnbLw3cbClV8W9EaZKK
 jsXd9Q+ybmVQPAPVU3qU4io8UPMs074MJbEP6vKVVQ97tEo+FD1JGWWKCmsaiN9YY/yf
 +KoNkz/535pMugaWDHq8nobFiUboGk7Q8sk2RXXxUNxA0xm7eSYNrbWOUWX1gQrJit3m
 C5Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756532866; x=1757137666;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s4O/Df2srkFicGVgbJE0q2IGU0RhnxZd3TgyrSwbJEQ=;
 b=PpOLvxOhxpEEWcEmBDhKsd32VVDo6X9VsISkRBy39zPsYmpDvS+GCm/S7l/d27fvGp
 eD1n/5YYaCaPAKpKYJiHEEv4uy/UDHxLG76yEB7KNGnJR4KrrsnkKhRuA5q3RJEPQXJp
 9pAqhsV1VU0uvjAiTotcs/voFlUZwuxsNGqJ7W1tjR/D4WCZLv8qewhUzSUTtyP7zsJx
 znt+oyjuK3LTqiITDI8Xmv97k9uhp/NwgYDGGC5gRG6GnBqFWUQ8JPnZE5FXLRtvZJBn
 89cmIwAL7UvEvHrPLhbc4krO9TCQsgn7xqH4+oHCt0/iSGMIprHGV2N+0YURac98mdSM
 EeNQ==
X-Gm-Message-State: AOJu0Yy7gC2tlEeRcmupCnov+RdlAf21rZmX4p0YT5bDYW//fQTqKorC
 zvjmFMaPh3BbMNZlDgBiipvFbFNJ4flL+xoIqfG0/0Y+Tm3LnTewhKlF1gMLmuvG/0Y=
X-Gm-Gg: ASbGnctqcPbz8ZK2vt0W8alzDfAbAeJJxgaaMQziGH+N/h3RwlDbwnxj8P1PReuaLL7
 f0vzrMXn6UMNhAF7eLmTO6ERLWgH3fK+sznNyW/Klfta0ZpoMm91eRnbDRLGXzeSd4h8araT3gf
 jitJLXg1vxgMxfOG1aGypaDohCpkPXucfCwW7LHibJfWkbvcA9hgpyo/qfq3aQQk8hfIUl5QkaK
 XEWz+iV3rHrcAkjpQons6IAuTWH587Da26CMq8WYjP3M4bKZkjbh+pWKJqa5dT5uGp1hJQ4Vfcn
 m01gY9SnSf7IJdl0E7pRnsp/y7GeLLglgShW3uOCtAeNveeitGy3BkUAaqrP260xJAVF1zP7dv7
 9KeV/eNHjdoX3BhH9LzrnYYruimhhuHfwNtxWA/dO6PyTgZg+wNtFc2J5ZiQB1B52Gr8/BJi0hw
 ==
X-Google-Smtp-Source: AGHT+IFJZpoTfVL6XI+7vU2svDG0Jxszv7OKocelo7eoWUskVZk8lUoI8G8OGPJYcoNBfRsWHF5Wgw==
X-Received: by 2002:a17:903:2347:b0:24a:8e36:420a with SMTP id
 d9443c01a7336-24a8e364377mr5600575ad.40.1756532866418; 
 Fri, 29 Aug 2025 22:47:46 -0700 (PDT)
Received: from stoup.. (122-150-204-179.dyn.ip.vocus.au. [122.150.204.179])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2490658999fsm40852715ad.112.2025.08.29.22.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 22:47:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 68/84] target/arm: Add gcs record for BLR with PAuth
Date: Sat, 30 Aug 2025 15:41:12 +1000
Message-ID: <20250830054128.448363-69-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250830054128.448363-1-richard.henderson@linaro.org>
References: <20250830054128.448363-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
index 8230ac0fab..20e18687d5 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -1842,20 +1842,20 @@ static bool trans_BRAZ(DisasContext *s, arg_braz *a)
 
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
@@ -1892,19 +1892,20 @@ static bool trans_BRA(DisasContext *s, arg_bra *a)
 
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


