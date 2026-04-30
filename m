Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 487EACD13D3
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 00:22:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wIF9K-0006Ih-Ov; Wed, 29 Apr 2026 20:21:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIF9G-0006GP-I4
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:20:59 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIF9D-00064o-Tp
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:20:58 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-82faf871346so248677b3a.0
 for <qemu-arm@nongnu.org>; Wed, 29 Apr 2026 17:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777508454; x=1778113254; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0RTwfNj95QqHLZW0aC4WBqaPiLkBNy0HzcOhZ7iUdX0=;
 b=FCdK4akv2qoju3VjqkGQKs+uPvPsX6Cal+i7U/9e3c9XSLHQW6S7O9b3yMJffeRNm1
 xA02O1DS21AnXtk7bRSH4nfN4fSAVq5Hk+ASm5L9nss4wArVq673LrLcwgrz9+3C6v5b
 835v1HpYjtPPQoONxlJf0phzll2n4tiFO3hcOCG94tAps2bm96khB26J+MbqW+LCMjCa
 cN6N2qhLeGzADulxCwstKyY35PPN1wSL/iiNCX9gFG6MNZE8GlfRc30IabfX0gITUmHf
 BUD/IhXJMIpcaUm/kHdLvF+UERJtjCwWYvFQbPDBTuL8X4ZUgofuQz89NVEjM45mTbhd
 UBNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777508454; x=1778113254;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0RTwfNj95QqHLZW0aC4WBqaPiLkBNy0HzcOhZ7iUdX0=;
 b=Ll/rzJc61/z1Cwfu1WzVUidNzXQMzgLySuKwQxyH9f164imUIXwBECZtJz5vOzBvfV
 FUP+ZAdIAifxT80BKsSxOD/ikDfeXh/33GBCU9sB6iaIb37gHiphch++WVl7UIa1T0gz
 TqKIXhsxb7MugsKJLBljbGPV8gVZs6E7ATuw4JLhOBeAQvqM73527QTEwNHBAeT+FJB1
 pY8akwDxMoWVSLv+f0C3+9YVZdVz4GB+6q5dmzLjmqAZMsnyyBGSEn0jwdDpSyz9aGNt
 r1BaTRDjm9LD94yYTR84oSoURgrAE6nd2dQLqCfwd+1ehS1RimU+7q7/61KDUeW3IwL4
 59+w==
X-Gm-Message-State: AOJu0YwNfYOaiZaUSn4oJBFDEVwSf8cAI3axEEaVsGU9q4cgOSmzV6Nw
 VQZPw+AxSbPUJ+0emfHTQyMza8uUhBIrkjaunQj1zLM53VLkxdB5M7+MlzemOLSePj0=
X-Gm-Gg: AeBDieuqUzz+wAiRiz0qUYhNQMC4KeJN3icZb9TObxMc380pnPhctOxPeROLbQFmwoE
 CrKYqrTIQRwQgyfJjNtqVs17Glc2ksApWKM/04yz6Tf+/j0/3g+vYDS2OqAkgROkLUfUlX/vX2+
 A4030fDhR23u5Yo+Erz/IU9YlioUK6YlyV5ap+ydWvOEtVXWSSxLWt1FtST9lcQsKy8i2gSG6yV
 x8A/KuCqBI3fFNax+4/RuyTGPEDOn7iSBeX67UPkkTSvDGrxzrEYqwX6EuGyE2kWFXcxgwwT+z5
 vRHUmu54bIC1vKDf4EOqdITzwO+7UnsqC8KFCwpJJp0g2gVTcWBPbV9MRq+p1ZynKMBekegGb4m
 0QSQP53yPaIdl/0gb5+ZnQ7G3IOgEBsfoBh9LEtmUuDiuGD56TxFMXnIP4O35DZZCfSyJbg7N4B
 +VdEJ10MPYKCbFncKVoZQVNZhAUFIRxKWS37BuBoU3
X-Received: by 2002:a05:6a00:4b4f:b0:82f:193f:807c with SMTP id
 d2e1a72fcca58-834fdb0a867mr880684b3a.2.1777508454460; 
 Wed, 29 Apr 2026 17:20:54 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-834ed5cd3b8sm3461727b3a.16.2026.04.29.17.20.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2026 17:20:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 01/47] target/arm: Implement ID_AA64ISAR3
Date: Thu, 30 Apr 2026 10:20:00 +1000
Message-ID: <20260430002046.59739-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430002046.59739-1-richard.henderson@linaro.org>
References: <20260430002046.59739-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
 target/arm/cpu-features.h    | 9 +++++++++
 target/arm/helper.c          | 8 ++++++--
 target/arm/cpu-sysregs.h.inc | 1 +
 3 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 6e5212ff6c..d442bb98eb 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -244,6 +244,15 @@ FIELD(ID_AA64ISAR2, CSSC, 52, 4)
 FIELD(ID_AA64ISAR2, LUT, 56, 4)
 FIELD(ID_AA64ISAR2, ATS1A, 60, 4)
 
+FIELD(ID_AA64ISAR3, CPA, 0, 4)
+FIELD(ID_AA64ISAR3, FAMINMAX, 4, 4)
+FIELD(ID_AA64ISAR3, TLBIW, 8, 4)
+FIELD(ID_AA64ISAR3, PACM, 12, 4)
+FIELD(ID_AA64ISAR3, LSFE, 16, 4)
+FIELD(ID_AA64ISAR3, OCCMO, 20, 4)
+FIELD(ID_AA64ISAR3, LSUI, 24, 4)
+FIELD(ID_AA64ISAR3, FPRCVT, 28, 4)
+
 FIELD(ID_AA64PFR0, EL0, 0, 4)
 FIELD(ID_AA64PFR0, EL1, 4, 4)
 FIELD(ID_AA64PFR0, EL2, 8, 4)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7e7677a584..66813bb298 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6498,11 +6498,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_tid3,
               .resetvalue = GET_IDREG(isar, ID_AA64ISAR2)},
-            { .name = "ID_AA64ISAR3_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+            { .name = "ID_AA64ISAR3_EL1", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 3,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_tid3,
-              .resetvalue = 0 },
+              .resetvalue = GET_IDREG(isar, ID_AA64ISAR3) },
             { .name = "ID_AA64ISAR4_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 4,
               .access = PL1_R, .type = ARM_CP_CONST,
@@ -6731,6 +6731,10 @@ void register_cp_regs_for_features(ARMCPU *cpu)
                                R_ID_AA64ISAR2_BC_MASK |
                                R_ID_AA64ISAR2_RPRFM_MASK |
                                R_ID_AA64ISAR2_CSSC_MASK },
+            { .name = "ID_AA64ISAR3_EL1",
+              .exported_bits = R_ID_AA64ISAR3_FAMINMAX_MASK |
+                               R_ID_AA64ISAR3_LSFE_MASK |
+                               R_ID_AA64ISAR3_FPRCVT_MASK },
             { .name = "ID_AA64ISAR*_EL1_RESERVED",
               .is_glob = true },
         };
diff --git a/target/arm/cpu-sysregs.h.inc b/target/arm/cpu-sysregs.h.inc
index 3d1ed40f04..b99579f773 100644
--- a/target/arm/cpu-sysregs.h.inc
+++ b/target/arm/cpu-sysregs.h.inc
@@ -10,6 +10,7 @@ DEF(ID_AA64AFR1_EL1, 3, 0, 0, 5, 5)
 DEF(ID_AA64ISAR0_EL1, 3, 0, 0, 6, 0)
 DEF(ID_AA64ISAR1_EL1, 3, 0, 0, 6, 1)
 DEF(ID_AA64ISAR2_EL1, 3, 0, 0, 6, 2)
+DEF(ID_AA64ISAR3_EL1, 3, 0, 0, 6, 3)
 DEF(ID_AA64MMFR0_EL1, 3, 0, 0, 7, 0)
 DEF(ID_AA64MMFR1_EL1, 3, 0, 0, 7, 1)
 DEF(ID_AA64MMFR2_EL1, 3, 0, 0, 7, 2)
-- 
2.43.0


