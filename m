Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4347197lfm;
        Tue, 23 Jun 2020 12:47:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6+nqet+sw7tOJT4Agrq7jyncIeAATmDNaaVFjjs5GoOWAb8/hiPQHDj92vnAYVWXp4eVa
X-Received: by 2002:a25:d451:: with SMTP id m78mr39523013ybf.402.1592941662188;
        Tue, 23 Jun 2020 12:47:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592941662; cv=none;
        d=google.com; s=arc-20160816;
        b=uz2jjwNarvmUH1nirmtp5VjqoC6OO6woMtvJcDU2sKd8C0W9WLy10SGklJr7BgCH4S
         Dt0jTrY+675qCYvkJDaSwdAO8rA6iyTjMr34c6mW8wO/wHdJZ6w5kPqYhApEiG5Ro6tD
         za3fY8amRtlmrZtldShKcrik4ls7ngn4HgcDGCjlTtkwCaDxLvD6my6A7z/c0cJMd+0y
         JC4/5h/ZpDCPuFmz1lUiV7YesomNWQ2TzDkwwMym7W1Rk4K0BpFOee7KfZ7kVa0rCiUS
         xbI9/Vk+qK6h+cFkCVa4tBtGCwNRKjYNzHH1/kVCogeqwq8Tr1lKACJQn4lFWsxO7UYF
         YwDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=kQSqn3JWW0nPzEv9XJciec7vJguWWK+m8v2+R9Ynme4=;
        b=Nx7eM+YLGiQVvLWAWVC9MkUIPzS956EtyzBwuGG/wGDHDE4bsxIfYB/c9HNTX5nPQ8
         12wkhetfaPvdupfwsZz9M+8Cef+All5ohFA9GvGUmSOLqsnyIRFeXY0jyr4b0cCZ/7Dx
         Xicv8hrdshci7i84Ewj4EX31stlVUqRJPZU2iBSF+a4o/cIl0hZhwh0lDeQ6U2QADePo
         rEyqtFmddv46azwkSM6pF/pEoL1UtCLFREQmPWH2gxDLx5Uw8YfYfRMyd635xrwzOozP
         ntdhqyDSlVx8mNohhSqTjR4n4sSKxRS6aHekCiK6o4LDYiNsBOqWgWN12lVGWV+vQ+xJ
         LI3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VvVdU0LB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l7si24327902ybt.167.2020.06.23.12.47.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jun 2020 12:47:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VvVdU0LB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnotR-0006LL-FK
	for alex.bennee@linaro.org; Tue, 23 Jun 2020 15:47:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnojk-0004TA-RU
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 15:37:40 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:36544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnoji-0005oB-Hm
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 15:37:40 -0400
Received: by mail-pg1-x543.google.com with SMTP id p3so25478pgh.3
 for <qemu-arm@nongnu.org>; Tue, 23 Jun 2020 12:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kQSqn3JWW0nPzEv9XJciec7vJguWWK+m8v2+R9Ynme4=;
 b=VvVdU0LBXnUtQ1XoHROdG/CSAD1UcTQfZYoIjj7BqWoASuxAMv6IIc8eUk1DBQ2B9/
 82CMGKJVd45KJpvw0qpmy1Csh2YFqXa8uXo9ANnzEEJKCdMzcoMvZzrvGL7IeOvd/ynR
 EV0d2NSuRu8GcPH05mHmTtA54HD0s/icCQuC66pMHYqGr1PBZDgPQT5i+y3aPT0g9f/p
 mVkXg8OB8rPOsxIJHJYbuwm36VPXuoZTDwp2YMBgKmtuXhnk+qv9BOiys+IEbCRfQfvm
 Y7uGNNYDmGTtWanCoyqOZviIchRYSafeXU2QEpwvZMSeOQ1arzj63VBkiCFgRnvww48j
 s2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kQSqn3JWW0nPzEv9XJciec7vJguWWK+m8v2+R9Ynme4=;
 b=db/X82Kgl04lSRlYtdF0BjMciv0zbaULj1N1ydAGEGa6os64hGtuZ37osTxRZbTwZW
 cvgTSZJsmoPaJFRmPnG0imXDJ/8Z9TLnkdhkk8PbZA97oe9qZM5O7I7vTEnxyFty+cNG
 LOhJ+EOTGHPPU/VIUS81vkqIpxELLyRy2ccqfPh0JWhXru6WhsK/ndi2cYtwME6M48MO
 IzY4CwS3j7AgeO0fEvlDNivyFDZBDcnUDsqZ/Fjp6n0xz2srRAmyJ5BSnKCfjxGrt8L0
 SAXYOEFNCJ7yezuTX+edDhqUT1wfFbBteSIdwASN5I0cIuzETgpbayofZKRul6YpDHCw
 AXSg==
X-Gm-Message-State: AOAM530O8Ums5+yXgRzTu4N/+rzlKKzhqc+eO+UNgP95XdVdM3yQOMkM
 8cKF6aIBrhF80ZbdkTqQ/Ey6Og==
X-Received: by 2002:a05:6a00:15ca:: with SMTP id
 o10mr26799505pfu.169.1592941057072; 
 Tue, 23 Jun 2020 12:37:37 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id p12sm17927642pfq.69.2020.06.23.12.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 12:37:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 26/45] target/arm: Implement helper_mte_checkN
Date: Tue, 23 Jun 2020 12:36:39 -0700
Message-Id: <20200623193658.623279-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200623193658.623279-1-richard.henderson@linaro.org>
References: <20200623193658.623279-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, david.spickett@linaro.org,
 steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J6NwH1h52Tx4

Fill out the stub that was added earlier.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v7: Fix page crossing test (szabolcs nagy).
---
 target/arm/internals.h  |   2 +
 target/arm/mte_helper.c | 165 +++++++++++++++++++++++++++++++++++++++-
 2 files changed, 166 insertions(+), 1 deletion(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 807830cc40..c763a23dfb 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1321,6 +1321,8 @@ FIELD(MTEDESC, TSIZE, 14, 10)  /* mte_checkN only */
 bool mte_probe1(CPUARMState *env, uint32_t desc, uint64_t ptr);
 uint64_t mte_check1(CPUARMState *env, uint32_t desc,
                     uint64_t ptr, uintptr_t ra);
+uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
+                    uint64_t ptr, uintptr_t ra);
 
 static inline int allocation_tag_from_addr(uint64_t ptr)
 {
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index c8a5e7c0ed..abe6af6b79 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -500,7 +500,170 @@ uint64_t HELPER(mte_check1)(CPUARMState *env, uint32_t desc, uint64_t ptr)
 /*
  * Perform an MTE checked access for multiple logical accesses.
  */
+
+/**
+ * checkN:
+ * @tag: tag memory to test
+ * @odd: true to begin testing at tags at odd nibble
+ * @cmp: the tag to compare against
+ * @count: number of tags to test
+ *
+ * Return the number of successful tests.
+ * Thus a return value < @count indicates a failure.
+ *
+ * A note about sizes: count is expected to be small.
+ *
+ * The most common use will be LDP/STP of two integer registers,
+ * which means 16 bytes of memory touching at most 2 tags, but
+ * often the access is aligned and thus just 1 tag.
+ *
+ * Using AdvSIMD LD/ST (multiple), one can access 64 bytes of memory,
+ * touching at most 5 tags.  SVE LDR/STR (vector) with the default
+ * vector length is also 64 bytes; the maximum architectural length
+ * is 256 bytes touching at most 9 tags.
+ *
+ * The loop below uses 7 logical operations and 1 memory operation
+ * per tag pair.  An implementation that loads an aligned word and
+ * uses masking to ignore adjacent tags requires 18 logical operations
+ * and thus does not begin to pay off until 6 tags.
+ * Which, according to the survey above, is unlikely to be common.
+ */
+static int checkN(uint8_t *mem, int odd, int cmp, int count)
+{
+    int n = 0, diff;
+
+    /* Replicate the test tag and compare.  */
+    cmp *= 0x11;
+    diff = *mem++ ^ cmp;
+
+    if (odd) {
+        goto start_odd;
+    }
+
+    while (1) {
+        /* Test even tag. */
+        if (unlikely((diff) & 0x0f)) {
+            break;
+        }
+        if (++n == count) {
+            break;
+        }
+
+    start_odd:
+        /* Test odd tag. */
+        if (unlikely((diff) & 0xf0)) {
+            break;
+        }
+        if (++n == count) {
+            break;
+        }
+
+        diff = *mem++ ^ cmp;
+    }
+    return n;
+}
+
+uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
+                    uint64_t ptr, uintptr_t ra)
+{
+    int mmu_idx, ptr_tag, bit55;
+    uint64_t ptr_last, ptr_end, prev_page, next_page;
+    uint64_t tag_first, tag_end;
+    uint64_t tag_byte_first, tag_byte_end;
+    uint32_t esize, total, tag_count, tag_size, n, c;
+    uint8_t *mem1, *mem2;
+    MMUAccessType type;
+
+    bit55 = extract64(ptr, 55, 1);
+
+    /* If TBI is disabled, the access is unchecked, and ptr is not dirty. */
+    if (unlikely(!tbi_check(desc, bit55))) {
+        return ptr;
+    }
+
+    ptr_tag = allocation_tag_from_addr(ptr);
+
+    if (tcma_check(desc, bit55, ptr_tag)) {
+        goto done;
+    }
+
+    mmu_idx = FIELD_EX32(desc, MTEDESC, MIDX);
+    type = FIELD_EX32(desc, MTEDESC, WRITE) ? MMU_DATA_STORE : MMU_DATA_LOAD;
+    esize = FIELD_EX32(desc, MTEDESC, ESIZE);
+    total = FIELD_EX32(desc, MTEDESC, TSIZE);
+
+    /* Find the addr of the end of the access, and of the last element. */
+    ptr_end = ptr + total;
+    ptr_last = ptr_end - esize;
+
+    /* Round the bounds to the tag granule, and compute the number of tags. */
+    tag_first = QEMU_ALIGN_DOWN(ptr, TAG_GRANULE);
+    tag_end = QEMU_ALIGN_UP(ptr_last, TAG_GRANULE);
+    tag_count = (tag_end - tag_first) / TAG_GRANULE;
+
+    /* Round the bounds to twice the tag granule, and compute the bytes. */
+    tag_byte_first = QEMU_ALIGN_DOWN(ptr, 2 * TAG_GRANULE);
+    tag_byte_end = QEMU_ALIGN_UP(ptr_last, 2 * TAG_GRANULE);
+
+    /* Locate the page boundaries. */
+    prev_page = ptr & TARGET_PAGE_MASK;
+    next_page = prev_page + TARGET_PAGE_SIZE;
+
+    if (likely(tag_end - prev_page <= TARGET_PAGE_SIZE)) {
+        /* Memory access stays on one page. */
+        tag_size = (tag_byte_end - tag_byte_first) / (2 * TAG_GRANULE);
+        mem1 = allocation_tag_mem(env, mmu_idx, ptr, type, total,
+                                  MMU_DATA_LOAD, tag_size, ra);
+        if (!mem1) {
+            goto done;
+        }
+        /* Perform all of the comparisons. */
+        n = checkN(mem1, ptr & TAG_GRANULE, ptr_tag, tag_count);
+    } else {
+        /* Memory access crosses to next page. */
+        tag_size = (next_page - tag_byte_first) / (2 * TAG_GRANULE);
+        mem1 = allocation_tag_mem(env, mmu_idx, ptr, type, next_page - ptr,
+                                  MMU_DATA_LOAD, tag_size, ra);
+
+        tag_size = (tag_byte_end - next_page) / (2 * TAG_GRANULE);
+        mem2 = allocation_tag_mem(env, mmu_idx, next_page, type,
+                                  ptr_end - next_page,
+                                  MMU_DATA_LOAD, tag_size, ra);
+
+        /*
+         * Perform all of the comparisons.
+         * Note the possible but unlikely case of the operation spanning
+         * two pages that do not both have tagging enabled.
+         */
+        n = c = (next_page - tag_first) / TAG_GRANULE;
+        if (mem1) {
+            n = checkN(mem1, ptr & TAG_GRANULE, ptr_tag, c);
+        }
+        if (n == c) {
+            if (!mem2) {
+                goto done;
+            }
+            n += checkN(mem2, 0, ptr_tag, tag_count - c);
+        }
+    }
+
+    /*
+     * If we failed, we know which granule.  Compute the element that
+     * is first in that granule, and signal failure on that element.
+     */
+    if (unlikely(n < tag_count)) {
+        uint64_t fail_ofs;
+
+        fail_ofs = tag_first + n * TAG_GRANULE - ptr;
+        fail_ofs = ROUND_UP(fail_ofs, esize);
+        mte_check_fail(env, mmu_idx, ptr + fail_ofs, ra);
+    }
+
+ done:
+    return useronly_clean_ptr(ptr);
+}
+
 uint64_t HELPER(mte_checkN)(CPUARMState *env, uint32_t desc, uint64_t ptr)
 {
-    return ptr;
+    return mte_checkN(env, desc, ptr, GETPC());
 }
-- 
2.25.1

