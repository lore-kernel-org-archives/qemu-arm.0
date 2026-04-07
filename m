Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0412810F9969
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Apr 2026 19:34:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAYby-0004ND-Kj; Wed, 08 Apr 2026 15:30:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wAY9R-0000Ti-9Z
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 15:01:22 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wAEoh-0000tg-Gm
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 18:22:41 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2b23f90f53aso49664575ad.0
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2026 15:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775600557; x=1776205357; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HCYVORL8twjNtHEKHl2JRzrVw/Xl9zax7Xk6iBP1jLc=;
 b=nTymbnewuclRkPmLNxJfszFSW4B8YKdTNrCqxzcWPIu6MAFDivf+W44sucilleZ59s
 xBiUQTvgem5yWYOlJuhtNtlBo81P/ZobBNQ234RYxDmtuhGjoirx2jF7rPtk5RzDeLxh
 vDugk2MnbBygPpC+d8KeXjjeQifSkexZYVKGfgRi6a455b16vdyd1/uiEFxCbJES34ow
 dRdVx4C0EelRGHHesS1/QoYR558DSm0dGdWYHRBtu+6ro8EDtS0P91UI7iOdvuc9c6nR
 I/KGO4hG6PUB6Q+SLX7wBvX01/Uazw9jL6cdSy+2DwaiPDq1Htk2H9O+77eXEz8/nIUn
 nWdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775600557; x=1776205357;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HCYVORL8twjNtHEKHl2JRzrVw/Xl9zax7Xk6iBP1jLc=;
 b=SZEpiInVi5GsXE0ohhf+TZBDuCsPSm2a8T0pOhBuxtvWscmDqsaZrHSYeSMDiJ08Ho
 jbW2R9oA4PtvJDvdDNH4D2+MDjZsiMsDTxYdZiKmIYb/KSf6e+GTrBBpzAnPtJNJTVSz
 lqPjl/di4tkJ8lZplWirl3hTxzajmuNyVWUAcHAZ4JjAFUu3w5/FtrUm7ZE9mGTLALwj
 3Lkj31uFJ8/YJSfvrpIfLarnda4qrhxUZkNX+hTNXZqomhQ/7NNsSoorQfSn7WzDl4Zd
 H3Cd9dDiF4ng2kGlfK4KDOw4JtIXy/fywPasPgzYRxKnvtH+cnUusWJ/+/FG6GFbE1Ig
 7u/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsf3hIzqfvUPHJs5ZjHtP/kLP0/FFaJZVgDjWTqdAZibNz+Id6DA1ecSOag5kCGtQhABN9fYUFqw==@nongnu.org
X-Gm-Message-State: AOJu0Ywa+O1pIJCYiZh/y6WSViZqgNjGA3++w+lMa819qqjlCzHCfCxw
 MnyABIzHh/hQkluopu6JgPbbcPNPlPBNWJKU7QflE7K0e/fXUNr3MSpgKVkRQNdG50xr/54WbMz
 5m6Kf4vw=
X-Gm-Gg: AeBDietT0kbBhNR3k585TNgWH4mMzHNExsK1EThUw1oKRqkdWM056VT6JVtqgIqpaDB
 mzgfuyw3/UMKXn/POZq79g1BxdWy4N500ZDp525PdYxWDQkYXfzl2K64r8GMV8VYsiUjZqLVviU
 sTavOIpe3awrjTfJoN/7JxgNZ35fQki0aNYSK0tuhr9QwYvKOZlehbUeMY81jMUD2Lo3cLeagK+
 5SZ/SMOIAkko5Z7AUuwlNnH7CgLX8HTzzEA0ExiSNN2zdmRFm9r7niiTREzW7qFH0W1Q9qElpef
 1iruWlQkVNxEt+p00Py6wDILom0CSGSNWSkscjTtSwcwMul5KhP2R/1iiaQFadu5OQXCBHRDPri
 5SVMaX/b241eeg/KiwSsoSyHLeVJ4XpgD+llAN2A0p6+naniMFmPgt6VX4+Giy6hIUWDsyiDWg5
 UkJAwSqKI6+0YH/aFoePh8Krgf12ofg0Lyyys0D2PukyvBIzDfDX7cMlvtpANpqceDIuq1zcJoC
 Za7
X-Received: by 2002:a17:903:906:b0:2b2:4c92:c389 with SMTP id
 d9443c01a7336-2b2817cd623mr221327575ad.34.1775600557518; 
 Tue, 07 Apr 2026 15:22:37 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b274979d5csm180412065ad.38.2026.04.07.15.22.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2026 15:22:37 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, jim.macarthur@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v11 20/21] target/arm/tcg/translate.c: remove target_ulong
Date: Tue,  7 Apr 2026 15:22:07 -0700
Message-ID: <20260407222208.271838-21-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407222208.271838-1-pierrick.bouvier@linaro.org>
References: <20260407222208.271838-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x630.google.com
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

We can replace it with uint32_t, because we know it's limited to 32-bit
target.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index c432de2a268..ce427c5a3ca 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -6282,7 +6282,7 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
 
 /* Ditto, for a halfword (Thumb) instruction */
 static uint16_t arm_lduw_code(CPUARMState *env, DisasContextBase* s,
-                              target_ulong addr, bool sctlr_b)
+                              uint32_t addr, bool sctlr_b)
 {
     MemOp end = MO_LE;
     if (sctlr_b) {
@@ -6529,7 +6529,7 @@ static void arm_post_translate_insn(DisasContext *dc)
 
 /* Load an instruction and return it in the standard little-endian order */
 static uint32_t arm_ldl_code(CPUARMState *env, DisasContextBase *s,
-                             target_ulong addr, bool sctlr_b)
+                             uint32_t addr, bool sctlr_b)
 {
     return translator_ldl_end(env, s, addr, sctlr_b ? MO_BE : MO_LE);
 }
-- 
2.47.3


