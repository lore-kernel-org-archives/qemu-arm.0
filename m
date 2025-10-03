Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 536DCCAC5B0
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Oct 2025 17:42:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4jO1-0001w9-7G; Fri, 03 Oct 2025 13:16:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jLL-0006ww-8e
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:13:20 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jK5-0007n3-D7
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:13:18 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-78118e163e5so3016645b3a.0
 for <qemu-arm@nongnu.org>; Fri, 03 Oct 2025 10:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759511512; x=1760116312; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Th5N6qtDLrIK8tuhabgewKWLUS9KC9Uadn5+0NtuwGw=;
 b=FZq80Z73eJGLh3fEJzyrVanQtoS55yPqBN3xQKiWaStI6rEAaTyJs5+2n1XezovsL6
 mD/icfmpvKKQeyVd4yIhgorX1rqAaVvBbsTuZ8im/HV2N8KQoY5sDKfk1UfVzFgPcbeR
 uKlKY22OM3X5W95/x+pUbFalPAd6vl2i5NOkHIGPjRzQlix/ioQij38Z/7fyPBmdniTv
 9Qgw6QQbW8FGu5gAEt4xtmD5Ngn2erNiJSVYu990ywDA7Epdbd3iTkcMa3CWPUsStQ6O
 1g6Fzd9468GbOfWgFGUEm5KR6AOYCj3DEMXJ+H3UPtXRHgO8LV+WdpJVFPdQwvNhVNej
 sH7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759511512; x=1760116312;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Th5N6qtDLrIK8tuhabgewKWLUS9KC9Uadn5+0NtuwGw=;
 b=MMSgw5nJnUQqEnE8rcUBMEuTdFg2MC7puxVaP7fkEj7P4oxjf2g3qnbC1185E/flYC
 BPHGSmfEd4Gd2Qn1xrT6dbeTF7tPcuTqX6tHGIbNPYixLFzw6Kbt8PdOXQVi6yP9QsjC
 s20HbW3S0cQYp35BUYaT3DZBrgnFyPIRU4aEE4GrSJb0OuxYPEFHYNfdKGga/Ul9e/AK
 IBBtQShAYoqVNcdHvKCOMc4KTTlAULz7M/lFTEvvTUJGsLaIdyLQNZNumgYdVgJtdMZd
 Czh/OsCVroHzTvTFmBJ4QSd8n5v44odBq8ABvRbLUYIi5/oYnTU1WMSRU5F5S9h15QOJ
 g4Sw==
X-Gm-Message-State: AOJu0YwtbE8EgDC8NzlYyPwr1C95z5u21JIV207Tgn3ugPMi+3jVJJJs
 sgCyHcqcCDoXyYIAXRM5teGvNIj+qGzzWFA/P6Ze+qAYioMZj3AJcgnMQZVSPjEjJTo=
X-Gm-Gg: ASbGncvN2SP182NwEDxDRp0GDfvRlSXEWEVPbcURHLqx+P4bgZ5xMtNSujifqJjDOxm
 ll3jBIbQVWdAMRN5MqcdF7+pJdUMtgbpoY4+VkeO8fwGz1MyWhXjoxUG/o2CnukffwwCPoGIS8j
 LNykKrsgyv9JUhyBBtyVvPo9O/MNPuHWQGxkeRxHKmERFToD7gHeODc1ODqZY04lnEUjPulVGlg
 CFvSDuKv2n51TXjFSaGDZTB7jw1AfMNsFrnJ8JFSKVlQMN/wesKVcCeZ82f630KhJqwbuk8GMFt
 GbdEv+vMs6yiX1FYoInEsk7IwQztR8pJG2BX6QFNI3w0JzCkSVm3VnTeV1ywy4Z7xk0653dzNBe
 nVkmtQzrpDxXrCLS0UlPLGDDrVFCQlt4qK4Ysi8EGI6ugXLjR+r4xuGup
X-Google-Smtp-Source: AGHT+IFLXT5kiNYhztAYVR6/edNHKQHRLKywbhl2mj8YZ/QYvbqrpGIDr6l2PikSX65/xIVyQIfMNA==
X-Received: by 2002:a05:6a20:9389:b0:2cb:519b:33fe with SMTP id
 adf61e73a8af0-32b61d9e05cmr4404087637.21.1759511512460; 
 Fri, 03 Oct 2025 10:11:52 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-78b02053a51sm5418769b3a.46.2025.10.03.10.11.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 10:11:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 56/73] target/arm: Add gcs record for BLR
Date: Fri,  3 Oct 2025 10:07:43 -0700
Message-ID: <20251003170800.997167-57-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251003170800.997167-1-richard.henderson@linaro.org>
References: <20251003170800.997167-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
index acfd086e0d..61a75e2a12 100644
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


