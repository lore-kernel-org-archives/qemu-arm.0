Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1271531lfm;
        Wed, 17 Jun 2020 21:47:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyc9S4Ewf89V2cNnISAIaZ6d2otjRqZocaR4gedwyRc+0CmKLzsrGGzGmfXSPREF7Y94xUp
X-Received: by 2002:a25:ad5a:: with SMTP id l26mr3560201ybe.188.1592455653700;
        Wed, 17 Jun 2020 21:47:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592455653; cv=none;
        d=google.com; s=arc-20160816;
        b=QTaBSaqktp+0NQhExC/IWya9frcAO0IMtqdTDlLapIThF6XguGJfoWpy7Zd0dRYkAg
         a+l49TeAHcQvrG11YPQxCRGNshJ9PGxaa/u3iSetYQ3YwulAVf9q6WygZzag3RUV2Jh7
         hP+K68yPB+FvFojbCVWdXPyaQiSYdgU2Ge5AKlX9XZsIOnfmq9ykam7utcFWiDPFK8E9
         z21SrOgGMFno8Gz2hl23EAh2B2cTfmpcwg2bXptGV6iVaxXJYWsI34Ja/KtiLto0vDbm
         kgedzCl+TOtfuKnyE6iXP/pUUpJJh3C+AYI2SKn4Faoae9o7grzvG+th0/ibLOKVZCMb
         h0mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=HTjWdhyxILVyUOnWkvtgWk12l4ylfQWOC8JyPWdgc6A=;
        b=GI4r+1h4GWEWmlHiDNCaIH4rlwZiS2bmtCRyjkgAPwFYSeoeoZnDjQxI1IGyrsEi7J
         ZEyssm0FFeCW5x1LPYBXhwZeSQVTcONoGV4vGzr1Ttq8/gL1ESG7yFSQKwhD6YEk7l4K
         xJQFqg95y23KKE5QOoOs92hfoGZQQ/2eXZav6fI/UAZyQ5wzKqOXMyWJYCgpw8SRG3pI
         JbOrIyq7dJVACqjd2cPAOKPmOeKUBop8w4BNHnnM+99WICP1PFhG/XhVQ6nn40nxrxlY
         xxYVhys3BIWHu9jFDJnebUtFQHxulLhH4HuY7lhghXt9kYP6tk+OAeDzS9VTuEPh/8Kd
         XsQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UY9u9v7P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71si1640173ybe.370.2020.06.17.21.47.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 21:47:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UY9u9v7P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlmSb-0000Fm-2B
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 00:47:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmAl-0006FJ-Ki
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:29:07 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:38905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmAi-0002pA-9D
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:29:07 -0400
Received: by mail-pf1-x42a.google.com with SMTP id x207so2199624pfc.5
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 21:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HTjWdhyxILVyUOnWkvtgWk12l4ylfQWOC8JyPWdgc6A=;
 b=UY9u9v7PFLXugBZVcBMIpiBIWCoxEiR+ErbbIPgep/FQRi27wWGeV18WxPHvy+ltq7
 KzHCxQN9CSfCSHeZYZmnukRsQLMTHiku8UAE0hV2vB3kZ2g5mCHKgNDy7MQniesYzebk
 M72w17fWaqqwYgtyEk5tvzr4vMXjI5uvYLStUcDSA4vqq+ZDPDkBJxP4FcFqdwML8X3g
 96ADGBkY3t97puaynX+4dB1CPNu5Uul8x+fz+qBkSJDJJ/Q2nQ9HotSL+8BtleUP+ipk
 mD6mheb5uZ4c43VoB5+iy4+fwRo6rMl0L8k4TfY9usybIVoc75KAIH5VuQwi5vhBP+od
 JmnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HTjWdhyxILVyUOnWkvtgWk12l4ylfQWOC8JyPWdgc6A=;
 b=inLIXzxqYVyTGxdWRdSJWeksjrZcwQNdIG+02oswEsFxNWV8cc4XnuHLs2Ot1GFe8g
 ksw1NG4/t3q69vZo+FRaqVqBOhvKOhRPef5vmOFazVlhS5SdZb5D+HSE8AbdVFH8y8pN
 fYt2kDUo8emm0QUgY7EsvXln0O4rUcxEB64Zc93+Tya//3dxF84HldX0uS9s08SV6nWD
 D4t8g77iE/8Ovu26Wufd0yKVVStYHFKztcMwTAVk5MPCgnhG330SLqwk6AcpaUePTRoj
 ide54zgP+E0P7UFmzmR2VHPPCX2dR9v07VWNXxVBKeKKtJgk5XUWV4C36gqj6W/AfBkN
 prDw==
X-Gm-Message-State: AOAM532yLUtSzxLKrxBGuzr9d81CBVS6JVfZ1uE9gRLtfaRjfD3gYMPU
 XvFH9iLzTLjD9INDzfMcgkpzfHiJZNQ=
X-Received: by 2002:aa7:9af0:: with SMTP id y16mr1995139pfp.231.1592454542136; 
 Wed, 17 Jun 2020 21:29:02 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id mu17sm972324pjb.53.2020.06.17.21.29.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:29:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 033/100] target/arm: Implement SVE2 complex integer add
Date: Wed, 17 Jun 2020 21:25:37 -0700
Message-Id: <20200618042644.1685561-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7VIgyn4Kpgbd

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
index 1af6454228..4e5ee9a75c 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -1904,3 +1904,13 @@ DEF_HELPER_FLAGS_4(sve2_bgrp_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
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
index b316610bbb..655cb5c12f 100644
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
index bccadce451..2043084c0a 100644
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
index 510efde138..07948f5e63 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5851,3 +5851,34 @@ static bool trans_BGRP(DisasContext *s, arg_rrr_esz *a)
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

