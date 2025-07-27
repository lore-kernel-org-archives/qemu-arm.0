Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0173DC87FCE
	for <qemu-arm@archiver.kernel.org>; Sun, 27 Jul 2025 08:14:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufwRg-0004MY-8v; Sun, 27 Jul 2025 04:09:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwPh-0003OL-5C
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:07:21 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwPf-0004qs-CU
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:07:20 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2401248e4aaso1303695ad.0
 for <qemu-arm@nongnu.org>; Sun, 27 Jul 2025 01:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753603638; x=1754208438; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RB9M/NYV6NC+RrE1c3AzJNzEIqzbZfbB8TlpGuA3ub0=;
 b=vQPImJToE0n8d5rEcHPO8+C1TFG2JW1qGOUJnFlpMGiiqoc0ZadBEUALTpnLobC8SN
 7wXMKNkyiWKqiFuODrYC/rlnMwq9xeSt0ynqye5EBlkr5kdmxSvzGywB5XgDe/dwo7NR
 LR/j7O34hUzuYcQ1VgD19dO37EW5tFS555gOgFSs85qz8LYwFSf2kmH65EgOC181oIVB
 CSRUdU+v70onFEpAZBzZrFiQhU58IPZ0qLcSqn+SPhefdpEl8vLqjY/NWls6VLWx8zDf
 ws32DB3mu+hsXdf2CprVgPGxSM+tLS8rxNxddFoamkiEIi1hva50c1wideQLq3y9xvtl
 rDVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753603638; x=1754208438;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RB9M/NYV6NC+RrE1c3AzJNzEIqzbZfbB8TlpGuA3ub0=;
 b=lAEegjTkoh9yj454q1D9Xn9xJC0zvoWmnWDhp1NWhbIxadToz1TU2LbZJijoMNaqIc
 p10AqeWjZ0CaeSuB3VJndvnPixnWclEKmMe8Ub33SNRsXj4+GpYAicUDsEA4nqV90NZz
 tH9cNljQzwdsz+b4zRVcSJVr+R4JWp6Jes2H57SZnRF+qmdbX8YhmJJT4IsdsO8vj4Gt
 IsbLLYb0cCE8GhGYNeuDbEE+30h847rwOx7EPGbxt/piNmF9ckSkdtAIJTp4+yfFnsRp
 h6TBv6rUvvlxV+SmwtSdclPYitaItZti5T+81Mf5L2ZnqxWkrftfioxhlf+zl2mXdq28
 owcA==
X-Gm-Message-State: AOJu0Yz/RObAWeIr2fWshEkZgoImL8JC2oK+qhKVa1IEqQEJ5jdGFGHU
 fAugc+8pJJiQpLepDQ6aGKfZ7a1SjCaz+L/OVoJA0KBww2/cmoDBeRaXD2eNfZHj2W4=
X-Gm-Gg: ASbGncu4v97vp6KzPB3PnXKglfFW903hbRLbRZhjY/HnNsVi5JloQs1BrkHtAOWZboE
 FKHHuoWqnZ8s6gHiypee7soL4qdZu6dh9sbPLHY9l8YEo45aMF5Rzqb866s5/jwWfb5ZCvbzP4z
 l7RGGoS/kWWloojAhD7phmO90QFSYSgOWYP9rekqU90zvUsPg+eg71CXjbd7RXBzKgdrSlxD3tz
 WKE1ipImcAHQ+gttVgeyyYmCdp4keQvq3yO6yicSFRL3GxUnWjTtboR7TZjq89SvxFQh45V/mUl
 iqO+ZhJSh6WdKGXZGrIZsd7LNPq3TlRxzZs/Ik5RnG+B5wgeh+a4ZPeCLkNx01XiGDAYGQQCSCT
 OQmGh69xn4R1nAnQw4CIbhifaoFbkV40VLWtbsflVhVyQr+7pUjauoaFnkvxXYJDyNs00QpYR0E
 s3463VbHFLWg==
X-Google-Smtp-Source: AGHT+IH5ZWHbmImMIHnHrPTrcRkEHEAN0dapUsFJvYyxKo/AcbUmGg978OW/x/pgvhMlcn11rQahrQ==
X-Received: by 2002:a17:903:2b10:b0:234:f1ac:c036 with SMTP id
 d9443c01a7336-23fb31c4de1mr129390315ad.50.1753603638014; 
 Sun, 27 Jul 2025 01:07:18 -0700 (PDT)
Received: from localhost.localdomain (syn-098-150-199-049.res.spectrum.com.
 [98.150.199.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24011d5bcbesm3908065ad.10.2025.07.27.01.07.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 01:07:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 67/82] target/arm: Load gcs record for RET with PAuth
Date: Sat, 26 Jul 2025 22:02:39 -1000
Message-ID: <20250727080254.83840-68-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727080254.83840-1-richard.henderson@linaro.org>
References: <20250727080254.83840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
 target/arm/tcg/translate-a64.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 49e17548c1..23186850f8 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -1890,7 +1890,12 @@ static bool trans_RETA(DisasContext *s, arg_reta *a)
     }
 
     dst = auth_branch_target(s, cpu_reg(s, 30), cpu_X[31], !a->m);
-    gen_a64_set_pc(s, dst);
+    if (s->gcs_en) {
+        GCSInstructionType it = a->m ? GCS_IT_RET_PauthB : GCS_IT_RET_PauthA;
+        gen_load_check_gcs_record(s, dst, it, 30);
+    } else {
+        gen_a64_set_pc(s, dst);
+    }
     s->base.is_jmp = DISAS_JUMP;
     return true;
 }
-- 
2.43.0


