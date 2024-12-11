Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4196587njb;
        Wed, 11 Dec 2024 08:42:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV7ynXtaUkn69x+OxbghEHe5ZaCTc2CNdcyZnsGZUjvlwz6yhQMLSsr2JrO2ZuSNnx9T7qM/mq5rjJ1TQ==@linaro.org
X-Google-Smtp-Source: AGHT+IF9sqI5YgBRS2C34a4u98P5344HBX6heluhRZv6O5RsER1E76ASBgAGMx1RyndRnI+5KlIU
X-Received: by 2002:a05:6122:4898:b0:518:859e:87ab with SMTP id 71dfb90a1353d-518a3ad7ad3mr3665207e0c.9.1733935325162;
        Wed, 11 Dec 2024 08:42:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733935325; cv=none;
        d=google.com; s=arc-20240605;
        b=F1fWsSKmH6tgKA3dfTepwb00ZFPhNH2TTrR9HxnT060KxpFjycnnDsVTYVEhCiYE3X
         a6tuMfYZVLlaxTXeWmtdcEKlvn/QmHecZvLGmWqcBdUZAhEbAl2NTTvqPPy+PRETbEvr
         h5YYH2SleQXGFefQyikcdCKwccHzH5v4qd1Uwrs3DHSU8nStU/yY+MR6XboqRwTua9A9
         IHPmuD4TN1OzxkwZNDOLQvBlNV4zW4BQBdOPCICbRbukY1kTrb/46LceytE8XKuL1n+V
         oh1H6mV7v5cN+jJJl8G9hv+/kDNAcfTJpQU4uMttnJsgc0kNEOZf2FEFIRHYQpJkazCq
         hiTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=HoIR8opIdikMP5mTlzA+lDmXoupiuxSezg0zvazHeRg=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=AlWOXh+3NqvIWLDcyRBlRtgLY/EyrxfAxjlDJ6rNdKVq3eiWbpUADr2qEtBH8pmiD6
         PYy1vC7GoMD4BALISIu1yHTiIIj6YGrIrbq+NamcWmtpsQn4QAXN4dw57wj4/HjBW35V
         3d+06+j53c1/xC3JEKxP+RGYKoW/DUbuW1ZSZW+mv3ZO1TijqvKTuaDHODS2/MbARr41
         TkzQeJrzkQiGmTSmx6ThPaFQwZIa/Qv1oseCmkm6u4ytPaCyUrZr2RYU3WilxUps7hZv
         YvI16zczUqiFg1/lr7p5RMth/qrhlVO9TRqE838I4S5u4nKa7iC6aWyTHs8dhLSK5oCl
         r6nQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G644OZSv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-5160ad42dedsi2747546e0c.40.2024.12.11.08.42.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 08:42:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G644OZSv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLPe9-0000aE-JO; Wed, 11 Dec 2024 11:33:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPdH-0005MO-RA
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:32:17 -0500
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPdF-0001Ov-VW
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:32:15 -0500
Received: by mail-qt1-x834.google.com with SMTP id
 d75a77b69052e-4675feed835so31128351cf.1
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 08:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733934733; x=1734539533; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HoIR8opIdikMP5mTlzA+lDmXoupiuxSezg0zvazHeRg=;
 b=G644OZSvM+75bs+WGhEiKCaw7SXFIk1wSNy5FLOppD9WRz+RqM00/8Vte0YnOf407x
 KkjjLkKs/pkdgj+ewGRVJmuqIanHgDMlRehgHWKoBW73WDlgcCzu3NoaVYx91ObFFnou
 vCDqhcFbhOI/xkbZ/CjnEswmy/4/daTfHX0p4Q80Qm0dfPR/e31SCVvO3bNkwXFeSgmX
 e+s2eal4SSdIILEs6hh7oH2GriUG6wAhZnjZRqQLp1YG3aabFolvML//gxnZPXbZcZvl
 g4bndmk5p/q4uNB/zCCOXIpj4nl5w5sUqhLGUWNcrjgfI4p/Uuui7dngCjJjp3hDUk5T
 XPKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733934733; x=1734539533;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HoIR8opIdikMP5mTlzA+lDmXoupiuxSezg0zvazHeRg=;
 b=CfScIaoyJpxiLFU577JqdeqGwwAHbplIK68ddpdrXXh92bdA9mWlx2lEKIZrsPFNXC
 rys0vYQNzvHY9+y6sZJbABHr2mlcymJNCOiJoN8/KzfeWHB5dkHUut6M3y1CSFMLTDoY
 Uy2fFu6/S7/kpcaZqPs7+KXgw1CSb5zQWNBGRohroP1eB1AuWtp5yjgiM1zpmwkPR2rC
 6TK0mNtvt6gm5j9lcrnViBoZqYSLz6g0FR0m9KTAqeKubrnVVnTm5MHwlhIOt5XJSMNQ
 Ad9K/HyPpfoq/+Zm5DEckYQqg8LA0u8Xg9oDu7vWJmGi+64paEj3+aPSznAWp2i7LAfL
 in0Q==
X-Gm-Message-State: AOJu0Yyw0++5tHcxFW7u/9Cq7M6A8Hn+5P2GsgQad2fQsa/Jm4jQqL9r
 /xZ/uGlaGkVIPUFpxBja61KoFc78R4rWk/hpeibn2D/ap8VpiQqfwE1IpUOFRIU=
X-Gm-Gg: ASbGnctejNkusiJdaHzuB0zu/YNU6DApRiVNctJgsp3njI9fNWdpbDNWWcarxFtOI8U
 aieOH4jvnqdCa08OQ8FTs8c7yqguIxVSCnIzrnwmXeJbycDHcCX3xgvuSz2yYgpYJQPLT8lUEZW
 6dMLdTu82llqo0MS3Ydc4cRNDeCfcWEBVv+nojif2PIj8g8t6wlI1LAO3+BzTmssJOd6gUIQMJ9
 kLo+ZNojb/0bF3Qe8hthYGfa5VPCd0sEKuv7uNcK/2Ig3A0Al0HC92vD0KMsQ==
X-Received: by 2002:a05:622a:1b8f:b0:467:71bb:480c with SMTP id
 d75a77b69052e-4678938414bmr65204761cf.49.1733934732594; 
 Wed, 11 Dec 2024 08:32:12 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-46755db613csm43849381cf.70.2024.12.11.08.32.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 08:32:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 27/69] target/arm: Convert FSQRT (scalar) to decodetree
Date: Wed, 11 Dec 2024 10:29:54 -0600
Message-ID: <20241211163036.2297116-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211163036.2297116-1-richard.henderson@linaro.org>
References: <20241211163036.2297116-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x834.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qyV4qHYlvW9U

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 72 ++++++++++++++++++++++++++++------
 target/arm/tcg/a64.decode      |  1 +
 2 files changed, 62 insertions(+), 11 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 2a5cb70475..f3989246f9 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -8344,6 +8344,63 @@ static const FPScalar1Int f_scalar_fneg = {
 };
 TRANS(FNEG_s, do_fp1_scalar_int, a, &f_scalar_fneg)
 
+typedef struct FPScalar1 {
+    void (*gen_h)(TCGv_i32, TCGv_i32, TCGv_ptr);
+    void (*gen_s)(TCGv_i32, TCGv_i32, TCGv_ptr);
+    void (*gen_d)(TCGv_i64, TCGv_i64, TCGv_ptr);
+} FPScalar1;
+
+static bool do_fp1_scalar(DisasContext *s, arg_rr_e *a,
+                          const FPScalar1 *f, int rmode)
+{
+    TCGv_i32 tcg_rmode = NULL;
+    TCGv_ptr fpst;
+    TCGv_i64 t64;
+    TCGv_i32 t32;
+    int check = fp_access_check_scalar_hsd(s, a->esz);
+
+    if (check <= 0) {
+        return check == 0;
+    }
+
+    fpst = fpstatus_ptr(a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
+    if (rmode >= 0) {
+        tcg_rmode = gen_set_rmode(rmode, fpst);
+    }
+
+    switch (a->esz) {
+    case MO_64:
+        t64 = read_fp_dreg(s, a->rn);
+        f->gen_d(t64, t64, fpst);
+        write_fp_dreg(s, a->rd, t64);
+        break;
+    case MO_32:
+        t32 = read_fp_sreg(s, a->rn);
+        f->gen_s(t32, t32, fpst);
+        write_fp_sreg(s, a->rd, t32);
+        break;
+    case MO_16:
+        t32 = read_fp_hreg(s, a->rn);
+        f->gen_h(t32, t32, fpst);
+        write_fp_sreg(s, a->rd, t32);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    if (rmode >= 0) {
+        gen_restore_rmode(tcg_rmode, fpst);
+    }
+    return true;
+}
+
+static const FPScalar1 f_scalar_fsqrt = {
+    gen_helper_vfp_sqrth,
+    gen_helper_vfp_sqrts,
+    gen_helper_vfp_sqrtd,
+};
+TRANS(FSQRT_s, do_fp1_scalar, a, &f_scalar_fsqrt, -1)
+
 /* Floating-point data-processing (1 source) - half precision */
 static void handle_fp_1src_half(DisasContext *s, int opcode, int rd, int rn)
 {
@@ -8352,10 +8409,6 @@ static void handle_fp_1src_half(DisasContext *s, int opcode, int rd, int rn)
     TCGv_i32 tcg_res = tcg_temp_new_i32();
 
     switch (opcode) {
-    case 0x3: /* FSQRT */
-        fpst = fpstatus_ptr(FPST_FPCR_F16);
-        gen_helper_vfp_sqrth(tcg_res, tcg_op, fpst);
-        break;
     case 0x8: /* FRINTN */
     case 0x9: /* FRINTP */
     case 0xa: /* FRINTM */
@@ -8382,6 +8435,7 @@ static void handle_fp_1src_half(DisasContext *s, int opcode, int rd, int rn)
     case 0x0: /* FMOV */
     case 0x1: /* FABS */
     case 0x2: /* FNEG */
+    case 0x3: /* FSQRT */
         g_assert_not_reached();
     }
 
@@ -8400,9 +8454,6 @@ static void handle_fp_1src_single(DisasContext *s, int opcode, int rd, int rn)
     tcg_res = tcg_temp_new_i32();
 
     switch (opcode) {
-    case 0x3: /* FSQRT */
-        gen_fpst = gen_helper_vfp_sqrts;
-        break;
     case 0x6: /* BFCVT */
         gen_fpst = gen_helper_bfcvt;
         break;
@@ -8438,6 +8489,7 @@ static void handle_fp_1src_single(DisasContext *s, int opcode, int rd, int rn)
     case 0x0: /* FMOV */
     case 0x1: /* FABS */
     case 0x2: /* FNEG */
+    case 0x3: /* FSQRT */
         g_assert_not_reached();
     }
 
@@ -8465,9 +8517,6 @@ static void handle_fp_1src_double(DisasContext *s, int opcode, int rd, int rn)
     tcg_res = tcg_temp_new_i64();
 
     switch (opcode) {
-    case 0x3: /* FSQRT */
-        gen_fpst = gen_helper_vfp_sqrtd;
-        break;
     case 0x8: /* FRINTN */
     case 0x9: /* FRINTP */
     case 0xa: /* FRINTM */
@@ -8500,6 +8549,7 @@ static void handle_fp_1src_double(DisasContext *s, int opcode, int rd, int rn)
     case 0x0: /* FMOV */
     case 0x1: /* FABS */
     case 0x2: /* FNEG */
+    case 0x3: /* FSQRT */
         g_assert_not_reached();
     }
 
@@ -8619,7 +8669,6 @@ static void disas_fp_1src(DisasContext *s, uint32_t insn)
             goto do_unallocated;
         }
         /* fall through */
-    case 0x3:
     case 0x8 ... 0xc:
     case 0xe ... 0xf:
         /* 32-to-32 and 64-to-64 ops */
@@ -8672,6 +8721,7 @@ static void disas_fp_1src(DisasContext *s, uint32_t insn)
     case 0x0: /* FMOV */
     case 0x1: /* FABS */
     case 0x2: /* FNEG */
+    case 0x3: /* FSQRT */
         unallocated_encoding(s);
         break;
     }
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index b9cc8963da..3b1e8e0776 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1327,6 +1327,7 @@ FMINV_s         0110 1110 10 11000 01111 10 ..... .....     @rr_q1e2
 FMOV_s          00011110 .. 1 000000 10000 ..... .....      @rr_hsd
 FABS_s          00011110 .. 1 000001 10000 ..... .....      @rr_hsd
 FNEG_s          00011110 .. 1 000010 10000 ..... .....      @rr_hsd
+FSQRT_s         00011110 .. 1 000011 10000 ..... .....      @rr_hsd
 
 # Floating-point Immediate
 
-- 
2.43.0

