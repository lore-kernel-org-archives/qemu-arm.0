Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B898ECD4F49
	for <qemu-arm@archiver.kernel.org>; Sun, 17 May 2026 00:33:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOPPp-0008QS-C5; Sat, 16 May 2026 20:31:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPOp-0007FN-2R
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:30:36 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPOi-00051b-Ly
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:30:29 -0400
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-c8026aa4d53so782187a12.3
 for <qemu-arm@nongnu.org>; Sat, 16 May 2026 17:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778977818; x=1779582618; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XfEjDJlVu7LsFiNptc3UAEkKV/ApJAH3Ld019vvaP5k=;
 b=v4xtZom0P734q0Q05eCnVe9fdxiK1hGU0ckPwrNHYYPbPvNh1tl3zK+usEAXIXSkBd
 BFu5IaFG/oDXuVtj/M6NkekIJ8SB5wvdAfecXXPrjukULXGCe2bQ5pt1X5huBMnNt+FX
 YPKLeWCwx+VHut5VD7LunfJt65X6HtjYK15aK1Xtd/8yQYur7Vh+tjNPHyxsy7HqCjTT
 qiSlhpEWrZwMxy1w4UdT9x2fFp7MqQ5ysMz1gfnzh31SdcT/kTTshYodMCh6GHwjzoSj
 YnYMgEXCcg9KUCUoo+wFkPboxIlmrE9380OV+nwAdSbN3C7DodcySw1zgNmrM84E59iN
 b+nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778977818; x=1779582618;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XfEjDJlVu7LsFiNptc3UAEkKV/ApJAH3Ld019vvaP5k=;
 b=Rz7aTEv+2wRXUSoOOZstDw610zp5KJg2JgR48BYimzMP7bS99pLzwVr+VWm+Y5+1T0
 XQdEhS/r8PHIH6BjOXtFzeNBo2MwBqHTAVGehdZS+40L/d8PiON/VfuBrsjZLpZJt7Ft
 kARKgPqD2roALyViK4Gbi0YFpWxk2h8OztkU3XQaCESODnxnlwY3Imajx24L/7NSsUt/
 v13U3N5xMHeXPAo+1ZrCvSEUQTah4g9XSs/uJWwUk7Id+5LpCFsxW8sH3vvQptcfPnON
 An+FGKR58uwKOcnI9PGvReENgFR8ORwdhKtOhW+QYDhLybj5FtrDqK4TtpHBq5ZsAmB6
 qo4A==
X-Gm-Message-State: AOJu0YzxKK4wuQ5rt6Bjt+anNFNh8Hf7Mv3itBBB5LSmqNpr6wCFXPR/
 4QJQxNtHQQ5Xclz+Ez9SHbV1i4+bJsdctCci5AJYSSZTrcim7JBi9UWlGaT0/U7h4xc=
X-Gm-Gg: Acq92OE7+AYBEKPKiVh4PlJxvZdh9acBd/ZEf8Ww6DryeaSVg6dc/FqJN4sJuUymqRq
 bjtVp6IBeO+d1LLvXh1DouqjpsFkZufq/h2VIJmBvE/sfMb2TUbyKVkCNXN50VdZuuVCMM1s63S
 XVohsWUkNZkvBDYh0cgEsq+NjMSIVkWM8+JjjX6k+YgnWeasN6z1yG4d2hTtVddrj7gxVdXQdW4
 Kcytsg0hRpreyUZ9nRsMG3KCY/jsKdq7X4HWo51o5LovAJTvj9F6mtBjqmDjMgTxABQanSnopqD
 Y1o0lBdrR+vjzbn2sVqFGCM+bkJHzBHpkSDNLLQllc56vkKGs6yPiP7ojLyGrY7UZBsd3JyicTG
 eJhlHtzZ9Qat4x5P7o5F7s14WR7e+FqA23hH9jtBObu2722JQ5WWbcfH0p2BmzgfdppLjt85RK7
 GqDiW8+Y1sN6xzTXP+0MBBZfDazSMpHVkYTV+7x0A=
X-Received: by 2002:a05:6a00:3d43:b0:83f:250d:59c with SMTP id
 d2e1a72fcca58-83f33c9d141mr10072823b3a.39.1778977818081; 
 Sat, 16 May 2026 17:30:18 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-83f19663cfdsm12272745b3a.9.2026.05.16.17.30.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 May 2026 17:30:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 16/63] target/arm: Enable FEAT_FPMR for -cpu max
Date: Sat, 16 May 2026 17:29:15 -0700
Message-ID: <20260517003002.321430-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260517003002.321430-1-richard.henderson@linaro.org>
References: <20260517003002.321430-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
 target/arm/tcg/cpu64.c        | 4 ++++
 docs/system/arm/emulation.rst | 1 +
 2 files changed, 5 insertions(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index ff0c2b1c47..a377f67b9c 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1297,6 +1297,10 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64PFR1, GCS, 1);       /* FEAT_GCS */
     SET_IDREG(isar, ID_AA64PFR1, t);
 
+    t = GET_IDREG(isar, ID_AA64PFR2);
+    t = FIELD_DP64(t, ID_AA64PFR2, FPMR, 1);      /* FEAT_FPMR */
+    SET_IDREG(isar, ID_AA64PFR2, t);
+
     t = GET_IDREG(isar, ID_AA64MMFR0);
     t = FIELD_DP64(t, ID_AA64MMFR0, PARANGE, 6); /* FEAT_LPA: 52 bits */
     t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN16, 1);   /* 16k pages supported */
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index da5f7efce2..44c7196d09 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -77,6 +77,7 @@ the following architecture extensions:
 - FEAT_FPAC (Faulting on AUT* instructions)
 - FEAT_FPACCOMBINE (Faulting on combined pointer authentication instructions)
 - FEAT_FPACC_SPEC (Speculative behavior of combined pointer authentication instructions)
+- FEAT_FPMR (Floating-point mode register)
 - FEAT_FRINTTS (Floating-point to integer instructions)
 - FEAT_FlagM (Flag manipulation instructions v2)
 - FEAT_FlagM2 (Enhancements to flag manipulation instructions)
-- 
2.43.0


