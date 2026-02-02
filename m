Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C5BE7316D
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Feb 2026 13:34:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vmu43-0006lG-7A; Mon, 02 Feb 2026 08:34:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vmu42-0006kv-Er
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 08:34:02 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vmu40-0002aM-T4
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 08:34:02 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-480706554beso48500865e9.1
 for <qemu-arm@nongnu.org>; Mon, 02 Feb 2026 05:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770039239; x=1770644039; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ozYHqfgk0X+sYeYUfUg6SMvjxSTGckHgPzq9y9VW0U0=;
 b=MJYBy1N2HYK9EyQczXG/n2u5s4CkxmSuB5J3ksNgvsI0MERc21CAJrsqM1HAEYh9X1
 w7sNgWyrv+CQWGAlQgnD4/Zuk3SyUAbVUcW1Rv3aURUvIzNYg3/Ta/eA0J6cBLvvs2Nq
 Sw4V5Rt8SxdcvbffOaAOqiL3YHnjsAgI3XkR/H1QNE4SPIlKKuM6UXKkjI6fMi0ZJBvA
 P1z1TXxXJzChJEsJz9Q2Ayez8p90UYKlEu1ExruO7X+qQ78sSWPR/m/JYqHBnYn+JRKH
 q55mP45hsYKZ4zOC8D4tZmsuVBJAyKL+esre0Re2WHhAgrk13+yfFr1bPUrrjS8OfLww
 2LjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770039239; x=1770644039;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ozYHqfgk0X+sYeYUfUg6SMvjxSTGckHgPzq9y9VW0U0=;
 b=NChYzP6LbYh3g8dPq+G1DLRvuB0ZTXAnJMlbISb69zeDMaP6qWKCZtDN4G23FSHOWN
 /SUMl6+2W6PtMmJTUzCBXYWoPfgx84VQz35h38KxdYNBl5+PMsskyad/kv7SixQE/9F+
 NR6ZhiqTJryF6z71lILu0ZeECOMDPWn90q3jchLLqN1FDraJqlpOUBK9JcWp2gWb+GNL
 wdLkEebs3mQ5FvZOIEZc43HY7nS+g2woAqdlxf3qPH3dyuMI0+gv0gh1i3IOuP+gXas3
 RNn96xvzKVal3bPmBx1qUSGrlIcf5DNTEdjeRLMagnTNuwo5DJ5fyBplAv9K0SZRhxIy
 myJQ==
X-Gm-Message-State: AOJu0YxPi09A3gYiX0UtOGdjmNqlCCZUOoS0KhRvLJaIkyJ+5ca6T0uf
 bQ7kUuuW6FG/PbEEV7bZqwzBPZ7ZQqXWXncox+HNic9MhBDxQeF7DrA0Eui1hWqSnSlQpj+YZCB
 5xScZ
X-Gm-Gg: AZuq6aIpyEvqYTSXo3BK9Py4cCCRIDNZdnzaGvoO9NkEQkhYfXW4amewquzLkVQLnQA
 /CzN1JQoCPnV+QPtvScVzLVcwuVyLFq/pMvpPRaABv3gjj3HANJWO1i3Nj6gYVI4FivSEw11kM0
 GUFq4tQ/lmL3Uruf565BhTM1gQAUsFIB4Lp33/VEwv/PEA84zUshrbGBOdQMgQTW6SsHz+L+vqY
 tQUz6LyU4/f9Yz2qyGMMkCp8nSxsCyijAY97lgKUtEvUApzIRhrUEkxVt1LvyGwuIJGTTavCRUR
 f2c+jSp/8OBwy8ObwiHF3URF9dA0X3zhSt6pu59KCekg2DHwg1/pUMiYdD0aDoub69Frj+FDpoC
 smVlNV0uGzvcLRqT5UV9C5aXNUyEtS8xZGV1ibl2qnekL03N21SEBcd3HbTg3xZd8gtkF0+9jCt
 8UHqRTxzcNlkJHR6eHzHqg1zoymvVBUg==
X-Received: by 2002:a05:600c:6214:b0:47e:e946:3a72 with SMTP id
 5b1f17b1804b1-482db49d1b7mr151521965e9.27.1770039238819; 
 Mon, 02 Feb 2026 05:33:58 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066c42895sm478054495e9.14.2026.02.02.05.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 05:33:57 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 03/15] target/arm: Fix feature check in DO_SVE2_RRX,
 DO_SVE2_RRX_TB
Date: Mon,  2 Feb 2026 13:33:41 +0000
Message-ID: <20260202133353.2231685-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260202133353.2231685-1-peter.maydell@linaro.org>
References: <20260202133353.2231685-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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

In the macros DO_SVE2_RRX and DO_SVE2_RRX_TB we use the
feature check aa64_sve, thus exposing this set of instructions
in SVE as well as SVE2. Use aa64_sve2 instead, so they UNDEF
on an SVE1-only CPU as they should.

Strictly, the condition here should be "SVE2 or SME"; but we
will correct that in a following commit with all the other
missing "or SME" checks.

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/translate-sve.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 64adb5c1ce..81f487152c 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -3769,7 +3769,7 @@ TRANS_FEAT(UDOT_zzxw_2s, aa64_sme2_or_sve2p1, gen_gvec_ool_arg_zzxz,
            gen_helper_gvec_udot_idx_2h, a)
 
 #define DO_SVE2_RRX(NAME, FUNC) \
-    TRANS_FEAT(NAME, aa64_sve, gen_gvec_ool_zzz, FUNC,          \
+    TRANS_FEAT(NAME, aa64_sve2, gen_gvec_ool_zzz, FUNC,          \
                a->rd, a->rn, a->rm, a->index)
 
 DO_SVE2_RRX(MUL_zzx_h, gen_helper_gvec_mul_idx_h)
@@ -3787,7 +3787,7 @@ DO_SVE2_RRX(SQRDMULH_zzx_d, gen_helper_sve2_sqrdmulh_idx_d)
 #undef DO_SVE2_RRX
 
 #define DO_SVE2_RRX_TB(NAME, FUNC, TOP) \
-    TRANS_FEAT(NAME, aa64_sve, gen_gvec_ool_zzz, FUNC,          \
+    TRANS_FEAT(NAME, aa64_sve2, gen_gvec_ool_zzz, FUNC,          \
                a->rd, a->rn, a->rm, (a->index << 1) | TOP)
 
 DO_SVE2_RRX_TB(SQDMULLB_zzx_s, gen_helper_sve2_sqdmull_idx_s, false)
-- 
2.43.0


