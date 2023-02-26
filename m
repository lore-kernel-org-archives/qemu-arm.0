Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4028994ejc;
        Sun, 26 Feb 2023 14:08:29 -0800 (PST)
X-Google-Smtp-Source: AK7set+efw5rqiojS70hdLYipd5hYY9ft6UtDr6g1wGRd4ghwwKndD0o2aepN7ZIntMsupG0n0Us
X-Received: by 2002:a05:6214:1c4c:b0:56e:a2cb:574e with SMTP id if12-20020a0562141c4c00b0056ea2cb574emr46199625qvb.5.1677449309197;
        Sun, 26 Feb 2023 14:08:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677449309; cv=none;
        d=google.com; s=arc-20160816;
        b=p+9rSTlElF83qHt3JRr2AT7rBqpHwZ9eqfb0HHZ5ReT5C9sHh+yVBclQslUN7welqQ
         EOKuBXKpYtNDyZMuOYTl2/3DUr7rUTHVB3wo2a+lHrTpGvtOAs6dpCliyIRGfQ8lBu1h
         JQ90LUBbeMqIlOj3UryqoKU+kK746sqyJemIXooFnSZ41BewiXA0HUFsbVVRG52R2BWe
         1700AVuLaZQblC2NeTl769+b3MF/M/zGwW5P3FsHOQfSJ/6Lkmlsx2lW1dexHfAepITT
         +IC4EV9ft/xQwlQfJIXMdfw+n1YKqm8otALJuat7uBczvizGUVcnnQgx2GhR/d7A2paC
         6wxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=vgcJwiR1WaLfuqlyYYnqY8cLFGvSA2dGsL7q/gzpNRk=;
        b=b6BOp52cZwBASegNk9Gri4IlO5nPaQSLzEzMV+8KTXsPHUnQen7j4g2GicILayynis
         FXj3w5nW2VGrMOOd8cXHSjVG2SQKIq2bC0/V1YEBetEyVMxAtoLhw0Sd2y74AHKXeT6z
         pUqtjUSe23tRol+NxIJs41Y3W9aKCIzDEqDFuvP3gbb0RM50dZTIEsB5S47Pfpfq+H//
         E9Cqhf31+RlgzjKrEHdOPmfMgEAufXY7/789TWmmqeEuolc1V5coQmo16wQNhT3jS4ih
         vbdlt5ncK19fIHzxbTljuec83mIOkW7Z4fdsOmelq13l4S3RS1SynlBI9wdY17RNVbc4
         x+KQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=q+z1Ubkb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p20-20020a0ce194000000b0056efa46ce96si4998152qvl.45.2023.02.26.14.08.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 14:08:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=q+z1Ubkb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWPAt-0002TH-Nv; Sun, 26 Feb 2023 17:07:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3ENj7YwgKCNUJDFJK1617FF7C5.3FDH5DL-1IDEFE7EL.FI7@flex--smostafa.bounces.google.com>)
 id 1pWPAq-0002Rr-It
 for qemu-arm@nongnu.org; Sun, 26 Feb 2023 17:07:16 -0500
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3ENj7YwgKCNUJDFJK1617FF7C5.3FDH5DL-1IDEFE7EL.FI7@flex--smostafa.bounces.google.com>)
 id 1pWPAn-0003vN-Qp
 for qemu-arm@nongnu.org; Sun, 26 Feb 2023 17:07:16 -0500
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-536c8bcae3bso101999097b3.2
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 14:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=vgcJwiR1WaLfuqlyYYnqY8cLFGvSA2dGsL7q/gzpNRk=;
 b=q+z1Ubkb6iwuq7N9GJ4abyDrWmOEX0TmdQFn8U1/WZ6r9VF1yMMfn5X0QO85EvdNVu
 BrfgMsoopcKDwM+KqQPmBMW2rRtIr6NSYkcORS0V0KF1pp9RNkk07nXtlmjg0pKaYH//
 3dghIW406zwOUaQ/wrdwmdfKhmIE16wR5L2DwV1+FT9WdK2ctYZUQvbyuEKXMDaRrOIw
 HXH6LnvNy4H0RP6pZRds3t727gM0MvqGVzAIxggNEJaeXFxtoAJ7exiVMka4My3PpGQr
 5jcTJc0F/LGh5Wy2yrsJTVKf/rwAd3nCoYulCinQHrkBTwKC7kO3atRMAO7YjMI7HL7L
 7v0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vgcJwiR1WaLfuqlyYYnqY8cLFGvSA2dGsL7q/gzpNRk=;
 b=5BBHdLwj/pLba57ktHOb7EVfFUWFCXDw9WDKBHd+8FQJDuEHCcxClNINjqjQiQOSnO
 tkQfS+t4/3EEYYMbU+FbIbHgP0feU2WeudpsOm+nr6Cib6PfzEtChjnhIa4NUXJ7SJyH
 CTsSn6QUQZfHuUrPuSpGCRSeRJXK9jEonMcRjSoCKa4cbnKx40Quxayef2TDO/Zzpo7O
 2nYtApCZiTCBlrXIR8VoOaqiATvQlgokQJXogbiyRpEcbyty04e+6NI+FufQnTSXS98t
 2Y0NEalFh3A9hXX2pbUDTh5G4rqcxY/xkSgpxy3QDTjrWj+z/jrhIkjgArY6mPzURY3Q
 uroA==
X-Gm-Message-State: AO0yUKWMXtBXR0yAxgG/4X5K4h6M+dmjr0C3isz7bu8h79HyxuBN8P/N
 9Yf3ZkPvl69sy9agL3rxHEENriRRrDmp/w==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:6902:1003:b0:9f5:af6b:6f69 with SMTP
 id w3-20020a056902100300b009f5af6b6f69mr5709597ybt.5.1677449232676; Sun, 26
 Feb 2023 14:07:12 -0800 (PST)
Date: Sun, 26 Feb 2023 22:06:44 +0000
In-Reply-To: <20230226220650.1480786-1-smostafa@google.com>
Mime-Version: 1.0
References: <20230226220650.1480786-1-smostafa@google.com>
X-Mailer: git-send-email 2.39.2.637.g21b0678d19-goog
Message-ID: <20230226220650.1480786-6-smostafa@google.com>
Subject: [RFC PATCH v2 05/11] hw/arm/smmuv3: Parse STE config for stage-2
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, richard.henderson@linaro.org, 
 Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=3ENj7YwgKCNUJDFJK1617FF7C5.3FDH5DL-1IDEFE7EL.FI7@flex--smostafa.bounces.google.com;
 helo=mail-yw1-x114a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Su1nFdOfgcpR

Parse stage-2 configuration from STE and populate it in SMMUS2Cfg.
Validity of these value are checked when possible.

Only AA64 tables are supported and STT is not supported.

According to SMMUv3 user manual "5.2 Stream Table Entry": All fields
with an S2 prefix (with the exception of S2VMID) are IGNORED when
stage-2 bypasses translation (Config[1] == 0).

Which means that VMID can be used(for TLB tagging) even if stage-2 is
bypassed, so we parse it unconditionally when S2P exists. Otherwise
it is set to -1.(only S1P)

As stall is not supported, if S2S is set the translation would abort.
For S2R, we reuse the same code used for stage-1 with flag
record_faults. However when nested translation is supported we would
need to separate stage-1 and stage-2 faults.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
Changes in V2:
- Parse S2PS and S2ENDI
- Squash with S2VMID parsing patch
- Squash with S2AFF parsing
- Squash with fault reporting patch
- Add check for S2T0SZ
- Renaming and refactoring code
---
 hw/arm/smmuv3-internal.h |   4 ++
 hw/arm/smmuv3.c          | 138 +++++++++++++++++++++++++++++++++++++++
 include/hw/arm/smmuv3.h  |   3 +
 3 files changed, 145 insertions(+)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index 183d5ac8dc..3388e1a5f8 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -526,9 +526,13 @@ typedef struct CD {
 #define STE_S2TG(x)        extract32((x)->word[5], 14, 2)
 #define STE_S2PS(x)        extract32((x)->word[5], 16, 3)
 #define STE_S2AA64(x)      extract32((x)->word[5], 19, 1)
+#define STE_S2ENDI(x)      extract32((x)->word[5], 20, 1)
+#define STE_S2AFFD(x)      extract32((x)->word[5], 21, 1)
 #define STE_S2HD(x)        extract32((x)->word[5], 24, 1)
 #define STE_S2HA(x)        extract32((x)->word[5], 25, 1)
 #define STE_S2S(x)         extract32((x)->word[5], 26, 1)
+#define STE_S2R(x)         extract32((x)->word[5], 27, 1)
+
 #define STE_CTXPTR(x)                                           \
     ({                                                          \
         unsigned long addr;                                     \
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 4e90343996..dc74a5442d 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -329,6 +329,46 @@ static int smmu_get_cd(SMMUv3State *s, STE *ste, uint32_t ssid,
     return 0;
 }
 
+/*
+ * Max valid value is 39 when SMMU_IDR3.STT == 0.
+ * In architectures after SMMUv3.0:
+ * - If STE.S2TG selects a 4KB or 16KB granule, the minimum valid value for this
+ * field is MAX(16, 64-IAS)
+ * - If STE.S2TG selects a 64KB granule, the minimum valid value for this field
+ * is (64-IAS).
+ * As we only support AA64, IAS = OAS.
+ */
+static bool t0sz_valid(SMMUTransCfg *cfg)
+{
+    if (cfg->s2cfg.tsz > 39) {
+        return false;
+    }
+
+    if (cfg->s2cfg.granule_sz == 16) {
+        return (cfg->s2cfg.tsz >= 64 - cfg->s2cfg.oas);
+    }
+
+    return (cfg->s2cfg.tsz >= MAX(64 - cfg->s2cfg.oas, 16));
+}
+
+/*
+ * Return true if s2 page table config is valid.
+ * This checks with the configured start level, ias_bits and granularity we can
+ * have a valid page table as described in ARM ARM D8.2 Translation process.
+ * The idea here is to see for the highest possible number of IPA bits, how
+ * many concatenated tables we would need, if it is more than 16, then this is
+ * not possible.
+ */
+static bool s2_pgtable_config_valid(uint8_t sl0, uint8_t t0sz, uint8_t gran)
+{
+    int level = get_start_level(sl0, gran);
+    uint64_t ipa_bits = 64 - t0sz;
+    uint64_t max_ipa = (1ULL << ipa_bits) - 1;
+    int nr_concat = pgd_idx(level, gran, max_ipa) + 1;
+
+    return nr_concat <= SMMU_MAX_S2_CONCAT;
+}
+
 /* Returns < 0 in case of invalid STE, 0 otherwise */
 static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
                       STE *ste, SMMUEventInfo *event)
@@ -354,7 +394,105 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
         return 0;
     }
 
+    /*
+     * If a stage is enabled in SW while not advertised, throw bad ste
+     * according to SMMU manual 5.2 Stream Table Entry - [3:1] Config.
+     */
+    if (!STAGE1_SUPPORTED(s) && STE_CFG_S1_ENABLED(config)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "SMMUv3 S1 used but not supported.\n");
+        goto bad_ste;
+    }
+    if (!STAGE2_SUPPORTED(s) && STE_CFG_S2_ENABLED(config)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "SMMUv3 S2 used but not supported.\n");
+        goto bad_ste;
+    }
+
+    if (STAGE2_SUPPORTED(s)) {
+        /* VMID is considered even if s2 is disabled. */
+        cfg->s2cfg.vmid = STE_S2VMID(ste);
+    } else {
+        /* Default to -1 */
+        cfg->s2cfg.vmid = -1;
+    }
+
     if (STE_CFG_S2_ENABLED(config)) {
+        cfg->stage = 2;
+
+        if (STE_S2AA64(ste) == 0x0) {
+            qemu_log_mask(LOG_UNIMP,
+                          "SMMUv3 AArch32 tables not supported\n");
+            g_assert_not_reached();
+        }
+
+        switch (STE_S2TG(ste)) {
+        case 0x0: /* 4KB */
+            cfg->s2cfg.granule_sz = 12;
+            break;
+        case 0x1: /* 64KB */
+            cfg->s2cfg.granule_sz = 16;
+            break;
+        case 0x2: /* 16KB */
+            cfg->s2cfg.granule_sz = 14;
+            break;
+        default:
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "SMMUv3 bad STE S2TG: %x\n", STE_S2TG(ste));
+            goto bad_ste;
+        }
+
+        cfg->s2cfg.vttb = STE_S2TTB(ste);
+
+        cfg->s2cfg.sl0 = STE_S2SL0(ste);
+        /* FEAT_TTST not supported. */
+        if (cfg->s2cfg.sl0 == 0x3) {
+            qemu_log_mask(LOG_UNIMP, "SMMUv3 S2SL0 = 0x3 has no meaning!\n");
+            goto bad_ste;
+        }
+
+
+        cfg->s2cfg.oas = oas2bits(MIN(STE_S2PS(ste), SMMU_IDR5_OAS));
+        /*
+         * It is ILLEGAL for the address in S2TTB to be outside the range
+         * described by the effective S2PS value.
+         */
+        if (cfg->s2cfg.vttb & ~(MAKE_64BIT_MASK(0, cfg->s2cfg.oas))) {
+            goto bad_ste;
+        }
+
+        cfg->s2cfg.tsz = STE_S2T0SZ(ste);
+
+        if (!t0sz_valid(cfg)) {
+            qemu_log_mask(LOG_GUEST_ERROR, "SMMUv3 bad STE S2T0SZ = %d\n",
+                          cfg->s2cfg.tsz);
+            goto bad_ste;
+        }
+
+        if (!s2_pgtable_config_valid(cfg->s2cfg.sl0, cfg->s2cfg.tsz,
+                                     cfg->s2cfg.granule_sz)) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "SMMUv3 STE stage 2 config not valid!\n");
+            goto bad_ste;
+        }
+
+        /* Only LE supported(IDR0.TTENDIAN). */
+        if (STE_S2ENDI(ste)) {
+            goto bad_ste;
+        }
+
+        cfg->s2cfg.affd = STE_S2AFFD(ste);
+        /*
+         * We reuse the same code used for stage-1 with flag record_faults.
+         * However when nested translation is supported we would
+         * need to separate stage-1 and stage-2 faults.
+         */
+        cfg->record_faults = STE_S2R(ste);
+        /* As stall is not supported. */
+        if (STE_S2S(ste)) {
+            qemu_log_mask(LOG_UNIMP, "SMMUv3 Stall not implemented!\n");
+            goto bad_ste;
+        }
+
+        /* This is still here as stage 2 has not been fully enabled yet. */
         qemu_log_mask(LOG_UNIMP, "SMMUv3 does not support stage 2 yet\n");
         goto bad_ste;
     }
diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
index a0c026402e..6031d7d325 100644
--- a/include/hw/arm/smmuv3.h
+++ b/include/hw/arm/smmuv3.h
@@ -83,4 +83,7 @@ struct SMMUv3Class {
 #define TYPE_ARM_SMMUV3   "arm-smmuv3"
 OBJECT_DECLARE_TYPE(SMMUv3State, SMMUv3Class, ARM_SMMUV3)
 
+#define STAGE1_SUPPORTED(s)      FIELD_EX32(s->idr[0], IDR0, S1P)
+#define STAGE2_SUPPORTED(s)      FIELD_EX32(s->idr[0], IDR0, S2P)
+
 #endif
-- 
2.39.2.637.g21b0678d19-goog

