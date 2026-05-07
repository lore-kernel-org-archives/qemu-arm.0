Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA05CD3445
	for <qemu-arm@archiver.kernel.org>; Thu,  7 May 2026 23:47:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wL8OP-0000Kw-In; Thu, 07 May 2026 19:44:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8ON-0000Jb-EN
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:44:31 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8OL-00013R-T6
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:44:31 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-7dcd89701acso1337203a34.1
 for <qemu-arm@nongnu.org>; Thu, 07 May 2026 16:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778197469; x=1778802269; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XfEjDJlVu7LsFiNptc3UAEkKV/ApJAH3Ld019vvaP5k=;
 b=n6/KV6XpZ8K0fWEj+qch0vsWpg/JGw2qvEG39PPwfDigPEqTKmMT1DlotgYLakliOG
 1hTmoa8rtsYXQD9mnZ6ozDsuzKGS9fRp5OKoR0/WaSKH5t0LIZilvaV+nHtCPheSZTY5
 GCyO8s8pY3v3SNUMNF0+gFj0bV+vVdk4aGCgDpWuyfKzad1AXI+R2rWpaUBMZTGb5ffL
 FgumeGBXIdfXQXOOTpRiCdldm+EQG9TFnzNbt/X5Xc3JNuVG4LldBz5YUFsgd9Lv4v5+
 MLNt4h3awDpnLEbhCiiww9QK5cPUc/tux6kI4O/nr9QpnwtcVMTsXYoYxPQO5+EQG4hq
 MPTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778197469; x=1778802269;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XfEjDJlVu7LsFiNptc3UAEkKV/ApJAH3Ld019vvaP5k=;
 b=LP5y/29KrX0qFU2qy3XdXRjXsWZwI+EtKuuRMmnXDGs9EDZJISVqkQAkl18nYFUZa4
 0y+mEEhKNX9n9mqkWdlKnHbdK6uCVTJyJXh0jWKfs9TklaEpg2wzRt/DHnuEtV3dsTlS
 NJRQgZyjQaKoUaD6KWbtX6tKdnckkCAcQJc5jEnvtrzWENybdqufJOKN4GIY1zwH1Odm
 jXWTe+S8UhLAzHrm99pfRy1cv2XgJ7/jH+5EQ0jisxUIRwNifH+a7lb1podcW6WF4fuS
 iouKPLtfKbw7VFKXeLubIVFMw6pHjS6yr4nnLVMtsWK87FBw5Yah/Z99YSiLylN97/5W
 5jdA==
X-Gm-Message-State: AOJu0YwOHjkrZEGQQtniI1FjbIRVBnarBER1GJI8mXQVmaWj3Tu/oFnl
 WVopaYg0pZUgep5hzypr4CvWxM63WJdjkAVVNoumCwdsclrMcljFhb1Ybvt2dD+PnmQ=
X-Gm-Gg: AeBDiesF8lOqzwKsNWVjg0QT+8bzY4bRb7HeI/nkutUY2dWoT16VcOohtmSRDkOWrA2
 yMNEpgs7o+A4n09Si6WlWucuDMJEzZD/+hzjBl/hxx4UnYL2cFoaSbOKSXlzdDy8wqtMz229zBZ
 3x/H4NOeXrT79aLGtjNWHLWjm43GymVO0gwA36w/75Y7dzXYJMX3Kl3FSqeLou95t8TKtz03XwW
 h/3CwF79nwckZ/6iQiwR0DBPpJaxDC2D3Vgxa6wGkrKVwu2wUQ0fbTmCfiJYjMkWGYQk/T83qW4
 ziUIp29kDHv3La8H9hKmby790ZV69DNc05siNxAzAt44GepOGppyxqpPtgHNLV1ez4RQTpI2jHy
 ktWoq+P0K5P3lmY8m1oB1JA5hIYU69s7FD8QIs9L3x6W+opdDP2tHdfLXtWH/SZvd8vSTvO4rMo
 yWRs/Xdxy9Tn/NBGjZHISL+/l45cvL/bBGQ3LMAKCfGuDaow==
X-Received: by 2002:a05:6830:44aa:b0:7d9:7209:4378 with SMTP id
 46e09a7af769-7e1df050633mr6154398a34.17.1778197468779; 
 Thu, 07 May 2026 16:44:28 -0700 (PDT)
Received: from stoup.attlocal.net ([2600:381:c938:6375:9641:bbb2:a93a:bb4c])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7e367d8feb1sm84320a34.23.2026.05.07.16.44.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 16:44:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 15/60] target/arm: Enable FEAT_FPMR for -cpu max
Date: Thu,  7 May 2026 18:43:28 -0500
Message-ID: <20260507234413.643512-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260507234413.643512-1-richard.henderson@linaro.org>
References: <20260507234413.643512-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32f.google.com
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


