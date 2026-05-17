Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58487CD4F3D
	for <qemu-arm@archiver.kernel.org>; Sun, 17 May 2026 00:36:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOPPc-0007rg-6F; Sat, 16 May 2026 20:31:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPOk-0007Di-NM
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:30:31 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPOd-0004za-Ge
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:30:25 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-82faf871346so869686b3a.0
 for <qemu-arm@nongnu.org>; Sat, 16 May 2026 17:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778977817; x=1779582617; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RuUYRHuovVEbvZDKoFulOJ76CJMsJZBODEhgWcUkabI=;
 b=Jbp5fd4/yTAHMauxCdK7vq4AHFtOmNOMZ1nV3+fvRjnXguZv+7n2en73aZHCsmo06K
 ErvekyJV1ONiQShLhJgFfWtK3LVrhgMpGGpMZO5uFVFZOdnKyPRmEC1WsWobO1Qn24/L
 bn4/gVfxfiVQ9XE2mKGlJKJuAJiJHZXDStCRU112/UxN5VHsScI7W1S1XfmM8ROtyxwG
 oCdWUzqbqqM+tGnvkOYHII6gsl5Zmolf0/j2xZSuHHZ4uznS/L+2BM4sM0+Lc/NNgu0S
 SeBsWXyCNxJ1QBknZPSnVqjfkH9pWc5pwX+Z+ex4aUUVFOBBd0hlC5joG3BBp4FoJgz+
 N8kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778977817; x=1779582617;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RuUYRHuovVEbvZDKoFulOJ76CJMsJZBODEhgWcUkabI=;
 b=iDsTD5vTj+TCxSOYjdAMEDKro50rmDhPasB5mJeG8/9wCLMEKqpPoHgCL1Zy5/5Cy0
 KDQ/UdXbu09YXMLFtGJhxtiVpTd7YSRef9GjsFOMt9rVVRhyvfhM463eieT2MPaIKNbf
 x0l7uxv785Xe5n93T9WAVRU23ip8hylZX0lt/7RaZH9gFZ2wh1bw3sKS1NTkdUxJLrd9
 5E9quQy34Za5XYdjPyx80/QdqEcQM2yGF9ylRS4OjVqfITY5vELUvUOZoUw9l1sYRplO
 Ck5iJXkqlZUnnXbzttg72A58pCnMk/zdRgpz3xc6e5mQks6tgc3ACzO5NInAuRuCLkpa
 kHRg==
X-Gm-Message-State: AOJu0Yy+W+2ZddhV3paJfCVJ9H3KpyJdJwayL6oeCnWUnlOQzjLis74V
 tMkxkaPQjvlS911jvG6PJnfxXAy2OBH7wi037qtbrUJfLkxJqtYymtXOLmRixeTi6cLmtthzjcj
 P9J+N
X-Gm-Gg: Acq92OEfLvt+IjkJ5iT7Anpy0yJl1UIhmv01qHNf5LLza+kEU4ApTLvRZhN6NeViPYb
 nsflfXJeg+kucdnUZkyFwW4oJe9QgDjKB0yhaAkmxlAbYsfcVRxR2sJ7DLiNXH3aJEvlrqCDjB/
 emTGiEENx2E6abVTbCdDAWkvbsQjFVXW2s8rr+wFP7aBs8WwAU5jCuWXpE8a77QtwgnbT4ZwQ42
 ztpO0v4SE8LgalEmi9SuHkcy4VgiuJ1eZIxncxBkjvrBkn21Tu70yI9mndMxvliFWAv/lbB3DDO
 9edsc4G7k6nsSsEzISsIzIvxg9TN8FOh1njyGTfxHNdiaxmtZWZ1O8x2o+vJ9YHkXVbzshrZs9R
 V3ZVt6xI/1EeJ1kguNkKRSKQXyo5uOVb9NZgO1VHHFwm1Sb1D8oEMphTXEScGJCrmU+GRIa55Gl
 ywd6LaaJzySxG2R9maLsA7d5bHMUt1
X-Received: by 2002:a05:6a00:ab0d:b0:82a:6ef8:cb43 with SMTP id
 d2e1a72fcca58-83f33b34ca2mr9971268b3a.19.1778977816614; 
 Sat, 16 May 2026 17:30:16 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-83f19663cfdsm12272745b3a.9.2026.05.16.17.30.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 May 2026 17:30:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 14/63] target/arm: Trap direct acceses to FPMR
Date: Sat, 16 May 2026 17:29:13 -0700
Message-ID: <20260517003002.321430-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260517003002.321430-1-richard.henderson@linaro.org>
References: <20260517003002.321430-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index b013dd51cb..d2a4b0fadc 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2899,6 +2899,10 @@ static void handle_sys(DisasContext *s, bool isread,
     }
 
     if (!skip_fp_access_checks) {
+        if ((ri->type & ARM_CP_FPMR) && s->fpmr_el != 0) {
+            gen_exception_insn_el(s, 0, EXCP_UDEF, syndrome, s->fpmr_el);
+            return;
+        }
         if ((ri->type & ARM_CP_FPU) && !fp_access_check_only(s)) {
             return;
         } else if ((ri->type & ARM_CP_SVE) && !sve_access_check(s)) {
-- 
2.43.0


