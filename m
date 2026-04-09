Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF02E98FA9
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Apr 2026 03:51:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAgPp-0000lS-64; Wed, 08 Apr 2026 23:50:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wAgPo-0000kn-1a
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 23:50:48 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wAgPm-0003u2-Ir
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 23:50:47 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2b25cf1b5f0so3458865ad.3
 for <qemu-arm@nongnu.org>; Wed, 08 Apr 2026 20:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775706645; x=1776311445; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yXUUcgWi2+vh0MyaTf6jDQP+dep+qMh1XfSIKvMmAto=;
 b=YtD+hoRajgxVE9uddSH4miJs7Pyw2+5vvHNsuPeHPHlPT3XRmYLzB6OqygEh0CvfJn
 CyN0vx0TsZJrhzXWhgI+cZa4OQmWkbVUjlfi2VhW/1+zKbfK2VSF2+xy+BbPy5OOhXwi
 Ez1rf8ceu95UjDT6yRNOJ4WZO+FBEekIpiO/ZEckw4aZGGl5RgA0sw+McPijPiU3lYb6
 U9JfAJhXh/85RI3Ea58rp7H1+JZSCDcSctdaF/h0/u99eHg1YmGmJBjasR4KSokKtQBc
 MtqssGGpBTJp6j4sKtJkoyMIKWNFtC9WKID3Q9gkDg2m20SYL74yRAv+Ry1PaPO8hquC
 PtLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775706645; x=1776311445;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yXUUcgWi2+vh0MyaTf6jDQP+dep+qMh1XfSIKvMmAto=;
 b=jncDtG3vNKBhJiCPkBfbIRCED+EvEbaiLoZL7KBAI1KbEsvvStV59SOMhWGqi6LFhF
 buUmgLnTLdkZfVJRNZNOvBOgTyS9GEj2GM2agEER1P3MWdLlQcU6M47Z21favSYXwDHf
 KCDHGLI9Jjdhhlyc8Cd39TT3Kfr4heOPGIDvir9wIyT3TUoA9RrD3Ux+2xW24meFF3TC
 fbetFUTGF7gNiGEH8S4X8AMlyCxTJqpEOD9W6OWnAMUCnfFMNzVfYPSOnaj5A1bbCcuO
 83b5YMtmCSnpm3KC6ax7PnK4fYEke+B2nVzJaoHL8WEi5F/4GhNb7Ct+0LbX9xAAYPED
 6/+A==
X-Gm-Message-State: AOJu0YzfMBKAbq1TxnV2XSO01a3xykeaLS/kV9Lto76ctsAAsIs3A9S0
 IrFwJ11IRWHv+RSPzR6NCStkE99wm5zWfuwe/8RbCtp3ZdSB+rMq2X7hd+FNw/jWaiyqtNYKCIC
 OJ+GPI6o=
X-Gm-Gg: AeBDievucswEn+zHHQc5/Lk1dgT5UfaBGq1vwNAqGGlbST2cFQ+e38lbIa/aEixPZSV
 gA4/hoJd8N11HsBnuTHr/jPlucQct7AoRXm1rlTdiO6Q9qjOMKLiplUeOl2QAl2B76xMjdy2a/e
 cPePZMTb18w+Amg2TgldorkfO4dU6AYi4cHWE3ts9waw+SRkvFvciOVl557ahKSLJEMVOMmZ5NN
 Qii9mDKwcDCzcKH2vuBWYwlOAa/LQe4jvfDffEqKIBwm2mvzrBbrJoOpsHmb/lQyFAIBcrLGGwt
 CLOSLlFx83rJsikKqvMrd0rVHUoAikyWoIWA1T/qtPBtHYe+n/gAWiPZxGsRdkC48gui/Z9syX3
 i/yEe14JrdeksV5mQxMeZylhoGG37s6E0njUz86e70+A27xcXw5un/UwPVU8UJuBKhtoW0Nn2h1
 L0UUudL8YT0cFB+d4ulYQCvMoFcte7cwpWKoVe+B49k5ZxtOwjBOMb5J6I
X-Received: by 2002:a17:902:db09:b0:2ad:da28:98d with SMTP id
 d9443c01a7336-2b2817be680mr260851115ad.37.1775706645176; 
 Wed, 08 Apr 2026 20:50:45 -0700 (PDT)
Received: from stoup.. (124-150-69-109.tpgi.com.au. [124.150.69.109])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b2745c480dsm277830605ad.0.2026.04.08.20.50.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2026 20:50:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, pierrick.bouvier@linaro.org, philmd@linaro.org,
 peter.maydell@linaro.org
Subject: [PATCH v2 7/7] target/arm: Remove bswap_code
Date: Thu,  9 Apr 2026 13:50:15 +1000
Message-ID: <20260409035015.132370-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409035015.132370-1-richard.henderson@linaro.org>
References: <20260409035015.132370-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

This function is no longer used.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 8f1afca2ae..e735357395 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2571,22 +2571,6 @@ static inline int sme_vq(CPUARMState *env)
     return EX_TBFLAG_A64(env->hflags, SVL) + 1;
 }
 
-static inline bool bswap_code(bool sctlr_b)
-{
-#ifdef CONFIG_USER_ONLY
-    /* BE8 (SCTLR.B = 0, TARGET_BIG_ENDIAN = 1) is mixed endian.
-     * The invalid combination SCTLR.B=1/CPSR.E=1/TARGET_BIG_ENDIAN=0
-     * would also end up as a mixed-endian mode with BE code, LE data.
-     */
-    return TARGET_BIG_ENDIAN ^ sctlr_b;
-#else
-    /* All code access in ARM is little endian, and there are no loaders
-     * doing swaps that need to be reversed
-     */
-    return 0;
-#endif
-}
-
 enum {
     QEMU_PSCI_CONDUIT_DISABLED = 0,
     QEMU_PSCI_CONDUIT_SMC = 1,
-- 
2.43.0


