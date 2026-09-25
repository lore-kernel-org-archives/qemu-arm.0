Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F66C9830E
	for <qemu-arm@archiver.kernel.org>; Fri, 25 Sep 2026 16:26:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xA8l1-0002W1-Nw; Fri, 25 Sep 2026 12:26:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xA8kx-0002TE-UY
 for qemu-arm@nongnu.org; Fri, 25 Sep 2026 12:26:40 -0400
Received: from mail-pz2-x2a.google.com ([2607:f8b0:4864:3b::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xA8kw-0001DY-CM
 for qemu-arm@nongnu.org; Fri, 25 Sep 2026 12:26:39 -0400
Received: by mail-pz2-x2a.google.com with SMTP id
 41be03b00d2f7-cc79a5bdf9fso758a12.1
 for <qemu-arm@nongnu.org>; Fri, 25 Sep 2026 09:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790353597; x=1790958397; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=r4XNC98Xo1b/yOhFGm0q8l++OLD16zW3At5CR/WR9jQ=;
 b=ZW7OxGa9HKQObF9nF1t/QICDJ112vD0KwOVcQeboj3Wq4Qe7M/d56xlSW9jHEvMhQ/
 5MaNP2CQT8kdVEUJTUeHRADkI8/b4uWWvPNdeB55hWjp7P9AHs80WE/NeQWY2UzPLgxb
 ezaJqKkG9EzVbHxJ+a7s2HrzVmz0ldaM9R1LRUmMbVcgl1TuNVdH3Ay2yN3QEmwhWu1M
 3CB9vWBRYaXozXa8uGgWRG4nYhe7dOzeDxQKEN/TlVZSBeAcrcw0JhuNOgLqXZ1fWXrb
 rrO+YfJHolVUnPvtZ0WZBTy2UEP2kV2N6TXAtPTpo08SCG9o/hcuWfFPC7izmTXHD7hX
 dPNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790353597; x=1790958397;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=r4XNC98Xo1b/yOhFGm0q8l++OLD16zW3At5CR/WR9jQ=;
 b=vl2X7axRvzoqfUhVChD1i+5/Us1CIb85OfeH7pIT31+MGzRnLsi9dKeznPMtMjMzj7
 +PGB3l6XsFpL42p5+WTsOqoU3ElrVF5tFXRM0HpLCSH5BDJ5u3tC0tnZ/Awo/HK+FOiw
 JdoRXE1bJ+cPKqoP+w6Wn4yO63PEiTpM8704IfcoweZi3/9tf4rNWmV5c+919WvX5TkN
 HFCS1u+B15N5lLoIu1lq1cntnl5UhbcJ3Xur+PFK5NdvvoJGKL1oku5UhQGcd1asGJ/R
 uYlWBnj1q22hsKrYeLb6vr+bulF6x6NEBcf7mi9qVH5ZNiHpNbfetQGheA+YxIYo1/lv
 /JtA==
X-Gm-Message-State: AFuF++kvbG05Ntij6zf4xqSVh89+lpykpBt7mTbQfF2jZZdbLdGE7PDq
 lQPO8ObKmUAu5xPkRWHjDl14bryxE7XdIQyUQAu6oROKCR/qAzSL397uFLzur8sENKddoeeeCj4
 Snl6Q
X-Gm-Gg: AYBFou3hTjTWGCiOuaXRYRA0+C9+LQzQik5myJByKnv3MOm0xMAoOqC/JnJIv/89eyt
 nvj+DvD2rZcAU5a7zwI7S3jGTF+sZ/UekQ+7nam+XwZtbAbmmSBVIaBmaqE3d+9e34/YoLsIc+i
 rQHCzUgcRAFsKm5iguHvJ5h9gDaSGmPjHiqE54A9OU/lR8MiUUW6ZmRQWcI4T7E37jyJO6Bi/tn
 PgZjwbE8VVxl7HEaJFtsVhsmOXgsMT6TieTgANRI04PgcoObMTf+v59Pg27YLv4QNrGJGmrfibx
 uOS1aEb2O5buN411TwtgNony8MAGxcPAjmeuhTX4hz7PgdQYHxE47+KQFiMzpXP1LBanMlyihmC
 u7AWrUsNKDEfYLwQ7op9vKFEwX5XPEhN0zQHzlS02uD8ME4o7e1j1Fc0mEexTEEtcUmjXodYbr3
 wVrY3NbRs/pvELXO2jusJiQg42W8aXbNvQxGh3nkwX9tTgMk2Y2hRucdnyBV4pw2T4X0AnzwoyM
 V7pKXqCNJABw8XI8rpDzesDSNHGlQ==
X-Received: by 2002:a17:90b:2809:b0:39e:4c7e:bc3 with SMTP id
 98e67ed59e1d1-3a0986a46b9mr4042084a91.17.1790353596802; 
 Fri, 25 Sep 2026 09:26:36 -0700 (PDT)
Received: from stoup (174-21-68-150.tukw.qwest.net. [174.21.68.150])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3a0976cacbesm11464809a91.13.2026.09.25.09.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 09:26:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 4/5] target/arm: Implement SCR_EL3.TID5
Date: Fri, 25 Sep 2026 09:26:31 -0700
Message-ID: <20260925162632.404001-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925162632.404001-1-richard.henderson@linaro.org>
References: <20260925162632.404001-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:3b::2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pz2-x2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 6416c402ac0..a149f492f8c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5548,8 +5548,21 @@ static const ARMCPRegInfo dcpodp_reg[] = {
 static CPAccessResult access_tid5(CPUARMState *env, const ARMCPRegInfo *ri,
                                   bool isread)
 {
-    if ((arm_current_el(env) < 2) && (arm_hcr_el2_eff(env) & HCR_TID5)) {
-        return CP_ACCESS_TRAP_EL2;
+    switch (arm_current_el(env)) {
+    case 1:
+        if (arm_hcr_el2_eff(env) & HCR_TID5) {
+            return CP_ACCESS_TRAP_EL2;
+        }
+        /* fall through */
+    case 2:
+        if (env->cp15.scr_el3 & SCR_TID5) {
+            return CP_ACCESS_TRAP_EL3;
+        }
+        break;
+    case 3:
+        break;
+    default:
+        g_assert_not_reached();
     }
 
     return CP_ACCESS_OK;
-- 
2.53.0


