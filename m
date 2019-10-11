Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp882805wrm;
        Fri, 11 Oct 2019 07:07:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyVbwFc1JdnOfuVgUW+NAYZjKi0S1v6CjOiNKHXuevNFHcYfxTzId56MFDw0TdLoULr19Vr
X-Received: by 2002:a0c:814d:: with SMTP id 71mr15951181qvc.226.1570802861328;
        Fri, 11 Oct 2019 07:07:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570802861; cv=none;
        d=google.com; s=arc-20160816;
        b=QenahObYWL+3s9eZTCRGhZwHf06YSdDFocV5yenwfWcbo94E2YVrzrdFLlQf5nJ5e+
         ULNXr2NN8CSzTNzmFBV9DhqD6TaEwIbkmL7/etLQkM+YPjnb76fhORnEYP6ZlPyfaqxW
         OAr9FyM5VvVXW9Z9jGbadp6XId/G5fpzi8dopX0kjlKlZeFK6Aruh6mNP5tRsSx0lH7M
         7AyqLSqPSMvM+0malE+HwAcCnUcrk1JnfpwIN23uE7Vg15dy8jbxXhgXoqPC3RciUyB2
         bIYr/QscanF1aFYQLjAhonBWTYpzjYX/qxr1utowAnxkFuVDqyCAlMWwbk6At4e89+bw
         uZsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=gTZdg6dNMnBI75tFG4b9WmQnPaXz16dMYJhebtyMXpQ=;
        b=SxGpVMDsLbQxG949JDNxyyKmVP9Z7VKyO1IaqsCXF0Z9uUbtQXWVyfc0TyyquFtfny
         jKHJkbpCuOlVYuhfPQ7MWCbN6KoqHI/Cx9537vKedft/P2ddo/JDN1CoPghEy41VvgC3
         Kk4yIvUb7GmE9QXKWggLPu9mbh9qmAhsoT/DMpT+jwbO8PSUIZ/PheCrzdUOyIg3/cIM
         mP4tKCnoyn6iMkkvnBcd3oTk0Bt5vcwMc4TZASqrR/EW1gN/bP7YhS4wg0qTc1gjFk1t
         n8qxsXUztVMmNyLY7a7C3YUxQXelNVe/iUia2tQbBR2pFvsGpyI5TE5UIP8enIWf5g7H
         btKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wBIDAX+a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v65si8986339qkc.308.2019.10.11.07.07.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Oct 2019 07:07:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wBIDAX+a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIva0-0001L8-NC
	for alex.bennee@linaro.org; Fri, 11 Oct 2019 10:07:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39367)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iIvJP-0006B8-K2
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 09:50:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iIvJO-0004Dr-7S
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 09:50:31 -0400
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41]:41248)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iIvJO-0004DW-3E
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 09:50:30 -0400
Received: by mail-yb1-xb41.google.com with SMTP id 206so3115536ybc.8
 for <qemu-arm@nongnu.org>; Fri, 11 Oct 2019 06:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=gTZdg6dNMnBI75tFG4b9WmQnPaXz16dMYJhebtyMXpQ=;
 b=wBIDAX+asObKfjuVDEL2xU9FHSH3yeVhyyRRVY5ytktNnKxy9YeVaI37JIbBPV8u2E
 v9RWXNv3Dxi9rKk4iAa7iSCpf7B+5R/r4/xJbcoINYl+rIPvQuUba7pq3P7P7uE6OsyC
 SbBwwQsMv6rj9pVqt3m1GkFrZ50cABXZ8G2zu7dK+O13ppOrQ/09abTB+uF6oKzJ8tLL
 ZlFIGQf2642s0+02HSA8OdvH23HoddRgaeTdrtf1GG6DHB5U4MxTntoUiwsXVXXGBXMc
 IfUhkN5eFcdn4TPt6eTsmyMoDQkxGLQm7al3eLhRNZYLIJmqL/75HzXBCb/tz1atclgn
 WrJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=gTZdg6dNMnBI75tFG4b9WmQnPaXz16dMYJhebtyMXpQ=;
 b=QletZ5aOWzSMAn6kTQpM5MgeLhMyhj4HV8SvKNNKblINCBnLFADKaOYhFcWSVb62ac
 roV6XCiRRmQPOaeWOFoU3SutIVeJWwd/NCen1RqPi8btF+vVwr9N+Ld99eVQqGzstgN9
 3tvj3o1L6XGuHjI9xCoY3OTbcDLmPmim+9GlsS5CieHHbiM/SeGQzRPKrgPCvtq7TugD
 7DZiUXQ0Z+BLCDAUqOA96pBl4RS4rnLqS+1/Yhy27ENRQaHsgYwWLUl1uJvTyM9X2o+J
 ax04EVWMWydtfaGt73kcrVoTzXvVilvGnTIstL6fPNid3U5eSfvy5OTY4BlDRv4sfDqw
 Q6/w==
X-Gm-Message-State: APjAAAVhohJ/JxDrzsQxNQYON6G17ZD/FgeiFOtNjImvcSqmLJeD+MhM
 guncxBSxriCeAwLk2JfrB0wSo0qkN3s=
X-Received: by 2002:a5b:349:: with SMTP id q9mr10120579ybp.39.1570801829449;
 Fri, 11 Oct 2019 06:50:29 -0700 (PDT)
Received: from cloudburst.gateway.pace.com (67.216.151.25.pool.hargray.net.
 [67.216.151.25])
 by smtp.gmail.com with ESMTPSA id f68sm2534000ywb.96.2019.10.11.06.50.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 06:50:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 21/22] target/arm: Add mmu indexes for tag memory
Date: Fri, 11 Oct 2019 09:47:43 -0400
Message-Id: <20191011134744.2477-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011134744.2477-1-richard.henderson@linaro.org>
References: <20191011134744.2477-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b41
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +YO0mxYOOh3w

The process by which one goes from an address space plus physical
address to a host pointer is complex.  It is easiest to reuse the
mechanism already present within cputlb, and letting that cache
the results.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-param.h |  2 +-
 target/arm/cpu.h       | 12 +++++++++---
 target/arm/internals.h |  2 ++
 target/arm/helper.c    | 25 +++++++++++++++++++++++--
 4 files changed, 35 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index 6e6948e960..18ac562346 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -29,6 +29,6 @@
 # define TARGET_PAGE_BITS_MIN  10
 #endif
 
-#define NB_MMU_MODES 8
+#define NB_MMU_MODES 9
 
 #endif
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index faca43ea78..c3609ef9d5 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2854,8 +2854,8 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
 #define ARM_MMU_IDX_M_NEGPRI 0x2
 #define ARM_MMU_IDX_M_S 0x4
 
-#define ARM_MMU_IDX_TYPE_MASK (~0x7)
-#define ARM_MMU_IDX_COREIDX_MASK 0x7
+#define ARM_MMU_IDX_TYPE_MASK (~0xf)
+#define ARM_MMU_IDX_COREIDX_MASK 0xf
 
 typedef enum ARMMMUIdx {
     ARMMMUIdx_S12NSE0 = 0 | ARM_MMU_IDX_A,
@@ -2865,6 +2865,9 @@ typedef enum ARMMMUIdx {
     ARMMMUIdx_S1SE0 = 4 | ARM_MMU_IDX_A,
     ARMMMUIdx_S1SE1 = 5 | ARM_MMU_IDX_A,
     ARMMMUIdx_S2NS = 6 | ARM_MMU_IDX_A,
+    ARMMMUIdx_TagNS = 7 | ARM_MMU_IDX_A,
+    ARMMMUIdx_TagS = 8 | ARM_MMU_IDX_A,
+
     ARMMMUIdx_MUser = 0 | ARM_MMU_IDX_M,
     ARMMMUIdx_MPriv = 1 | ARM_MMU_IDX_M,
     ARMMMUIdx_MUserNegPri = 2 | ARM_MMU_IDX_M,
@@ -2891,6 +2894,8 @@ typedef enum ARMMMUIdxBit {
     ARMMMUIdxBit_S1SE0 = 1 << 4,
     ARMMMUIdxBit_S1SE1 = 1 << 5,
     ARMMMUIdxBit_S2NS = 1 << 6,
+    ARMMMUIdxBit_TagNS = 1 << 7,
+    ARMMMUIdxBit_TagS = 1 << 8,
     ARMMMUIdxBit_MUser = 1 << 0,
     ARMMMUIdxBit_MPriv = 1 << 1,
     ARMMMUIdxBit_MUserNegPri = 1 << 2,
@@ -3254,7 +3259,8 @@ enum {
 /* Return the address space index to use for a memory access */
 static inline int arm_asidx_from_attrs(CPUState *cs, MemTxAttrs attrs)
 {
-    return attrs.secure ? ARMASIdx_S : ARMASIdx_NS;
+    return ((attrs.target_tlb_bit2 ? ARMASIdx_TagNS : ARMASIdx_NS)
+            + attrs.secure);
 }
 
 /* Return the AddressSpace to use for a memory access
diff --git a/target/arm/internals.h b/target/arm/internals.h
index a434743b15..dfa395eb35 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -828,6 +828,7 @@ static inline bool regime_is_secure(CPUARMState *env, ARMMMUIdx mmu_idx)
     case ARMMMUIdx_S1NSE1:
     case ARMMMUIdx_S1E2:
     case ARMMMUIdx_S2NS:
+    case ARMMMUIdx_TagNS:
     case ARMMMUIdx_MPrivNegPri:
     case ARMMMUIdx_MUserNegPri:
     case ARMMMUIdx_MPriv:
@@ -836,6 +837,7 @@ static inline bool regime_is_secure(CPUARMState *env, ARMMMUIdx mmu_idx)
     case ARMMMUIdx_S1E3:
     case ARMMMUIdx_S1SE0:
     case ARMMMUIdx_S1SE1:
+    case ARMMMUIdx_TagS:
     case ARMMMUIdx_MSPrivNegPri:
     case ARMMMUIdx_MSUserNegPri:
     case ARMMMUIdx_MSPriv:
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 17981d7c48..3147469899 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8658,9 +8658,18 @@ static inline bool regime_translation_disabled(CPUARMState *env,
         }
     }
 
-    if (mmu_idx == ARMMMUIdx_S2NS) {
+    switch (mmu_idx) {
+    case ARMMMUIdx_S2NS:
         /* HCR.DC means HCR.VM behaves as 1 */
         return (env->cp15.hcr_el2 & (HCR_DC | HCR_VM)) == 0;
+
+    case ARMMMUIdx_TagS:
+    case ARMMMUIdx_TagNS:
+        /* These indexes are qemu internal, and are physically mapped.  */
+        return true;
+
+    default:
+        break;
     }
 
     if (env->cp15.hcr_el2 & HCR_TGE) {
@@ -10662,7 +10671,9 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                    target_ulong *page_size,
                    ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs)
 {
-    if (mmu_idx == ARMMMUIdx_S12NSE0 || mmu_idx == ARMMMUIdx_S12NSE1) {
+    switch (mmu_idx) {
+    case ARMMMUIdx_S12NSE0:
+    case ARMMMUIdx_S12NSE1:
         /* Call ourselves recursively to do the stage 1 and then stage 2
          * translations.
          */
@@ -10713,6 +10724,16 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
              */
             mmu_idx = stage_1_mmu_idx(mmu_idx);
         }
+        break;
+
+    case ARMMMUIdx_TagS:
+    case ARMMMUIdx_TagNS:
+        /* Indicate tag memory to arm_asidx_from_attrs.  */
+        attrs->target_tlb_bit2 = true;
+        break;
+
+    default:
+        break;
     }
 
     /* The page table entries may downgrade secure to non-secure, but
-- 
2.17.1

