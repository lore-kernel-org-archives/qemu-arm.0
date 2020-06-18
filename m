Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1272334lfm;
        Wed, 17 Jun 2020 21:48:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxf3sRwDKrlJugoQjE0L/I8wN+V3xTQsMhyS+az+vseuUvTsvq+Aq6RcwA+fXDULB1zZlDH
X-Received: by 2002:a25:ce4b:: with SMTP id x72mr3689428ybe.78.1592455724730;
        Wed, 17 Jun 2020 21:48:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592455724; cv=none;
        d=google.com; s=arc-20160816;
        b=Iw9xz50Lr1uyCwOfVoepyokbrRdchc1P1obuie81cvuV4mdTy0yt1r++p5iVRWDVcD
         +w2yAFzxj9LINDwEy7vgVgkQtZvBqp8O7jtZYQP7KVSufdHD9PfPrOndFAsYiLwPxQIa
         Fgcj/e1IUS+4pB1y5Fft6fzcU17+b5hIyq8LA8fxcKxnie6kNBaG38i1Fbl47SS0kQrN
         bbVnx4K6T0B7OVDmOIEaNtbPA1H0nztTLBx9FtXWkUwh7MUmRpFrbUsEuTUPhn+0eOEV
         CJ9KmmJaVrM7TDGXlAlLYt+Ue1jCFdQXqRTid7wRRcFbswzetAM1WnMS1jCxU6L7NkMZ
         /Tvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=7n71jdRa9jDqsGYLLW1e0xCXNj6Frs2+zLX6AaVU7tQ=;
        b=O9ZrFT4u10f6+VxOTnW4iGY5uO6qcZFhwdl4ge4phwPBiQPs6MJsD+cxiAgF7C6Uo2
         3dOufQAnxkK390ry/NyHJYb3rVOBCn3MPkjeSDd/WoKeYdBoIFapw3hZFvMTeRFa9z+3
         fZoqq08kjKi1LenDm8WEXP196TFNjEiVQoVx3+Os5o3Bdh4ybXyio1oAoIdf0EFyOgve
         9TDLlA6i1be4KxmF1xieVBi5UsoK6ji9Ztpn4NF8QetzFUe93J7xEReXc8FGECTZrYjK
         YDDCR9IvTHkpB6wFUe2XPExAxGQE85Oe1NoGKHJfjQ/C8AjoOButPIxYdFxcOyj9Zk9W
         ARzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hQatKIqm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 184si1452410ybc.322.2020.06.17.21.48.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 21:48:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hQatKIqm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlmTk-0002oO-0c
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 00:48:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmBQ-0008Cz-8V
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:29:48 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:43738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmBO-0002uq-CA
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:29:47 -0400
Received: by mail-pf1-x441.google.com with SMTP id 23so2177280pfw.10
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 21:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7n71jdRa9jDqsGYLLW1e0xCXNj6Frs2+zLX6AaVU7tQ=;
 b=hQatKIqmltYxgDz+VNqjx/9Nr4NTbhbMunut8RwoY8TI1ZKYpGJLdVGa70KR4lCV+x
 fT7FB6TM0Yx3gUMVClwUVslbc0u4mqlqXvjUh5bdQl6X8tnko8K+vFygZmJmVgfKjTcn
 lIqBpsUv/bSHSC0NdIIzmCEgj3Pfl//u5fSOiHYVLG0b7xHxQiCVm0++oOjUyE281jcH
 vrdFbkM7ZBWgqHcoZOrwjZwa8dzbGb+5HVkccPV5eg2PWWpdNwD2NM9o2ST3pv8/f0lH
 p3vwxwAKlRilqMgfdjnlVWCJBg3CpEHuWKhbPGBt+8bHt1QpMer7tGbciQY/i1wmyxSj
 YjDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7n71jdRa9jDqsGYLLW1e0xCXNj6Frs2+zLX6AaVU7tQ=;
 b=bh7G526k4MDycVm8OqDYo1M1Ai0hboH0TVo7Gv2z5NjKFuLmv1gtQT27zbopS2jf0M
 CZibkSxltKXAow+u12LA5p3ty8KXleuzCdKmVYU3UzRKj+CKaT5+rUGtfaQsOk4dFnoG
 AKx+fZCJKC1wqO5qLrEVN1Rh+6dnoMaB1AQ6V9sYbyajWFXwalAshkEu0irSZjxgJ+HQ
 8IrfXiDvLVdnYL6BJRKTMEJdtjmuf7ggnTqLgX71udGn3jTo3GvA+Y7lp4soSh1C025Z
 F6sx42eprPLVQRbLyw9PSmC9a4Vim12tmrWEDRpTaE+zLqqYG6q5+rLIrVIFg6pTd4T2
 GGgA==
X-Gm-Message-State: AOAM53200ITumbtVyFuQ1mHif0osewGY8+9oTXVor3+Tr/MHnvCupErz
 xNCZH7tmfUI4xhe6QJl4WDBN5Q==
X-Received: by 2002:a62:2bc6:: with SMTP id r189mr1861903pfr.11.1592454585136; 
 Wed, 17 Jun 2020 21:29:45 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id j17sm1157899pgk.66.2020.06.17.21.29.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:29:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 042/100] target/arm: Implement SVE2 SQSHRUN, SQRSHRUN
Date: Wed, 17 Jun 2020 21:25:46 -0700
Message-Id: <20200618042644.1685561-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x441.google.com
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
X-TUID: +Vi+cQtqLe+8

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 16 +++++++
 target/arm/sve.decode      |  4 ++
 target/arm/sve_helper.c    | 24 ++++++++++
 target/arm/translate-sve.c | 98 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 142 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 3a7d7ff66d..371a1b02e0 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -1972,6 +1972,22 @@ DEF_HELPER_FLAGS_3(sve2_rshrnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_rshrnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_rshrnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_3(sve2_sqshrunb_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqshrunb_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqshrunb_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve2_sqshrunt_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqshrunt_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqshrunt_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve2_sqrshrunb_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqrshrunb_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqrshrunb_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve2_sqrshrunt_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqrshrunt_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqrshrunt_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_6(sve2_faddp_zpzz_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_6(sve2_faddp_zpzz_s, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 7cc4b6cc43..cade628cfd 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1288,6 +1288,10 @@ SQXTUNT         01000101 .. 1 ..... 010 101 ..... .....  @rd_rn_tszimm_shl
 ## SVE2 bitwise shift right narrow
 
 # Bit 23 == 0 is handled by esz > 0 in the translator.
+SQSHRUNB        01000101 .. 1 ..... 00 0000 ..... .....  @rd_rn_tszimm_shr
+SQSHRUNT        01000101 .. 1 ..... 00 0001 ..... .....  @rd_rn_tszimm_shr
+SQRSHRUNB       01000101 .. 1 ..... 00 0010 ..... .....  @rd_rn_tszimm_shr
+SQRSHRUNT       01000101 .. 1 ..... 00 0011 ..... .....  @rd_rn_tszimm_shr
 SHRNB           01000101 .. 1 ..... 00 0100 ..... .....  @rd_rn_tszimm_shr
 SHRNT           01000101 .. 1 ..... 00 0101 ..... .....  @rd_rn_tszimm_shr
 RSHRNB          01000101 .. 1 ..... 00 0110 ..... .....  @rd_rn_tszimm_shr
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 9b3d0d2ddd..01c717e27e 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1926,6 +1926,30 @@ DO_SHRNT(sve2_rshrnt_h, uint16_t, uint8_t, H1_2, H1, DO_RSHR)
 DO_SHRNT(sve2_rshrnt_s, uint32_t, uint16_t, H1_4, H1_2, DO_RSHR)
 DO_SHRNT(sve2_rshrnt_d, uint64_t, uint32_t,     , H1_4, DO_RSHR)
 
+#define DO_SQSHRUN_H(x, sh) MIN(MAX(x >> sh, 0), UINT8_MAX)
+#define DO_SQSHRUN_S(x, sh) MIN(MAX(x >> sh, 0), UINT16_MAX)
+#define DO_SQSHRUN_D(x, sh) MIN(MAX(x >> sh, 0), UINT32_MAX)
+
+DO_SHRNB(sve2_sqshrunb_h, int16_t, uint8_t, DO_SQSHRUN_H)
+DO_SHRNB(sve2_sqshrunb_s, int32_t, uint16_t, DO_SQSHRUN_S)
+DO_SHRNB(sve2_sqshrunb_d, int64_t, uint32_t, DO_SQSHRUN_D)
+
+DO_SHRNT(sve2_sqshrunt_h, int16_t, uint8_t, H1_2, H1, DO_SQSHRUN_H)
+DO_SHRNT(sve2_sqshrunt_s, int32_t, uint16_t, H1_4, H1_2, DO_SQSHRUN_S)
+DO_SHRNT(sve2_sqshrunt_d, int64_t, uint32_t,     , H1_4, DO_SQSHRUN_D)
+
+#define DO_SQRSHRUN_H(x, sh) MIN(MAX(DO_RSHR(x, sh), 0), UINT8_MAX)
+#define DO_SQRSHRUN_S(x, sh) MIN(MAX(DO_RSHR(x, sh), 0), UINT16_MAX)
+#define DO_SQRSHRUN_D(x, sh) MIN(MAX(DO_RSHR(x, sh), 0), UINT32_MAX)
+
+DO_SHRNB(sve2_sqrshrunb_h, int16_t, uint8_t, DO_SQRSHRUN_H)
+DO_SHRNB(sve2_sqrshrunb_s, int32_t, uint16_t, DO_SQRSHRUN_S)
+DO_SHRNB(sve2_sqrshrunb_d, int64_t, uint32_t, DO_SQRSHRUN_D)
+
+DO_SHRNT(sve2_sqrshrunt_h, int16_t, uint8_t, H1_2, H1, DO_SQRSHRUN_H)
+DO_SHRNT(sve2_sqrshrunt_s, int32_t, uint16_t, H1_4, H1_2, DO_SQRSHRUN_S)
+DO_SHRNT(sve2_sqrshrunt_d, int64_t, uint32_t,     , H1_4, DO_SQRSHRUN_D)
+
 #undef DO_SHRNB
 #undef DO_SHRNT
 
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 81e44bb818..7e89d7b9a8 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6424,6 +6424,104 @@ static bool trans_RSHRNT(DisasContext *s, arg_rri_esz *a)
     return do_sve2_shr_narrow(s, a, ops);
 }
 
+static void gen_sqshrunb_vec(unsigned vece, TCGv_vec d,
+                             TCGv_vec n, int64_t shr)
+{
+    TCGv_vec t = tcg_temp_new_vec_matching(d);
+    int halfbits = 4 << vece;
+
+    tcg_gen_sari_vec(vece, n, n, shr);
+    tcg_gen_dupi_vec(vece, t, 0);
+    tcg_gen_smax_vec(vece, n, n, t);
+    tcg_gen_dupi_vec(vece, t, MAKE_64BIT_MASK(0, halfbits));
+    tcg_gen_umin_vec(vece, d, n, t);
+    tcg_temp_free_vec(t);
+}
+
+static bool trans_SQSHRUNB(DisasContext *s, arg_rri_esz *a)
+{
+    static const TCGOpcode vec_list[] = {
+        INDEX_op_sari_vec, INDEX_op_smax_vec, INDEX_op_umin_vec, 0
+    };
+    static const GVecGen2i ops[3] = {
+        { .fniv = gen_sqshrunb_vec,
+          .opt_opc = vec_list,
+          .fno = gen_helper_sve2_sqshrunb_h,
+          .vece = MO_16 },
+        { .fniv = gen_sqshrunb_vec,
+          .opt_opc = vec_list,
+          .fno = gen_helper_sve2_sqshrunb_s,
+          .vece = MO_32 },
+        { .fniv = gen_sqshrunb_vec,
+          .opt_opc = vec_list,
+          .fno = gen_helper_sve2_sqshrunb_d,
+          .vece = MO_64 },
+    };
+    return do_sve2_shr_narrow(s, a, ops);
+}
+
+static void gen_sqshrunt_vec(unsigned vece, TCGv_vec d,
+                             TCGv_vec n, int64_t shr)
+{
+    TCGv_vec t = tcg_temp_new_vec_matching(d);
+    int halfbits = 4 << vece;
+
+    tcg_gen_sari_vec(vece, n, n, shr);
+    tcg_gen_dupi_vec(vece, t, 0);
+    tcg_gen_smax_vec(vece, n, n, t);
+    tcg_gen_dupi_vec(vece, t, MAKE_64BIT_MASK(0, halfbits));
+    tcg_gen_umin_vec(vece, n, n, t);
+    tcg_gen_shli_vec(vece, n, n, halfbits);
+    tcg_gen_bitsel_vec(vece, d, t, d, n);
+    tcg_temp_free_vec(t);
+}
+
+static bool trans_SQSHRUNT(DisasContext *s, arg_rri_esz *a)
+{
+    static const TCGOpcode vec_list[] = {
+        INDEX_op_shli_vec, INDEX_op_sari_vec,
+        INDEX_op_smax_vec, INDEX_op_umin_vec, 0
+    };
+    static const GVecGen2i ops[3] = {
+        { .fniv = gen_sqshrunt_vec,
+          .opt_opc = vec_list,
+          .load_dest = true,
+          .fno = gen_helper_sve2_sqshrunt_h,
+          .vece = MO_16 },
+        { .fniv = gen_sqshrunt_vec,
+          .opt_opc = vec_list,
+          .load_dest = true,
+          .fno = gen_helper_sve2_sqshrunt_s,
+          .vece = MO_32 },
+        { .fniv = gen_sqshrunt_vec,
+          .opt_opc = vec_list,
+          .load_dest = true,
+          .fno = gen_helper_sve2_sqshrunt_d,
+          .vece = MO_64 },
+    };
+    return do_sve2_shr_narrow(s, a, ops);
+}
+
+static bool trans_SQRSHRUNB(DisasContext *s, arg_rri_esz *a)
+{
+    static const GVecGen2i ops[3] = {
+        { .fno = gen_helper_sve2_sqrshrunb_h },
+        { .fno = gen_helper_sve2_sqrshrunb_s },
+        { .fno = gen_helper_sve2_sqrshrunb_d },
+    };
+    return do_sve2_shr_narrow(s, a, ops);
+}
+
+static bool trans_SQRSHRUNT(DisasContext *s, arg_rri_esz *a)
+{
+    static const GVecGen2i ops[3] = {
+        { .fno = gen_helper_sve2_sqrshrunt_h },
+        { .fno = gen_helper_sve2_sqrshrunt_s },
+        { .fno = gen_helper_sve2_sqrshrunt_d },
+    };
+    return do_sve2_shr_narrow(s, a, ops);
+}
+
 static bool do_sve2_zpzz_fp(DisasContext *s, arg_rprr_esz *a,
                             gen_helper_gvec_4_ptr *fn)
 {
-- 
2.25.1

