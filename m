Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA79DC87FD2
	for <qemu-arm@archiver.kernel.org>; Sat,  2 Aug 2025 23:43:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiLsZ-00058E-Fy; Sat, 02 Aug 2025 19:43:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLo4-0005h0-Ip
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:38:28 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLo2-0006Ma-PK
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:38:28 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-74137286010so1944210a34.1
 for <qemu-arm@nongnu.org>; Sat, 02 Aug 2025 16:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754177905; x=1754782705; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2HSPiExRqazCWebE64TbzRDEiXNPirvZyWGgI8CApPM=;
 b=OPCcABU6y0IOr45LebLqf6U2UGLvtV43hU9gdX+IKN65KtnlvAwhD9+wKsVZwe7T21
 NkWommxbyeGXGQNTz9SbkiubI1NRZqmEjhlxWcYUYc+dffSp7RYQUlHCRxZs2ngGBu5l
 ofPexncoaU53l6RwgzAOyH9coYSdsMmbDIubez6pRU7VkqoJ3S/tykboBDqAjJQ+l0f9
 Zr0Ntppl4Wbv4SaT95Ubf7nLj3khIlJqhmafmFa8dMWzzkofLCJXmGkFmX/SlapVj74t
 2HetQav4njuqcSDzo71SV09lpNvGpCIvqKZPDXV/Ij2K5aw1ok6lbXXwJsVZGqjcQCHG
 R8hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754177905; x=1754782705;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2HSPiExRqazCWebE64TbzRDEiXNPirvZyWGgI8CApPM=;
 b=F6XWNGDCCtbxz/0X2mH6lf1jBxS7Tfh9K5nQMgQH2JmIISLwhD/qgHWFT3OshocmF1
 7RaWC9ddL3aY8tVVi6j1RxNfo+ft1dzvmLaM0exfF9bPE29TPSV3pPT1lGzK+0Yfzv/8
 pvv/8n2/w1lIKzW6mksdjPTWHjVXJnyg4o6eKNVVqd8HaYtNJg0TQVznhHt0bvwBysid
 PJaJzgLKah8BU+W9dm+UCFQSM7sEAY7uHykPUc51Tl42d41uc5RMsTaKzQfhsLzT8yl5
 XuARkdd+Wk+pNMK5o6nB+bcddVn6d44jjEkTE4e6JpJgtIZO1TSZrWLeOBXDcwdfOGWF
 dTuA==
X-Gm-Message-State: AOJu0YwE54aNSXP04VFhH+7XaIbU3jFQW4xuuYlL59d8mqtQWWq/jMb5
 M85HIlE/EbCaxs5KxqHJdI3iYSi4zaNAoLFSmDY279X8yETJBc9C+Kgh0nCN3Xlab+0=
X-Gm-Gg: ASbGncsxe5jiP+nSLPkFXZhSjcYW29G8br9/WcSaPJGwHcIU0SHuHDTsmCq8A84KlMv
 CrUXAo1j21YP2yR2pf83vtEILoCpPCijNXheofG2WJm7JsehG9C7ZvITzMC2iedewhOOoyH7SOx
 K6f3vFDQRS0mCvRpSSRfAt+wtOdQzvOBTlD525+08v4OKJPyiB3hDACSYLmQXTTQ8sLxgcuMBzR
 bKl2OO9fMtPxYg3tdjw5yW9rcW+uMXU3b95RzA0hjEcgEFMQ0wIxY7rj083kf7z4D04+WqswQ0Z
 JRvfIwJOqtpaursBhA/neL9LMJLWjEVM38qRbFkvSEf3YHaLwA9Z+Vr7tbpUIHbbxhYp1iZDZrz
 jvUcGkyVQ22s/KLFI7Lekw0KSZk4MKiVQvAVkjHJiXDnkLcVy4Wh/GANxdwOr0G4=
X-Google-Smtp-Source: AGHT+IHzLx0oInWui1kROALJKuRaUkC5LQsMNaopnf4EU4XtlCa0lC2gcrcZhiGYeCkHRO+qUwquhg==
X-Received: by 2002:a05:6830:660d:b0:73b:2751:eee2 with SMTP id
 46e09a7af769-7419d2d3e9emr2503781a34.23.1754177905569; 
 Sat, 02 Aug 2025 16:38:25 -0700 (PDT)
Received: from stoup.. ([172.58.111.133]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-741a71dc78asm380409a34.30.2025.08.02.16.38.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 16:38:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 68/85] target/arm: Add gcs record for BLR with PAuth
Date: Sun,  3 Aug 2025 09:29:36 +1000
Message-ID: <20250802232953.413294-69-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250802232953.413294-1-richard.henderson@linaro.org>
References: <20250802232953.413294-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x333.google.com
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


