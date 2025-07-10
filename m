Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5755FC83F17
	for <qemu-arm@archiver.kernel.org>; Thu, 10 Jul 2025 21:13:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZyY8-0000fJ-3j; Thu, 10 Jul 2025 17:11:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uZyXt-0000XM-6t
 for qemu-arm@nongnu.org; Thu, 10 Jul 2025 17:11:10 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uZyXr-0006eT-Fw
 for qemu-arm@nongnu.org; Thu, 10 Jul 2025 17:11:08 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-23c8a5053c2so15035575ad.1
 for <qemu-arm@nongnu.org>; Thu, 10 Jul 2025 14:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752181866; x=1752786666; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XxglZr9FSbfBVmHLZ+FvVDfQKN3fWf8b03y6OHhLFac=;
 b=S2ubFhecNrlcE0wHvzSd++yXvrycuf426RKI3nyvqXRxAJO+rp10BunaJO3R6CbvLJ
 5iRLSMhsHbhAUhJ5ErlhM2AL7OwNa0eoxwgTdO0c3lW0ypnK0ubyAQirEeK1H79rpGbd
 iXcQDAxy0LYW87ouBC5Fy7GHhO1ygSHHjWqk9Mc3C2l2nOpSN7yTgjHYZCpuoBNmTfEr
 ZyhTyqVCs2a8C643FZKoSAn1IBFkxpHXAqw0q7s2mZ3lNbK201jOOVV8wxPhW/OkVLuz
 eR3NkZhvqhfcF4uf5e+bUPVC6UKWqzoFBpXBn0mMRQHkmiAFh7E4KinellZyMhFC2MWM
 AbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752181866; x=1752786666;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XxglZr9FSbfBVmHLZ+FvVDfQKN3fWf8b03y6OHhLFac=;
 b=rM37PG32jSpFUjnR4psku/HkLcj6rTZCBo6YjWzZ1YuGnloH2vqZYJNsFz1J6jo50l
 mtV4QMY2wfAQOkbPpPq3fNfzFchu3CL+XTfHS/u2PsiVGh3ilRCyC2f4WOADJ2k1F49J
 vYgoNfFFDm+eMgfb7mJk51fMKp1/d1TchGojkEXpe92iPTzuwijWWVL7dePCK3t1wjVV
 oDxiEB/Ad7h/7AAt6lsb18Y7a8x6TBH7BSwedMYKslycckPyRngCAzDzzXYthgNu2e9C
 to0iMCV8zxo+fmgasrBYOrI5opDY4b3ocpMPyTEp1wCGV+gdzJdlCKJdhsm7FzFbbP9I
 YLqA==
X-Gm-Message-State: AOJu0YzsmQrIFgfLdBps6+Wu5o74aacYufHLJlx9FcpTNSP8bg/VAjJk
 w2o9GD0a4tJwaxn0T2N44k/WxkwpTWBn7Rp9ZuICGWwnNm+p+6xIE0egcFUiA9/kv9cgByOzKg+
 BL5ikLpc=
X-Gm-Gg: ASbGncuB9NqvePAfxCIxHBnMfQhsb7VEeq0dXjtYYvGwjYulJ8ENXYM3mOrUES/7pVa
 1VjgYy3BxEZJ/N8bQ71dRMqZ9rOWzZITknxCPR7r915LplHO3cWBQ/lDyRHaCIq64ffVAO0bUnc
 v3yNpZF0nsY4hxRt6Lo5iq1CH90WhCTZTVq+HM3d9M0teUNqfNZ7uvMOe7iqqJR6r3q1A/6y+t4
 CR3Rlzj9Ee11YjVpDRLjwbCpm27ccr7bYNlwrg1P05tjKgcZCxqPSJlBKtHIWFEaKbDRl7m4DzT
 RW8WXKU7e/jnwCRCzttM1Ht5u7X4x4oxfqbuZScrz0KRm7adUAaGuLw9v1AAWnB3fNI8BRv+toX
 LEkZYRZU5r6VbdZ/RM7C5BhsjqQrKRd9cQw6bb5qPFEgJ1lXiiecbjcLGyQ==
X-Google-Smtp-Source: AGHT+IGRi/54l7dYMIvw7MZjU0TCT2MYW3MaMAMb7gvme9jACt4mMt+PGVFnwDgSGyEgz79DhyRmOg==
X-Received: by 2002:a17:903:2f85:b0:235:f45f:ed53 with SMTP id
 d9443c01a7336-23dede8914fmr9118495ad.33.1752181865996; 
 Thu, 10 Jul 2025 14:11:05 -0700 (PDT)
Received: from gromero0.. (189-47-46-41.dsl.telesp.net.br. [189.47.46.41])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de434d6b0sm30447775ad.203.2025.07.10.14.11.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 14:11:05 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-arm@nongnu.org, richard.henderson@linaro.org, alex.bennee@linaro.org
Cc: qemu-devel@nongnu.org,
	gustavo.romero@linaro.org
Subject: [PATCH v6 6/6] target/arm: Advertise FEAT_MEC in cpu max
Date: Thu, 10 Jul 2025 21:09:41 +0000
Message-Id: <20250710210941.1098088-7-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250710210941.1098088-1-gustavo.romero@linaro.org>
References: <20250710210941.1098088-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pl1-x629.google.com
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

Advertise FEAT_MEC in AA64MMFR3 ID register for the Arm64 cpu max as a
first step to fully support FEAT_MEC.

The FEAT_MEC is an extension to FEAT_RME that implements multiple
Memory Encryption Contexts (MEC) so the memory in a realm can be
encrypted and accessing it from the wrong encryption context is not
possible. An encryption context allow the selection of a memory
encryption engine.

At this point, no real memory encryption is supported, but software
stacks that rely on FEAT_MEC to run should work properly.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/system/arm/emulation.rst | 3 +++
 target/arm/tcg/cpu64.c        | 1 +
 2 files changed, 4 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 1c597d8673..d207a9f266 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -89,6 +89,9 @@ the following architecture extensions:
 - FEAT_LSE (Large System Extensions)
 - FEAT_LSE2 (Large System Extensions v2)
 - FEAT_LVA (Large Virtual Address space)
+- FEAT_MEC (Memory Encryption Contexts)
+
+  * This is a register-only implementation without encryption.
 - FEAT_MixedEnd (Mixed-endian support)
 - FEAT_MixedEndEL0 (Mixed-endian support at EL0)
 - FEAT_MOPS (Standardization of memory operations)
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index ae2046a7f6..1b9b6475b6 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1250,6 +1250,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = GET_IDREG(isar, ID_AA64MMFR3);
     t = FIELD_DP64(t, ID_AA64MMFR3, TCRX, 1);       /* FEAT_TCR2 */
     t = FIELD_DP64(t, ID_AA64MMFR3, SCTLRX, 1);     /* FEAT_SCTLR2 */
+    t = FIELD_DP64(t, ID_AA64MMFR3, MEC, 1);        /* FEAT_MEC */
     t = FIELD_DP64(t, ID_AA64MMFR3, SPEC_FPACC, 1); /* FEAT_FPACC_SPEC */
     SET_IDREG(isar, ID_AA64MMFR3, t);
 
-- 
2.34.1


