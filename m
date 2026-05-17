Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 040B5CD4F3C
	for <qemu-arm@archiver.kernel.org>; Sun, 17 May 2026 00:35:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOPSk-0008J9-Sg; Sat, 16 May 2026 20:34:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPSD-00077n-JZ
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:34:10 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPS9-0006rM-ED
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:33:59 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-c80203b9d7bso365587a12.0
 for <qemu-arm@nongnu.org>; Sat, 16 May 2026 17:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778978036; x=1779582836; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mgEG0/OuigOMwClChXrRoaFDD6e1qpvZV0h5+lZSYqk=;
 b=F143ZbtK8N41FeX/AFv2QiUYa1keMqblQk2X0ohapQs658zJuX7AB85sEA8em9VBxj
 5wgwKzlH7WnlcsvhfDmey97xbP8SD3cGRuV9d5IZYXB/hP7Bll+7mfB9y2YdfYBnKZJe
 UHD9WXUXhQXfesL+Ijw1Dp8Fu0uFRbdX0TQpZC2WEz+6gmz3kow1/o34uZ40Gqw4fchK
 NZBe8fvfY61WwfG2vFTaGo661sTxnsOYA72KgLW/cFdPWdopETh5BDBsVSxWgbd39Oz+
 jqT9ZVjsJJrHVb2phyvWxGuVgdhz+iJW5uPZOznN+kEyiVnSb2T70RDFPAgNeNRMHtTS
 gXVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778978036; x=1779582836;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mgEG0/OuigOMwClChXrRoaFDD6e1qpvZV0h5+lZSYqk=;
 b=WpY+4Gh76m0JHd9ktfsFgtjzz/L6TeinS4plrkNLoKFhu25f1IbtFkqB9/HWmOPJfC
 0PU1XXu1ZBra4MCiB/CKoHoFX4LqdLJBYW9HG70EhXPcRjHAHBo+fruPwgj/gIonJx+1
 T0iL6EEMO1j/Q4HPZulrNlwBq+wLCHgeRTWAACzIONJwX8lD/b2iJMnIUurTvCgCmkOq
 zccqlwQfjrS28XYGNRjDR/Q77qNV3fLJla5SLqtMA7a5l0yApImHMYPMhx04097yir3X
 jz277a21PU6R1L+spVWT2VMES8brtZedK6PbVZ1EMhcBsfKYGfttEEujWwtpw0DboDhB
 1cuQ==
X-Gm-Message-State: AOJu0Yy7l8FeiOyiTJNNNoYifzgAXOS2tJNV9Q6Ovvb4ijiuSA4xR25y
 648PMrsCEw69lnOTCJCi4z+LyI3wU5kQ8r1Rn7vu3uE51vQeEqo8feGq/9lJodjESFeNVvl7wX7
 ozKvq
X-Gm-Gg: Acq92OFNM2R8UF7yAfT19OzWeDG2IJBU5n5Y/lmh70iUa05Tr1O6tfzoc4Cp9/MEg7/
 tJ/Tww+oxzOxreUE9eIgNeyiGKoj8jAGUR8nXa8Erj8nkUrZ2VCpAdEMLko7d6ZaUNKTd/ghyfm
 9OngcxZ+M4A3hXDGeJQAabkQ4/7oH6jVFyz9GRLyokDEKHmGVi1k1ES1mbhFhsu8VsegLFJAv8i
 SFvDkdz6Wwf7a1+dXVkt4i8z+dwBmOpfVnjelswN5P63JB+FS3Rbfcr5uEPI8jHqbd5vg2b8Ah/
 ZxtRMOD52gha2wUQY4CzUoTIQ1sDhUX5Ydxhovht8GAXPP5gBlVFcJr8rtx8QohdrGIrY5vMQdg
 uSbqJGa2ZUKyTbwiA8N5wgbziCB71kN85mjUQO6owf8nH1nnIxXblapm9ktqbNPurhGYcS83Z9u
 zJ2TVIi/GXt97eVuj6TvWrliQuXADQ
X-Received: by 2002:a05:6a21:3291:b0:3a8:284c:fa3b with SMTP id
 adf61e73a8af0-3b22ee23dd0mr11102165637.48.1778978035740; 
 Sat, 16 May 2026 17:33:55 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c82da93df0dsm3010559a12.19.2026.05.16.17.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 May 2026 17:33:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 55/63] target/arm: Enable FEAT_FP8DOT2,
 FEAT_SSVE_FP8DOT2 for -cpu max
Date: Sat, 16 May 2026 17:29:54 -0700
Message-ID: <20260517003002.321430-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260517003002.321430-1-richard.henderson@linaro.org>
References: <20260517003002.321430-1-richard.henderson@linaro.org>
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
 target/arm/tcg/cpu64.c        | 2 ++
 docs/system/arm/emulation.rst | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 6dec7e045d..a43b6367a4 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1377,6 +1377,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     SET_IDREG(isar, ID_AA64DFR0, t);
 
     t = GET_IDREG(isar, ID_AA64SMFR0);
+    t = FIELD_DP64(t, ID_AA64SMFR0, SF8DP2, 1);   /* FEAT_SSVE_FP8DOT2 */
     t = FIELD_DP64(t, ID_AA64SMFR0, SF8DP4, 1);   /* FEAT_SSVE_FP8DOT4 */
     t = FIELD_DP64(t, ID_AA64SMFR0, SF8FMA, 1);   /* FEAT_SSVE_FP8FMA */
     t = FIELD_DP64(t, ID_AA64SMFR0, F32F32, 1);   /* FEAT_SME */
@@ -1397,6 +1398,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = GET_IDREG(isar, ID_AA64FPFR0);
     t = FIELD_DP64(t, ID_AA64FPFR0, F8E5M2, 1);   /* FEAT_FP8 */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8E4M3, 1);   /* FEAT_FP8 */
+    t = FIELD_DP64(t, ID_AA64FPFR0, F8DP2, 1);    /* FEAT_FP8DOT2 */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8DP4, 1);    /* FEAT_FP8DOT4 */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8FMA, 1);    /* FEAT_FP8FMA */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8CVT, 1);    /* FEAT_FP8 */
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index bee4e36dc6..875716d18f 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -75,6 +75,7 @@ the following architecture extensions:
 - FEAT_FP (Floating Point extensions)
 - FEAT_FP16 (Half-precision floating-point data processing)
 - FEAT_FP8 (FP8 convert instructions)
+- FEAT_FP8DOT2 (FP8 2-way dot product to half-precision instructions)
 - FEAT_FP8DOT4 (FP8 4-way dot product to single-precision instructions)
 - FEAT_FP8FMA (FP8 multiply-accumulate to half-precision and single-precision instructions)
 - FEAT_FPAC (Faulting on AUT* instructions)
@@ -161,6 +162,7 @@ the following architecture extensions:
 - FEAT_SME_F64F64 (Double-precision floating-point outer product instructions)
 - FEAT_SME_I16I64 (16-bit to 64-bit integer widening outer product instructions)
 - FEAT_SME_LUTv2 (Lookup table instructions with 4-bit indices and 8-bit elements)
+- FEAT_SSVE_FP8DOT2 (SVE2 FP8 2-way dot product to half-precision instructions in Streaming SVE mode)
 - FEAT_SSVE_FP8DOT4 (SVE2 FP8 4-way dot product to single-precision instructions in Streaming SVE mode)
 - FEAT_SSVE_FP8FMA (SVE2 FP8 multiply-accumulate to half-precision and single-precision instructions in Streaming SVE mode)
 - FEAT_SVE (Scalable Vector Extension)
-- 
2.43.0


