Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp742149lfr;
        Fri, 16 Apr 2021 14:31:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpgowxCctMdM/MRQjdoSuegxrpImsHrnZdGL79wKiHCDMe6tfOltnZgoxFxQQgkEyGfYNW
X-Received: by 2002:a9d:12e:: with SMTP id 43mr5490683otu.90.1618608678646;
        Fri, 16 Apr 2021 14:31:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618608678; cv=none;
        d=google.com; s=arc-20160816;
        b=Ui7W1LML7x2P3FfBrVivt/LU9jPKP5Qu4xOUqFpGRlCkBy4tUp5ehn/TvxpGipMWQt
         F4MEcAsURwB0P+esxwxyBgDqzu7sMl4+YJOgNK6pZfRTDLCltTM3aucx6KHandkUTbMO
         2td9tgdggdKdV5dMhkE9Sq5xEZ4nklyi4JbpSKC1DzhQsEmSPsfgNEsg2YWPWrkHNr43
         yX4W1Sl3giIdCQCsRdXrc44BSJ4iSoSQZHTvnoB/OyUNZevjBGuwkRZhc/pt93g9OnO/
         BxfwChUjfEsdHyMV9r8zaxAZybN/p5xOQNWT9KsqPnKmcizuofP2yDNm7EeXrrtRnaf8
         rpmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=SGOOa0zT0FE1S29kkqgncHYFmVqbSwpz80PVFtDGE1o=;
        b=RYpD8VwZmYs4syF0Nd1xyurMFJY4tbCODY5DzYWjHsfji5rTepflljmlOdlUqKb1UU
         F4ymO6fXeCwsiX0ouTOYanZp67Gfs+eKwnxqF6ChhVKKLlRxD2Faay53p1JBro756lPd
         U3WlZF55jVXQJrhwz/asY5NDe+5Ii3IM1G+EK3pUArtrDAnD7QcxlXsj/Rb8qI2W2YdI
         8td/3djzOO/L5xJrrGhQHzfTOY+w0iBsTnwycj1qlD90wXKNBrs61QVlm7B3TRH834du
         H9TilChLm3Zop60so0kiXoogiJj6a6NumI0vZI5u278TvmYf1kDN6ho43bll/Ih6+cPs
         aNAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CDZPdi8B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p23si5906724otl.170.2021.04.16.14.31.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 14:31:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CDZPdi8B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXW3Z-0007FT-R6
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 17:31:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVd9-0005eu-EW
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:03:59 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:41493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVd5-0001ci-Pt
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:03:59 -0400
Received: by mail-pf1-x431.google.com with SMTP id w6so4606235pfc.8
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 14:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SGOOa0zT0FE1S29kkqgncHYFmVqbSwpz80PVFtDGE1o=;
 b=CDZPdi8BdgOl/Hzv8n2SJ0mxWsZgKydcpMIFMV6Uc6dm+blpdfBJtzNdBdzhLf+QPQ
 mEniCCsIHezCKXBCvhOuZPXDVmU5uaQkB8dO95q6Pn+vVKugKngx8set92/tkZgAyWdb
 k73dH1BqFzjVEkeosk52TohEnDIdQvDcQ9p90i7c/VGOxFKXZ/e+hvxhfNmCLersUYUE
 ObVKqokTgWUIZzraYck5M2KQ0mEFJfnEDLU5E3uqZeSofXbQSLRnpSjppPn0rEsxZWht
 mqRRFbMKkLNZjlMQTEv0/m9RrWIY8MH5JA0Aady/MabARXklzWfiw+Jc9XjuqwUMXgad
 xvpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SGOOa0zT0FE1S29kkqgncHYFmVqbSwpz80PVFtDGE1o=;
 b=Sm6TeJ6VFcFxc/6ulkTDzsCkTmAMOQMcxxqntBA7im5TIYvtbQUYhYSIoxXLxfIFux
 UyxVvPD0uYyCxys1WpxIvS/qDT2M0I1LJicvVXn89TFbb9Kuk15wjAj8O89fYH0AYT7v
 6tMxx0jWXsVDopzP0nYNp0T7K9datT+PJLTjtg+KMarD52Y+FIalvJbNk7DnUPeZQF3p
 WOKS5FDK715gvjsBPdI9Mxalk0Vws30w1nnCLFEXax/2VbGTpb1Fhz/xZMc+SJ8vAYer
 evU7tgGzFOPcgP8LZt+tTIg+3aHss/NbCFf1PfAQxI6nu7nNRRhE3hTA2YRs4x0QpXWJ
 xMQw==
X-Gm-Message-State: AOAM533Rh5uz/p7KDUxWMJHA6FcKPNAj54eh7cSv6gzh/ttyhZeuwdSk
 SVwAZxrrsPXaJBaxOiV02SGTgA==
X-Received: by 2002:aa7:84c7:0:b029:259:d7ed:a8dd with SMTP id
 x7-20020aa784c70000b0290259d7eda8ddmr5030310pfn.20.1618607034253; 
 Fri, 16 Apr 2021 14:03:54 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m9sm5766734pgt.65.2021.04.16.14.03.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:03:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 42/81] target/arm: Implement SVE2 HISTCNT, HISTSEG
Date: Fri, 16 Apr 2021 14:02:01 -0700
Message-Id: <20210416210240.1591291-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
X-TUID: n5kGPLx8OCeB

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
index 12acc4fb0b..8d002fdb65 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -7062,3 +7062,134 @@ DO_PPZZ_MATCH(sve2_nmatch_ppzz_b, MO_8, true)
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
index 49d7a45a50..0cbca8d715 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7504,6 +7504,25 @@ static bool trans_##NAME(DisasContext *s, arg_rprr_esz *a)                  \
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

