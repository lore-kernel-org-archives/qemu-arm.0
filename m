Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp469113ocs;
        Sat, 1 Oct 2022 09:50:47 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5YxrQBmkI79LfaZFpJrSzCxJ9XV5sUUvgq+oaNJ+hGv0QncQ43kb10q95H/bdiG0zUS4At
X-Received: by 2002:a05:6214:19e9:b0:4b0:eace:92fd with SMTP id q9-20020a05621419e900b004b0eace92fdmr6356094qvc.42.1664643047420;
        Sat, 01 Oct 2022 09:50:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664643047; cv=none;
        d=google.com; s=arc-20160816;
        b=fp4iyykqZFJY/bOtubygWx7gJEWJO+5tXe8sJ9nJS+zjbMMi6lu0hQNXWXgO5haALq
         JWWRBcYuQwCwH4nK15stXvQVr0Q+8I0dvG2vh5wO1FjXu+ix4UifBlR7Zx1usUS95Dma
         kvGEZQ6R5P135worZaZKyM2KvzKiPBQT7vt/Li7APh1QmfXblP4mBFT0YGcWV9oeo8jw
         PcSFVHM+qh6II1JFUcDssa9UlaOWARb74M+D/UBhT/GPykH/H/+Y6QxXbQA++otCwYhg
         os6+vopY35dspmfzsNZS5ph8D4115TtRyDn8V7An96lkG8Uy+oMXIoZmE5Zab1Qcojxm
         Sj/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=eb41dB13E+ZPEBfGGmg85O0xNXDKjVd8ViYdMqOjaTw=;
        b=arnQasOt4sSqXw4xPPKYhH6h433SoUPOaZzYbNb8b4fr1Rf5JpSgLz++Shkj1V8FuY
         X/qVScs1fv9jICr0v6ClMXRI4MtoSXmlbWifB1oB3E7NdgYehqERxlGWmdVMns6tZiWt
         afITMVf8uWepODNfyB8G9afsm4W3SK8XjD0ftIvUEAWVr/mydV7ozw4EVksBIKmlFk7i
         cUaj0nbHkfEMfdGYBPeLNtBX/nCcYijYCxLyAoAOHosu+mzuWuKC0yCRWUbgQtIRWrgo
         J5lLD/wPvNvBZKBRytPmx+jATtVFJKFytKEqBqV9P6GhxWq87T+ZM/oZd7T1vGOsNsVS
         YoRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="MU/Pd6j+";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d13-20020a05620a240d00b006cf22d71dc9si3173925qkn.490.2022.10.01.09.50.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Oct 2022 09:50:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="MU/Pd6j+";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oefhO-0003tj-QV
	for alex.bennee@linaro.org; Sat, 01 Oct 2022 12:50:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHx-0007h6-C8
 for qemu-arm@nongnu.org; Sat, 01 Oct 2022 12:24:29 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:42614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHu-0006Gu-AW
 for qemu-arm@nongnu.org; Sat, 01 Oct 2022 12:24:29 -0400
Received: by mail-qk1-x72a.google.com with SMTP id d15so4533135qka.9
 for <qemu-arm@nongnu.org>; Sat, 01 Oct 2022 09:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=eb41dB13E+ZPEBfGGmg85O0xNXDKjVd8ViYdMqOjaTw=;
 b=MU/Pd6j+kwoJLl5nRsXf4241GuKrM6hjR/EcDoIErl1BD2IbhR6QT0DPMvisqZDlwy
 Nwa82qmAg5wRI6+sp7hkJRTIQVbXU7xFJhIIBYXNJZJ9GRkJ3RWNMFtID77HpWxxUdiG
 m8sjy+IwmZvTopuKr5ilXoOiZ6OUUz3ykabQYTJa3QnpYBxS5es5fuGtI8ZLuxsdcdq+
 RoHJ/JKRQEohR0YnXTZTlAS1KzrfwjWycmc+BDK7emhz+Oyz5p7QEtsY1Dy3764LVsAB
 /MRAgi7Y2kkocKxMt1oNDadHZ9+68RztxajR6rIblvgcLBDv+1N3lTfI6nm1JmJirSRv
 JtGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=eb41dB13E+ZPEBfGGmg85O0xNXDKjVd8ViYdMqOjaTw=;
 b=qy/vXMu0tD/B3Ap87gmBRnGZi17Jqmp5xeipRh6yApLgtTqSZx4QXl0QLU5/EvUxhx
 dfmdgC5aDmXbHt7AmdRIZYvXO0GB6CaM+moBGHGtk5AXN6i0t89Y07TtUNvONNcnouwU
 6Wagqx3523+nyyOzgTkyz5XGurYmEk2UppRlunu1nMSJnvGCtFJgLDVB6vbUVRemaBKG
 LbckFjrnQH0qLpZL+mGJSTbbGXziSchkiQuknFZ+i9Cb2KtMHIlcE/FWp5/PIPnuGa0O
 yaiUtVf01ZnlSWFLIOSVdXdBfuUChqrjkbi4n42h9gNom+iSNLGJbQmXSCCHH/TjkmL8
 LdqQ==
X-Gm-Message-State: ACrzQf3ofmPbYZ1Emw6aAdpcHgx9H+3b3hSG/ulF33chijaXgwTcmLON
 zotxrfdkZCBLvCynKZEQXSroyel9Xt/WaA==
X-Received: by 2002:a05:620a:29c5:b0:6ce:b8f3:fd5b with SMTP id
 s5-20020a05620a29c500b006ceb8f3fd5bmr9911997qkp.107.1664641465532; 
 Sat, 01 Oct 2022 09:24:25 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:24:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 26/42] target/arm: Plumb debug into S1_ptw_translate
Date: Sat,  1 Oct 2022 09:23:02 -0700
Message-Id: <20221001162318.153420-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72a.google.com
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
X-TUID: 9Hr//FSpbkJd

Before using softmmu page tables for the ptw, plumb down
a debug parameter so that we can query page table entries
from gdbstub without modifying cpu state.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 66 +++++++++++++++++++++++++++++-------------------
 1 file changed, 40 insertions(+), 26 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 05dcacf45b..45adb9d5a9 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -16,7 +16,7 @@
 
 static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                               bool is_secure, bool s1_is_el0,
+                               bool is_secure, bool s1_is_el0, bool debug,
                                GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
     __attribute__((nonnull));
 
@@ -212,7 +212,7 @@ static bool ptw_attrs_are_device(uint64_t hcr, ARMCacheAttrs cacheattrs)
 
 /* Translate a S1 pagetable walk through S2 if needed.  */
 static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
-                               hwaddr addr, bool *is_secure_ptr,
+                               hwaddr addr, bool *is_secure_ptr, bool debug,
                                ARMMMUFaultInfo *fi)
 {
     bool is_secure = *is_secure_ptr;
@@ -225,7 +225,7 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
         int ret;
 
         ret = get_phys_addr_lpae(env, addr, MMU_DATA_LOAD, s2_mmu_idx,
-                                 is_secure, false, &s2, fi);
+                                 is_secure, false, debug, &s2, fi);
         if (ret) {
             assert(fi->type != ARMFault_None);
             fi->s2addr = addr;
@@ -268,7 +268,7 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
 
 /* All loads done in the course of a page table walk go through here. */
 static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
-                            ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi)
+                            ARMMMUIdx mmu_idx, bool debug, ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
     MemTxAttrs attrs = {};
@@ -276,7 +276,7 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
     AddressSpace *as;
     uint32_t data;
 
-    addr = S1_ptw_translate(env, mmu_idx, addr, &is_secure, fi);
+    addr = S1_ptw_translate(env, mmu_idx, addr, &is_secure, debug, fi);
     attrs.secure = is_secure;
     as = arm_addressspace(cs, attrs);
     if (fi->s1ptw) {
@@ -296,7 +296,7 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
 }
 
 static uint64_t arm_ldq_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
-                            ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi)
+                            ARMMMUIdx mmu_idx, bool debug, ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
     MemTxAttrs attrs = {};
@@ -304,7 +304,7 @@ static uint64_t arm_ldq_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
     AddressSpace *as;
     uint64_t data;
 
-    addr = S1_ptw_translate(env, mmu_idx, addr, &is_secure, fi);
+    addr = S1_ptw_translate(env, mmu_idx, addr, &is_secure, debug, fi);
     attrs.secure = is_secure;
     as = arm_addressspace(cs, attrs);
     if (fi->s1ptw) {
@@ -433,8 +433,8 @@ static int simple_ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap)
 
 static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
                              MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                             bool is_secure, GetPhysAddrResult *result,
-                             ARMMMUFaultInfo *fi)
+                             bool is_secure, bool debug,
+                             GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
     int level = 1;
     uint32_t table;
@@ -453,7 +453,7 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
         fi->type = ARMFault_Translation;
         goto do_fault;
     }
-    desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, fi);
+    desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, debug, fi);
     if (fi->type != ARMFault_None) {
         goto do_fault;
     }
@@ -491,7 +491,7 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
             /* Fine pagetable.  */
             table = (desc & 0xfffff000) | ((address >> 8) & 0xffc);
         }
-        desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, fi);
+        desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, debug, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
@@ -552,8 +552,8 @@ do_fault:
 
 static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
                              MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                             bool is_secure, GetPhysAddrResult *result,
-                             ARMMMUFaultInfo *fi)
+                             bool is_secure, bool debug,
+                             GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = env_archcpu(env);
     int level = 1;
@@ -576,7 +576,7 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         fi->type = ARMFault_Translation;
         goto do_fault;
     }
-    desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, fi);
+    desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, debug, fi);
     if (fi->type != ARMFault_None) {
         goto do_fault;
     }
@@ -629,7 +629,7 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         ns = extract32(desc, 3, 1);
         /* Lookup l2 entry.  */
         table = (desc & 0xfffffc00) | ((address >> 10) & 0x3fc);
-        desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, fi);
+        desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, debug, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
@@ -984,7 +984,7 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
  */
 static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                               bool is_secure, bool s1_is_el0,
+                               bool is_secure, bool s1_is_el0, bool debug,
                                GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = env_archcpu(env);
@@ -1210,7 +1210,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         descaddr |= (address >> (stride * (4 - level))) & indexmask;
         descaddr &= ~7ULL;
         nstable = extract32(tableattrs, 4, 1);
-        descriptor = arm_ldq_ptw(env, descaddr, !nstable, mmu_idx, fi);
+        descriptor = arm_ldq_ptw(env, descaddr, !nstable, mmu_idx, debug, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
@@ -2361,10 +2361,13 @@ static bool get_phys_addr_disabled(CPUARMState *env, target_ulong address,
     return 0;
 }
 
-bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
-                               MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                               bool is_secure, GetPhysAddrResult *result,
-                               ARMMMUFaultInfo *fi)
+static bool get_phys_addr_with_secure_debug(CPUARMState *env,
+                                            target_ulong address,
+                                            MMUAccessType access_type,
+                                            ARMMMUIdx mmu_idx,
+                                            bool is_secure, bool debug,
+                                            GetPhysAddrResult *result,
+                                            ARMMMUFaultInfo *fi)
 {
     ARMMMUIdx s1_mmu_idx = stage_1_mmu_idx(mmu_idx);
 
@@ -2418,7 +2421,7 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
             memset(result, 0, sizeof(*result));
 
             ret = get_phys_addr_lpae(env, ipa, access_type, s2_mmu_idx,
-                                     s2walk_secure, is_el0, result, fi);
+                                     s2walk_secure, is_el0, debug, result, fi);
             fi->s2addr = ipa;
 
             /* Combine the S1 and S2 perms.  */
@@ -2526,16 +2529,25 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
     }
     if (regime_using_lpae_format(env, mmu_idx)) {
         return get_phys_addr_lpae(env, address, access_type, mmu_idx,
-                                  is_secure, false, result, fi);
+                                  is_secure, false, debug, result, fi);
     } else if (regime_sctlr(env, mmu_idx) & SCTLR_XP) {
         return get_phys_addr_v6(env, address, access_type, mmu_idx,
-                                is_secure, result, fi);
+                                is_secure, debug, result, fi);
     } else {
         return get_phys_addr_v5(env, address, access_type, mmu_idx,
-                                is_secure, result, fi);
+                                is_secure, debug, result, fi);
     }
 }
 
+bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
+                               MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                               bool is_secure, GetPhysAddrResult *result,
+                               ARMMMUFaultInfo *fi)
+{
+    return get_phys_addr_with_secure_debug(env, address, access_type, mmu_idx,
+                                           is_secure, false, result, fi);
+}
+
 bool get_phys_addr(CPUARMState *env, target_ulong address,
                    MMUAccessType access_type, ARMMMUIdx mmu_idx,
                    GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
@@ -2587,9 +2599,11 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
     GetPhysAddrResult res = {};
     ARMMMUFaultInfo fi = {};
     ARMMMUIdx mmu_idx = arm_mmu_idx(env);
+    bool is_secure = arm_is_secure(env);
     bool ret;
 
-    ret = get_phys_addr(env, addr, MMU_DATA_LOAD, mmu_idx, &res, &fi);
+    ret = get_phys_addr_with_secure_debug(env, addr, MMU_DATA_LOAD, mmu_idx,
+                                          is_secure, true, &res, &fi);
     *attrs = res.f.attrs;
 
     if (ret) {
-- 
2.34.1

