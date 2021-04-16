Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp732746lfr;
        Fri, 16 Apr 2021 14:14:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGnGO3KJgVZz3wF7RsaGilOhxdWAGmuzWLiM536rIy+Zal44tzcOGui835iVqrOeY4ZYnh
X-Received: by 2002:a05:6808:8ec:: with SMTP id d12mr8019926oic.88.1618607677358;
        Fri, 16 Apr 2021 14:14:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618607677; cv=none;
        d=google.com; s=arc-20160816;
        b=GN/2gWaBtotS3oeYKzrBeilO744Plp1ukgz7KX0scJbxu2gjMvqHmZVJyTtqxd0eRV
         ZcTEQzV1JVuHg+8eQ+2ZWEra4pA3p3jpE1TdvSlF86O5bbZmMv91wpkSmgWUJ6quf4+F
         4NIeLhUG8tJ8Vp2oEoqBBkAjfgqz5/CBWVPBkLWbBOoEDWNCFuyQsiZ2Ljgfd+FOuSJQ
         zp3FZwQzhXEPhi/ai0+q2LX3nRmMBOvhqlVW4aB8/OTFbUFxu5byk/v6NMzSQFT300C/
         dTs9pqk8I1cN0XCQYFvtGzZ5hHIUIq1viXg1h0x79D9Xfihx8KqpSO4tzgkrqTpu1V6A
         UhgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=85QbQRD/kjbvj7H0EZGYuJDct9yXvao73Ho7HNCSiAg=;
        b=YBm9bsQDDmpj0W7krkEEwxz2zEEFrBUdVoZNhR6s1A8QLVA9ntssr8bDu0cs9lTmTZ
         cJfjeihDMQh7OnqMFXFm/JwBnchBkhRnbmqi54QBvCq5TyLXjOT3umuNP2wSD0yigEWK
         Zpoyoae8gYaTah08/h+yOVUCg7InJlFUc2GEMwszFNd5xpdsWi1Zu5IfbSh5pwkj5xQa
         lz2fe7+6mlsMxVqYqU8fAgZqlR8t5FelR9HECYNQDs3e+3/8c990b21yJGybSnOiPQF+
         EaREbRHyKIaLhcE0DRiKT+ZafWWSvHAIhDPtCXq8z50JePOIp/4HLXUvYKu63phzeo6F
         lqeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dB2nrpjp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y196si6852800ooa.49.2021.04.16.14.14.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 14:14:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dB2nrpjp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXVnQ-0003A4-Lj
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 17:14:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVcJ-0004Hq-Uw
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:03:08 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:46901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVcE-00019U-MV
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:03:07 -0400
Received: by mail-pl1-x62b.google.com with SMTP id m18so12422494plc.13
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 14:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=85QbQRD/kjbvj7H0EZGYuJDct9yXvao73Ho7HNCSiAg=;
 b=dB2nrpjpzc8xfJX6KiZBECsWMbsMCTeNbShf1Sc+Dla851M7HXlK9rwET6ng9eONAU
 Ax7smG49YOZPw9eg3d7CDzJpD4zWXOFXBxiAtGEDqHEwZkBL8sWXXXOQF5GXKyUNIxvb
 f5QCy3xSYxT4CJARQEI4/Puw6X/GUL9gYG6X+Ov8ZxoUGAb920Asx3kZ5D7j1D9EutfS
 R2BKsJoGEw4WWLdHOPM+xUKorCK6jWkZSKEIhL9b5FpEzbt4DuOaFcW/H2XVHoUrvdYh
 aPTSy2rfaIzzZRUmsP3v9lsnuMwGyGDRyIGIo9wtAOdwsQEmrfn+mxpd3wjcZHgd2EMJ
 rWmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=85QbQRD/kjbvj7H0EZGYuJDct9yXvao73Ho7HNCSiAg=;
 b=OhwWzhw/+9QoCQ3sIERZr6qIn4RbXeTXS1jECgnO+wzDTldvbQTDrguovHpr0aG+Qx
 G7uu7CEBb8bfrlpKnOKvSYCOhRxdUsui9J+bMzHxV40nBjgJSWIbu+ku/vswHAxcnslu
 zhBhe6b61SzfcwEM4iAFqYyEjDiJipMmUFYpTvP345NZn7SiEoTKbSPILgUXcr5m86it
 d5QSm+XCIKXmV4fqYWTIAy7xlHlHrnHnf+onPAhJG7dScE0K188RfGkVbD+AIeA29xmy
 AEx7zKpeITHoVSuMbIOtzGV51X3ou5592X3ZoU5UZSw0mTLi+JSkdAra71nZONeqhbun
 +FoQ==
X-Gm-Message-State: AOAM532Qf6ecBwtruFRm0lUHZbavgj89/rcLTDYT7MF7gIrqhAcjZzO4
 dK7ky6EZ2XcO6JSNIHwSE0xLSQ==
X-Received: by 2002:a17:90a:fb89:: with SMTP id
 cp9mr11358074pjb.47.1618606981511; 
 Fri, 16 Apr 2021 14:03:01 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m15sm5920640pjz.36.2021.04.16.14.03.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:03:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 19/81] target/arm: Implement SVE2 integer absolute
 difference and accumulate long
Date: Fri, 16 Apr 2021 14:01:38 -0700
Message-Id: <20210416210240.1591291-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Hd7hz8y5n7Ov

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Fix select offsetting and argument order (laurent desnogues).
---
 target/arm/helper-sve.h    | 14 ++++++++++
 target/arm/sve.decode      | 12 +++++++++
 target/arm/sve_helper.c    | 23 ++++++++++++++++
 target/arm/translate-sve.c | 55 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 104 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index c2155cc544..229fb396b2 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2402,3 +2402,17 @@ DEF_HELPER_FLAGS_4(sve2_sqcadd_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
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
index 7508b901d0..56b7353bfa 100644
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
@@ -119,6 +120,10 @@
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
index 2e09c3e55b..4871e90d9b 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1241,6 +1241,29 @@ DO_ZZZ_NTB(sve2_eoril_d, uint64_t,     , DO_EOR)
 
 #undef DO_ZZZ_NTB
 
+#define DO_ZZZW_ACC(NAME, TYPEW, TYPEN, HW, HN, OP) \
+void HELPER(NAME)(void *vd, void *vn, void *vm, void *va, uint32_t desc) \
+{                                                               \
+    intptr_t i, opr_sz = simd_oprsz(desc);                      \
+    intptr_t sel1 = simd_data(desc) * sizeof(TYPEN);            \
+    for (i = 0; i < opr_sz; i += sizeof(TYPEW)) {               \
+        TYPEW nn = *(TYPEN *)(vn + HN(i + sel1));               \
+        TYPEW mm = *(TYPEN *)(vm + HN(i + sel1));               \
+        TYPEW aa = *(TYPEW *)(va + HW(i));                      \
+        *(TYPEW *)(vd + HW(i)) = OP(nn, mm) + aa;               \
+    }                                                           \
+}
+
+DO_ZZZW_ACC(sve2_sabal_h, int16_t, int8_t, H1_2, H1, DO_ABD)
+DO_ZZZW_ACC(sve2_sabal_s, int32_t, int16_t, H1_4, H1_2, DO_ABD)
+DO_ZZZW_ACC(sve2_sabal_d, int64_t, int32_t,     , H1_4, DO_ABD)
+
+DO_ZZZW_ACC(sve2_uabal_h, uint16_t, uint8_t, H1_2, H1, DO_ABD)
+DO_ZZZW_ACC(sve2_uabal_s, uint32_t, uint16_t, H1_4, H1_2, DO_ABD)
+DO_ZZZW_ACC(sve2_uabal_d, uint64_t, uint32_t,     , H1_4, DO_ABD)
+
+#undef DO_ZZZW_ACC
+
 #define DO_BITPERM(NAME, TYPE, OP) \
 void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc) \
 {                                                              \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index c594c59954..6ac50fd61f 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -163,6 +163,18 @@ static void gen_gvec_ool_zzz(DisasContext *s, gen_helper_gvec_3 *fn,
                        vsz, vsz, data, fn);
 }
 
+/* Invoke an out-of-line helper on 4 Zregs. */
+static void gen_gvec_ool_zzzz(DisasContext *s, gen_helper_gvec_4 *fn,
+                              int rd, int rn, int rm, int ra, int data)
+{
+    unsigned vsz = vec_full_reg_size(s);
+    tcg_gen_gvec_4_ool(vec_full_reg_offset(s, rd),
+                       vec_full_reg_offset(s, rn),
+                       vec_full_reg_offset(s, rm),
+                       vec_full_reg_offset(s, ra),
+                       vsz, vsz, data, fn);
+}
+
 /* Invoke an out-of-line helper on 2 Zregs and a predicate. */
 static void gen_gvec_ool_zzp(DisasContext *s, gen_helper_gvec_3 *fn,
                              int rd, int rn, int pg, int data)
@@ -6316,3 +6328,46 @@ static bool trans_SQCADD_rot270(DisasContext *s, arg_rrr_esz *a)
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
+        gen_gvec_ool_zzzz(s, fn, a->rd, a->rn, a->rm, a->ra, data);
+    }
+    return true;
+}
+
+static bool do_abal(DisasContext *s, arg_rrrr_esz *a, bool uns, bool sel)
+{
+    static gen_helper_gvec_4 * const fns[2][4] = {
+        { NULL,                    gen_helper_sve2_sabal_h,
+          gen_helper_sve2_sabal_s, gen_helper_sve2_sabal_d },
+        { NULL,                    gen_helper_sve2_uabal_h,
+          gen_helper_sve2_uabal_s, gen_helper_sve2_uabal_d },
+    };
+    return do_sve2_zzzz_ool(s, a, fns[uns][a->esz], sel);
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
2.25.1

