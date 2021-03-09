Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2955843lfg;
        Tue, 9 Mar 2021 08:22:02 -0800 (PST)
X-Received: by 2002:a9d:20c3:: with SMTP id x61mr24791482ota.311.1615306922524;
        Tue, 09 Mar 2021 08:22:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306922; cv=none;
        d=google.com; s=arc-20160816;
        b=uDsxvvkeRju5AMo/n9LIWJmOuBsW4w8DYD/CXfIz8pj3rzGex/7P7KGsvxivgIfz9W
         4bpKFL2dzPE8lHU+7nVYc2DIBRbaM23JtyHdunNqx3YdLWgu+iBkJRGkhl+okqTKBeNk
         tw65FKzrCpIOtY4ItrArMr+AIXzktekzoohsreoWnyuuMfRNqi4yaS3jUY7DOq4/CvKW
         Z2jAe7S3wrOMbSR3NDmWf5N60/M93jrXbMXEGiGsE0WEngAXmqQOHVH4p6whFhGAOJDm
         qCEmEwqqmgGPkjPuOe0r0Bb25bZeJfqEwFQfyD+Af3w2ZeWVnTtZZEvbHPOqlQ9wRWqx
         +kxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=3y/+qgHE/0Io69b/bOTYSEDVvU6QnkuY6CtVyDU1GPc=;
        b=bwKYKN0tKmuZE4eb5YhG0RakaieYlfG7D0RMM7K4N00P0pYzuPQYJSoRmyqFHKWaeD
         8MQGTUl4AcCgjRHj6pWmsMHvkDxtvruLhzBmltfwIKdlYJzQGPgewauqrChaGgVJOsto
         A+2k3BaMABpwA8WK+cyzWpagGHIPZeZW8v58Wpir51zvrOaZ1MxjWGF1djFFFMFviwxE
         tM5VP7h8TUfNDZ8ea+eVcfgKgTvWnrdt/1nRFID8JwN7SeF/liZnbBeh5t0VRYnYvUO2
         3dIAa5ffkja3a1CJ1HqLqwev1Uq8K6NM4vV2IHojJHv3yM1QFdwJ5lWeBJMHWG5NFeOt
         nkyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wDbTdXvO;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p206sor4120720oib.69.2021.03.09.08.22.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:22:02 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wDbTdXvO;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3y/+qgHE/0Io69b/bOTYSEDVvU6QnkuY6CtVyDU1GPc=;
        b=wDbTdXvOOhZeYcquoZj0/bE/nMn7dPcsxVVPwkMxZ02AHEn/qNW4j/OU070swwW1it
         YxkHw5Wd+ym8MREhgjOe8APFg8MTS+NLp/WfrC6KwjJtvIy6dTpiLt7LAvI5geS3f6gV
         6bWuDU18OkzGshroaxSH3pcqs02HGoVruEiaQHyWaPjo82w8UhOwVCBIRUTQa06noCy6
         cwHI8zHd9JEpxg9VDumnk+2j8bgPCUDZ98AeX1IbMy/u9lvrFbcSAI4SXDTDfZA6FCPH
         ypA9hYYhhu0hckH7UHOSIY4wbC0SLJYfCmL3hJv0OUYiBinqqZe6t9hNaWqi0AVhcF+6
         O4dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3y/+qgHE/0Io69b/bOTYSEDVvU6QnkuY6CtVyDU1GPc=;
        b=Jk1U/YNl494Dk0wSBmbGP0a+J1RSkz2X6t0JTTtoqZ4PFOKc2vHXT8SfyG/2nue1Kj
         7iXOcv0gFcjgUP7LIaQuzXcJmpIsQYsKSCJNNc2oG+qArNg3tOQ1h0DsWdS569I2LdK/
         8Lvr6QaTDpsubehOs9JnEzlYFW+JsGawpUqwrnBpaWOIyFkburXtn7NyfudLppVNMG/f
         QMIc40hWkKYuhIshwbjRQ8svv9pD+NNXN1SzjeWfHBtFFClRYis3NSErHMbMbeE8URIQ
         ikxljOtzBj1wTRRmIrsy3rCjYw9eyW8FVGfA4LrABQf2Hxcek/60QmyYMSVJxAAQvKNM
         5Btg==
X-Gm-Message-State: AOAM531CQZMvjHrMiSJWE/V+oMFn84QI1VAC6J1k5Ge5C8GUVWfDfLOn
	aUL3J7P6CYZR2bplITwfC/06coZ+
X-Google-Smtp-Source: ABdhPJzlm332Z1X18ZbqzagVZAFoIzYhtG8zuzN/O0xKB1rfpSm7LDDmUlohQoOIGkVHOFyga0dIJw==
X-Received: by 2002:a05:6808:114b:: with SMTP id u11mr3386371oiu.52.1615306922117;
        Tue, 09 Mar 2021 08:22:02 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id u19sm3470898ote.15.2021.03.09.08.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:22:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Stephen Long <steplong@quicinc.com>
Subject: [PATCH v4 42/78] target/arm: Implement SVE2 HISTCNT, HISTSEG
Date: Tue,  9 Mar 2021 08:20:05 -0800
Message-Id: <20210309162041.23124-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: F6wYxSXKsAvl

From: Stephen Long <steplong@quicinc.com>

Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200416173109.8856-1-steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Fix overlap between output and input vectors.
v4: Fix histseg counting (zhiwei).
---
 target/arm/helper-sve.h    |   7 ++
 target/arm/sve.decode      |   6 ++
 target/arm/sve_helper.c    | 131 +++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c |  19 ++++++
 4 files changed, 163 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 98e6b57e38..507a2fea8e 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2551,6 +2551,13 @@ DEF_HELPER_FLAGS_5(sve2_nmatch_ppzz_b, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(sve2_nmatch_ppzz_h, TCG_CALL_NO_RWG,
                    i32, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(sve2_histcnt_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_histcnt_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_histseg, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_6(sve2_faddp_zpzz_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_6(sve2_faddp_zpzz_s, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 388bf92acf..8f501a083c 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -146,6 +146,7 @@
                 &rprrr_esz rn=%reg_movprfx
 @rdn_pg_rm_ra   ........ esz:2 . ra:5  ... pg:3 rm:5 rd:5 \
                 &rprrr_esz rn=%reg_movprfx
+@rd_pg_rn_rm   ........ esz:2 . rm:5 ... pg:3 rn:5 rd:5       &rprr_esz
 
 # One register operand, with governing predicate, vector element size
 @rd_pg_rn       ........ esz:2 ... ... ... pg:3 rn:5 rd:5       &rpr_esz
@@ -1336,6 +1337,11 @@ RSUBHNT         01000101 .. 1 ..... 011 111 ..... .....  @rd_rn_rm
 MATCH           01000101 .. 1 ..... 100 ... ..... 0 .... @pd_pg_rn_rm
 NMATCH          01000101 .. 1 ..... 100 ... ..... 1 .... @pd_pg_rn_rm
 
+### SVE2 Histogram Computation
+
+HISTCNT         01000101 .. 1 ..... 110 ... ..... .....  @rd_pg_rn_rm
+HISTSEG         01000101 .. 1 ..... 101 000 ..... .....  @rd_rn_rm
+
 ## SVE2 floating-point pairwise operations
 
 FADDP           01100100 .. 010 00 0 100 ... ..... ..... @rdn_pg_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 860ab564cd..88a5e64277 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -7094,3 +7094,134 @@ DO_PPZZ_MATCH(sve2_nmatch_ppzz_b, MO_8, true)
 DO_PPZZ_MATCH(sve2_nmatch_ppzz_h, MO_16, true)
 
 #undef DO_PPZZ_MATCH
+
+void HELPER(sve2_histcnt_s)(void *vd, void *vn, void *vm, void *vg,
+                            uint32_t desc)
+{
+    ARMVectorReg scratch;
+    intptr_t i, j;
+    intptr_t opr_sz = simd_oprsz(desc);
+    uint32_t *d = vd, *n = vn, *m = vm;
+    uint8_t *pg = vg;
+
+    if (d == n) {
+        n = memcpy(&scratch, n, opr_sz);
+        if (d == m) {
+            m = n;
+        }
+    } else if (d == m) {
+        m = memcpy(&scratch, m, opr_sz);
+    }
+
+    for (i = 0; i < opr_sz; i += 4) {
+        uint64_t count = 0;
+        uint8_t pred;
+
+        pred = pg[H1(i >> 3)] >> (i & 7);
+        if (pred & 1) {
+            uint32_t nn = n[H4(i >> 2)];
+
+            for (j = 0; j <= i; j += 4) {
+                pred = pg[H1(j >> 3)] >> (j & 7);
+                if ((pred & 1) && nn == m[H4(j >> 2)]) {
+                    ++count;
+                }
+            }
+        }
+        d[H4(i >> 2)] = count;
+    }
+}
+
+void HELPER(sve2_histcnt_d)(void *vd, void *vn, void *vm, void *vg,
+                            uint32_t desc)
+{
+    ARMVectorReg scratch;
+    intptr_t i, j;
+    intptr_t opr_sz = simd_oprsz(desc);
+    uint64_t *d = vd, *n = vn, *m = vm;
+    uint8_t *pg = vg;
+
+    if (d == n) {
+        n = memcpy(&scratch, n, opr_sz);
+        if (d == m) {
+            m = n;
+        }
+    } else if (d == m) {
+        m = memcpy(&scratch, m, opr_sz);
+    }
+
+    for (i = 0; i < opr_sz / 8; ++i) {
+        uint64_t count = 0;
+        if (pg[H1(i)] & 1) {
+            uint64_t nn = n[i];
+            for (j = 0; j <= i; ++j) {
+                if ((pg[H1(j)] & 1) && nn == m[j]) {
+                    ++count;
+                }
+            }
+        }
+        d[i] = count;
+    }
+}
+
+/*
+ * Returns the number of bytes in m0 and m1 that match n.
+ * Unlike do_match2 we don't just need true/false, we need an exact count.
+ * This requires two extra logical operations.
+ */
+static inline uint64_t do_histseg_cnt(uint8_t n, uint64_t m0, uint64_t m1)
+{
+    const uint64_t mask = dup_const(MO_8, 0x7f);
+    uint64_t cmp0, cmp1;
+
+    cmp1 = dup_const(MO_8, n);
+    cmp0 = cmp1 ^ m0;
+    cmp1 = cmp1 ^ m1;
+
+    /*
+     * 1: clear msb of each byte to avoid carry to next byte (& mask)
+     * 2: carry in to msb if byte != 0 (+ mask)
+     * 3: set msb if cmp has msb set (| cmp)
+     * 4: set ~msb to ignore them (| mask)
+     * We now have 0xff for byte != 0 or 0x7f for byte == 0.
+     * 5: invert, resulting in 0x80 if and only if byte == 0.
+     */
+    cmp0 = ~(((cmp0 & mask) + mask) | cmp0 | mask);
+    cmp1 = ~(((cmp1 & mask) + mask) | cmp1 | mask);
+
+    /*
+     * Combine the two compares in a way that the bits do
+     * not overlap, and so preserves the count of set bits.
+     * If the host has an efficient instruction for ctpop,
+     * then ctpop(x) + ctpop(y) has the same number of
+     * operations as ctpop(x | (y >> 1)).  If the host does
+     * not have an efficient ctpop, then we only want to
+     * use it once.
+     */
+    return ctpop64(cmp0 | (cmp1 >> 1));
+}
+
+void HELPER(sve2_histseg)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, j;
+    intptr_t opr_sz = simd_oprsz(desc);
+
+    for (i = 0; i < opr_sz; i += 16) {
+        uint64_t n0 = *(uint64_t *)(vn + i);
+        uint64_t m0 = *(uint64_t *)(vm + i);
+        uint64_t n1 = *(uint64_t *)(vn + i + 8);
+        uint64_t m1 = *(uint64_t *)(vm + i + 8);
+        uint64_t out0 = 0;
+        uint64_t out1 = 0;
+
+        for (j = 0; j < 64; j += 8) {
+            uint64_t cnt0 = do_histseg_cnt(n0 >> j, m0, m1);
+            uint64_t cnt1 = do_histseg_cnt(n1 >> j, m0, m1);
+            out0 |= cnt0 << j;
+            out1 |= cnt1 << j;
+        }
+
+        *(uint64_t *)(vd + i) = out0;
+        *(uint64_t *)(vd + i + 8) = out1;
+    }
+}
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 08622432bd..acda88cb2c 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7505,6 +7505,25 @@ static bool trans_##NAME(DisasContext *s, arg_rprr_esz *a)                  \
 DO_SVE2_PPZZ_MATCH(MATCH, match)
 DO_SVE2_PPZZ_MATCH(NMATCH, nmatch)
 
+static bool trans_HISTCNT(DisasContext *s, arg_rprr_esz *a)
+{
+    static gen_helper_gvec_4 * const fns[2] = {
+        gen_helper_sve2_histcnt_s, gen_helper_sve2_histcnt_d
+    };
+    if (a->esz < 2) {
+        return false;
+    }
+    return do_sve2_zpzz_ool(s, a, fns[a->esz - 2]);
+}
+
+static bool trans_HISTSEG(DisasContext *s, arg_rrr_esz *a)
+{
+    if (a->esz != 0) {
+        return false;
+    }
+    return do_sve2_zzz_ool(s, a, gen_helper_sve2_histseg);
+}
+
 static bool do_sve2_zpzz_fp(DisasContext *s, arg_rprr_esz *a,
                             gen_helper_gvec_4_ptr *fn)
 {
-- 
2.25.1
