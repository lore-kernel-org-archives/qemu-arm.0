Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD67CD98C5
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Jun 2026 20:44:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXPls-0005oX-9P; Wed, 10 Jun 2026 16:43:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wXPlp-0005lh-VV
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 16:43:29 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wXPlo-0003nI-Ao
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 16:43:29 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-490abf12f0fso1544435e9.0
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 13:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781124207; x=1781729007; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9tx6DudLGT4l0C9mtb2AcxwOIfor49xO4HpzRGBE3rY=;
 b=SqE1HBqmn8Dm74ms9En+AbCGfG+2My/ZHbXcsqCYOpM+k9KXzKImv+NvyhqiFCQbIj
 n2jeTjJobQrlbpstfmDf73rc8WITkARUBss8sJsWImVNbyXd9toktktZN0+LOYLKkwNF
 v2HIZEE1YxUzcsxrqdANrSLfbB95dZBzaaFJyBC+vdHj+ehw1WGHWRre4cY+pxfByHaY
 VCeREnzE1qrJeKEx9ChNISvzCQaOgD0cxKzR0XnsTT2rmdnPRFZl6fIEyYYbXSdAYtqa
 XTMBLmup4CLZizEr6sn5apgSVbA+n3D6JWtx5YWAzRI8hIu5QKkJm1u6bZdnRo2Ukd1Q
 D7lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781124207; x=1781729007;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9tx6DudLGT4l0C9mtb2AcxwOIfor49xO4HpzRGBE3rY=;
 b=X8Gt7TEVrbQ6CqWOrGuTByJHJIyB9ceZqSX5NFk1Dm6DwJwgwkVxseKYNsf6U39XuV
 6eO1gmsOjHIgMGhxH8GVV+aGGNr1iTQKOjDAJjiNG0kSBIHiOu5YlQisKuDL2pF0V/1k
 JmXYbS658Ly3PHaMSgTxwrPWWTRnZM6EGM2BM6uEDf9pKdKBryee80sjNssVKT3TvkDo
 AA20lBzJXJwBYbetHWKfV22NFJS+tKjTHMkjJCi7+7GgKegCXusM5qknYkWjNElVF31j
 garcXziILTYuQJOokB3F33S2sU4aCT7GTLzmw2KNEfw+NOL/gdtHspSYkFUj9uxFJ0H2
 g0Sw==
X-Gm-Message-State: AOJu0YxsQivVVwZq0AfsrKvQ+7RhV7oA9FJcfNXvKf0W0ujNeOs/rDSJ
 ynqM8deYTTJvykHXPHaf05wxGMFlSds5lq6kmVBNZgNGOjLsNqyQSV28yTt8TDCaUoo=
X-Gm-Gg: Acq92OG+6J1NQRJmjp8bpz2+q8XwPrUB5AZf3se+XD+dHDQ+QfH60+eFN6iwvV5F14B
 XlOHfE6EsFjqWFjLLGwSumFgSxA9vxN4mXN0svPiw/9WWG8Gl9EI5hod0lBNOTJcC9L5Mw3M30Q
 bNSZD7MkLx6pzaqyV9u13JP5O6oI/TZxYkjEgFxgBiuafeL583mofjZKLruKtIwSHSP2l8sXACk
 VLMzvrWwBiFOYEcZz7DgKFsd8iauoeNsBeEQzpVPgM75+/l6xZgd/IIMDLfaVT39AFnrv8eHNtU
 9MxPWS+qoE3QdwRdzxMljx7nFBry6tPOc86qXhT7pvQ6LkvIOqFo1I6JydE2REa4ssUu0+vUfTD
 0vQbAnxWXGhEDATEWHLh5dqJCTBn8lN/u21hMXfyiXitBocyRsCFfkqKNe9ElJGMLigiggMxQsX
 ZkxVRqA6e7XuwvQA1+oMLWxnZYO8xOy9qSKg==
X-Received: by 2002:a05:600c:1c27:b0:48f:e230:29f5 with SMTP id
 5b1f17b1804b1-490e34cb3ebmr2166545e9.16.1781124206768; 
 Wed, 10 Jun 2026 13:43:26 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490e2cb2f4fsm11056255e9.15.2026.06.10.13.43.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2026 13:43:24 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 4AC7A5FADF;
 Wed, 10 Jun 2026 21:43:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 3/6] target/arm: trigger timer recalc on SCR:ECVEN change
Date: Wed, 10 Jun 2026 21:43:19 +0100
Message-ID: <20260610204322.828645-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260610204322.828645-1-alex.bennee@linaro.org>
References: <20260610204322.828645-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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

Toggling the ECVEN state affects the offset calculated in
gt_phys_raw_cnt_offset so we should trigger a re-calculation on its
change.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/helper.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 5c640853060..22f5117ee54 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -37,6 +37,9 @@
 #include "qemu/plugin.h"
 
 static void switch_mode(CPUARMState *env, int mode);
+#ifndef CONFIG_USER_ONLY
+static void gt_recalc_timer(ARMCPU *cpu, int timeridx);
+#endif
 
 int compare_u64(const void *a, const void *b)
 {
@@ -821,6 +824,12 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
     changed = env->cp15.scr_el3 ^ value;
     env->cp15.scr_el3 = value;
 
+#ifndef CONFIG_USER_ONLY
+    if (changed & SCR_ECVEN) {
+        gt_recalc_timer(cpu, GTIMER_PHYS);
+    }
+#endif
+
     /*
      * If SCR_EL3.{NS,NSE} changes, i.e. change of security state,
      * we must invalidate all TLBs below EL3.
-- 
2.47.3


