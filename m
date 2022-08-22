Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp979401ejc;
        Mon, 22 Aug 2022 08:27:46 -0700 (PDT)
X-Received: by 2002:a17:902:7208:b0:172:a9d6:527 with SMTP id ba8-20020a170902720800b00172a9d60527mr20348142plb.32.1661182065801;
        Mon, 22 Aug 2022 08:27:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661182065; cv=none;
        d=google.com; s=arc-20160816;
        b=kPnaz45yexFRxz1Ymb8NoYaAZKS3mf2oD/B9u2gzuSCSg5ulabyKsR9qxpxVKd0PAO
         XGpqV6u8tuTwkQ7U4IIEi6GqW/nfxYBHe5PtOPoxMiT/imMAuu0r39aQA4FzTZ9W7pEX
         n5UyOt6D7nUT8KyvKvC09RJ3i55VOhgeHGPRVjmYuNYBa5892hInlMcMhV6s8xlf2ABl
         UZzJqnHgAwiYpVxdnsIvtgLUowmizqNJPYYz+VDDQZXLFydfDM8RHHkXZlYsPYyX3Xvx
         lEjG1/XII1Mxkpw+ju65akln9l6TyAWWmlldVPXze9l8ZeBKYEMq4030ZbheXI83CuBg
         cAGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Kjbrp5bm88e/qRtLpUBYrca0xBOcPN6yN6kx+yhAThA=;
        b=t6HG7p+lSsLYZjEtrqmdkp+K5AG5e27l0mdp3FGrPQKaWQvfKwpdtQaNQXj4Wm5wLz
         3aSXI4mcMTc3i5v2tqf4eUOxt2cAzYOulw5NHL3IokyzLWfkXSGtm6b4Kyq5KoJ7QT4X
         LN9RpXHwk3NfomVwv5SeBxKSxW3oi/dW0cHDYpIi2QOA6Hf5pa/3csACpDYcmH/0DQXH
         NJ+lxMd1VCMFFwAKPP1ujIMbITRDC25LnbxF/0C52/sR1lvUmA3K7mK26d/764peZern
         WmP+3vZ7G7AKbB33xKd0blE9YtivxEcHpSdjh8HWnBkV6E8EQTbkDUeNLPj4/qOpP3TD
         SXqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DREKFKYZ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v5-20020a056a00148500b0052d8b428bb9sor6349179pfu.81.2022.08.22.08.27.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 Aug 2022 08:27:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DREKFKYZ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=Kjbrp5bm88e/qRtLpUBYrca0xBOcPN6yN6kx+yhAThA=;
        b=DREKFKYZl1UJY36X8M9Cl/P1svJo84mNYRgBWGyv9cdspIm80gQTwdVIx2H1bn9bHZ
         QLyXvWMRevyHNuBVol1BQrO5T0ECxkegZ+FRkEaeUBBvyBb1ryKqva8cczZ1V2hEBCYi
         soGE8zv+1Vb7iL640wo2dT6xzG61b2zDuWoTjBoU6ZxLVoacp5WlNi2mWGOhoLtDQ34a
         1WvoYzV+NNWMMO/kj0Uq18M6NdI8nCLUy5XvRwvICDmC0Lvpgxt2ThxJupVux4Xls7F2
         Lr8Z5ZDQsd5BUrPr5WDKMSw4KWxJdPlYJK5kJFDwVZ1YUeFuHmgkQ0TZZHQyyCvkC6yY
         r2QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Kjbrp5bm88e/qRtLpUBYrca0xBOcPN6yN6kx+yhAThA=;
        b=yF0CK0w4GAvDfadJBqvg/yQvscd/q79UrvgF9bluSv2ncyIUvZ4zwwowbK6S728u3Z
         x0NGv4JP7PE0ViKJoGoEpOksf3ca73s08aDmBHJavSTJRNp/fdg/vKdy7csRLy5FmBIB
         fyH89CWOAdlbF1JhqXoO8y2C6RSB1mlg0+FgDe1V2Ts9ixXkMO5o/V4etdYOsqR52uhi
         2i2aYUBFBezlwpU77gjqb59/G0MD80XBh5rQTK5tcjCiD/07IZRg1CMQ4G3DPCDO/5hC
         Qd49cEpFkQ04bpML1Bog0hiYII5ydLeFkiVdMpUJkpRTM6SXqtXL1k5rG9hpUAgAoOXN
         gyJg==
X-Gm-Message-State: ACgBeo1F7o4nU7iorrxjy8lcVGtmjYlQm3xBmvqVDxLVo10zmdhcXwIz
	OFGsMTxgljcXr3lZtYpQzFqypX/C
X-Google-Smtp-Source: AA6agR59z9Q+MtDcNwNIcFpHRXL11MQmxlsy5sUM8hnm7dhdX4gv0k8vb4/JqscztZiXXeI7lsw6VQ==
X-Received: by 2002:aa7:9731:0:b0:536:7b04:acb6 with SMTP id k17-20020aa79731000000b005367b04acb6mr7841997pfg.43.1661182065230;
        Mon, 22 Aug 2022 08:27:45 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([71.212.157.236])
        by smtp.gmail.com with ESMTPSA id q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 08:27:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 03/66] target/arm: Use GetPhysAddrResult in get_phys_addr_lpae
Date: Mon, 22 Aug 2022 08:26:38 -0700
Message-Id: <20220822152741.1617527-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ESnpinU7hcBD

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 69 ++++++++++++++++++------------------------------
 1 file changed, 26 insertions(+), 43 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 478ff74550..4f248f6266 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -16,10 +16,8 @@
 
 static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                               bool s1_is_el0, hwaddr *phys_ptr,
-                               MemTxAttrs *txattrs, int *prot,
-                               target_ulong *page_size_ptr,
-                               ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs)
+                               bool s1_is_el0, GetPhysAddrResult *result,
+                               ARMMMUFaultInfo *fi)
     __attribute__((nonnull));
 
 /* This mapping is common between ID_AA64MMFR0.PARANGE and TCR_ELx.{I}PS. */
@@ -204,18 +202,13 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
 {
     if (arm_mmu_idx_is_stage1_of_2(mmu_idx) &&
         !regime_translation_disabled(env, ARMMMUIdx_Stage2)) {
-        target_ulong s2size;
-        hwaddr s2pa;
-        int s2prot;
-        int ret;
         ARMMMUIdx s2_mmu_idx = *is_secure ? ARMMMUIdx_Stage2_S
                                           : ARMMMUIdx_Stage2;
-        ARMCacheAttrs cacheattrs = {};
-        MemTxAttrs txattrs = {};
+        GetPhysAddrResult s2 = {};
+        int ret;
 
         ret = get_phys_addr_lpae(env, addr, MMU_DATA_LOAD, s2_mmu_idx, false,
-                                 &s2pa, &txattrs, &s2prot, &s2size, fi,
-                                 &cacheattrs);
+                                 &s2, fi);
         if (ret) {
             assert(fi->type != ARMFault_None);
             fi->s2addr = addr;
@@ -225,7 +218,7 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
             return ~0;
         }
         if ((arm_hcr_el2_eff(env) & HCR_PTW) &&
-            ptw_attrs_are_device(env, cacheattrs)) {
+            ptw_attrs_are_device(env, s2.cacheattrs)) {
             /*
              * PTW set and S1 walk touched S2 Device memory:
              * generate Permission fault.
@@ -249,7 +242,7 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
             assert(!*is_secure);
         }
 
-        addr = s2pa;
+        addr = s2.phys;
     }
     return addr;
 }
@@ -972,19 +965,13 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
  *             table walk), must be true if this is stage 2 of a stage 1+2
  *             walk for an EL0 access. If @mmu_idx is anything else,
  *             @s1_is_el0 is ignored.
- * @phys_ptr: set to the physical address corresponding to the virtual address
- * @attrs: set to the memory transaction attributes to use
- * @prot: set to the permissions for the page containing phys_ptr
- * @page_size_ptr: set to the size of the page containing phys_ptr
+ * @result: set on translation success,
  * @fi: set to fault info if the translation fails
- * @cacheattrs: (if non-NULL) set to the cacheability/shareability attributes
  */
 static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                               bool s1_is_el0, hwaddr *phys_ptr,
-                               MemTxAttrs *txattrs, int *prot,
-                               target_ulong *page_size_ptr,
-                               ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs)
+                               bool s1_is_el0, GetPhysAddrResult *result,
+                               ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = env_archcpu(env);
     /* Read an LPAE long-descriptor translation table. */
@@ -1302,16 +1289,16 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
         ns = mmu_idx == ARMMMUIdx_Stage2;
         xn = extract32(attrs, 11, 2);
-        *prot = get_S2prot(env, ap, xn, s1_is_el0);
+        result->prot = get_S2prot(env, ap, xn, s1_is_el0);
     } else {
         ns = extract32(attrs, 3, 1);
         xn = extract32(attrs, 12, 1);
         pxn = extract32(attrs, 11, 1);
-        *prot = get_S1prot(env, mmu_idx, aarch64, ap, ns, xn, pxn);
+        result->prot = get_S1prot(env, mmu_idx, aarch64, ap, ns, xn, pxn);
     }
 
     fault_type = ARMFault_Permission;
-    if (!(*prot & (1 << access_type))) {
+    if (!(result->prot & (1 << access_type))) {
         goto do_fault;
     }
 
@@ -1321,23 +1308,23 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
          * the CPU doesn't support TZ or this is a non-secure translation
          * regime, because the attribute will already be non-secure.
          */
-        txattrs->secure = false;
+        result->attrs.secure = false;
     }
     /* When in aarch64 mode, and BTI is enabled, remember GP in the IOTLB.  */
     if (aarch64 && guarded && cpu_isar_feature(aa64_bti, cpu)) {
-        arm_tlb_bti_gp(txattrs) = true;
+        arm_tlb_bti_gp(&result->attrs) = true;
     }
 
     if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
-        cacheattrs->is_s2_format = true;
-        cacheattrs->attrs = extract32(attrs, 0, 4);
+        result->cacheattrs.is_s2_format = true;
+        result->cacheattrs.attrs = extract32(attrs, 0, 4);
     } else {
         /* Index into MAIR registers for cache attributes */
         uint8_t attrindx = extract32(attrs, 0, 3);
         uint64_t mair = env->cp15.mair_el[regime_el(env, mmu_idx)];
         assert(attrindx <= 7);
-        cacheattrs->is_s2_format = false;
-        cacheattrs->attrs = extract64(mair, attrindx * 8, 8);
+        result->cacheattrs.is_s2_format = false;
+        result->cacheattrs.attrs = extract64(mair, attrindx * 8, 8);
     }
 
     /*
@@ -1346,13 +1333,13 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
      * that case comes from TCR_ELx, which we extracted earlier.
      */
     if (param.ds) {
-        cacheattrs->shareability = param.sh;
+        result->cacheattrs.shareability = param.sh;
     } else {
-        cacheattrs->shareability = extract32(attrs, 6, 2);
+        result->cacheattrs.shareability = extract32(attrs, 6, 2);
     }
 
-    *phys_ptr = descaddr;
-    *page_size_ptr = page_size;
+    result->phys = descaddr;
+    result->page_size = page_size;
     return false;
 
 do_fault:
@@ -2354,10 +2341,8 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
             cacheattrs1 = result->cacheattrs;
             memset(result, 0, sizeof(*result));
 
-            ret = get_phys_addr_lpae(env, ipa, access_type, s2_mmu_idx, is_el0,
-                                     &result->phys, &result->attrs,
-                                     &result->prot, &result->page_size,
-                                     fi, &result->cacheattrs);
+            ret = get_phys_addr_lpae(env, ipa, access_type, s2_mmu_idx,
+                                     is_el0, result, fi);
             fi->s2addr = ipa;
 
             /* Combine the S1 and S2 perms.  */
@@ -2528,9 +2513,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
 
     if (regime_using_lpae_format(env, mmu_idx)) {
         return get_phys_addr_lpae(env, address, access_type, mmu_idx, false,
-                                  &result->phys, &result->attrs,
-                                  &result->prot, &result->page_size,
-                                  fi, &result->cacheattrs);
+                                  result, fi);
     } else if (regime_sctlr(env, mmu_idx) & SCTLR_XP) {
         return get_phys_addr_v6(env, address, access_type, mmu_idx,
                                 &result->phys, &result->attrs,
-- 
2.34.1
