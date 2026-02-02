Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB40E7316F
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Feb 2026 13:39:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vmu4M-0007Ib-1P; Mon, 02 Feb 2026 08:34:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vmu4G-00076u-SS
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 08:34:17 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vmu4D-0002i1-F8
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 08:34:16 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4806cc07ce7so45267045e9.1
 for <qemu-arm@nongnu.org>; Mon, 02 Feb 2026 05:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770039252; x=1770644052; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yrzRKxM+gUNzaRlAaieIAxkZQfBhxlc5kLCyWkeZ6Cg=;
 b=YmlB/lR6fk/ca056Bi9O/mpmY6lx91CUMbYjntz1VgBmHiwGhaBZeOF9gHiQrhRzjm
 2zRqxAPUBetMYGK7vY3Qat2Ncdmvh05Buft3DrAaINb1kS2UgWUuwCDeCmFfE9BRVVjQ
 GeYOWK8LWhd+F9YtEntmm+wGRlcxTci2WRxMd439vCCDfHNPCHOoCblaKfGMkNcMr+ZF
 RbfExgSMInmJJiSP7tevfALGymXsvPEDGXzbM6YoHChoCsF0J+FbHItSvqyQJSOolLQR
 F8wBuhuHMfNUE4I8nubAJtxQ8+z/mjkpy7SRSeyx1U4+FJtD/l2Nx5OsBjnPF5p/+bjG
 U2bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770039252; x=1770644052;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yrzRKxM+gUNzaRlAaieIAxkZQfBhxlc5kLCyWkeZ6Cg=;
 b=r+o2xuMzECnxTkS3152TEjPr3t6FXi84H/zlz7yWhJZfoUTs8DWmMVoCCdiJn+0M/x
 SEhFnGRptPQGy67juppDrHVw9OKStNhH4vIal9p7qHjCZU7BVzcB7oX9+GniK4YfxEOA
 i8prVu1CvSfV8qb+tv40HJTIB+UuGNSrilx+ZodIlJOMWzFSP5fHSOa1DnHDqh6BXcNU
 1wkxmRaMctYz7Jn5Pa3p10QycLKCyxMnr9k7HblxlmYTkRijSVhKB+sLT5IqDG6zD55l
 FRAmmdNs6Xyj0Z/BKGmDgMMA/81qXbyyx+Pssm6yPp4o50V/WOtA6teR4N0VjkOTGNZt
 Nquw==
X-Gm-Message-State: AOJu0YwFB9HiogBE6fY1RU8ArNcaaiAjBm3z6gj7oV6CZ1ujeC9o4Lyw
 WbfPqJYElG0LzzRUNUml/9RSHV7TZktsEVK8NNXTI32yxb/Rjf0elaJ6FmFKVyT62bHq8JEZlDg
 CsyFH
X-Gm-Gg: AZuq6aI4g6VMO7AClQt/qUcQXmIKdKOnt8Tec5+b1qwL9Rp6+oDuERoRqVAvGR8jdh/
 hzGxIJeNmrxxWfrNPCZA0wkTZbIq7PB9Xu8wGw5EfEjkQXMVOKTVm0lvI1MZkxNtrXLS3Gn1e7l
 lFgafBpQCjuqXUPqsDVYkXTDUZHVmgsW+URfpWc9Cl5BDVv4ENg5hQGmHZiyHzQIFQToXTaXSAk
 05ZfE18MAKiADFG+xE/TaRQQBbfo293TmYcbw5z9BFIHtsFdpIpsQ2AHloLKjiMMDp0atd0/AWi
 IPubFxhnugLmKewJDrj0ZPcWQwkpKWkJXUxNn8xBXgJV48Rm3g/yVlZ6IxU9JF1zx7zwHEYz4qI
 3MUfNSQxNu8ipCn0J+Dr4Hs6irYGTQtoSkxt2l4fDD7EGk9PEg6YBkz+6PXSXX8J9wP9lmZam2x
 4JaApoe+BwsEJx9fEXFNoTdg7zynX6yg==
X-Received: by 2002:a05:600c:6214:b0:480:4a90:1b06 with SMTP id
 5b1f17b1804b1-482db49dbd5mr136827055e9.34.1770039252023; 
 Mon, 02 Feb 2026 05:34:12 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066c42895sm478054495e9.14.2026.02.02.05.34.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 05:34:11 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 14/15] target/arm: Squash FEAT_SME_FA64 if FEAT_SVE is not
 present
Date: Mon,  2 Feb 2026 13:33:52 +0000
Message-ID: <20260202133353.2231685-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260202133353.2231685-1-peter.maydell@linaro.org>
References: <20260202133353.2231685-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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

FEAT_SME_FA64 allows Streaming SVE code to access the whole
SVE instruction set; it requires FEAT_SVE to be present. If
we have a CPU with SME but not SVE, squash the FA64 bit in
arm_cpu_sme_finalize().

This doesn't have any effect at the moment because we don't
let the user create an SME-without-SVE CPU, but we are about
to lift that restriction.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index a9c1e60c95..c0447c8d54 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -385,6 +385,11 @@ void arm_cpu_sme_finalize(ARMCPU *cpu, Error **errp)
         /* SME2 or better */
         FIELD_DP64_IDREG(&cpu->isar, ID_AA64PFR1, SME, 2);
     }
+
+    if (!cpu_isar_feature(aa64_sve, cpu)) {
+        /* FEAT_SME_FA64 requires SVE, not just SME */
+        FIELD_DP64_IDREG(&cpu->isar, ID_AA64SMFR0, FA64, 0);
+    }
 }
 
 static bool cpu_arm_get_sme(Object *obj, Error **errp)
-- 
2.43.0


