Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D3F7C87FD2
	for <qemu-arm@archiver.kernel.org>; Sat,  2 Aug 2025 23:55:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiLt7-00068R-Iy; Sat, 02 Aug 2025 19:43:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLnv-0005Y7-RU
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:38:22 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLnt-0006H3-FN
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:38:19 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-741a905439eso355534a34.0
 for <qemu-arm@nongnu.org>; Sat, 02 Aug 2025 16:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754177896; x=1754782696; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=btTy/xuxxPZif0L5vFjFow988XjxZLXwQbU1+T1I7Ec=;
 b=YL68KsBGMzX8ZDDJnOCwod7eUatVB3/vyaRMQ1AKAmgK8ZdNY+jcoAfzdUT4rVOQI0
 +B2SNAmW/n5IMFRWrWSmOk+bigatVth5tiW/fcy+q6vT/ObKNPadbLe1teDa8poK0r67
 A3DedF73j5pnh7+cqymd8OezRFg1iVc1L1/t1Z0zeEqe2euvRfH6Veuq+rlvuW8UcrQI
 j/JU7bPcN3MBHO473lO3FCga6U1iYjETPg4QCLnmZ2x4pLlnFY8GDdkIlvL72iMYN1GV
 AsV6hhDnXTiJiNtNd1GjIDyGtbHFbwYw19FGIkH2UY2ZpP7PkFoGsX1fxg8jGc7oTYe4
 0eiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754177896; x=1754782696;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=btTy/xuxxPZif0L5vFjFow988XjxZLXwQbU1+T1I7Ec=;
 b=izY4m9AQZL3g+VUsQ1N8F3vUum2AE5s2d+nBjN4v//o/1gGRSNlb0rImDwaLOHBpPU
 MwSaU736bqSV2F8ssMqhthDs0vIL1eTylDSDoY6d9DYt4HFEOhoVmIbRjTMSn2KMD1qn
 4w18Lra2ePngBEAfUpwETcLBfR59x7vNM63uKB7Cy+9n7DaV+CRLASIJGFZ4qLZSbJlL
 JPh0l75F+gMv6NCskL65IU/T/dL+TnaN89bDhWFKof9OD12O32epr7QhR48F3y666YYO
 OMyqWWjvks3fL9FKgp5pkXk9AXHZJYGEKRJKRdvmbO9IxWJvUWW8Y0AkFoi/ERuyM9FL
 yrFg==
X-Gm-Message-State: AOJu0YzMgf7de8NVlNMp8kKmL0mCvW854kulf9I/7T5fJqpRpNaeGA/9
 Ajb5QRCRTGERVIo4r7TFbJfqWAC8HRJpaptI1eaeTsDAW0LMvFv76dLEanc1hfKGmOU=
X-Gm-Gg: ASbGncvgZG9Y081f1hJlfY/yy8zShyHcuMD5ljgD0OPAZuot1ogtUIr2HEf+ZYCk90o
 TA3RrbEBUae+LKqRzlQ5wHaQ10TQR+b/y7PXH2mTUkqoJPggQTfBIRvjzVbMfnIww1MccNhl32H
 W7ZyTmXWXBon4ieDw0vmmy5FyHkzFIKhHfFDv2vyrwMuoESJyqtdNOaSI0xtkst0jzeSkyTH/tg
 nww5ZRtiMmVDO/jf3iEsqrAKEWW81VOfN9K8dWO0BrLl8DDc59Hs5KN29hIZhQy7Mxv5Pv9ah0w
 aKBxWYKe3w4cyaCQT6zeLF1lh4xEtZ+c/a2e5VdDEQCnBSkV8Ldc+WJsEIEaVlqBTd10ZuEdf2d
 lKOpoFSK2HORQtp8bzKt0hZM7ixAht1LE1XFCTObzVTVdcutaboWi
X-Google-Smtp-Source: AGHT+IFfW/VOhELQyAK1RRVMLp33MerZKerr1BG7dgrViRqJqs2qb0/KKsthf7RfPQU7kkF1k+DyBA==
X-Received: by 2002:a05:6830:3345:b0:741:a4a2:88bc with SMTP id
 46e09a7af769-741a4a28c5bmr1527662a34.8.1754177896186; 
 Sat, 02 Aug 2025 16:38:16 -0700 (PDT)
Received: from stoup.. ([172.58.111.133]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-741a71dc78asm380409a34.30.2025.08.02.16.38.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 16:38:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 66/85] target/arm: Add gcs record for BL
Date: Sun,  3 Aug 2025 09:29:34 +1000
Message-ID: <20250802232953.413294-67-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250802232953.413294-1-richard.henderson@linaro.org>
References: <20250802232953.413294-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x336.google.com
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
 target/arm/tcg/translate-a64.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 88fe5ac4ef..6fd3032613 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -1667,7 +1667,14 @@ static bool trans_B(DisasContext *s, arg_i *a)
 
 static bool trans_BL(DisasContext *s, arg_i *a)
 {
-    gen_pc_plus_diff(s, cpu_reg(s, 30), curr_insn_len(s));
+    TCGv_i64 link = tcg_temp_new_i64();
+
+    gen_pc_plus_diff(s, link, 4);
+    if (s->gcs_en) {
+        gen_add_gcs_record(s, link);
+    }
+    tcg_gen_mov_i64(cpu_reg(s, 30), link);
+
     reset_btype(s);
     gen_goto_tb(s, 0, a->imm);
     return true;
-- 
2.43.0


