Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33795CCA470
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Oct 2025 22:15:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v6cBr-0006Uh-Qm; Wed, 08 Oct 2025 17:59:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6cAk-0004ZO-5x
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 17:58:12 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6c9N-0006lm-Mt
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 17:58:03 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-791c287c10dso283343b3a.1
 for <qemu-arm@nongnu.org>; Wed, 08 Oct 2025 14:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759960599; x=1760565399; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UNuznnmkN3H1quNH9oJ4a6PHA3WC0k/28XoZZg/pXoI=;
 b=IOnfDRzYh2z80Vr1BYR+Qc0bC3vw8FXxRJ4+9uYUEBSuLsEj0x0p1Lx9Jh4o8tAzN/
 /FRHfMY02U6tSxXBKNG5sXBykVR4bhSfK1h6ffcWceJ/DI4rll8q8yih2tqCKSOuf7T+
 69ubx2Nm14xVdH3nsEErsBFWx5GtT4VZTlAqvrATKbAgHQoZzbvODXJotXctOrxznJVt
 jFZX0aNrCuqhCJlGvR6G0muFH9fSvp/rO3wqrMotKDvFGEliwnmptSOX0b6dtDPhKH3C
 yhz3pMQRYvApvy4O25RvZKlqwNJwo2/m3kWE47jBHO3kJI+/PCc3fBg3do8Mbip8gzNc
 BvvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759960599; x=1760565399;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UNuznnmkN3H1quNH9oJ4a6PHA3WC0k/28XoZZg/pXoI=;
 b=iGqNq0S+8Og2/h9HzzDaCmMtvfP+pXWl6wuYeammSNnLQVe8bcfpxLh2EKVYkcF62n
 7u096jCD+DYbJlw/Q5mCJzYejbx2XopvB9OG7P0Mbk+5BFfF8+bbnnK/EWhRcov3yOsX
 Nm+u5KyY0l4Ad966A8bBTIRCnY2ia9e+0QkYAQN7s+TRgo4o0opmHl5PFm/6u8YqTafi
 jJSDomGNe/1qgt38NuUtg0LewcbptlxBEj3aqKpkMph5snLPABFZI1R8p5JeoLlZEoDH
 pUfISZzD351SB4Z5PWdGtdUHmt+uzu+y6dZWijFv4MgUlvlPd7f5e/BVbcQDsNDYmIKU
 X20A==
X-Gm-Message-State: AOJu0YwxHbw1h8FmkZv5PGpqbR6bQlk89dvXeShx3gyG31TCBz/0DcCb
 GpeC5yrmkTlIR+8extXnQnuuSI1VuI88BjNg7QTAKXDPlurJ+AhmnYjd65B7fmbXlAM=
X-Gm-Gg: ASbGncs0z+mNhbtUDhNxxLepxIwxKehIKSbTmTJjGZG/VLx6oGtN0Q7mHG2u+VxFbwr
 VpNjPsYfoQGk+nxM+1QrWH8fiVR/tl7476aXrlDKh/UB37fzai3PLEhVk3pLUXaXDLrHeyQBKqc
 oGYZjdEfm++ScMyBeYRz37AbDDKmnJ0ton0OE0ZRJcS9VHFPEm/Fa7/26D+e5ZTDfMCQQT5GbA8
 U+Qrkesxo7pVKGzCzk/6oHerwqDZowC1LByoCT5A0h2GV25TCCMLnPdzcu8t4Poa0oSx1VsdAcB
 PZcPuXI8qRHOTj+ahYS1mA4d6FxKGbHzJjYTXvetxqLkHNJ6C0cVSX19OKbPqq2XpySv8IOfouP
 f0nUpTCGXpheXtZjDGnqS7ei64M9PiBYV+E4oExtubeddVA3pBXeolG0M
X-Google-Smtp-Source: AGHT+IFJ/6zj1gjDDb35OMpGSt/QXuMnAGm+dF7sXf1v7IOfu1/maGzvIYJyiuZhr2X+MONM6kowCQ==
X-Received: by 2002:a17:902:f607:b0:27e:f018:d2f9 with SMTP id
 d9443c01a7336-290272c07eemr71415205ad.34.1759960599554; 
 Wed, 08 Oct 2025 14:56:39 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034e44ef9sm7354285ad.52.2025.10.08.14.56.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 14:56:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v7 39/73] target/arm: Use arm_hcr_el2_nvx_eff in access_nv1
Date: Wed,  8 Oct 2025 14:55:39 -0700
Message-ID: <20251008215613.300150-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251008215613.300150-1-richard.henderson@linaro.org>
References: <20251008215613.300150-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index e397fe75bd..2875f0ddd2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3427,7 +3427,7 @@ static CPAccessResult access_nv1(CPUARMState *env, const ARMCPRegInfo *ri,
                                  bool isread)
 {
     if (arm_current_el(env) == 1) {
-        uint64_t hcr_nv = arm_hcr_el2_eff(env) & (HCR_NV | HCR_NV1 | HCR_NV2);
+        uint64_t hcr_nv = arm_hcr_el2_nvx_eff(env);
 
         if (hcr_nv == (HCR_NV | HCR_NV1)) {
             return CP_ACCESS_TRAP_EL2;
-- 
2.43.0


