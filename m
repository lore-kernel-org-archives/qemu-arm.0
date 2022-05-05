Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1288468lfj;
        Thu, 5 May 2022 11:55:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxc1E5/KQvS+9z1rTHcX+DwG8iJSxMqOzm1SI1T4KczIEZIJl2g+lhEJP5+QtWnyYC07OGE
X-Received: by 2002:a05:6214:1cc4:b0:435:35c3:f0f1 with SMTP id g4-20020a0562141cc400b0043535c3f0f1mr23031344qvd.0.1651776932531;
        Thu, 05 May 2022 11:55:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651776932; cv=none;
        d=google.com; s=arc-20160816;
        b=zEaQP84CI2oCCrnxRyO8EETUBT+SI84dsIQVVHE+2l1UWCq4yvNIkT4uVBzfcnJzxp
         zHB/lEE7tV6Ogo3sffigzUMMI0Wh38uWW47XQkiLGktwnMXdVvA7RZfisNo0c8aLBxPA
         BYuxrJGtl6v6FIp29cehJp+SEm66pqWrtCvncTlz5VSDMklpX6TvQUI0cuslFkuIwbdd
         zi8VRkPYU+tWkM7mDYCLAAyBji0p996Zv8CJYuFIoU61Sg6SbZ4FHH578bO2bF+Tqd6F
         Y+fGdpvwt2WM6+mO74LGneGwep9E01a0/md/hbf6t/RFeEpf7F/ibkb8aU852o1dnKIx
         hL+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=zKpJXBcRLWde91wk5xHMHBvq9z9D+hxg14bTZbWAWx8=;
        b=Ec13UHCk77SN/Qh0haNH4rQJOtJio7cWs9d3afgl0DJo8lX2AV1UdiH2hjS/fHnRVk
         U0jDTbrlmF2FwRcCGSTs5Ni5yJ6wYD6DJ68KINVaw+p8Day5iyYcOC3YeSjvSLEPpZGD
         AfljEfhZYoJbELE8OI4BIhIL0bPIqCQNoUahh0U1V94ITUQhWdQjD2LDFUrlQWx4qO+i
         7axJADs49iBW4vse5495ZQi8XJOMAt4mLQd++W3dSqsH367W/fVIB+Pqk2Y+kEFRQUHO
         U/Ml6qVGJYzI2Uz+fWIA1s4tLqeCC6rlcCP4ccRhWhupUVBoVHJn3qB17fPL4uwHcawH
         b2XA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KOU8kxvc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d63-20020a37b442000000b0069ff9c6a415si1155318qkf.233.2022.05.05.11.55.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 May 2022 11:55:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KOU8kxvc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nmgdP-0002F2-RU
	for alex.bennee@linaro.org; Thu, 05 May 2022 14:55:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmgOM-0006wt-Th
 for qemu-arm@nongnu.org; Thu, 05 May 2022 14:40:00 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:43784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmgOI-0002AH-UF
 for qemu-arm@nongnu.org; Thu, 05 May 2022 14:39:57 -0400
Received: by mail-wr1-x434.google.com with SMTP id v12so7198206wrv.10
 for <qemu-arm@nongnu.org>; Thu, 05 May 2022 11:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=zKpJXBcRLWde91wk5xHMHBvq9z9D+hxg14bTZbWAWx8=;
 b=KOU8kxvcgOAHgInguxp5HPffsCaOkcLtQgzEwn7tEazl3AwhEfFM//HPx15zUj3Hir
 L8nDMnWKfJts7hELT0haXx3FDiNRz6GeqR2Trxmyf0iVjx11zAm8bJtgpxk+cfbW1pjd
 vFmFKRnRJTPuxsfoX4BqskRekggdXsILvXSFh2lI5UfiwJ2NOOarXvVlvKCjSSI+vcsX
 GVpACMCgGQJjCS2a7HfF5akFqYDaxkdIFo3BNvCgKOrBDTmjaihu4T/KeCOpcmYBMWVJ
 kyYcAseSgp7lcWIZtX8FaQn+TDgs7o7FEEnQOiA+417oDIL6ro8B3W5ylh/vi7P8tjiR
 tsNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zKpJXBcRLWde91wk5xHMHBvq9z9D+hxg14bTZbWAWx8=;
 b=cQfe8q9KxiyPSE4WwNZVghE+009lA+h9uMc7MkVKadZP79IIDMDy8VHUFEfkDZONSf
 he/THWc6OvMhqOEtPD5mt6qiLVeJShDBbu0l+z1jnHVq18flmXKil/5xR2Zjs3WUUOB2
 vh14iKJ0FNDry7eXVfNYR9yPXCrtbqW3dF25jMUPXzoQ5VC7r/zGxwrfiN7jEm8a8LSq
 E7WJZVSff0VBX5vBuGfVwotpiZcIJ/3xmU6I6osVlYSoj41Y2Zt0ZWny7Ew/b3j38/iY
 tmk7d8DEjx8gcUZJugB6ly0qURwGy3jmrN84swtqeLP6CYjba1V2qIPtMdcSSc+z6DM4
 Ka2w==
X-Gm-Message-State: AOAM532TWJuqpOGOmGHSSH7hTRxkIDbw9Ewa20+dwChS2sKf9tFvEdsv
 1nOoC7r1W7DM8qCt+8Coram1cc4OBHPgfg==
X-Received: by 2002:a5d:6102:0:b0:20a:db89:724f with SMTP id
 v2-20020a5d6102000000b0020adb89724fmr21580282wrt.59.1651775993113; 
 Thu, 05 May 2022 11:39:53 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 o35-20020a05600c512300b0039454a85a9asm2302121wms.30.2022.05.05.11.39.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:39:52 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/4] target/arm: Postpone interpretation of stage 2 descriptor
 attribute bits
Date: Thu,  5 May 2022 19:39:47 +0100
Message-Id: <20220505183950.2781801-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505183950.2781801-1-peter.maydell@linaro.org>
References: <20220505183950.2781801-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
X-TUID: 0X747c45AO1j

In the original Arm v8 two-stage translation, both stage 1 and stage
2 specify memory attributes (memory type, cacheability,
shareability); these are then combined to produce the overall memory
attributes for the whole stage 1+2 access.  In QEMU we implement this
by having get_phys_addr() fill in an ARMCacheAttrs struct, and we
convert both the stage 1 and stage 2 attribute bit formats to the
same encoding (an 8-bit attribute value matching the MAIR_EL1 fields,
plus a 2-bit shareability value).

The new FEAT_S2FWB feature allows the guest to enable a different
interpretation of the attribute bits in the stage 2 descriptors.
These bits can now be used to control details of how the stage 1 and
2 attributes should be combined (for instance they can say "always
use the stage 1 attributes" or "ignore the stage 1 attributes and
always be Device memory").  This means we need to pass the raw bit
information for stage 2 down to the function which combines the stage
1 and stage 2 information.

Add a field to ARMCacheAttrs that indicates whether the attrs field
should be interpreted as MAIR format, or as the raw stage 2 attribute
bits from the descriptor, and store the appropriate values when
filling in cacheattrs.

We only need to interpret the attrs field in a few places:
 * in do_ats_write(), where we know to expect a MAIR value
   (there is no ATS instruction to do a stage-2-only walk)
 * in S1_ptw_translate(), where we want to know whether the
   combined S1 + S2 attributes indicate Device memory that
   should provoke a fault
 * in combine_cacheattrs(), which does the S1 + S2 combining
Update those places accordingly.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h |  7 ++++++-
 target/arm/helper.c    | 42 ++++++++++++++++++++++++++++++++++++------
 2 files changed, 42 insertions(+), 7 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 255833479d4..b9dd093b5fb 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1141,8 +1141,13 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
 
 /* Cacheability and shareability attributes for a memory access */
 typedef struct ARMCacheAttrs {
-    unsigned int attrs:8; /* as in the MAIR register encoding */
+    /*
+     * If is_s2_format is true, attrs is the S2 descriptor bits [5:2]
+     * Otherwise, attrs is the same as the MAIR_EL1 8-bit format
+     */
+    unsigned int attrs:8;
     unsigned int shareability:2; /* as in the SH field of the VMSAv8-64 PTEs */
+    bool is_s2_format:1;
 } ARMCacheAttrs;
 
 bool get_phys_addr(CPUARMState *env, target_ulong address,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 5a244c3ed93..5839acc343b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3189,6 +3189,12 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
     ret = get_phys_addr(env, value, access_type, mmu_idx, &phys_addr, &attrs,
                         &prot, &page_size, &fi, &cacheattrs);
 
+    /*
+     * ATS operations only do S1 or S1+S2 translations, so we never
+     * have to deal with the ARMCacheAttrs format for S2 only.
+     */
+    assert(!cacheattrs.is_s2_format);
+
     if (ret) {
         /*
          * Some kinds of translation fault must cause exceptions rather
@@ -10671,6 +10677,19 @@ static bool get_level1_table_address(CPUARMState *env, ARMMMUIdx mmu_idx,
     return true;
 }
 
+static bool ptw_attrs_are_device(CPUARMState *env, ARMCacheAttrs cacheattrs)
+{
+    /*
+     * For an S1 page table walk, the stage 1 attributes are always
+     * some form of "this is Normal memory". The combined S1+S2
+     * attributes are therefore only Device if stage 2 specifies Device.
+     * With HCR_EL2.FWB == 0 this is when descriptor bits [5:4] are 0b00,
+     * ie when cacheattrs.attrs bits [3:2] are 0b00.
+     */
+    assert(cacheattrs.is_s2_format);
+    return (cacheattrs.attrs & 0xc) == 0;
+}
+
 /* Translate a S1 pagetable walk through S2 if needed.  */
 static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
                                hwaddr addr, bool *is_secure,
@@ -10699,7 +10718,7 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
             return ~0;
         }
         if ((arm_hcr_el2_eff(env) & HCR_PTW) &&
-            (cacheattrs.attrs & 0xf0) == 0) {
+            ptw_attrs_are_device(env, cacheattrs)) {
             /*
              * PTW set and S1 walk touched S2 Device memory:
              * generate Permission fault.
@@ -11771,12 +11790,14 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     }
 
     if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
-        cacheattrs->attrs = convert_stage2_attrs(env, extract32(attrs, 0, 4));
+        cacheattrs->is_s2_format = true;
+        cacheattrs->attrs = extract32(attrs, 0, 4);
     } else {
         /* Index into MAIR registers for cache attributes */
         uint8_t attrindx = extract32(attrs, 0, 3);
         uint64_t mair = env->cp15.mair_el[regime_el(env, mmu_idx)];
         assert(attrindx <= 7);
+        cacheattrs->is_s2_format = false;
         cacheattrs->attrs = extract64(mair, attrindx * 8, 8);
     }
 
@@ -12514,14 +12535,22 @@ static uint8_t combine_cacheattr_nibble(uint8_t s1, uint8_t s2)
 /* Combine S1 and S2 cacheability/shareability attributes, per D4.5.4
  * and CombineS1S2Desc()
  *
+ * @env:     CPUARMState
  * @s1:      Attributes from stage 1 walk
  * @s2:      Attributes from stage 2 walk
  */
-static ARMCacheAttrs combine_cacheattrs(ARMCacheAttrs s1, ARMCacheAttrs s2)
+static ARMCacheAttrs combine_cacheattrs(CPUARMState *env,
+                                        ARMCacheAttrs s1, ARMCacheAttrs s2)
 {
     uint8_t s1lo, s2lo, s1hi, s2hi;
     ARMCacheAttrs ret;
     bool tagged = false;
+    uint8_t s2_mair_attrs;
+
+    assert(s2.is_s2_format && !s1.is_s2_format);
+    ret.is_s2_format = false;
+
+    s2_mair_attrs = convert_stage2_attrs(env, s2.attrs);
 
     if (s1.attrs == 0xf0) {
         tagged = true;
@@ -12529,9 +12558,9 @@ static ARMCacheAttrs combine_cacheattrs(ARMCacheAttrs s1, ARMCacheAttrs s2)
     }
 
     s1lo = extract32(s1.attrs, 0, 4);
-    s2lo = extract32(s2.attrs, 0, 4);
+    s2lo = extract32(s2_mair_attrs, 0, 4);
     s1hi = extract32(s1.attrs, 4, 4);
-    s2hi = extract32(s2.attrs, 4, 4);
+    s2hi = extract32(s2_mair_attrs, 4, 4);
 
     /* Combine shareability attributes (table D4-43) */
     if (s1.shareability == 2 || s2.shareability == 2) {
@@ -12685,7 +12714,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                 }
                 cacheattrs->shareability = 0;
             }
-            *cacheattrs = combine_cacheattrs(*cacheattrs, cacheattrs2);
+            *cacheattrs = combine_cacheattrs(env, *cacheattrs, cacheattrs2);
 
             /* Check if IPA translates to secure or non-secure PA space. */
             if (arm_is_secure_below_el3(env)) {
@@ -12803,6 +12832,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
         /* Fill in cacheattr a-la AArch64.TranslateAddressS1Off. */
         hcr = arm_hcr_el2_eff(env);
         cacheattrs->shareability = 0;
+        cacheattrs->is_s2_format = false;
         if (hcr & HCR_DC) {
             if (hcr & HCR_DCT) {
                 memattr = 0xf0;  /* Tagged, Normal, WB, RWA */
-- 
2.25.1

