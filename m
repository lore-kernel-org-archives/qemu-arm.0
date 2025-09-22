Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90FBBCAC592
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 19:07:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0lhn-0008JX-Rw; Mon, 22 Sep 2025 14:56:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lfr-0004yu-Sr
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:54:09 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lfJ-000506-Hd
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:54:04 -0400
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-b555ab7fabaso559760a12.0
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 11:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758567211; x=1759172011; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AH0Uenjp2D4e4yuH/PEh4ImofNJohar5VRmQYhtWJng=;
 b=YrGgzJe0NsqcjW7s05CpJq0n4Q45MBTG5VDcOHI2AZD4o28MvEK4v3mu9X+hzvz+7I
 PBWTeAmilp79DW4P4b61hUe6XwyBc8aYKwydIgRzwSeystlj9iuEutbvh+1u/AUjzX+L
 AlTpg0/rcMdGHDilYmAdpOeuWbHeZezG8Kl1WAGO7T9i8aJyF66n2do5J0eywOPL30M2
 zeChgMKDmGPQDsgJTbOyjUIkthON8wn5kOSvkFFUzOVjk4/IFzeIwkhmmVcZM4xbiD7E
 S72Q4slIhsc5xvhPOOKWrh8hl2RYhXIoQl6S2g9dKn511yPiw3KhXGJ/eObIZz1TZLCf
 P/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758567211; x=1759172011;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AH0Uenjp2D4e4yuH/PEh4ImofNJohar5VRmQYhtWJng=;
 b=tsbHo+m5nmcBld9s5yeWJQgwLZp5OE9BBkVgOy1cKxHqmdEleCNf7fntAsUYxZHhls
 i9De12wV/8GGJAZ3Zby+0lkL6yoa3oPMt7r6cbjtapT+KeknFHc8iXAC5xgOMulGSTmv
 g2L8HD8LQjvUiMN6dxdSh2Y2XHHlrIZFv8E0NUEzEaVSIZ/NvAF01aaXVBocLzToLsOS
 eU2zGZj9r0xuJq7c8y2uLNefcTELhZBt8w1lM6jjaWZsq1N4gjw88NvisTb6WjtYTe4S
 JR8u5sH55Ih9+6QV8p0/7xaTxa7FIXJ5BkCcaXG2U4YnTWJL0wH9zEQAyHDTeezPvlMm
 7/+w==
X-Gm-Message-State: AOJu0Yw4sdwQnltxlPCTRACHKinDvWiaLTEy1a7MBiYWO1jsHlOii82B
 jDTdGU/puf4Q2Wnv74aGGpDMq/d7cZSNlNX0SW2Ybnu5WeEVeTgdhLH5BhhW+V2GD9k=
X-Gm-Gg: ASbGnctJtaQubwq9PEIEKWpBwXmCb1UdkZCUjd+gItaJkqleJbddzvnzmiMgnADWyhD
 Fsb8DxWQJPcoEEopJO5N6p3fRY9Dgbt2aGRGf7gwAsNl1iAn4bNFzISXjkgNtjbtOGn+KqEWuqn
 XbkLkk+QGwtubrTaMyIOQJ2zqhXeH4d4p9izyUQTKV5sYihNVw1yZovUJxAbOTJN1lTdlqGkpm6
 pJHbI3fiyg4nl6GYprJwObGF7LYPfTFPZAhZHb30yaVw3Nt907jlV8/rViUfl5aB+ys9WulNX9L
 5BqLVhczYRBlU5f9t2fHSmiWssYKM/1XkC28OEwjx+bbyK3wdbBmsA/G7jx7/kxkJQ1ByJEXte6
 mnZDOCtQxE505h+94/R71UQG8w+Or
X-Google-Smtp-Source: AGHT+IE2q1p3jgJmVNlqItbB/dkvtPUXzJSNPxEBiPQ6wBzi+g7I8Is3Ed0SBb6KKvgoA0NFB46LQw==
X-Received: by 2002:a17:903:94e:b0:269:9ae5:26af with SMTP id
 d9443c01a7336-269ba43a000mr184654645ad.13.1758567210860; 
 Mon, 22 Sep 2025 11:53:30 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2698018a472sm138554795ad.58.2025.09.22.11.53.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 11:53:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 59/76] target/arm: Add gcs record for BLR
Date: Mon, 22 Sep 2025 11:49:07 -0700
Message-ID: <20250922184924.2754205-60-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922184924.2754205-1-richard.henderson@linaro.org>
References: <20250922184924.2754205-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
index 6eca241f12..79fc7b8c3d 100644
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


