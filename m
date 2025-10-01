Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E45CAC5BB
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 15:19:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3ySN-0004GU-2V; Wed, 01 Oct 2025 11:09:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3ySH-000463-Ee
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 11:09:21 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3yQG-0000qa-3M
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 11:09:18 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3c68ac7e18aso4988829f8f.2
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 08:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759331228; x=1759936028; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7mq73JsY80I+RbmAdLEU0nyn7j5rR3V80UMFQRUniNk=;
 b=Nr/9gZk8n/Vz5sZ6T/75ZMR9t4N3PoCSPoYey179RFE73fQfEOnuv1dSC8YhoYcbOt
 J0c4y8710yjUJSYlgnVwav9rYC8GrPF7WmY0zho0TZae+wo8JY3h/16Caa5L/9DwU+Nd
 VOOh8vnv8P5u+2/FeWFtCZYtI7fFGloKfzeWD0wA+49130/F/F4vo7QROEWtTK3nwMBw
 y7W3iI3P4Kscn/Z40gUYUzN3d2cOmlSI3Ys8x2giz3u/eCgqQIREVAMiHHiGZQzvc4OO
 48yBWOixB5u35LJf0LwWA9JKkhyw/tpVxdLlp18oMcaJeeOVNiGEsgU0JoKFsIEnKbIk
 sv+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759331228; x=1759936028;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7mq73JsY80I+RbmAdLEU0nyn7j5rR3V80UMFQRUniNk=;
 b=OuFwfm7BVN+wFSQCDHEYihTuv8RVSVitu7+4lgkcMAe3+wffJq18qtXRANaTv9RsQe
 MzJC+nNiTzyuCENaE2ngGEvqBJjB8t+7C8+9uZjYydc+SBVViHR4JCCNpqxN1doGGPtk
 zUJbgEPTDN/ZftK72mxUsPHMswW3mp/R1WCVRYHrpfXVPFOdexpuJ5T92/vvG0CH/RA3
 bR5slVZA0MiUupGHXFSR/1pfyg43iNJqy4tqtxuYjUKeOySKjetY7If8I40dcdJDc1Kt
 Eaa86yzKT39xuhsvs3DqxPTAkxjYO0RNLWgOHwBUyo3IepKCIPuba5H61V8zZ2ZEfjRJ
 2QGQ==
X-Gm-Message-State: AOJu0YyT6290sUnbarhHR9vk2XUIjAJZ+TN78ezJ3rDAhHMP0eV0jQt+
 5lTTmSb4c9NGpM2G5xnbigKV/MXfR1QbjkczGeMfH+2S/ysyGhkRW9cZQzvjRXidKmpxBZUbEjr
 qxLLr5cJHUA==
X-Gm-Gg: ASbGncshq8c7suIwizc2X91T+YEZrW38yObOLQtjX/ZAT0RFqaPbcU3/0daBj+bi/Kw
 swAWKd2UkB55Izokj5XL4+fXQ8PjDwMbt5JnW8EwYgBm3md6RLclRAO9puox5L/JamCGoH1sw4T
 auYi2rOlOQvbiUyuVUhl1PVyawVXThlnuDxZ8xX+mVJbZaJ8y6ZY690xp5EZMHg3qabaSsHBBms
 boA1YNlBSaVkjaVYL5pACrUmItaldPC/BdN1cLMu+KNq5PTtmZ0tpOUJG61jEN+D6tUTzWpDVUi
 2iXWSaXrOv9jYVL5FgS5p07P6srM46FLwsTDPfbh6b7pnfoZ8Ba/dHX/myb7Qp00UDNVS206TY7
 WtnF770gGHeHZnKKfMic6bWMY6VD1q11YmHtLXq4fkdb4tnIe5JmpNOW4OupcBBmgnL6XThKaoy
 nJA4ihZ3eUx/FhQzUkI285qK/EsiKlPy8=
X-Google-Smtp-Source: AGHT+IG9M1GfxjLnXSzyU42V3GnIoott0XjWEOplId5rUVd+pmxzyuqf9S4f9T1BZ0baGFoBOjykwQ==
X-Received: by 2002:a05:6000:420a:b0:3f3:3c88:505e with SMTP id
 ffacd0b85a97d-4255780522fmr2660404f8f.29.1759331228550; 
 Wed, 01 Oct 2025 08:07:08 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc5602f15sm27444186f8f.39.2025.10.01.08.07.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 08:07:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PATCH 19/22] target/sparc: Get cpu first addr space with
 cpu_get_address_space()
Date: Wed,  1 Oct 2025 17:05:24 +0200
Message-ID: <20251001150529.14122-20-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001150529.14122-1-philmd@linaro.org>
References: <20251001150529.14122-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

In order to remove the convenient CPUState::as field, access
the vcpu first address space using the cpu_get_address_space()
helper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/sparc/ldst_helper.c | 22 ++++++++++++----------
 target/sparc/mmu_helper.c  | 21 ++++++++++++---------
 2 files changed, 24 insertions(+), 19 deletions(-)

diff --git a/target/sparc/ldst_helper.c b/target/sparc/ldst_helper.c
index 2c63eb9e036..35d1f63fd2a 100644
--- a/target/sparc/ldst_helper.c
+++ b/target/sparc/ldst_helper.c
@@ -700,23 +700,24 @@ uint64_t helper_ld_asi(CPUSPARCState *env, target_ulong addr,
     {
         MemTxResult result;
         hwaddr access_addr = (hwaddr)addr | ((hwaddr)(asi & 0xf) << 32);
+        AddressSpace *as = cpu_get_address_space(cs, 0);
 
         switch (size) {
         case 1:
-            ret = address_space_ldub(cs->as, access_addr,
+            ret = address_space_ldub(as, access_addr,
                                      MEMTXATTRS_UNSPECIFIED, &result);
             break;
         case 2:
-            ret = address_space_lduw(cs->as, access_addr,
+            ret = address_space_lduw(as, access_addr,
                                      MEMTXATTRS_UNSPECIFIED, &result);
             break;
         default:
         case 4:
-            ret = address_space_ldl(cs->as, access_addr,
+            ret = address_space_ldl(as, access_addr,
                                     MEMTXATTRS_UNSPECIFIED, &result);
             break;
         case 8:
-            ret = address_space_ldq(cs->as, access_addr,
+            ret = address_space_ldq(as, access_addr,
                                     MEMTXATTRS_UNSPECIFIED, &result);
             break;
         }
@@ -809,6 +810,7 @@ void helper_st_asi(CPUSPARCState *env, target_ulong addr, uint64_t val,
 {
     int size = 1 << (memop & MO_SIZE);
     CPUState *cs = env_cpu(env);
+    AddressSpace *as = cpu_get_address_space(cs, 0);
 
     do_check_align(env, addr, size - 1, GETPC());
     switch (asi) {
@@ -878,7 +880,7 @@ void helper_st_asi(CPUSPARCState *env, target_ulong addr, uint64_t val,
                 MemTxResult result;
                 hwaddr access_addr = (env->mxccregs[0] & 0xffffffffULL) + 8 * i;
 
-                env->mxccdata[i] = address_space_ldq(cs->as,
+                env->mxccdata[i] = address_space_ldq(as,
                                                      access_addr,
                                                      MEMTXATTRS_UNSPECIFIED,
                                                      &result);
@@ -906,7 +908,7 @@ void helper_st_asi(CPUSPARCState *env, target_ulong addr, uint64_t val,
                 MemTxResult result;
                 hwaddr access_addr = (env->mxccregs[1] & 0xffffffffULL) + 8 * i;
 
-                address_space_stq(cs->as, access_addr, env->mxccdata[i],
+                address_space_stq(as, access_addr, env->mxccdata[i],
                                   MEMTXATTRS_UNSPECIFIED, &result);
 
                 if (result != MEMTX_OK) {
@@ -1068,20 +1070,20 @@ void helper_st_asi(CPUSPARCState *env, target_ulong addr, uint64_t val,
 
             switch (size) {
             case 1:
-                address_space_stb(cs->as, access_addr, val,
+                address_space_stb(as, access_addr, val,
                                   MEMTXATTRS_UNSPECIFIED, &result);
                 break;
             case 2:
-                address_space_stw(cs->as, access_addr, val,
+                address_space_stw(as, access_addr, val,
                                   MEMTXATTRS_UNSPECIFIED, &result);
                 break;
             case 4:
             default:
-                address_space_stl(cs->as, access_addr, val,
+                address_space_stl(as, access_addr, val,
                                   MEMTXATTRS_UNSPECIFIED, &result);
                 break;
             case 8:
-                address_space_stq(cs->as, access_addr, val,
+                address_space_stq(as, access_addr, val,
                                   MEMTXATTRS_UNSPECIFIED, &result);
                 break;
             }
diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c
index 217580a4d8c..1e13ef3da40 100644
--- a/target/sparc/mmu_helper.c
+++ b/target/sparc/mmu_helper.c
@@ -80,6 +80,7 @@ static int get_physical_address(CPUSPARCState *env, CPUTLBEntryFull *full,
     unsigned long page_offset;
     CPUState *cs = env_cpu(env);
     MemTxResult result;
+    AddressSpace *as;
 
     is_user = mmu_idx == MMU_USER_IDX;
 
@@ -96,13 +97,14 @@ static int get_physical_address(CPUSPARCState *env, CPUTLBEntryFull *full,
         return 0;
     }
 
+    as = cpu_get_address_space(cs, 0);
     *access_index = ((rw & 1) << 2) | (rw & 2) | (is_user ? 0 : 1);
     full->phys_addr = 0xffffffffffff0000ULL;
 
     /* SPARC reference MMU table walk: Context table->L1->L2->PTE */
     /* Context base + context number */
     pde_ptr = (env->mmuregs[1] << 4) + (env->mmuregs[2] << 2);
-    pde = address_space_ldl(cs->as, pde_ptr, MEMTXATTRS_UNSPECIFIED, &result);
+    pde = address_space_ldl(as, pde_ptr, MEMTXATTRS_UNSPECIFIED, &result);
     if (result != MEMTX_OK) {
         return 4 << 2; /* Translation fault, L = 0 */
     }
@@ -117,7 +119,7 @@ static int get_physical_address(CPUSPARCState *env, CPUTLBEntryFull *full,
         return 4 << 2;
     case 1: /* L0 PDE */
         pde_ptr = ((address >> 22) & ~3) + ((pde & ~3) << 4);
-        pde = address_space_ldl(cs->as, pde_ptr,
+        pde = address_space_ldl(as, pde_ptr,
                                 MEMTXATTRS_UNSPECIFIED, &result);
         if (result != MEMTX_OK) {
             return (1 << 8) | (4 << 2); /* Translation fault, L = 1 */
@@ -131,7 +133,7 @@ static int get_physical_address(CPUSPARCState *env, CPUTLBEntryFull *full,
             return (1 << 8) | (4 << 2);
         case 1: /* L1 PDE */
             pde_ptr = ((address & 0xfc0000) >> 16) + ((pde & ~3) << 4);
-            pde = address_space_ldl(cs->as, pde_ptr,
+            pde = address_space_ldl(as, pde_ptr,
                                     MEMTXATTRS_UNSPECIFIED, &result);
             if (result != MEMTX_OK) {
                 return (2 << 8) | (4 << 2); /* Translation fault, L = 2 */
@@ -145,7 +147,7 @@ static int get_physical_address(CPUSPARCState *env, CPUTLBEntryFull *full,
                 return (2 << 8) | (4 << 2);
             case 1: /* L2 PDE */
                 pde_ptr = ((address & 0x3f000) >> 10) + ((pde & ~3) << 4);
-                pde = address_space_ldl(cs->as, pde_ptr,
+                pde = address_space_ldl(as, pde_ptr,
                                         MEMTXATTRS_UNSPECIFIED, &result);
                 if (result != MEMTX_OK) {
                     return (3 << 8) | (4 << 2); /* Translation fault, L = 3 */
@@ -189,7 +191,7 @@ static int get_physical_address(CPUSPARCState *env, CPUTLBEntryFull *full,
         if (is_dirty) {
             pde |= PG_MODIFIED_MASK;
         }
-        stl_phys_notdirty(cs->as, pde_ptr, pde);
+        stl_phys_notdirty(as, pde_ptr, pde);
     }
 
     /* the page can be put in the TLB */
@@ -264,6 +266,7 @@ bool sparc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 target_ulong mmu_probe(CPUSPARCState *env, target_ulong address, int mmulev)
 {
     CPUState *cs = env_cpu(env);
+    AddressSpace *as = cpu_get_address_space(cs, 0);
     hwaddr pde_ptr;
     uint32_t pde;
     MemTxResult result;
@@ -276,7 +279,7 @@ target_ulong mmu_probe(CPUSPARCState *env, target_ulong address, int mmulev)
     /* Context base + context number */
     pde_ptr = (hwaddr)(env->mmuregs[1] << 4) +
         (env->mmuregs[2] << 2);
-    pde = address_space_ldl(cs->as, pde_ptr, MEMTXATTRS_UNSPECIFIED, &result);
+    pde = address_space_ldl(as, pde_ptr, MEMTXATTRS_UNSPECIFIED, &result);
     if (result != MEMTX_OK) {
         return 0;
     }
@@ -292,7 +295,7 @@ target_ulong mmu_probe(CPUSPARCState *env, target_ulong address, int mmulev)
             return pde;
         }
         pde_ptr = ((address >> 22) & ~3) + ((pde & ~3) << 4);
-        pde = address_space_ldl(cs->as, pde_ptr,
+        pde = address_space_ldl(as, pde_ptr,
                                 MEMTXATTRS_UNSPECIFIED, &result);
         if (result != MEMTX_OK) {
             return 0;
@@ -310,7 +313,7 @@ target_ulong mmu_probe(CPUSPARCState *env, target_ulong address, int mmulev)
                 return pde;
             }
             pde_ptr = ((address & 0xfc0000) >> 16) + ((pde & ~3) << 4);
-            pde = address_space_ldl(cs->as, pde_ptr,
+            pde = address_space_ldl(as, pde_ptr,
                                     MEMTXATTRS_UNSPECIFIED, &result);
             if (result != MEMTX_OK) {
                 return 0;
@@ -328,7 +331,7 @@ target_ulong mmu_probe(CPUSPARCState *env, target_ulong address, int mmulev)
                     return pde;
                 }
                 pde_ptr = ((address & 0x3f000) >> 10) + ((pde & ~3) << 4);
-                pde = address_space_ldl(cs->as, pde_ptr,
+                pde = address_space_ldl(as, pde_ptr,
                                         MEMTXATTRS_UNSPECIFIED, &result);
                 if (result != MEMTX_OK) {
                     return 0;
-- 
2.51.0


