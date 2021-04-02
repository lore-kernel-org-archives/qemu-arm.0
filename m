Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1745578lfg;
        Fri, 2 Apr 2021 14:42:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxciEhfTEQ4IF5vuPTyR8aPwH7/LsxMow7SHclOc0oMzsd7xOO1NUNSAx8XSNWBvbwUvGj+
X-Received: by 2002:a25:d041:: with SMTP id h62mr20823524ybg.107.1617399775814;
        Fri, 02 Apr 2021 14:42:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617399775; cv=none;
        d=google.com; s=arc-20160816;
        b=hLr1d+FrFpGCH5sNx2vtwZMc69GDy+ElDeirttiHq5stCEF3N+wEvGt3+z8Q16oD7b
         Lul/HX6eTnrhHMrXuoDYRTF5W6ImJYO+U2aOTqdLMyd1y1KYSdhJ/iCLpuXLe69ZY4v6
         m5A8nJClN49CbMSp33Oxo1TJYNH2p2S9laWE7YWGP//PUftmMjEeNMUwwNn5W3yqt0Nx
         +VjAaa/UQgCvGeHGOkDBesiBIz8AfjTqg+CtfuSZeOYxcRKoLouQpITdaNSiHX3qmxs9
         6Re9hRk++Qe7LgrXhT4MVjYocKyjC1K1qzaK2M9H95HY5ca9cLKvZ6B3NyFlNX1GHQ+x
         aHZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=OVt5iR1dmccHY0b49ovqyPgeianDpRHBCkX5yRWRcH8=;
        b=yl5dBhQy6rGzq5cXOHDTjketN7IRiAbeOyKiKbqrw0Onb8suHj7BDCVjouLaa64bWL
         vJnxpXred2DYNcVuaJsi62zxtxovJxc1pCLT6rC5N/kTj+RDgK8LWSP44Jf1Tcm9IrkT
         HN534HXd7YJsZGJWsEVNbG48lMjaxiqQzYCE4rpfbhMJ8Ji5bOnWRk2yE5DwJ6He34mz
         Bt0WqWasaWeQmSJzh4gjWTaSCHyC1JjjIuF6YzIqZdwukmcVFci0scSQM+2a8gRqFdHd
         vZLhqPdJf+3VVuIW6z0OjqVoQDLgp17Wix2i2N/FzfX7uoLG7rS5yEvDYvM+hYK4skIM
         xbIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vwN9kpi0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a7si9797058ybp.480.2021.04.02.14.42.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Apr 2021 14:42:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vwN9kpi0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lSRZ9-0000ox-28
	for alex.bennee@linaro.org; Fri, 02 Apr 2021 17:42:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSRYi-0000GQ-CS
 for qemu-arm@nongnu.org; Fri, 02 Apr 2021 17:42:28 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:35828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSRYg-0007h6-Jo
 for qemu-arm@nongnu.org; Fri, 02 Apr 2021 17:42:28 -0400
Received: by mail-pl1-x631.google.com with SMTP id e14so3032957plj.2
 for <qemu-arm@nongnu.org>; Fri, 02 Apr 2021 14:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OVt5iR1dmccHY0b49ovqyPgeianDpRHBCkX5yRWRcH8=;
 b=vwN9kpi0tXz2ObvJkmlLlmFzhTVZA7Gf7gL+20qLlfZUh1SSBH8hB/iQWbCAivgbH1
 0m9tF9D0fcO3UqXeZXj08+GH9LJqEFEfcTAhY+ldMMCHqkfWOnNlMdPIo3hK8rx19jyJ
 dGTfwul7XufzyOwkHspRFMjxbK11Q3pSZI8nIapDdpwuvhgn2AhXZXSlOPFAHoHs7kpQ
 nmLX33E/D6ndpoHTV7VjXCU3C58DBJf6G6gVe89VX14Hs6OHyJwfEfyD3zElmGDR/NYv
 FDANZG3pU4CIwUmO7REKa1gLK+TFkiLGDeR+KT8DEo3fMhMZRTIbYgIQZvsXyHCYu+gh
 JgVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OVt5iR1dmccHY0b49ovqyPgeianDpRHBCkX5yRWRcH8=;
 b=jT8K4Adf/lAXjyRQ/v00h3o6l1ZBiiy2DzvWdzPqQ1n+/skCMHz7lXOlLCXlqta7P3
 YqN7N3ivGi1vKDWyrq1mEwMiv6/blzN6Lfp9tbeMhC0BTp1h/1ZZVb/xn0Vi7O2x5zAf
 GVJEWtaae6rNE6QhAH7SVbpWBTJrsKh1+RDe45hHhSgW4ybTiPa+jKRVZk40LztGDSvc
 WHZQJZ90QQwXHFlgnpIjzZP/fVNu5/Xtct6ogHJqcEl2YtTMmy8ta9xXMwdPON/dTbWj
 gi79hgVz8B4ADZjj0o42f/WadhHKG4PgU0mJCoYPSRy18EDUP58YLWKyNmlwS/bDrWnu
 ykEg==
X-Gm-Message-State: AOAM530glMBfGdbeWQIwZnhpp0VyzhJScBXOcOU5NOgZrST2JYoOVGvH
 7ggLDdkkv7Gqq9ffN/I2Iq1F2HCR9Q3GCw==
X-Received: by 2002:a17:90a:990a:: with SMTP id
 b10mr15548299pjp.178.1617399745303; 
 Fri, 02 Apr 2021 14:42:25 -0700 (PDT)
Received: from localhost.localdomain
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id f16sm7923329pfj.220.2021.04.02.14.42.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Apr 2021 14:42:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/11] target/arm: Split out mte_probe_int
Date: Fri,  2 Apr 2021 14:42:10 -0700
Message-Id: <20210402214217.422585-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210402214217.422585-1-richard.henderson@linaro.org>
References: <20210402214217.422585-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
X-TUID: weZphAFOAIgl

Split out a helper function from mte_checkN to perform
all of the checking and address manpulation.  So far,
just use this in mte_checkN itself.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mte_helper.c | 52 +++++++++++++++++++++++++++++++----------
 1 file changed, 40 insertions(+), 12 deletions(-)

diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 473d84cee2..179846b463 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -753,33 +753,45 @@ static int checkN(uint8_t *mem, int odd, int cmp, int count)
     return n;
 }
 
-uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
-                    uint64_t ptr, uintptr_t ra)
+/*
+ * mte_probe_int:
+ * @env: CPU environment
+ * @desc: MTEDESC descriptor
+ * @ptr: virtual address of the base of the access
+ * @fault: return virtual address of the first check failure
+ *
+ * Internal routine for both mte_probe and mte_check.
+ * Return zero on failure, filling in *fault.
+ * Return negative on trivial success for tbi disabled.
+ * Return positive on success with tbi enabled.
+ */
+static int mte_probe_int(CPUARMState *env, uint32_t desc, uint64_t ptr,
+                         uintptr_t ra, uint32_t total, uint64_t *fault)
 {
     int mmu_idx, ptr_tag, bit55;
     uint64_t ptr_last, prev_page, next_page;
     uint64_t tag_first, tag_end;
     uint64_t tag_byte_first, tag_byte_end;
-    uint32_t total, tag_count, tag_size, n, c;
+    uint32_t tag_count, tag_size, n, c;
     uint8_t *mem1, *mem2;
     MMUAccessType type;
 
     bit55 = extract64(ptr, 55, 1);
+    *fault = ptr;
 
     /* If TBI is disabled, the access is unchecked, and ptr is not dirty. */
     if (unlikely(!tbi_check(desc, bit55))) {
-        return ptr;
+        return -1;
     }
 
     ptr_tag = allocation_tag_from_addr(ptr);
 
     if (tcma_check(desc, bit55, ptr_tag)) {
-        goto done;
+        return 1;
     }
 
     mmu_idx = FIELD_EX32(desc, MTEDESC, MIDX);
     type = FIELD_EX32(desc, MTEDESC, WRITE) ? MMU_DATA_STORE : MMU_DATA_LOAD;
-    total = FIELD_EX32(desc, MTEDESC, TSIZE);
 
     /* Find the addr of the end of the access, and of the last element. */
     ptr_last = ptr + total - 1;
@@ -803,7 +815,7 @@ uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
         mem1 = allocation_tag_mem(env, mmu_idx, ptr, type, total,
                                   MMU_DATA_LOAD, tag_size, ra);
         if (!mem1) {
-            goto done;
+            return 1;
         }
         /* Perform all of the comparisons. */
         n = checkN(mem1, ptr & TAG_GRANULE, ptr_tag, tag_count);
@@ -829,23 +841,39 @@ uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
         }
         if (n == c) {
             if (!mem2) {
-                goto done;
+                return 1;
             }
             n += checkN(mem2, 0, ptr_tag, tag_count - c);
         }
     }
 
+    if (likely(n == tag_count)) {
+        return 1;
+    }
+
     /*
      * If we failed, we know which granule.  For the first granule, the
      * failure address is @ptr, the first byte accessed.  Otherwise the
      * failure address is the first byte of the nth granule.
      */
-    if (unlikely(n < tag_count)) {
-        uint64_t fault = (n == 0 ? ptr : tag_first + n * TAG_GRANULE);
-        mte_check_fail(env, desc, fault, ra);
+    if (n > 0) {
+        *fault = tag_first + n * TAG_GRANULE;
     }
+    return 0;
+}
 
- done:
+uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
+                    uint64_t ptr, uintptr_t ra)
+{
+    uint64_t fault;
+    uint32_t total = FIELD_EX32(desc, MTEDESC, TSIZE);
+    int ret = mte_probe_int(env, desc, ptr, ra, total, &fault);
+
+    if (unlikely(ret == 0)) {
+        mte_check_fail(env, desc, fault, ra);
+    } else if (ret < 0) {
+        return ptr;
+    }
     return useronly_clean_ptr(ptr);
 }
 
-- 
2.25.1

