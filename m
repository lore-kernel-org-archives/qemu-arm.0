Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4032744lfm;
        Mon, 24 May 2021 18:34:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaJD7Qnlq36ul69yWWJhm88qNmloNdpnVNtVPq6e95z1CeLVphH7Hzis50LNzTNa3NOYqP
X-Received: by 2002:a05:6e02:2141:: with SMTP id d1mr9797246ilv.190.1621906472203;
        Mon, 24 May 2021 18:34:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621906472; cv=none;
        d=google.com; s=arc-20160816;
        b=wlSfBHbL6A8iIyzW0DdcZfvd5QXI+eG40wZsIfU0GNpGM7t4S9MDlECie7ZMhcI+FG
         AaxXunDNK6t32p0Zh7pWzW7c0aqlAakdaT8YXJFEfyOnatnj97gGZEWcZp0EcHot2gE8
         9X8w+w+eHuiIrHBtfpzVRNP2v+CX6c8CizxL2Dig7kH13ihlojv6wXkkHTnsZSNMga0N
         qGop7wenuNX4DPnK5X+1UFvt/oCub9pim9GirIXYit48CVngqr/vnd/7NP9ONpUSHBBE
         +Bop0OgnopYKg9np+4osWatHXsQzA8vC2XnupfsgNV8JlChdJJKuXPvh0TcAEkK/KlcM
         llxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Ogxl8WRvUU10mS7HNWeicfHXRTXx6p7GB6bwGt2V1I4=;
        b=F3cd5wHHYg01/N4cAyAy22k41yw91MY5hk/fNvp7uEgF0J2259tLbrPITm8wxi1n7F
         6L+QkdeP4j0oUZjw40NrNSLC1X6ju7e+g7Ed2vDnbPNTZYTUoSuV4vXb4EuaC0+eYsFA
         xY46MYIVOgTL/EiQ9ZthgB6iGmSq8vJJZYcHfE2KkdcdAJyCO8RxwM0zJkeehRMffv/I
         6rdkJuHWG4OzFa6XjZ5oXYt0NiEg3GZtHWp+Ez2NSmQQdo9EzrZRqzAq7riWoWA+VlDZ
         AbDeZld19dQgFNgosEqa6i8tw82ljr1q++/Ci4JwoCgGQXZJCgLGtgKIXkZYCCHFKhof
         WcxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PDPKh8BW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 16si17630567iou.15.2021.05.24.18.34.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 18:34:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PDPKh8BW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llLxn-00070H-GI
	for alex.bennee@linaro.org; Mon, 24 May 2021 21:34:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLV9-0002Kc-HH
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:04:55 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:43978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLUb-0001sU-7l
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:04:55 -0400
Received: by mail-pf1-x436.google.com with SMTP id d78so21397168pfd.10
 for <qemu-arm@nongnu.org>; Mon, 24 May 2021 18:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ogxl8WRvUU10mS7HNWeicfHXRTXx6p7GB6bwGt2V1I4=;
 b=PDPKh8BWfyH0eDow1yaPNXMZvPfVbUY6kxNaZ8LzPiZINhni6PZIM6jNvq9vtDaMk/
 5YveZboqrpAevJteVvtZkqHn9YQyPnYq/iiqKz32vwuYusrML1MjnrFh8RWZlRGmx/oG
 wCXl1zJC5LZFgO36og++NFbRMzXYj+s7gwPowHRCN68sW5+CUVXfxYKYrtJHKVNbGSjC
 Zjo9yf6cFx1itkUUdVNVYJ84lcOzexYoNGQLWz2aOKVWxEij/9Ws9xhUDMoYeBXmwVjx
 T9SBb72huSr9USpHoBEu9Fn0rp5/J1hdw/VunxeYBToStvR9KS8jFlpxHgWvHEv/tVXI
 oYXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ogxl8WRvUU10mS7HNWeicfHXRTXx6p7GB6bwGt2V1I4=;
 b=q9Wzi9vpr5wL8YE5XUK3Ta+GzR670Dj+RH/DNfkZpJyOZWT75ngCpgBfSy6mGosdMZ
 joxf3t5SNpAJTx3Z2MHXC3hRW5pQO9aTynnz71yX+w8jqJ+YCSI+POhy+GKDMUWxW7/A
 7H9AfyCa7rs5E7OrG2sooLK5Iw50o8ItWIyLarWkJRbiB4NvNx+geTxM8QvFFvJWUJAY
 A/S6dThe6X5SMY90nyftHivZo/0iF41BIiP78lRl3J4cmAkKzVfPPVemsmRV3SD8Z2y/
 y07QRrJGeKk42zSXRcwDa6IbmQcxd22uMaDAjTtbUzMVOJWLZ0ck6cJNUFoEP6DMsn9A
 ju/w==
X-Gm-Message-State: AOAM533FxyWNUZIl3iv4o/6Ge78O2B5CyHiblvmnRBPE/NSNSb86oSlK
 kfpWPPtxb41SfMOCiUkVDzw5gbyjQPyqgQ==
X-Received: by 2002:a63:5b23:: with SMTP id p35mr16363763pgb.352.1621904659895; 
 Mon, 24 May 2021 18:04:19 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b1sm13742645pgf.84.2021.05.24.18.04.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:04:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 33/92] target/arm: Implement SVE2 MATCH, NMATCH
Date: Mon, 24 May 2021 18:02:59 -0700
Message-Id: <20210525010358.152808-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
Cc: qemu-arm@nongnu.org, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7eFteRXRTHGo

From: Stephen Long <steplong@quicinc.com>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200415145915.2859-1-steplong@quicinc.com>
[rth: Expanded comment for do_match2]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Apply esz_mask to input pg to fix output flags.
---
 target/arm/helper-sve.h    | 10 ++++++
 target/arm/sve.decode      |  5 +++
 target/arm/sve_helper.c    | 64 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 22 +++++++++++++
 4 files changed, 101 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index df617e3351..11dc6870de 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2509,6 +2509,16 @@ DEF_HELPER_FLAGS_3(sve2_uqrshrnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_uqrshrnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_uqrshrnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(sve2_match_ppzz_b, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_match_ppzz_h, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_nmatch_ppzz_b, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_nmatch_ppzz_h, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_6(sve2_faddp_zpzz_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_6(sve2_faddp_zpzz_s, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index bf673e2f16..47fca5e12d 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1320,6 +1320,11 @@ UQSHRNT         01000101 .. 1 ..... 00 1101 ..... .....  @rd_rn_tszimm_shr
 UQRSHRNB        01000101 .. 1 ..... 00 1110 ..... .....  @rd_rn_tszimm_shr
 UQRSHRNT        01000101 .. 1 ..... 00 1111 ..... .....  @rd_rn_tszimm_shr
 
+### SVE2 Character Match
+
+MATCH           01000101 .. 1 ..... 100 ... ..... 0 .... @pd_pg_rn_rm
+NMATCH          01000101 .. 1 ..... 100 ... ..... 1 .... @pd_pg_rn_rm
+
 ## SVE2 floating-point pairwise operations
 
 FADDP           01100100 .. 010 00 0 100 ... ..... ..... @rdn_pg_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 17889bc316..f3250165da 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -6847,3 +6847,67 @@ void HELPER(sve2_nbsl)(void *vd, void *vn, void *vm, void *vk, uint32_t desc)
         d[i] = ~((n[i] & k[i]) | (m[i] & ~k[i]));
     }
 }
+
+/*
+ * Returns true if m0 or m1 contains the low uint8_t/uint16_t in n.
+ * See hasless(v,1) from
+ *   https://graphics.stanford.edu/~seander/bithacks.html#ZeroInWord
+ */
+static inline bool do_match2(uint64_t n, uint64_t m0, uint64_t m1, int esz)
+{
+    int bits = 8 << esz;
+    uint64_t ones = dup_const(esz, 1);
+    uint64_t signs = ones << (bits - 1);
+    uint64_t cmp0, cmp1;
+
+    cmp1 = dup_const(esz, n);
+    cmp0 = cmp1 ^ m0;
+    cmp1 = cmp1 ^ m1;
+    cmp0 = (cmp0 - ones) & ~cmp0;
+    cmp1 = (cmp1 - ones) & ~cmp1;
+    return (cmp0 | cmp1) & signs;
+}
+
+static inline uint32_t do_match(void *vd, void *vn, void *vm, void *vg,
+                                uint32_t desc, int esz, bool nmatch)
+{
+    uint16_t esz_mask = pred_esz_masks[esz];
+    intptr_t opr_sz = simd_oprsz(desc);
+    uint32_t flags = PREDTEST_INIT;
+    intptr_t i, j, k;
+
+    for (i = 0; i < opr_sz; i += 16) {
+        uint64_t m0 = *(uint64_t *)(vm + i);
+        uint64_t m1 = *(uint64_t *)(vm + i + 8);
+        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3)) & esz_mask;
+        uint16_t out = 0;
+
+        for (j = 0; j < 16; j += 8) {
+            uint64_t n = *(uint64_t *)(vn + i + j);
+
+            for (k = 0; k < 8; k += 1 << esz) {
+                if (pg & (1 << (j + k))) {
+                    bool o = do_match2(n >> (k * 8), m0, m1, esz);
+                    out |= (o ^ nmatch) << (j + k);
+                }
+            }
+        }
+        *(uint16_t *)(vd + H1_2(i >> 3)) = out;
+        flags = iter_predtest_fwd(out, pg, flags);
+    }
+    return flags;
+}
+
+#define DO_PPZZ_MATCH(NAME, ESZ, INV)                                         \
+uint32_t HELPER(NAME)(void *vd, void *vn, void *vm, void *vg, uint32_t desc)  \
+{                                                                             \
+    return do_match(vd, vn, vm, vg, desc, ESZ, INV);                          \
+}
+
+DO_PPZZ_MATCH(sve2_match_ppzz_b, MO_8, false)
+DO_PPZZ_MATCH(sve2_match_ppzz_h, MO_16, false)
+
+DO_PPZZ_MATCH(sve2_nmatch_ppzz_b, MO_8, true)
+DO_PPZZ_MATCH(sve2_nmatch_ppzz_h, MO_16, true)
+
+#undef DO_PPZZ_MATCH
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 093424fd27..0ac2aeef09 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7462,6 +7462,28 @@ static bool trans_UQRSHRNT(DisasContext *s, arg_rri_esz *a)
     return do_sve2_shr_narrow(s, a, ops);
 }
 
+static bool do_sve2_ppzz_flags(DisasContext *s, arg_rprr_esz *a,
+                               gen_helper_gvec_flags_4 *fn)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_ppzz_flags(s, a, fn);
+}
+
+#define DO_SVE2_PPZZ_MATCH(NAME, name)                                      \
+static bool trans_##NAME(DisasContext *s, arg_rprr_esz *a)                  \
+{                                                                           \
+    static gen_helper_gvec_flags_4 * const fns[4] = {                       \
+        gen_helper_sve2_##name##_ppzz_b, gen_helper_sve2_##name##_ppzz_h,   \
+        NULL,                            NULL                               \
+    };                                                                      \
+    return do_sve2_ppzz_flags(s, a, fns[a->esz]);                           \
+}
+
+DO_SVE2_PPZZ_MATCH(MATCH, match)
+DO_SVE2_PPZZ_MATCH(NMATCH, nmatch)
+
 static bool do_sve2_zpzz_fp(DisasContext *s, arg_rprr_esz *a,
                             gen_helper_gvec_4_ptr *fn)
 {
-- 
2.25.1

