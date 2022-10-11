Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp2890024ocg;
        Mon, 10 Oct 2022 20:37:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4ihpXMEbvdMCWY2EamFcehrUC/kDSCnTKOk5VsSUT060h3K8KOoisraG6qqWJC9y+RncAz
X-Received: by 2002:a05:622a:1887:b0:38a:9b7e:75bb with SMTP id v7-20020a05622a188700b0038a9b7e75bbmr17967731qtc.73.1665459443198;
        Mon, 10 Oct 2022 20:37:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665459443; cv=none;
        d=google.com; s=arc-20160816;
        b=MQexwLMo0R4r3mYFeUtc/YO+NtjPGEnELqbXiYOwJ47gSnkxmC5/OKy5r8/GVVy8jw
         y83TxIeevoZJqzIoG/7N0UznApACDA7jhu+qGfC23U9CcVzkZFmx8DAbbBkXJsoVljuR
         0xWkOVn2HWC6TqSGp1Hyt9LVYkwlH9Alk1ZJ/ZVN0rvCd45iDwwdopSpVBzmIUb1arbG
         14uJ+bIfiG3aiDF8llTwq2Z8cjMbZw4SSOJuaq9D3YuXYDR67Q4afox01UBenEOq/viq
         IXyAnubH2ofMreXJcjQ/FJeTTxOLklQyQyjFduHIB+t17Rp5LeNurnnKEL6ZfSHRbSSl
         tDgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=v5fZEsizLTBbzlQyMJApbEFH3hQ5MeBPh9aoDq+SKpQ=;
        b=W0i3xGbPgE/4ffiyruld3XJ8D/Ku7lS/iPC9Dxirl6mul60uIB9cLyaMfqsMKcQArw
         npXxECxQuu0z4W+/TEDcenJfpK7GzxkeoR863Nvb5ZNJ20nrhzNo191kDVKQpSAWMbMt
         yZVpM9syM04oWGbTk4xtr7Dd7vGUUnGKuo0bDXh9VlJS66aibK7KmiPPM0pOXS2MykGw
         kL4tLj9VMTSYHo3jGdLhhwMtfHxio+kZvum/6t3GrFq/DASQHD27s2KTYCW25i3XleMH
         wpAXK0drQFFkzBbVWfIu9gOVXqLRubcpeE1Hk0dUGGtbvjVcMAxeQ2uzv4x1I/H2nDFA
         ALTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ELe1O6vY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t3-20020a0562140c6300b004991ad4f133si5923009qvj.328.2022.10.10.20.37.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Oct 2022 20:37:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ELe1O6vY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oi654-0005eS-PU
	for alex.bennee@linaro.org; Mon, 10 Oct 2022 23:37:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5o7-0002f0-M0
 for qemu-arm@nongnu.org; Mon, 10 Oct 2022 23:19:51 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:43741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5o5-000382-NP
 for qemu-arm@nongnu.org; Mon, 10 Oct 2022 23:19:51 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 x31-20020a17090a38a200b0020d2afec803so4914871pjb.2
 for <qemu-arm@nongnu.org>; Mon, 10 Oct 2022 20:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v5fZEsizLTBbzlQyMJApbEFH3hQ5MeBPh9aoDq+SKpQ=;
 b=ELe1O6vYoT5wzrbqk8Cda3tezsb+8nu4BJ3nJq4Xsoovmy7EdwnI35DSz/pFjpSN0R
 RhjfH8MQMxje0u+M2TVATCh6Ned/PmhDpD5bIEiyyh8onMf97E+iuqaHv25jWtIDE9Wk
 oNHNRCMoH+P/AG6FO4p50O9ZEkVaCDOS3Y1v+8zlx3FazFH5D8xjE9ZpV2elriZgFxiF
 jzoRnqM7v6erRRDDYiv+dEoRfKHmXIosyn+zhMrEgvUw3S8JRnnD7+q40cVJMFLluhtf
 pRvIwyfQnHrTItuhBBcwfg0obR9tH4cI6dBYPO6IFwuICQ55jf1XtaOVagpisNVzm0Tf
 7JkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v5fZEsizLTBbzlQyMJApbEFH3hQ5MeBPh9aoDq+SKpQ=;
 b=7sJpHRlSwh9E5SFu7HYaTJnbNbIxUhTv6aTe9YC2gVKMzIpbNtflZhh8Vk8zPqbm6W
 GpajREfzyZgwf8w2jigKvpP7sfuReqLKS6pVXUg2V1+KVnSX1+ETXWLMAFGLZXykzQ+o
 ARVJ064RGCgAaDzoKQJnTtDQ5AKw9BKWmCSbAICKYaCrlIMRGtkIjLhEMoUz12an9SYO
 Wwg9X4NRXh4u5QsLbS1D1BL3Gnnn+Hzf9NfqOl0PwV4WrIYLgrU+UOMrR+/77fPO1AM4
 IwmwHDi2ezvlavEn7GFl1vG9ljLmB+4jtypSvPHaP4tYEtUwJbYgyixK/3/GG96luucZ
 PDRg==
X-Gm-Message-State: ACrzQf1NosSw6W5bTWAw6+MxOUIptTAjWZElz6MeCV4ziKpYXjjUv/N+
 a3xb1/nDphQkJ2EHyiILPRKCxA==
X-Received: by 2002:a17:902:bb86:b0:17c:4cac:eea4 with SMTP id
 m6-20020a170902bb8600b0017c4caceea4mr21433133pls.141.1665458387502; 
 Mon, 10 Oct 2022 20:19:47 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7])
 by smtp.gmail.com with ESMTPSA id
 o74-20020a62cd4d000000b0055f209690c0sm7663567pfg.50.2022.10.10.20.19.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 20:19:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 18/24] target/arm: Remove loop from get_phys_addr_lpae
Date: Mon, 10 Oct 2022 20:19:05 -0700
Message-Id: <20221011031911.2408754-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011031911.2408754-1-richard.henderson@linaro.org>
References: <20221011031911.2408754-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IhE2NKH947NN

The unconditional loop was used both to iterate over levels
and to control parsing of attributes.  Use an explicit goto
in both cases.

While this appears less clean for iterating over levels, we
will need to jump back into the middle of this loop for
atomic updates, which is even uglier.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 182 +++++++++++++++++++++++------------------------
 1 file changed, 91 insertions(+), 91 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index d54e6ca938..9b767f8236 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1082,6 +1082,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     uint64_t descaddrmask;
     bool aarch64 = arm_el_is_aa64(env, el);
     bool guarded = false;
+    uint64_t descriptor;
+    bool nstable;
 
     /* TODO: This code does not support shareability levels. */
     if (aarch64) {
@@ -1274,99 +1276,97 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
      * bits at each step.
      */
     tableattrs = is_secure ? 0 : (1 << 4);
-    for (;;) {
-        uint64_t descriptor;
-        bool nstable;
 
-        descaddr |= (address >> (stride * (4 - level))) & indexmask;
-        descaddr &= ~7ULL;
-        nstable = extract32(tableattrs, 4, 1);
-        if (!nstable) {
-            /* Stage2_S -> Stage2 or Phys_S -> Phys_NS */
-            ptw->in_ptw_idx &= ~1;
-            ptw->in_secure = false;
-        }
-        if (!S1_ptw_translate(env, ptw, descaddr, fi)) {
-            goto do_fault;
-        }
-        descriptor = arm_ldq_ptw(env, ptw, fi);
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
-        descaddr &= ~(hwaddr)(page_size - 1);
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
+    if (!nstable) {
+        /* Stage2_S -> Stage2 or Phys_S -> Phys_NS */
+        ptw->in_ptw_idx &= ~1;
+        ptw->in_secure = false;
     }
+    if (!S1_ptw_translate(env, ptw, descaddr, fi)) {
+        goto do_fault;
+    }
+    descriptor = arm_ldq_ptw(env, ptw, fi);
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
+    descaddr &= ~(hwaddr)(page_size - 1);
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

