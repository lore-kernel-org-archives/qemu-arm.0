Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A8AC44515
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Jul 2026 23:25:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wkrtl-0001So-H9; Fri, 17 Jul 2026 19:23:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wkrti-0001RN-T1
 for qemu-arm@nongnu.org; Fri, 17 Jul 2026 19:23:14 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wkrtg-0006x9-80
 for qemu-arm@nongnu.org; Fri, 17 Jul 2026 19:23:14 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-38e4beb7cc0so1092325a91.3
 for <qemu-arm@nongnu.org>; Fri, 17 Jul 2026 16:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784330591; x=1784935391; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=vt3DiaqW5qG2P2oPwNInNzI8OWYzGcBaBG9ClXHUZ0A=;
 b=xD9q541/6ZQljVILJODX8YwKqDL72ro0GByGEzQmF17jWMi+v6RHfnn7D4FgrryUNM
 gqIXhaKmgRK0PFJ+g+1TG98I+BpFc5MeYxzQLq0+mdCyJedQbh6/YrtISflEKaeW+356
 6lAyX7d9MgDrVbnqDLp26paiMKsLRLIjAu4ABACbAa+10sRgCPezcDYhdVONkiregUcl
 P3OVhyA9EFoqyqGZYT738jdPcXoj4E/ZzgNzg8L0uwt7mpKq4ZIbJRCnUcS6DIgp8IVe
 FSZpAmuJ/vv+DqWUJroCG4DYuJrefsPiK5EzwMVCg8LjK82W4qWwRJVxzwhBvSP4CHEd
 PmSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784330591; x=1784935391;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=vt3DiaqW5qG2P2oPwNInNzI8OWYzGcBaBG9ClXHUZ0A=;
 b=JuicMlqxdYFqd2bjPxldToXpJUu/L/iuo0MHP8OFzoK4ihlNKTXaOuui0DpJyS/9ns
 NFOGVrUipm8aZrce9Mr+xKSBAa37iEMthlnrSNWVgeZIys2uH/f66Ebo9l8YNQIuFyqY
 52eF8uoV5tJ42otp6PJ0H0x9tWqkboiw2ZSTLVq//EaKZOLZRtP6B2dgk8LRJq40Pvnn
 r5r6lQfqmqPqqa3sd08XWGBckGISwhKo2V5xF8zp0fG7+TPeJVN1dWKRW9bAnVpfTHii
 VI+8pPezRh+n401lOzNl6JPflmNfJ7ziJAmtd4pvXS2peC7WVwLPaS1ulCjQD3UStq5e
 qVWA==
X-Gm-Message-State: AOJu0YwLkSHxcJb3U2cbxtbILlfbGmGfqs6CdzyOyH566nODPjhlGbHI
 f4FsEUNKGIUAVIqZ5I1acSveg/Zit0Pf9ScKMC9P0EHU6+uZRVKf6ZgIhWUIJF/BO64u17MCj/3
 +y6qc
X-Gm-Gg: AfdE7cnm1NqCuCLy1cnIX86vtw92Om2dQ+a0UUUx3K3+VPVMZ15HTdA+JUxQJMJyPjL
 RH22c9K14sKDemiV79LBpK6YwDCTV0qyNhv4zlEc8/FS+F6yqFKugxeRfIqghxQrde1umgZvnPp
 XG2P24pS+p+2MRedDclZlEV+b+HxhTjKpAjMSvuyVakcf6Rl616/Kr02CntAyT0YSzehP2z3x9g
 cHCni3xtrOX0B6xOz/2HDo3HasatnFdxvarxrtExtaTRsH6hi1dKgmOru0XIuWW1QQ/V6Gh1Czb
 gHATWgY8HClAScoG+x5DBeYCbMjRiwb2GkyaF92rKvcQtGYgxPPKD9M9Z+yzD6BmYRhIGl2iqHr
 7ZPl6qyflPqUvNTTX9wwSn4ecbgdKnD4vOiuHURk0L2wrIBPB8Or64MInIBywUxWaK6ZOju8nj3
 s6x/CoPYI=
X-Received: by 2002:a17:90b:1804:b0:38d:ecfe:41ac with SMTP id
 98e67ed59e1d1-38e4b2948admr4575340a91.0.1784330590589; 
 Fri, 17 Jul 2026 16:23:10 -0700 (PDT)
Received: from stoup.. ([32.140.233.50]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-13ce2a18a47sm8186261c88.8.2026.07.17.16.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2026 16:23:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH for-11.1] target/arm: Fix testing of raw mtx value
Date: Fri, 17 Jul 2026 16:22:49 -0700
Message-ID: <20260717232306.378988-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717232306.378988-1-richard.henderson@linaro.org>
References: <20260717232306.378988-1-richard.henderson@linaro.org>
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

MTX is always a pair of bits, one for each half of the address space.
Testing it like a boolean is incorrect.

Introduce raw_mte_check, a mirror of the similar mte_check function
that applies when MTX is passed in MTEDESC.

Fixes: 8912ceced815 ("target/arm: load on canonical tag loads ext bits")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/mte_helper.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/target/arm/tcg/mte_helper.c b/target/arm/tcg/mte_helper.c
index 04c637a9e2..616c395cb3 100644
--- a/target/arm/tcg/mte_helper.c
+++ b/target/arm/tcg/mte_helper.c
@@ -374,6 +374,12 @@ int load_tag1(uint64_t ptr, uint8_t *mem)
     return extract32(*mem, ofs, 4);
 }
 
+/* Like mtx_check, but simple mtx bit pair instead of MTEDESC. */
+static bool raw_mtx_check(unsigned mtx, unsigned bit55)
+{
+    return (mtx >> bit55) & 1;
+}
+
 uint64_t HELPER(ldg)(CPUARMState *env, uint64_t ptr, uint64_t xt, uint32_t mtx)
 {
     int mmu_idx = arm_env_mmu_index(env);
@@ -387,9 +393,11 @@ uint64_t HELPER(ldg)(CPUARMState *env, uint64_t ptr, uint64_t xt, uint32_t mtx)
     /* Load if page supports tags. */
     if (mem) {
         rtag = load_tag1(ptr, mem);
-    } else if (mtx) {
-        uint64_t bit55 = extract64(ptr, 55, 1);
-        rtag = 0xF * bit55;
+    } else {
+        bool bit55 = extract64(ptr, 55, 1);
+        if (raw_mtx_check(mtx, bit55)) {
+            rtag = 0xF * bit55;
+        }
     }
 
     return address_with_allocation_tag(xt, rtag);
@@ -444,7 +452,7 @@ static inline void do_stg(CPUARMState *env, uint64_t ptr, uint64_t xt,
     /* Store if page supports tags. */
     if (mem) {
         store1(ptr, mem, allocation_tag_from_addr(xt));
-    } else if (mtx) {
+    } else if (raw_mtx_check(mtx, extract64(ptr, 55, 1))) {
         canonical_tag_write_fail(env, ptr, ra);
     }
 }
@@ -477,6 +485,7 @@ static inline void do_st2g(CPUARMState *env, uint64_t ptr, uint64_t xt,
     uint8_t *mem1, *mem2;
 
     check_tag_aligned(env, ptr, ra);
+    mtx = raw_mtx_check(mtx, extract64(ptr, 55, 1));
 
     /*
      * Trap if accessing an invalid page(s).
@@ -561,8 +570,8 @@ uint64_t HELPER(ldgm)(CPUARMState *env, uint64_t ptr, uint32_t mtx)
     /* The tag is squashed to zero if the page does not support tags.  */
     if (!tag_mem) {
         /* Load canonical value if mtx is set (untagged memory region) */
-        if (mtx) {
-            bool bit55 = extract64(ptr, 55, 1);
+        bool bit55 = extract64(ptr, 55, 1);
+        if (raw_mtx_check(mtx, bit55)) {
             ret = extract64(-bit55, 0, 1 << gm_bs);
             shift = extract64(ptr, LOG2_TAG_GRANULE, 4) * 4;
             return ret << shift;
@@ -630,7 +639,7 @@ void HELPER(stgm)(CPUARMState *env, uint64_t ptr, uint64_t val, uint32_t mtx)
      */
     if (!tag_mem) {
         /* Storing tags to canonically tagged region: fault. */
-        if (mtx) {
+        if (raw_mtx_check(mtx, extract64(ptr, 55, 1))) {
             canonical_tag_write_fail(env, ptr, ra);
         }
         return;
@@ -687,7 +696,7 @@ void HELPER(stzgm_tags)(CPUARMState *env, uint64_t ptr, uint64_t val,
     if (mem) {
         int tag_pair = (val & 0xf) * 0x11;
         memset(mem, tag_pair, tag_bytes);
-    } else if (mtx) {
+    } else if (raw_mtx_check(mtx, extract64(ptr, 55, 1))) {
         canonical_tag_write_fail(env, ptr, ra);
     }
 }
-- 
2.43.0


