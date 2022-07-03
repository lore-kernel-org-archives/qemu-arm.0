Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2448558lft;
        Sun, 3 Jul 2022 02:06:28 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t2YhXf50XhSOpZFuSz2/CQSkPCVgh8ZhzGDm4311Vmtx4X9ENAkhULm8B2boL1PLP69XO6
X-Received: by 2002:a25:cf4e:0:b0:66e:2d18:6126 with SMTP id f75-20020a25cf4e000000b0066e2d186126mr5040688ybg.538.1656839188731;
        Sun, 03 Jul 2022 02:06:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656839188; cv=none;
        d=google.com; s=arc-20160816;
        b=lGxztI79FaUoLz94tRvHpc1BRdG2/aQNKtUVhxbWSHL5DuY8eFvrCuVNuHj6LLjYqt
         Li+fyzufA/nurLHZhQj/9mYYrpg1bM31Ap4zEKtJyAfUWM9UyWT3kaArFCXOFWmuFpwa
         YtHvT888GAPOpnG0oLGqSrvJgdQu8qiLqgvwjMOiSt8d1yej4icQEEJXMqU4QdF0CaKz
         pZT+jR3gKLrDMtyonkF5K8PjGTFbpLczAOF/orhylYz0TeenSrOYYT25mztjC9/cmciN
         CRkWnYrYvrbVOYqxNIVcgmZuJmNsJXsWd+J8vBs2mLkBFaODGx41+2HAnj90+V2gpX8n
         shDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=RvxjhA/zJ6a4ine35bxeLnau/UxZrJIIYMcq6hlNPcQ=;
        b=PNH+s/fcdeZASOwznusCy/CIXitxGMVzbb3/3c3wWx1vIH+3fDmibC3fgiENO51vJR
         W+qyt9+wE3N8sBsiaxbtd/c0rYlqh3RkgZjzQ/Mx82Oo06dNZuVjS35ie/adHhO+n+Fl
         5xXbaGqFih9C7KrwZh4X0PGwTD4wGCPjpR1rG4abI+P2NofIBMkKAgAEO+b8s7WwfcDC
         lKS/HboTjKC8ajfO+EwqdeSrrarHBgYlNg8pTeseK7pIeCRM6woTGEzqp8mGMDTzr8Gn
         /HSmdWS941ElqXyZgVc4L8iNLbUtj//kYOxeS4aHDvwaEps5emRvZbZdyJJY+YWEpuKy
         0uKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wqccFChJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a5-20020a814d05000000b0031c49b08132si12495729ywb.144.2022.07.03.02.06.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Jul 2022 02:06:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wqccFChJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7vYi-0002AG-2D
	for alex.bennee@linaro.org; Sun, 03 Jul 2022 05:06:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uzp-0001oo-KE
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:30:25 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:36862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uzn-0006qi-EK
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:30:25 -0400
Received: by mail-pg1-x530.google.com with SMTP id s206so6268630pgs.3
 for <qemu-arm@nongnu.org>; Sun, 03 Jul 2022 01:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RvxjhA/zJ6a4ine35bxeLnau/UxZrJIIYMcq6hlNPcQ=;
 b=wqccFChJ4/6k+Oy6isATxRtv6Zh76NGUBl+xrYkFO48KkrEbKPsSJEI4K7xxRbiWfA
 JDKqYR2dVydEhawJLUG9h4p9vGj+JK3/Ier4nFbtIEw610Afp6QTsAN72zsCOdUelp2Q
 MVQ8zTbhj0rdU/WSiyXIxdhTeQaikLMKn0f3ONtRJfsUFraU8p+L9GrIf5UvkulOLXws
 U6qhl0loReUoLAcCL/xz8Aj44Jak78be6ikiL0rp2R5JjeQ5cgdaSiBLIoefgbZ6L2fj
 0hdcmsuTccdOlQtz/N1g2hjZgV7cB59n7ius5BFcqzVrcj6yeWadfoY5FfBV4sOapDwr
 H0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RvxjhA/zJ6a4ine35bxeLnau/UxZrJIIYMcq6hlNPcQ=;
 b=mFqAwg7fQjEWKOBAwSBa337QeAy8n50Bws4r8T+yZ6Hcbyl5xPu4CzA+P2Br5GcfyF
 P7+9CnQXdfWXwqXqdwaUDigkqjNUDJtDl8678zidHW3ZK7LF3dORN+CMH4s5OWWa91JO
 bVgfMY7L/6AsOHUZuCXMk0ydUGa/OdWHfCaiiQpGhaeNxT370ETO9H1UJ5Wr0ral26jm
 M828iaYVFDGcFS/c3to233CdUqn3/Tp+nS4WdgjixMPPlNGvubEV0akMrkkZ1QYSiqau
 uJHoixRjpO9BoWkYvK2Yqlp+3sdBzAOaZVLxFqD4iX90O/GMNWHmn/nRV1C52IxsjG2+
 xglQ==
X-Gm-Message-State: AJIora/tBToykaQgCqupGc0znSHX/zbmzGQtZZU4q5HfyU4OGwQeYMtT
 MeTHnAIO9ICavejSOskRM765xw==
X-Received: by 2002:a62:542:0:b0:525:a313:fe28 with SMTP id
 63-20020a620542000000b00525a313fe28mr30630980pff.73.1656837021985; 
 Sun, 03 Jul 2022 01:30:21 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 g6-20020a1709026b4600b0016788487357sm18574523plt.132.2022.07.03.01.30.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:30:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 58/62] target/arm: Remove loop from get_phys_addr_lpae
Date: Sun,  3 Jul 2022 13:54:15 +0530
Message-Id: <20220703082419.770989-59-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: G2eu0i/imvXw

The unconditional loop was used both to iterate over levels
and to control parsing of attributes.  Use an explicit goto
in both cases.

While this appears less clean for iterating over levels, we
will need to jump back into the middle of this loop for
atomic updates, which is even uglier.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 176 +++++++++++++++++++++++------------------------
 1 file changed, 88 insertions(+), 88 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index dee857ae89..a3f063e0bc 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1029,6 +1029,9 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     uint64_t descaddrmask;
     bool aarch64 = arm_el_is_aa64(env, el);
     bool guarded = false;
+    S1TranslateResult s1;
+    uint64_t descriptor;
+    bool nstable;
 
     /* TODO: This code does not support shareability levels. */
     if (aarch64) {
@@ -1227,96 +1230,93 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
      * bits at each step.
      */
     tableattrs = is_secure ? 0 : (1 << 4);
-    for (;;) {
-        S1TranslateResult s1;
-        uint64_t descriptor;
-        bool nstable;
 
-        descaddr |= (address >> (stride * (4 - level))) & indexmask;
-        descaddr &= ~7ULL;
-        nstable = extract32(tableattrs, 4, 1);
-        if (!S1_ptw_translate(env, mmu_idx, ptw_idx, descaddr,
-                              !nstable, &s1, fi)) {
-            goto do_fault;
-        }
-        descriptor = arm_ldq_ptw(env, &s1, fi);
-        if (fi->type != ARMFault_None) {
-            goto do_fault;
-        }
-
-        if (!(descriptor & 1) ||
-            (!(descriptor & 2) && (level == 3))) {
-            /* Invalid, or the Reserved level 3 encoding */
-            goto do_fault;
-        }
-
-        descaddr = descriptor & descaddrmask;
-
-        /*
-         * For FEAT_LPA and PS=6, bits [51:48] of descaddr are in [15:12]
-         * of descriptor.  For FEAT_LPA2 and effective DS, bits [51:50] of
-         * descaddr are in [9:8].  Otherwise, if descaddr is out of range,
-         * raise AddressSizeFault.
-         */
-        if (outputsize > 48) {
-            if (param.ds) {
-                descaddr |= extract64(descriptor, 8, 2) << 50;
-            } else {
-                descaddr |= extract64(descriptor, 12, 4) << 48;
-            }
-        } else if (descaddr >> outputsize) {
-            fault_type = ARMFault_AddressSize;
-            goto do_fault;
-        }
-
-        if ((descriptor & 2) && (level < 3)) {
-            /*
-             * Table entry. The top five bits are attributes which may
-             * propagate down through lower levels of the table (and
-             * which are all arranged so that 0 means "no effect", so
-             * we can gather them up by ORing in the bits at each level).
-             */
-            tableattrs |= extract64(descriptor, 59, 5);
-            level++;
-            indexmask = indexmask_grainsize;
-            continue;
-        }
-        /*
-         * Block entry at level 1 or 2, or page entry at level 3.
-         * These are basically the same thing, although the number
-         * of bits we pull in from the vaddr varies. Note that although
-         * descaddrmask masks enough of the low bits of the descriptor
-         * to give a correct page or table address, the address field
-         * in a block descriptor is smaller; so we need to explicitly
-         * clear the lower bits here before ORing in the low vaddr bits.
-         */
-        page_size = (1ULL << ((stride * (4 - level)) + 3));
-        descaddr &= ~(page_size - 1);
-        descaddr |= (address & (page_size - 1));
-        /* Extract attributes from the descriptor */
-        attrs = extract64(descriptor, 2, 10)
-            | (extract64(descriptor, 52, 12) << 10);
-
-        if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
-            /* Stage 2 table descriptors do not include any attribute fields */
-            break;
-        }
-        /* Merge in attributes from table descriptors */
-        attrs |= nstable << 3; /* NS */
-        guarded = extract64(descriptor, 50, 1);  /* GP */
-        if (param.hpd) {
-            /* HPD disables all the table attributes except NSTable.  */
-            break;
-        }
-        attrs |= extract32(tableattrs, 0, 2) << 11;     /* XN, PXN */
-        /*
-         * The sense of AP[1] vs APTable[0] is reversed, as APTable[0] == 1
-         * means "force PL1 access only", which means forcing AP[1] to 0.
-         */
-        attrs &= ~(extract32(tableattrs, 2, 1) << 4);   /* !APT[0] => AP[1] */
-        attrs |= extract32(tableattrs, 3, 1) << 5;      /* APT[1] => AP[2] */
-        break;
+ next_level:
+    descaddr |= (address >> (stride * (4 - level))) & indexmask;
+    descaddr &= ~7ULL;
+    nstable = extract32(tableattrs, 4, 1);
+    if (!S1_ptw_translate(env, mmu_idx, ptw_idx, descaddr,
+                          !nstable, &s1, fi)) {
+        goto do_fault;
     }
+    descriptor = arm_ldq_ptw(env, &s1, fi);
+    if (fi->type != ARMFault_None) {
+        goto do_fault;
+    }
+
+    if (!(descriptor & 1) || (!(descriptor & 2) && (level == 3))) {
+        /* Invalid, or the Reserved level 3 encoding */
+        goto do_fault;
+    }
+
+    descaddr = descriptor & descaddrmask;
+
+    /*
+     * For FEAT_LPA and PS=6, bits [51:48] of descaddr are in [15:12]
+     * of descriptor.  For FEAT_LPA2 and effective DS, bits [51:50] of
+     * descaddr are in [9:8].  Otherwise, if descaddr is out of range,
+     * raise AddressSizeFault.
+     */
+    if (outputsize > 48) {
+        if (param.ds) {
+            descaddr |= extract64(descriptor, 8, 2) << 50;
+        } else {
+            descaddr |= extract64(descriptor, 12, 4) << 48;
+        }
+    } else if (descaddr >> outputsize) {
+        fault_type = ARMFault_AddressSize;
+        goto do_fault;
+    }
+
+    if ((descriptor & 2) && (level < 3)) {
+        /*
+         * Table entry. The top five bits are attributes which may
+         * propagate down through lower levels of the table (and
+         * which are all arranged so that 0 means "no effect", so
+         * we can gather them up by ORing in the bits at each level).
+         */
+        tableattrs |= extract64(descriptor, 59, 5);
+        level++;
+        indexmask = indexmask_grainsize;
+        goto next_level;
+    }
+
+    /*
+     * Block entry at level 1 or 2, or page entry at level 3.
+     * These are basically the same thing, although the number
+     * of bits we pull in from the vaddr varies. Note that although
+     * descaddrmask masks enough of the low bits of the descriptor
+     * to give a correct page or table address, the address field
+     * in a block descriptor is smaller; so we need to explicitly
+     * clear the lower bits here before ORing in the low vaddr bits.
+     */
+    page_size = (1ULL << ((stride * (4 - level)) + 3));
+    descaddr &= ~(page_size - 1);
+    descaddr |= (address & (page_size - 1));
+    /* Extract attributes from the descriptor */
+    attrs = extract64(descriptor, 2, 10)
+        | (extract64(descriptor, 52, 12) << 10);
+
+    if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
+        /* Stage 2 table descriptors do not include any attribute fields */
+        goto skip_attrs;
+    }
+    /* Merge in attributes from table descriptors */
+    attrs |= nstable << 3; /* NS */
+    guarded = extract64(descriptor, 50, 1);  /* GP */
+    if (param.hpd) {
+        /* HPD disables all the table attributes except NSTable.  */
+        goto skip_attrs;
+    }
+    attrs |= extract32(tableattrs, 0, 2) << 11;     /* XN, PXN */
+    /*
+     * The sense of AP[1] vs APTable[0] is reversed, as APTable[0] == 1
+     * means "force PL1 access only", which means forcing AP[1] to 0.
+     */
+    attrs &= ~(extract32(tableattrs, 2, 1) << 4);   /* !APT[0] => AP[1] */
+    attrs |= extract32(tableattrs, 3, 1) << 5;      /* APT[1] => AP[2] */
+ skip_attrs:
+
     /*
      * Here descaddr is the final physical address, and attributes
      * are all in attrs.
-- 
2.34.1

