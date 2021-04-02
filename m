Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1746150lfg;
        Fri, 2 Apr 2021 14:44:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyio8owmpm99by4Wd+emrJ/AtztjhijGEs/nyl0hUNsu8WH0CNWwYvr7Vb6R52TacaWihAk
X-Received: by 2002:a25:d045:: with SMTP id h66mr21258540ybg.138.1617399856577;
        Fri, 02 Apr 2021 14:44:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617399856; cv=none;
        d=google.com; s=arc-20160816;
        b=Jb5WzanzuvKYW2gD16L646cBQApE+yksxm+356L7tYTZHYOoU8Y6z9n5r349Clf2SV
         b1r/7Nt77On7w3+s4iDVWIsoRWnJDvV0jfwwNpsErxQPKlScVPdsB9ySU9kOxvMNqzRy
         kJBT5iPeggXt3q2snT3Fbno9CiytVZVrEOq7P1b37DGOqbFrNhfadekLFXsw0tLBpKTf
         wsfO2OiR1y6D4vEqk4pCluzCAEhKLsiCPpkQEntagMhaltS/+zJtVeXNPu0nGGdFyAR3
         rDsyHdAhE/p+eEKYhSyFI5mXBHqI6t0Wcg6uzyQA9g8D0eiO2GLcNLdFdRAC+/LO4TT2
         NItg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=y+w0gMMCEBK2Vtlb1FFYoCbN7uhYY0HOFcCe/poCdwU=;
        b=LTH2qn5EkVVeVmKfbWoNCnJD746P8HRoA4xNXI5c7gE4oalfxzTzHgesZ2EKH4ljDb
         LLmhYjIrvj9FqYOcV/w7FfDNSVW5EwCxsROLUSzlL+l1SQLzlOdMlmrMXaKR+qUEVIgm
         UfG1KCK+OuhvaMC+pJh2qQzSF6m8RLFsoENscSds/CGCvLtXYaZiEOWdUYPZ/FprXjmG
         eZWAEwGPLwW6Lv8BvDuFrsVzxPmICwcFp4ovzbMnEmqhLR/OiSjqOsk4vxo+Ll73eHEc
         rNdvrNJXmAwM05cdVzlLvVbSKOVQrEuUoqXzMX+KVnhLUfZg3fNxhd93jAhtc14WuoPm
         loqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="t7WSYds/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z16si8959363ybj.291.2021.04.02.14.44.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Apr 2021 14:44:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="t7WSYds/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lSRaR-0003pK-QO
	for alex.bennee@linaro.org; Fri, 02 Apr 2021 17:44:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSRYh-0000El-Dk
 for qemu-arm@nongnu.org; Fri, 02 Apr 2021 17:42:27 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:53828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSRYf-0007gT-FC
 for qemu-arm@nongnu.org; Fri, 02 Apr 2021 17:42:27 -0400
Received: by mail-pj1-x102a.google.com with SMTP id t23so4032pjy.3
 for <qemu-arm@nongnu.org>; Fri, 02 Apr 2021 14:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y+w0gMMCEBK2Vtlb1FFYoCbN7uhYY0HOFcCe/poCdwU=;
 b=t7WSYds/LTRohORLyMGy3J20JQj6o+/XqYc5jd3CmRAcK/YnHQIavA3PqnDAJZLN4a
 euEyEYO65G43C1xm3Ikkyn6r2F1Xm2DiaCwl83fkHb/qkOpndv80D1kltqePBLNQ/x8R
 gaFR0G+FV2yqh6oo4RF/dK09o7s2YdoNiU4TO7mcWBy/G7oE1+7gGzRb6vKk8f+ofFUy
 9cquZXaTsPNt52+2PWU/l9rum6Wg3kXny1A3R+/6Z7E712R1LQ/3a7OK53QXMRq8y6wr
 FBOp1earr0nnL9H/LepiRSUws/p0RT3z8Z4sY69zTFrA7GqersuFHBc29dNIjOfUug8e
 Ddkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y+w0gMMCEBK2Vtlb1FFYoCbN7uhYY0HOFcCe/poCdwU=;
 b=pivx1qQvLO1kr0XVjtaCizpqlq+Ex5KUUX0e/B+n3yGWXqpGVhkhiZm8IPbQFNej+p
 /t8DIhrAgVD453eOZGE+CAr//afo+6VlnNMQMdXTW601lKbdMZh35YVpcBKgjd7uDqwg
 GTwe8EJ/qBxvuuQnNRaXOtwzUvAu16tSGFSiZy3qyoP27PYWOJO+DM7pYmddmOXuErSz
 uIPoU6/+ujlxk1A8sMYOLhIB5r9hojwc5GATQBcmBFvf1tN/CnJSXIInzRZs5njnJHOL
 35TUBFG5uSzM7XvEhSAH3XYyuEE7S9VC9qXor3bdf4AcMBvZ9blTM6OabOonSZjifvxq
 UmaQ==
X-Gm-Message-State: AOAM530F/I8vY5ezNymrvzGtUVawOGlEmxHnRU5ye0wP4mnPbD0urPe+
 mvsj08HHnHHkA5InUvc1LRkZjQ==
X-Received: by 2002:a17:90a:e542:: with SMTP id
 ei2mr15393080pjb.134.1617399744158; 
 Fri, 02 Apr 2021 14:42:24 -0700 (PDT)
Received: from localhost.localdomain
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id f16sm7923329pfj.220.2021.04.02.14.42.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Apr 2021 14:42:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/11] target/arm: Fix unaligned mte checks for mte_checkN
Date: Fri,  2 Apr 2021 14:42:09 -0700
Message-Id: <20210402214217.422585-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210402214217.422585-1-richard.henderson@linaro.org>
References: <20210402214217.422585-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4xvU+FBY9P6z

We were incorrectly assuming that only the first byte of an MTE access
is checked against the tags.  But per the ARM, unaligned accesses are
pre-decomposed into single-byte accesses.  So by the time we reach the
actual MTE check in the ARM pseudocode, all accesses are aligned.

Therefore, the first failure is always either the first byte of the
access, or the first byte of the granule.

Buglink: https://bugs.launchpad.net/bugs/1921948
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mte_helper.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 8be17e1b70..473d84cee2 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -757,10 +757,10 @@ uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
                     uint64_t ptr, uintptr_t ra)
 {
     int mmu_idx, ptr_tag, bit55;
-    uint64_t ptr_last, ptr_end, prev_page, next_page;
+    uint64_t ptr_last, prev_page, next_page;
     uint64_t tag_first, tag_end;
     uint64_t tag_byte_first, tag_byte_end;
-    uint32_t esize, total, tag_count, tag_size, n, c;
+    uint32_t total, tag_count, tag_size, n, c;
     uint8_t *mem1, *mem2;
     MMUAccessType type;
 
@@ -779,12 +779,10 @@ uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
 
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
@@ -817,7 +815,7 @@ uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
 
         tag_size = (tag_byte_end - next_page) / (2 * TAG_GRANULE);
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

