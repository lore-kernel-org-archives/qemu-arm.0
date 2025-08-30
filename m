Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0DC4CA0EFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 16:00:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usNzP-0007hX-IX; Sat, 30 Aug 2025 11:59:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usERH-0007QV-Ci
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:47:48 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usERF-000502-Qg
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:47:47 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2487a60d649so31789735ad.2
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 22:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756532864; x=1757137664; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oVJt4rhBlWqXMofG9EtIBvJoQIzG/f+XQmqCdtXKT94=;
 b=SBPJNbRLNpWlo9mXJ/JyTtxGUYHvzpNDqIYGaBcB4IUhV61L4afysIJ2UNEStxVpPI
 gNwwSiWHAE0C4Liyh8RrpXKHKsnQfyATRSQwtOc79K71IF29M7Ty18YaAaIliq0VRFZ8
 mSLZ+uUwfGIDMV/rsxHV4iYvikzdhDUPHxR6S0969ELsAsXjzoHr2LQfA7uz41Bh0xic
 6RZFkoHh/it+rgXTGhFTIQXcgyjXNCEdXVbKxfaCY1j/yI51K7ISOxlrHoCiLce7wHcr
 pKshK5em5zlHrejoSAz8RBUJW0TlsMQW3dsK4ofvXzt6fpGbRf2ItGIX5V+ehG73y1ah
 MgBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756532864; x=1757137664;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oVJt4rhBlWqXMofG9EtIBvJoQIzG/f+XQmqCdtXKT94=;
 b=RfFqQy+8ekQCp0+g212rV+CGR1kbTfXv10Tf0AhCeXJNiEixvEbVYfge+hc1HkQ99k
 P6WVw2WhVL1suBWov6Q//3txFRFwFK2Oxo/DkOsXYrL0nTRKal9LwMm+A66/IyFV7CFa
 lWbY0fKJ8E+lRkP9Lg0+Yslom81lqV0pKWA6/eXeP6KrXelfAPayOGQiRQxs0c/qoVnr
 q0ZoVMaHng0YNDfAZzpuT+ec15sU7a/+xUDznI9GNOGFL/oNCWBDogi5l/L65DYkzpAl
 XIXt1Y/wBbA3rJ7RJm+Vm9STcaxd+2b5gwSM7EUeH+9uOmD0v50ac4UJL5BRGDH9Jjws
 Kfcw==
X-Gm-Message-State: AOJu0YxfCFJHeNQzzaPuo6GuJt5/iBwi1zVCJEbA6vgnTBuIc5YgeX2b
 ENSuIeDlLy9SDjzuqFfJK9obsSkKD71tm3uH7FM7S3TayOmXSwm+2tPx7nYcfi0sqQg=
X-Gm-Gg: ASbGnctLbfvEFjzFIi2VfN5Hv69GZ66eY42yhFj6eX6NgkkWFKCX7XN3KvyAiCBOEMY
 QrUvGLBvwnUddZgk91vcQXRwpJjmMmBrkBbKV5hesKkOc5gXXOjCSpKwgF/SCY88fVxYlU0AU0G
 nNNdLUYPM/8MYnwpe/LsFCrc22qGhW8hhiis7Lv1JfC8fsN/MO8+XV+sU3KAjfvKsqQa+XLB9Hr
 JpKEnsvwT8xd0lp4OXEb8orkLEJGkAEntuMZTYEqmQMwLmvqxf38ilyhnSQP6+P2d4cEhaozfoq
 q3hhqvXTISTwCFbNG+iE6zTbU3e3F2TRwz1K8sE2GNhSaxJljyE1uAXzJHtJjzpkZOXgEy3+KEb
 +Zhiwl5T9MT/gneYIzyA/+/qrYt0thfgFDjDRoZyw/0AdrsAEhsde9mK9Cuk/ajQ=
X-Google-Smtp-Source: AGHT+IHMyFnYxctV1VNdakt+UdDQ+yn3UI7iheiwHcW/zFs1D/Hy/KWchMryK8eG4JexVEZ7O8csgg==
X-Received: by 2002:a17:903:2cf:b0:248:9e56:e806 with SMTP id
 d9443c01a7336-24944870a36mr17372035ad.12.1756532863765; 
 Fri, 29 Aug 2025 22:47:43 -0700 (PDT)
Received: from stoup.. (122-150-204-179.dyn.ip.vocus.au. [122.150.204.179])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2490658999fsm40852715ad.112.2025.08.29.22.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 22:47:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 67/84] target/arm: Add gcs record for BLR
Date: Sat, 30 Aug 2025 15:41:11 +1000
Message-ID: <20250830054128.448363-68-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250830054128.448363-1-richard.henderson@linaro.org>
References: <20250830054128.448363-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
 target/arm/tcg/translate-a64.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 336aac9d1e..8230ac0fab 100644
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


