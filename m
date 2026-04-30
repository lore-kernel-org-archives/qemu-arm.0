Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8E8CD13DA
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 00:25:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wIFDx-0006ha-Sr; Wed, 29 Apr 2026 20:25:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIFDi-0006S1-J2
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:25:37 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIFDe-0007UC-JF
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:25:32 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-c648bc907ebso181228a12.3
 for <qemu-arm@nongnu.org>; Wed, 29 Apr 2026 17:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777508727; x=1778113527; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BiL04P2CzHdch1eAb8Dy0QC+hd+UkcPVAZS3KCpqoms=;
 b=ymhxajFXBKNnrhWlpyXiJWXkrQmq3eYvuhjIriBUUFq1DfqyMRelSxmGLFS1u+FvaO
 T3ZjsBl/PNxhhWhmCIWrwFpAna4VcxBaaia46uzsuXcR68IS+SISNDYezHoeGZI9X3st
 /Xe4CTkqrl6ZmX7wcpuiM9nj9hp7E54PJn7atXlGBbM43zfDTeDSm+wl8rbndwpzdExc
 E8WfUVJHcXw33fUZG1wH/HVy7N+6W9RLrdJTnlkHh2EQVU1PTRPOfxAPkJUBkPThZJs+
 DRXqkETaryxzopuA9WxZ75HfUUJxCfR+OqtxgfmeuMBkTowlMI4PQuKxtfbBJqq643Y8
 3lYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777508727; x=1778113527;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BiL04P2CzHdch1eAb8Dy0QC+hd+UkcPVAZS3KCpqoms=;
 b=UBgBkqEQ+NDdaOqShrtTIol9o2i2fUgxFIJDEQ+RO9dJCyL+rLGYxeBYJObB7kPSKq
 sKOI3LYFudsF6BVhzMWTZ1QtNocuszrlHNdzufhvGJdRB8R4c9PmfkgH+Sy2kSkEJdbH
 6qdQREGDR2RgwnmLIuL3z7+K1Gy2eSjLiV6vkyDNiCtDJCnbmbk0RnCg1t3uG16y8LFR
 GIN9264SB/tgnfwlJwIGXP0kXkCSWY7qAOhgWSeQMsNtIroWwSZhixzz/qwvwmXE2pAA
 Qd+umNgRGc7oMKCiLqomZUqCqx7C5mVHpJZvTI+h/UFQzFQzZMqz4KnJtjQej9DHZvRE
 aVgA==
X-Gm-Message-State: AOJu0YyweIj8PrVOYfmiIFQysO2uLf2yDAIfkGgt/bzYMjGWXF/qQoCF
 F4KgflJdgbx21LvejTOU81tSRSpVp4k7omvQsevyI6jRGold3+GY67A3lmY0OOmxWl0=
X-Gm-Gg: AeBDievJeJPbBnPP56W5EmBFzqb3oZhSJMuGXbMd7OCirHL/8EoXLKngOJ5f1dilC5h
 1D4Ss+n1IaTFOKTPw3cjeWVxdSM3uSU+0zokk71tbTy/qx02NqlVROOFRzBI/Bp5pXHfssNiFJi
 Fbse0uHMgS7TaIfUFuFTki/wZGiFt+lJUXq9F9v54ihLhS/zIsgVt+peToLGgYs6loR/lLOmjzX
 sbXVCdfNn2jWNdz+vMtGQyr70wUbao//vLTqZka3t3hxtvX7f4aQaCeMVEpUHQPtLokc82it+Sw
 WKtqjNxqe8PrL65ecxqAMI65zJICo4wGOulDTKGuCubX4Tw7Ow3C3nDckgp0turWlVXqZy7KlwQ
 ZbF7XCvFZ1SlYxQ2DVxQ8UKSbuMXDXPmmc9ko2pLQCk9uIETdM8MGJ4dzkB5BU/UT0Sy0s0i2BM
 mM41B8J+bOA8aWLDXSLdg1QxkAm18MCH+Mk+KH3kOd
X-Received: by 2002:a05:6a20:9143:b0:398:71e4:6287 with SMTP id
 adf61e73a8af0-3a3cf5654b3mr722895637.10.1777508727423; 
 Wed, 29 Apr 2026 17:25:27 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c7fd64f21b4sm3204112a12.21.2026.04.29.17.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2026 17:25:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 42/47] target/arm: Enable FEAT_SME_LUTv2 for -cpu max
Date: Thu, 30 Apr 2026 10:20:41 +1000
Message-ID: <20260430002046.59739-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430002046.59739-1-richard.henderson@linaro.org>
References: <20260430002046.59739-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
 target/arm/tcg/cpu64.c        | 1 +
 docs/system/arm/emulation.rst | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 8d0c057902..90214a355a 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1388,6 +1388,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64SMFR0, F64F64, 1);   /* FEAT_SME_F64F64 */
     t = FIELD_DP64(t, ID_AA64SMFR0, I16I64, 0xf); /* FEAT_SME_I16I64 */
     t = FIELD_DP64(t, ID_AA64SMFR0, SMEVER, 2);   /* FEAT_SME2p1 */
+    t = FIELD_DP64(t, ID_AA64SMFR0, LUTv2, 1);    /* FEAT_SME_LUTv2 */
     t = FIELD_DP64(t, ID_AA64SMFR0, FA64, 1);     /* FEAT_SME_FA64 */
     SET_IDREG(isar, ID_AA64SMFR0, t);
 
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index b6f0ca9351..0dd6b554a0 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -158,6 +158,7 @@ the following architecture extensions:
 - FEAT_SME_F16F16 (Non-widening half-precision FP16 arithmetic for SME2)
 - FEAT_SME_F64F64 (Double-precision floating-point outer product instructions)
 - FEAT_SME_I16I64 (16-bit to 64-bit integer widening outer product instructions)
+- FEAT_SME_LUTv2 (Lookup table instructions with 4-bit indices and 8-bit elements)
 - FEAT_SVE (Scalable Vector Extension)
 - FEAT_SVE_AES (Scalable Vector AES instructions)
 - FEAT_SVE_B16B16 (Non-widening BFloat16 arithmetic for SVE2)
-- 
2.43.0


