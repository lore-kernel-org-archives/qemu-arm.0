Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E80B2FB44A4
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Apr 2026 04:36:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wG8Gy-0004iV-MM; Fri, 24 Apr 2026 00:36:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wG8Gt-0004QF-GN
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 00:36:08 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wG8Gr-0004je-Le
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 00:36:07 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-42fdab683a9so1375828fac.1
 for <qemu-arm@nongnu.org>; Thu, 23 Apr 2026 21:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777005364; x=1777610164; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9J0M1/wmYbZGkcej9gtpRX9Wg0EaMVJE7guK7SKevIs=;
 b=kED+mbiotN+MYwJOEUtiC6S6J93+XkUDESg+XYYJSti6gQxHEJbYaekC+iSZpRf8kb
 P/RTusA94kVLOP8+oLDmIrHp+nmcr5tglZEaT7zvSIHgNM2/chC18uN49SnpuKxofzcg
 Tvp/L/79hXAWrVOLpWXksQ986FdCBs7fBL9l1Nufc6iIy9KhOgxQrRlYgb648cSfYYJz
 4RRwBhmvfS6e0vhyBWCsktvvMh5XTpl4mvHF8oDNbAqwsXE7AJMv9slx1/G1eQ917bOp
 yDsgtWQmedl/p4gH+ujdUY1S1bLFXPtNYpvEmWbn5vykMREaRXg+ZkPDWS/N814s10NJ
 Ywrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777005364; x=1777610164;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9J0M1/wmYbZGkcej9gtpRX9Wg0EaMVJE7guK7SKevIs=;
 b=T1r0bcvzOgi0Mhxu/T8SgAQ1zALFM0h3a2lIj/ooUKmmqy++eZD6gk++qroo0xlYWh
 A8kYfwTVpM11gAkSJc0h0Du1wkdNq9ytgDTqLMFOtZHOPr+LJithlw7I2QWFp2OAWGhd
 PU2znaGLLWGa1n6sZtBvmbIbzeIcKawN/XeSwVaYKdZuQY/lbPpbX5BUSGdssOq+rqlh
 Nn2390qMrk52oD5inrr9z4+mM6Lg/tCOGONioV0O9T9wCUoO5/UZRmOY43aRufXZyPqs
 +waty7R4i7vR05EhN497iqhlTve9Uq6uG/yvJKN5Fldu01yXo0GFc5y1PoJhh5fwpg4z
 7Ddw==
X-Gm-Message-State: AOJu0YyEue1+FoCw91gDxAKfXvVZ5gjCBn8U00V3qzDInpI3Hd7vZwgL
 JY1ZaPmaNwm4fyYViRl9Vq/MEhiX43HnRMFLHCyKVPRtGTb1MFFjKEQBMMNG3uwrP5h31e+2m31
 1MShecq0=
X-Gm-Gg: AeBDietd1ns6mj8HIBF3iB9e2nMo4KjZDt8PsKE/0AmEF7NarXq7yLDcp4HJS2IGo7k
 7GGhasCNEH5OMphCN2zJIaw+fuLKOHIoZbNfc69UFht6BZxDXIMfyO/Bd4gZnZWuBa6tQKEe03i
 nafEnkZnd8dJJS8IcGWmDdsiYGyWiya8tv4w5GW96hZTCKOgFMUKzJcDdUA2Y/8NV1oRo576+z/
 OKNx5ABcm/3FOaHpx0dU6gRjifE9jXU6+/QDUUkhOzKXdr53iTXXgC0EItMblamguyvzjFQSCsE
 GYy48i9C5lausdftyHBsQsyS+3ocZYoIFAVs4AtE3QiMr6/uCjG/lMBRba7OfdCyBtBOKaULR2c
 KzVu8dmHHU5KZKKBDEBEUkGq4LohidYKIwnmVcNE91k8AvqA8jA7nUiZNC7pFDavDm0/TFL6EpK
 rgxas12LXHWq/Q1AeDMarotxcoX4vAOKoTze1GHZLqgTG+YWergY6Oc1K7JpDQxA==
X-Received: by 2002:a05:6870:c8e:b0:42f:d5c1:dcc3 with SMTP id
 586e51a60fabf-42fd5c1eb6fmr5003092fac.19.1777005364053; 
 Thu, 23 Apr 2026 21:36:04 -0700 (PDT)
Received: from stoup.. ([172.58.183.19]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-42b8fe2c52bsm19473599fac.0.2026.04.23.21.36.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2026 21:36:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 40/40] target/arm: Enable FEAT_FP8 for -cpu max
Date: Fri, 24 Apr 2026 14:30:14 +1000
Message-ID: <20260424043014.46305-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260424043014.46305-1-richard.henderson@linaro.org>
References: <20260424043014.46305-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2b.google.com
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
 target/arm/tcg/cpu64.c        | 4 ++++
 docs/system/arm/emulation.rst | 1 +
 2 files changed, 5 insertions(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 9b974d6f52..4cd18f6686 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1381,6 +1381,10 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64SMFR0, FA64, 1);     /* FEAT_SME_FA64 */
     SET_IDREG(isar, ID_AA64SMFR0, t);
 
+    t = GET_IDREG(isar, ID_AA64FPFR0);
+    t = FIELD_DP64(t, ID_AA64FPFR0, F8CVT, 1);    /* FEAT_FP8 */
+    SET_IDREG(isar, ID_AA64FPFR0, t);
+
     /* Replicate the same data to the 32-bit id registers.  */
     aa32_max_features(cpu);
 
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index b38a188088..5d85bed528 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -72,6 +72,7 @@ the following architecture extensions:
 - FEAT_FHM (Floating-point half-precision multiplication instructions)
 - FEAT_FP (Floating Point extensions)
 - FEAT_FP16 (Half-precision floating-point data processing)
+- FEAT_FP8 (FP8 convert instructions)
 - FEAT_FPAC (Faulting on AUT* instructions)
 - FEAT_FPACCOMBINE (Faulting on combined pointer authentication instructions)
 - FEAT_FPACC_SPEC (Speculative behavior of combined pointer authentication instructions)
-- 
2.43.0


