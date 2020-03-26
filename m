Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2511099lfi;
        Thu, 26 Mar 2020 16:18:56 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtZhdfyCejHNuan16UJbPhixiyxAbpJvbk2yGxylvwsVwUBj6Mi92xTnge+r6jGfXr3dBsB
X-Received: by 2002:ac8:2a8d:: with SMTP id b13mr10957465qta.90.1585264736725;
        Thu, 26 Mar 2020 16:18:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585264736; cv=none;
        d=google.com; s=arc-20160816;
        b=K9/ElMY+NWnC1Wuah0nxYAcrkaIcaOInHSgsnWIukPgnAYOqEHaDnCe5ySJBGTKTVx
         DLJDvPEp1u+MnOXXkdsWbvHQv8eo1jp8Uh25OZ4bryUHRpn9WGw5r1Z7lQxcWDB73kOI
         C9RSjLXvauMgI0WlbdHPmZ+cP7hSzhM0cAS/s6YTUFNpBayJCsrZt82+Q/lykm6m4+aS
         HkPu0hxLBWm4+LoP/8aatRaWHWelhlbU2/n/QIWH0W2m92ns5TrxzuzhZ6VFK4Jq511/
         SBEd9w7kBbPXOGeeD+RWzJFgGUXebemUxY7xXAwUQ9Umv2mc76mGISdkflGfhcDyFCbC
         4RMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=LQixDJy63XBgzN/Out1zz4zHKJbz7GOqSodi9xHGXHY=;
        b=ObtzxJpr9BqKYFyOAD/U25vv0IxqPOJXdaF6jhh1i6HEXd3cvM+STU3T932uWEsPz9
         blSf1JsPU/kryp5bbQZlKD60NAjz7dVrvT/EHrBvHAPVkENE33f40a63d3vj89zjmUQA
         GNlS848dTivO+jLxAX0JSV0a4108Y9EN/6SlCisiZLHKSJouYINgC7ElpANJDyDx4kmv
         1sRN9u6gh/kPoce75XSUKABmoJSfp0t5y90NdiwZUI40jITEILHui4Bimh5tLPwgvemK
         trh3ddn1uMmv8xcof/KFpR2ZqDhMy5kKqM0bVm1T9OR/cYNcmufZ5Lp762rLqVuQLH4P
         qFKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yw8hGYah;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n8si2214639qvq.22.2020.03.26.16.18.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Mar 2020 16:18:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yw8hGYah;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jHbm4-0001Y8-1b
	for alex.bennee@linaro.org; Thu, 26 Mar 2020 19:18:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59034)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jHbcc-0002oh-LY
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 19:09:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jHbca-0001m8-52
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 19:09:09 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:46014)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jHbcZ-0001kz-Up
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 19:09:08 -0400
Received: by mail-pl1-x644.google.com with SMTP id b9so2725359pls.12
 for <qemu-arm@nongnu.org>; Thu, 26 Mar 2020 16:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LQixDJy63XBgzN/Out1zz4zHKJbz7GOqSodi9xHGXHY=;
 b=yw8hGYahmmK5OWDdb+aXE7qdpyChrE6WKdynmHRx10QCfxGN12pxCrUM3xOHoJHocf
 IT4y1kaUnMJ9dew4pZAMz2N4TM1EZtNZzbQVsqnmOWd/YcZlllzjUD0u79NNuflhLka4
 GAJJvIIgOp+2EXGxCpzPDpXU1YG9hDIQf1zIXrSjtWXgUr3s/KJUfzv62KdgIaWgIxbB
 AXueFc4VMn5nFMMqiMwRGgxJMcvTaqdzZop4M+jQm8b0SQPw9BbDU9rqA7NVmQ66FViq
 Ozrw0/LOXg4KNlMd3HPnfgK0x3cyWmHMvdYdjDaljHPuWo1y3DP1GMbFmFF4rqR29OO9
 sNVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LQixDJy63XBgzN/Out1zz4zHKJbz7GOqSodi9xHGXHY=;
 b=qYnGXorYyRessDMNDsS4KRBaAwXZGlWYdCBS55lGxe57sp2LRaFjDqEki4LfFkswtQ
 jdMw4OR0qN494sglc5ttE8KXgyiBmt820BGPzN2zkJYGjhlhkcyU9E1cty4iL5MzjGu/
 lKCzptjZqNSZAFmmBT2ZxaT28xSzHYEnD+/GtNA3qq5CVOgoEFMu2dZQ9txx5f+YOjgd
 m6VKLpNNZJqKfg0BAfnh8yoJRjbC8bWm2T3ryR2Kc+BfSl70/5iycqgCG80bdf4kbrF2
 rnC84hp12HxL6xJb6UW2ggT5efpbTrwMH91wn0Xkx8jnJiWjjo3dPTz9FY5HoHqCgrFh
 yOyA==
X-Gm-Message-State: ANhLgQ0uBAm98zqX0aeKcqCfXwC50B0BFeBtM7NwCqqFK5EqPRg7VRe4
 +pBNRvw4FIxawkI2JNV1DvKvCcKkK+c=
X-Received: by 2002:a17:90a:2103:: with SMTP id
 a3mr2604118pje.181.1585264147049; 
 Thu, 26 Mar 2020 16:09:07 -0700 (PDT)
Received: from localhost.localdomain (174-21-138-234.tukw.qwest.net.
 [174.21.138.234])
 by smtp.gmail.com with ESMTPSA id i187sm2530037pfg.33.2020.03.26.16.09.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 16:09:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 21/31] target/arm: Implement SVE2 integer absolute difference
 and accumulate long
Date: Thu, 26 Mar 2020 16:08:28 -0700
Message-Id: <20200326230838.31112-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200326230838.31112-1-richard.henderson@linaro.org>
References: <20200326230838.31112-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
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
Cc: rajav@quicinc.com, qemu-arm@nongnu.org, apazos@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rmsDl3BplGsL

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 14 ++++++++++
 target/arm/sve.decode      | 12 +++++++++
 target/arm/sve_helper.c    | 24 +++++++++++++++++
 target/arm/translate-sve.c | 54 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 104 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 0e4b4c48da..b48a88135f 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2410,3 +2410,17 @@ DEF_HELPER_FLAGS_4(sve2_sqcadd_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_sqcadd_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_sqcadd_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_sqcadd_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_sabal_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sabal_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sabal_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_uabal_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uabal_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uabal_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 5fb4b5f977..f66a6c242f 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -70,6 +70,7 @@
 &rpr_s          rd pg rn s
 &rprr_s         rd pg rn rm s
 &rprr_esz       rd pg rn rm esz
+&rrrr_esz       rd ra rn rm esz
 &rprrr_esz      rd pg rn rm ra esz
 &rpri_esz       rd pg rn imm esz
 &ptrue          rd esz pat s
@@ -120,6 +121,10 @@
 @rdn_i8s        ........ esz:2 ...... ... imm:s8 rd:5 \
                 &rri_esz rn=%reg_movprfx
 
+# Four operand, vector element size
+@rda_rn_rm      ........ esz:2 . rm:5 ... ... rn:5 rd:5 \
+                &rrrr_esz ra=%reg_movprfx
+
 # Three operand with "memory" size, aka immediate left shift
 @rd_rn_msz_rm   ........ ... rm:5 .... imm:2 rn:5 rd:5          &rrri
 
@@ -1235,3 +1240,10 @@ CADD_rot90      01000101 .. 00000 0 11011 0 ..... .....  @rdn_rm
 CADD_rot270     01000101 .. 00000 0 11011 1 ..... .....  @rdn_rm
 SQCADD_rot90    01000101 .. 00000 1 11011 0 ..... .....  @rdn_rm
 SQCADD_rot270   01000101 .. 00000 1 11011 1 ..... .....  @rdn_rm
+
+## SVE2 integer absolute difference and accumulate long
+
+SABALB          01000101 .. 0 ..... 1100 00 ..... .....  @rda_rn_rm
+SABALT          01000101 .. 0 ..... 1100 01 ..... .....  @rda_rn_rm
+UABALB          01000101 .. 0 ..... 1100 10 ..... .....  @rda_rn_rm
+UABALT          01000101 .. 0 ..... 1100 11 ..... .....  @rda_rn_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index a3653007ac..a0995d95c7 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1216,6 +1216,30 @@ DO_ZZZ_NTB(sve2_eoril_d, uint64_t,     , DO_EOR)
 
 #undef DO_ZZZ_NTB
 
+#define DO_ABAL(NAME, TYPE, TYPEN) \
+void HELPER(NAME)(void *vd, void *va, void *vn, void *vm, uint32_t desc) \
+{                                                              \
+    intptr_t i, opr_sz = simd_oprsz(desc);                     \
+    int sel1 = (simd_data(desc) & 1) * sizeof(TYPE);           \
+    int sel2 = (simd_data(desc) & 2) * (sizeof(TYPE) / 2);     \
+    for (i = 0; i < opr_sz; i += sizeof(TYPE)) {               \
+        TYPE nn = (TYPEN)(*(TYPE *)(vn + i) >> sel1);          \
+        TYPE mm = (TYPEN)(*(TYPE *)(vm + i) >> sel2);          \
+        TYPE aa = *(TYPE *)(va + i);                           \
+        *(TYPE *)(vd + i) = DO_ABD(nn, mm) + aa;               \
+    }                                                          \
+}
+
+DO_ABAL(sve2_sabal_h, int16_t, int8_t)
+DO_ABAL(sve2_sabal_s, int32_t, int16_t)
+DO_ABAL(sve2_sabal_d, int64_t, int32_t)
+
+DO_ABAL(sve2_uabal_h, uint16_t, uint8_t)
+DO_ABAL(sve2_uabal_s, uint32_t, uint16_t)
+DO_ABAL(sve2_uabal_d, uint64_t, uint32_t)
+
+#undef DO_ABAL
+
 #define DO_BITPERM(NAME, TYPE, OP) \
 void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc) \
 {                                                              \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 3b0aa86e79..c6161d2ce2 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6240,3 +6240,57 @@ static bool trans_SQCADD_rot270(DisasContext *s, arg_rrr_esz *a)
 {
     return do_cadd(s, a, true, true);
 }
+
+static bool do_sve2_zzzz_ool(DisasContext *s, arg_rrrr_esz *a,
+                             gen_helper_gvec_4 *fn, int data)
+{
+    if (fn == NULL || !dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_4_ool(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->ra),
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           vsz, vsz, data, fn);
+    }
+    return true;
+}
+
+static bool do_abal(DisasContext *s, arg_rrrr_esz *a, bool uns, bool sel)
+{
+    static gen_helper_gvec_4 * const fns[2][3] = {
+        { gen_helper_sve2_sabal_h,
+          gen_helper_sve2_sabal_s,
+          gen_helper_sve2_sabal_d },
+        { gen_helper_sve2_uabal_h,
+          gen_helper_sve2_uabal_s,
+          gen_helper_sve2_uabal_d },
+    };
+
+    if (a->esz == 0) {
+        return false;
+    }
+    return do_sve2_zzzz_ool(s, a, fns[uns][a->esz - 1], sel);
+}
+
+static bool trans_SABALB(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_abal(s, a, false, false);
+}
+
+static bool trans_SABALT(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_abal(s, a, false, true);
+}
+
+static bool trans_UABALB(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_abal(s, a, true, false);
+}
+
+static bool trans_UABALT(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_abal(s, a, true, true);
+}
-- 
2.20.1

