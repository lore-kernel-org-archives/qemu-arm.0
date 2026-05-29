Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6483DCD6E49
	for <qemu-arm@archiver.kernel.org>; Fri, 29 May 2026 19:53:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wT3Gi-0005F6-Dn; Fri, 29 May 2026 15:53:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wT3GS-0004xY-BN
 for qemu-arm@nongnu.org; Fri, 29 May 2026 15:53:06 -0400
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wT3GQ-0005XL-FH
 for qemu-arm@nongnu.org; Fri, 29 May 2026 15:53:04 -0400
Received: by mail-oo1-xc33.google.com with SMTP id
 006d021491bc7-69d8ff0ca12so4934679eaf.2
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 12:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780084379; x=1780689179; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=oDpWaDAEPKN3RkVcJKACHpjqaDngYGGItVQvZeumSHU=;
 b=nZMUy+NegTwL5JbhcP7XYOB/k+wt2d8s2dDV7HQpy23u2MUPXqQOc/YLeJ29yjccI0
 /X+e5EaRhi8Qc60aawHRfs/ggHxKRO4w/JWOWLtdt2p1/h5RVVpZJIdgh0sMrPCwM0uU
 Ti1mKX4BMaSKVRv5pI+6OLqIsSRXndhvgwErdeWAgK9hrXDq0aQ8QLu6rD0AWD9hBvnD
 83piKQ2+IoH5Cl8l5mwoWdj0a5AvN2cHIc6DKByKIvSpnxDG8Brck84jEVULyVXiJJDN
 PI5N1BAEi2vLMLw47DBruyR9qZ5cXVg/N+SEPBCRUzRkPUvtykUeqfWMo030YveKIzWB
 oCMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780084379; x=1780689179;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=oDpWaDAEPKN3RkVcJKACHpjqaDngYGGItVQvZeumSHU=;
 b=ejUNDoSNpEkEehNfoyaUSBGoj4/8/i7rfFB3DXNw9gogA3Y4R618TKJfAfnmVw8Rcx
 qlJQScCysypvzGqw+Ah0ibD8azBHKIPn0LsNlXplfG1zIBjQt3btvNgEjB9kPtJviL+d
 aNqcTcSSJ4Ek86VsFp86P2BJ2k3fLSd2AH9Ndq9jev3/x3B6Wc+JvXmymCCxuWVnnX4Z
 ILKqacVm00n6vHv9V55HwstfZwwg3VXBNuPpLva0EGfbiBlKA3inDA4VrEYoUTvs/vDu
 FECCmEE95olD652aqVwIwBtASFPAHhhA/TlVeiufaqQIni1iR+uzMmUX6zjkWGwGxtdZ
 41Hg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+m50dkwBaey8RZBOP7L0TCkH+04eotKsYe2LHABcAwvOx/Oat4RmLvUsU/+QAjLMFm61g5C0CDFA==@nongnu.org
X-Gm-Message-State: AOJu0YznRxCySKpHMiFgl1iLkggPzbpDnVZIOjENgTjbFo2lBA1p2pAs
 V1NVZsTaHAcN+Ui41dwNPNkFhrnZ3qIYPSCBMOMsstpQlRSxNTIWtc9K
X-Gm-Gg: Acq92OGW3C3PUOBW6IIYauxIbfxNrY5kMbi/1Sb7NdWjiimuMSPLJLwuuLVuK+Zs7+f
 uCnJFb6aSc5F78u9UHNedDyQKEUF/GIMKcGVMRN3vzy0y+QH1i+b/TwBTTGzDvS18/u1cr3Ygk8
 AFXzMPsFKatU0Hi+e2CSW9ZwSXW/szVv0T8/jNJcFGrkzOU0y5VyVYF8ZwGFke0dEMSTgImZwAm
 b59/nQcjlQ4azB2SEurSEHCqd3K1SD+9Xi4Pjh8jGcpm9JH/aPqZITYMhHowVj11qDRIWrzjGqM
 NsaDURbtoT+4u9eVzGNCFlg82nE0B9TplWtNuFGvnY1YDlstCCLmbCkVAmm/upcp+zO+jD7LsQF
 GNfcIXfFJGJM6ec0CwAw2qcBh/ljQ4nD6YRb9NEUm17VKREigBoe9u6+zXJmN4Gp4ztKH04E7tB
 OdAIF4EDumRFy4NyPbwIJ/bkjcbm3Jy5vx8KiWGv9Pih0BgVsQpeXT+w==
X-Received: by 2002:a05:6820:8c8:b0:69d:fa9f:87c2 with SMTP id
 006d021491bc7-69e104a732bmr416915eaf.24.1780084378974; 
 Fri, 29 May 2026 12:52:58 -0700 (PDT)
Received: from [10.21.163.79] ([146.74.94.63])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-69e06587eecsm1626692eaf.0.2026.05.29.12.52.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 12:52:58 -0700 (PDT)
From: Gabriel Brookman <brookmangabriel@gmail.com>
Date: Fri, 29 May 2026 12:52:42 -0700
Subject: [PATCH v7 02/15] target/arm: add TCSO bitmasks to SCTLR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-feat-mte4-v7-2-ccbd3c14eb3c@gmail.com>
References: <20260529-feat-mte4-v7-0-ccbd3c14eb3c@gmail.com>
In-Reply-To: <20260529-feat-mte4-v7-0-ccbd3c14eb3c@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>, 
 Gabriel Brookman <brookmangabriel@gmail.com>, Helge Deller <deller@gmx.de>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780084373; l=3108;
 i=brookmangabriel@gmail.com; s=20251009; h=from:subject:message-id;
 bh=huILfrJwVD2l0b9pcRxdCcvWAGfLEbWnfZgOCDiNqEs=;
 b=P43E8/9nhKW2MQT+J5O7l8vSD1Y3GoPDA9ZMxhg968EpzQ3eLoAqvdZ3QgHRaKo8+Kr9L4Fcl
 WTIHYHUQsTrC+Rw7kLQDVf3xjjIJUn9U11m/dvYwB6cbLCDNLbnzosI
X-Developer-Key: i=brookmangabriel@gmail.com; a=ed25519;
 pk=m9TtPDal6WzoHNnQiHHKf8dTrv3DUCPUUTujuo8vNrw=
Received-SPF: pass client-ip=2607:f8b0:4864:20::c33;
 envelope-from=brookmangabriel@gmail.com; helo=mail-oo1-xc33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

These are the bitmasks used to control the FEAT_MTE_STORE_ONLY feature.
They are now named and setting these fields of SCTLR is ignored if MTE
or MTE4 is disabled, as per convention.

Signed-off-by: Gabriel Brookman <brookmangabriel@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-features.h |  5 +++++
 target/arm/cpu.h          |  2 ++
 target/arm/helper.c       | 20 ++++++++++++++------
 3 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 9451df3813..0708e4c7d6 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1186,6 +1186,11 @@ static inline bool isar_feature_aa64_mteperm(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64PFR2, MTEPERM) >= 1;
 }
 
+static inline bool isar_feature_aa64_mte_store_only(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64PFR2, MTESTOREONLY) == 1;
+}
+
 static inline bool isar_feature_aa64_sme(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64PFR1, SME) != 0;
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 85552b573c..d9c03c9c2e 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1468,6 +1468,8 @@ void pmu_init(ARMCPU *cpu);
 #define SCTLR_EnAS0   (1ULL << 55) /* FEAT_LS64_ACCDATA */
 #define SCTLR_EnALS   (1ULL << 56) /* FEAT_LS64 */
 #define SCTLR_EPAN    (1ULL << 57) /* FEAT_PAN3 */
+#define SCTLR_TCSO0   (1ULL << 58) /* FEAT_MTE_STORE_ONLY */
+#define SCTLR_TCSO    (1ULL << 59) /* FEAT_MTE_STORE_ONLY */
 #define SCTLR_EnTP2   (1ULL << 60) /* FEAT_SME */
 #define SCTLR_NMI     (1ULL << 61) /* FEAT_NMI */
 #define SCTLR_SPINTMASK (1ULL << 62) /* FEAT_NMI */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 34487eeaa3..6210e3abec 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3297,12 +3297,20 @@ static void sctlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 
     /* ??? Lots of these bits are not implemented.  */
 
-    if (ri->state == ARM_CP_STATE_AA64 && !cpu_isar_feature(aa64_mte, cpu)) {
-        if (ri->opc1 == 6) { /* SCTLR_EL3 */
-            value &= ~(SCTLR_ITFSB | SCTLR_TCF | SCTLR_ATA);
-        } else {
-            value &= ~(SCTLR_ITFSB | SCTLR_TCF0 | SCTLR_TCF |
-                       SCTLR_ATA0 | SCTLR_ATA);
+    if (ri->state == ARM_CP_STATE_AA64) {
+        if (!cpu_isar_feature(aa64_mte, cpu)) {
+            if (ri->opc1 == 6) { /* SCTLR_EL3 */
+                value &= ~(SCTLR_ITFSB | SCTLR_TCF | SCTLR_ATA | SCTLR_TCSO);
+            } else {
+                value &= ~(SCTLR_ITFSB | SCTLR_TCF0 | SCTLR_TCF |
+                           SCTLR_ATA0 | SCTLR_ATA | SCTLR_TCSO | SCTLR_TCSO0);
+            }
+        } else if (!cpu_isar_feature(aa64_mte_store_only, cpu)) { /* not mte4 */
+            if (ri->opc1 == 6) { /* SCTLR_EL3 */
+                value &= ~SCTLR_TCSO;
+            } else {
+                value &= ~(SCTLR_TCSO | SCTLR_TCSO0);
+            }
         }
     }
 

-- 
2.54.0


