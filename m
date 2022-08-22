Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp1069938ejc;
        Mon, 22 Aug 2022 11:31:20 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5jjuzihBmk7gqSW5PxNGFTMQqxEkt5qMHOTdeLFv5Iu/Vi7OHLNuBo3mfT433snkYNzguf
X-Received: by 2002:ac8:7d84:0:b0:344:662d:278c with SMTP id c4-20020ac87d84000000b00344662d278cmr15808334qtd.513.1661193080747;
        Mon, 22 Aug 2022 11:31:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661193080; cv=none;
        d=google.com; s=arc-20160816;
        b=W0Ow+MisyWWd9wslIc/OqwUFiXoSjDey00iUTNnfTfNOddJKdIKl4wyOq187MaaA6+
         GloClYGn89Yj1Z40Z6nWeXMOz/Rub3DFlkLAEhkaUfW6erVur7ILh+QAukl6pftIM7r3
         OGNbQNPxYXfmFD3RrKlMY5K3AwOeGJXaEOUuqZe743tgZdffnJVANqs6X/U+FhZV9J8D
         DSHAJAfw1bkuBFboMKL/dqII3N2PsHqQG0s+277mdnzElLMt1WlmLhWg+M+DK8xtzBb+
         yN0zRP/TGmbR1A3sdDQL6B1ucBzcAvI9WNGiMoaMIVzyj38vYgkZuO1cAeryjgUSAQHx
         Pqpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/MKMIebQa16txYgeu/nYxxKn3UXY1gtLHITpx3nLDs0=;
        b=tPIlAR+kez4NRNnitmi5XuVMb19fbyFfWCBALe98TlAuHqx0xkhYmeSah0mNT1kN7C
         TktwslWUckmPCLMORac2XHFm/Xh2wP6/GJhCEQeSmlPZWJgWtNTGHXInPJIvDIvKZrYZ
         GAtb/aSgkDhey9+F8t/KKtGoPL3YdLhzNcLQ3OlkNIyXl2J91rPv73z64clmVAzFrrwa
         cduNmOixaMPYc9wlDY0MzaMLqcWX6eaHYwcfQFRCiLTv1L5KOlDLKYj5zW4iRntMN2C+
         45aPNfbrOdebQqFlC9ms3xqvY/oB7H4QG1IbdbT5J7qolj6qYj2RXIoxyonY7X9qKXK4
         INlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SbFbWKYC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d65-20020a376844000000b006b8e360b95fsi4569109qkc.398.2022.08.22.11.31.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Aug 2022 11:31:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SbFbWKYC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQCCm-0005Z9-4p
	for alex.bennee@linaro.org; Mon, 22 Aug 2022 14:31:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9PA-0004tp-67
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 11:31:59 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:37385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9P0-0001ad-4S
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 11:31:55 -0400
Received: by mail-pf1-x42d.google.com with SMTP id x15so9784043pfp.4
 for <qemu-arm@nongnu.org>; Mon, 22 Aug 2022 08:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=/MKMIebQa16txYgeu/nYxxKn3UXY1gtLHITpx3nLDs0=;
 b=SbFbWKYCTKD7u0+pleQnrxC3QgGNlzsHrrw6XHewc/uVgJBhtoxAEwb49KAPLxb5fQ
 rM77hDiA96cK88J0P95nz0ML8lQ1L3HbMOz8iUjszgMtC41faueumI4blOr6zpev3I82
 7+Y3ZGN6JnZA/+ve7xUHx6hAdUurIhNVx3frqPT0Zrm4aQitADOrrvWrr80bQmEhdqui
 2C3yUprVh9J1nl3KTVqktuTbz7AKflcJ9BCZq73Y4qagELIbeeABH+1xCEizp1PbAkOm
 29PL+/Z9yhhbiDkvfnIhQuwJwqu0D7cjJLzF6ilvvWA3TIQ3SW+BQ23V3HuGl9tkDDoU
 1keQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=/MKMIebQa16txYgeu/nYxxKn3UXY1gtLHITpx3nLDs0=;
 b=tNy+oj+uewJ44+CCUjkPEsev75oAzcAg0z/I7uSzssv0PyuNH9s6JXsavgM2P6DrkX
 8x4u2WYh+zoM8f3g6cbi4ueJfYthRcNuLVkH7hcNgakaFnrhDXC4j/DZzw4ttsJHVEeq
 tlL3AJWivfd/EfIFLP8Y38Y6lYwSLubaE8tbww05Fpn5/JVqdUvA39eNTgJElvuqV6mV
 VaxOt23rDRNyVYuwusBbtLQWPDtGw+PLXVNR9u1P6KPPMdGItnaKXLIgY2LNhVC+ylcS
 xISZ6i+DWWVwr4SO/GWHAeLjNXVfkRVxFB3XmUq2VZsusCfhaVkDkoZ5vf5BnscoPZm/
 06JA==
X-Gm-Message-State: ACgBeo1wb6y3NnLiZAFN5FZWhD8IzygyfLQQJ8SZDxsjMaXCmGMGX/69
 ECZgGYP+mnX0ZjuUY10iWOvOjH0suK3HWg==
X-Received: by 2002:a63:c141:0:b0:429:fadb:7138 with SMTP id
 p1-20020a63c141000000b00429fadb7138mr17126964pgi.563.1661182294791; 
 Mon, 22 Aug 2022 08:31:34 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 i6-20020a17090a3d8600b001f262f6f717sm10353835pjc.3.2022.08.22.08.31.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:31:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 60/66] target/arm: Move S1_ptw_translate outside
 arm_ld[lq]_ptw
Date: Mon, 22 Aug 2022 08:27:35 -0700
Message-Id: <20220822152741.1617527-61-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
X-TUID: +d3J4/rcHgnE

Separate S1 translation from the actual lookup.
Will enable lpae hardware updates.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 83 +++++++++++++++++++++++++-----------------------
 1 file changed, 44 insertions(+), 39 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index e898db8765..9ccbc9bd2b 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -267,37 +267,29 @@ static bool S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
 }
 
 /* All loads done in the course of a page table walk go through here. */
-static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
-                            ARMMMUIdx mmu_idx, ARMMMUIdx ptw_idx,
+static uint32_t arm_ldl_ptw(CPUARMState *env, const S1TranslateResult *s1,
                             ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
-    S1TranslateResult s1;
     uint32_t data;
 
-    if (!S1_ptw_translate(env, mmu_idx, ptw_idx, addr, is_secure, &s1, fi)) {
-        /* Failure. */
-        assert(fi->s1ptw);
-        return 0;
-    }
-
-    if (likely(s1.hphys)) {
+    if (likely(s1->hphys)) {
         /* Page tables are in RAM, and we have the host address. */
-        if (s1.be) {
-            data = ldl_be_p(s1.hphys);
+        if (s1->be) {
+            data = ldl_be_p(s1->hphys);
         } else {
-            data = ldl_le_p(s1.hphys);
+            data = ldl_le_p(s1->hphys);
         }
     } else {
         /* Page tables are in MMIO. */
-        MemTxAttrs attrs = { .secure = s1.is_secure };
+        MemTxAttrs attrs = { .secure = s1->is_secure };
         AddressSpace *as = arm_addressspace(cs, attrs);
         MemTxResult result = MEMTX_OK;
 
-        if (s1.be) {
-            data = address_space_ldl_be(as, s1.gphys, attrs, &result);
+        if (s1->be) {
+            data = address_space_ldl_be(as, s1->gphys, attrs, &result);
         } else {
-            data = address_space_ldl_le(as, s1.gphys, attrs, &result);
+            data = address_space_ldl_le(as, s1->gphys, attrs, &result);
         }
         if (unlikely(result != MEMTX_OK)) {
             fi->type = ARMFault_SyncExternalOnWalk;
@@ -308,37 +300,29 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
     return data;
 }
 
-static uint64_t arm_ldq_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
-                            ARMMMUIdx mmu_idx, ARMMMUIdx ptw_idx,
+static uint64_t arm_ldq_ptw(CPUARMState *env, const S1TranslateResult *s1,
                             ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
-    S1TranslateResult s1;
     uint64_t data;
 
-    if (!S1_ptw_translate(env, mmu_idx, ptw_idx, addr, is_secure, &s1, fi)) {
-        /* Failure. */
-        assert(fi->s1ptw);
-        return 0;
-    }
-
-    if (likely(s1.hphys)) {
+    if (likely(s1->hphys)) {
         /* Page tables are in RAM, and we have the host address. */
-        if (s1.be) {
-            data = ldq_be_p(s1.hphys);
+        if (s1->be) {
+            data = ldq_be_p(s1->hphys);
         } else {
-            data = ldq_le_p(s1.hphys);
+            data = ldq_le_p(s1->hphys);
         }
     } else {
         /* Page tables are in MMIO. */
-        MemTxAttrs attrs = { .secure = s1.is_secure };
+        MemTxAttrs attrs = { .secure = s1->is_secure };
         AddressSpace *as = arm_addressspace(cs, attrs);
         MemTxResult result = MEMTX_OK;
 
-        if (s1.be) {
-            data = address_space_ldq_be(as, s1.gphys, attrs, &result);
+        if (s1->be) {
+            data = address_space_ldq_be(as, s1->gphys, attrs, &result);
         } else {
-            data = address_space_ldq_le(as, s1.gphys, attrs, &result);
+            data = address_space_ldq_le(as, s1->gphys, attrs, &result);
         }
         if (unlikely(result != MEMTX_OK)) {
             fi->type = ARMFault_SyncExternalOnWalk;
@@ -470,6 +454,7 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
     int domain = 0;
     int domain_prot;
     hwaddr phys_addr;
+    S1TranslateResult s1;
     uint32_t dacr;
 
     /* Pagetable walk.  */
@@ -479,7 +464,10 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
         fi->type = ARMFault_Translation;
         goto do_fault;
     }
-    desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, ptw_idx, fi);
+    if (!S1_ptw_translate(env, mmu_idx, ptw_idx, table, is_secure, &s1, fi)) {
+        goto do_fault;
+    }
+    desc = arm_ldl_ptw(env, &s1, fi);
     if (fi->type != ARMFault_None) {
         goto do_fault;
     }
@@ -517,7 +505,11 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
             /* Fine pagetable.  */
             table = (desc & 0xfffff000) | ((address >> 8) & 0xffc);
         }
-        desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, ptw_idx, fi);
+        if (!S1_ptw_translate(env, mmu_idx, ptw_idx, table,
+                              is_secure, &s1, fi)) {
+            goto do_fault;
+        }
+        desc = arm_ldl_ptw(env, &s1, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
@@ -593,6 +585,7 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
     int domain_prot;
     hwaddr phys_addr;
     uint32_t dacr;
+    S1TranslateResult s1;
     bool ns;
 
     /* Pagetable walk.  */
@@ -602,7 +595,10 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         fi->type = ARMFault_Translation;
         goto do_fault;
     }
-    desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, ptw_idx, fi);
+    if (!S1_ptw_translate(env, mmu_idx, ptw_idx, table, is_secure, &s1, fi)) {
+        goto do_fault;
+    }
+    desc = arm_ldl_ptw(env, &s1, fi);
     if (fi->type != ARMFault_None) {
         goto do_fault;
     }
@@ -655,7 +651,11 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         ns = extract32(desc, 3, 1);
         /* Lookup l2 entry.  */
         table = (desc & 0xfffffc00) | ((address >> 10) & 0x3fc);
-        desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, ptw_idx, fi);
+        if (!S1_ptw_translate(env, mmu_idx, ptw_idx, table,
+                              is_secure, &s1, fi)) {
+            goto do_fault;
+        }
+        desc = arm_ldl_ptw(env, &s1, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
@@ -1231,13 +1231,18 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
      */
     tableattrs = is_secure ? 0 : (1 << 4);
     for (;;) {
+        S1TranslateResult s1;
         uint64_t descriptor;
         bool nstable;
 
         descaddr |= (address >> (stride * (4 - level))) & indexmask;
         descaddr &= ~7ULL;
         nstable = extract32(tableattrs, 4, 1);
-        descriptor = arm_ldq_ptw(env, descaddr, !nstable, mmu_idx, ptw_idx, fi);
+        if (!S1_ptw_translate(env, mmu_idx, ptw_idx, descaddr,
+                              !nstable, &s1, fi)) {
+            goto do_fault;
+        }
+        descriptor = arm_ldq_ptw(env, &s1, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
-- 
2.34.1

