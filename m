Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp861680wrm;
        Fri, 11 Oct 2019 06:48:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxKwepAxX1f4duMj66zw6/pREYM+DU/1Pg0A9pAQvx3n4AuECI9UXQtqJdqAUbh0wYm3unj
X-Received: by 2002:a37:8ec5:: with SMTP id q188mr15475811qkd.495.1570801739221;
        Fri, 11 Oct 2019 06:48:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570801739; cv=none;
        d=google.com; s=arc-20160816;
        b=W72yrU5oXzxRjChtM929bgSF9i1yLxDn8ymJ9F5z8zfZoMoKsgko3viUca7t1u6sZU
         uBwCOvHq4nA1TzMtNd0hiLfThw2czh78YCXp/Z0UvU7/oLyvSmrUBtzazMLKRcB2jBvs
         le2JEnmYBXvA8pkV3zfkXyEy7EQusWj6krmygQK1v6HrojpO4vE59fN26/B/wyYgg3gX
         J3MYeqbUZlIe1sQwCvgipRfma8MQ/GsYvfZcTZKiHG6dSegtbPemvtIdGavVQJVODdVB
         1uduW/Ew9cq3ajGL18wcdncWPBhfmyuGMfETsFxzGa9ylYSWWee8j5xE7uNU+ZgPQm1N
         5/2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=kRVYi/cd4sJBmkOfsvOkC48A2821IfvOweyDTIJZmas=;
        b=hWkzZtOOzGGjDhaS4+w4qMFCbMeRlsKKczqP6qvlm9JgLay+7+WdyewvsjgYYj0Rk7
         BbrX5HW+erWT1aM6CzWZBHicd+GBV/6xqPNc92/FbhhbQnVESooDeAqGtJssZQEgwekF
         deWmXksRxuyS5lhHhmdeQ85mYhTih9b/sTOc5zFCUxUl9OPdCDnP3WltSUDtLDB4yoW5
         0SaDcUd5AUJDbv2xItKt/O/1J2wDJpaqcioFdUyktiMzhrTpFC0KpfYZP1Be0uPKSQNj
         Br0AePUeuSFg++VDYBlJT/W+rcSQJQ7naKkSc0itpIPgCftNqsLXu1Yd3Yan5YdZalx/
         Vbqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Yu/oJVtW";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p186si8843126qkd.131.2019.10.11.06.48.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Oct 2019 06:48:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Yu/oJVtW";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIvHu-0003NE-54
	for alex.bennee@linaro.org; Fri, 11 Oct 2019 09:48:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38586)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iIvHZ-0003K7-4w
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 09:48:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iIvHX-00036p-Us
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 09:48:37 -0400
Received: from mail-yw1-xc41.google.com ([2607:f8b0:4864:20::c41]:42011)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iIvHX-00036d-RF
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 09:48:35 -0400
Received: by mail-yw1-xc41.google.com with SMTP id i207so3479905ywc.9
 for <qemu-arm@nongnu.org>; Fri, 11 Oct 2019 06:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=kRVYi/cd4sJBmkOfsvOkC48A2821IfvOweyDTIJZmas=;
 b=Yu/oJVtWKrqV6rqzPN9bt3luBufZ2oDC3OERGl0GNEiR0Ec/IrLQ/RY8dEN4N7Txsr
 JN7wwXOKpZucUAlDQxFNxdTevpFefm/oE3lkc2HLb/8rQkgrIbgBVaEKfbiF1Ma28UoU
 9/aqem6igw2tSOnup1QKzToC/hxXzIXNIXXyG0jFh0d1sTKNkziMRqokOFmkEYRw7rkk
 ySgqA4aCmp1UYa3iC2a9j499kcfAU20V/8uLhAfp2NHkanHPZuXI1V74hVT7T9be5sc/
 nHZuxco4xVpsrXtL1UQV6gEP5snEQMcngc/mSbi3gxklON07IBhzkRFAZrXV9iE7iC05
 sJTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=kRVYi/cd4sJBmkOfsvOkC48A2821IfvOweyDTIJZmas=;
 b=lgg965unHfm76NnXS9LzfuIv7KHMx5zOZHO0vALTkD49nXUcw4Ti0Cem/IEGF0uzQr
 VKsVFasd3OexO1CnDxzvbiFF6OfOoECOklDQxJ+4gERpyFwed1Rc2U5m5vIIyWvCUWuX
 s4jcOzIscuAzh5Mi8HCkv5APwxZMeybKejcQ6w0Nw3nfmXMKlomQD9eqjXY4lpcA+rF4
 E+XIqhpsba6uCRntjETLno5gnfCVtgMznidl12vKVE8hblHGG2MXc+OWhuscAZTrlCl3
 EuXtVfFUqyGjIpBiyHpF0ughyo1kxMSIdDE/JMhy6gFM4VGS5DetYNdp5OumpOBVDHEi
 DohA==
X-Gm-Message-State: APjAAAWSI++/G7k0mrrMbScAqfh1tdCbvnKggrMXnwK929wpiOQ4hETs
 lS0bHF4xKh9NC5qs1EP6nPmjAw==
X-Received: by 2002:a81:2b09:: with SMTP id r9mr2411212ywr.346.1570801715120; 
 Fri, 11 Oct 2019 06:48:35 -0700 (PDT)
Received: from cloudburst.gateway.pace.com (67.216.151.25.pool.hargray.net.
 [67.216.151.25])
 by smtp.gmail.com with ESMTPSA id f68sm2534000ywb.96.2019.10.11.06.48.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 06:48:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 02/22] target/arm: Add regime_has_2_ranges
Date: Fri, 11 Oct 2019 09:47:24 -0400
Message-Id: <20191011134744.2477-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011134744.2477-1-richard.henderson@linaro.org>
References: <20191011134744.2477-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c41
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4N8oTQ9WG6SO

A translation with 2 ranges has both positive and negative addresses.
This is true for the EL1&0 and the as-yet unimplemented EL2&0 regimes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h     | 14 ++++++++++++++
 target/arm/helper.c        | 22 +++++-----------------
 target/arm/translate-a64.c |  3 +--
 3 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index dcc5d6cca3..9486680b87 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -804,6 +804,20 @@ static inline void arm_call_el_change_hook(ARMCPU *cpu)
     }
 }
 
+/* Return true if this address translation regime has two ranges.  */
+static inline bool regime_has_2_ranges(ARMMMUIdx mmu_idx)
+{
+    switch (mmu_idx) {
+    case ARMMMUIdx_S12NSE0:
+    case ARMMMUIdx_S12NSE1:
+    case ARMMMUIdx_S1NSE0:
+    case ARMMMUIdx_S1NSE1:
+        return true;
+    default:
+        return false;
+    }
+}
+
 /* Return true if this address translation regime is secure */
 static inline bool regime_is_secure(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
diff --git a/target/arm/helper.c b/target/arm/helper.c
index b690eda136..f9dee51ede 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8774,15 +8774,8 @@ static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
     }
 
     if (is_aa64) {
-        switch (regime_el(env, mmu_idx)) {
-        case 1:
-            if (!is_user) {
-                xn = pxn || (user_rw & PAGE_WRITE);
-            }
-            break;
-        case 2:
-        case 3:
-            break;
+        if (regime_has_2_ranges(mmu_idx) && !is_user) {
+            xn = pxn || (user_rw & PAGE_WRITE);
         }
     } else if (arm_feature(env, ARM_FEATURE_V7)) {
         switch (regime_el(env, mmu_idx)) {
@@ -9316,7 +9309,6 @@ ARMVAParameters aa64_va_parameters_both(CPUARMState *env, uint64_t va,
                                         ARMMMUIdx mmu_idx)
 {
     uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
-    uint32_t el = regime_el(env, mmu_idx);
     bool tbi, tbid, epd, hpd, tcma, using16k, using64k;
     int select, tsz;
 
@@ -9326,7 +9318,7 @@ ARMVAParameters aa64_va_parameters_both(CPUARMState *env, uint64_t va,
      */
     select = extract64(va, 55, 1);
 
-    if (el > 1) {
+    if (!regime_has_2_ranges(mmu_idx)) {
         tsz = extract32(tcr, 0, 6);
         using64k = extract32(tcr, 14, 1);
         using16k = extract32(tcr, 15, 1);
@@ -9486,10 +9478,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
         param = aa64_va_parameters(env, address, mmu_idx,
                                    access_type != MMU_INST_FETCH);
         level = 0;
-        /* If we are in 64-bit EL2 or EL3 then there is no TTBR1, so mark it
-         * invalid.
-         */
-        ttbr1_valid = (el < 2);
+        ttbr1_valid = regime_has_2_ranges(mmu_idx);
         addrsize = 64 - 8 * param.tbi;
         inputsize = 64 - param.tsz;
     } else {
@@ -11095,8 +11084,7 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
             ARMVAParameters p0 = aa64_va_parameters_both(env, 0, stage1);
             int tbii;
 
-            /* FIXME: ARMv8.1-VHE S2 translation regime.  */
-            if (regime_el(env, stage1) < 2) {
+            if (regime_has_2_ranges(mmu_idx)) {
                 ARMVAParameters p1 = aa64_va_parameters_both(env, -1, stage1);
                 tbid = (p1.tbi << 1) | p0.tbi;
                 tbii = tbid & ~((p1.tbid << 1) | p0.tbid);
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 51f3af9cd9..c85db69db4 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -175,8 +175,7 @@ static void gen_top_byte_ignore(DisasContext *s, TCGv_i64 dst,
     if (tbi == 0) {
         /* Load unmodified address */
         tcg_gen_mov_i64(dst, src);
-    } else if (s->current_el >= 2) {
-        /* FIXME: ARMv8.1-VHE S2 translation regime.  */
+    } else if (!regime_has_2_ranges(s->mmu_idx)) {
         /* Force tag byte to all zero */
         tcg_gen_extract_i64(dst, src, 0, 56);
     } else {
-- 
2.17.1

