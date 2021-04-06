Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp1687650lfr;
        Tue, 6 Apr 2021 10:42:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNy6ERSj32wSjEXO6Hx4QFor1ywS6pPrB4NkSRnge6YU1z7VEMNjq/6ZZJOnBdnDCiPpgB
X-Received: by 2002:a92:ce82:: with SMTP id r2mr4395486ilo.240.1617730939655;
        Tue, 06 Apr 2021 10:42:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617730939; cv=none;
        d=google.com; s=arc-20160816;
        b=HmySYsMSZe08cQ8w5ijTrUC24j5HUbzfgLkt8O3avY0WhJcNBw+LOkWKRLNjSNgyvZ
         egU1nh7TJ/YDOwng/Rwc3ePfA9jp6H5fl83if5pzATv75uUcOkUtc/lIor5T18xMKuz/
         pdFaDQQpzQ5ZtgZXTSeV5U1DifvCLqXKUxzbPNmXhf9ivZoQR0BQGdVj+5+xtMplj2nu
         MyrumRHm5vpGlJd17kGmFY8X97t+W9kvgaJEGCAPNAV7+waN9qFcLc62MC72w7BpDHvn
         NY85D0WcRy4wYaw342k/mrWBVGB/LgVMYbtWklUc4cNhQZ3XJTMQ1ADs7f7eueJd2c8h
         tfOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=YQ1L8vImC9BAqb2R2P9ZLLT4N7NCVNuCBmSGEW3fZ+M=;
        b=doe3zqZ5v1n7J5dcnzvRdSgg/V6d3/EOkIuKSY5U6jW4ZDOh8mPWMnMUSyncp/8HHL
         SJR3DwPoCvGyWyAiWhnCOOhzlBAWdUE3BKAoheGmt65po9klajB99/V1Px8J12sSJZI6
         4ROIl7gzTsbO2yl3uxQDv4RrDuTO2F0Iko1H9eLeuIQOdao19xJ/y6AILWMTW7FUJ/sF
         ZrP2+ffS9RMYq72FieGsuKuMlx2i+bqtgao8VhneetJLo2hQBcQ6e8WZsz7Ju9Ico8+P
         h2j8mhCIs7bRnPk6QEnsLeorUkRthUAMar+3dPE3VMG2hQOlAo/wwfc0c/yJAO+Lh1Dc
         WE3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=prMx0V7M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t7si20472840jaj.40.2021.04.06.10.42.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Apr 2021 10:42:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=prMx0V7M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lTpiU-0003lL-PM
	for alex.bennee@linaro.org; Tue, 06 Apr 2021 13:42:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTpgv-0001fW-Dq
 for qemu-arm@nongnu.org; Tue, 06 Apr 2021 13:40:41 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:44626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTpgs-0006Kc-L0
 for qemu-arm@nongnu.org; Tue, 06 Apr 2021 13:40:41 -0400
Received: by mail-pl1-x631.google.com with SMTP id d8so7902296plh.11
 for <qemu-arm@nongnu.org>; Tue, 06 Apr 2021 10:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YQ1L8vImC9BAqb2R2P9ZLLT4N7NCVNuCBmSGEW3fZ+M=;
 b=prMx0V7Mceo2sC/+8iI3ycNrW7C7iFVkUBUp/S2D4ZdUDN50Zk+KU70H7RYj0xmNuF
 p80sptEnD5w1QSwb8/YE5fRiXRuaaxu4EUdhY97oBWx0QEkDUJyMo0NQix1Gcb7oTfOH
 p8DhJnYuSO2Wwv6ArOfdnloZz5nO4FcwAPMoWpw2K8AgEwT0p1MeE+WtDDSQ2H6EVjTz
 zQxMjLYV59vsFKAVNLpDQsO/tHKy2RcJ7Y/Qv4f+SrH5IkrvkhshZJdpfmWUmwt4HAYe
 o8Fq7k2AyxFw/Z6GhhWUrV07QfZrm4u/yvYFqrjskJD29YU8l+1jnkB43+H1xWdMlbJY
 dAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YQ1L8vImC9BAqb2R2P9ZLLT4N7NCVNuCBmSGEW3fZ+M=;
 b=DKHg1cNcyeSolA4SjmjB3xOhCaYeTt+S4M4cCO+AS4OrM4ZP3tQAw1bA+NOar4Bur5
 Q/8ldYCXUZXje7C74bjfmX8bL01Az4SnsSHVUfpWCnWMRT52mLjWacwZcVlP/oUdxDkF
 VAFlmpmyNTnu2gIC7BAGBCc6LA1gNT71fsDL7aHbbg/umzGRpg40QxyzCMSRzwEQoZQY
 FRZjq/IyKpDlZEkn5wG7OmQ5OohLSXjyUAHH6ymkwatUFY4E/EDb+78Y8b3Do43b5urd
 106uDjKvYsXQw4c91J9J9WloMx4pPkZeMJixhIiqBIK6tTg9efiNvLo6L9Pq7E6k1nCG
 lPxg==
X-Gm-Message-State: AOAM532kKaVL4zAzl4CysqDfVPCPvGJvhgoPma/5bTP5jW3TZuIxNczH
 JdEZIt2jfKpeD3MAddE0I8/tAA==
X-Received: by 2002:a17:902:7401:b029:e8:e6e5:3240 with SMTP id
 g1-20020a1709027401b02900e8e6e53240mr14389236pll.62.1617730837238; 
 Tue, 06 Apr 2021 10:40:37 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id h15sm19148056pfo.20.2021.04.06.10.40.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 10:40:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 04/12] target/arm: Split out mte_probe_int
Date: Tue,  6 Apr 2021 10:40:23 -0700
Message-Id: <20210406174031.64299-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210406174031.64299-1-richard.henderson@linaro.org>
References: <20210406174031.64299-1-richard.henderson@linaro.org>
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
X-TUID: ENMsNmsDMuaq

Split out a helper function from mte_checkN to perform
all of the checking and address manpulation.  So far,
just use this in mte_checkN itself.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mte_helper.c | 52 +++++++++++++++++++++++++++++++----------
 1 file changed, 40 insertions(+), 12 deletions(-)

diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index c87717127c..144bfa4a51 100644
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
     uint64_t tag_first, tag_last;
     uint64_t tag_byte_first, tag_byte_last;
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

