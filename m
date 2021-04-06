Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp1692889lfr;
        Tue, 6 Apr 2021 10:49:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzeou+ZCJzI2JZez+U3D12IPyRcRi1/zwyaWAq9OJCttuxtAkqfU3uZWjIeKtNTj6yRz3Ma
X-Received: by 2002:a02:b890:: with SMTP id p16mr29632296jam.138.1617731358638;
        Tue, 06 Apr 2021 10:49:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617731358; cv=none;
        d=google.com; s=arc-20160816;
        b=WGapVGaBml3Xleg9PJfKdXa2Jw4SrCrbiq8MkvZiq48+Pb02TgRzJ2Qvo22CY/efSy
         vW/rddxSrAx2+PYaghXunwL+nPSoKsoz7I+aks3xIuo/m/oeDb1eCJZO8CZRGtARiomT
         oDwXoavjnAv0Vf/wGZ/iJnKa7iJzzps47kGYdb1GZ8Gx6id5oKjihB+D9vav6At5wCYX
         F+i1L5GLOyC8ScJ1eWTBsuFsfdliH7ZT4QS4dIPnCzWRZB9M1ujRyBrawLZ8DnsaMPjd
         zVI/A3H+LnjcwRDnSGNOO1efl/yvr1E5KgYfddIq+tcld68OguGEwJe01q90TpL3me5s
         uFKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=3mgQ/AwHCdEqMYqaEDNteTClCiB0ojdl1YSqbUogses=;
        b=BzlBMVFeiqAKntRKmbJb3bcJWkuxH5C3mdcaIXPk1WTmcMNz0exzVj0bTUBbttI6FM
         qeVWMt2fyY81BIjULMaZcbqybfpLfLxcNf1nfmTaKj5pfpkrGs2H4R0MHGZmmOteEmL6
         OvyNdx0SYluX52yYVtwjLyo7bxcKP41RewfZeKrAhoILtCPMntq5gZ93Cag7lktBCkyQ
         ZjrByfFMry9UIZb9oSj3Bv1s7xwKwK4YRF/l/WxGAfo82eekvwrqo1WGCTx7wNiRXgMF
         pxkijs+271cnmhmHX6LXBkeiJMw2q1hq+FJgddNNiQYkNPJT5KmE31VekF21AsQ1YTwG
         JG5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EFdail5Q;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o13si19311314iou.15.2021.04.06.10.49.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Apr 2021 10:49:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EFdail5Q;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lTppF-0002kv-Rg
	for alex.bennee@linaro.org; Tue, 06 Apr 2021 13:49:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTpgu-0001dk-Je
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 13:40:40 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:52792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTpgs-0006Jc-0a
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 13:40:40 -0400
Received: by mail-pj1-x102c.google.com with SMTP id ha17so8331443pjb.2
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 10:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3mgQ/AwHCdEqMYqaEDNteTClCiB0ojdl1YSqbUogses=;
 b=EFdail5Q39YUUjQu5flb2sWdqSnNPtN7VWpuZ3Ao31OyVEdtjKW5InWYnb/KHdW48h
 PfigFSl7c/1Q6TNHm7s6dDZh8hFaVMydS0LdIWOvNkkt7y5+G2J0lYvSbM70WlUpzvkD
 cV0uS31wZwF1s8IfUiULKhuIC86oYa8R4JtcLo0U+TNuTiE8m4/13gkH92x6Guv5JZQ6
 WjHDtjTzF9fHSKccVlzik0TmqlcgwwFZP9nqcX4nn9A7Kh7P709zR1bqIvtFduv/BmiM
 v6jRYVBFmPmce4uVGKUFJWdi1qZ3a/FFiade46iINImsxyBBPO1Li4dkTil3HuV0q1a2
 +5Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3mgQ/AwHCdEqMYqaEDNteTClCiB0ojdl1YSqbUogses=;
 b=Zh2vzHT6Nh7IoVksVNpGy+HlwMPnDjkSMdwsli8btCji4vZd7H7cxqa+gK2gwnwxg6
 jvUV225Tgd7gytfjtP/92a2y0Bz1aYLmTr6jPWXciYl/FfDXbb8BLOVlDep4whIR5ckk
 9opSmPMu9Zt32na6MXJZEXqIh5EHRsDFfkx2Zlsl40TFluPnzRBOeKhGkypJjV9zpAmH
 ty+Zkga75gJLWQb8vccEWXhtmMv4EwnsiDlfNW8Reb5IbdqtGDiO6EOZ61rqf09lgKQ6
 s/p8+EEyO5E7GWL/L16KA4CLpofVqPDHDykItmycVcwnEGB63amKRppKzZT+gbZhJr64
 Bqqw==
X-Gm-Message-State: AOAM531E2HR5eFlvTp++KxsiUL06hVhKDijNC1/5IvXfDfyRTmVHaXwm
 gAvSonyJEF+UgOHLLdAQZBXvnuceHz8QCg==
X-Received: by 2002:a17:902:b908:b029:e9:4010:7fd3 with SMTP id
 bf8-20020a170902b908b02900e940107fd3mr3679881plb.55.1617730836381; 
 Tue, 06 Apr 2021 10:40:36 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id h15sm19148056pfo.20.2021.04.06.10.40.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 10:40:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 03/12] target/arm: Fix mte_checkN
Date: Tue,  6 Apr 2021 10:40:22 -0700
Message-Id: <20210406174031.64299-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210406174031.64299-1-richard.henderson@linaro.org>
References: <20210406174031.64299-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lVID8U8p50XS

We were incorrectly assuming that only the first byte of an MTE access
is checked against the tags.  But per the ARM, unaligned accesses are
pre-decomposed into single-byte accesses.  So by the time we reach the
actual MTE check in the ARM pseudocode, all accesses are aligned.

Therefore, the first failure is always either the first byte of the
access, or the first byte of the granule.

In addition, some of the arithmetic is off for last-first -> count.
This does not become directly visible until a later patch that passes
single bytes into this function, so ptr == ptr_last.

Buglink: https://bugs.launchpad.net/bugs/1921948
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mte_helper.c | 38 +++++++++++++++++---------------------
 1 file changed, 17 insertions(+), 21 deletions(-)

diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 8be17e1b70..c87717127c 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -757,10 +757,10 @@ uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
                     uint64_t ptr, uintptr_t ra)
 {
     int mmu_idx, ptr_tag, bit55;
-    uint64_t ptr_last, ptr_end, prev_page, next_page;
-    uint64_t tag_first, tag_end;
-    uint64_t tag_byte_first, tag_byte_end;
-    uint32_t esize, total, tag_count, tag_size, n, c;
+    uint64_t ptr_last, prev_page, next_page;
+    uint64_t tag_first, tag_last;
+    uint64_t tag_byte_first, tag_byte_last;
+    uint32_t total, tag_count, tag_size, n, c;
     uint8_t *mem1, *mem2;
     MMUAccessType type;
 
@@ -779,29 +779,27 @@ uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
 
     mmu_idx = FIELD_EX32(desc, MTEDESC, MIDX);
     type = FIELD_EX32(desc, MTEDESC, WRITE) ? MMU_DATA_STORE : MMU_DATA_LOAD;
-    esize = FIELD_EX32(desc, MTEDESC, ESIZE);
     total = FIELD_EX32(desc, MTEDESC, TSIZE);
 
     /* Find the addr of the end of the access, and of the last element. */
-    ptr_end = ptr + total;
-    ptr_last = ptr_end - esize;
+    ptr_last = ptr + total - 1;
 
     /* Round the bounds to the tag granule, and compute the number of tags. */
     tag_first = QEMU_ALIGN_DOWN(ptr, TAG_GRANULE);
-    tag_end = QEMU_ALIGN_UP(ptr_last, TAG_GRANULE);
-    tag_count = (tag_end - tag_first) / TAG_GRANULE;
+    tag_last = QEMU_ALIGN_DOWN(ptr_last, TAG_GRANULE);
+    tag_count = ((tag_last - tag_first) / TAG_GRANULE) + 1;
 
     /* Round the bounds to twice the tag granule, and compute the bytes. */
     tag_byte_first = QEMU_ALIGN_DOWN(ptr, 2 * TAG_GRANULE);
-    tag_byte_end = QEMU_ALIGN_UP(ptr_last, 2 * TAG_GRANULE);
+    tag_byte_last = QEMU_ALIGN_DOWN(ptr_last, 2 * TAG_GRANULE);
 
     /* Locate the page boundaries. */
     prev_page = ptr & TARGET_PAGE_MASK;
     next_page = prev_page + TARGET_PAGE_SIZE;
 
-    if (likely(tag_end - prev_page <= TARGET_PAGE_SIZE)) {
+    if (likely(tag_last - prev_page <= TARGET_PAGE_SIZE)) {
         /* Memory access stays on one page. */
-        tag_size = (tag_byte_end - tag_byte_first) / (2 * TAG_GRANULE);
+        tag_size = ((tag_byte_last - tag_byte_first) / (2 * TAG_GRANULE)) + 1;
         mem1 = allocation_tag_mem(env, mmu_idx, ptr, type, total,
                                   MMU_DATA_LOAD, tag_size, ra);
         if (!mem1) {
@@ -815,9 +813,9 @@ uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
         mem1 = allocation_tag_mem(env, mmu_idx, ptr, type, next_page - ptr,
                                   MMU_DATA_LOAD, tag_size, ra);
 
-        tag_size = (tag_byte_end - next_page) / (2 * TAG_GRANULE);
+        tag_size = ((tag_byte_last - next_page) / (2 * TAG_GRANULE)) + 1;
         mem2 = allocation_tag_mem(env, mmu_idx, next_page, type,
-                                  ptr_end - next_page,
+                                  ptr_last - next_page + 1,
                                   MMU_DATA_LOAD, tag_size, ra);
 
         /*
@@ -838,15 +836,13 @@ uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
     }
 
     /*
-     * If we failed, we know which granule.  Compute the element that
-     * is first in that granule, and signal failure on that element.
+     * If we failed, we know which granule.  For the first granule, the
+     * failure address is @ptr, the first byte accessed.  Otherwise the
+     * failure address is the first byte of the nth granule.
      */
     if (unlikely(n < tag_count)) {
-        uint64_t fail_ofs;
-
-        fail_ofs = tag_first + n * TAG_GRANULE - ptr;
-        fail_ofs = ROUND_UP(fail_ofs, esize);
-        mte_check_fail(env, desc, ptr + fail_ofs, ra);
+        uint64_t fault = (n == 0 ? ptr : tag_first + n * TAG_GRANULE);
+        mte_check_fail(env, desc, fault, ra);
     }
 
  done:
-- 
2.25.1

