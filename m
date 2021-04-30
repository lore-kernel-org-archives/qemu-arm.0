Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp478493lfg;
        Fri, 30 Apr 2021 13:43:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGWkvMNY6nZuedO/C4wV8SipX8xPelOot9y2kZ6QQYmfmNy7lDMaMR3TaS50IooLu1Quna
X-Received: by 2002:a02:3712:: with SMTP id r18mr6712538jar.11.1619815408677;
        Fri, 30 Apr 2021 13:43:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619815408; cv=none;
        d=google.com; s=arc-20160816;
        b=H7md3pcJHgIo8CzN5i+idxzGcLKCerGtEfv2+rqBgVotS3pHQky4sefZWnMVOXNmoR
         SYIyZElEbcXoxeICICOMxyzElbFKOZoHFJFoVwVd9VAeTMq4J0uBxJnTvcC+vDAh4nAm
         e8op85gfsEHLzBpYR6bS/NW6FQaQizycBtmXyp2R2bJZkmyy3/dgg1B1CZjoii32UI5X
         y+K5rQYpnIYOWfaN/ogw2esKdU0DUFg1mmfihUp3qUCVX6hcFKbprAxd8tTmpZrXJ0YF
         XY44HbKQoVChGCscAbUbXxb/GAUu8LuUWQ9QlYjg5y3x63x9SX8ScN1cBXKdmDqi75oo
         9wKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=xiy3OFu7y9n0lQLi1Ms0ijwf8zujYC8QTzkyT7iwC1M=;
        b=VgLFD/Ec0/YdKc9lr4MwWty5k8Q+ycHcXH/DvBPDJ+ggX56o+gVGimX2NdkaXhjIG0
         dLMjJ8GBjoCAKFb4iSIPdPBOcTQK7IaoWhYoiofxEaD3258S+sX8yHumQyB0hq7wrBFM
         8MIosUudOZ84bSClJIPJpZSZLx8bKeOhmHqHllks0lNbawAJdrN+9SYHVB8iycP2izkG
         pd070GCGkYA1cq91CNUsjwUJfgzAF21x4HCpuc4HJYcrRgF9WMlSE0PSOTUspyiuTKAa
         xdKutIhyPp2ST2ox6dYx4Br1VuA1a/BoAzI8a0I6GhMOoCjiRuOXW5dhWuaFi/wglMk9
         uq+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i2fK8Tjw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g1si3562915ila.101.2021.04.30.13.43.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 13:43:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i2fK8Tjw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcZyx-00032R-VQ
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 16:43:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZig-00006Z-L6
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:26:38 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:34431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZiR-00064m-I8
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:26:38 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 t2-20020a17090a0242b0290155433387beso7264724pje.1
 for <qemu-arm@nongnu.org>; Fri, 30 Apr 2021 13:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xiy3OFu7y9n0lQLi1Ms0ijwf8zujYC8QTzkyT7iwC1M=;
 b=i2fK8TjwP6uYbhNmwc5I6y/pgBRv9UunHbJ/uw6M59HLSl8TA4ueHyB133fvFF8rOl
 pNm1tgr6FOhLg8tgPDXUn3v4I5JgkJS2fXgxgWFo1MWgBY+XFWIwMDMeha7SfndOs1w9
 YaAbXjjvD5v8qANRGwKHMyV5EH5IqFQeec4ez4j0ljGti2ZAlLnvf8tk32g8py4wc6nF
 ybNwR2BZqjkzOA/yLhUEVnTbPjHLJkhC4HsSjhtACmsDtgcg2kwP63+z/FqOJoW0qERm
 wICM0qtsbMg3XY6VOyMuLI1lz01tIwjShxNx0ZZkCNdrwTT1KxEAd1hfbDmMONvy3znw
 ix8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xiy3OFu7y9n0lQLi1Ms0ijwf8zujYC8QTzkyT7iwC1M=;
 b=cCnuS1Lk7lk55wnsqHTSzjQxl7q8LcVDHbRow+itWO9qu6OoNzJv7hwgcdMWXTCXuT
 GN4bq+V/P9Tp3TVsakdyn3nduGiO6G/LvWebwZKn1eoIlk1vq18oO2FiqTlZkyp6+bH0
 TWSEcAAetEdvt16xR1f68Cz5riKZYjILHFL7aIi/pKRDm3OfNCb9bLzDq8pmFviqx3UF
 YQyJBOmXW4K9lWXSmNqyPw7gZBpgd9O9K4Z4Ji8wBxwMePjyiyFZ27aMgO7T6zW9TaTw
 umA2PBdCio0qtBzRhfJXfXPBYou85wzlVFGS3ZdpTgAvX7zlWA6F4/dxb3R6biee/t1K
 SZ3w==
X-Gm-Message-State: AOAM532HGsHQgCDT79I7BI8rH47mbNaNGu+bpvDVPhToZCuEZCADvjzt
 o1dWuY0X+WNYlCCBPk4uf4Ez3aTRdywIUw==
X-Received: by 2002:a17:902:ed52:b029:ed:2f0e:eac with SMTP id
 y18-20020a170902ed52b02900ed2f0e0eacmr7107370plb.47.1619814382059; 
 Fri, 30 Apr 2021 13:26:22 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e6sm2905257pfd.219.2021.04.30.13.26.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:26:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 18/82] target/arm: Implement SVE2 complex integer add
Date: Fri, 30 Apr 2021 13:25:06 -0700
Message-Id: <20210430202610.1136687-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: Mfoeoug6fLfk

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Fix subtraction ordering (laurent desnogues).
---
 target/arm/helper-sve.h    | 10 +++++++++
 target/arm/sve.decode      |  9 ++++++++
 target/arm/sve_helper.c    | 42 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 31 ++++++++++++++++++++++++++++
 4 files changed, 92 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 4861481fe0..c2155cc544 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2392,3 +2392,13 @@ DEF_HELPER_FLAGS_4(sve2_bgrp_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_bgrp_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_bgrp_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_bgrp_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_cadd_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_cadd_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_cadd_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_cadd_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_sqcadd_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqcadd_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqcadd_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqcadd_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 7cb89a0d47..7508b901d0 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1226,3 +1226,12 @@ EORTB           01000101 .. 0 ..... 10010 1 ..... .....  @rd_rn_rm
 BEXT            01000101 .. 0 ..... 1011 00 ..... .....  @rd_rn_rm
 BDEP            01000101 .. 0 ..... 1011 01 ..... .....  @rd_rn_rm
 BGRP            01000101 .. 0 ..... 1011 10 ..... .....  @rd_rn_rm
+
+#### SVE2 Accumulate
+
+## SVE2 complex integer add
+
+CADD_rot90      01000101 .. 00000 0 11011 0 ..... .....  @rdn_rm
+CADD_rot270     01000101 .. 00000 0 11011 1 ..... .....  @rdn_rm
+SQCADD_rot90    01000101 .. 00000 1 11011 0 ..... .....  @rdn_rm
+SQCADD_rot270   01000101 .. 00000 1 11011 1 ..... .....  @rdn_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index d692d2fe3d..2e09c3e55b 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1314,6 +1314,48 @@ DO_BITPERM(sve2_bgrp_d, uint64_t, bitgroup)
 
 #undef DO_BITPERM
 
+#define DO_CADD(NAME, TYPE, H, ADD_OP, SUB_OP)                  \
+void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)  \
+{                                                               \
+    intptr_t i, opr_sz = simd_oprsz(desc);                      \
+    int sub_r = simd_data(desc);                                \
+    if (sub_r) {                                                \
+        for (i = 0; i < opr_sz; i += 2 * sizeof(TYPE)) {        \
+            TYPE acc_r = *(TYPE *)(vn + H(i));                  \
+            TYPE acc_i = *(TYPE *)(vn + H(i + sizeof(TYPE)));   \
+            TYPE el2_r = *(TYPE *)(vm + H(i));                  \
+            TYPE el2_i = *(TYPE *)(vm + H(i + sizeof(TYPE)));   \
+            acc_r = ADD_OP(acc_r, el2_i);                       \
+            acc_i = SUB_OP(acc_i, el2_r);                       \
+            *(TYPE *)(vd + H(i)) = acc_r;                       \
+            *(TYPE *)(vd + H(i + sizeof(TYPE))) = acc_i;        \
+        }                                                       \
+    } else {                                                    \
+        for (i = 0; i < opr_sz; i += 2 * sizeof(TYPE)) {        \
+            TYPE acc_r = *(TYPE *)(vn + H(i));                  \
+            TYPE acc_i = *(TYPE *)(vn + H(i + sizeof(TYPE)));   \
+            TYPE el2_r = *(TYPE *)(vm + H(i));                  \
+            TYPE el2_i = *(TYPE *)(vm + H(i + sizeof(TYPE)));   \
+            acc_r = SUB_OP(acc_r, el2_i);                       \
+            acc_i = ADD_OP(acc_i, el2_r);                       \
+            *(TYPE *)(vd + H(i)) = acc_r;                       \
+            *(TYPE *)(vd + H(i + sizeof(TYPE))) = acc_i;        \
+        }                                                       \
+    }                                                           \
+}
+
+DO_CADD(sve2_cadd_b, int8_t, H1, DO_ADD, DO_SUB)
+DO_CADD(sve2_cadd_h, int16_t, H1_2, DO_ADD, DO_SUB)
+DO_CADD(sve2_cadd_s, int32_t, H1_4, DO_ADD, DO_SUB)
+DO_CADD(sve2_cadd_d, int64_t,     , DO_ADD, DO_SUB)
+
+DO_CADD(sve2_sqcadd_b, int8_t, H1, DO_SQADD_B, DO_SQSUB_B)
+DO_CADD(sve2_sqcadd_h, int16_t, H1_2, DO_SQADD_H, DO_SQSUB_H)
+DO_CADD(sve2_sqcadd_s, int32_t, H1_4, DO_SQADD_S, DO_SQSUB_S)
+DO_CADD(sve2_sqcadd_d, int64_t,     , do_sqadd_d, do_sqsub_d)
+
+#undef DO_CADD
+
 #define DO_ZZI_SHLL(NAME, TYPEW, TYPEN, HW, HN) \
 void HELPER(NAME)(void *vd, void *vn, uint32_t desc)           \
 {                                                              \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index da2f67fb67..c594c59954 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6285,3 +6285,34 @@ static bool trans_BGRP(DisasContext *s, arg_rrr_esz *a)
     }
     return do_sve2_zzw_ool(s, a, fns[a->esz], 0);
 }
+
+static bool do_cadd(DisasContext *s, arg_rrr_esz *a, bool sq, bool rot)
+{
+    static gen_helper_gvec_3 * const fns[2][4] = {
+        { gen_helper_sve2_cadd_b, gen_helper_sve2_cadd_h,
+          gen_helper_sve2_cadd_s, gen_helper_sve2_cadd_d },
+        { gen_helper_sve2_sqcadd_b, gen_helper_sve2_sqcadd_h,
+          gen_helper_sve2_sqcadd_s, gen_helper_sve2_sqcadd_d },
+    };
+    return do_sve2_zzw_ool(s, a, fns[sq][a->esz], rot);
+}
+
+static bool trans_CADD_rot90(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_cadd(s, a, false, false);
+}
+
+static bool trans_CADD_rot270(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_cadd(s, a, false, true);
+}
+
+static bool trans_SQCADD_rot90(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_cadd(s, a, true, false);
+}
+
+static bool trans_SQCADD_rot270(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_cadd(s, a, true, true);
+}
-- 
2.25.1

