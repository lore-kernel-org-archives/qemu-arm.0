Received: by 10.28.71.27 with SMTP id u27csp2088967wma;
        Sat, 17 Feb 2018 10:51:13 -0800 (PST)
X-Google-Smtp-Source: AH8x225Zw3HG6l+9uBlHwHz7CiSDi+xhWkJr5n6Rl/f5S4MgWHuqAt0TcN/5wBHpoZyxdVpiorpr
X-Received: by 10.13.200.134 with SMTP id k128mr7337000ywd.390.1518893473685;
        Sat, 17 Feb 2018 10:51:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518893473; cv=none;
        d=google.com; s=arc-20160816;
        b=ZILQh2Fg3XO+tByZpzS4CMNaMqM6ghBFZtTczLOh7dbisnKAt1vjBbqOOBpfbWxYED
         dhqq0iLqgaMH67jKIJ6JhGPSmW7ZnZhqVnb9RdJtmPAzl/jKh9zZ2Ufrk1Xs+2BNFYwB
         uVK+vxQn72btW7n6jQ+9yZncQ305JlzXyTglhwpi3JvGxYeWAGGQMRXD6DUiXqiHgakx
         sn875ZL5VtFC0wfm/riZ+lUWXyveR86HMi/HujVWavWQaEyYpZ8gPGPOET2aLTXtr6PV
         gh0xsSWWq1kmt1BTc0VPoMu+9KlKmPPCNcmSsOG0f4wHZ1KckUeEvwLy2LKy6rz858M8
         uzSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=gs8jk3SnvU+rkac2DB/AmJreOmTjHJdoAqlQrUA8wrI=;
        b=F+TomhmRk64X0ZK/KlBDkurPhEI1B1/Iln7M2yF9Ovl/SzsySB26C2uocF/MwUalJl
         ogB9zlUeGPXsQLsROkO9IePsRd2GWP1GtX6srnih4FQJrGaOzwym1BpGbW4FyxfE18ij
         iNDKDfD2GluCG/sgNikATfLSqDRbtiKyXIB2KrfLwlPa0D7gJqth0U500to1hHgW4p7w
         vIWEn4wGuOoLbqsOUNMavy6hWE7EHdaXB/LNPKlmWjcBm9b99yftWIUBN+BrE0s16Cn7
         a9fD1rhXIBa/KKgatfBqWU17I2i1wDo8zZ6Lk8m+VgD25zk9NOcOcvWJlbigy0hJlvMy
         6YVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LJskhUr+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p17si3502844ybj.636.2018.02.17.10.51.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 10:51:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LJskhUr+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48271 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en7Zp-0005dI-4e
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 13:51:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40199)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en79k-0000sp-6u
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:24:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en79h-0001pf-Gj
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:24:16 -0500
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:32803)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1en79h-0001pG-0e
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:24:13 -0500
Received: by mail-pf0-x241.google.com with SMTP id b8so525376pfh.0
	for <qemu-devel@nongnu.org>; Sat, 17 Feb 2018 10:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gs8jk3SnvU+rkac2DB/AmJreOmTjHJdoAqlQrUA8wrI=;
	b=LJskhUr+Lqcy5YCUHndW+/zRbO1Yr+Xb46iNwLPDW+Qfl9kYsg2QJYohKg8ctgeX4E
	d3QhS4fU4tzMj35JfRn8C97WEdULBgrFvF0dYljq4YizNitO+79qa1PNcv2crCYvTw5M
	A0suKjhxnqfuIFfW1a+Oza5KwkUYCRG/9dxBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=gs8jk3SnvU+rkac2DB/AmJreOmTjHJdoAqlQrUA8wrI=;
	b=TTLpgb8vDZTBf/UC42k+81ChOHq22U2JqF25mNPH3jP8trp4ptCJCnKgIxSvXHWWzF
	RkGMOQlXfngdnku1oWOA/O/u9maoRwF8hDnlNMdpQjucKRtimROi8F+p6UsmyUGo44BG
	p54glat9U+iKdiijKYnDS/DrX7c3CkP3Pyh7ta1h2eBsjIksSL1nZfz8hDu2EgdjBZxZ
	ipsoelRDVuJbGf6lQSKl9rITB5S4WAyxZooKs4crnT5Jh6NdXNPFsnJOgFrAV9aQinUo
	fCNfe9ckWUmAbrf6QI3aNc+HcIsftoCOLfldSz1cgQMoJEZIrYW01hEvgUCjEgVB5FnA
	ChGA==
X-Gm-Message-State: APf1xPDETgwCE37oXnBxEvqxKzVPCBS2UXd7EHIr/3/7P3Bnx6ex+fwL
	OcXpv3SI+p5IJo6uI9RDwLSSdnMGm7g=
X-Received: by 10.99.63.9 with SMTP id m9mr8511033pga.247.1518891851631;
	Sat, 17 Feb 2018 10:24:11 -0800 (PST)
Received: from cloudburst.twiddle.net ([50.0.192.64])
	by smtp.gmail.com with ESMTPSA id
	h15sm13466712pfi.56.2018.02.17.10.24.10
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 10:24:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 10:22:44 -0800
Message-Id: <20180217182323.25885-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217182323.25885-1-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: [Qemu-devel] [PATCH v2 28/67] target/arm: Implement SVE Permute -
 Predicates Group
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RLttXhK5RpZ3

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |   6 +
 target/arm/sve_helper.c    | 280 +++++++++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 110 ++++++++++++++++++
 target/arm/sve.decode      |  18 +++
 4 files changed, 414 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 0c9aad575e..ff958fcebd 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -439,6 +439,12 @@ DEF_HELPER_FLAGS_3(sve_uunpk_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve_uunpk_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve_uunpk_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve_zip_p, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_uzp_p, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_trn_p, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_rev_p, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_punpk_p, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_and_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_bic_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_eor_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 466a209c1e..c3a2706a16 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1664,3 +1664,283 @@ DO_UNPK(sve_uunpk_s, uint32_t, uint16_t, H4, H2)
 DO_UNPK(sve_uunpk_d, uint64_t, uint32_t, , H4)
 
 #undef DO_UNPK
+
+static const uint64_t expand_bit_data[5][2] = {
+    { 0x1111111111111111ull, 0x2222222222222222ull },
+    { 0x0303030303030303ull, 0x0c0c0c0c0c0c0c0cull },
+    { 0x000f000f000f000full, 0x00f000f000f000f0ull },
+    { 0x000000ff000000ffull, 0x0000ff000000ff00ull },
+    { 0x000000000000ffffull, 0x00000000ffff0000ull }
+};
+
+/* Expand units of 2**N bits to units of 2**(N+1) bits,
+   with the higher bits zero.  */
+static uint64_t expand_bits(uint64_t x, int n)
+{
+    int i, sh;
+    for (i = 4, sh = 16; i >= n; i--, sh >>= 1) {
+        x = ((x & expand_bit_data[i][1]) << sh) | (x & expand_bit_data[i][0]);
+    }
+    return x;
+}
+
+/* Compress units of 2**(N+1) bits to units of 2**N bits.  */
+static uint64_t compress_bits(uint64_t x, int n)
+{
+    int i, sh;
+    for (i = n, sh = 1 << n; i <= 4; i++, sh <<= 1) {
+        x = ((x >> sh) & expand_bit_data[i][1]) | (x & expand_bit_data[i][0]);
+    }
+    return x;
+}
+
+void HELPER(sve_zip_p)(void *vd, void *vn, void *vm, uint32_t pred_desc)
+{
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    int esz = extract32(pred_desc, SIMD_DATA_SHIFT, 2);
+    intptr_t high = extract32(pred_desc, SIMD_DATA_SHIFT + 2, 1);
+    uint64_t *d = vd;
+    intptr_t i;
+
+    if (oprsz <= 8) {
+        uint64_t nn = *(uint64_t *)vn;
+        uint64_t mm = *(uint64_t *)vm;
+        int half = 4 * oprsz;
+
+        nn = extract64(nn, high * half, half);
+        mm = extract64(mm, high * half, half);
+        nn = expand_bits(nn, esz);
+        mm = expand_bits(mm, esz);
+        d[0] = nn + (mm << (1 << esz));
+    } else {
+        ARMPredicateReg tmp_n, tmp_m;
+
+        /* We produce output faster than we consume input.
+           Therefore we must be mindful of possible overlap.  */
+        if ((vn - vd) < (uintptr_t)oprsz) {
+            vn = memcpy(&tmp_n, vn, oprsz);
+        }
+        if ((vm - vd) < (uintptr_t)oprsz) {
+            vm = memcpy(&tmp_m, vm, oprsz);
+        }
+        if (high) {
+            high = oprsz >> 1;
+        }
+
+        if ((high & 3) == 0) {
+            uint32_t *n = vn, *m = vm;
+            high >>= 2;
+
+            for (i = 0; i < DIV_ROUND_UP(oprsz, 8); i++) {
+                uint64_t nn = n[H4(high + i)];
+                uint64_t mm = m[H4(high + i)];
+
+                nn = expand_bits(nn, esz);
+                mm = expand_bits(mm, esz);
+                d[i] = nn + (mm << (1 << esz));
+            }
+        } else {
+            uint8_t *n = vn, *m = vm;
+            uint16_t *d16 = vd;
+
+            for (i = 0; i < oprsz / 2; i++) {
+                uint16_t nn = n[H1(high + i)];
+                uint16_t mm = m[H1(high + i)];
+
+                nn = expand_bits(nn, esz);
+                mm = expand_bits(mm, esz);
+                d16[H2(i)] = nn + (mm << (1 << esz));
+            }
+        }
+    }
+}
+
+void HELPER(sve_uzp_p)(void *vd, void *vn, void *vm, uint32_t pred_desc)
+{
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    int esz = extract32(pred_desc, SIMD_DATA_SHIFT, 2);
+    int odd = extract32(pred_desc, SIMD_DATA_SHIFT + 2, 1) << esz;
+    uint64_t *d = vd, *n = vn, *m = vm;
+    uint64_t l, h;
+    intptr_t i;
+
+    if (oprsz <= 8) {
+        l = compress_bits(n[0] >> odd, esz);
+        h = compress_bits(m[0] >> odd, esz);
+        d[0] = extract64(l + (h << (4 * oprsz)), 0, 8 * oprsz);
+    } else {
+        ARMPredicateReg tmp_m;
+        intptr_t oprsz_16 = oprsz / 16;
+
+        if ((vm - vd) < (uintptr_t)oprsz) {
+            m = memcpy(&tmp_m, vm, oprsz);
+        }
+
+        for (i = 0; i < oprsz_16; i++) {
+            l = n[2 * i + 0];
+            h = n[2 * i + 1];
+            l = compress_bits(l >> odd, esz);
+            h = compress_bits(h >> odd, esz);
+            d[i] = l + (h << 32);
+        }
+
+        /* For VL which is not a power of 2, the results from M do not
+           align nicely with the uint64_t for D.  Put the aligned results
+           from M into TMP_M and then copy it into place afterward.  */
+        if (oprsz & 15) {
+            d[i] = compress_bits(n[2 * i] >> odd, esz);
+
+            for (i = 0; i < oprsz_16; i++) {
+                l = m[2 * i + 0];
+                h = m[2 * i + 1];
+                l = compress_bits(l >> odd, esz);
+                h = compress_bits(h >> odd, esz);
+                tmp_m.p[i] = l + (h << 32);
+            }
+            tmp_m.p[i] = compress_bits(m[2 * i] >> odd, esz);
+
+            swap_memmove(vd + oprsz / 2, &tmp_m, oprsz / 2);
+        } else {
+            for (i = 0; i < oprsz_16; i++) {
+                l = m[2 * i + 0];
+                h = m[2 * i + 1];
+                l = compress_bits(l >> odd, esz);
+                h = compress_bits(h >> odd, esz);
+                d[oprsz_16 + i] = l + (h << 32);
+            }
+        }
+    }
+}
+
+static const uint64_t even_bit_esz_masks[4] = {
+    0x5555555555555555ull,
+    0x3333333333333333ull,
+    0x0f0f0f0f0f0f0f0full,
+    0x00ff00ff00ff00ffull
+};
+
+void HELPER(sve_trn_p)(void *vd, void *vn, void *vm, uint32_t pred_desc)
+{
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    uintptr_t esz = extract32(pred_desc, SIMD_DATA_SHIFT, 2);
+    bool odd = extract32(pred_desc, SIMD_DATA_SHIFT + 2, 1);
+    uint64_t *d = vd, *n = vn, *m = vm;
+    uint64_t mask;
+    int shr, shl;
+    intptr_t i;
+
+    shl = 1 << esz;
+    shr = 0;
+    mask = even_bit_esz_masks[esz];
+    if (odd) {
+        mask <<= shl;
+        shr = shl;
+        shl = 0;
+    }
+
+    for (i = 0; i < DIV_ROUND_UP(oprsz, 8); i++) {
+        uint64_t nn = (n[i] & mask) >> shr;
+        uint64_t mm = (m[i] & mask) << shl;
+        d[i] = nn + mm;
+    }
+}
+
+/* Reverse units of 2**N bits.  */
+static uint64_t reverse_bits_64(uint64_t x, int n)
+{
+    int i, sh;
+
+    x = bswap64(x);
+    for (i = 2, sh = 4; i >= n; i--, sh >>= 1) {
+        uint64_t mask = even_bit_esz_masks[i];
+        x = ((x & mask) << sh) | ((x >> sh) & mask);
+    }
+    return x;
+}
+
+static uint8_t reverse_bits_8(uint8_t x, int n)
+{
+    static const uint8_t mask[3] = { 0x55, 0x33, 0x0f };
+    int i, sh;
+
+    for (i = 2, sh = 4; i >= n; i--, sh >>= 1) {
+        x = ((x & mask[i]) << sh) | ((x >> sh) & mask[i]);
+    }
+    return x;
+}
+
+void HELPER(sve_rev_p)(void *vd, void *vn, uint32_t pred_desc)
+{
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    int esz = extract32(pred_desc, SIMD_DATA_SHIFT, 2);
+    intptr_t i, oprsz_2 = oprsz / 2;
+
+    if (oprsz <= 8) {
+        uint64_t l = *(uint64_t *)vn;
+        l = reverse_bits_64(l << (64 - 8 * oprsz), esz);
+        *(uint64_t *)vd = l;
+    } else if ((oprsz & 15) == 0) {
+        for (i = 0; i < oprsz_2; i += 8) {
+            intptr_t ih = oprsz - 8 - i;
+            uint64_t l = reverse_bits_64(*(uint64_t *)(vn + i), esz);
+            uint64_t h = reverse_bits_64(*(uint64_t *)(vn + ih), esz);
+            *(uint64_t *)(vd + i) = h;
+            *(uint64_t *)(vd + ih) = l;
+        }
+    } else {
+        for (i = 0; i < oprsz_2; i += 1) {
+            intptr_t il = H1(i);
+            intptr_t ih = H1(oprsz - 1 - i);
+            uint8_t l = reverse_bits_8(*(uint8_t *)(vn + il), esz);
+            uint8_t h = reverse_bits_8(*(uint8_t *)(vn + ih), esz);
+            *(uint8_t *)(vd + il) = h;
+            *(uint8_t *)(vd + ih) = l;
+        }
+    }
+}
+
+void HELPER(sve_punpk_p)(void *vd, void *vn, uint32_t pred_desc)
+{
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t high = extract32(pred_desc, SIMD_DATA_SHIFT + 2, 1);
+    uint64_t *d = vd;
+    intptr_t i;
+
+    if (oprsz <= 8) {
+        uint64_t nn = *(uint64_t *)vn;
+        int half = 4 * oprsz;
+
+        nn = extract64(nn, high * half, half);
+        nn = expand_bits(nn, 0);
+        d[0] = nn;
+    } else {
+        ARMPredicateReg tmp_n;
+
+        /* We produce output faster than we consume input.
+           Therefore we must be mindful of possible overlap.  */
+        if ((vn - vd) < (uintptr_t)oprsz) {
+            vn = memcpy(&tmp_n, vn, oprsz);
+        }
+        if (high) {
+            high = oprsz >> 1;
+        }
+
+        if ((high & 3) == 0) {
+            uint32_t *n = vn;
+            high >>= 2;
+
+            for (i = 0; i < DIV_ROUND_UP(oprsz, 8); i++) {
+                uint64_t nn = n[H4(high + i)];
+                d[i] = expand_bits(nn, 0);
+            }
+        } else {
+            uint16_t *d16 = vd;
+            uint8_t *n = vn;
+
+            for (i = 0; i < oprsz / 2; i++) {
+                uint16_t nn = n[H1(high + i)];
+                d16[H2(i)] = expand_bits(nn, 0);
+            }
+        }
+    }
+}
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 3724f6290c..45e1ea87bf 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1932,6 +1932,116 @@ static void trans_UNPK(DisasContext *s, arg_UNPK *a, uint32_t insn)
                        vsz, vsz, 0, fns[a->esz][a->u]);
 }
 
+/*
+ *** SVE Permute - Predicates Group
+ */
+
+static void do_perm_pred3(DisasContext *s, arg_rrr_esz *a, bool high_odd,
+                          gen_helper_gvec_3 *fn)
+{
+    unsigned vsz = pred_full_reg_size(s);
+
+    /* Predicate sizes may be smaller and cannot use simd_desc.
+       We cannot round up, as we do elsewhere, because we need
+       the exact size for ZIP2 and REV.  We retain the style for
+       the other helpers for consistency.  */
+    TCGv_ptr t_d = tcg_temp_new_ptr();
+    TCGv_ptr t_n = tcg_temp_new_ptr();
+    TCGv_ptr t_m = tcg_temp_new_ptr();
+    TCGv_i32 t_desc;
+    int desc;
+
+    desc = vsz - 2;
+    desc = deposit32(desc, SIMD_DATA_SHIFT, 2, a->esz);
+    desc = deposit32(desc, SIMD_DATA_SHIFT + 2, 2, high_odd);
+
+    tcg_gen_addi_ptr(t_d, cpu_env, pred_full_reg_offset(s, a->rd));
+    tcg_gen_addi_ptr(t_n, cpu_env, pred_full_reg_offset(s, a->rn));
+    tcg_gen_addi_ptr(t_m, cpu_env, pred_full_reg_offset(s, a->rm));
+    t_desc = tcg_const_i32(desc);
+
+    fn(t_d, t_n, t_m, t_desc);
+
+    tcg_temp_free_ptr(t_d);
+    tcg_temp_free_ptr(t_n);
+    tcg_temp_free_ptr(t_m);
+    tcg_temp_free_i32(t_desc);
+}
+
+static void do_perm_pred2(DisasContext *s, arg_rr_esz *a, bool high_odd,
+                          gen_helper_gvec_2 *fn)
+{
+    unsigned vsz = pred_full_reg_size(s);
+    TCGv_ptr t_d = tcg_temp_new_ptr();
+    TCGv_ptr t_n = tcg_temp_new_ptr();
+    TCGv_i32 t_desc;
+    int desc;
+
+    tcg_gen_addi_ptr(t_d, cpu_env, pred_full_reg_offset(s, a->rd));
+    tcg_gen_addi_ptr(t_n, cpu_env, pred_full_reg_offset(s, a->rn));
+
+    /* Predicate sizes may be smaller and cannot use simd_desc.
+       We cannot round up, as we do elsewhere, because we need
+       the exact size for ZIP2 and REV.  We retain the style for
+       the other helpers for consistency.  */
+
+    desc = vsz - 2;
+    desc = deposit32(desc, SIMD_DATA_SHIFT, 2, a->esz);
+    desc = deposit32(desc, SIMD_DATA_SHIFT + 2, 2, high_odd);
+    t_desc = tcg_const_i32(desc);
+
+    fn(t_d, t_n, t_desc);
+
+    tcg_temp_free_i32(t_desc);
+    tcg_temp_free_ptr(t_d);
+    tcg_temp_free_ptr(t_n);
+}
+
+static void trans_ZIP1_p(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
+{
+    do_perm_pred3(s, a, 0, gen_helper_sve_zip_p);
+}
+
+static void trans_ZIP2_p(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
+{
+    do_perm_pred3(s, a, 1, gen_helper_sve_zip_p);
+}
+
+static void trans_UZP1_p(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
+{
+    do_perm_pred3(s, a, 0, gen_helper_sve_uzp_p);
+}
+
+static void trans_UZP2_p(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
+{
+    do_perm_pred3(s, a, 1, gen_helper_sve_uzp_p);
+}
+
+static void trans_TRN1_p(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
+{
+    do_perm_pred3(s, a, 0, gen_helper_sve_trn_p);
+}
+
+static void trans_TRN2_p(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
+{
+    do_perm_pred3(s, a, 1, gen_helper_sve_trn_p);
+}
+
+static void trans_REV_p(DisasContext *s, arg_rr_esz *a, uint32_t insn)
+{
+    do_perm_pred2(s, a, 0, gen_helper_sve_rev_p);
+}
+
+static void trans_PUNPKLO(DisasContext *s, arg_PUNPKLO *a, uint32_t insn)
+{
+    do_perm_pred2(s, a, 0, gen_helper_sve_punpk_p);
+}
+
+static void trans_PUNPKHI(DisasContext *s, arg_PUNPKHI *a, uint32_t insn)
+{
+    do_perm_pred2(s, a, 1, gen_helper_sve_punpk_p);
+}
+
 /*
  *** SVE Memory - 32-bit Gather and Unsized Contiguous Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 8af47ad27b..bcbe84c3a6 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -87,6 +87,7 @@
 
 # Three operand, vector element size
 @rd_rn_rm	........ esz:2 . rm:5 ... ... rn:5 rd:5		&rrr_esz
+@pd_pn_pm	........ esz:2 .. rm:4 ....... rn:4 . rd:4	&rrr_esz
 @rdn_rm		........ esz:2 ...... ...... rm:5 rd:5 \
 		&rrr_esz rn=%reg_movprfx
 
@@ -397,6 +398,23 @@ TBL		00000101 .. 1 ..... 001100 ..... .....		@rd_rn_rm
 # SVE unpack vector elements
 UNPK		00000101 esz:2 1100 u:1 h:1 001110 rn:5 rd:5
 
+### SVE Permute - Predicates Group
+
+# SVE permute predicate elements
+ZIP1_p		00000101 .. 10 .... 010 000 0 .... 0 ....	@pd_pn_pm
+ZIP2_p		00000101 .. 10 .... 010 001 0 .... 0 ....	@pd_pn_pm
+UZP1_p		00000101 .. 10 .... 010 010 0 .... 0 ....	@pd_pn_pm
+UZP2_p		00000101 .. 10 .... 010 011 0 .... 0 ....	@pd_pn_pm
+TRN1_p		00000101 .. 10 .... 010 100 0 .... 0 ....	@pd_pn_pm
+TRN2_p		00000101 .. 10 .... 010 101 0 .... 0 ....	@pd_pn_pm
+
+# SVE reverse predicate elements
+REV_p		00000101 .. 11 0100 010 000 0 .... 0 ....	@pd_pn
+
+# SVE unpack predicate elements
+PUNPKLO		00000101 00 11 0000 010 000 0 .... 0 ....	@pd_pn_e0
+PUNPKHI		00000101 00 11 0001 010 000 0 .... 0 ....	@pd_pn_e0
+
 ### SVE Predicate Logical Operations Group
 
 # SVE predicate logical operations
-- 
2.14.3

