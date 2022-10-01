Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp465037ocs;
        Sat, 1 Oct 2022 09:39:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7/cB2wRaAS4+BGYZIBGrX5+kzh4q+WXkEuwakYa1f/r/T4ID5kklCJMEyczieM82dwnP9R
X-Received: by 2002:a05:622a:d3:b0:35d:4d3e:144f with SMTP id p19-20020a05622a00d300b0035d4d3e144fmr11116111qtw.516.1664642361880;
        Sat, 01 Oct 2022 09:39:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664642361; cv=none;
        d=google.com; s=arc-20160816;
        b=RM32ZzaYZcQ+EXUBwccUx4r7u1NRlznxnY2O8C3/zFLbE6Ru4rruNZq3+SM9frS2Pa
         U04Au5M6rKz5w7hFF96pSJ2Vy8MIAkkyBteuUpXlpivFAaBefm5MBEbx0qOdFQNzXOUG
         7QhpiR4p0VACTEWYigwy47P7hQGfBVGADmCKdBuKTJcsMHqUeM3LzlkMnz13mpl/7JR+
         qliHrl7vWL4EFPq9vVAed6artft8OFWLrXbhYme0xGsncXpAUWE9E8wrqUG7pTKbTs8h
         JKI6mmxZ2s1yvkNQ4zANyYATbXjweOJZ/ox582DG0PE4t+JJ8QoxnQw+z6rNhhNaCtoA
         BEGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8Pt4idMHV+SQTFhlrqrA/oWq+H95plUs6Sfrolgz6Ls=;
        b=Gh7985nle0+n3nng8lzAqTBvG7c8vqSEHDOvJ+exoXt7D39OlBk64/YNvNh0smtp8j
         vn9CtemmwW4X0inukAcmrO1JVNigUYHQqZX5AFF7mINsY281IfHqh/R4N8YfyRMBq4Gw
         DOye31GZ0IYfydVO3X/wM9epQ4H9JDx/p8CEGWNzKfsw/bH4+OegLshmjNG4Uq/38G7d
         BxAhAEW4wmY9WspS0XqF3/LNMOlu2jvoPOe9dGaGZCE0+iW/gBhWSbVXQmSEEn/c9Fjo
         u2z7O8Llxs66g/H4qQstWZIsn2w0QnMT0pv+3JvmM4eO/ugWGzTfJl5oItBPcZzNzVx2
         ijKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gk6STV9o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j20-20020ac85514000000b0035bab9b85dfsi2222137qtq.450.2022.10.01.09.39.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Oct 2022 09:39:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gk6STV9o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oefWL-0003Nu-EE
	for alex.bennee@linaro.org; Sat, 01 Oct 2022 12:39:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHt-0007XQ-VZ
 for qemu-arm@nongnu.org; Sat, 01 Oct 2022 12:24:26 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:45762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHs-0006Dr-0n
 for qemu-arm@nongnu.org; Sat, 01 Oct 2022 12:24:25 -0400
Received: by mail-qt1-x82a.google.com with SMTP id r20so4338736qtn.12
 for <qemu-arm@nongnu.org>; Sat, 01 Oct 2022 09:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=8Pt4idMHV+SQTFhlrqrA/oWq+H95plUs6Sfrolgz6Ls=;
 b=Gk6STV9oxtGDPdNkdmTUoLnQN729OGcFCRF8Y+zE+KE/EuzwuCC3VXb5suiSvR6Y2H
 7W0VWxIiwGrn8FtJ6Cico47Vc9C8aZ+TWcsok7PRWS8QjgihieWYm2942aZNlHsG1QcU
 BzJEpDpBZdsduQ3EDvzRS6tvWSAUov1yJ/sILQNwmSt56NOcGF1frqfLcK3UCLo6jfmh
 YDciXu1d7mrBoYKB7Q1CU1uAej0R+k+3eLdqHyRlM5WOo4ms2r/flAU/lq3pRT1nuXPc
 1tf0vBVb4/9vAwOCL/W8zs1ZquCckfGH8dxvFz48Vkooicul5U9lVUkbsGfAyl2/gJiB
 UOnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=8Pt4idMHV+SQTFhlrqrA/oWq+H95plUs6Sfrolgz6Ls=;
 b=VxBQCT9Hs941Wm0iNI81YKCQAONsdjFsPZkltVuPmQ5YGGb53TpToyYk8TVqWgd4YO
 st7FrQNwGFJ8GWJYtgSxMxxkuhwqkpU3cxkxTz6fT+dldHeDL7lYVoaILws3rxEdTY6g
 GO1Co/xLAM833di8wOZ6u6bhfkrjA8kIT+w7dgCmPVwQCS6RjXlwee5L06/ZaRu0AMgU
 1OKPrjzF10VfHjmx3eXJg8pBy4zDec+nur+GZgmvqtKWr7Cx0ORd8fsc3f2qdP/Y32P/
 yIaZhFfBYzWFYwROGUXB7zVmUPny2RX2UyEPtFTQAbu9alvp/NpK6j+kGH9gWw1kcL01
 Nw4g==
X-Gm-Message-State: ACrzQf35cmgLVCNp2yIA0tMm0ae0YCl58J0r4Nk36Zl5hiFxOtg82ilp
 lbyiI2C4m+s8jzrkXKniYUfzjw==
X-Received: by 2002:ac8:5e14:0:b0:35c:bab9:173e with SMTP id
 h20-20020ac85e14000000b0035cbab9173emr11194971qtx.222.1664641463304; 
 Sat, 01 Oct 2022 09:24:23 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:24:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 25/42] target/arm: Move ARMMMUIdx_Stage2 to a real tlb
 mmu_idx
Date: Sat,  1 Oct 2022 09:23:01 -0700
Message-Id: <20221001162318.153420-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82a.google.com
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
X-TUID: 8J3+RpbKknRE

We had been marking this ARM_MMU_IDX_NOTLB, move it to a real tlb.
Flush the tlb when invalidating stage 1+2 translations.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-param.h |  2 +-
 target/arm/cpu.h       | 23 +++++++++++++----------
 target/arm/helper.c    |  4 +++-
 3 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index 98bd9e435e..283618f601 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -40,6 +40,6 @@
     bool guarded;
 #endif
 
-#define NB_MMU_MODES 10
+#define NB_MMU_MODES 12
 
 #endif
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 0effa85c56..732c0c00ac 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2900,8 +2900,9 @@ bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync);
  * EL2 (aka NS PL2)
  * EL3 (aka S PL1)
  * Physical (NS & S)
+ * Stage2 (NS & S)
  *
- * for a total of 10 different mmu_idx.
+ * for a total of 12 different mmu_idx.
  *
  * R profile CPUs have an MPU, but can use the same set of MMU indexes
  * as A profile. They only need to distinguish EL0 and EL1 (and
@@ -2970,6 +2971,15 @@ typedef enum ARMMMUIdx {
     ARMMMUIdx_Phys_NS   = 8 | ARM_MMU_IDX_A,
     ARMMMUIdx_Phys_S    = 9 | ARM_MMU_IDX_A,
 
+    /*
+     * Used for second stage of an S12 page table walk, or for descriptor
+     * loads during first stage of an S1 page table walk.  Note that both
+     * are in use simultaneously for SecureEL2: the security state for
+     * the S2 ptw is selected by the NS bit from the S1 ptw.
+     */
+    ARMMMUIdx_Stage2    = 10 | ARM_MMU_IDX_A,
+    ARMMMUIdx_Stage2_S  = 11 | ARM_MMU_IDX_A,
+
     /*
      * These are not allocated TLBs and are used only for AT system
      * instructions or for the first stage of an S12 page table walk.
@@ -2977,15 +2987,6 @@ typedef enum ARMMMUIdx {
     ARMMMUIdx_Stage1_E0 = 0 | ARM_MMU_IDX_NOTLB,
     ARMMMUIdx_Stage1_E1 = 1 | ARM_MMU_IDX_NOTLB,
     ARMMMUIdx_Stage1_E1_PAN = 2 | ARM_MMU_IDX_NOTLB,
-    /*
-     * Not allocated a TLB: used only for second stage of an S12 page
-     * table walk, or for descriptor loads during first stage of an S1
-     * page table walk. Note that if we ever want to have a TLB for this
-     * then various TLB flush insns which currently are no-ops or flush
-     * only stage 1 MMU indexes will need to change to flush stage 2.
-     */
-    ARMMMUIdx_Stage2     = 3 | ARM_MMU_IDX_NOTLB,
-    ARMMMUIdx_Stage2_S   = 4 | ARM_MMU_IDX_NOTLB,
 
     /*
      * M-profile.
@@ -3016,6 +3017,8 @@ typedef enum ARMMMUIdxBit {
     TO_CORE_BIT(E20_2),
     TO_CORE_BIT(E20_2_PAN),
     TO_CORE_BIT(E3),
+    TO_CORE_BIT(Stage2),
+    TO_CORE_BIT(Stage2_S),
 
     TO_CORE_BIT(MUser),
     TO_CORE_BIT(MPriv),
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 6fe85c6642..19a03eb200 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4319,7 +4319,9 @@ static int alle1_tlbmask(CPUARMState *env)
      */
     return (ARMMMUIdxBit_E10_1 |
             ARMMMUIdxBit_E10_1_PAN |
-            ARMMMUIdxBit_E10_0);
+            ARMMMUIdxBit_E10_0 |
+            ARMMMUIdxBit_Stage2 |
+            ARMMMUIdxBit_Stage2_S);
 }
 
 static int e2_tlbmask(CPUARMState *env)
-- 
2.34.1

