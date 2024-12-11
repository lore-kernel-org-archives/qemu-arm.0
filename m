Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4107360njb;
        Wed, 11 Dec 2024 06:45:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXDIfdMymSoMNcabUSGUxoEhNOC3RIIDEYfhM+5+4bhxOj9CuEH8VEsWuVi4fuTZIjR7RzzgZw4GKXUXA==@linaro.org
X-Google-Smtp-Source: AGHT+IGiJjwPY1P4RFaKOJi81BskRgkhcQf8QmknubtJ6NFX1AdqWXpoDweTEYUVy2jKekEU5xch
X-Received: by 2002:a05:6102:290c:b0:4af:b3d2:a07e with SMTP id ada2fe7eead31-4b245d98d82mr353824137.9.1733928324744;
        Wed, 11 Dec 2024 06:45:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733928324; cv=none;
        d=google.com; s=arc-20240605;
        b=Oo8gHM9Tf2NHayIgOgf8yXN8n7gVC++99ixcmvqGXKXR5fv5IvffY9cMjzySYaop93
         0P67I2I0DUuN+P4URjLM4wkfxSCsyA0TjtdNCHEJvzNtDigOMzYdM5jg7Q2kh1hRo+XU
         SLmiS4Yh8yB1JkNSCRhgncXz/5TSwRo8+eCAwTYBz2ycaGBg04nsbsncLZu9Z28BlSaW
         3liNkmkU8hVvTj4wkcnM39/63O0tbttcjx6bnw26/BoA31Xyb4ejcgtC3SdZBH4J+H7I
         qUbDNhW30jUerBNYe44j5hQLdCIBKjdE3uExO4jJMPE+820wozcr83UPAOJ4TnLuAG73
         198Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=na2mVMXjYERuCY2HfRkKGK/haMymRcX2C110KFrsYNY=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=fZ5qgxI8VNgkZ3BuH/qWf8oEnoZ5RutshdPNwfPXHJPPNkVPFQz7iyXB87HQl3x8lz
         H0p6fpoIizpoczk69xrKxL1Nl2anhAloabG5OEc0LbantCubH2bHWQn4tOAQd/pHadTz
         i6EiWWCrKIwvnoILZ9u8Pq8ycgY5KloaWpNPiW7zYo16wBryuyv7kK7S3pLFaMTu5T1F
         I1pvjdvq5Sv+RBlelIPg2x2q8bwstqAjpSXSq0CYK5HsFLeUuNWNx4KpbF3YrL3rbABH
         3t2piWTm8cHGDjkEoHZ5CggQ5/9sriNRO9CEeIkzkYPjqgLheM5od6LncWkjXzXFYfLQ
         DjjQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ORHtmYyB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b113cd8ba1si1288756137.573.2024.12.11.06.45.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 06:45:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ORHtmYyB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLNxI-0006rX-Sr; Wed, 11 Dec 2024 09:44:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tLNxH-0006qp-Ro
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 09:44:47 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tLNxF-0003ql-AH
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 09:44:47 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-434a044dce2so76125005e9.2
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 06:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733928284; x=1734533084; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=na2mVMXjYERuCY2HfRkKGK/haMymRcX2C110KFrsYNY=;
 b=ORHtmYyBFOZWzDHgAV9xx+P1M6MDUsbQIUB47p41H7evCN0EU2NG6iRrZjrdkWk4Hu
 92He0QvuUtysAfPnCRM8ilmKSe960SYNgaohHC6Z2NGXkR9AgvJjWa/PyhaiI3LID2nj
 RRpH/hmFvk2qGOSAjqRhK9JuI+tpu3yX+XKP2G2fBU5d3ZpVfDaV7KbMB7AHhJ/iuoio
 bAToB2b2BbC52IOUyKW1/D9ycn4o+F0+FrOl0w6tmOO536pUF4WkyBtgwE8h/apsofVX
 LbGc+zid7ExiYEa2MS0VcR2uBdQpc1s6wN/2TQWvX4/X5AZ5Ql6WWqXGgB0WfY+Fd7ca
 TJGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733928284; x=1734533084;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=na2mVMXjYERuCY2HfRkKGK/haMymRcX2C110KFrsYNY=;
 b=pih1u6EicHZHTPvESWR3Y/X8G0IIxnMOZpAJcAruFyVI7tiHPEyHg2/JhgCsckfGIt
 NUaPREFBeH+96GiwZs+XodjEVvNNGaCDPTvwvxijvTl2/BYfJvKVxPnq1G4+Las55wJ8
 opAmUe4QvjnwzP8kKRfMD51xZIlmIVWFTkMpFd+r1R4IgiWp0ZVb0d4GtZCudaMnzJvO
 6z5ej4XB95PO8dyyhgrZ6dOs8bGJzN9lqMxN5GrUlCeYT7RRcLPD5WyIl8jatqWIHFQr
 U9IzbvFkvj1gVg/chGWVC23u9dFBunVgSfqFgX/ONISGuJ114kbtQK7/7Dmq0wTVKEfo
 PWcw==
X-Gm-Message-State: AOJu0YylSktGnXc5hlaBP//LmvZD5Q5EgT4YvARLXCoGFDjT/ZsllTgW
 AKMOaT+EMkcK4oSpwruIIX//83c7EEeDTnS0BnOEqAfjQXjYqse0wy1fFy7HQH93QSHclk1dWki
 h
X-Gm-Gg: ASbGnct35xCXZtzyBm0NBeZl7CZbbUyXZGnQrSlp1A2OhwBnZNsu6toAufO/0gi2WlB
 nM3XDM8n4XENlX0W0Z/WP9+DUQA2pdFCLekCx8kKQpLkOVVpV2E5YtXM/YoFItaDc7+hJmi6luk
 4h6BnkciyxEqFpBHdffnwHAXGoZN8BXwmqTxmgsmOOjI0UvwG0gMm+EaSZccEpsZM4nNxld4Z2T
 mBCHgsDuD3ofmrFy/+HMgUv90lY7dStCevRl0xBIkEQz2e2zQY4X7C3o/bo
X-Received: by 2002:a05:600c:35c9:b0:434:a734:d279 with SMTP id
 5b1f17b1804b1-4361c3c6fbfmr30226985e9.16.1733928283603; 
 Wed, 11 Dec 2024 06:44:43 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4361e54ef20sm19477685e9.5.2024.12.11.06.44.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 06:44:42 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 1/6] target/arm: Implement fine-grained-trap handling for
 FEAT_XS
Date: Wed, 11 Dec 2024 14:44:35 +0000
Message-Id: <20241211144440.2700268-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241211144440.2700268-1-peter.maydell@linaro.org>
References: <20241211144440.2700268-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: rcGSAvscI/S0

FEAT_XS introduces a set of new TLBI maintenance instructions with an
"nXS" qualifier.  These behave like the stardard ones except that
they do not wait for memory accesses with the XS attribute to
complete.  They have an interaction with the fine-grained-trap
handling: the FGT bits that a hypervisor can use to trap TLBI
maintenance instructions normally trap also the nXS variants, but the
hypervisor can elect to not trap the nXS variants by setting
HCRX_EL2.FGTnXS to 1.

Add support to our FGT mechanism for these TLBI bits. For each
TLBI-trapping FGT bit we define, for example:
 * FGT_TLBIVAE1 -- the same value we do at present for the
   normal variant of the insn
 * FGT_TLBIVAE1NXS -- for the nXS qualified insn; the value of
   this enum has an NXS bit ORed into it

In access_check_cp_reg() we can then ignore the trap bit for an
access where ri->fgt has the NXS bit set and HCRX_EL2.FGTnXS is 1.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpregs.h        | 72 ++++++++++++++++++++++----------------
 target/arm/cpu-features.h  |  5 +++
 target/arm/helper.c        |  5 ++-
 target/arm/tcg/op_helper.c | 11 +++++-
 4 files changed, 61 insertions(+), 32 deletions(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index cc7c54378f4..87704762ef9 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -621,6 +621,7 @@ FIELD(HDFGWTR_EL2, NBRBCTL, 60, 1)
 FIELD(HDFGWTR_EL2, NBRBDATA, 61, 1)
 FIELD(HDFGWTR_EL2, NPMSNEVFR_EL1, 62, 1)
 
+FIELD(FGT, NXS, 13, 1) /* Honour HCR_EL2.FGTnXS to suppress FGT */
 /* Which fine-grained trap bit register to check, if any */
 FIELD(FGT, TYPE, 10, 3)
 FIELD(FGT, REV, 9, 1) /* Is bit sense reversed? */
@@ -639,6 +640,17 @@ FIELD(FGT, BITPOS, 0, 6) /* Bit position within the uint64_t */
 #define DO_REV_BIT(REG, BITNAME)                                        \
     FGT_##BITNAME = FGT_##REG | FGT_REV | R_##REG##_EL2_##BITNAME##_SHIFT
 
+/*
+ * The FGT bits for TLBI maintenance instructions accessible at EL1 always
+ * affect the "normal" TLBI insns; they affect the corresponding TLBI insns
+ * with the nXS qualifier only if HCRX_EL2.FGTnXS is 0. We define e.g.
+ * FGT_TLBIVAE1 to use for the normal insn, and FGT_TLBIVAE1NXS to use
+ * for the nXS qualified insn.
+ */
+#define DO_TLBINXS_BIT(REG, BITNAME)                             \
+    FGT_##BITNAME = FGT_##REG | R_##REG##_EL2_##BITNAME##_SHIFT, \
+    FGT_##BITNAME##NXS = FGT_##BITNAME | R_FGT_NXS_MASK
+
 typedef enum FGTBit {
     /*
      * These bits tell us which register arrays to use:
@@ -772,36 +784,36 @@ typedef enum FGTBit {
     DO_BIT(HFGITR, ATS1E0W),
     DO_BIT(HFGITR, ATS1E1RP),
     DO_BIT(HFGITR, ATS1E1WP),
-    DO_BIT(HFGITR, TLBIVMALLE1OS),
-    DO_BIT(HFGITR, TLBIVAE1OS),
-    DO_BIT(HFGITR, TLBIASIDE1OS),
-    DO_BIT(HFGITR, TLBIVAAE1OS),
-    DO_BIT(HFGITR, TLBIVALE1OS),
-    DO_BIT(HFGITR, TLBIVAALE1OS),
-    DO_BIT(HFGITR, TLBIRVAE1OS),
-    DO_BIT(HFGITR, TLBIRVAAE1OS),
-    DO_BIT(HFGITR, TLBIRVALE1OS),
-    DO_BIT(HFGITR, TLBIRVAALE1OS),
-    DO_BIT(HFGITR, TLBIVMALLE1IS),
-    DO_BIT(HFGITR, TLBIVAE1IS),
-    DO_BIT(HFGITR, TLBIASIDE1IS),
-    DO_BIT(HFGITR, TLBIVAAE1IS),
-    DO_BIT(HFGITR, TLBIVALE1IS),
-    DO_BIT(HFGITR, TLBIVAALE1IS),
-    DO_BIT(HFGITR, TLBIRVAE1IS),
-    DO_BIT(HFGITR, TLBIRVAAE1IS),
-    DO_BIT(HFGITR, TLBIRVALE1IS),
-    DO_BIT(HFGITR, TLBIRVAALE1IS),
-    DO_BIT(HFGITR, TLBIRVAE1),
-    DO_BIT(HFGITR, TLBIRVAAE1),
-    DO_BIT(HFGITR, TLBIRVALE1),
-    DO_BIT(HFGITR, TLBIRVAALE1),
-    DO_BIT(HFGITR, TLBIVMALLE1),
-    DO_BIT(HFGITR, TLBIVAE1),
-    DO_BIT(HFGITR, TLBIASIDE1),
-    DO_BIT(HFGITR, TLBIVAAE1),
-    DO_BIT(HFGITR, TLBIVALE1),
-    DO_BIT(HFGITR, TLBIVAALE1),
+    DO_TLBINXS_BIT(HFGITR, TLBIVMALLE1OS),
+    DO_TLBINXS_BIT(HFGITR, TLBIVAE1OS),
+    DO_TLBINXS_BIT(HFGITR, TLBIASIDE1OS),
+    DO_TLBINXS_BIT(HFGITR, TLBIVAAE1OS),
+    DO_TLBINXS_BIT(HFGITR, TLBIVALE1OS),
+    DO_TLBINXS_BIT(HFGITR, TLBIVAALE1OS),
+    DO_TLBINXS_BIT(HFGITR, TLBIRVAE1OS),
+    DO_TLBINXS_BIT(HFGITR, TLBIRVAAE1OS),
+    DO_TLBINXS_BIT(HFGITR, TLBIRVALE1OS),
+    DO_TLBINXS_BIT(HFGITR, TLBIRVAALE1OS),
+    DO_TLBINXS_BIT(HFGITR, TLBIVMALLE1IS),
+    DO_TLBINXS_BIT(HFGITR, TLBIVAE1IS),
+    DO_TLBINXS_BIT(HFGITR, TLBIASIDE1IS),
+    DO_TLBINXS_BIT(HFGITR, TLBIVAAE1IS),
+    DO_TLBINXS_BIT(HFGITR, TLBIVALE1IS),
+    DO_TLBINXS_BIT(HFGITR, TLBIVAALE1IS),
+    DO_TLBINXS_BIT(HFGITR, TLBIRVAE1IS),
+    DO_TLBINXS_BIT(HFGITR, TLBIRVAAE1IS),
+    DO_TLBINXS_BIT(HFGITR, TLBIRVALE1IS),
+    DO_TLBINXS_BIT(HFGITR, TLBIRVAALE1IS),
+    DO_TLBINXS_BIT(HFGITR, TLBIRVAE1),
+    DO_TLBINXS_BIT(HFGITR, TLBIRVAAE1),
+    DO_TLBINXS_BIT(HFGITR, TLBIRVALE1),
+    DO_TLBINXS_BIT(HFGITR, TLBIRVAALE1),
+    DO_TLBINXS_BIT(HFGITR, TLBIVMALLE1),
+    DO_TLBINXS_BIT(HFGITR, TLBIVAE1),
+    DO_TLBINXS_BIT(HFGITR, TLBIASIDE1),
+    DO_TLBINXS_BIT(HFGITR, TLBIVAAE1),
+    DO_TLBINXS_BIT(HFGITR, TLBIVALE1),
+    DO_TLBINXS_BIT(HFGITR, TLBIVAALE1),
     DO_BIT(HFGITR, CFPRCTX),
     DO_BIT(HFGITR, DVPRCTX),
     DO_BIT(HFGITR, CPPRCTX),
diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index e806f138b8f..30302d6c5b4 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -474,6 +474,11 @@ static inline bool isar_feature_aa64_fcma(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, FCMA) != 0;
 }
 
+static inline bool isar_feature_aa64_xs(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, XS) != 0;
+}
+
 /*
  * These are the values from APA/API/APA3.
  * In general these must be compared '>=', per the normal Arm ARM
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 910ae62c476..8e62769ec0d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5346,10 +5346,13 @@ static void hcrx_write(CPUARMState *env, const ARMCPRegInfo *ri,
         valid_mask |= HCRX_TALLINT | HCRX_VINMI | HCRX_VFNMI;
     }
     /* FEAT_CMOW adds CMOW */
-
     if (cpu_isar_feature(aa64_cmow, cpu)) {
         valid_mask |= HCRX_CMOW;
     }
+    /* FEAT_XS adds FGTnXS, FnXS */
+    if (cpu_isar_feature(aa64_xs, cpu)) {
+        valid_mask |= HCRX_FGTNXS | HCRX_FNXS;
+    }
 
     /* Clear RES0 bits.  */
     env->cp15.hcrx_el2 = value & valid_mask;
diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index 1ecb4659889..1161d301b71 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -817,6 +817,7 @@ const void *HELPER(access_check_cp_reg)(CPUARMState *env, uint32_t key,
         unsigned int idx = FIELD_EX32(ri->fgt, FGT, IDX);
         unsigned int bitpos = FIELD_EX32(ri->fgt, FGT, BITPOS);
         bool rev = FIELD_EX32(ri->fgt, FGT, REV);
+        bool nxs = FIELD_EX32(ri->fgt, FGT, NXS);
         bool trapbit;
 
         if (ri->fgt & FGT_EXEC) {
@@ -830,7 +831,15 @@ const void *HELPER(access_check_cp_reg)(CPUARMState *env, uint32_t key,
             trapword = env->cp15.fgt_write[idx];
         }
 
-        trapbit = extract64(trapword, bitpos, 1);
+        if (nxs && (arm_hcrx_el2_eff(env) & HCRX_FGTNXS)) {
+            /*
+             * If HCRX_EL2.FGTnXS is 1 then the fine-grained trap for
+             * TLBI maintenance insns does *not* apply to the nXS variant.
+             */
+            trapbit = 0;
+        } else {
+            trapbit = extract64(trapword, bitpos, 1);
+        }
         if (trapbit != rev) {
             res = CP_ACCESS_TRAP_EL2;
             goto fail;
-- 
2.34.1

