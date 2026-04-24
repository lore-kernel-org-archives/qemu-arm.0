Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33132FB44A5
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Apr 2026 04:31:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wG8Bq-0005x6-RW; Fri, 24 Apr 2026 00:30:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wG8Bo-0005oz-Ll
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 00:30:52 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wG8Bn-0002bK-3g
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 00:30:52 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-42f24cae679so2890833fac.3
 for <qemu-arm@nongnu.org>; Thu, 23 Apr 2026 21:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777005049; x=1777609849; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KcGt5HtaQY1O1QBUWApZ7ywTFf0PmVn1ovydl4Xl+Uc=;
 b=iV5P5hTmy2PXEHlLvlJLa53KaZMGQaMgHXX1ht4IG3jgvred3CG8sTGfkBm4UUGVNn
 2G1pVHvSQK5dmUGMtNOQQavHipf4VftXqIb392E6yTyUzu6Sw5Ce6yfV3Jug/y5gUoWP
 GthS/kXT5Xxfwk8+39J8oqGoj9f53GXVb16PQqr/dwPOsI4nlBuIh5XXDh76qbyb7Uq7
 +bdAr+vZj+qnpJDHu+thY8CgxUHpplVeERqrx+OkTN83uqThclD/igtnW1RfO3CQtBpL
 rfPz41B21x+t34wgejORICEaRsyyCYKUbd3CKVNC0xQR+LSWoIiq2y0bJe220eJhY351
 tiBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777005049; x=1777609849;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KcGt5HtaQY1O1QBUWApZ7ywTFf0PmVn1ovydl4Xl+Uc=;
 b=Gz/SGwoo/rrGj8Dn/umJNyE+lo3OnmVD9GJwVYwATjIiJrhChq9iA/k1UavkjVjSNq
 PxMl5pMvGVdYtBGNsXVAaCxGQpWp8fv6WJqnYyEvu7JL0lBKyu8Kfqcje7FfZmuRRSPb
 v9bcbMAGm8xU0lgVozlhr/dxbcltbK/3EdLiVefqClC1Ctwg8YgojQhPv+dMel6w84Pw
 8XEmfOOnkaYoFcZ8vhrzK2v6OrZd+II+BoD4fOiH8unoCe+LZMpig0zLqWOFq267q5Kr
 h5goJiCB6YfMbfyqbXazrP52MxlL4ANM82qksfIbm8U4SnyXWjPpidp1Ie2m10MNpjeq
 pBSg==
X-Gm-Message-State: AOJu0Yx9kIWLaSMtFpGXmllAOOmNSuYQ2DCZqN/I08fXwHMAwsyFyUjk
 C/MEQ6yTCGYkkFkEffWOsRHArvC2GbRBnqpY8QmNXMlpRPwciNVE43WdoSn/VoNmIRqt9vIg+e/
 bry3uyCg=
X-Gm-Gg: AeBDievmmRqx0ApZldyo4Rh+OryoXiqZLQrzfq8JmEAB1bRTZwAn41LVxCesrGVx5TO
 dYUyHTsGiBCFNauC9/u1kMFA6HgcLij2mGCIJLIv5w9m+O4NGl75KXetJAiZ//jhqWyJ4v8eX6x
 jRevDH9dOU3yc2zG6trImTr3RL6X/3Y+DIyFf1Y7qn2CPxvxYwOomhLfpHhN4mZhvmv/pGxzCnA
 sH/Vo/gcOU8vJl605RZcrTRDEs4N/DRswnFmAIMDlDpqJnwM8PvwzoPOhETdAfSDHrNzK2jR3KJ
 fzKm6vuMxAnAnNf0RzeRVvuBXl/Fmlg6B1Piu5xgfDz9cOaJlt0TeewXDqzCLwtIqly33FC466e
 1j4LubLGJ7R6sHBfIrtF25AXPGusMV6QLraGH/nD82FLo/IZZdp/+jI+ttgwbqXR0843TEfeFfv
 DCV7qd1M1Mii7Hu5/b928OY/hBnmuOuwqBjGesjMoPzA1S89eoZKsZRlFJHHYrTA==
X-Received: by 2002:a05:6870:e391:b0:423:c79:6a2a with SMTP id
 586e51a60fabf-42aded665e4mr18732439fac.26.1777005049119; 
 Thu, 23 Apr 2026 21:30:49 -0700 (PDT)
Received: from stoup.. ([172.58.183.19]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-42b9ac54ec5sm18880864fac.13.2026.04.23.21.30.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2026 21:30:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 06/40] target/arm: Update SCR bits for Arm ARM M.a.a
Date: Fri, 24 Apr 2026 14:29:40 +1000
Message-ID: <20260424043014.46305-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260424043014.46305-1-richard.henderson@linaro.org>
References: <20260424043014.46305-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2e.google.com
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
 target/arm/cpu.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 657ff4ab20..6ec3845edf 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1794,6 +1794,17 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
 #define SCR_AIEN              (1ULL << 46)
 #define SCR_GPF               (1ULL << 48)
 #define SCR_MECEN             (1ULL << 49)
+#define SCR_ENFPM             (1ULL << 50)
+#define SCR_TMEA              (1ULL << 51)
+#define SCR_TWERR             (1ULL << 52)
+#define SCR_PFAREN            (1ULL << 53)
+#define SCR_SRMASKEN          (1ULL << 54)
+#define SCR_ENIDCP128         (1ULL << 55)
+#define SCR_DSE               (1ULL << 57)
+#define SCR_ENDSE             (1ULL << 58)
+#define SCR_FGTEN2            (1ULL << 59)
+#define SCR_HDBSSEN           (1ULL << 60)
+#define SCR_HACEBSEN          (1ULL << 61)
 #define SCR_NSE               (1ULL << 62)
 
 /* GCSCR_ELx fields */
-- 
2.43.0


