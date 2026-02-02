Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B102E7FDE0
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Feb 2026 22:26:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vn2LX-000830-Fw; Mon, 02 Feb 2026 17:24:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vn2LV-00082C-KO
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 17:24:37 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vn2LU-0005fv-3X
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 17:24:37 -0500
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-42fb0fc5aa9so3392583f8f.1
 for <qemu-arm@nongnu.org>; Mon, 02 Feb 2026 14:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770071075; x=1770675875; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pHArYt5JL2wmE5bb1Fmatz7wESrf6iQwO1bJMqHZ4A0=;
 b=BHA8N3vmcKc1iIElNBR9br0jM7204vmgLHPSq+DsJ0OdvZe0x08H+ln9J+Ej948s9Z
 ZmSAKhZE0mzPejhFG+a9lpj3+hdjdA3aYf0VA4QWEcTfOL0FEPrLue+5/mboaKsd1WmF
 8Z27yRNSjIIqh9HqzARO6DgDeZWTRWM8/PVcRQpvsPg7RLDDDbkYj77kpR2XDM+WgAZA
 uDpqPJgsp2N3LGqPSlJUT3+8n+SQx+ta3cxO0Sw9VFuD2QmU5W7wIjT0gMkot+R24gTE
 cfhgbw5LO8Klkn66APofHE4RFXUBFGg6bL25i5hbHEpZH7hhiS5EkZao0EiBiJ+lTbcm
 0y8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770071075; x=1770675875;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pHArYt5JL2wmE5bb1Fmatz7wESrf6iQwO1bJMqHZ4A0=;
 b=Dd3Hy0QpOnMly3nUGoalglRqAjm9x0Wv9A61hgzSVviXSAL3/iA5X363seIXhDRucJ
 VRI8lJ1Cwj71MvD4LJD0tHXNlFGK4TQ0QSxL3ySBm9nWRU/OePDxgU1/D1X98+FL1FqW
 +jcaaBmIm8i80dQqGdFeo4QBoG7mKaGBh9hRU+4Zh/CuRQFG+DDjr9D/QuuPYNSc4+KM
 EdYTRnt+ucMNcFZlmYpSMnoLrs4l8rQmfQxWCPqpz+XU+GCrdTgracB34qe5O/Huq/jM
 fN3TirJExHXr/U6DnGjLXtgoC9JXLKVeFbO3BLsfnytvW5SyVFORZjnydMVY+3/nHc8A
 mTsw==
X-Gm-Message-State: AOJu0YyNx0CeXS8cCQUmY/dY+XtqSCEpW+Ch8O39bHjE7NSYnZYeTg3+
 h33ThNpHr8mIwQ4orJNMHAQb3r8QAqQRKXn4B7dbrScBywNVVeHOca478Tf2FE0J6GgWVlsDBfz
 lPmLN/H4=
X-Gm-Gg: AZuq6aLdbT8VQfwrzyn5cjS0Asb+j7u0hAqMpCkWZzLKB+pd3C1PA6SNKxiTTd1BjUV
 kOajONGLr+9EK4q1XfvLbZP/KdojiFYoK0oQhTU55FZE0Nl58aMZFZFYeoW2yLaDeWIGfPv31Hg
 F3O8xiZd/lDK9yIDDI3wAtUFxcteiLID4Vm2QbjJRIwrel0Ft1ICr0Hd5Q2Ap1UhBPgVXxfBRrK
 WB0Dgs2c7UdjsaqTYgJecR5NZrkmGVENAthdJkbpJCTV1RZGvmSSBfG7YI0yCr9GpKreF/zjFEx
 MfMGWZLZSw9wPCv4sNVMeZ/hk1a4FB3r301MqG6NRLdKtSTc/P88jJTclGNnEb25Qn39nCWcMWa
 iJNobgiAV+x5IZU1LT2at+Y7p6lWPb9/pYkj6arVe2VDaZBTd5i33AHJrwRtwGfumuuEZfArffF
 sc+LS/tNOXdImZbQcEuf5QO4i5neA4JzryBNzfp4nFvQAzCiExKzA8oGejh5d0
X-Received: by 2002:a05:6000:25c1:b0:435:99d5:9d90 with SMTP id
 ffacd0b85a97d-435f3a69053mr19331830f8f.3.1770071074809; 
 Mon, 02 Feb 2026 14:24:34 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e10ee04csm47144832f8f.12.2026.02.02.14.24.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 02 Feb 2026 14:24:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 3/7] target/arm: Have is_64() take a const @env argument
Date: Mon,  2 Feb 2026 23:24:08 +0100
Message-ID: <20260202222412.24923-4-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202222412.24923-1-philmd@linaro.org>
References: <20260202222412.24923-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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

is_64() only access @env read-only, make it const.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index d4a146b4202..40237168419 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1345,7 +1345,7 @@ uint32_t sve_vqm1_for_el_sm(CPUARMState *env, int el, bool sm);
 /* Likewise, but using @sm = PSTATE.SM. */
 uint32_t sve_vqm1_for_el(CPUARMState *env, int el);
 
-static inline bool is_a64(CPUARMState *env)
+static inline bool is_a64(const CPUARMState *env)
 {
     return env->aarch64;
 }
-- 
2.52.0


