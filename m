Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2512378lfi;
        Thu, 26 Mar 2020 16:20:22 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtvUlvmVENcKar9+IQ1NI1b1p0DY8Dl3d4aouLFpk57bF1K2nAKPIgEJbPEPT2ITrSZmZm7
X-Received: by 2002:a37:6356:: with SMTP id x83mr11403500qkb.339.1585264822684;
        Thu, 26 Mar 2020 16:20:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585264822; cv=none;
        d=google.com; s=arc-20160816;
        b=TJY6vjB1GUffWj8PBzHwGMXJwoMHDX7GaMLeBq7wCAhMyhcr/gD0sglCex6+8D2ElF
         X2DWH+iCvYxFAL2Q9MdpNSWWf0I0l3gcJZQeGn77czjyQ+4pxbzJeMGK0u2f7r2Lg9HD
         b9LEraXI4XelJz2MdX+ekCmtY3Ru+aLwo2lZZLh+uND/J16RLLjvnvRfz4R/fDBnwuj1
         hx9Sww5Ajyg+BDgFuD7ng4t8nd5tEyAeZMN+YQBkddH8xzPJH6FKDcxXN+a8Xyj52r8R
         b7jBNZb8b/c4lKh/m+rmGF00FinPIPwmBjEG8z3DTUE+8Flxizy6Y7wYCwWvd/7DNdxH
         ++pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=z4NXK1cCVKPNkZrtCQBn5TawdBNm+oJul6QWfWmZysk=;
        b=iIQQyzjZZZXYc1758tc0Vs3zm7beN8hspkiyhZo4Auz5YOHWolKmv1P4j8YGetOa3y
         6AWbCfn7V5nCRyxi5cJSQnrALGzUAkVmxm1mB72SfqqVzLyLDnntn9CNztYhq3e3jrdJ
         DaMeWUXMMbc4m5vUpAPIMt7BsS/2HON7Eovb8aL14GmxrtC3VIqG1guKfOAtVecVNxEd
         10Qs8VpEEBayobMc1yBeMZFKVhTlOzEj8sd0Z8xm5ynCL+FvEDqojWJOxk1pQ40zZ5Aj
         xCdjJWJAHDwSahh+fuCADd5CWywS/f2zxj91quZDdfmtyvwHbOksmjfhCsns5i4mZVOY
         mWOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=C3NYIsWk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v1si2286212qvz.8.2020.03.26.16.20.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Mar 2020 16:20:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=C3NYIsWk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jHbnR-0003Dz-5L
	for alex.bennee@linaro.org; Thu, 26 Mar 2020 19:20:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58933)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jHbca-0002ky-Ed
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 19:09:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jHbcZ-0001kH-0V
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 19:09:08 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:44148)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jHbcY-0001it-Q5
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 19:09:06 -0400
Received: by mail-pl1-x635.google.com with SMTP id h11so2724247plr.11
 for <qemu-arm@nongnu.org>; Thu, 26 Mar 2020 16:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z4NXK1cCVKPNkZrtCQBn5TawdBNm+oJul6QWfWmZysk=;
 b=C3NYIsWkK2jC2OBvctWMG4R9cQGXUIRJxoFtLMVH3vbR+h+iV5c2khBUZL/Kn/eJ6d
 Uy+SzmOgWiiZrmJVmlYfwN7jhg39GQNwq7r1ACRu12d57mQsJYLlctLt78shDvFEDkJr
 RjyvS23MCbQuegedqaSsTE2WB1VJDwV+Zk0oUjDYk/ZhnJ0uyQtvtCLun/H49Vtzm1Xn
 ZS2LIloP67Loxau11L8MLCg0o8LnIr6wm4ZZuLLHsEo3cidqSQsC5eTepvlWf/tXEoKT
 iZgsdkhIpgo15QUSUcKUEqywr1A2qUE1GOzRJhufvAQtGQ1Q02j37gVZGAUz6B1AD2nj
 iCaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z4NXK1cCVKPNkZrtCQBn5TawdBNm+oJul6QWfWmZysk=;
 b=Gq9KrRQMs1brAoRtMo2C0H2Qg0QE2tmaAnyguUWh7+vPe5ccTiaCZjyYP0cWlDWvrO
 ZB6u+lEjQ4hsB4iE1rVMR4zSvadIV5g5G+9CI3FJslDgFEPYQv/E9TeQ8xnT1t2QyGm2
 iqrfcK889sX1WIHDNGGs/+GrH5h7Rb1tj4ErnpkyNupkPym2CcngeWycsLssmPjffwoT
 HIJx7+CMh+BDfh8Rx+nr09v14eKiVxttqo1pE7icKid30SzDaMdj3pWVXh1mIK3mdHlG
 o3D2pnowiEZPhT0GfFpxbN4CJtYYKBgLp4FOi1DZ0CnyZutbLW/ZRWQY9lD2zXEyu4et
 oG7A==
X-Gm-Message-State: ANhLgQ1n6nNhM2KesVtXnrOtVO80cOOxUn0/0MaCCWuBoY5JIdm73045
 Jc4QCEF13Nyia//5EvpqduKYYQ==
X-Received: by 2002:a17:90a:cc14:: with SMTP id
 b20mr2714276pju.75.1585264145760; 
 Thu, 26 Mar 2020 16:09:05 -0700 (PDT)
Received: from localhost.localdomain (174-21-138-234.tukw.qwest.net.
 [174.21.138.234])
 by smtp.gmail.com with ESMTPSA id i187sm2530037pfg.33.2020.03.26.16.09.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 16:09:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/31] target/arm: Implement SVE2 complex integer add
Date: Thu, 26 Mar 2020 16:08:27 -0700
Message-Id: <20200326230838.31112-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200326230838.31112-1-richard.henderson@linaro.org>
References: <20200326230838.31112-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::635
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
X-TUID: iRKu674Ag1Hk

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 10 +++++++++
 target/arm/sve.decode      |  9 ++++++++
 target/arm/sve_helper.c    | 42 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 31 ++++++++++++++++++++++++++++
 4 files changed, 92 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 466b01986f..0e4b4c48da 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2400,3 +2400,13 @@ DEF_HELPER_FLAGS_4(sve2_bgrp_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
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
index ca60e9f2ce..5fb4b5f977 100644
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
index b5afa34efe..a3653007ac 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1289,6 +1289,48 @@ DO_BITPERM(sve2_bgrp_d, uint64_t, bitgroup)
 
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
+            acc_r = SUB_OP(acc_r, el2_i);                       \
+            acc_i = ADD_OP(acc_i, el2_r);                       \
+            *(TYPE *)(vd + H(i)) = acc_r;                       \
+            *(TYPE *)(vd + H(i + sizeof(TYPE))) = acc_i;        \
+        }                                                       \
+    } else {                                                    \
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
 #define DO_ZZI_SHLL(NAME, TYPE, TYPEN, OP) \
 void HELPER(NAME)(void *vd, void *vn, uint32_t desc)           \
 {                                                              \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 375b9dc983..3b0aa86e79 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6209,3 +6209,34 @@ static bool trans_BGRP(DisasContext *s, arg_rrr_esz *a)
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
2.20.1

