Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46867CD4F3D
	for <qemu-arm@archiver.kernel.org>; Sun, 17 May 2026 00:35:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOPT3-0002Kv-KR; Sat, 16 May 2026 20:34:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPSN-0007Gh-CL
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:34:12 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPSJ-0006tl-KF
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:34:09 -0400
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-c80148ae949so349512a12.2
 for <qemu-arm@nongnu.org>; Sat, 16 May 2026 17:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778978044; x=1779582844; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WUXVONoe8IwMkgOU4fg5iX+I5AZGpysKKoOGKzNezec=;
 b=y1SO3mJUTs0mu+RDBko69CxJ1FeSdr43g1UOqVouXSqRqnBCnkqCgUCWmZ9nkgj3Ru
 ksVh/Z3Dgrg5Bev3pEfd2uEeP8r2cBPylsu8lrDNrVLhtjgaFEAlpQ20ZhsUU42wSsqr
 37G/a9fgosxkVIurnwcPzirZU4sJxYLoE4tli4hStV0c6ycU30Q9M9q+Q/+Y3Y7CryL4
 7cYgRFf8hbwU64jI935w0twHqgLyqy3ZO0Ipua9ULD6XtEvFLa4yQCOGEtFDKTsj42QO
 62yr5tDSJ2yqCIGmLU872DWG6/bQ2s8Mj80r25fB8Zx55ljEbupnPHM/ph6tPZwo5hvT
 vomg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778978044; x=1779582844;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WUXVONoe8IwMkgOU4fg5iX+I5AZGpysKKoOGKzNezec=;
 b=ECM7dFxOuj7w+80LHU+pyl2nw0V8AoEyPx7teMs0Af78SeALz3kBgud2vnG/ID2C0D
 yAmoM6kYqmtCZOpCEz2dTnoKKRGCfD+ECfL2EjGWWAAhLw4FRPPw2ciZ9JTmU8SQYkj1
 engYYlAPEu2OQ3pEhVT5U8C8/i2tlCjFB62nc0wTr6qQbNk02V3iNYKjTg9ItSOjd6fS
 RhKdV5v6B9mrv6Om4JYAjCvOPDRXtW+yZspW5yEpEuTMdTmUviRHBFNQcCdVgZUTm+E+
 RRqUIqWC9W2G3OJlDsePKCSceI4BEb1bnRPRg7wxNh2lB2aKUuT7eqXyv/JsVH4rKgwu
 cUVQ==
X-Gm-Message-State: AOJu0Yz3Aof+Q5WMyTi/uBoHlYOpBV0hMKKSzxp7bDPGGJLbw0Tx0ZNs
 2Xk09TcResmUkVuwk0924pz8pvjvGMKm7GcN9DkgTVoKQLKwoKS0PSVU2yezru4GYOY=
X-Gm-Gg: Acq92OGWPfpCdlZSqXy6mmud9uvbTIi29F5qL3a9lk0B39gpWUBrF0LBWVVz2iDrN+U
 lFsJibANCyVz0SwXff+3bowKBGJr9kTc2nFVKD7p6UdFrTvo8fNDervVhIHdSd8V7KX31J+P12f
 6MC2BK2O8f23zcZcIXa7TFt7U0vAFABvi9cbsdBPCoA1GdVU68PNlIqFm8iWQBnBNcAG5hlYQHv
 1y6/RcsP7tSj9bvx8TJ4qoycLEQ9U2tja/ivycU6giYq4Rz7bexRrXYRXGQCVK3CKqNf1wsfi+9
 HAspQQKnwKFPfYb3e9pMHfy8c5JWbbrnRtwehLPFno9bamGsfgpFDnBam6gNJG0m23J3FOx26JB
 v7yNvHfvrTMhM0/cq5Mnqa70G7/Nfo+yGES33p5I9dZdM78a2puDUAdGqa6XDQtO078aLMHRHXq
 e6J/EviGJ4Sy+chM76ybtZRZ+9UIU+
X-Received: by 2002:a05:6a20:3c8f:b0:3aa:c99b:5c63 with SMTP id
 adf61e73a8af0-3b22ea51afcmr10867039637.18.1778978043482; 
 Sat, 16 May 2026 17:34:03 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c82da93df0dsm3010559a12.19.2026.05.16.17.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 May 2026 17:34:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 62/63] linux-user/aarch64: Implement hwcap bits for fp8
 features
Date: Sat, 16 May 2026 17:30:01 -0700
Message-ID: <20260517003002.321430-63-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260517003002.321430-1-richard.henderson@linaro.org>
References: <20260517003002.321430-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
 linux-user/aarch64/elfload.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/linux-user/aarch64/elfload.c b/linux-user/aarch64/elfload.c
index 3af5a37776..0934524be2 100644
--- a/linux-user/aarch64/elfload.c
+++ b/linux-user/aarch64/elfload.c
@@ -218,6 +218,20 @@ abi_ulong get_elf_hwcap2(CPUState *cs)
     GET_FEATURE_ID(aa64_sve_b16b16, ARM_HWCAP2_A64_SVE_B16B16);
     GET_FEATURE_ID(aa64_cssc, ARM_HWCAP2_A64_CSSC);
     GET_FEATURE_ID(aa64_lse128, ARM_HWCAP2_A64_LSE128);
+    GET_FEATURE_ID(aa64_fpmr, ARM_HWCAP2_A64_FPMR);
+    GET_FEATURE_ID(aa64_lut, ARM_HWCAP2_A64_LUT);
+    GET_FEATURE_ID(aa64_faminmax, ARM_HWCAP2_A64_FAMINMAX);
+    GET_FEATURE_ID(aa64_f8cvt, ARM_HWCAP2_A64_F8CVT |
+                               ARM_HWCAP2_A64_F8E4M3 |
+                               ARM_HWCAP2_A64_F8E5M2);
+    GET_FEATURE_ID(aa64_f8fma, ARM_HWCAP2_A64_F8FMA);
+    GET_FEATURE_ID(aa64_f8dp4, ARM_HWCAP2_A64_F8DP4);
+    GET_FEATURE_ID(aa64_f8dp2, ARM_HWCAP2_A64_F8DP2);
+    GET_FEATURE_ID(aa64_sme2p1_lutv2, ARM_HWCAP2_A64_SME_LUTV2);
+    GET_FEATURE_ID(aa64_sme2p1_lutv2, ARM_HWCAP2_A64_SME_LUTV2);
+    GET_FEATURE_ID(aa64_ssve_f8fma, ARM_HWCAP2_A64_SME_SF8FMA);
+    GET_FEATURE_ID(aa64_ssve_f8dp4, ARM_HWCAP2_A64_SME_SF8DP4);
+    GET_FEATURE_ID(aa64_ssve_f8dp2, ARM_HWCAP2_A64_SME_SF8DP2);
 
     return hwcaps;
 }
-- 
2.43.0


