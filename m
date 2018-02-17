Received: by 10.28.71.27 with SMTP id u27csp2100641wma;
        Sat, 17 Feb 2018 11:07:39 -0800 (PST)
X-Google-Smtp-Source: AH8x226wEC+0tnjH4mBtyLDoJVbuBYN6tsy9BVxXxTtij2pbMgUchnliPFIGsq64bxe7q/k00uEA
X-Received: by 10.37.131.196 with SMTP id v4mr7296328ybm.490.1518894459122;
        Sat, 17 Feb 2018 11:07:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518894459; cv=none;
        d=google.com; s=arc-20160816;
        b=u5sytfXZhGZp2twGziaa6fmRfiD3R0klkGql0pJ/jN7/EStCTLZypjT21ZYyIwaDnq
         v1sRLwlMMgcMkluU5Eff+qxUsL7QKpAPffNCPAkGoNoqRMnSTZ9JFGY0JWy50t45abJH
         npDYutoTOtSWj28vo0H1BKEJTdu6CJxBY0uoEFz/dcqsE9GEVJZHXDDTL1tIdnfmehHw
         9l/Y88VOMpshStn5qPNM2Vm+zC4p8TlmZgacgv7A2NHeTAiQWId+4R1qbIhU65YCJzLS
         FFziPJKsaLOEZXdsk0w+4RbttwBQq2MafIbjb5qAY87o2/eG53FKyfQdFLXB/8a7aA+i
         47iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=bCA93J2gh2zptPDp0XGn339+9IiVcOPVbDJIhtHGNOw=;
        b=Ac6V+F8kMBm2pt6ZaXrPtRJGIXYkZh6mU+6o3FEwXrrMaI9JwRNdixUgBDGt7KOStz
         +k6vIp42QEb9J8WovjiN3UqWBBfCt4jVt1B9Z/ghRGevBM13gUqkuNXD928sw+pnFCSc
         Wa/La4KL/yXl5JeQ+5mT9ulhFJEO6wf4faHqdw0mQWMrB5EluxyNyT3gr0J55OZ/6DQs
         dvnMssVrJ27Oc9cLjMQz4IY0uCoM0bFcLGAe505uBznAFlfhHDufGsPU3KGSJMFAu2YO
         W9ke28lIedfelItzz1YT+4KXKU1pr4lqC/FV2eouFnyG63q1qd/m2Oz0pRHgrn+c3n4W
         /qeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BfuUYEHP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t1si2844058ybb.60.2018.02.17.11.07.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 11:07:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BfuUYEHP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48438 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en7pi-0003vY-Dz
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 14:07:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40421)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en79z-00019s-Ok
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en79w-0001xB-8G
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:30 -0500
Received: from mail-pl0-x244.google.com ([2607:f8b0:400e:c01::244]:32844)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1en79w-0001wk-07
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:28 -0500
Received: by mail-pl0-x244.google.com with SMTP id t4so3447517plo.0
	for <qemu-arm@nongnu.org>; Sat, 17 Feb 2018 10:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=bCA93J2gh2zptPDp0XGn339+9IiVcOPVbDJIhtHGNOw=;
	b=BfuUYEHPCP0T2TiyD3RHVHf32mbxNfu2qVDqbWjr6RYaPlOGa5rwnv6iHv5ZV0T699
	Af0YQ7eka2KR/NUdU0EYrePj+aVvOef+/378xEW6pl+mRDRD8AjHIit5HV6JLdgVSYeC
	rK2y8nA82dAt77fe+WppKL62SQsAaeQDRXHG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=bCA93J2gh2zptPDp0XGn339+9IiVcOPVbDJIhtHGNOw=;
	b=WFreqfHlcGpQh/HDh36FHUOZSdABiiZ9Hs5SZEIyJMcITNKjNaiIgpDEwaJyr6y6vK
	mgXTRKzagGBuVyu3SRKUGWZJRTeT/g71Hz8D4KW8JxPGXu4vJ5kQ0BchH7loeHJT5YpG
	gTOazi8A22X4KyhcY8tFqPhMapinmvNDa57jh14YsYXM5oG1qpTei5zwrKCMyLHJu0ie
	hdCE5dgViRV2ixCb+JnlLCOKU7eVVXGBJWb7uyrnECjgXAtcxVGOf/0caCDOlfYfD99W
	uchMfGy2Iy+f7pAWPlN3oOZl40aBJ24n73hMzGCJ/2M+AnhhJ/S7v3epmw2ARYqxmduU
	gQSA==
X-Gm-Message-State: APf1xPCGWq4XsuWOpmOlsHca1elE/B419zlKFxzkirYSKltLK5S/wqqG
	L/AXUoyuDTd9mG0zX4RAGPbDRA==
X-Received: by 2002:a17:902:6ac2:: with SMTP id
	i2-v6mr1484066plt.368.1518891867027; 
	Sat, 17 Feb 2018 10:24:27 -0800 (PST)
Received: from cloudburst.twiddle.net ([50.0.192.64])
	by smtp.gmail.com with ESMTPSA id
	h15sm13466712pfi.56.2018.02.17.10.24.25
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 10:24:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 10:22:54 -0800
Message-Id: <20180217182323.25885-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217182323.25885-1-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::244
Subject: [Qemu-arm] [PATCH v2 38/67] target/arm: Implement SVE Partition
 Break Group
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /djYK4kemzH9

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  18 ++++
 target/arm/sve_helper.c    | 247 +++++++++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c |  96 ++++++++++++++++++
 target/arm/sve.decode      |  19 ++++
 4 files changed, 380 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index ae38c0a4be..f0a3ed3414 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -658,3 +658,21 @@ DEF_HELPER_FLAGS_5(sve_orn_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_nor_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_nand_pppp, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve_brkpa, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_brkpb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_brkpas, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_brkpbs, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve_brka_z, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_brkb_z, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_brka_m, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_brkb_m, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve_brkas_z, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_brkbs_z, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_brkas_m, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_brkbs_m, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve_brkn, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_brkns, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index b74db681f2..d6d2220f8b 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2455,3 +2455,250 @@ DO_CMP_PPZI_D(sve_cmpls_ppzi_d, uint64_t, <=)
 #undef DO_CMP_PPZI_S
 #undef DO_CMP_PPZI_D
 #undef DO_CMP_PPZI
+
+/* Similar to the ARM LastActive pseudocode function.  */
+static bool last_active_pred(void *vd, void *vg, intptr_t oprsz)
+{
+    intptr_t i;
+
+    for (i = QEMU_ALIGN_UP(oprsz, 8) - 8; i >= 0; i -= 8) {
+        uint64_t pg = *(uint64_t *)(vg + i);
+        if (pg) {
+            return (pow2floor(pg) & *(uint64_t *)(vd + i)) != 0;
+        }
+    }
+    return 0;
+}
+
+/* Compute a mask into RETB that is true for all G, up to and including
+ * (if after) or excluding (if !after) the first G & N.
+ * Return true if BRK found.
+ */
+static bool compute_brk(uint64_t *retb, uint64_t n, uint64_t g,
+                        bool brk, bool after)
+{
+    uint64_t b;
+
+    if (brk) {
+        b = 0;
+    } else if ((g & n) == 0) {
+        /* For all G, no N are set; break not found.  */
+        b = g;
+    } else {
+        /* Break somewhere in N.  Locate it.  */
+        b = g & n;            /* guard true, pred true*/
+        b = b & -b;           /* first such */
+        if (after) {
+            b = b | (b - 1);  /* break after same */
+        } else {
+            b = b - 1;        /* break before same */
+        }
+        brk = true;
+    }
+
+    *retb = b;
+    return brk;
+}
+
+/* Compute a zeroing BRK.  */
+static void compute_brk_z(uint64_t *d, uint64_t *n, uint64_t *g,
+                          intptr_t oprsz, bool after)
+{
+    bool brk = false;
+    intptr_t i;
+
+    for (i = 0; i < DIV_ROUND_UP(oprsz, 8); ++i) {
+        uint64_t this_b, this_g = g[i];
+
+        brk = compute_brk(&this_b, n[i], this_g, brk, after);
+        d[i] = this_b & this_g;
+    }
+}
+
+/* Likewise, but also compute flags.  */
+static uint32_t compute_brks_z(uint64_t *d, uint64_t *n, uint64_t *g,
+                               intptr_t oprsz, bool after)
+{
+    uint32_t flags = PREDTEST_INIT;
+    bool brk = false;
+    intptr_t i;
+
+    for (i = 0; i < DIV_ROUND_UP(oprsz, 8); ++i) {
+        uint64_t this_b, this_d, this_g = g[i];
+
+        brk = compute_brk(&this_b, n[i], this_g, brk, after);
+        d[i] = this_d = this_b & this_g;
+        flags = iter_predtest_fwd(this_d, this_g, flags);
+    }
+    return flags;
+}
+
+/* Given a computation function, compute a merging BRK.  */
+static void compute_brk_m(uint64_t *d, uint64_t *n, uint64_t *g,
+                          intptr_t oprsz, bool after)
+{
+    bool brk = false;
+    intptr_t i;
+
+    for (i = 0; i < DIV_ROUND_UP(oprsz, 8); ++i) {
+        uint64_t this_b, this_g = g[i];
+
+        brk = compute_brk(&this_b, n[i], this_g, brk, after);
+        d[i] = (this_b & this_g) | (d[i] & ~this_g);
+    }
+}
+
+/* Likewise, but also compute flags.  */
+static uint32_t compute_brks_m(uint64_t *d, uint64_t *n, uint64_t *g,
+                               intptr_t oprsz, bool after)
+{
+    uint32_t flags = PREDTEST_INIT;
+    bool brk = false;
+    intptr_t i;
+
+    for (i = 0; i < oprsz / 8; ++i) {
+        uint64_t this_b, this_d = d[i], this_g = g[i];
+
+        brk = compute_brk(&this_b, n[i], this_g, brk, after);
+        d[i] = this_d = (this_b & this_g) | (this_d & ~this_g);
+        flags = iter_predtest_fwd(this_d, this_g, flags);
+    }
+    return flags;
+}
+
+static uint32_t do_zero(ARMPredicateReg *d, intptr_t oprsz)
+{
+    /* It is quicker to zero the whole predicate than loop on OPRSZ.
+       The compiler should turn this into 4 64-bit integer stores.  */
+    memset(d, 0, sizeof(ARMPredicateReg));
+    return PREDTEST_INIT;
+}
+
+void HELPER(sve_brkpa)(void *vd, void *vn, void *vm, void *vg,
+                       uint32_t pred_desc)
+{
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    if (last_active_pred(vn, vg, oprsz)) {
+        compute_brk_z(vd, vm, vg, oprsz, true);
+    } else {
+        do_zero(vd, oprsz);
+    }
+}
+
+uint32_t HELPER(sve_brkpas)(void *vd, void *vn, void *vm, void *vg,
+                            uint32_t pred_desc)
+{
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    if (last_active_pred(vn, vg, oprsz)) {
+        return compute_brks_z(vd, vm, vg, oprsz, true);
+    } else {
+        return do_zero(vd, oprsz);
+    }
+}
+
+void HELPER(sve_brkpb)(void *vd, void *vn, void *vm, void *vg,
+                       uint32_t pred_desc)
+{
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    if (last_active_pred(vn, vg, oprsz)) {
+        compute_brk_z(vd, vm, vg, oprsz, false);
+    } else {
+        do_zero(vd, oprsz);
+    }
+}
+
+uint32_t HELPER(sve_brkpbs)(void *vd, void *vn, void *vm, void *vg,
+                            uint32_t pred_desc)
+{
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    if (last_active_pred(vn, vg, oprsz)) {
+        return compute_brks_z(vd, vm, vg, oprsz, false);
+    } else {
+        return do_zero(vd, oprsz);
+    }
+}
+
+void HELPER(sve_brka_z)(void *vd, void *vn, void *vg, uint32_t pred_desc)
+{
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    compute_brk_z(vd, vn, vg, oprsz, true);
+}
+
+uint32_t HELPER(sve_brkas_z)(void *vd, void *vn, void *vg, uint32_t pred_desc)
+{
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    return compute_brks_z(vd, vn, vg, oprsz, true);
+}
+
+void HELPER(sve_brkb_z)(void *vd, void *vn, void *vg, uint32_t pred_desc)
+{
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    compute_brk_z(vd, vn, vg, oprsz, false);
+}
+
+uint32_t HELPER(sve_brkbs_z)(void *vd, void *vn, void *vg, uint32_t pred_desc)
+{
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    return compute_brks_z(vd, vn, vg, oprsz, false);
+}
+
+void HELPER(sve_brka_m)(void *vd, void *vn, void *vg, uint32_t pred_desc)
+{
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    compute_brk_m(vd, vn, vg, oprsz, true);
+}
+
+uint32_t HELPER(sve_brkas_m)(void *vd, void *vn, void *vg, uint32_t pred_desc)
+{
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    return compute_brks_m(vd, vn, vg, oprsz, true);
+}
+
+void HELPER(sve_brkb_m)(void *vd, void *vn, void *vg, uint32_t pred_desc)
+{
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    compute_brk_m(vd, vn, vg, oprsz, false);
+}
+
+uint32_t HELPER(sve_brkbs_m)(void *vd, void *vn, void *vg, uint32_t pred_desc)
+{
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    return compute_brks_m(vd, vn, vg, oprsz, false);
+}
+
+void HELPER(sve_brkn)(void *vd, void *vn, void *vg, uint32_t pred_desc)
+{
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+
+    if (!last_active_pred(vn, vg, oprsz)) {
+        do_zero(vd, oprsz);
+    }
+}
+
+/* As if PredTest(Ones(PL), D, esz).  */
+static uint32_t predtest_ones(ARMPredicateReg *d, intptr_t oprsz,
+                              uint64_t esz_mask)
+{
+    uint32_t flags = PREDTEST_INIT;
+    intptr_t i;
+
+    for (i = 0; i < oprsz / 8; i++) {
+        flags = iter_predtest_fwd(d->p[i], esz_mask, flags);
+    }
+    if (oprsz & 7) {
+        uint64_t mask = ~(-1ULL << (8 * (oprsz & 7)));
+        flags = iter_predtest_fwd(d->p[i], esz_mask & mask, flags);
+    }
+    return flags;
+}
+
+uint32_t HELPER(sve_brkns)(void *vd, void *vn, void *vg, uint32_t pred_desc)
+{
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+
+    if (last_active_pred(vn, vg, oprsz)) {
+        return predtest_ones(vd, oprsz, -1);
+    } else {
+        return do_zero(vd, oprsz);
+    }
+}
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index a7eeb122e3..dc95d68867 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2635,6 +2635,102 @@ DO_PPZI(CMPLS, cmpls)
 
 #undef DO_PPZI
 
+/*
+ *** SVE Partition Break Group
+ */
+
+static void do_brk3(DisasContext *s, arg_rprr_s *a,
+                    gen_helper_gvec_4 *fn, gen_helper_gvec_flags_4 *fn_s)
+{
+    unsigned vsz = pred_full_reg_size(s);
+
+    /* Predicate sizes may be smaller and cannot use simd_desc.  */
+    TCGv_ptr d = tcg_temp_new_ptr();
+    TCGv_ptr n = tcg_temp_new_ptr();
+    TCGv_ptr m = tcg_temp_new_ptr();
+    TCGv_ptr g = tcg_temp_new_ptr();
+    TCGv_i32 t = tcg_const_i32(vsz - 2);
+
+    tcg_gen_addi_ptr(d, cpu_env, pred_full_reg_offset(s, a->rd));
+    tcg_gen_addi_ptr(n, cpu_env, pred_full_reg_offset(s, a->rn));
+    tcg_gen_addi_ptr(m, cpu_env, pred_full_reg_offset(s, a->rm));
+    tcg_gen_addi_ptr(g, cpu_env, pred_full_reg_offset(s, a->pg));
+
+    if (a->s) {
+        fn_s(t, d, n, m, g, t);
+        do_pred_flags(t);
+    } else {
+        fn(d, n, m, g, t);
+    }
+    tcg_temp_free_ptr(d);
+    tcg_temp_free_ptr(n);
+    tcg_temp_free_ptr(m);
+    tcg_temp_free_ptr(g);
+    tcg_temp_free_i32(t);
+}
+
+static void do_brk2(DisasContext *s, arg_rpr_s *a,
+                    gen_helper_gvec_3 *fn, gen_helper_gvec_flags_3 *fn_s)
+{
+    unsigned vsz = pred_full_reg_size(s);
+
+    /* Predicate sizes may be smaller and cannot use simd_desc.  */
+    TCGv_ptr d = tcg_temp_new_ptr();
+    TCGv_ptr n = tcg_temp_new_ptr();
+    TCGv_ptr g = tcg_temp_new_ptr();
+    TCGv_i32 t = tcg_const_i32(vsz - 2);
+
+    tcg_gen_addi_ptr(d, cpu_env, pred_full_reg_offset(s, a->rd));
+    tcg_gen_addi_ptr(n, cpu_env, pred_full_reg_offset(s, a->rn));
+    tcg_gen_addi_ptr(g, cpu_env, pred_full_reg_offset(s, a->pg));
+
+    if (a->s) {
+        fn_s(t, d, n, g, t);
+        do_pred_flags(t);
+    } else {
+        fn(d, n, g, t);
+    }
+    tcg_temp_free_ptr(d);
+    tcg_temp_free_ptr(n);
+    tcg_temp_free_ptr(g);
+    tcg_temp_free_i32(t);
+}
+
+void trans_BRKPA(DisasContext *s, arg_rprr_s *a, uint32_t insn)
+{
+    do_brk3(s, a, gen_helper_sve_brkpa, gen_helper_sve_brkpas);
+}
+
+void trans_BRKPB(DisasContext *s, arg_rprr_s *a, uint32_t insn)
+{
+    do_brk3(s, a, gen_helper_sve_brkpb, gen_helper_sve_brkpbs);
+}
+
+void trans_BRKA_m(DisasContext *s, arg_rpr_s *a, uint32_t insn)
+{
+    do_brk2(s, a, gen_helper_sve_brka_m, gen_helper_sve_brkas_m);
+}
+
+void trans_BRKB_m(DisasContext *s, arg_rpr_s *a, uint32_t insn)
+{
+    do_brk2(s, a, gen_helper_sve_brkb_m, gen_helper_sve_brkbs_m);
+}
+
+void trans_BRKA_z(DisasContext *s, arg_rpr_s *a, uint32_t insn)
+{
+    do_brk2(s, a, gen_helper_sve_brka_z, gen_helper_sve_brkas_z);
+}
+
+void trans_BRKB_z(DisasContext *s, arg_rpr_s *a, uint32_t insn)
+{
+    do_brk2(s, a, gen_helper_sve_brkb_z, gen_helper_sve_brkbs_z);
+}
+
+void trans_BRKN(DisasContext *s, arg_rpr_s *a, uint32_t insn)
+{
+    do_brk2(s, a, gen_helper_sve_brkn, gen_helper_sve_brkns);
+}
+
 /*
  *** SVE Memory - 32-bit Gather and Unsized Contiguous Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 0e317d7d48..1c19129e55 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -60,6 +60,7 @@
 &rri_esz	rd rn imm esz
 &rrr_esz	rd rn rm esz
 &rpr_esz	rd pg rn esz
+&rpr_s		rd pg rn s
 &rprr_s		rd pg rn rm s
 &rprr_esz	rd pg rn rm esz
 &rprrr_esz	rd pg rn rm ra esz
@@ -79,6 +80,9 @@
 @pd_pn		........ esz:2 .. .... ....... rn:4 . rd:4	&rr_esz
 @rd_rn		........ esz:2 ...... ...... rn:5 rd:5		&rr_esz
 
+# Two operand with governing predicate, flags setting
+@pd_pg_pn_s	........ . s:1 ...... .. pg:4 . rn:4 . rd:4	&rpr_s
+
 # Three operand with unused vector element size
 @rd_rn_rm_e0	........ ... rm:5 ... ... rn:5 rd:5		&rrr_esz esz=0
 
@@ -568,6 +572,21 @@ PFIRST		00100101 01 011 000 11000 00 .... 0 ....	@pd_pn_e0
 # SVE predicate next active
 PNEXT		00100101 .. 011 001 11000 10 .... 0 ....	@pd_pn
 
+### SVE Partition Break Group
+
+# SVE propagate break from previous partition
+BRKPA		00100101 0. 00 .... 11 .... 0 .... 0 ....	@pd_pg_pn_pm_s
+BRKPB		00100101 0. 00 .... 11 .... 0 .... 1 ....	@pd_pg_pn_pm_s
+
+# SVE partition break condition
+BRKA_z		00100101 0. 01000001 .... 0 .... 0 ....		@pd_pg_pn_s
+BRKB_z		00100101 1. 01000001 .... 0 .... 0 ....		@pd_pg_pn_s
+BRKA_m		00100101 0. 01000001 .... 0 .... 1 ....		@pd_pg_pn_s
+BRKB_m		00100101 1. 01000001 .... 0 .... 1 ....		@pd_pg_pn_s
+
+# SVE propagate break to next partition
+BRKN		00100101 0. 01100001 .... 0 .... 0 ....		@pd_pg_pn_s
+
 ### SVE Memory - 32-bit Gather and Unsized Contiguous Group
 
 # SVE load predicate register
-- 
2.14.3

