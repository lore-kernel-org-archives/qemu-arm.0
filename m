Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CDE4E7FDF2
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Feb 2026 22:27:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vn2LR-00080G-Oa; Mon, 02 Feb 2026 17:24:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vn2LO-0007yP-SA
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 17:24:32 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vn2LN-0005eh-Ei
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 17:24:30 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4806ce0f97bso42482975e9.0
 for <qemu-arm@nongnu.org>; Mon, 02 Feb 2026 14:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770071068; x=1770675868; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uEwHj7cGBF710j93AX4dVUieGQt51AslYFDhNUlx8/I=;
 b=Ir+jlfXc+l5LHY8BOVhZmhYqlSPCtj71Z36DGRnDu8h0+M2Vr8RxdeogV/Z8OQs38r
 rRXwrupBzGI9nI2hdCJEzWALdFbPZajmJiG6hL0pRIbo5d+lE5iqmRORLThMPmLT1Dds
 vzAlO+PAGOii+bYhoTk6hldDl8JPPgVKlIb68eFX16KuPzyVXYTzoxJXqBdJc1ygmf1b
 1g4VpF1ykGtB1ldWaPdqG6S6B5L0xYeqEBgnRcWmYP4oDwCno5O6I6LZk9dUwtb6oYip
 HKSl3BAju6ujqtoggATYZ+qdO6X3ehjzLOnioWP/ILsYnT3zq2UP7bM/Lat4ujBG/vHE
 yB0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770071068; x=1770675868;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uEwHj7cGBF710j93AX4dVUieGQt51AslYFDhNUlx8/I=;
 b=f0vcJaM4uPf1sGBFmqrRpNnj1cys1VHnGVV7bFr4Su0tAueivCTlBIoEvE8LS/9YJ5
 M3g7R+lScpizCOewtyqslJjg5ADxBi2jiG9dpM2krvqGH0OWtbK5JMOzKCrICrPsji/U
 o9gkmocULarDhsdOJmofv+DFborKJKcG7LZhuiHnJNhi7jcX4HNnA+80pxDXYO7eyCip
 yRxW+zb69yxlr2rIcqEAJAGo6HaRfcrEu13QVHMwanzLfbxWvml3ldWaKxq4+TvBthC/
 s2BOpCaLHR8y6atbV3jEF3XKC4ekTsqrVPg9+hLTLQSbdDoNz2wwsKMYIKQnRaihz6Pf
 XlqQ==
X-Gm-Message-State: AOJu0YwdvjjlLmZE4jpizT2HXPgoLy+/fuwcR/1UcViPuxAJtoJkNtfK
 QX8BC2j31px0VmnjmjSRAsPhLuG2D7blpIY9ynJsHXou+qiJgXMrFKukMgn3QZYMo4g=
X-Gm-Gg: AZuq6aITL5Mk5NkPUzz8pv+8bwWMR0VrAjGar0TmrYMVOLLg2S2OZpLJBtDLDjqbS5w
 +fGEsmzno3xnpemGFH09r4oG5hE8mdmgshlJYLIx1JFKswxojRS221mwcAIq7jFDW3o6plRVscE
 Uc6IHOB2GpeJQCTpMUYG3YwnshQAn85vNdr+IJ+JNCAAryD1DcQSUrAym/hhqUaSbPfW22sYzmN
 nyI8PA8uyYNdjzDrlDMFQZv2Tf5CWBFTENtVa1ieT8+BgVrh71Ng1Thc/x3g7CuxkCyDfEDRRGY
 C+3QJMLzyRJ6au0aV6bqsx9xuGo/U6YjGZd05aU1X1/An2X05Oqn+qPsZIGDQUY9uBFvB3M/hq9
 1HQM1ks4aVD0WnZxjb4bXiYpCpaHRfro0Td0cLvo33YoqqZ6+4i28ZZbLg22O1N6v1L1s6z0Vt6
 C2cVZcNfutgOtaxm4pih+yjzrOG+H/EMk5G5VzKDukG6w+++YV/E6S1KfhiP5S
X-Received: by 2002:a05:600c:8b65:b0:47e:e61d:b8d2 with SMTP id
 5b1f17b1804b1-482db486ee9mr189007215e9.27.1770071067947; 
 Mon, 02 Feb 2026 14:24:27 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483051539ddsm17525815e9.9.2026.02.02.14.24.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 02 Feb 2026 14:24:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 2/7] target/arm: Have cpu_isar_feature() use a const ARMCPU
 object
Date: Mon,  2 Feb 2026 23:24:07 +0100
Message-ID: <20260202222412.24923-3-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202222412.24923-1-philmd@linaro.org>
References: <20260202222412.24923-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

The @cpu_ variable is only accessed read-only, make it const.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu-features.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index a7ca410dcb4..f7b14373407 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1643,6 +1643,6 @@ static inline uint64_t make_ccsidr(CCSIDRFormat format, unsigned assoc,
  * Forward to the above feature tests given an ARMCPU pointer.
  */
 #define cpu_isar_feature(name, cpu) \
-    ({ ARMCPU *cpu_ = (cpu); isar_feature_##name(&cpu_->isar); })
+    ({ const ARMCPU *cpu_ = (cpu); isar_feature_##name(&cpu_->isar); })
 
 #endif
-- 
2.52.0


