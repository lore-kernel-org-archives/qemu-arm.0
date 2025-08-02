Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C15A0C87FC9
	for <qemu-arm@archiver.kernel.org>; Sat,  2 Aug 2025 23:50:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiLtE-0006Sn-Hf; Sat, 02 Aug 2025 19:43:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLnz-0005ai-SD
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:38:27 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLny-0006J2-5n
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:38:23 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-30b83108f7aso194651fac.2
 for <qemu-arm@nongnu.org>; Sat, 02 Aug 2025 16:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754177901; x=1754782701; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U+KcO3RwrbURwPiGEiM0k/8PzgvqrFmZdld21Sd1wzw=;
 b=r645oQwOPO6HW7lSPAL4u11tkC/0WrWggMCR3mSDkTDzBHNBoZvLfxb0xsTbTe9IjL
 L+r1tTvK+91ylqZ8epErdREHiMwRAtt0o4G37lzDQUHl3c2oNTLHOMB+iXJahfGdcr/+
 hx1I1uOMe50h5RL4WZfZJw/M/jbrkW8l7ovT8DfG57vrqMMbSSGs2wth5c6/ElqL7k+D
 YbF0Sc1ZdISKrWgzBs/OI9k8SCzL1TwnNu8pcj0GxFbG6ijirYLTKHVMbj6dnD8a+Z69
 991nxarm+u7eHnpl+02ejkub3/ThS3zLz9QDaXx7jphEzL9ikWmkUcXmz1leXxTdfpcw
 5C3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754177901; x=1754782701;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U+KcO3RwrbURwPiGEiM0k/8PzgvqrFmZdld21Sd1wzw=;
 b=wGFsY/NdR4zPGqMow3KGH4fgtWU33aTc206Kb3xaJSQMatjFl546mVz6DiT1T6DL8V
 9BBJyRZLnirzcdpnsrc3BgZnsRT/O3kdGnGZ7UHcI2069KQeFZv9kp9nI17dMceMI5TJ
 4j9cSuFsGwg41/RiiV2lU3dAsMPpMveoRvewJCe3bDMSw4atybDK7JRRcITNHlXKNM/c
 XrI+XnxqWVgrq0dRBEzo6bebWlVIv/TViCMRIQA83FT5Spnp14yMPNyx0RYAIL7Hu0Qt
 JTYz79p4fof7FlXxubbjX3eUCoflNp9oIsWeBYuWR8/CzRCLtHaRkA53tThxRGlqWyrO
 JWBg==
X-Gm-Message-State: AOJu0YxW4Ey2lex4DWJGwAlZulF8pLq3iosMPiW9YcRbx/vl8VA3OD6P
 cCJDbQ/lsGaqC5vN8nK/WdXS+fuFWdU7cLHBde/DU7LOeN6L0QSB/xhN3fkd1P+FHP2r9EK5Uby
 a1/liNn8=
X-Gm-Gg: ASbGncvdfX4SnPKb3pH/ETHEAz7FZCwV41RIJ6r6/X8oTHzbf6mI9++T7KDn/CGxaaV
 7KbzyFcyg3wfh4fhLUMVffDnQHEcDe5b6/QJ304+eOk2+wZJd/qh2SOLoDDyzyYUFQLnH/IYsG6
 SrSCKM6Vat91w+TJbitLXz/NQYzoPKDqnHGpjxiY4INSdRSC3CkNSHIaCY9vbDMerievUwZgb3i
 y8hTQ9qhSHTUl4S83lKYKt+fQ6n03yo5I6m2tpI2cW06eMxM+iAm93+9IJt1kTunWxmU2wgKP/P
 eZBGy99nIycXpx7y18uhTITlBJEe4KSpyKs1ujDKl/q0PCRtdh1rt+DuRuhsLoeJVsKoFEA5bXA
 fFFhFyta4J+HgJ53Hc/76V5jSLVJAq0g9yNbTmb3atKydUG8dAdsO
X-Google-Smtp-Source: AGHT+IHxX9Cmf2XGJW+9jNfSBRoymrGA7LUe6Iv99m2+G/JTMksu4sdJW/wpLyeGj7pyKa2UE1Milg==
X-Received: by 2002:a05:6870:b1c5:b0:2d5:2955:aa5c with SMTP id
 586e51a60fabf-30b670b9c63mr2525534fac.0.1754177901045; 
 Sat, 02 Aug 2025 16:38:21 -0700 (PDT)
Received: from stoup.. ([172.58.111.133]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-741a71dc78asm380409a34.30.2025.08.02.16.38.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 16:38:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 67/85] target/arm: Add gcs record for BLR
Date: Sun,  3 Aug 2025 09:29:35 +1000
Message-ID: <20250802232953.413294-68-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250802232953.413294-1-richard.henderson@linaro.org>
References: <20250802232953.413294-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x34.google.com
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
index 6fd3032613..4c3cc3d943 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -1771,15 +1771,15 @@ static bool trans_BR(DisasContext *s, arg_r *a)
 
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


