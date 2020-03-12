Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1087811lfc;
        Thu, 12 Mar 2020 12:42:56 -0700 (PDT)
X-Received: by 2002:a17:902:7d94:: with SMTP id a20mr9928709plm.307.1584042176497;
        Thu, 12 Mar 2020 12:42:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584042176; cv=none;
        d=google.com; s=arc-20160816;
        b=H24XOXCRpZEOjnkVI91TTXFAf1Gqb+Eg/Px5jhqQwfufteIdb6Fe9GkqOfdn0qEKNy
         F3S4iuRisu5Fd3ZQ56xu+uCotgON1PCZoojXk4MD8Qk7GV4I1Vbxnw2nkyoHPNvSrZ8r
         pB51OZoKCvSIVvjWarkTPL7U2TDXYQMcxXnOA+kYfM1x4DUgvzV/uSTYRrRlRTq6gLtO
         KlhXWKbIE7Bc8E6M2tqBnv0psfJUye4cLH8JoJNJQFIlCEcC55nXkMhYdtgzUrYWhSM4
         Eu1fqs0RzXUZWPvjvNiF/vuFZcGHgRu7ZC5r6fau0pKSnrH6thx2T7R40RViYNcElRMC
         xplg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=mxH1z7hu6JWyA2yDv2VBwZVGJWKtIh1G7GDAiImS5lg=;
        b=JlytobWtb3KGX0Dh69nvbqdBagTLpR6buH1SlwPGXje8B2cf0sc1vaEStlTl7Mtu5B
         /2BsGFACXkVdU4oXDaLvHBLI8k16ZlM66vzN7kLNK6QX6nN6VRCjHIVZojDVVTnDHQYd
         S9keoHinHHSaiE8SXGJmpsQLquVJzNg2J58PtmdP4V33YGNnZsv14TfZi3Fsbd/uUESf
         N9WB7Be4LYL6TkUccAJEslrxCdlcMoR2n7pSLpERFdomiEMxVjsjex57y10QznMfybv6
         QaLR4ywGnDZIft2I+FwTCVRkHRqpeYAdpStXdLsjCN1RM1GYZVBjMG/Fg9Ys9Er0HvmG
         KhOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zvsz+a5+;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id x23sor7767777pln.2.2020.03.12.12.42.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Mar 2020 12:42:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zvsz+a5+;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mxH1z7hu6JWyA2yDv2VBwZVGJWKtIh1G7GDAiImS5lg=;
        b=Zvsz+a5+BrOwCde1qmvRbrjxWo/P4LV4e8xWh5Y68M7xSG4QN0XSKO5FxPj/dhIzr2
         poXLWwfehj6gJl8TuTfIAt4oZSbHDf4cROm2X8Pfk1iq9s6AER771ob2R4wsWb4lfPCk
         6Ym7xRbAGyxRro0qZEEQdOsZDoT1nHDjVgm/OngpzE+/TCnFbt4yAYCXPgeI2EWHoddp
         gtBOPs6kiFmcBvY/RRdA4FMvklE7Ie/VFNZxWWs0zeynNbFAs25JwvUaswV8K6p9XS1c
         YJ2ES/fyoC3KZfVbnynHmXxmhT8y1AFQQM/9GMKZ84WVgbYHeFgAVqsPT7zgjYekOaUl
         apnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mxH1z7hu6JWyA2yDv2VBwZVGJWKtIh1G7GDAiImS5lg=;
        b=S5uROXRtm7ndmlDOwrUpTIcSP5tJTQmYFuokHOVOpyYShguo7P68PcrTNV9zM+IbX/
         zy9m4nC0h0B03t/c92JHcwkiP4bc6WNVDNyu11nkYoMLOKO/6ycoe5At3NsZpy44A40E
         38PmRSBsQiSwXFQ2VrraX9bOjUA+m9TpQ1FicYc2DOxHdG+Lnw5tUSDMDHvIBl6Njl8x
         n91bZgf84aJGsVB6aa7MGthVyp8VA1D4kPSA9o8xQv2hhTgng7eJVAPD/h07lK2ii4Hs
         FNjGJBMW5dWJQlgTmr3jXO7Ym+Z2xMsqBzcRuKyTpeWLB8HzdkA4lqljVaHjUmCYtnN/
         d9oQ==
X-Gm-Message-State: ANhLgQ0mdcNGJBPBuDYIio66j8QmEdHWRHxCiJy7SEeN7mqfCZLYBdCW
	AqmX9ydrJRZGptLR5sg9hQohrjG2ErTq5A==
X-Google-Smtp-Source: ADFU+vtiuzqDLWcjp34ykO0VnMAaoR+cJwdzI5bjV6mHKDKtw8+DgXt7HPwWzobZ9oOYlScMV6TjLQ==
X-Received: by 2002:a17:902:343:: with SMTP id 61mr9680731pld.332.1584042175877;
        Thu, 12 Mar 2020 12:42:55 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id g69sm6824842pje.34.2020.03.12.12.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 12:42:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v6 26/42] target/arm: Implement helper_mte_checkN
Date: Thu, 12 Mar 2020 12:42:03 -0700
Message-Id: <20200312194219.24406-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312194219.24406-1-richard.henderson@linaro.org>
References: <20200312194219.24406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: xHj4hGB3lICN

Fill out the stub that was added earlier.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h  |   1 +
 target/arm/mte_helper.c | 162 +++++++++++++++++++++++++++++++++++++++-
 2 files changed, 162 insertions(+), 1 deletion(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 8bbaf9b453..04f0b619b7 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1316,6 +1316,7 @@ FIELD(MTEDESC, TSIZE, 14, 10)  /* mte_checkN only */
 
 bool mte_probe1(CPUARMState *env, uint32_t desc, uint64_t ptr, uintptr_t ra);
 uint64_t mte_check1(CPUARMState *env, uint32_t desc, uint64_t ptr, uintptr_t ra);
+uint64_t mte_checkN(CPUARMState *env, uint32_t desc, uint64_t ptr, uintptr_t ra);
 
 static inline int allocation_tag_from_addr(uint64_t ptr)
 {
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 7a87574b35..94f67b33d1 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -494,7 +494,167 @@ uint64_t HELPER(mte_check1)(CPUARMState *env, uint32_t desc, uint64_t ptr)
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
+
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
+uint64_t mte_checkN(CPUARMState *env, uint32_t desc, uint64_t ptr, uintptr_t ra)
+{
+    int mmu_idx, ptr_tag, bit55;
+    uint64_t ptr_last, ptr_end, next_page;
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
+    next_page = TARGET_PAGE_ALIGN(ptr);
+    if (likely(tag_end <= next_page)) {
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
2.20.1
