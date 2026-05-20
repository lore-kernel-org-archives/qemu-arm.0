Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 350CDCD5BA4
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 18:28:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPlcQ-0004La-Je; Wed, 20 May 2026 14:26:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlc4-0003uJ-Aq
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:25:48 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlc2-0001zE-04
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:25:47 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2bd9c3b550aso35450465ad.2
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 11:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779301544; x=1779906344; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nTIDtuillPXckV86mcaM2Utf4vRJVw8yqCVUR2w2Jkg=;
 b=ZNmIEcjKcYk7wxZp6GYp+zMnflmMGlZwupiLQiFSUY/JOxZoiDCoQxs2zKOFDyERom
 Ko92nUJpRBrMqhLhot0Q/H2vuuGicp4XyVoQzfUI6OoQBque80UVguoTU75qDVDEkxfm
 FUDdVDOiCjPbCNFNuq49IGc4ahtgdTyhPq8a9NbQCKTyEzDLSQE97QuLR25DE0IoXSpf
 LWr+q++gu6k0u4KTyZCSvL8gAmDolMSvhLBLDDsAFdI7OgtYj05/47uWWPBh3CVplHa3
 Z1zVdZN7hkVQD9VbpaAPrscHgYUrkyINFONkbG8nVRgbUXdTdWHF0GnAN/Jl2U0HB+TB
 /XrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779301544; x=1779906344;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nTIDtuillPXckV86mcaM2Utf4vRJVw8yqCVUR2w2Jkg=;
 b=HLpX6v6cpbSvUK/nanaNAC9FFVFk/d8cLahE5XG1ZAidGKbiWrLjhuHocW04ITJ6E0
 Y6hKV46r7LYhvPNU7/C/IKSWyqaitt9+4T/DGvY5WRFZaiUW8vJCujSm2C7BhJsVMsHR
 uNQfKN4t4sfMeCQzr8J4Y95TSyKwN9TNhyUKP6EuGLVIW/mmf9hS0eqp+Kl/nb46QN6Q
 VFyQoZ5BKI6WPPItItFiNVTiEWJx8anuQ84DrbgqXs38f4NolLUAKX7PHRbG4p6gSvaO
 NLJgt270NweuUDAf4J0JMToAkcOeQhS6YFs0fLBm8NCJ9qnxLIAwrpd11hhry7pHhyf3
 ywCg==
X-Gm-Message-State: AOJu0Yyn0949CxAh85NBoh5dPTWRqoN9DmWj5R3PtXNaXxV3ihTFriEy
 q/sLq8qI999Fjjm2zHIehLZ11SezayQD5pPN9CAlAjlSQGfCY/6OzgfMFY4DD4nMdwQskXhuVb7
 L75M1sCc=
X-Gm-Gg: Acq92OG1h5/1t7FBO3tJH0ZfLHxkcq4z1arFfxHh3lNam+BzsVLv6SP6ImySK2OIsrs
 VOb14PTpHP3rhLodl/5me/M1tn4GJUI1sbX/Ehg46qFQvuiGyYNG3DAOEJE3U6jk4CvbQRASnNu
 sl4iOx1ypWgfjtwwoydVrZ2pSTjYGmFf11t3uoIftmRxhAf9g/QclP220BMTLbQVfLrZgC46/B0
 5QU0JHPhJcxwcHpcBtRARqA8g+OJ0mn0hEEUL4Q/UuQHfgc1C5m1WP974X4KPWYTw1KO3i/LcC9
 mxxiyrxakWnDh+LuIewuD4TMLP/5qIg52vgCjLE8ZwilZr3CAMKUtJVu4thrp/5rD56Mw4bhTKc
 CcqkBSqh0JfSrzXlcxwqpV2CoNfxYm6FZyb6BqWEOZWCcTyeflEhAWRv7nuoiwoFY81Bas/mLjc
 u9e4yodOl0+qQ3Z/Mh11VGF5WY8prL
X-Received: by 2002:a17:903:1b70:b0:2bc:810b:5c0c with SMTP id
 d9443c01a7336-2bd7e8cbd1dmr289503025ad.34.1779301544217; 
 Wed, 20 May 2026 11:25:44 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bd5c0605ddsm217413925ad.32.2026.05.20.11.25.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 11:25:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v6 41/64] target/arm: Enable FEAT_FP8 for -cpu max
Date: Wed, 20 May 2026 11:21:50 -0700
Message-ID: <20260520182213.872945-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520182213.872945-1-richard.henderson@linaro.org>
References: <20260520182213.872945-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
 target/arm/tcg/cpu64.c        | 6 ++++++
 docs/system/arm/emulation.rst | 1 +
 2 files changed, 7 insertions(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index bc866c5a67..8d0c057902 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1391,6 +1391,12 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64SMFR0, FA64, 1);     /* FEAT_SME_FA64 */
     SET_IDREG(isar, ID_AA64SMFR0, t);
 
+    t = GET_IDREG(isar, ID_AA64FPFR0);
+    t = FIELD_DP64(t, ID_AA64FPFR0, F8E5M2, 1);   /* FEAT_FP8 */
+    t = FIELD_DP64(t, ID_AA64FPFR0, F8E4M3, 1);   /* FEAT_FP8 */
+    t = FIELD_DP64(t, ID_AA64FPFR0, F8CVT, 1);    /* FEAT_FP8 */
+    SET_IDREG(isar, ID_AA64FPFR0, t);
+
     /* Replicate the same data to the 32-bit id registers.  */
     aa32_max_features(cpu);
 
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index cf8771d541..b6f0ca9351 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -74,6 +74,7 @@ the following architecture extensions:
 - FEAT_FHM (Floating-point half-precision multiplication instructions)
 - FEAT_FP (Floating Point extensions)
 - FEAT_FP16 (Half-precision floating-point data processing)
+- FEAT_FP8 (FP8 convert instructions)
 - FEAT_FPAC (Faulting on AUT* instructions)
 - FEAT_FPACCOMBINE (Faulting on combined pointer authentication instructions)
 - FEAT_FPACC_SPEC (Speculative behavior of combined pointer authentication instructions)
-- 
2.43.0


