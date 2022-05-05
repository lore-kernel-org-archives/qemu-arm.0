Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1288779lfj;
        Thu, 5 May 2022 11:56:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVfNMS7et0aqemwS/djYizsUQUlJC44a83rcyWTl/srskj7ncFtxFwNybCw+2GxGe8hzkl
X-Received: by 2002:ac8:570f:0:b0:2f3:aa48:c48a with SMTP id 15-20020ac8570f000000b002f3aa48c48amr17057851qtw.562.1651776971826;
        Thu, 05 May 2022 11:56:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651776971; cv=none;
        d=google.com; s=arc-20160816;
        b=E2FfPzydfQGdtuyFIVZbqP8XwUJtOCMyFKWkBp+0EpK6WzhHwFaXSQfIrflaAwNeLm
         T4vLzDFm78msCNORche8wbPCLAhgoFooqz3L2enco1vz98FWqCTZjkDNB5ZO9JU3rxAi
         CBPhqWstZMo0YzQpIdZXBLqZAme6ew1JZQbdHhnnoTBOQfPqjT9rbnPkqTGSkvWBWCRZ
         OK9yHyZWGMDynNqPT6zGdFa16SseBucH5ixnnpoEDefZvPoHfxXEC7LwMRJ6rsk41+vj
         0QO8j5tBGnF/TSeT6BUYQhkpT1KVbxvEonhNCl5RrAZd8GPxVmiBEH4t+afb/fKavuvB
         28pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=BK37fHRVqnthuH26rW9Ll64hvEKI8MD8UM28AzmRwT8=;
        b=YipXIkgIP6BumieW6Ak5+di1wPeHnbRr4IH8wBWPCFNJ0xnUh1CnfVV2/jvXemhYSX
         he9PEdf8tVVPZaVSTZhQDrGc+VbWgLM3/f/XkyYXvAz598mIwRFBaeThADc+FVAHK3S9
         oiNe+DiGz2rAawTXBJAmYuiEqzbouZCxhRvzG2Pip1iE0T8KssO4pbN2QZgMf/7r12Ho
         78XtzVIlvM3H34UixkPm0z8T0ulaqdCX53Iv3p7jWeP+rc29vJcuBYA+Fpz5aPXiy3gS
         fgnvHVwG0u7k07f714bwW8qm7tpiJKqxMSVu7ChaYJnhWGikivisOgsXj8x2oEFErM2a
         hfkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uJozRu9w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z5-20020a0ce985000000b004591ff28995si1066085qvn.418.2022.05.05.11.56.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 May 2022 11:56:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uJozRu9w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nmge3-00037N-6v
	for alex.bennee@linaro.org; Thu, 05 May 2022 14:56:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmgON-0006ww-9x
 for qemu-arm@nongnu.org; Thu, 05 May 2022 14:40:00 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:39637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmgOK-0002AX-PQ
 for qemu-arm@nongnu.org; Thu, 05 May 2022 14:39:59 -0400
Received: by mail-wr1-x42c.google.com with SMTP id d5so7215741wrb.6
 for <qemu-arm@nongnu.org>; Thu, 05 May 2022 11:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=BK37fHRVqnthuH26rW9Ll64hvEKI8MD8UM28AzmRwT8=;
 b=uJozRu9wwK26qd7XxlZ0LdjtatqxguT+TdkhMvjcTFb/DTMfuz43qRAJXkMYpgZIw1
 LKl/XAxGESPvsUkma/fhnpJFT6vHuA/wYR0HCj353wmU61ZhULULDrRIhxhJsiqx+x7l
 hF6n/O9Tgv9AjmH8gQIGOKyA03myeD4j4CF047xjKPPc3j91wMgtvUBnndQ8Lur6pddw
 sA1zmQU3SsatS0XyvWfzmRC2JmJFfWCGDkiB7Gyo52RODXsucejRp4Ll3EkXAGL7RGkZ
 ru7VwTFjBtNluCDAicUSoKAi+TVJzyFKorWw1+5snw0XfSUADbjUdfAJiKVhrHgdx7WD
 PQCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BK37fHRVqnthuH26rW9Ll64hvEKI8MD8UM28AzmRwT8=;
 b=vAuh8BSkg9D/n631kyPp89bnRZFBDcCQPd9Qw5phpxxZFNKZzO7dexbn+m0gBR4/zO
 n9rjnMsqnx+aP+R4rdIBem4T+/YVwST4a4PXrwLWUuMH5qmrxWQZuCkBBxaRuv69pFnj
 lEZwv42WSQ/Po242d0DwBXVFJhUVVm+6HN9Hn0dTOCHz1dnHC4l1ABiAFqBYQQ60prlu
 8D5gVoXiVusaxHOZ/4id8zXODRnkkG9A8bFuW2oKkN17jK2FZGowqeoxxnCWid1qB9Ye
 FJXw6OlZWcHjK6RIRwRqmi42TJLbH4Pt5eZD1dE4HWT12+TeAGBm+UZwNoI1te1CAs6H
 1VAw==
X-Gm-Message-State: AOAM533dz3WWaGimSUapvWGvSNmWYpkgZuUaPrqXUjJTnBLjgSCJKVPd
 Ue+L58WFaSZO+yH5Br8qbJ98XEYnv+hgTQ==
X-Received: by 2002:adf:f0c6:0:b0:20a:d31b:6 with SMTP id
 x6-20020adff0c6000000b0020ad31b0006mr22168714wro.162.1651775995094; 
 Thu, 05 May 2022 11:39:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 o35-20020a05600c512300b0039454a85a9asm2302121wms.30.2022.05.05.11.39.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:39:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 3/4] target/arm: Implement FEAT_S2FWB
Date: Thu,  5 May 2022 19:39:49 +0100
Message-Id: <20220505183950.2781801-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505183950.2781801-1-peter.maydell@linaro.org>
References: <20220505183950.2781801-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: LL8PtVRIg4Ob

Implement the handling of FEAT_S2FWB; the meat of this is in the new
combined_attrs_fwb() function which combines S1 and S2 attributes
when HCR_EL2.FWB is set.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h    |  5 +++
 target/arm/helper.c | 84 +++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 86 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index db8ff044497..dff0f634c38 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4289,6 +4289,11 @@ static inline bool isar_feature_aa64_st(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, ST) != 0;
 }
 
+static inline bool isar_feature_aa64_fwb(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, FWB) != 0;
+}
+
 static inline bool isar_feature_aa64_bti(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, BT) != 0;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2828f0dacf3..fb8d2bf5c9d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5290,6 +5290,9 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
         if (cpu_isar_feature(aa64_mte, cpu)) {
             valid_mask |= HCR_ATA | HCR_DCT | HCR_TID5;
         }
+        if (cpu_isar_feature(aa64_fwb, cpu)) {
+            valid_mask |= HCR_FWB;
+        }
     }
 
     /* Clear RES0 bits.  */
@@ -5301,8 +5304,10 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
      * HCR_PTW forbids certain page-table setups
      * HCR_DC disables stage1 and enables stage2 translation
      * HCR_DCT enables tagging on (disabled) stage1 translation
+     * HCR_FWB changes the interpretation of stage2 descriptor bits
      */
-    if ((env->cp15.hcr_el2 ^ value) & (HCR_VM | HCR_PTW | HCR_DC | HCR_DCT)) {
+    if ((env->cp15.hcr_el2 ^ value) &
+        (HCR_VM | HCR_PTW | HCR_DC | HCR_DCT | HCR_FWB)) {
         tlb_flush(CPU(cpu));
     }
     env->cp15.hcr_el2 = value;
@@ -10685,9 +10690,15 @@ static bool ptw_attrs_are_device(CPUARMState *env, ARMCacheAttrs cacheattrs)
      * attributes are therefore only Device if stage 2 specifies Device.
      * With HCR_EL2.FWB == 0 this is when descriptor bits [5:4] are 0b00,
      * ie when cacheattrs.attrs bits [3:2] are 0b00.
+     * With HCR_EL2.FWB == 1 this is when descriptor bit [4] is 0, ie
+     * when cacheattrs.attrs bit [2] is 0.
      */
     assert(cacheattrs.is_s2_format);
-    return (cacheattrs.attrs & 0xc) == 0;
+    if (arm_hcr_el2_eff(env) & HCR_FWB) {
+        return (cacheattrs.attrs & 0x4) == 0;
+    } else {
+        return (cacheattrs.attrs & 0xc) == 0;
+    }
 }
 
 /* Translate a S1 pagetable walk through S2 if needed.  */
@@ -12572,6 +12583,69 @@ static uint8_t combined_attrs_nofwb(CPUARMState *env,
     return ret_attrs;
 }
 
+static uint8_t force_cacheattr_nibble_wb(uint8_t attr)
+{
+    /*
+     * Given the 4 bits specifying the outer or inner cacheability
+     * in MAIR format, return a value specifying Normal Write-Back,
+     * with the allocation and transient hints taken from the input
+     * if the input specified some kind of cacheable attribute.
+     */
+    if (attr == 0 || attr == 4) {
+        /*
+         * 0 == an UNPREDICTABLE encoding
+         * 4 == Non-cacheable
+         * Either way, force Write-Back RW allocate non-transient
+         */
+        return 0xf;
+    }
+    /* Change WriteThrough to WriteBack, keep allocation and transient hints */
+    return attr | 4;
+}
+
+/*
+ * Combine the memory type and cacheability attributes of
+ * s1 and s2 for the HCR_EL2.FWB == 1 case, returning the
+ * combined attributes in MAIR_EL1 format.
+ */
+static uint8_t combined_attrs_fwb(CPUARMState *env,
+                                  ARMCacheAttrs s1, ARMCacheAttrs s2)
+{
+    switch (s2.attrs) {
+    case 7:
+        /* Use stage 1 attributes */
+        return s1.attrs;
+    case 6:
+        /*
+         * Force Normal Write-Back. Note that if S1 is Normal cacheable
+         * then we take the allocation hints from it; otherwise it is
+         * RW allocate, non-transient.
+         */
+        if ((s1.attrs & 0xf0) == 0) {
+            /* S1 is Device */
+            return 0xff;
+        }
+        /* Need to check the Inner and Outer nibbles separately */
+        return force_cacheattr_nibble_wb(s1.attrs & 0xf) |
+            force_cacheattr_nibble_wb(s1.attrs >> 4) << 4;
+    case 5:
+        /* If S1 attrs are Device, use them; otherwise Normal Non-cacheable */
+        if ((s1.attrs & 0xf0) == 0) {
+            return s1.attrs;
+        }
+        return 0x44;
+    case 0 ... 3:
+        /* Force Device, of subtype specified by S2 */
+        return s2.attrs << 2;
+    default:
+        /*
+         * RESERVED values (including RES0 descriptor bit [5] being nonzero);
+         * arbitrarily force Device.
+         */
+        return 0;
+    }
+}
+
 /* Combine S1 and S2 cacheability/shareability attributes, per D4.5.4
  * and CombineS1S2Desc()
  *
@@ -12606,7 +12680,11 @@ static ARMCacheAttrs combine_cacheattrs(CPUARMState *env,
     }
 
     /* Combine memory type and cacheability attributes */
-    ret.attrs = combined_attrs_nofwb(env, s1, s2);
+    if (arm_hcr_el2_eff(env) & HCR_FWB) {
+        ret.attrs = combined_attrs_fwb(env, s1, s2);
+    } else {
+        ret.attrs = combined_attrs_nofwb(env, s1, s2);
+    }
 
     /*
      * Any location for which the resultant memory type is any
-- 
2.25.1

