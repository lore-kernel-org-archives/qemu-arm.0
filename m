Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp93337ocb;
        Tue, 4 Oct 2022 04:12:11 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4BH6xggnTLllE7k/h6JRH5Q1LqZ6NsFhvIUka4hobedvQCb+MLB2vUv7zHZPA+pC9s8DCa
X-Received: by 2002:a05:622a:182:b0:35d:49e3:d554 with SMTP id s2-20020a05622a018200b0035d49e3d554mr18843591qtw.142.1664881931264;
        Tue, 04 Oct 2022 04:12:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664881931; cv=none;
        d=google.com; s=arc-20160816;
        b=hi+CcuQa/0RNHbEquQ1cck9/exHJQ5C0p9Q5nLHFw4s90RaHFB29Hrxj+RnHNfU0Ie
         o2hccmaFkOz35w7cr/jTUdpZhSMJhomapRf2bqoMZMCtkmOz1DqogULD/c1OpzoPKmuw
         yjuq0ivXQ5SENxPHXSa1tEJFII7pOiiKmXhyc33yFsAp00tlUj98LvvFuKkvCg8vZOnV
         Sbkkcufer4+eSoLm8AqQ0Zsay9vsvIPNcq9EizDIvI6dLUnNM4hjfK6sMC2zmI/aj4Z8
         fdewi5sYGIt1eASVRTRDZzDLbtroCHxKMzmgwlnlD2FaK5TcMYX9FiwQJebuzhhlvaR5
         1Qnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=y1dNLkF45WELiWIFjPtHxjJWvNXrfxGHTC0UH9y6sLw=;
        b=zztQtZVUrS/93j1EcHq/vR2x+VdeR3g313BMp8ZnRHon/VJKiBgkXIyD3WMGblPJt3
         NDkdd8zL6mD3yKVPt1b8TMYmWdEQ5VDoUpvWlpsfRdGHNQ7orYjc+ggrv1f9O1XM5g/k
         zAQ6taBj9H6eDucr45XbUsv7H4Mesydgzj/vEGBEFp8MRVZilt1ckkHO17MJqjoi8mnQ
         fhq1wnMd7BypF5KzJhAfPSScdNTjZ+iT6a5OFk3s3LzFgZ5HZ1CSQFirsYI3p553h9hl
         7d8KdamghG1xgTO/0PH1AFtt5wb49LCu3FEACA0GUFP3PU1SzOqGJSoYGvJuKui2nugY
         dXmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ckdXqUC5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iu10-20020ad45cca000000b004b1b522cf0fsi386764qvb.53.2022.10.04.04.12.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Oct 2022 04:12:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ckdXqUC5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1offqM-0005lw-Ri
	for alex.bennee@linaro.org; Tue, 04 Oct 2022 07:12:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1offkP-00016t-Pb
 for qemu-arm@nongnu.org; Tue, 04 Oct 2022 07:06:02 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:36359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1offkN-0004Fr-2y
 for qemu-arm@nongnu.org; Tue, 04 Oct 2022 07:06:01 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 c3-20020a1c3503000000b003bd21e3dd7aso563660wma.1
 for <qemu-arm@nongnu.org>; Tue, 04 Oct 2022 04:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date;
 bh=y1dNLkF45WELiWIFjPtHxjJWvNXrfxGHTC0UH9y6sLw=;
 b=ckdXqUC5KVj9UzHNhl3D5YzefL6GtFHalJ6tx+7GJENUgLgUaxL5iQEdQ23N2lTz3V
 RiRUbrr9Uyf5FHsGIDxW9/KvHgqRk9qr6xXFr3lSTJk1IlC479LBEemfpgrvgB4JUCLf
 aZBHlkNMdk5cP1X7HfBlYNP7tgIzjn/Gwri4mA35Posclu68bUNyiB+iI9r0IkdlkGPi
 cOVYb8AacB4aeattqbcVOTgUdMLRe/ocsks8rxkjsYTMNuw6RdABa2ooKzqhHtWQ7sLB
 oHnBfSjBqivWoArbPA7PMepkT56MVwpSp7b+qq+7aydNcGQHJXgtPmWL0BtKTi7fBtYl
 klbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=y1dNLkF45WELiWIFjPtHxjJWvNXrfxGHTC0UH9y6sLw=;
 b=A9ztj2i87o/5W916qrTRhuU73Ym1XnmeG0HGJlatvap4gU7XWY/b1pP8etvpr4sfGs
 SFAUHI86EDbhiZnUSjkwiA7s0nRj/aD24lkwz2JVMuRpAVlOzufZxYiRAxyqb+icUO+v
 GfwE4CPJnu/fcnMH6nZNWF3WKQn8ewDfVUA3IPOmpOW28WTUyWZ7OqC1KUXrv0B5Bc5N
 NzfWl+9rfAyP/+BUtq7a5RqRONch1sP9rCO3TSbYxrCxEVxc+KfbVNaD6v/qmZQ9SqcH
 xCtd8MDBLabq1PNI2l5dK3uKfeALdxoe5An7aBRDP3SdpZt4KQZOzzAAJw1moz9b/Oew
 l+fQ==
X-Gm-Message-State: ACrzQf13xqxJSLpXUfM6qgwIvN/8rN9JBOBanaKloUfbvbVixjh34k9Y
 H8IpFeVBCVyG11yzlYwOVhDhg0Pq+EMX/g==
X-Received: by 2002:a05:600c:3515:b0:3b4:a0fa:c4e1 with SMTP id
 h21-20020a05600c351500b003b4a0fac4e1mr9991488wmq.191.1664881556487; 
 Tue, 04 Oct 2022 04:05:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n20-20020a7bc5d4000000b003b4de550e34sm14047568wmk.40.2022.10.04.04.05.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 04:05:56 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Implement FEAT_E0PD
Date: Tue,  4 Oct 2022 12:05:54 +0100
Message-Id: <20221004110554.3133454-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1krpxD4oXBk6

FEAT_E0PD adds new bits E0PD0 and E0PD1 to TCR_EL1, which allow the
OS to forbid EL0 access to half of the address space.  Since this is
an EL0-specific variation on the existing TCR_ELx.{EPD0,EPD1}, we can
implement it entirely in aa64_va_parameters().

This requires moving the existing regime_is_user() to internals.h
so that the code in helper.c can get at it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Based-on: 20221003162315.2833797-1-peter.maydell@linaro.org
("[PATCH v2 0/3] target/arm: Enforce implemented granule size limits")
but only to avoid textual conflicts.

 docs/system/arm/emulation.rst |  1 +
 target/arm/cpu.h              |  5 +++++
 target/arm/internals.h        | 22 ++++++++++++++++++++++
 target/arm/cpu64.c            |  1 +
 target/arm/helper.c           |  9 +++++++++
 target/arm/ptw.c              | 22 ----------------------
 6 files changed, 38 insertions(+), 22 deletions(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index cfb4b0768b0..fd61360a086 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -24,6 +24,7 @@ the following architecture extensions:
 - FEAT_Debugv8p4 (Debug changes for v8.4)
 - FEAT_DotProd (Advanced SIMD dot product instructions)
 - FEAT_DoubleFault (Double Fault Extension)
+- FEAT_E0PD (Preventing EL0 access to halves of address maps)
 - FEAT_ETS (Enhanced Translation Synchronization)
 - FEAT_FCMA (Floating-point complex number instructions)
 - FEAT_FHM (Floating-point half-precision multiplication instructions)
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 6d39d27378d..11bcdf396a0 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4146,6 +4146,11 @@ static inline bool isar_feature_aa64_lva(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, VARANGE) != 0;
 }
 
+static inline bool isar_feature_aa64_e0pd(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, E0PD) != 0;
+}
+
 static inline bool isar_feature_aa64_tts2uxn(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, XNX) != 0;
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 95f654db3bc..d18e8854482 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -771,6 +771,28 @@ static inline uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
     }
 }
 
+static inline bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
+{
+    switch (mmu_idx) {
+    case ARMMMUIdx_SE10_0:
+    case ARMMMUIdx_E20_0:
+    case ARMMMUIdx_SE20_0:
+    case ARMMMUIdx_Stage1_E0:
+    case ARMMMUIdx_Stage1_SE0:
+    case ARMMMUIdx_MUser:
+    case ARMMMUIdx_MSUser:
+    case ARMMMUIdx_MUserNegPri:
+    case ARMMMUIdx_MSUserNegPri:
+        return true;
+    default:
+        return false;
+    case ARMMMUIdx_E10_0:
+    case ARMMMUIdx_E10_1:
+    case ARMMMUIdx_E10_1_PAN:
+        g_assert_not_reached();
+    }
+}
+
 /* Return the SCTLR value which controls this address translation regime */
 static inline uint64_t regime_sctlr(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index e6314e86d20..cbffb7c8e56 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -1136,6 +1136,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64MMFR2, FWB, 1);      /* FEAT_S2FWB */
     t = FIELD_DP64(t, ID_AA64MMFR2, TTL, 1);      /* FEAT_TTL */
     t = FIELD_DP64(t, ID_AA64MMFR2, BBM, 2);      /* FEAT_BBM at level 2 */
+    t = FIELD_DP64(t, ID_AA64MMFR2, E0PD, 1);     /* FEAT_E0PD */
     cpu->isar.id_aa64mmfr2 = t;
 
     t = cpu->isar.id_aa64zfr0;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 484a2d54ab8..626df539f21 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10418,6 +10418,8 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         ps = extract32(tcr, 16, 3);
         ds = extract64(tcr, 32, 1);
     } else {
+        bool e0pd;
+
         /*
          * Bit 55 is always between the two regions, and is canonical for
          * determining if address tagging is enabled.
@@ -10429,15 +10431,22 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
             epd = extract32(tcr, 7, 1);
             sh = extract32(tcr, 12, 2);
             hpd = extract64(tcr, 41, 1);
+            e0pd = extract64(tcr, 55, 1);
         } else {
             tsz = extract32(tcr, 16, 6);
             gran = tg1_to_gran_size(extract32(tcr, 30, 2));
             epd = extract32(tcr, 23, 1);
             sh = extract32(tcr, 28, 2);
             hpd = extract64(tcr, 42, 1);
+            e0pd = extract64(tcr, 56, 1);
         }
         ps = extract64(tcr, 32, 3);
         ds = extract64(tcr, 59, 1);
+
+        if (e0pd && cpu_isar_feature(aa64_e0pd, cpu) &&
+            regime_is_user(env, mmu_idx)) {
+            epd = true;
+        }
     }
 
     gran = sanitize_gran_size(cpu, gran, stage2);
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index b0a780b38e2..10140bd3b96 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -92,28 +92,6 @@ static bool regime_translation_big_endian(CPUARMState *env, ARMMMUIdx mmu_idx)
     return (regime_sctlr(env, mmu_idx) & SCTLR_EE) != 0;
 }
 
-static bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
-{
-    switch (mmu_idx) {
-    case ARMMMUIdx_SE10_0:
-    case ARMMMUIdx_E20_0:
-    case ARMMMUIdx_SE20_0:
-    case ARMMMUIdx_Stage1_E0:
-    case ARMMMUIdx_Stage1_SE0:
-    case ARMMMUIdx_MUser:
-    case ARMMMUIdx_MSUser:
-    case ARMMMUIdx_MUserNegPri:
-    case ARMMMUIdx_MSUserNegPri:
-        return true;
-    default:
-        return false;
-    case ARMMMUIdx_E10_0:
-    case ARMMMUIdx_E10_1:
-    case ARMMMUIdx_E10_1_PAN:
-        g_assert_not_reached();
-    }
-}
-
 /* Return the TTBR associated with this translation regime */
 static uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx, int ttbrn)
 {
-- 
2.25.1

