Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp735804lfr;
        Fri, 16 Apr 2021 14:19:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0Zc08BkGt/24M/He5kr5T5KEizPjHVy0agUAdVSXO6MnOdTpJSOVtMxFSaHUdriW6AvCY
X-Received: by 2002:a4a:e615:: with SMTP id f21mr4768054oot.41.1618607976544;
        Fri, 16 Apr 2021 14:19:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618607976; cv=none;
        d=google.com; s=arc-20160816;
        b=xaZYqs+lClQ4zcGm0t3WCRhjta+XaPpCD6z/7DdbQVUZfWxn/YeEdyMOClwWtL3Zir
         2yc33OCjc8bBOB5WPiuv9zx/sbT28DhkUVKvPLw+gGc7nmWCmA7BIQMXc83uypDVErrI
         DLNxgayre4Ti09UWa7+C1feiQxok/AVRRXCAnT/boczDbkJHUlZl9RINrqpjPGsgFyRb
         cIkCYwc37ZRLMqPGEdFBL+aMdbZRtDns30KaAyvntmF6iC9qXAxetXQk5/BNKUVE+OKH
         O8AoihqkchzxRiBHltJU+vChuxtLqgAootC3a8Dy/TYz8zu842mRWtySgXMT5lL9AltA
         Qtvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=xiy3OFu7y9n0lQLi1Ms0ijwf8zujYC8QTzkyT7iwC1M=;
        b=GwXItmHtgHLLo0EK/q2X/BrAku5AzC6pNKXJ0fUMAS8cYgExPf4aqg66IJi75BhuSt
         O6YieFNjAf2soh7Q5+8hH7JAHqqtn+sX+YJA3uLQcNS39OJt1PkwfaWNHEeIHdqblJ9H
         OXQLyrcZNyVEtyq6brW/3jEU/9Hdsim0vFMBz0UoiecenA6pR7uopFT5EVhRmKQStMvN
         fzxRHZ6fv9WMvSy3E7mlgcy6T9sOX+EWQ4jpegO1af6MbZwHqDoIRL4DnYg0+Lvy/LZO
         F9v4+Or43S3VLznY6WLrujwG+dnrNFs3c4OwpY/utfEi4bje6D98GxxU2UIkY26kcqTP
         pDZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kNmsoTcA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v18si6349700ott.217.2021.04.16.14.19.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 14:19:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kNmsoTcA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXVsF-0000jm-Oa
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 17:19:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVcJ-0004Hg-7Q
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:03:08 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:46900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVcD-00019G-SV
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:03:06 -0400
Received: by mail-pl1-x62a.google.com with SMTP id m18so12422484plc.13
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 14:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xiy3OFu7y9n0lQLi1Ms0ijwf8zujYC8QTzkyT7iwC1M=;
 b=kNmsoTcAACDKjdsKAZ6gNm2GZaIdOj0TUsAHTRFeEK2x2HVyg3VGHaurlQyQTghL3W
 g0FQw8KqyDt9vndbllchthlrAECn10frhsVQKBNpGosAvZ66qq3dh26b/ral7NBurP4O
 z+uBfuhz1hPvI04CEfPKO2cDB+3TFb2gRMPIduoIvxXosqaV9RcQLB40Donr9cmmni2Z
 IjwsDUKYMBF7n7JweM9NLP9HHJtxLAURnht+stqbJMhovqd93W6c+K2srK63LuYuPAEE
 ea0P7p8Nlrk9+ZXOzulIFw9ENt7yaV5hKMD8t38xmBCeyscrZT7lUL1EdLeOhMB2ysqh
 yFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xiy3OFu7y9n0lQLi1Ms0ijwf8zujYC8QTzkyT7iwC1M=;
 b=ouEIQRmc0U+mEMED2zwcgbVk3tKyxWI8w9aTD6ejXMIqULkbsOCST7CX0Q78ouzeZA
 y60op+Qz1a25lXqm09HavsrmMEnVxvSA3iCP4sTqpw6ix/FuQ9QzqdhjLoEJx1Zcpt/R
 Uz+7TIjRk0YD6zPs93aTE/eHKE0kgWpWxe7I3KKy8s+35V1C3oYYoiQaNPk7EYDNVTEh
 8EXreVZnblB6WkevUp2HYEBCFZUDbtOz2TUI9/9P2NvcZRkRbYT+1HITVg5xeCxDW+Mx
 oCA0wsHD9n5mNb+WGqj5Fojsh4kJUTx5JlL+Qm5CCyeYhQ2toxqZfREDARlZMNJDe0kG
 DKCA==
X-Gm-Message-State: AOAM532QCJQ+QggdvhK/Mkx7zgctO7eW6B1eL/2jsLaVghCH0mBL1BTK
 9JUIQhxUCfc0uheEQc9e2xp4mA==
X-Received: by 2002:a17:90b:30d2:: with SMTP id
 hi18mr11381556pjb.94.1618606980667; 
 Fri, 16 Apr 2021 14:03:00 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m15sm5920640pjz.36.2021.04.16.14.03.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:03:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 18/81] target/arm: Implement SVE2 complex integer add
Date: Fri, 16 Apr 2021 14:01:37 -0700
Message-Id: <20210416210240.1591291-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
X-TUID: 9mDqGq/nFfRk

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

