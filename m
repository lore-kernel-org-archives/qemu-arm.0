Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp1789776ejs;
        Fri, 18 Aug 2023 05:39:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVEOf2X+uiY8g0rBBC5leIjjEAEXSV3K7ag1KGU3nnkJRalzoRaPv58zvhai6zkCQu0iQS
X-Received: by 2002:a9d:4d17:0:b0:6b9:4b45:42ca with SMTP id n23-20020a9d4d17000000b006b94b4542camr2332256otf.25.1692362340792;
        Fri, 18 Aug 2023 05:39:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692362340; cv=none;
        d=google.com; s=arc-20160816;
        b=sM7A8W+OrJJxoGl7JLmNnjmC2hhDPJCOAx7K1XEudfZk1tJKOpBgV3+xV+NaTZGUWj
         lRoVccZOi9SzP+ZVXLh+IX8TnWzcwLpjhI/ft5o4EX+ohS71W2maJgro3nJBUCAiPDWC
         jCtUHJUveuWCuEUNrLwtjQLEwDkLW3TV9D1Td1JEI35EfUOKciIl8fl3OBhZB19MhF+C
         3vKUPnZgx1jvsLtTgJXVapAEN6VYXW6W9ahkfDXH9ZtfBYeEqLH3y44FhyYx8rBBm268
         beaYW79JelJsaqjNWe+9IlYJsZcY7lOhNBCrY6EjFGmiGzSeFa3QVBNzzceRuosX7+Jn
         oBcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=scxMDAGg0/QslbOMVgwjmrNbWu1kiLdZdsCE13PXL8c=;
        fh=j9oYNtRYNAOLSuL1FD2YOLjIlJPapFgerRTMGMuRz3g=;
        b=J/qQHjkZUKZIiEeHdz8IqbSv1Fx5GT23VtnAaLMylLeUYGt4AupYuNMIp0iEAwXHM1
         0xrHUy0LYMcCYda4G/q4U8f90QGHOGU84UN59nrX5fb0+4XQ7zR/ELDCsbRhQHsBIrNC
         rx+bMyUjCiarUlFl0n4Fjzg2U8wkUCctQNCNqUYDINAdewaNIRg9aqD7lUUW83YB+QeN
         c4Ds2CXLxyumXzQ6SKHDOGEgM4dehbZj3t7FVW68e4VIXJIxDI7xdjnntfNfg8nVmZpl
         tAzANkl51IFn8Yw5Nd6d4Vlu3BRCTHNg2z1+Cb09ATjBI+8TX9E8tcfLW0ffb0aeQBqS
         bE6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qkrc90ON;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 19-20020ac85713000000b004035c106304si1087079qtw.470.2023.08.18.05.39.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Aug 2023 05:39:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qkrc90ON;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qWykf-0001a1-TJ; Fri, 18 Aug 2023 08:38:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qWykT-0001Xn-HN
 for qemu-arm@nongnu.org; Fri, 18 Aug 2023 08:38:41 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qWykQ-0001W5-UC
 for qemu-arm@nongnu.org; Fri, 18 Aug 2023 08:38:41 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-31977ace1c8so787351f8f.1
 for <qemu-arm@nongnu.org>; Fri, 18 Aug 2023 05:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692362317; x=1692967117;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=scxMDAGg0/QslbOMVgwjmrNbWu1kiLdZdsCE13PXL8c=;
 b=qkrc90ONVH+gxbnMXOoFj2yGaT0LPC63Q6VZeAsPe3fZX3Bhab2muSsutaccSWGV2p
 zcqxLjDzim+EJjrnvt9SwKq2Rr7sGkHyzbh19VuL25I3c9q6BYXRPPjlZx8D9uZJiv6S
 Jz/l87Ys7ZKWONpuH0p1t9l9LEYhc7pRRvW3KJjByBdTH14us1jZ/V5VtK/Sb40ZZ1Ao
 JXu0HArj1QmSJpzeX6AmYHTRBLjN7k/GgFARavahg9JDuYW8EcoI4n/Hm2jEj/GXnSpN
 E/nm8/O5nYbnKVOGSe66vd4Ajm3UC0M+bhItAjZam/1fiYsx1bEfODfBJgctT4GSQ+Xz
 oPVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692362317; x=1692967117;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=scxMDAGg0/QslbOMVgwjmrNbWu1kiLdZdsCE13PXL8c=;
 b=ILjwqHXWuzMcQxZsGAcJDVDYRr3qQvKqhr8HDGtr3xEZOAb7F4UtEs/Yi9PXcxs7t2
 l4//Wj8zozgCi6CswgD1tLrv6SoK/bUd4aiJLQPK8sGHPwn8hD7Pujl5O+0V7Dw4do3e
 f+fNIrghXRR98MO+qHaDsvYbc6pgW4ko3SRm1AXe+/FIk0bHI8DtOQxcDgtI5OMGgBsV
 /KORNTDb91SSuefe+71iLdyFyjeXNfzkZ6MyZkcUtXpBrL+I7O/IiZT+8P1Ec7Da1ULc
 7R5pezA3BE2bMtJvCTCkYnMf4fxX56+zY62ddPe9NqA9/nx5ShgSt2zAeHSoGIUizgUW
 1rzA==
X-Gm-Message-State: AOJu0Yyf2vHZyIX8/itSTigovgNU1V94zwDQYZqEaucFH/d2kpG7ez8U
 guWX5AFIGN+cTMj725e3nnGyVhfiV+F35d01MJk=
X-Received: by 2002:adf:f908:0:b0:317:6704:72c with SMTP id
 b8-20020adff908000000b003176704072cmr1642848wrr.52.1692362316828; 
 Fri, 18 Aug 2023 05:38:36 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 g12-20020a056000118c00b003140fff4f75sm2668385wrx.17.2023.08.18.05.38.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Aug 2023 05:38:35 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH] target/arm: Remove unused allocation_tag_mem() argument
Date: Fri, 18 Aug 2023 13:38:34 +0100
Message-Id: <20230818123834.1370818-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: S+Dj9DLdsKKQ

The allocation_tag_mem() function takes an argument tag_size,
but it never uses it. Remove the argument. In mte_probe_int()
in particular this also lets us delete the code computing
the value we were passing in.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I was looking at this function to see what argument I needed to pass it
for the FEAT_MOPS stuff, and it turns out the answer was "it doesn't
matter because it never uses the argument anyway" :-)

 target/arm/tcg/mte_helper.c | 42 +++++++++++++------------------------
 1 file changed, 14 insertions(+), 28 deletions(-)

diff --git a/target/arm/tcg/mte_helper.c b/target/arm/tcg/mte_helper.c
index 9c64def0816..964af43ea8f 100644
--- a/target/arm/tcg/mte_helper.c
+++ b/target/arm/tcg/mte_helper.c
@@ -57,7 +57,6 @@ static int choose_nonexcluded_tag(int tag, int offset, uint16_t exclude)
  * @ptr_access: the access to use for the virtual address
  * @ptr_size: the number of bytes in the normal memory access
  * @tag_access: the access to use for the tag memory
- * @tag_size: the number of bytes in the tag memory access
  * @ra: the return address for exception handling
  *
  * Our tag memory is formatted as a sequence of little-endian nibbles.
@@ -69,15 +68,12 @@ static int choose_nonexcluded_tag(int tag, int offset, uint16_t exclude)
  * a pointer to the corresponding tag byte.  Exit with exception if the
  * virtual address is not accessible for @ptr_access.
  *
- * The @ptr_size and @tag_size values may not have an obvious relation
- * due to the alignment of @ptr, and the number of tag checks required.
- *
  * If there is no tag storage corresponding to @ptr, return NULL.
  */
 static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
                                    uint64_t ptr, MMUAccessType ptr_access,
                                    int ptr_size, MMUAccessType tag_access,
-                                   int tag_size, uintptr_t ra)
+                                   uintptr_t ra)
 {
 #ifdef CONFIG_USER_ONLY
     uint64_t clean_ptr = useronly_clean_ptr(ptr);
@@ -275,7 +271,7 @@ uint64_t HELPER(ldg)(CPUARMState *env, uint64_t ptr, uint64_t xt)
 
     /* Trap if accessing an invalid page.  */
     mem = allocation_tag_mem(env, mmu_idx, ptr, MMU_DATA_LOAD, 1,
-                             MMU_DATA_LOAD, 1, GETPC());
+                             MMU_DATA_LOAD, GETPC());
 
     /* Load if page supports tags. */
     if (mem) {
@@ -329,7 +325,7 @@ static inline void do_stg(CPUARMState *env, uint64_t ptr, uint64_t xt,
 
     /* Trap if accessing an invalid page.  */
     mem = allocation_tag_mem(env, mmu_idx, ptr, MMU_DATA_STORE, TAG_GRANULE,
-                             MMU_DATA_STORE, 1, ra);
+                             MMU_DATA_STORE, ra);
 
     /* Store if page supports tags. */
     if (mem) {
@@ -372,10 +368,10 @@ static inline void do_st2g(CPUARMState *env, uint64_t ptr, uint64_t xt,
     if (ptr & TAG_GRANULE) {
         /* Two stores unaligned mod TAG_GRANULE*2 -- modify two bytes. */
         mem1 = allocation_tag_mem(env, mmu_idx, ptr, MMU_DATA_STORE,
-                                  TAG_GRANULE, MMU_DATA_STORE, 1, ra);
+                                  TAG_GRANULE, MMU_DATA_STORE, ra);
         mem2 = allocation_tag_mem(env, mmu_idx, ptr + TAG_GRANULE,
                                   MMU_DATA_STORE, TAG_GRANULE,
-                                  MMU_DATA_STORE, 1, ra);
+                                  MMU_DATA_STORE, ra);
 
         /* Store if page(s) support tags. */
         if (mem1) {
@@ -387,7 +383,7 @@ static inline void do_st2g(CPUARMState *env, uint64_t ptr, uint64_t xt,
     } else {
         /* Two stores aligned mod TAG_GRANULE*2 -- modify one byte. */
         mem1 = allocation_tag_mem(env, mmu_idx, ptr, MMU_DATA_STORE,
-                                  2 * TAG_GRANULE, MMU_DATA_STORE, 1, ra);
+                                  2 * TAG_GRANULE, MMU_DATA_STORE, ra);
         if (mem1) {
             tag |= tag << 4;
             qatomic_set(mem1, tag);
@@ -433,8 +429,7 @@ uint64_t HELPER(ldgm)(CPUARMState *env, uint64_t ptr)
 
     /* Trap if accessing an invalid page.  */
     tag_mem = allocation_tag_mem(env, mmu_idx, ptr, MMU_DATA_LOAD,
-                                 LDGM_STGM_SIZE, MMU_DATA_LOAD,
-                                 LDGM_STGM_SIZE / (2 * TAG_GRANULE), ra);
+                                 LDGM_STGM_SIZE, MMU_DATA_LOAD, ra);
 
     /* The tag is squashed to zero if the page does not support tags.  */
     if (!tag_mem) {
@@ -459,8 +454,7 @@ void HELPER(stgm)(CPUARMState *env, uint64_t ptr, uint64_t val)
 
     /* Trap if accessing an invalid page.  */
     tag_mem = allocation_tag_mem(env, mmu_idx, ptr, MMU_DATA_STORE,
-                                 LDGM_STGM_SIZE, MMU_DATA_LOAD,
-                                 LDGM_STGM_SIZE / (2 * TAG_GRANULE), ra);
+                                 LDGM_STGM_SIZE, MMU_DATA_LOAD, ra);
 
     /*
      * Tag store only happens if the page support tags,
@@ -498,7 +492,7 @@ void HELPER(stzgm_tags)(CPUARMState *env, uint64_t ptr, uint64_t val)
     ptr &= -dcz_bytes;
 
     mem = allocation_tag_mem(env, mmu_idx, ptr, MMU_DATA_STORE, dcz_bytes,
-                             MMU_DATA_STORE, tag_bytes, ra);
+                             MMU_DATA_STORE, ra);
     if (mem) {
         int tag_pair = (val & 0xf) * 0x11;
         memset(mem, tag_pair, tag_bytes);
@@ -678,8 +672,7 @@ static int mte_probe_int(CPUARMState *env, uint32_t desc, uint64_t ptr,
     int mmu_idx, ptr_tag, bit55;
     uint64_t ptr_last, prev_page, next_page;
     uint64_t tag_first, tag_last;
-    uint64_t tag_byte_first, tag_byte_last;
-    uint32_t sizem1, tag_count, tag_size, n, c;
+    uint32_t sizem1, tag_count, n, c;
     uint8_t *mem1, *mem2;
     MMUAccessType type;
 
@@ -709,19 +702,14 @@ static int mte_probe_int(CPUARMState *env, uint32_t desc, uint64_t ptr,
     tag_last = QEMU_ALIGN_DOWN(ptr_last, TAG_GRANULE);
     tag_count = ((tag_last - tag_first) / TAG_GRANULE) + 1;
 
-    /* Round the bounds to twice the tag granule, and compute the bytes. */
-    tag_byte_first = QEMU_ALIGN_DOWN(ptr, 2 * TAG_GRANULE);
-    tag_byte_last = QEMU_ALIGN_DOWN(ptr_last, 2 * TAG_GRANULE);
-
     /* Locate the page boundaries. */
     prev_page = ptr & TARGET_PAGE_MASK;
     next_page = prev_page + TARGET_PAGE_SIZE;
 
     if (likely(tag_last - prev_page < TARGET_PAGE_SIZE)) {
         /* Memory access stays on one page. */
-        tag_size = ((tag_byte_last - tag_byte_first) / (2 * TAG_GRANULE)) + 1;
         mem1 = allocation_tag_mem(env, mmu_idx, ptr, type, sizem1 + 1,
-                                  MMU_DATA_LOAD, tag_size, ra);
+                                  MMU_DATA_LOAD, ra);
         if (!mem1) {
             return 1;
         }
@@ -729,14 +717,12 @@ static int mte_probe_int(CPUARMState *env, uint32_t desc, uint64_t ptr,
         n = checkN(mem1, ptr & TAG_GRANULE, ptr_tag, tag_count);
     } else {
         /* Memory access crosses to next page. */
-        tag_size = (next_page - tag_byte_first) / (2 * TAG_GRANULE);
         mem1 = allocation_tag_mem(env, mmu_idx, ptr, type, next_page - ptr,
-                                  MMU_DATA_LOAD, tag_size, ra);
+                                  MMU_DATA_LOAD, ra);
 
-        tag_size = ((tag_byte_last - next_page) / (2 * TAG_GRANULE)) + 1;
         mem2 = allocation_tag_mem(env, mmu_idx, next_page, type,
                                   ptr_last - next_page + 1,
-                                  MMU_DATA_LOAD, tag_size, ra);
+                                  MMU_DATA_LOAD, ra);
 
         /*
          * Perform all of the comparisons.
@@ -864,7 +850,7 @@ uint64_t HELPER(mte_check_zva)(CPUARMState *env, uint32_t desc, uint64_t ptr)
     mmu_idx = FIELD_EX32(desc, MTEDESC, MIDX);
     (void) probe_write(env, ptr, 1, mmu_idx, ra);
     mem = allocation_tag_mem(env, mmu_idx, align_ptr, MMU_DATA_STORE,
-                             dcz_bytes, MMU_DATA_LOAD, tag_bytes, ra);
+                             dcz_bytes, MMU_DATA_LOAD, ra);
     if (!mem) {
         goto done;
     }
-- 
2.34.1

