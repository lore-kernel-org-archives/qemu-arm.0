Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D90C87FCE
	for <qemu-arm@archiver.kernel.org>; Sun, 27 Jul 2025 08:21:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufwRX-0003D5-Qg; Sun, 27 Jul 2025 04:09:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwPc-0002uM-VE
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:07:17 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwPa-0004pT-Tl
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:07:16 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-23636167b30so31242345ad.1
 for <qemu-arm@nongnu.org>; Sun, 27 Jul 2025 01:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753603633; x=1754208433; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=arVF9tN72BhPKd2O49ekxCQ+4ux1mZKYZhH3GMQy8Vw=;
 b=XoRI0inAFbVcu+4iHCptVU+UyQ7kaFjCeimZ7v8xC9g84nHv+OzT3NB4X3OglUwmd1
 266T0oIaKs2ahdf04jQuY1kaYIpwM2s/EuSn7dI28XHQYWHvhaUKqqN98l63qyVqjUbL
 VNmBTXT3oxgfLR+qgFArxjAiFJXPFpiHFRxioXYwecEMlLuJzAOnrTdUdxDWvqNidxam
 FvBcTMUmgW30SdiOYi/V0hMVrOnRwgfHNeyUo24rj2wHu/1PcN52llcSCaaB4d8Fv+zY
 Y2azzYPBW6uBeo40LdB60vO8fX2n/OrwLUOBF6jW+9J0XOuTHsvRYG7THK7SLqzSuXBE
 sfcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753603633; x=1754208433;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=arVF9tN72BhPKd2O49ekxCQ+4ux1mZKYZhH3GMQy8Vw=;
 b=D09GH3zvv7J+sud6EaTkS1QQPBb6gPQyTqw2GHjv83jOLghhBeZI4Xx67J7qxAFqRO
 SFnonGO/9wYEMCS4B48ZX6FP8gCXS+pmccS8n6aKFSsVmS7QmxQ5Ae/DDlwMZkvexdSd
 nDFaAFZkSHnOpJ1T7IiHXSYG5pCsfAu8DMs+6JXydjnM9ckL2PBTjza5Hzl1k3i5Fvia
 8vRbM0BqeFUOx0w7VN6U5ei00l2zPTCFcJwA2nhQlVkVRRzcRjt4ngIW9MNM4sdwcgsl
 Dy7HbSSaOgEr6IjzS04V9GmMhCyNKeWrbFoIdsnIjzmsBu0CGumR65S4aRkUI0g27j3r
 FJqg==
X-Gm-Message-State: AOJu0YzCAeIne+ZbgdAWSW+ul3wxJ2xUSBgb++zdPd9nIFx/gfNK8agn
 +Z5eK/wt43Hwz+J2IcqxAV1MWUXqLBFICn0hgE0r+daf8blpHnBif7VmCEhVEiqRBXIaBKKpplX
 A8Ba9
X-Gm-Gg: ASbGncvB+g212Mgp6focbB2rLPh4CVwgjuw4PrzbJgzy5xGrSOn1M6ZG+0LNKxt8rPC
 vIch+FeGf71Qs4K9E9z6sqDOmvdRyEgnAfMBfGn+8UI1YwSsB7iu4QQbZuz2h+2OGoy4BNdVDW7
 milP/zcLlQVVIbmJVSkb7R5ZFfpi0E4aGBoVCzTl1fVNu7N69yWy/OlnPLXdpRGu0pxM2TLBqOz
 Hb5ILtZ9VhYfmWmCK/7RHLZm312AzgNpNbALYvJFEr/aLSpEatwcaa4k1Ifb4GuYS1kua6+Wwj4
 VENBnMdBvUM1iN0SPYxUlZQ5bCSw1toT2OYRhos5x1L8EIfoTd2BabaAhNBj8tywmi2WWSQCkAA
 LtcWz32x6UWTSwgCLardMZ2tjYdB38WLAztypPN9I0ojITdh1lcQZQYiL/RQD/jNo6BvuD7iuRL
 pBF4TUJ8nMyA==
X-Google-Smtp-Source: AGHT+IF3kFx4OSDvA+Bf8eqDWdtPyShqYUixsaFKMSMMPKtJ8UDYCVeKAuX5YbZC6UMtR1f6SiWtCQ==
X-Received: by 2002:a17:903:41d1:b0:240:2145:e51d with SMTP id
 d9443c01a7336-2402145e8c6mr588745ad.31.1753603633593; 
 Sun, 27 Jul 2025 01:07:13 -0700 (PDT)
Received: from localhost.localdomain (syn-098-150-199-049.res.spectrum.com.
 [98.150.199.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24011d5bcbesm3908065ad.10.2025.07.27.01.07.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 01:07:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 63/82] target/arm: Add gcs record for BL
Date: Sat, 26 Jul 2025 22:02:35 -1000
Message-ID: <20250727080254.83840-64-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727080254.83840-1-richard.henderson@linaro.org>
References: <20250727080254.83840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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


