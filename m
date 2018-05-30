Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp5025932wre;
        Wed, 30 May 2018 11:08:19 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKL28MYZ9bl4rQNfW2pnJKMOHXmvRCKXCWrgRZRkYN0/IRURGiSIEziHzT68s0O1FY+sHeNX
X-Received: by 2002:a37:2b87:: with SMTP id r7-v6mr3516798qkr.331.1527703699126;
        Wed, 30 May 2018 11:08:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527703699; cv=none;
        d=google.com; s=arc-20160816;
        b=bP+wv0iZ0z5kAzWPS/KvpMXqI6cPtBNEZqPVcFtP766dNRCko1laZOif9YbGGHAcjj
         rBsDxHWVUFDgMEJjuI8l7jGlKdgTaorOyD11DuZwzcjJQwEC23M1z/CWEgJQE2WBA/0g
         q3n52mCj4c1KsV12CZKZSa4nk12SbFCYyZGUdS4TtISP/oPM0gAYaOvCBqAxaRiqpvpE
         bazpYZi84cCntcyiXjqvQvN6xFG2ZM7Xl4fzMtA26KEn5I5GclJWV4m4jQ8eLHnhnlTl
         Rn26vywouRZQpJUmWBfq2/64V1nDLUIlc8OjYpfs1pli5oU+wFxwzCumbKERRthCYQhm
         x66Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=20EZoQ8QPU8yFGAo8rpV97QFYZBSCVksGfxx17wN4pk=;
        b=emAX/ZHpSWgK9nOeeEvnE2WTBhkEYNJYgRhAZLrza8TQ0fPxesfCI/nwroVxywHQ4t
         6LIQ2MC2OWd2njILvIn2pMgCwsqImCy1YRAq+odc30aeGziZe7NhHWNbLEez5j4hGuDA
         4z7JZQzItChiatoAwCGX47MVS0qOAaO7/jpGs5DakgMnmRZ05Uh39Ww+Vdsje2BspaDo
         YoQb4fIb4gCxNjUt8tRqf/QZhFvW57O2WhoJwV5GdyTuSRG15ud04c0AK8YKNVKfKBwS
         QTDCoEac5Qj6y4mJcNnpO1xj+zMrmtHmFO8sF81bA7MrFcii37Q0Rx1Grb8tc6LId1il
         LSQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XPvSo7W2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x1-v6si2360597qvd.146.2018.05.30.11.08.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 11:08:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XPvSo7W2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40078 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fO5WD-0006zp-8y
	for alex.bennee@linaro.org; Wed, 30 May 2018 14:08:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33222)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fO5Ph-0001qm-Ee
	for qemu-arm@nongnu.org; Wed, 30 May 2018 14:01:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fO5Pe-0004R6-EO
	for qemu-arm@nongnu.org; Wed, 30 May 2018 14:01:33 -0400
Received: from mail-pl0-x243.google.com ([2607:f8b0:400e:c01::243]:38859)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fO5Pe-0004P4-3c
	for qemu-arm@nongnu.org; Wed, 30 May 2018 14:01:30 -0400
Received: by mail-pl0-x243.google.com with SMTP id c11-v6so11553934plr.5
	for <qemu-arm@nongnu.org>; Wed, 30 May 2018 11:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=20EZoQ8QPU8yFGAo8rpV97QFYZBSCVksGfxx17wN4pk=;
	b=XPvSo7W2DlD5+yKtl8Jnpj7xvmGrY4TtqP+dXnfcuf06PSUvX4HHH6JmziQVs3kslG
	ypxMwprfCD5kRWzBO05jxCbXT1+BuSJBPIPq4RllBXOfYrB3Qbo3WbwsLhso/yEd6n3L
	NXdN6V4qBYInRF3UA1udX98i9cVXyOAbZuySY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=20EZoQ8QPU8yFGAo8rpV97QFYZBSCVksGfxx17wN4pk=;
	b=rn687/6Io7+QhE8iQrM6c3OME62/9SZlXnIWV7c+a89X2/aMQMtMUxFfZux1nxAKYB
	AWHTFzbncXgyytZIjuqpoxDAZ1EDkm0fiqLjWXb79wlahmL1k5l/BGH1DjmPt6qDU5vS
	45l67P8I62tGGX8QvN5/mc6xD2Sn3No4MahyzlUCfaO1eRs61GEtUz1Dxm+lr7L3DGQS
	NO+P7srPz2XknFwZKbHQBMDsEmjeFFg4XeM95fSLYbLjA+Xz6xRb8sBIbf/pAmBmdLk7
	UJpM73jhbP+o4XL79SzolHcdabXI9RLRjgz+gu1phby2bzrzmvMIEe/Rd42C0UUKuhp+
	1GCg==
X-Gm-Message-State: ALKqPwfsiaLN4IzrppZ2ljTdaxerLEx+yApGVH9mdQq3LIhxzlUhwxDl
	VJiqSQt15Z4phGjUh3nIheGgyFramHw=
X-Received: by 2002:a17:902:64cf:: with SMTP id
	y15-v6mr3840781pli.53.1527703287507; 
	Wed, 30 May 2018 11:01:27 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	b84-v6sm28179157pfm.123.2018.05.30.11.01.25
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 30 May 2018 11:01:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 30 May 2018 11:01:05 -0700
Message-Id: <20180530180120.13355-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180530180120.13355-1-richard.henderson@linaro.org>
References: <20180530180120.13355-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::243
Subject: [Qemu-arm] [PATCH v3b 03/18] target/arm: Implement SVE Permute -
 Predicates Group
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: icjX17+lDHNj

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |   6 +
 target/arm/sve_helper.c    | 290 +++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 120 +++++++++++++++
 target/arm/sve.decode      |  18 +++
 4 files changed, 434 insertions(+)

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
index 58c0fda333..f4d49d4aff 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1674,3 +1674,293 @@ DO_UNPK(sve_uunpk_s, uint32_t, uint16_t, H4, H2)
 DO_UNPK(sve_uunpk_d, uint64_t, uint32_t, , H4)
 
 #undef DO_UNPK
+
+/* Mask of bits included in the even numbered predicates of width esz.
+ * We also use this for expand_bits/compress_bits, and so extend the
+ * same pattern out to 16-bit units.
+ */
+static const uint64_t even_bit_esz_masks[5] = {
+    0x5555555555555555ull,
+    0x3333333333333333ull,
+    0x0f0f0f0f0f0f0f0full,
+    0x00ff00ff00ff00ffull,
+    0x0000ffff0000ffffull,
+};
+
+/* Zero-extend units of 2**N bits to units of 2**(N+1) bits.
+ * For N==0, this corresponds to the operation that in qemu/bitops.h
+ * we call half_shuffle64; this algorithm is from Hacker's Delight,
+ * section 7-2 Shuffling Bits.
+ */
+static uint64_t expand_bits(uint64_t x, int n)
+{
+    int i;
+
+    x &= 0xffffffffu;
+    for (i = 4; i >= n; i--) {
+        int sh = 1 << i;
+        x = ((x << sh) | x) & even_bit_esz_masks[i];
+    }
+    return x;
+}
+
+/* Compress units of 2**(N+1) bits to units of 2**N bits.
+ * For N==0, this corresponds to the operation that in qemu/bitops.h
+ * we call half_unshuffle64; this algorithm is from Hacker's Delight,
+ * section 7-2 Shuffling Bits, where it is called an inverse half shuffle.
+ */
+static uint64_t compress_bits(uint64_t x, int n)
+{
+    int i;
+
+    for (i = n; i <= 4; i++) {
+        int sh = 1 << i;
+        x &= even_bit_esz_masks[i];
+        x = (x >> sh) | x;
+    }
+    return x & 0xffffffffu;
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
index 388cce9924..0160d06915 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2089,6 +2089,126 @@ static bool trans_UNPK(DisasContext *s, arg_UNPK *a, uint32_t insn)
     return true;
 }
 
+/*
+ *** SVE Permute - Predicates Group
+ */
+
+static bool do_perm_pred3(DisasContext *s, arg_rrr_esz *a, bool high_odd,
+                          gen_helper_gvec_3 *fn)
+{
+    if (!sve_access_check(s)) {
+        return true;
+    }
+
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
+    return true;
+}
+
+static bool do_perm_pred2(DisasContext *s, arg_rr_esz *a, bool high_odd,
+                          gen_helper_gvec_2 *fn)
+{
+    if (!sve_access_check(s)) {
+        return true;
+    }
+
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
+    return true;
+}
+
+static bool trans_ZIP1_p(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
+{
+    return do_perm_pred3(s, a, 0, gen_helper_sve_zip_p);
+}
+
+static bool trans_ZIP2_p(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
+{
+    return do_perm_pred3(s, a, 1, gen_helper_sve_zip_p);
+}
+
+static bool trans_UZP1_p(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
+{
+    return do_perm_pred3(s, a, 0, gen_helper_sve_uzp_p);
+}
+
+static bool trans_UZP2_p(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
+{
+    return do_perm_pred3(s, a, 1, gen_helper_sve_uzp_p);
+}
+
+static bool trans_TRN1_p(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
+{
+    return do_perm_pred3(s, a, 0, gen_helper_sve_trn_p);
+}
+
+static bool trans_TRN2_p(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
+{
+    return do_perm_pred3(s, a, 1, gen_helper_sve_trn_p);
+}
+
+static bool trans_REV_p(DisasContext *s, arg_rr_esz *a, uint32_t insn)
+{
+    return do_perm_pred2(s, a, 0, gen_helper_sve_rev_p);
+}
+
+static bool trans_PUNPKLO(DisasContext *s, arg_PUNPKLO *a, uint32_t insn)
+{
+    return do_perm_pred2(s, a, 0, gen_helper_sve_punpk_p);
+}
+
+static bool trans_PUNPKHI(DisasContext *s, arg_PUNPKHI *a, uint32_t insn)
+{
+    return do_perm_pred2(s, a, 1, gen_helper_sve_punpk_p);
+}
+
 /*
  *** SVE Memory - 32-bit Gather and Unsized Contiguous Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 7ffd7962c8..26fe1608c4 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -86,6 +86,7 @@
 
 # Three operand, vector element size
 @rd_rn_rm       ........ esz:2 . rm:5 ... ... rn:5 rd:5         &rrr_esz
+@pd_pn_pm       ........ esz:2 .. rm:4 ....... rn:4 . rd:4      &rrr_esz
 @rdn_rm         ........ esz:2 ...... ...... rm:5 rd:5 \
                 &rrr_esz rn=%reg_movprfx
 
@@ -396,6 +397,23 @@ TBL             00000101 .. 1 ..... 001100 ..... .....          @rd_rn_rm
 # SVE unpack vector elements
 UNPK            00000101 esz:2 1100 u:1 h:1 001110 rn:5 rd:5
 
+### SVE Permute - Predicates Group
+
+# SVE permute predicate elements
+ZIP1_p          00000101 .. 10 .... 010 000 0 .... 0 ....       @pd_pn_pm
+ZIP2_p          00000101 .. 10 .... 010 001 0 .... 0 ....       @pd_pn_pm
+UZP1_p          00000101 .. 10 .... 010 010 0 .... 0 ....       @pd_pn_pm
+UZP2_p          00000101 .. 10 .... 010 011 0 .... 0 ....       @pd_pn_pm
+TRN1_p          00000101 .. 10 .... 010 100 0 .... 0 ....       @pd_pn_pm
+TRN2_p          00000101 .. 10 .... 010 101 0 .... 0 ....       @pd_pn_pm
+
+# SVE reverse predicate elements
+REV_p           00000101 .. 11 0100 010 000 0 .... 0 ....       @pd_pn
+
+# SVE unpack predicate elements
+PUNPKLO         00000101 00 11 0000 010 000 0 .... 0 ....       @pd_pn_e0
+PUNPKHI         00000101 00 11 0001 010 000 0 .... 0 ....       @pd_pn_e0
+
 ### SVE Predicate Logical Operations Group
 
 # SVE predicate logical operations
-- 
2.17.0

