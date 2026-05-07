Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 019DDCD37A7
	for <qemu-arm@archiver.kernel.org>; Thu,  7 May 2026 23:51:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wL8S9-0007zg-K1; Thu, 07 May 2026 19:48:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8S2-0007Uh-Hz
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:48:19 -0400
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8Ry-0002Av-Aj
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:48:17 -0400
Received: by mail-oo1-xc33.google.com with SMTP id
 006d021491bc7-66ee7b9af94so670155eaf.0
 for <qemu-arm@nongnu.org>; Thu, 07 May 2026 16:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778197691; x=1778802491; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PuGasVrTDp5bV7ix67mPvlZpXL4SBKk180Og/sZBgEE=;
 b=Uh1dPXSS5M77rtXVaCs93QYqmWYBnx6QfD53DZAEOCPP8MHmV1l5Ico19VTOOQcmIF
 4qjy+4SAeFJanN3uoW3sXztqf5M0ydUJinAxpYX8gwgQWwwAT+8cXPC9IZ/fzB9KaCMZ
 hqg+090l2IJE6nHGtN3MqBp1/d/XNLxndK+upeyr36lZpgxCeNsoHw7F7sC2hbxtSIVX
 aUeJK/sKYBp3+oYXsZrTgrPmxihFX/jp6JzXPJ1gJ4wKX31sgD5UP+Rb4780/u+p93K/
 VLaiuizcnr6NNL/hrfPQpetrgAwayECuMaJCDI3Q+N16PJbVSOmSJzCESFMPvLqOJz3J
 RScg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778197691; x=1778802491;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PuGasVrTDp5bV7ix67mPvlZpXL4SBKk180Og/sZBgEE=;
 b=aVJ1jd9/tVwTX4drHGdIyGwmwGXM8d0fyoHMTvKfzv2ayydbziysqBxdAeVyJyR5cB
 PP3VFRc7QQC+iF6AKiNYsNKbxvVOO4tvnZLwpkXyKu4z73lQK3fliaTCzSnR2wfNr0ik
 +4SnBcUbp3fr4CHDySYOCR7reHBlv3MuIDOchageQ2WPJyYnissVMN3hfPOHBZGkVYlQ
 Hh5TPzvbKXbQAdCUCNuIrM2tLzkSRGIYGYBvNm8Rzdp/bnPJpUxQzk8cYD8c2iNGT/E8
 fqKRBrgMcLssRL/q9htk9H5g2ZZftIo4/XPjVw3n4Beq+eUhSVLZAaGY+zUwn5wj1Njt
 dr4w==
X-Gm-Message-State: AOJu0YyjXmNxOHvIs+WOv5hllNc5O6QCo6fSK48v0H/zmoy47rhC8y2x
 Qs4oCWDPZ9Le3lxmTL7j3LoD+Ni3yYohPHMQORKev04z7heI6QukN4L/ZIKgcxv3ZTo=
X-Gm-Gg: AeBDiethsZQGKhxptHAB9jhaYsok7qB2OxAtI7QuHtUm+uZc2ZRsHd/BxGo78waULiX
 fPfErGH6YZz1GicRrcL/cn7ijdk/XtXCrkEeJnn/fM/FQMBPbNT7dcD6HbmzWrVBg9m9zUqwpxS
 FbxGWuyE9BMS6qrpbQCyI56Mlz4SPt1NGJd8mEtkiIAxs7yAM6gBzeqce4XIeO808XsZkxIeOSM
 MBl/r1iJsszK23gZ8D9Z8z2i4rndxFx0EjS3P4X3kbeJiMV7wYxyKje9qW7VEbMb0Xk5O1zl5NX
 JF1tec1lvCavoy2UJwRU+EWztGs/eYuYi8kI+0L1VzgzLeCejEX1EChpBE5Is8PKS9LSAfZ/4tB
 VUGlvzozpmA2G4iKvh1Tr/Wo5faGdM3G4YYuGRYqUsLbNjgoId0EiS6LuMuQANFQkAZPhvB/6zY
 br5hOnEa7aUjMPpCbUAwIHCLOVUlb96FeIcAasNab3PoXEFA==
X-Received: by 2002:a05:6820:4c0e:b0:694:a362:e3ba with SMTP id
 006d021491bc7-69998d32a61mr5811684eaf.48.1778197691382; 
 Thu, 07 May 2026 16:48:11 -0700 (PDT)
Received: from stoup.attlocal.net ([2600:381:c938:6375:9641:bbb2:a93a:bb4c])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4355736f517sm242730fac.12.2026.05.07.16.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 16:48:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 57/60] target/arm: Enable FEAT_F8F32MM for -cpu max
Date: Thu,  7 May 2026 18:44:10 -0500
Message-ID: <20260507234413.643512-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260507234413.643512-1-richard.henderson@linaro.org>
References: <20260507234413.643512-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c33;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc33.google.com
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
 target/arm/tcg/cpu64.c        | 1 +
 docs/system/arm/emulation.rst | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index a43b6367a4..7a47af9f5a 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1398,6 +1398,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = GET_IDREG(isar, ID_AA64FPFR0);
     t = FIELD_DP64(t, ID_AA64FPFR0, F8E5M2, 1);   /* FEAT_FP8 */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8E4M3, 1);   /* FEAT_FP8 */
+    t = FIELD_DP64(t, ID_AA64FPFR0, F8MM8, 1);    /* FEAT_F8F32MM */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8DP2, 1);    /* FEAT_FP8DOT2 */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8DP4, 1);    /* FEAT_FP8DOT4 */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8FMA, 1);    /* FEAT_FP8FMA */
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 875716d18f..83967da12d 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -66,6 +66,7 @@ the following architecture extensions:
 - FEAT_EPAC (Enhanced pointer authentication)
 - FEAT_ETS2 (Enhanced Translation Synchronization)
 - FEAT_EVT (Enhanced Virtualization Traps)
+- FEAT_F8F32MM (8-bit floating-point matrix multiply-accumulate to single-precision)
 - FEAT_F32MM (Single-precision Matrix Multiplication)
 - FEAT_F64MM (Double-precision Matrix Multiplication)
 - FEAT_FAMINMAX (Floating-point maximum and minimum absolute value instructions)
-- 
2.43.0


