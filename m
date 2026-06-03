Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09987CD6E6A
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Jun 2026 03:31:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wUcIJ-0006vN-Aj; Tue, 02 Jun 2026 23:29:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wUcI7-0006jq-PO
 for qemu-arm@nongnu.org; Tue, 02 Jun 2026 23:29:15 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wUcI6-0003hS-5S
 for qemu-arm@nongnu.org; Tue, 02 Jun 2026 23:29:15 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-84226d0f1d2so2595391b3a.1
 for <qemu-arm@nongnu.org>; Tue, 02 Jun 2026 20:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780457353; x=1781062153; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LwM2p9I/SON4IwZR4K/Mk/coaIyxRCDMbGetn6Pf8BM=;
 b=hJj0ycZA9s03MPQ9PnDSYllkFjbzB0cfpDJz0/GOdwzxIYCJHgalkZkaD20VPTlZLs
 yJKU+cgEU6jLANGF9kfZiufiFfubwFYYv5VS05LGfXEV6dEPi8WZZ0kQCsMMq/cTFRuL
 dcK3fslHZ03ObFRN/ccyLl5eb9MeOFPfyaXkMZNa9v6Jcp91ZKVIP5UpUbB+HoQGxvPv
 b8atQV3sBMeU5RDdzapFBqt2VzXNX8RRqURCxbeua99kzEat1WCf4K/DmNtmSzMO9tt1
 W70g23igx3IFhyH9uoHyC2SmVUAlFfr9PIU6DBQfrCaNdOTir5uYQEA8prFMeOQUJsg5
 QKZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780457353; x=1781062153;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LwM2p9I/SON4IwZR4K/Mk/coaIyxRCDMbGetn6Pf8BM=;
 b=V14E+QYJePDvjEIf3JEQWpH9eMPRikXG+EH7jsuP7jhTTxi2LtD+ACqC7XdSXDXbsx
 KadO0U+F6y106jlXkmjUSrphEUmenyXIGce3l6UTmuQdIOYA5P5OMrnFs+fzrFVDjyNw
 zaOJTenQzxciDobudijjn1tA4ZrB16b+KL6TjfhTeuEb4Aa0ysbHnYG2EmyC8BLQKlId
 RafCl1HWa4FrUF0s8JLPnVHRG4jk6QEvvc/gt7n3gc0LsM0WwFftagyxPIvYLkSAz9rB
 Xgq+HuethBCqigdwgcOZ3ne8wET+wVoA8CYBUdhyA1G9gpZa9QUsmW7aPBgNR9AfrlfE
 5AKw==
X-Gm-Message-State: AOJu0Yy/fLpUDzuOIBGKpZrwe2M7vS48mNV48Sr/AG6N+0F5NVpG5310
 tHWQorEwKOAbHSMEuXI5mvFvRB31ZSEdGVNAmBOz1N6U3mO4WqjrgvBxfVUt3wVklKE=
X-Gm-Gg: Acq92OHLmkyjXIv5iFwcGnpCGp5UWEhoOQlrpShVYjpL0qY16ucHtPhn2oyUDrHS4S0
 ayCQ2rIeYFlk/CqbHhVc9eR0gNpj5hcMstbjp4/BuQcE3vyscwdknNUH+rOgm4htr+VIbqIFAaK
 XywpAwx6JVCPF+zplLA4roseNs6YLy7hIMqC2qZ1g/4c92KhZp7qGzFcCF58ZrVF0oOgW1clhBe
 IHjeDvpLH1z+RYkZ1do/H3ILtneyicQAqv94qWNrPY+ONNbwkd8FKvy6yctLNLgKT0zzNiON6Z/
 uOEshTykP94knXaQlTzJznRL0NPsSzsFHchVkdlsLOfjFAO8zaWsCKxKfVlYs/nX4AOxhjHZ2nR
 s4FnxKsI183/G1KWehWQLptJrnRiAjjk3V/cMj770OXi99iC2J3oLxBhdawNlC5tqUmFDXgzGGu
 nP4OnMJakNt6YM2pdxGyQP9pzvTsR/zzPe55pcjnpWsvYH1ZnbBQ==
X-Received: by 2002:a05:6a00:2e99:b0:842:3f9e:a72f with SMTP id
 d2e1a72fcca58-84284d5a526mr1590086b3a.3.1780457352611; 
 Tue, 02 Jun 2026 20:29:12 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8428222263dsm1477831b3a.2.2026.06.02.20.29.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 20:29:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v9 23/45] target/arm: Enable FEAT_LUT for -cpu max
Date: Tue,  2 Jun 2026 20:28:32 -0700
Message-ID: <20260603032855.106930-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603032855.106930-1-richard.henderson@linaro.org>
References: <20260603032855.106930-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
 linux-user/aarch64/elfload.c  | 1 +
 target/arm/tcg/cpu64.c        | 1 +
 docs/system/arm/emulation.rst | 1 +
 3 files changed, 3 insertions(+)

diff --git a/linux-user/aarch64/elfload.c b/linux-user/aarch64/elfload.c
index 228b593316..5ed7a7badb 100644
--- a/linux-user/aarch64/elfload.c
+++ b/linux-user/aarch64/elfload.c
@@ -221,6 +221,7 @@ abi_ulong get_elf_hwcap2(CPUState *cs)
     GET_FEATURE_ID(aa64_lse128, ARM_HWCAP2_A64_LSE128);
     GET_FEATURE_ID(aa64_faminmax, ARM_HWCAP2_A64_FAMINMAX);
     GET_FEATURE_ID(aa64_fpmr, ARM_HWCAP2_A64_FPMR);
+    GET_FEATURE_ID(aa64_lut, ARM_HWCAP2_A64_LUT);
 
     return hwcaps;
 }
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 1a4f50486d..39dc769a04 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1263,6 +1263,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64ISAR2, BC, 1);       /* FEAT_HBC */
     t = FIELD_DP64(t, ID_AA64ISAR2, WFXT, 2);     /* FEAT_WFxT */
     t = FIELD_DP64(t, ID_AA64ISAR2, CSSC, 2);     /* FEAT_CSSC, FEAT_CMPBR */
+    t = FIELD_DP64(t, ID_AA64ISAR2, LUT, 1);      /* FEAT_LUT */
     t = FIELD_DP64(t, ID_AA64ISAR2, ATS1A, 1);    /* FEAT_ATS1A */
     SET_IDREG(isar, ID_AA64ISAR2, t);
 
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 18c6355967..dc20632097 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -102,6 +102,7 @@ the following architecture extensions:
 - FEAT_LSE (Large System Extensions)
 - FEAT_LSE2 (Large System Extensions v2)
 - FEAT_LSE128 (128-bit Atomics)
+- FEAT_LUT (Lookup table instructions with 2-bit and 4-bit indices)
 - FEAT_LVA (Large Virtual Address space)
 - FEAT_MEC (Memory Encryption Contexts)
 
-- 
2.43.0


