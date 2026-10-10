Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F52CA9EBE
	for <qemu-arm@archiver.kernel.org>; Sat, 10 Oct 2026 07:11:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xFRDd-0001mI-1P; Sat, 10 Oct 2026 03:10:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xFRDa-0001fk-7M
 for qemu-arm@nongnu.org; Sat, 10 Oct 2026 03:10:07 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xFRDX-0001DV-9Z
 for qemu-arm@nongnu.org; Sat, 10 Oct 2026 03:10:04 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-48bbb06e746so221370f8f.3
 for <qemu-arm@nongnu.org>; Sat, 10 Oct 2026 00:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791616201; x=1792221001; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=oT+FZWt7bEWUKxAoVtnekPFez5e1OxvHBFOw6pm9r3w=;
 b=wUtSxLe3e7zJ1PSV9WcNwHOx3tL9BbGbhRsKLDDPhgNE2RDizZxMZb/T6MlTzDZqkx
 ji5Z94ai+VGTPe39Orh1VjyXBQIYTAsz03o8fjuosgdV/97BRc5u4fN5XVEwe3EbzBup
 SS9X040w0zQY+XIjmAPncYuEGU3+V7eI4biorA2qTx170SU1HAGlelcqvmTyJeKiiiRG
 NIZ1Xw+HRnGs+EAnU42yXhSD6KOfmf4ntMH7xYeFR6OCtVUmwpFZxNBHXIaZpk4rYioq
 iB4epB6NQlPNtcGUnCnDrRjqSxgbEl9hrxrYNiI1d+SD5FpNQBRIQcYALB/owLMZJh4O
 D77w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791616201; x=1792221001;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=oT+FZWt7bEWUKxAoVtnekPFez5e1OxvHBFOw6pm9r3w=;
 b=ZepggrsCQEKeqSY+UePwtHlwX+mHh8u89KV2+Y+nwHcc5qeG5CafQaoU0ppiQ0fsQr
 ywOCXxsvKddi6nu7gdKbc27SdUJYneY9JfZ6Y1l9h+YtE8A8wqJxzWi/053hL6ZPSlNO
 rBweLPJ+TmIX4PWm6DVse0XKF67klKpZ2oOtVww+cDIPg8Kkn1cLPTSxSBXu9YFvilkp
 ExiH6ZzRg7fZ43MOdPeNTdzTV1CkkbU0Pz1o0DF7xHiWP/j9wqfD3mxW2mMLlMDFBcYt
 u/EEdhTtl3KwWObmJQudJittwJoVE3d4CK5sncuXThWTp3Gv8zN1z7bBqLSGzIKYk/Yn
 BfYg==
X-Gm-Message-State: AFq9FYJihv7feZnsaNb3vU8fO99MRJiAbIVQWuW9hxHMBHcncq+V8ZB4
 yhTRsfb+dBiR0D5xqzImIP+VuZIYHkfjVfjaaNoPRICEpfmoOf/FjKynoZznR/Fq3P0=
X-Gm-Gg: AYBFou1flkUlKKuf8RJIraA8ZMRKH/edZUXKt3dz0Xo+iivB09vHdYqhvFPsfbt4oi3
 H9xzM0uPD5fVExUrpDRmZqFrV91XBfIhRwhdF2bapPNO//Z7R5yH9Jd6hDTsGdHcs7z+F5rvbhh
 sY29yIVCQpH+Wt2InYIzRSlGwwxT9DP4vJJJmAxGDgeICDs1xZShdaHLfNCyrHOum5D8I5ukwz6
 zKzj7entU4+TpDtM1mw2jvq/NxVQ8GxTN3Szfosf87NZTEaCTB5HW6FIFnQQVtno6As/Fa3eQZB
 OPyr5DNp2KdBInR0C1BMTBprk5Eo30s1RbX94Ixvxylk0NaDSZxJj+fAS3fNr+kv7YRyARpKLHf
 LgQpWEzrAZAdsD6PRyAS43UerC+1Mm4LkXzprFER4e3hmrkkG7W8rUpLYTBFYV1zPGBCY+iXZK0
 682XXK06bKyyjQ+av9ddTO0fIuEF0Kp2IgAaKF5qgdTRv40OxAgj+BffU/xnvY/KaV8Jt10XA97
 IjczhiNjb4=
X-Received: by 2002:a05:600c:c16f:b0:49f:cbf1:e765 with SMTP id
 5b1f17b1804b1-4a18e3ef314mr74227165e9.0.1791616201385; 
 Sat, 10 Oct 2026 00:10:01 -0700 (PDT)
Received: from stoup.local ([2a00:1e:e082:2901:a2d3:66fa:95e6:7d81])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9abda3csm7662252f8f.36.2026.10.10.00.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 00:10:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 6/6] target/arm: Enable FEAT_IDTE3 for -cpu max
Date: Sat, 10 Oct 2026 09:09:52 +0200
Message-ID: <20261010070952.323466-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261010070952.323466-1-richard.henderson@linaro.org>
References: <20261010070952.323466-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
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
 docs/system/arm/emulation.rst | 1 +
 target/arm/tcg/cpu64.c        | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 3bd5c42a664..d1467ef4bfb 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -105,6 +105,7 @@ the following architecture extensions:
 - FEAT_HPMN0 (Setting of MDCR_EL2.HPMN to zero)
 - FEAT_I8MM (AArch64 Int8 matrix multiplication instructions)
 - FEAT_IDST (ID space trap handling)
+- FEAT_IDTE3 (Trapping ID register accesses to EL3)
 - FEAT_IESB (Implicit error synchronization event)
 - FEAT_IVIPT (The IVIPT Extension)
 - FEAT_JSCVT (JavaScript conversion instructions)
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 59692dddcfa..c92e331e731 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1461,6 +1461,10 @@ void aarch64_max_v9_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64PFR2, FPMR, 1);      /* v9.2: FEAT_FPMR */
     SET_IDREG(isar, ID_AA64PFR2, t);
 
+    t = GET_IDREG(isar, ID_AA64MMFR2);
+    t = FIELD_DP64(t, ID_AA64MMFR2, IDS, 2);      /* v9.0: FEAT_IDTE3 */
+    SET_IDREG(isar, ID_AA64MMFR2, t);
+
     t = GET_IDREG(isar, ID_AA64MMFR3);
     t = FIELD_DP64(t, ID_AA64MMFR3, MEC, 1);      /* v9.2: FEAT_MEC */
     SET_IDREG(isar, ID_AA64MMFR3, t);
-- 
2.53.0


