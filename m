Received: by 2002:a17:906:cf8c:b0:9a1:fa4e:495e with SMTP id um12csp436044ejb;
        Thu, 7 Sep 2023 09:05:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLhZT2LKDI80cOhAFBrzM1O3HHVJ/4OI2n+RMhlWpoRIuwa9H2P0SbWEmsEtx3mva1ToUa
X-Received: by 2002:a05:6808:34b:b0:3a8:5904:1aa8 with SMTP id j11-20020a056808034b00b003a859041aa8mr19645269oie.52.1694102751223;
        Thu, 07 Sep 2023 09:05:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694102751; cv=none;
        d=google.com; s=arc-20160816;
        b=LxNpbq2lbC+6JlcBVQWV4gKiIVlPL8SHSwO3G6ND/fYMCNoWY0hlIKkfJeZ8iu64ag
         3zdsmqCrpOk/N+gvuOKBl6I2O4lodyuih4qFH0ogrrybw8M3ffja1aCxdjreg25r0WgN
         u9wAQwWb/4v30CBX8E2DFlEFLIDr+W0jh9lRffeF8dBuZFRSevoZhhmCYo4HVlZZc022
         u6n0Vu2QWGLFSrhoh+J3F3fbP8a3BI5oBaHHVnYuLeFI0mxCK89KxCLqp55LQHQfSh/7
         niaaWxs02KqUsp/uWSl1wTpSadTb6/DaNh7Br8cjG7Qx94KjDg0qhgUI7YBwhoYQg6Im
         IILA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=k3XOXrpJkvVBT73JVIUIybkdEQJErzU2/M8NYkrCiqY=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=afL+Ozqk04WVFSGchA9Bgke2t2Z9BKoCAiGLyVZ1IKQ1KzO9vkS0i0Nfb9ejXy1/H3
         3TD3cT0+ezlp6b9ARAyP2euuA7V7RFMx3vOZYnzPX9wY5tyc1DqOTR7cI+MKRRxv2y3L
         yscQw2VBZZ3LHxktAum02B7zVv5rTG3L+06bNdnE3xhQL8gpzfsExOPmb7QGhNNV5tug
         KrGoRHpHnKo46ETkBpy4RCkE3nWp8ufFQKePd/UuFjZCpKDNrcdw+lBnAXeqg5De8XWw
         5pRVy5Lh3/o8e9I0O6zcU3o+P0kqsaihLisPtQl0DbZvZ2Hx9OiPTPu9LygDc2SSOoyA
         hVHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RPpaFozX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q14-20020a67b04e000000b0044d4e33be34si2109729vsh.727.2023.09.07.09.05.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Sep 2023 09:05:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RPpaFozX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qeHU5-0000vq-G4; Thu, 07 Sep 2023 12:03:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qeHU2-0000si-7V
 for qemu-arm@nongnu.org; Thu, 07 Sep 2023 12:03:54 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qeHTv-00020Q-UE
 for qemu-arm@nongnu.org; Thu, 07 Sep 2023 12:03:53 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-31ad9155414so1026104f8f.3
 for <qemu-arm@nongnu.org>; Thu, 07 Sep 2023 09:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694102626; x=1694707426; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=k3XOXrpJkvVBT73JVIUIybkdEQJErzU2/M8NYkrCiqY=;
 b=RPpaFozXjvjF7/b0tjwnEi0htAoS+XeiyC6E0bzb3NKk6aXXmup7kPAAOb+nHwXT5p
 /PHwGhYnwjbvQZSHsp4iiLNpWfC568lziS7cNVZRkn8bL/kX7c7aR/P+UTXNtb+G8LUQ
 SzjUB9jJg3moOA+4JIla/suukatOAwZ2KFnUMZ2jFN1Hdocc17dCGpbvTSO77ula6R3K
 e/uDL+1fMldHVK7NzjzrcyrfbGmh9WVWX48spQkqjMLJOom75KaTZdL+iRRDrylvtfn5
 gDqxQxnSRm/6dCrtuGwqyKtAuM0Uy98qk1qm2ZUixidKoXy4U4GHoUlA3oW8qYzcv9JY
 rsGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694102626; x=1694707426;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k3XOXrpJkvVBT73JVIUIybkdEQJErzU2/M8NYkrCiqY=;
 b=CtVvd4ElgiexCeWWtVgXPm/EyTK1LjY2H85RMyN61AeNSAIYBt19DdLSMo7J2UvFBt
 UA2vzeiCXX4/uT4JMJ6SmDMyRU7H6HChvuuklU5eKnKUAhGEgqGYumLBZ4Ps7xwOCRl0
 QdgX6mNjhobA5cAdNmGw8PP/Zv60t9ScnIAZevzwgQj9VT3nNMGSuSzntRO66DipoK7M
 rQr0OgKVxJ8ooU178DiUneGzAvxL7S6T5TdEyUnmfhQVIHVrCpbfDXpygXZVHt1oxB+6
 uHL3jtStgPYXxsF00gWgxQCo7Gc6CIns66rURafXQHyiG8ofXPmI0yWuY+zqvhR29jy4
 d28g==
X-Gm-Message-State: AOJu0YzC6yj6eZi0s8xgruYmqbKXfT2v53Rhwx5BVdXdPSfyx2Hc6L8S
 a9JiHaGxO+UeAFPmVA9+anx+kEiL9lSqGZiGpGM=
X-Received: by 2002:a5d:5610:0:b0:31a:c6fb:4142 with SMTP id
 l16-20020a5d5610000000b0031ac6fb4142mr4915910wrv.16.1694102626526; 
 Thu, 07 Sep 2023 09:03:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d1-20020adfa401000000b0031980294e9fsm20256241wra.116.2023.09.07.09.03.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Sep 2023 09:03:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 07/14] target/arm: New function allocation_tag_mem_probe()
Date: Thu,  7 Sep 2023 17:03:33 +0100
Message-Id: <20230907160340.260094-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230907160340.260094-1-peter.maydell@linaro.org>
References: <20230907160340.260094-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: GQyUklZQH/NC

For the FEAT_MOPS operations, the existing allocation_tag_mem()
function almost does what we want, but it will take a watchpoint
exception even for an ra == 0 probe request, and it requires that the
caller guarantee that the memory is accessible.  For FEAT_MOPS we
want a function that will not take any kind of exception, and will
return NULL for the not-accessible case.

Rename allocation_tag_mem() to allocation_tag_mem_probe() and add an
extra 'probe' argument that lets us distinguish these cases;
allocation_tag_mem() is now a wrapper that always passes 'false'.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/mte_helper.c | 47 ++++++++++++++++++++++++++++---------
 1 file changed, 36 insertions(+), 11 deletions(-)

diff --git a/target/arm/tcg/mte_helper.c b/target/arm/tcg/mte_helper.c
index e2494f73cf3..884d88848aa 100644
--- a/target/arm/tcg/mte_helper.c
+++ b/target/arm/tcg/mte_helper.c
@@ -50,13 +50,14 @@ static int choose_nonexcluded_tag(int tag, int offset, uint16_t exclude)
 }
 
 /**
- * allocation_tag_mem:
+ * allocation_tag_mem_probe:
  * @env: the cpu environment
  * @ptr_mmu_idx: the addressing regime to use for the virtual address
  * @ptr: the virtual address for which to look up tag memory
  * @ptr_access: the access to use for the virtual address
  * @ptr_size: the number of bytes in the normal memory access
  * @tag_access: the access to use for the tag memory
+ * @probe: true to merely probe, never taking an exception
  * @ra: the return address for exception handling
  *
  * Our tag memory is formatted as a sequence of little-endian nibbles.
@@ -65,15 +66,25 @@ static int choose_nonexcluded_tag(int tag, int offset, uint16_t exclude)
  * for the higher addr.
  *
  * Here, resolve the physical address from the virtual address, and return
- * a pointer to the corresponding tag byte.  Exit with exception if the
- * virtual address is not accessible for @ptr_access.
+ * a pointer to the corresponding tag byte.
  *
  * If there is no tag storage corresponding to @ptr, return NULL.
+ *
+ * If the page is inaccessible for @ptr_access, or has a watchpoint, there are
+ * three options:
+ * (1) probe = true, ra = 0 : pure probe -- we return NULL if the page is not
+ *     accessible, and do not take watchpoint traps. The calling code must
+ *     handle those cases in the right priority compared to MTE traps.
+ * (2) probe = false, ra = 0 : probe, no fault expected -- the caller guarantees
+ *     that the page is going to be accessible. We will take watchpoint traps.
+ * (3) probe = false, ra != 0 : non-probe -- we will take both memory access
+ *     traps and watchpoint traps.
+ * (probe = true, ra != 0 is invalid and will assert.)
  */
-static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
-                                   uint64_t ptr, MMUAccessType ptr_access,
-                                   int ptr_size, MMUAccessType tag_access,
-                                   uintptr_t ra)
+static uint8_t *allocation_tag_mem_probe(CPUARMState *env, int ptr_mmu_idx,
+                                         uint64_t ptr, MMUAccessType ptr_access,
+                                         int ptr_size, MMUAccessType tag_access,
+                                         bool probe, uintptr_t ra)
 {
 #ifdef CONFIG_USER_ONLY
     uint64_t clean_ptr = useronly_clean_ptr(ptr);
@@ -81,6 +92,8 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
     uint8_t *tags;
     uintptr_t index;
 
+    assert(!(probe && ra));
+
     if (!(flags & (ptr_access == MMU_DATA_STORE ? PAGE_WRITE_ORG : PAGE_READ))) {
         cpu_loop_exit_sigsegv(env_cpu(env), ptr, ptr_access,
                               !(flags & PAGE_VALID), ra);
@@ -111,12 +124,16 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
      * exception for inaccessible pages, and resolves the virtual address
      * into the softmmu tlb.
      *
-     * When RA == 0, this is for mte_probe.  The page is expected to be
-     * valid.  Indicate to probe_access_flags no-fault, then assert that
-     * we received a valid page.
+     * When RA == 0, this is either a pure probe or a no-fault-expected probe.
+     * Indicate to probe_access_flags no-fault, then either return NULL
+     * for the pure probe, or assert that we received a valid page for the
+     * no-fault-expected probe.
      */
     flags = probe_access_full(env, ptr, 0, ptr_access, ptr_mmu_idx,
                               ra == 0, &host, &full, ra);
+    if (probe && (flags & TLB_INVALID_MASK)) {
+        return NULL;
+    }
     assert(!(flags & TLB_INVALID_MASK));
 
     /* If the virtual page MemAttr != Tagged, access unchecked. */
@@ -157,7 +174,7 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
     }
 
     /* Any debug exception has priority over a tag check exception. */
-    if (unlikely(flags & TLB_WATCHPOINT)) {
+    if (!probe && unlikely(flags & TLB_WATCHPOINT)) {
         int wp = ptr_access == MMU_DATA_LOAD ? BP_MEM_READ : BP_MEM_WRITE;
         assert(ra != 0);
         cpu_check_watchpoint(env_cpu(env), ptr, ptr_size, attrs, wp, ra);
@@ -198,6 +215,14 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
     return memory_region_get_ram_ptr(mr) + xlat;
 #endif
 }
+static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
+                                   uint64_t ptr, MMUAccessType ptr_access,
+                                   int ptr_size, MMUAccessType tag_access,
+                                   uintptr_t ra)
+{
+    return allocation_tag_mem_probe(env, ptr_mmu_idx, ptr, ptr_access,
+                                    ptr_size, tag_access, false, ra);
+}
 
 uint64_t HELPER(irg)(CPUARMState *env, uint64_t rn, uint64_t rm)
 {
-- 
2.34.1

