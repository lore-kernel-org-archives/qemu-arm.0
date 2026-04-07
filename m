Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B39DCFF5138
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Apr 2026 20:00:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wACaY-0004N1-GL; Tue, 07 Apr 2026 15:59:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wACaW-0004Hu-Qg
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 15:59:52 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wACaV-0007Qx-3o
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 15:59:52 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-354a18c48b5so4767323a91.1
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2026 12:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775591990; x=1776196790; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HCYVORL8twjNtHEKHl2JRzrVw/Xl9zax7Xk6iBP1jLc=;
 b=WbdjvIEIMH0zyVzn9sG5p9k/Y+/ub/zX/J2E5AkIobG/z+Df/LKVXkvqtONTNL2I9O
 sgtIyKMHrAyEOKo4ImE25p8M9zqWHkDLTmPBbsDFJ6/8jLz4xR8coexv7ghGJvglrd9C
 V/3rvDFEd4ymqLVze39vZKTBtX2qzeqbWk3Wrh6R3hMDX7866dg0Qe/JMiUIGVKZUR1O
 gXS89U7TNhpdkHXk6lNBaWoLC2O3SNTeG5kU+eDuedAHbufAoAEa/90paYojzaVAgKdh
 9gADWUg5dviXySied4JcTA66qkyzyKJVTHpTROhSjYYrRIXpp4zTHfJTvNMNLi9/5qjB
 Elvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775591990; x=1776196790;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HCYVORL8twjNtHEKHl2JRzrVw/Xl9zax7Xk6iBP1jLc=;
 b=gcMTRpcKHbz4K13dk4XG9Dg5zXT8gQYHltpPZdYvmL4COgbBMDSdy7BD5Sn7UoNSKD
 0WgYdXP/tpUwQeB4LUAfIwKql7EZ7gRxvpkwRP7dfwLICtgdwNhV2tVuteUr/aWcPXSz
 m/WyPIWr/oxkFZ2av7ngVdUWOdeab41uzEyAN5lrEOy3VMydGYVStY8s4cZe+4heY4PD
 u6gxPFOkEx7CbdhzbxvD0BCL5sql91M8uiw1njFGVdHJ/J+qOtxsK/jyQtYtIQeTaZtX
 nsm+64y6Jc0L77t8uunAH2D/hXNY6fRF6fHQwErYr1rZkpB2b+fRzLHhbFWAnabeklDK
 BRIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlTXwFiFgCSBEWTlLrSxoE1zMIXkzvS47gKHM92n+skHkQsfPCSyzejo4MqGrqPvKHCMpDkqMoMA==@nongnu.org
X-Gm-Message-State: AOJu0YwQLyZiUQpIfUknqLstu3Kz0tCk7d5vAWwZMAErqy3Qrcvhm78i
 +mzNQha5oCEZR+eePf9mDqyzt4r1aFHJ+Jfij6SeCXj6j5fUWoO9Yf1pkJrdpdysCtQ=
X-Gm-Gg: AeBDiesdSoS0UB46g0YlP4bN5mHGlXmUEv/puOoEobPIeEbXhCKnecr+XbWMYHBWGf6
 S1w87jIiw5MWc+8zzvD3v3UhEPYoRpX/ojhYqaemuHQroAFP/CmtmiXwCBRJK9MdfXfYpuAyBK2
 Nr/7PCelBMQmuJ9jNCAH81xhWe2hQqiSWZtPU3T7gTkx9jpgQYa9CRHA4iG2YCya+ZoPjGIqe6/
 U4QOcWsJlCFOl4OjjODx9BgbVaunqlbRBXJEd1iQ3NqmaZJl9+7vWXBlWpRTeBHRTXX5M6x/lTw
 yA9cx7GCEFbXUEjXG0FF2rxYBHyn3v67vM6BtCGJjB+wyDD1N0LEqj351Oh61WWv2wOPAXRAy5Q
 G63tIGTa3e2e58A5B9z6oD+mLnFN47JEJwFPVDQW43mo2ABIa5NVTUjGCr196nTPFflC87m38gc
 TVlO8cI2yywxCMNieLP9+iWooQwJwKil2g0/lJOmm8MZxbLU+uHEbIawon6uhWVReW0+5x8Y2zg
 RUg
X-Received: by 2002:a17:90b:3dcb:b0:35b:e671:a527 with SMTP id
 98e67ed59e1d1-35de679fc26mr17950444a91.3.1775591989559; 
 Tue, 07 Apr 2026 12:59:49 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35e27c9855csm126911a91.3.2026.04.07.12.59.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2026 12:59:48 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, jim.macarthur@linaro.org,
 Richard Henderson <richard.henderson@linaro.org>, philmd@linaro.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v10 20/21] target/arm/tcg/translate.c: remove target_ulong
Date: Tue,  7 Apr 2026 12:59:21 -0700
Message-ID: <20260407195922.196410-21-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407195922.196410-1-pierrick.bouvier@linaro.org>
References: <20260407195922.196410-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1035.google.com
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


