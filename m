Received: by 2002:a17:906:cf8c:b0:9a1:fa4e:495e with SMTP id um12csp435458ejb;
        Thu, 7 Sep 2023 09:05:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+YfOe4Wu2OvoAguJAJGfcDuL2oE7iLAUV0Hinz17yImZMomq0eMDws9Lo4qyC2npcE1af
X-Received: by 2002:a05:6358:6f17:b0:135:aed4:99b4 with SMTP id r23-20020a0563586f1700b00135aed499b4mr6365577rwn.4.1694102711713;
        Thu, 07 Sep 2023 09:05:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694102711; cv=none;
        d=google.com; s=arc-20160816;
        b=L8SYjqCl8avLDzVhCj67H7tzraOM9VFuyCc/s5m2+FufH858RAZ/8DEVxBwf/+uq3x
         TDcVb3LRcxbWfPiQlRiyu0cIDE4o1cLfBFfTPSTIhDRsSm+/dVszW75uoyE+TQn8UE6F
         shTKuWhuK6BUXilk0cYTLOTgg4vCuZa6Na0adikWIBBomwHIAZdinP5k72fwCzHIyeuN
         V3OJ3F+HaTbqAkka59CPJkaco1EgY3zPG4wcWfMmRx9IrGsrUyQmNkiYFuJQBdmXZuDA
         ArvYisupQRyC2FP2+7Oc9Ww5UdGOdaWqHA6aEX4Q6igFcf40cRZNWZFlD/B92RmRu33Z
         3XHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=MlrOF6wYS3oKU3yUenQo/IwZLeVaHMbPfXY1DgfuGLg=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=q48dBCrJLIO+nHn2yXv+xr1nNXSE33KWtGk3W74X6tQy28sqaYjMHxOtjsQ8PK11k5
         iKKkk4fgIKG9enf3evil1d2GsNptlYt+fJL32mEZ1YISlxpodBFdlydn85PeZG5r7E2t
         zD404rj6CdswsePFpETlR+wGlk/xZy7QnwYzUF4Li+Iko2XvfENQfqOT9RCuK7uhmVX7
         yZ5JkXUugDu8v5ZwHpwwtjjcmJ1qdCGGSVXyG636JsFBje6aeqrBSsIJN6Q3Z9cb0Clf
         nuJfAHKoEV56ZEkWfdrXzLiHAYgc4zMt6Vm5fFDIC7Wj4PeHfxAjiYJXVX4tD75B/JM+
         Uvqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mqOEgaii;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v200-20020a1f2fd1000000b0049353cc5ffcsi684973vkv.195.2023.09.07.09.05.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Sep 2023 09:05:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mqOEgaii;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qeHU9-0000zJ-3w; Thu, 07 Sep 2023 12:04:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qeHU6-0000wK-M3
 for qemu-arm@nongnu.org; Thu, 07 Sep 2023 12:03:58 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qeHTy-00021c-FT
 for qemu-arm@nongnu.org; Thu, 07 Sep 2023 12:03:58 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-401bbfc05fcso12755765e9.3
 for <qemu-arm@nongnu.org>; Thu, 07 Sep 2023 09:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694102629; x=1694707429; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MlrOF6wYS3oKU3yUenQo/IwZLeVaHMbPfXY1DgfuGLg=;
 b=mqOEgaiiwDWLoBVs1a9/CwngR6XTPzcOzsplLhE0SjNJCXyIjkdNB3TlKu7hEU91bF
 2OfWIVo+bpX4cHsMhuZ48B04JAYawLCdGpub5GqAInXy9UpQJ553PaMu9GyQoZnb8UwZ
 fCVLsuA4wTxLWgj6+GZo++qTd4NvFgKXBkcKko5TG/tLuRmy+eSvi3WSa8e5pO9FIxdG
 BbeN0y/na0UQ1Gq9tZP2ThrLo160mzq6l3Lnqu6Z9up8WF+LsMeUwzenlslJ7D19KRms
 s/dc3qELGNRch9WrzsxHkJx3oWc/0SqSYIR/+N5z4YChNCuRRc1oVZt9pcyorTEir84k
 ws4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694102629; x=1694707429;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MlrOF6wYS3oKU3yUenQo/IwZLeVaHMbPfXY1DgfuGLg=;
 b=LIA6zuN976KpJm4Wm8miC6nOz8lxQl2hV2ON7Tb/4oFmQlxj6ikEQXP7MqS8VxSPl8
 hXOV/S4GU7fGp9ATGo5s6KnjXVfxUvp9tj/LcDFQ1Er1F8RXfmoiBFN/V5l6lgNNyzov
 iLPEwoNwcTtRT62hpGypTsjNj0p4DTTVqY2Z9mcQsq7xDtxqgB1U3wd18mhRk3Au07t4
 aDPU5XLRT9gukPB4SdYZgPTlb+hiQO1mRV2jsv53rpjIHhzNMUODczpCPMHcJSxX76K6
 xK87kRGdH0qPkxk0ovt9ygtZLdMbFsmDZ1fcWbwnoVUmxpwMncxtKs3vSe2FHxhhBenj
 jyjg==
X-Gm-Message-State: AOJu0YxsSbUtBUhQzsCOE/DHPKsmWK+Fr7iaCOPWy5BwVW10VPkhy6kV
 HoQzgbWqMDDLIoEQyMWofvt9S4zyYp6E0owj+1A=
X-Received: by 2002:a5d:534c:0:b0:319:71be:9241 with SMTP id
 t12-20020a5d534c000000b0031971be9241mr5422160wrv.25.1694102629125; 
 Thu, 07 Sep 2023 09:03:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d1-20020adfa401000000b0031980294e9fsm20256241wra.116.2023.09.07.09.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Sep 2023 09:03:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 12/14] target/arm: Implement MTE tag-checking functions for
 FEAT_MOPS copies
Date: Thu,  7 Sep 2023 17:03:38 +0100
Message-Id: <20230907160340.260094-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230907160340.260094-1-peter.maydell@linaro.org>
References: <20230907160340.260094-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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
X-TUID: rShJbZ9JqQdU

The FEAT_MOPS memory copy operations need an extra helper routine
for checking for MTE tag checking failures beyond the ones we
already added for memory set operations:
 * mte_mops_probe_rev() does the same job as mte_mops_probe(), but
   it checks tags starting at the provided address and working
   backwards, rather than forwards

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h      | 17 +++++++
 target/arm/tcg/mte_helper.c | 99 +++++++++++++++++++++++++++++++++++++
 2 files changed, 116 insertions(+)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 642f77df29b..1dd9182a54a 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1288,6 +1288,23 @@ uint64_t mte_check(CPUARMState *env, uint32_t desc, uint64_t ptr, uintptr_t ra);
 uint64_t mte_mops_probe(CPUARMState *env, uint64_t ptr, uint64_t size,
                         uint32_t desc);
 
+/**
+ * mte_mops_probe_rev: Check where the next MTE failure is for a FEAT_MOPS
+ *                     operation going in the reverse direction
+ * @env: CPU env
+ * @ptr: *end* address of memory region (dirty pointer)
+ * @size: length of region (guaranteed not to cross a page boundary)
+ * @desc: MTEDESC descriptor word (0 means no MTE checks)
+ * Returns: the size of the region that can be copied without hitting
+ *          an MTE tag failure
+ *
+ * Note that we assume that the caller has already checked the TBI
+ * and TCMA bits with mte_checks_needed() and an MTE check is definitely
+ * required.
+ */
+uint64_t mte_mops_probe_rev(CPUARMState *env, uint64_t ptr, uint64_t size,
+                            uint32_t desc);
+
 /**
  * mte_check_fail: Record an MTE tag check failure
  * @env: CPU env
diff --git a/target/arm/tcg/mte_helper.c b/target/arm/tcg/mte_helper.c
index d934f89bebb..ad53027044e 100644
--- a/target/arm/tcg/mte_helper.c
+++ b/target/arm/tcg/mte_helper.c
@@ -733,6 +733,55 @@ static int checkN(uint8_t *mem, int odd, int cmp, int count)
     return n;
 }
 
+/**
+ * checkNrev:
+ * @tag: tag memory to test
+ * @odd: true to begin testing at tags at odd nibble
+ * @cmp: the tag to compare against
+ * @count: number of tags to test
+ *
+ * Return the number of successful tests.
+ * Thus a return value < @count indicates a failure.
+ *
+ * This is like checkN, but it runs backwards, checking the
+ * tags starting with @tag and then the tags preceding it.
+ * This is needed by the backwards-memory-copying operations.
+ */
+static int checkNrev(uint8_t *mem, int odd, int cmp, int count)
+{
+    int n = 0, diff;
+
+    /* Replicate the test tag and compare.  */
+    cmp *= 0x11;
+    diff = *mem-- ^ cmp;
+
+    if (!odd) {
+        goto start_even;
+    }
+
+    while (1) {
+        /* Test odd tag. */
+        if (unlikely((diff) & 0xf0)) {
+            break;
+        }
+        if (++n == count) {
+            break;
+        }
+
+    start_even:
+        /* Test even tag. */
+        if (unlikely((diff) & 0x0f)) {
+            break;
+        }
+        if (++n == count) {
+            break;
+        }
+
+        diff = *mem-- ^ cmp;
+    }
+    return n;
+}
+
 /**
  * mte_probe_int() - helper for mte_probe and mte_check
  * @env: CPU environment
@@ -1041,6 +1090,56 @@ uint64_t mte_mops_probe(CPUARMState *env, uint64_t ptr, uint64_t size,
     }
 }
 
+uint64_t mte_mops_probe_rev(CPUARMState *env, uint64_t ptr, uint64_t size,
+                            uint32_t desc)
+{
+    int mmu_idx, tag_count;
+    uint64_t ptr_tag, tag_first, tag_last;
+    void *mem;
+    bool w = FIELD_EX32(desc, MTEDESC, WRITE);
+    uint32_t n;
+
+    mmu_idx = FIELD_EX32(desc, MTEDESC, MIDX);
+    /* True probe; this will never fault */
+    mem = allocation_tag_mem_probe(env, mmu_idx, ptr,
+                                   w ? MMU_DATA_STORE : MMU_DATA_LOAD,
+                                   size, MMU_DATA_LOAD, true, 0);
+    if (!mem) {
+        return size;
+    }
+
+    /*
+     * TODO: checkNrev() is not designed for checks of the size we expect
+     * for FEAT_MOPS operations, so we should implement this differently.
+     * Maybe we should do something like
+     *   if (region start and size are aligned nicely) {
+     *      do direct loads of 64 tag bits at a time;
+     *   } else {
+     *      call checkN()
+     *   }
+     */
+    /* Round the bounds to the tag granule, and compute the number of tags. */
+    ptr_tag = allocation_tag_from_addr(ptr);
+    tag_first = QEMU_ALIGN_DOWN(ptr - (size - 1), TAG_GRANULE);
+    tag_last = QEMU_ALIGN_DOWN(ptr, TAG_GRANULE);
+    tag_count = ((tag_last - tag_first) / TAG_GRANULE) + 1;
+    n = checkNrev(mem, ptr & TAG_GRANULE, ptr_tag, tag_count);
+    if (likely(n == tag_count)) {
+        return size;
+    }
+
+    /*
+     * Failure; for the first granule, it's at @ptr. Otherwise
+     * it's at the last byte of the nth granule. Calculate how
+     * many bytes we can access without hitting that failure.
+     */
+    if (n == 0) {
+        return 0;
+    } else {
+        return (n - 1) * TAG_GRANULE + ((ptr + 1) - tag_last);
+    }
+}
+
 void mte_mops_set_tags(CPUARMState *env, uint64_t ptr, uint64_t size,
                        uint32_t desc)
 {
-- 
2.34.1

