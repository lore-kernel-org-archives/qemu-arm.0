Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74791CD4F3D
	for <qemu-arm@archiver.kernel.org>; Fri, 22 May 2026 22:09:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQXzE-0001jT-AC; Fri, 22 May 2026 18:04:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQXxt-0007ky-6z
 for qemu-arm@nongnu.org; Fri, 22 May 2026 18:03:36 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQXxo-0008Ig-Lg
 for qemu-arm@nongnu.org; Fri, 22 May 2026 18:03:31 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-3665a90bcd3so8444865a91.1
 for <qemu-arm@nongnu.org>; Fri, 22 May 2026 15:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779487407; x=1780092207; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iNNMgucSf5F2JSSLk6zTH4DWxK3ilmSb/cxYYREeEYg=;
 b=ZqqBMAf+cL1NYELF3jmf5MFF75ZHMuVU8li6se+rI+3yEn+ChnhyFgnPciUzK9C33S
 xSZBqVSTGSf47AS4jy20G99FR/uEHcOis8q4vXT6S3hbMvNY8cRayVs/4usZC6yye+g8
 l4ugixKnqjcnN71yYAj6917EpElWugo6qwuTz5MASAisc2kSg/2IH0reA9g44+xnHcgf
 bXvp6wrU2OESnBJxn7C4rgAvWKw7q1y7Wd2hHm2p6vZCTMAsZ5K3yZJNi1FFtJRADiEC
 VBUnhKAB7Svq3whq+PFP5TOOVrQrt6ofFR00RJDaQ/5gU/YPZoZyrirKpJjkI7KEF4iX
 JkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779487407; x=1780092207;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iNNMgucSf5F2JSSLk6zTH4DWxK3ilmSb/cxYYREeEYg=;
 b=oKFITpdVKSfemSfX6Nd5x8b7CsqhlYOvxdfRslqOzZC8SpM7nwnZpBIJwu1Qxlk3DD
 6kp30ijNE1nJi/8eCAbYPwhCcuJTQgPyjkmNg6xizOUwvKvEcUKkihtJ5Z0Ez9UTw5Bv
 4jWkEn+r7TprylZAhZThw4VrurFU8/BHnHicLerGGevIv85/WTXH2MNrGvPzhycoWnqO
 clkthc9NEWeP9HkJRr+vSHLC46+tpFTR/HAexiPmiN3lLYCTvMNkSoxKUxde7kPkmlg3
 TCdqULfBNzVSA8lclzqQAj2wrni9+Hw2hjb4Dm4Zt/V9mEubQKBHbyzyL3GqbPuDRdRF
 bTWw==
X-Gm-Message-State: AOJu0Yz5Nb4wpRQb5CVjOravvlDWs+/OKjIAUi1x2FzZVsgzoeLqe8kP
 uMcrJ9PxLaF8SsWdtMwrF0a+nSuuZ9dIx1xzmiecOvgi+5IOLej9Y7re+M6gLZeHT3A6MFZpg2S
 +dVg2
X-Gm-Gg: Acq92OHtVrheHMrjjyoEVQv1+zNWI1bR8Dihs9r9jW1zUrRqBboJ05h5Kwg9KtepuAw
 lM9veaNxOBqVBzxi/j3IXxAdVsUN7sUDykYbbXoJAsGFW1QtFilYMuG8tPHhzkaoAxxmdVdWjC9
 0WBg235xH9sF0CpO/SJriwMUGPGLkaG6/+ocnPvyeoVORdnbcqOBo7ee1j9cwHBcxTbwpadqKWR
 0aqNPbfEuIa6XF/WWqtlwHchbu9MufTIJPnmKdjC1DaM7/Jjri+FHlnNmW74LxrQekjZNNg4z7H
 jwY9SmzvJm/gawqA+unX9bUgqFUnhDZyUAHZyN//LflbgU/UStvPWcBis/lgEzOvvb2F3Tfqfey
 OrtB7VSRZuw+YKRZaFAt8xQ/m4C1+yiVVCHSLbTdlx+mifGmOgjVYhsA+ysQ7K8DbYKPMWr3Aup
 DXRP57rNCHCi6WcI1G1z0XV4Dyl5TzAlTTO4/w19Y=
X-Received: by 2002:a17:90b:568d:b0:366:159a:c228 with SMTP id
 98e67ed59e1d1-36a67422347mr5270084a91.6.1779487406802; 
 Fri, 22 May 2026 15:03:26 -0700 (PDT)
Received: from stoup.. ([50.78.183.177]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36a6772f486sm1726789a91.2.2026.05.22.15.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2026 15:03:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v7 19/64] target/arm: Add isar_feature_aa64_f8cvt
Date: Fri, 22 May 2026 15:02:21 -0700
Message-ID: <20260522220306.235200-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522220306.235200-1-richard.henderson@linaro.org>
References: <20260522220306.235200-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-features.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 1bb77d78da..1fde3e9231 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1569,6 +1569,11 @@ static inline bool isar_feature_aa64_sme2p1(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64SMFR0, SMEVER) >= 2;
 }
 
+static inline bool isar_feature_aa64_f8cvt(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64FPFR0, F8CVT);
+}
+
 /*
  * Combinations of feature tests, for ease of use with TRANS_FEAT.
  */
-- 
2.43.0


