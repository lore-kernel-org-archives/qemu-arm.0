Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F92AFB44A5
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Apr 2026 04:31:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wG8Bn-0005mJ-4z; Fri, 24 Apr 2026 00:30:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wG8Bl-0005io-Ah
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 00:30:49 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wG8Bi-0002YU-LI
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 00:30:49 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-42fc6923f38so1356127fac.1
 for <qemu-arm@nongnu.org>; Thu, 23 Apr 2026 21:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777005045; x=1777609845; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pfoV/MjdItCjEdTVv/LcepvEQT5a1+iPXWWZ97UB4oE=;
 b=V5Tm3x+xrn4xpxQN7VXC30Hd6W2JhT33d6I6SFsaQEYFnUtx+OV+Nw9QZAh1Iq1CJc
 8HwAus/PIUVTBtPipuruA10I7gyBWExXU6MyV3RuNg82LGFD3lXT0t7bbyxOuwqfqlPs
 IoUM8sE8GndUxWzh0U7EjpMrmEGWwTHihjdzSPhivBRRCDaLrmfzfVHgyh4BiAE3gmcR
 jz97dDdoZ9qIzVaAZQg+ghlb+u5PsFyEqfdK6P0Tl1p9JHsLYjl7s5NrsK/7ZIxY+zpa
 TCpQTxzXnh9aTvogsDjtX7LDvOXWsKZXq1kOktZlNHOtx8dnJswajPMBAPxs+T05DmW/
 f6KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777005045; x=1777609845;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pfoV/MjdItCjEdTVv/LcepvEQT5a1+iPXWWZ97UB4oE=;
 b=H/MekVcMKas2PUFMY0Zo748ZhNf7SKrJvRNwhZ8dvoYe9LVqsJ0zVAPTmev6pO3nXy
 Y6PdVVcDvkqR+vlBQqCEFp6dnuT7ytzp1QKnAjvYVevqIOo8SlByanBfbIx85sysR1DV
 6IeBC0K/lXH914AGrqL1fZdxSIXP7v1jUmxRuU2WsNyCrRLu5YBk2ULdud1DcFG1+33f
 75VdOrlAl/znYYHk0fvfkzehsqERfqRVMWY8mmMq4xqbK3DoofZgYFe2h9/FFqAGhWzY
 suQz41WoPbGLildbEhQf4URuOQZomnuuXYl+wHAKuPLRmJQpMjgoBB3Ec7gpJEFWo+bZ
 0tvA==
X-Gm-Message-State: AOJu0Yx/F+e/nGz+HLvB7tJeV7ywCUu6f4Bfvlu0+B/5AzPwe4u3ymqo
 ZDxEKCmUDpJZ0XJzRMsOFFO9c68SJYg+BY6Uvl80HVii8MCfBo2T5ZOiIF75V7GooUH5K7kW7o3
 UhzB+I90=
X-Gm-Gg: AeBDiesz5P0tO1ORXH2KxQo7WW5v00CFt/6qOkEDQFEtSlgKH58uE4JYmd26HyUhKNu
 mFLM7bviOzQNrQBOQX3bbZ0bbLN36oi37FDX4YkMaAQW99tKGrRRO0Kb7nxFFeMMzDJuZEYqEmO
 CSPUGtL/fTh0N5Jeyw+hYXYn9ceH5DXau7oz7LIi6xeGCnDFvPCHlzi37zvGVyW1rMdQZotzvUQ
 rIkhqcQ7zEzjXEzZ46xG0zcX0JzeKLPJCNmkY0+xD1Z9re9l+OUiBCTzjQMhHoHC+5F2yQGgSe4
 4ZPkiIjE0HM86N65uzYrBJXE4PnaVwSvWja+6VRnTU2iRRd2txMNRlrS4NeB836WW+a13uSO1C9
 sBMXxVsJ8f8t1wGqkC8c2uatklGCwj9dvZ2FCi14vHHXjs9bvIjy6t+ucyiL7YPW37zVxYsTf6r
 b8mar9JWiIDs++Dsy5SYcdpZaUDBkCxweIbcHI9jdwztEqCL4vbWKCPQ5ZH8YyCA==
X-Received: by 2002:a05:6870:64a2:b0:423:9751:c1c5 with SMTP id
 586e51a60fabf-42a99adf792mr15782693fac.22.1777005045346; 
 Thu, 23 Apr 2026 21:30:45 -0700 (PDT)
Received: from stoup.. ([172.58.183.19]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-42b9ac54ec5sm18880864fac.13.2026.04.23.21.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2026 21:30:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 05/40] target/arm: Enable FEAT_FAMINMAX for -cpu max
Date: Fri, 24 Apr 2026 14:29:39 +1000
Message-ID: <20260424043014.46305-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260424043014.46305-1-richard.henderson@linaro.org>
References: <20260424043014.46305-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x33.google.com
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
 target/arm/tcg/cpu64.c        | 4 ++++
 docs/system/arm/emulation.rst | 1 +
 2 files changed, 5 insertions(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 84857fb706..343536523a 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1256,6 +1256,10 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64ISAR2, ATS1A, 1);    /* FEAT_ATS1A */
     SET_IDREG(isar, ID_AA64ISAR2, t);
 
+    t = GET_IDREG(isar, ID_AA64ISAR3);
+    t = FIELD_DP64(t, ID_AA64ISAR3, FAMINMAX, 1); /* FEAT_FAMINMAX */
+    SET_IDREG(isar, ID_AA64ISAR3, t);
+
     t = GET_IDREG(isar, ID_AA64PFR0);
     t = FIELD_DP64(t, ID_AA64PFR0, FP, 1);        /* FEAT_FP16 */
     t = FIELD_DP64(t, ID_AA64PFR0, ADVSIMD, 1);   /* FEAT_FP16 */
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 7787691853..579df4c47b 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -66,6 +66,7 @@ the following architecture extensions:
 - FEAT_EVT (Enhanced Virtualization Traps)
 - FEAT_F32MM (Single-precision Matrix Multiplication)
 - FEAT_F64MM (Double-precision Matrix Multiplication)
+- FEAT_FAMINMAX (Floating-point maximum and minimum absolute value instructions)
 - FEAT_FCMA (Floating-point complex number instructions)
 - FEAT_FGT (Fine-Grained Traps)
 - FEAT_FHM (Floating-point half-precision multiplication instructions)
-- 
2.43.0


