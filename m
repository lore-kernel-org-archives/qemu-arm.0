Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6124CD6E52
	for <qemu-arm@archiver.kernel.org>; Sat, 30 May 2026 23:22:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wTSuZ-0007tl-0D; Sat, 30 May 2026 19:16:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wTSuY-0007oT-3Q
 for qemu-arm@nongnu.org; Sat, 30 May 2026 19:16:10 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wTSuW-0000H8-IZ
 for qemu-arm@nongnu.org; Sat, 30 May 2026 19:16:09 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-36ac67f489aso4597585a91.0
 for <qemu-arm@nongnu.org>; Sat, 30 May 2026 16:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780182967; x=1780787767; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dl3x98BtzNbyq66CLNFsSvmqL5Pi9sVPBM0ykXWwyPM=;
 b=aYhTX32LBdKkGef2DhDe9iIzk1dn3mwCcrFPg7+z+8JliD7ZPPdzZ+Zk8412fiiAz1
 3z0k0e4ZIesUvW+GIxdlI/bxRvYMP9lwyTfXpcqxOSsoMZC/djbYLCprLE0m+jzMkxd8
 vvRxWAEbbTwV6ay3R7q4mW7yZhdfwVXcX/RGe00rgjmCi9+5uGsStQh1dmUtPtopAc9P
 s//S51RwxKiJSpHeAIkZvaIPO5kfDqiOV8MGgXIfcHjevNwign4Cx5jH/enehBoAH20e
 6nSCemxDifgMORnpbuvrU/J5kfQu7ML6O2zqL6x5v10g/NP/17VvbhcJqfJqoY85uMEn
 tu3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780182967; x=1780787767;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dl3x98BtzNbyq66CLNFsSvmqL5Pi9sVPBM0ykXWwyPM=;
 b=TVLCcnRox66tzLdH6KgDoT0egSkBrKYnIFiH93lhVH62JblFtcW36QNV84nZIkV+J9
 ky4lv4Na2n24CBnBWh0AYOY72Gz+QHakMjiKRmXqGHEr4XE/U05wApS4Qge1PZAlWhy8
 DDwWigYgjtGRJqsGY5zokid2OyveWG4Y6taQS4JUlI0Fe9+XB8m05A8nOaGb+ztmcVEU
 3zTeCODhYQtzRl1KJHTyFQ1kObz0Tre401hc3mn80OussLbINnIf1eAdWQvvCQI3/VSE
 PRrGVaz8E0ZKRg3tHTibybgV4XdFEYTUGWnX3ykjQhOMZp4+TKVEQ0fKEoXIyguqqmPp
 Ku2g==
X-Gm-Message-State: AOJu0YyLTco6MuxhsHQbCHyjXvjpDxZGZ+1O3Fw2TOch2c3x5JawPPBO
 4sgPnhBrZSE+6hIybYpI1I0W7sJ76M2pEk4gjwz1C+Q4OjVvlwAA2kwUTX3ibCkG9nX/aznhXHV
 A9Jahi5Q=
X-Gm-Gg: Acq92OEA1dRdqmFMlU1DfPfOEzd9EN2KgAyUDIYPR7lfS8E4mngdWeGBm8+Uk8wb4z9
 MlKVMwJ4neF2TZ5EDdKxaMS4QtaPNzpkTVfpPv1HuPSMuN6GNwdhGQvrFxPr/MVU7VU1rXPT/Mh
 T6YYJG17cwrGcosuWK16c//PPvD/GC/XmXWjw7Bmn6GgLy82Od6ebZCWGNie03DeTj57nSRY+kA
 W3hMabyMhJ87Qnb6sAMedie0uAPHPiylgKdiqlRwzmyy2Pc5fS9HAJeDcm1jm0Qv/6yl0l8khUh
 /H41xL/N4XgYtOCSzI4GrF+M/PEFo+ihiLUfnOwn5N8IGRk47A8p6fMziNqNPYigkNhSO/Siwun
 yUHpsv7Xc+kz95ATKJfwhRvw0fzdBSjPtUcKDcXWpbFYGHkcBV++umq56YzwzYXx+jOmJxOYHWE
 EXjgFVIHD3QzBvRvASXhI1ngELO24YscnieAEKeqY=
X-Received: by 2002:a17:90b:520c:b0:36b:a162:a1be with SMTP id
 98e67ed59e1d1-36beb2e0700mr3756697a91.4.1780182966781; 
 Sat, 30 May 2026 16:16:06 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36bc0c3d44fsm6370038a91.17.2026.05.30.16.16.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 May 2026 16:16:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v8 40/41] target/arm: Implement FMMLA (FP8 to FP16) for SVE
Date: Sat, 30 May 2026 16:12:28 -0700
Message-ID: <20260530231229.400441-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260530231229.400441-1-richard.henderson@linaro.org>
References: <20260530231229.400441-1-richard.henderson@linaro.org>
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-features.h      | 5 +++++
 target/arm/tcg/translate-sve.c | 2 ++
 target/arm/tcg/sve.decode      | 1 +
 3 files changed, 8 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 6d65706186..5a14507682 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1713,6 +1713,11 @@ static inline bool isar_feature_aa64_sve2_f8mm8(const ARMISARegisters *id)
     return isar_feature_aa64_sve2(id) && isar_feature_aa64_f8mm8(id);
 }
 
+static inline bool isar_feature_aa64_sve2_f8mm4(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_sve2(id) && isar_feature_aa64_f8mm4(id);
+}
+
 static inline bool
 isar_feature_aa64_sme2_or_sve2_faminmax(const ARMISARegisters *id)
 {
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 2ecaa0f1e5..ee1ed181a0 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -8477,3 +8477,5 @@ static bool do_fmmla_fp8(DisasContext *s, arg_rrrr_esz *a,
 
 TRANS_FEAT_NONSTREAMING(FMMLA_sb, aa64_sve2_f8mm8, do_fmmla_fp8, a,
                         gen_helper_gvec_fmmla_sb)
+TRANS_FEAT_NONSTREAMING(FMMLA_hb, aa64_sve2_f8mm4, do_fmmla_fp8, a,
+                        gen_helper_gvec_fmmla_hb)
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index 6610432528..b53fe6a58f 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -1809,6 +1809,7 @@ FMMLA_s         01100100 10 1 ..... 111 001 ..... .....  @rda_rn_rm_ex esz=2
 FMMLA_d         01100100 11 1 ..... 111 001 ..... .....  @rda_rn_rm_ex esz=3
 
 FMMLA_sb        01100100 00 1 ..... 111 000 ..... .....  @rda_rn_rm_ex esz=2
+FMMLA_hb        01100100 01 1 ..... 111 000 ..... .....  @rda_rn_rm_ex esz=1
 
 ### SVE2 Memory Gather Load Group
 
-- 
2.43.0


