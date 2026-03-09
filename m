Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65771FCA19B
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Mar 2026 22:02:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vzier-000389-14; Mon, 09 Mar 2026 18:01:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1vzief-00031F-D1
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 18:00:51 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1vzied-0004W0-03
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 18:00:49 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-79907171da2so9606057b3.2
 for <qemu-arm@nongnu.org>; Mon, 09 Mar 2026 15:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773093645; x=1773698445; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=R2GTUkTK3syvRsV4aCl7iuHoNdAbim4meKGMTmPdsDw=;
 b=C1j6PdCJpzbqciJ51l89fY090KIQVW0gUE8anuHF56dvUgdi1MQepuUHjkq2gUejvU
 JqOWzmLqxAoPmcpoC06IAIL9Fd5qlnb3LtTFXRM3GjRM03KTU9Fe8N2PBEXtd8vDKUHf
 aEPDUXnAMBqoix0/wXZxdnFS2nXNVS5UlKRwRnizFTbKVcieB5sB2uc7dPkrI4dTpNQP
 GdW6p2GsdF1DNmw8dxPfJPvsItGIu+TMTnw6B+npkn+zUM8tbB1AkrjdtSNtyNZn3Bq5
 fIUOMgu4nhFrJe12AFN7WQGDIeKce8HEOgqBiKb+CSQozw5QprFx0B+qMdjPB2VWaLbQ
 3Y2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773093645; x=1773698445;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=R2GTUkTK3syvRsV4aCl7iuHoNdAbim4meKGMTmPdsDw=;
 b=wNfPxKOFgPizoNjuIxD00mjrlGP3Me0KXWZq+3cTQB4aw8fHOxDbKFbnAxnkeasruM
 l+zvRGZG6cHE1VpXsfrNplTWa4LcQh7DrV/XEUe2Q3x6VMgbr3jJ4D0rce3GMcPYdG/W
 /ggpWIBFe4jwrphIO0Xs+EX/PvPyyo7kRRXt3TSdwOAYFMCMfK6T7NCR38aX6AEsgxe5
 j5sADOrKHchPyRZ4oHNqawkz6OHOEZ7q699cAeoqhy9E8LXA+id0BLAV/VXLLWVnJSRT
 rJO8ZsTV80a+kG/3tRtOg9ZF7qdowaPh22wqHZ8Hb2jBFuQCMt/z7Gy3sOZbcS5UM3LL
 o+Cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsYN9eJqZ+xag6lQ2tvl1x8Hft6rUCBj9FFZBDMFbiiP+esUgSxMHiTx35SU6CYKvKpOh/Ch2h9g==@nongnu.org
X-Gm-Message-State: AOJu0YxR2mhSRiA7igv8NKE7zE+IhlUTqkGuD2pF6TS9VbyKvdZuZGYd
 DDJrXukCD/j3qPudeBn/JBf9BELhWSgpvD3t5G2oZRaesRu6We7I5R7L
X-Gm-Gg: ATEYQzw3T8u8fP8jc2/dPCqv1v4E30EtdOcvr1kn+v7TYwOx3UGY+YAWCAhZDs8rwwa
 pC70om3PHKqWBANj/sXQ3iy9jOv47BSlRM96vQSxEIBQRPbXEsJD0s+8FzFNGf3V9C6sttZwKtH
 qqbZfUb7Eu1cvZGo/XhNXPwDB6RQZOfAZRmYKjm6Skc3GwVk34B5kYTFm7TPmDmp8Hruwg8IqPt
 w1gdwhUoGkIDBIzuwm6rXwAJHv3C3QOmWhLP4qK/B8hAaMZQfC54eJmkjWWC9nQqSNR16l54bW5
 ignxAv0KtpVRtPg8oE0TxAzNZ3DEX7mmtfCb3xcnoIW7KHjWZI+eeLS1+VY2vQUZm1v4FARKe1O
 d6VclEOZbAC0/gvcbJZOnHCfwczVgJXRkpYrDC7zYfrS2iVMGKIHMV4Nw18CNCXQo4LjLoDNqxe
 j9RmR4XQTsBrTsWPUvI0yoq9YW6yoWIRabWYkVyuGqTdS9dQ==
X-Received: by 2002:a05:690c:64c2:b0:797:d462:e39 with SMTP id
 00721157ae682-798dd6cffc8mr124704257b3.26.1773093645338; 
 Mon, 09 Mar 2026 15:00:45 -0700 (PDT)
Received: from [172.26.74.149] ([185.213.193.97])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-7990a54ba7csm5218437b3.19.2026.03.09.15.00.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2026 15:00:44 -0700 (PDT)
From: Gabriel Brookman <brookmangabriel@gmail.com>
Date: Mon, 09 Mar 2026 17:59:34 -0400
Subject: [PATCH v4 02/13] target/arm: add TCSO bitmasks to SCTLR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-feat-mte4-v4-2-daaf0375620d@gmail.com>
References: <20260309-feat-mte4-v4-0-daaf0375620d@gmail.com>
In-Reply-To: <20260309-feat-mte4-v4-0-daaf0375620d@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
 Gabriel Brookman <brookmangabriel@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773093641; l=3045;
 i=brookmangabriel@gmail.com; s=20251009; h=from:subject:message-id;
 bh=UYcYUXzYZV9LI6IlwZhtwtfFLmx7bEI5iNrJRDIRx2Y=;
 b=gEgRKjfHMPUyF5bjCXMFsSP/Cd5GpkzuPNXJTm57mHCTSgSFzDEmN9f8UkAgb8eylzsAnH+yT
 6We9ms3HxPaD6pisIjgTXxYof3G8NDYnXf6xpJzfP9TJpMO8H7Tzf43
X-Developer-Key: i=brookmangabriel@gmail.com; a=ed25519;
 pk=m9TtPDal6WzoHNnQiHHKf8dTrv3DUCPUUTujuo8vNrw=
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=brookmangabriel@gmail.com; helo=mail-yw1-x1132.google.com
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
---
 target/arm/cpu-features.h |  5 +++++
 target/arm/cpu.h          |  2 ++
 target/arm/helper.c       | 20 ++++++++++++++------
 3 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 1f09d01713..38fc56b52e 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1149,6 +1149,11 @@ static inline bool isar_feature_aa64_mteperm(const ARMISARegisters *id)
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
index 657ff4ab20..677ac18f6f 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1476,6 +1476,8 @@ void pmu_init(ARMCPU *cpu);
 #define SCTLR_EnAS0   (1ULL << 55) /* FEAT_LS64_ACCDATA */
 #define SCTLR_EnALS   (1ULL << 56) /* FEAT_LS64 */
 #define SCTLR_EPAN    (1ULL << 57) /* FEAT_PAN3 */
+#define SCTLR_TCSO0   (1ULL << 58) /* FEAT_MTE_STORE_ONLY */
+#define SCTLR_TCSO    (1ULL << 59) /* FEAT_MTE_STORE_ONLY */
 #define SCTLR_EnTP2   (1ULL << 60) /* FEAT_SME */
 #define SCTLR_NMI     (1ULL << 61) /* FEAT_NMI */
 #define SCTLR_SPINTMASK (1ULL << 62) /* FEAT_NMI */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7389f2988c..987539524a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3351,12 +3351,20 @@ static void sctlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 
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
2.52.0


