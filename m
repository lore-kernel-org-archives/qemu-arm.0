Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3439043njb;
        Tue, 10 Dec 2024 08:20:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXAbrlDXHt6eQ0jzYlbEjEILf2xNUEmpxpGwI/rNhpfVDtw1+4K2PTjiLZw2M/rnUll0qLioIH+XJYyAw==@linaro.org
X-Google-Smtp-Source: AGHT+IGUxo/WEH9xuR/ZDWzTOhlS8T/aGg3R/oL6J8B/KXPa/vYASK5lyl7OxMGrbY7F4EZVtLq/
X-Received: by 2002:a05:620a:170f:b0:7b6:6d5a:d51b with SMTP id af79cd13be357-7b6dcecc649mr718661385a.52.1733847633160;
        Tue, 10 Dec 2024 08:20:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733847633; cv=none;
        d=google.com; s=arc-20240605;
        b=UlmCfNEdT9W8UQroHA6Hl5I+tExcskLEIRAuRqY1tiOpexi60stysdDQ2mP4GseU4W
         pE7hKikYHMTtzybkSqO8ACl9Xe7k7amhUBQjaQzGcEHlbLAy6YoN/whF44WHU9eLJz9Q
         Jl5gMktgx3k35pAJm+GYG/j4lTgHs1lXZv4jH76BwovyEdnEQ1FbawyBLwfv48N4uXML
         3S4xXEA8Ev7ziPKPDM+XLNp57qAy4vfspn4t+ubrTQ31mawhP0I1PcoVLl3rfpAvUTqR
         IPLR/FCTIcpNakqx3HvYucenYsoKYAACTVb196GHcEtuYco2Mit7qIy2pTWaw0VJkwsD
         +nnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=McfZQURJzCV4MG39Dc+S7lfs3y6jo+IbKtnV4z9uT+g=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=hjSWmLSs3JLd/HSMILnqRYHQAI2i65l1670R/wVQn3UTV1Eqext4RGB3K+mDTYxG5U
         LhZhJ4dF/2ZZcjEisYFeL+UXmui+1rCe00YrbpsN9R5drmdnqCif1nyZ+y4GpoG3svGW
         lKvTifHLxKPZ4Qz3djBVRg4c1PVg9kGnHG+v37oGOMhgTFLf/97lHGfBem4NO24fsoLy
         EKfsy4EDGYvc2sCLMFskeMNetEaVZnHK0flmmC3pnb3J0jUqCujvcAr1mLXN5N5ZYDsd
         1Kn/NHbhgKZj7DIzBPypXjZUlpJ6xA1BIEOs4MGbRBGCOFcu0dLNDRzU0aZfCiD29/ni
         5jmA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yizj0zUg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6dc6f671esi337499785a.224.2024.12.10.08.20.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2024 08:20:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yizj0zUg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tL2xl-000546-I3; Tue, 10 Dec 2024 11:19:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL2xT-0004AC-2z
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 11:19:35 -0500
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL2xR-0006Wd-7H
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 11:19:34 -0500
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-3003943288bso39799181fa.0
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2024 08:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733847571; x=1734452371; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=McfZQURJzCV4MG39Dc+S7lfs3y6jo+IbKtnV4z9uT+g=;
 b=yizj0zUgovLfbsoqJ2HBFQQTUai9qA+O/gi9mTqTT+VRqd0FeAtRK7aJOJtT3UdK+N
 WrGo5h9nJK5UyRkO0g2aw3qfjjo8foE7JkFWBH78Pa961CIVWFYvEeljsJYMKKt8AvvV
 IPwGsHmbnY6bU+6p/I4PFzWpaFqrZDP7AKhQ0rKk0UMGTE3WMZ5dvBUXOCvmOyNs9yy9
 HU8DA96apNDVc0nMzIVHX2ET13VR/J12bsoqmkNHh6ZQnh9GmKZSVq6ytbKONBg5euND
 SHS1JXGS1vhBXd8Tr6Yg2XWwuXLBdHMhJTr0hGyZWwyAumJdju/bf4GJ+FVnmfthyknP
 n8lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733847571; x=1734452371;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=McfZQURJzCV4MG39Dc+S7lfs3y6jo+IbKtnV4z9uT+g=;
 b=ECP9jFYACuBb946uZp4e8V9zwaidL84X19P0vKvGj2fxAGdx8+xiXMaYkwq1ZNU2no
 KMM1+ru/eViii0ItFvbips3DtZxgPiFL4HWQEZr2G/zgm9r+bnJFnT99aJ33/c7AKXSf
 0zr7gmLPvjxBeSadnmnWpawdDhQ/uM+felCbVTWIx6zTtGZXpqlf5lytkyXiwplE9pOZ
 uy/SQsG5rfwCDoq9iarJTEWZt8nX8vwBt/K+DVdK7fB3bDw+vIy6p7TTzZDPs/AdCqpk
 AgNVPH+qcGG96dsGw/6Lcv/81X8EMVOy3aT5I35zm9TqDlJVcmLWjbR6VWYMOmgsDMg1
 dnBA==
X-Gm-Message-State: AOJu0Yw4ajm4fEEuWIVeZZsvthnPryIaJ2QKvMitMF1lpFwmsB/5gdNR
 qyuVYycDVN6bt9NYIoe7NfKX2nQ9L7rOgvynofcC9eLBFKaBom0q2g4cZpzSXoY=
X-Gm-Gg: ASbGncv7w9wXOQvIcvFWh056QOHUSI6V6Bf7HqNEtDjrZr7RBIlA889xpUIRmAfpC3u
 zBCJKNHMJhCDUhpA+p5iLtQmMGvCzLNVbOHwd2JbkKADQSqJwra1Ci/4dAoqLsm7hgVJBD4A6sj
 YXCw6aPRXsqJ1TgMoYOIlCEXsBu+PQMBce1kbHP90RcxwI471g1+cYY6bZUERsAig3r0fA2++Zi
 c0u7JAm/q2/MAL4ux/Ofe3YGNWbAc4/hvOgB/RIP6Qb4sJ78a7qh5cyLqc=
X-Received: by 2002:a05:651c:1992:b0:302:1b18:2c09 with SMTP id
 38308e7fff4ca-3021b182f7fmr42697561fa.27.1733847571441; 
 Tue, 10 Dec 2024 08:19:31 -0800 (PST)
Received: from stoup.. ([91.209.212.80]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53f93377eefsm1026343e87.67.2024.12.10.08.19.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 08:19:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 27/69] target/arm: Convert FSQRT (scalar) to decodetree
Date: Tue, 10 Dec 2024 10:16:51 -0600
Message-ID: <20241210161733.1830573-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241210161733.1830573-1-richard.henderson@linaro.org>
References: <20241210161733.1830573-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x234.google.com
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
X-TUID: y11iD9nsRQTr

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 72 ++++++++++++++++++++++++++++------
 target/arm/tcg/a64.decode      |  1 +
 2 files changed, 62 insertions(+), 11 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index e6878abd35..f32cc2f0af 100644
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

