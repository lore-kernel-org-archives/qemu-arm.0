Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A463DCCA472
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Oct 2025 17:26:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4jMM-0000El-Sy; Fri, 03 Oct 2025 13:14:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jLC-0006mI-3Q
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:13:14 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jK2-0007n0-Mc
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:13:05 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-789fb76b466so2381991b3a.0
 for <qemu-arm@nongnu.org>; Fri, 03 Oct 2025 10:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759511513; x=1760116313; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UlySWn9wcXk2H1NHKTrUXu+Fh0Um9ARvWScWG/KbTlI=;
 b=IdcLX1USL5bORJUiIGYBILLi634bKrLwqjSyylSv+RBi4ncZg3sd/SHZggpbNOGgbv
 qsvxylSGkLSpM2S5wjY/TQdDmEByFsRTtNflTzjnBRjGZ3h90OABCvayZyW9Fyp5I2e4
 fHj8721Fu/qd7rtyYmasdCt53ABLwrcLPTpiLjP2AfiTxUKpQTq6EmH+Mp4WuwIAOxEP
 Ya2Tt6bvoD/KpOwAz/2rZSdPdbxT9i14SnITNBEx6Yjo54d46kxT/J7XYuXeW5Lgi4xb
 gYS+9EmlZ3sezUu+sz9ERCbpGOaoTDaUhAaJFUbgQ7xZ2jno0YjW2Frda3R9ario0pW7
 kwMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759511513; x=1760116313;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UlySWn9wcXk2H1NHKTrUXu+Fh0Um9ARvWScWG/KbTlI=;
 b=SRg87mO5r+5aC1005DsaPSsHigrZX87Lzx8oxY26DagmP1a9r58NmxVKVgbzccW4cl
 U9kmOKAW0vI02RyWUOWoFqhfDOqng8u1XOzxGb1QWRRP2bgP0sKsv6XNp2CiSUDkbdRF
 E/cM/16IEz+1VlSHIqGhFjvpHjyqdK+ZFkEc8uz9rxCVhhYNQFnLoV7ke8Q27OU21QPu
 tQEItzmAV54jj/yTpW2aRg3oq8Q+ZEi+psd21K7y/V2sPqvRlG5LXPFsymCBiwM3vu8j
 aUrasyITcuDf4n72HOxia/eeQ3hWUP5zv9ov06x2Po/4rF6YnXRDPRPBiF1EoCBnZXPf
 VOQg==
X-Gm-Message-State: AOJu0Yz9NG70AAUXyUFKvYkrtfpY25LtYVsz6tLdZSTFLYfz+/BCwAQ5
 kEsIFFyuCdzyPhFfE1AgsFx5O+vIKOateHmBarCXLkknqccTSTtRa17KLy3Yo/4xx10=
X-Gm-Gg: ASbGncsCtubE8ZNxA30Pch4PrcBqsuCzqXamZvHGRC7/vqMjwK5hVykyCer78thBph2
 /wLYhbIIieio4DuCHryQTac5X5jPKA55guSDwXPwE1gJz0ZYixVV3d94o5hYUXh2ufusWq4J7Lz
 5v1p1pqTx3X89yLdGVNF1UJHm9pskVlQY7i2XCWz3S7ilhNLhNYfK12mrI/YRwNJ7oKB2OWHNO5
 W/eNh+6D8Kqi6uzPSS13A8h6iWjJ2GvYreQOX61QeKxOhr2cbP+0QR+AwUXH0vtknsyx+d6nujH
 Ww3zkMJmLJECbFcAiZhVXN4++OwvvtqJMZx3oPccNsv1h9qPNQ2PQw1Q+19jLNoK4KQZTBHNjJQ
 S1Ctw0Elmk1tHlAki1+2UVo3M7z0lTZOYevnGnUFZse489lM+jOEJY7co
X-Google-Smtp-Source: AGHT+IH//lF1KIYjOxgFa4NVpfltvM3mjchYBLm3O2dHM7flSIuBZwd36Pq9b+aMpGYRD4OEBZZtww==
X-Received: by 2002:a05:6a00:194b:b0:77f:2899:d443 with SMTP id
 d2e1a72fcca58-78c98d6203emr4190968b3a.10.1759511513195; 
 Fri, 03 Oct 2025 10:11:53 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-78b02053a51sm5418769b3a.46.2025.10.03.10.11.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 10:11:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 57/73] target/arm: Add gcs record for BLR with PAuth
Date: Fri,  3 Oct 2025 10:07:44 -0700
Message-ID: <20251003170800.997167-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251003170800.997167-1-richard.henderson@linaro.org>
References: <20251003170800.997167-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
 target/arm/tcg/translate-a64.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 61a75e2a12..271c2c6084 100644
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


