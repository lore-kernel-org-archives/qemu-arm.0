Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp482812lfg;
        Fri, 30 Apr 2021 13:49:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzoa8KmQlZgws17+AGGvm3YZh/sd8sf6sGX91lQg0fF5OXhsqyvkG177WowVDuKXKfQKY2A
X-Received: by 2002:a5d:8441:: with SMTP id w1mr5357950ior.210.1619815785737;
        Fri, 30 Apr 2021 13:49:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619815785; cv=none;
        d=google.com; s=arc-20160816;
        b=tU6zzGOyP78EtcLVSuMHl4GA9woel75yIzJekOlbpMauD6Rh1dHjS3bSyr8qFmvPSD
         SAGobIhnI5s+RRiYS2GvR96+B1UKI4NWmareh6zh1Gak7ngW2cDiDiYLwCOkhX2CbW4n
         YalSHYsSwa+antaOc5rLUtRcjr9DStEPrT84yGHM301QO1DuNZdE+uCoNj5SC9wqvZG5
         0aG/oP78EvXdlH+1CcGDFYuG2tMe6RUu4WnQFZdA0GQ6LGuqNiNGTzYvYg12UYdlx+EW
         jyGULC1vjT8jcHHBSwury51QSjWJPro3j+0BoXw0Y9vXPqYNKZVzFMLL9eUC2VIswhPw
         6o2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=feb7AjyBXXqqzvqsPRxefar5HpBH8rI+phXQIUCl9Ao=;
        b=rxewdOzSAX93xCs4hFPsfmwsCKYdQbr1u5Mfid0SNA8gcXEXZGrtdpfFg97nyf9m8Z
         0rvFw/+UDnY5kTgQ23OPbhy7WHboBXmvJrGUdxzW67Bfgb3gDl9+9PXR5Meyvps5Sgb2
         KTsVlu9cAeen6t7y+JPL9bsdG0f6SSmiBDWoFL1p87xOBOzSWWbrWEmT9GqBUCpNkLUC
         vz16sa8R0jkAqPswBaJZWD7seer3thErCIW4nmMHTQ9/bB302Pp+y2+6wi6V6atXkkzb
         Pquw2MXKveL6+hTI3m1s2EoEUKLjycMpOfczgPhHm4t/5/SBPnItJRe3DoktWe+U2meE
         t1pw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vCWnKAls;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y7si4414866ioc.1.2021.04.30.13.49.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 13:49:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vCWnKAls;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lca53-0001ck-0B
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 16:49:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZis-0000WW-O5
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:26:50 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:38603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZiY-00069Y-Mh
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:26:50 -0400
Received: by mail-pf1-x42a.google.com with SMTP id j6so9884680pfh.5
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 13:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=feb7AjyBXXqqzvqsPRxefar5HpBH8rI+phXQIUCl9Ao=;
 b=vCWnKAls7b/W4bfCsC8sjhELg8r8ooj75pioe37ycTv6j5sjHZGeuUI9tAODxCSqDJ
 pjr14SX/dBpdp6UdW7p+xcAOF4bkKszq2oRP7a1LzwnFZYmX6x5z8Uc9H9q2j1Xr2mcv
 pzQCQIwpD8cAOL72PkowvSW883uOFr00Cgz+tUaVc38bQrEvqIe4dg1dqi224r6w8kbG
 EP97Jj0ddJPQ0RuhA5zMM/omHKg9DAkeLw9iLSE4M4zzxo/UayeO3GZo8OyqEjmv2del
 sL10LE7jWLCvbtrNwtTg4t5mz4KoxX9hBnLVV2YK9H2IEQgrgVUdHZn5Rumn1OhKjZ0x
 +/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=feb7AjyBXXqqzvqsPRxefar5HpBH8rI+phXQIUCl9Ao=;
 b=brth5GdiTI81Vmuo3EoPVmHzU5VujxHtKwRcvntpBip93xkjsG0iveMquhMBfKkPqX
 dJnphHb/ECmw8QVgR3A+tva+KaciqCe14lGFOIRJPz8MdEyqE0R4cM9AcNGLwLGUqFVa
 NCtDeTWJIYtfqL9NMgAcln/6LGolRccfTeva/gFwayz9kUj3dLrzJIBolF6Go5WcJENv
 86gpb/KTeDS8h3hXEiKYKJYyEXlhi6GlpteRa0oKv7nXCOE4WPU6xbjwXRKqzhzGymtA
 cImxzBJ4xQe7iOL2JcoxTdT+NeVrDaesYVqJ3CwL9BBE67Ni6qktbL7t0Wi/s1K9phNm
 /b0A==
X-Gm-Message-State: AOAM5337kRsxgXwmKN2k2re/g5ydV8hnrDVLzvs7OmTDIRo/cfrZrA2/
 EVF/VA113lJAW411DJldj9fWMuXx7zk1Ag==
X-Received: by 2002:aa7:8198:0:b029:274:8a92:51b5 with SMTP id
 g24-20020aa781980000b02902748a9251b5mr6470090pfi.5.1619814389377; 
 Fri, 30 Apr 2021 13:26:29 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e6sm2905257pfd.219.2021.04.30.13.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:26:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 29/82] target/arm: Implement SVE2 SQSHRN, SQRSHRN
Date: Fri, 30 Apr 2021 13:25:17 -0700
Message-Id: <20210430202610.1136687-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FexjNm3jDIYl

This completes the section "SVE2 bitwise shift right narrow".

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  16 ++++++
 target/arm/sve.decode      |   4 ++
 target/arm/sve_helper.c    |  24 +++++++++
 target/arm/translate-sve.c | 105 +++++++++++++++++++++++++++++++++++++
 4 files changed, 149 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index ba6a24fc8b..1c7fe8e417 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2476,6 +2476,22 @@ DEF_HELPER_FLAGS_3(sve2_sqrshrunt_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_sqrshrunt_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_sqrshrunt_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_3(sve2_sqshrnb_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqshrnb_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqshrnb_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve2_sqshrnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqshrnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqshrnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve2_sqrshrnb_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqrshrnb_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqrshrnb_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve2_sqrshrnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqrshrnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqrshrnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_3(sve2_uqshrnb_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_uqshrnb_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_uqshrnb_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 13b5da0856..0674464695 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1296,6 +1296,10 @@ SHRNB           01000101 .. 1 ..... 00 0100 ..... .....  @rd_rn_tszimm_shr
 SHRNT           01000101 .. 1 ..... 00 0101 ..... .....  @rd_rn_tszimm_shr
 RSHRNB          01000101 .. 1 ..... 00 0110 ..... .....  @rd_rn_tszimm_shr
 RSHRNT          01000101 .. 1 ..... 00 0111 ..... .....  @rd_rn_tszimm_shr
+SQSHRNB         01000101 .. 1 ..... 00 1000 ..... .....  @rd_rn_tszimm_shr
+SQSHRNT         01000101 .. 1 ..... 00 1001 ..... .....  @rd_rn_tszimm_shr
+SQRSHRNB        01000101 .. 1 ..... 00 1010 ..... .....  @rd_rn_tszimm_shr
+SQRSHRNT        01000101 .. 1 ..... 00 1011 ..... .....  @rd_rn_tszimm_shr
 UQSHRNB         01000101 .. 1 ..... 00 1100 ..... .....  @rd_rn_tszimm_shr
 UQSHRNT         01000101 .. 1 ..... 00 1101 ..... .....  @rd_rn_tszimm_shr
 UQRSHRNB        01000101 .. 1 ..... 00 1110 ..... .....  @rd_rn_tszimm_shr
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 175f3de08f..02e87c535d 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1971,6 +1971,30 @@ DO_SHRNT(sve2_sqrshrunt_h, int16_t, uint8_t, H1_2, H1, DO_SQRSHRUN_H)
 DO_SHRNT(sve2_sqrshrunt_s, int32_t, uint16_t, H1_4, H1_2, DO_SQRSHRUN_S)
 DO_SHRNT(sve2_sqrshrunt_d, int64_t, uint32_t,     , H1_4, DO_SQRSHRUN_D)
 
+#define DO_SQSHRN_H(x, sh) do_sat_bhs(x >> sh, INT8_MIN, INT8_MAX)
+#define DO_SQSHRN_S(x, sh) do_sat_bhs(x >> sh, INT16_MIN, INT16_MAX)
+#define DO_SQSHRN_D(x, sh) do_sat_bhs(x >> sh, INT32_MIN, INT32_MAX)
+
+DO_SHRNB(sve2_sqshrnb_h, int16_t, uint8_t, DO_SQSHRN_H)
+DO_SHRNB(sve2_sqshrnb_s, int32_t, uint16_t, DO_SQSHRN_S)
+DO_SHRNB(sve2_sqshrnb_d, int64_t, uint32_t, DO_SQSHRN_D)
+
+DO_SHRNT(sve2_sqshrnt_h, int16_t, uint8_t, H1_2, H1, DO_SQSHRN_H)
+DO_SHRNT(sve2_sqshrnt_s, int32_t, uint16_t, H1_4, H1_2, DO_SQSHRN_S)
+DO_SHRNT(sve2_sqshrnt_d, int64_t, uint32_t,     , H1_4, DO_SQSHRN_D)
+
+#define DO_SQRSHRN_H(x, sh) do_sat_bhs(do_srshr(x, sh), INT8_MIN, INT8_MAX)
+#define DO_SQRSHRN_S(x, sh) do_sat_bhs(do_srshr(x, sh), INT16_MIN, INT16_MAX)
+#define DO_SQRSHRN_D(x, sh) do_sat_bhs(do_srshr(x, sh), INT32_MIN, INT32_MAX)
+
+DO_SHRNB(sve2_sqrshrnb_h, int16_t, uint8_t, DO_SQRSHRN_H)
+DO_SHRNB(sve2_sqrshrnb_s, int32_t, uint16_t, DO_SQRSHRN_S)
+DO_SHRNB(sve2_sqrshrnb_d, int64_t, uint32_t, DO_SQRSHRN_D)
+
+DO_SHRNT(sve2_sqrshrnt_h, int16_t, uint8_t, H1_2, H1, DO_SQRSHRN_H)
+DO_SHRNT(sve2_sqrshrnt_s, int32_t, uint16_t, H1_4, H1_2, DO_SQRSHRN_S)
+DO_SHRNT(sve2_sqrshrnt_d, int64_t, uint32_t,     , H1_4, DO_SQRSHRN_D)
+
 #define DO_UQSHRN_H(x, sh) MIN(x >> sh, UINT8_MAX)
 #define DO_UQSHRN_S(x, sh) MIN(x >> sh, UINT16_MAX)
 #define DO_UQSHRN_D(x, sh) MIN(x >> sh, UINT32_MAX)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 12733d9b4f..218f1ca5ce 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6956,6 +6956,111 @@ static bool trans_SQRSHRUNT(DisasContext *s, arg_rri_esz *a)
     return do_sve2_shr_narrow(s, a, ops);
 }
 
+static void gen_sqshrnb_vec(unsigned vece, TCGv_vec d,
+                            TCGv_vec n, int64_t shr)
+{
+    TCGv_vec t = tcg_temp_new_vec_matching(d);
+    int halfbits = 4 << vece;
+    int64_t max = MAKE_64BIT_MASK(0, halfbits - 1);
+    int64_t min = -max - 1;
+
+    tcg_gen_sari_vec(vece, n, n, shr);
+    tcg_gen_dupi_vec(vece, t, min);
+    tcg_gen_smax_vec(vece, n, n, t);
+    tcg_gen_dupi_vec(vece, t, max);
+    tcg_gen_smin_vec(vece, n, n, t);
+    tcg_gen_dupi_vec(vece, t, MAKE_64BIT_MASK(0, halfbits));
+    tcg_gen_and_vec(vece, d, n, t);
+    tcg_temp_free_vec(t);
+}
+
+static bool trans_SQSHRNB(DisasContext *s, arg_rri_esz *a)
+{
+    static const TCGOpcode vec_list[] = {
+        INDEX_op_sari_vec, INDEX_op_smax_vec, INDEX_op_smin_vec, 0
+    };
+    static const GVecGen2i ops[3] = {
+        { .fniv = gen_sqshrnb_vec,
+          .opt_opc = vec_list,
+          .fno = gen_helper_sve2_sqshrnb_h,
+          .vece = MO_16 },
+        { .fniv = gen_sqshrnb_vec,
+          .opt_opc = vec_list,
+          .fno = gen_helper_sve2_sqshrnb_s,
+          .vece = MO_32 },
+        { .fniv = gen_sqshrnb_vec,
+          .opt_opc = vec_list,
+          .fno = gen_helper_sve2_sqshrnb_d,
+          .vece = MO_64 },
+    };
+    return do_sve2_shr_narrow(s, a, ops);
+}
+
+static void gen_sqshrnt_vec(unsigned vece, TCGv_vec d,
+                             TCGv_vec n, int64_t shr)
+{
+    TCGv_vec t = tcg_temp_new_vec_matching(d);
+    int halfbits = 4 << vece;
+    int64_t max = MAKE_64BIT_MASK(0, halfbits - 1);
+    int64_t min = -max - 1;
+
+    tcg_gen_sari_vec(vece, n, n, shr);
+    tcg_gen_dupi_vec(vece, t, min);
+    tcg_gen_smax_vec(vece, n, n, t);
+    tcg_gen_dupi_vec(vece, t, max);
+    tcg_gen_smin_vec(vece, n, n, t);
+    tcg_gen_shli_vec(vece, n, n, halfbits);
+    tcg_gen_dupi_vec(vece, t, MAKE_64BIT_MASK(0, halfbits));
+    tcg_gen_bitsel_vec(vece, d, t, d, n);
+    tcg_temp_free_vec(t);
+}
+
+static bool trans_SQSHRNT(DisasContext *s, arg_rri_esz *a)
+{
+    static const TCGOpcode vec_list[] = {
+        INDEX_op_shli_vec, INDEX_op_sari_vec,
+        INDEX_op_smax_vec, INDEX_op_smin_vec, 0
+    };
+    static const GVecGen2i ops[3] = {
+        { .fniv = gen_sqshrnt_vec,
+          .opt_opc = vec_list,
+          .load_dest = true,
+          .fno = gen_helper_sve2_sqshrnt_h,
+          .vece = MO_16 },
+        { .fniv = gen_sqshrnt_vec,
+          .opt_opc = vec_list,
+          .load_dest = true,
+          .fno = gen_helper_sve2_sqshrnt_s,
+          .vece = MO_32 },
+        { .fniv = gen_sqshrnt_vec,
+          .opt_opc = vec_list,
+          .load_dest = true,
+          .fno = gen_helper_sve2_sqshrnt_d,
+          .vece = MO_64 },
+    };
+    return do_sve2_shr_narrow(s, a, ops);
+}
+
+static bool trans_SQRSHRNB(DisasContext *s, arg_rri_esz *a)
+{
+    static const GVecGen2i ops[3] = {
+        { .fno = gen_helper_sve2_sqrshrnb_h },
+        { .fno = gen_helper_sve2_sqrshrnb_s },
+        { .fno = gen_helper_sve2_sqrshrnb_d },
+    };
+    return do_sve2_shr_narrow(s, a, ops);
+}
+
+static bool trans_SQRSHRNT(DisasContext *s, arg_rri_esz *a)
+{
+    static const GVecGen2i ops[3] = {
+        { .fno = gen_helper_sve2_sqrshrnt_h },
+        { .fno = gen_helper_sve2_sqrshrnt_s },
+        { .fno = gen_helper_sve2_sqrshrnt_d },
+    };
+    return do_sve2_shr_narrow(s, a, ops);
+}
+
 static void gen_uqshrnb_vec(unsigned vece, TCGv_vec d,
                             TCGv_vec n, int64_t shr)
 {
-- 
2.25.1

