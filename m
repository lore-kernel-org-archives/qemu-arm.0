Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1541589ejb;
        Sun, 11 Jun 2023 09:04:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5VjxUW3DfmM8iCSzJr1YbvF6bW+S6C5va0Fh1uzCYrgGrDmnT+rXNeARtTi5g02S8fbAUq
X-Received: by 2002:a67:b441:0:b0:42c:6fe7:dd68 with SMTP id c1-20020a67b441000000b0042c6fe7dd68mr2705318vsm.4.1686499486272;
        Sun, 11 Jun 2023 09:04:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686499486; cv=none;
        d=google.com; s=arc-20160816;
        b=ajpVjCppcu1ULSjFzx1hWADjAvxu6KWeUwVWswyRijHEhWftvzvLpNxJ6pmGt6M5id
         oPqmw0piHIVbXAgY7K8Ffh5Yh5SRhY04d/xV0wRcQgxKiTqK0D4rTo8dh0OLXkgjGz1D
         PVeYaEQekDnGr+kY8cL/jkRKwCXMs4lRQOb+xMGdMAuq6TruF7bPY/LlEZtUYn0RiWG7
         5THNuNCsuJtp18wZFzpD35bvlSbjWyAL8+Wn7OC0hOCkoMtohr2ppN9moiBDCelVMtwi
         L8P0a4RHxO3POQKvKB9OKYObHnHxXyY7GdygVp+fnremKq/HC/i3iVvWlgb3aVUB4TIz
         go5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=6KI6vCKi2hK4kMqI/ACVjSnqVa1PBuwOd1A7QPwu8LI=;
        b=WDlAbAEkJmPqnhEL7Xor0hycUBX0ppSw/EI9MDYo3BvueG33rX0bqypyeLReg96GVx
         29oyJSMVmjUCeRtRFMbW4ZWKgpKFTRmkWDi2qhTrQFuJMyw523X4TLKQzlt6Ue9ohFh+
         E64jAMc0hPXfpJxYcjdjXxKhx7K9S3k+6O77i8/T5aJL2JPs1cI16cXcl6HqTm8VITzt
         qLkS+7/d2HZjF37QBBHTWRHtOnHxneL5gR5pXAQqVkA5RXuH8Vmn98V/wFAX4U+T62Ja
         BqwA3JFcZcRT9J546ZXx7RBAf/mbQS5vTMlyS6sQVcJIOX8vTyXXFrNyl8HkecuFPK63
         nvKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tkc3WpNK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m22-20020a05610206d600b0043b3ba8f9b1si484333vsg.450.2023.06.11.09.04.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Jun 2023 09:04:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tkc3WpNK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q8NVh-0006bs-Tf; Sun, 11 Jun 2023 12:01:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q8NUm-0005u2-MO
 for qemu-arm@nongnu.org; Sun, 11 Jun 2023 12:00:52 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q8NUh-0000TS-JK
 for qemu-arm@nongnu.org; Sun, 11 Jun 2023 12:00:47 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-30ae141785bso3246995f8f.3
 for <qemu-arm@nongnu.org>; Sun, 11 Jun 2023 09:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686499240; x=1689091240;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6KI6vCKi2hK4kMqI/ACVjSnqVa1PBuwOd1A7QPwu8LI=;
 b=tkc3WpNKu9t+jbTLQ4dI/E6epyt1V6zRVfi95pLb26KnoL9Hv7ZseTzzFIzIzzbN9f
 GtV5plRcAbM3FKzo4mMIeN9ctAjedU3vXF7eENT3rI1Ms8vrf+itIb3JCVvH/HlQ80VT
 18LACp7PIIneOnds8bZH5ekkcVA56idVTo46mRarqO7bnPQx0BDf66v1mJLGu/IVkr5M
 MuGL4q1Vro4N2hmJ5O1oudSMKAhIIcQxiAJ2Lp0lwx9mYQRalWVsNdtSIK0Qsy0Ey1Do
 T2FdpEHeS+Zk0B2pSvCnZ8HNRLp1UNwetrknyBYaM4Y0Lh11xuUL9UYnVme1LS8QoaGh
 ZBTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686499240; x=1689091240;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6KI6vCKi2hK4kMqI/ACVjSnqVa1PBuwOd1A7QPwu8LI=;
 b=HF5kqxD54vNtmWn/PwZBzA3m6hCWIi/TDAlKCGH2MmnirVgCjWg2KkHEvZQEwJ2Bd6
 JRTNM7giOyUWxi1BsmXlgm0eT+fR4yd5Ek3M5y6JqDd9kMNa/5mBmRqcMCue54sihTXL
 C/whgcmcMRO9JZKeCeKBGIheD5l/H6nYwd13QKGZas1MBhp1gB7JWCmQjp4wCaHYbAzf
 KGw1o0FP31fLM7aJIUQjSDj7vASFx50ZElu3jmxM8czlmHiR5bvKG4wC0IMwcKPlNDgN
 SKJhlGuxK3s937MlzFgGzzlp1YMPnfN1OIH5B29iLz31SOI+n04dp1e+dglWCJW43Xbo
 a2Vw==
X-Gm-Message-State: AC+VfDxehucsboAuroIKZGU9ABoUkxLk62nx6oLAgwkDBBF8NpaQkW3k
 P6kzVduisuukcQtprUIq8phHxlD5Aeo6z/teo+k=
X-Received: by 2002:a5d:4952:0:b0:309:3bc3:7d1f with SMTP id
 r18-20020a5d4952000000b003093bc37d1fmr2681565wrs.70.1686499240359; 
 Sun, 11 Jun 2023 09:00:40 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a056000008900b0030ae499da59sm9923022wrx.111.2023.06.11.09.00.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jun 2023 09:00:40 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 12/23] target/arm: Convert LDXP, STXP, CASP,
 CAS to decodetree
Date: Sun, 11 Jun 2023 17:00:21 +0100
Message-Id: <20230611160032.274823-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230611160032.274823-1-peter.maydell@linaro.org>
References: <20230611160032.274823-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 4SNZjFrEcPf9

Convert the load/store exclusive pair (LDXP, STXP, LDAXP, STLXP),
compare-and-swap pair (CASP, CASPA, CASPAL, CASPL), and compare-and
swap (CAS, CASA, CASAL, CASL) instructions to decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230602155223.2040685-10-peter.maydell@linaro.org
---
 target/arm/tcg/a64.decode      |  11 +++
 target/arm/tcg/translate-a64.c | 121 ++++++++++++---------------------
 2 files changed, 53 insertions(+), 79 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index c5894fc06d2..6b1079b8bdf 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -237,7 +237,18 @@ HLT             1101 0100 010 ................ 000 00 @i16
 &stlr           rn rt sz lasr
 @stxr           sz:2 ...... ... rs:5 lasr:1 rt2:5 rn:5 rt:5 &stxr
 @stlr           sz:2 ...... ... ..... lasr:1 ..... rn:5 rt:5 &stlr
+%imm1_30_p2 30:1 !function=plus_2
+@stxp           .. ...... ... rs:5 lasr:1 rt2:5 rn:5 rt:5 &stxr sz=%imm1_30_p2
 STXR            .. 001000 000 ..... . ..... ..... ..... @stxr  # inc STLXR
 LDXR            .. 001000 010 ..... . ..... ..... ..... @stxr  # inc LDAXR
 STLR            .. 001000 100 11111 . 11111 ..... ..... @stlr  # inc STLLR
 LDAR            .. 001000 110 11111 . 11111 ..... ..... @stlr  # inc LDLAR
+
+STXP            1 . 001000 001 ..... . ..... ..... ..... @stxp # inc STLXP
+LDXP            1 . 001000 011 ..... . ..... ..... ..... @stxp # inc LDAXP
+
+# CASP, CASPA, CASPAL, CASPL (we don't decode the bits that determine
+# acquire/release semantics because QEMU's cmpxchg always has those)
+CASP            0 . 001000 0 - 1 rs:5 - 11111 rn:5 rt:5 sz=%imm1_30_p2
+# CAS, CASA, CASAL, CASL
+CAS             sz:2 001000 1 - 1 rs:5 - 11111 rn:5 rt:5
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 1ba2d6a75e4..ff4338ee4df 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2741,84 +2741,50 @@ static bool trans_LDAR(DisasContext *s, arg_stlr *a)
     return true;
 }
 
-/* Load/store exclusive
- *
- *  31 30 29         24  23  22   21  20  16  15  14   10 9    5 4    0
- * +-----+-------------+----+---+----+------+----+-------+------+------+
- * | sz  | 0 0 1 0 0 0 | o2 | L | o1 |  Rs  | o0 |  Rt2  |  Rn  | Rt   |
- * +-----+-------------+----+---+----+------+----+-------+------+------+
- *
- *  sz: 00 -> 8 bit, 01 -> 16 bit, 10 -> 32 bit, 11 -> 64 bit
- *   L: 0 -> store, 1 -> load
- *  o2: 0 -> exclusive, 1 -> not
- *  o1: 0 -> single register, 1 -> register pair
- *  o0: 1 -> load-acquire/store-release, 0 -> not
- */
-static void disas_ldst_excl(DisasContext *s, uint32_t insn)
+static bool trans_STXP(DisasContext *s, arg_stxr *a)
 {
-    int rt = extract32(insn, 0, 5);
-    int rn = extract32(insn, 5, 5);
-    int rt2 = extract32(insn, 10, 5);
-    int rs = extract32(insn, 16, 5);
-    int is_lasr = extract32(insn, 15, 1);
-    int o2_L_o1_o0 = extract32(insn, 21, 3) * 2 | is_lasr;
-    int size = extract32(insn, 30, 2);
-
-    switch (o2_L_o1_o0) {
-    case 0x2: case 0x3: /* CASP / STXP */
-        if (size & 2) { /* STXP / STLXP */
-            if (rn == 31) {
-                gen_check_sp_alignment(s);
-            }
-            if (is_lasr) {
-                tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
-            }
-            gen_store_exclusive(s, rs, rt, rt2, rn, size, true);
-            return;
-        }
-        if (rt2 == 31
-            && ((rt | rs) & 1) == 0
-            && dc_isar_feature(aa64_atomics, s)) {
-            /* CASP / CASPL */
-            gen_compare_and_swap_pair(s, rs, rt, rn, size | 2);
-            return;
-        }
-        break;
-
-    case 0x6: case 0x7: /* CASPA / LDXP */
-        if (size & 2) { /* LDXP / LDAXP */
-            if (rn == 31) {
-                gen_check_sp_alignment(s);
-            }
-            gen_load_exclusive(s, rt, rt2, rn, size, true);
-            if (is_lasr) {
-                tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
-            }
-            return;
-        }
-        if (rt2 == 31
-            && ((rt | rs) & 1) == 0
-            && dc_isar_feature(aa64_atomics, s)) {
-            /* CASPA / CASPAL */
-            gen_compare_and_swap_pair(s, rs, rt, rn, size | 2);
-            return;
-        }
-        break;
-
-    case 0xa: /* CAS */
-    case 0xb: /* CASL */
-    case 0xe: /* CASA */
-    case 0xf: /* CASAL */
-        if (rt2 == 31 && dc_isar_feature(aa64_atomics, s)) {
-            gen_compare_and_swap(s, rs, rt, rn, size);
-            return;
-        }
-        break;
-    default:
-        /* Handled in decodetree */
-        break;
+    if (a->rn == 31) {
+        gen_check_sp_alignment(s);
     }
-    unallocated_encoding(s);
+    if (a->lasr) {
+        tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
+    }
+    gen_store_exclusive(s, a->rs, a->rt, a->rt2, a->rn, a->sz, true);
+    return true;
+}
+
+static bool trans_LDXP(DisasContext *s, arg_stxr *a)
+{
+    if (a->rn == 31) {
+        gen_check_sp_alignment(s);
+    }
+    gen_load_exclusive(s, a->rt, a->rt2, a->rn, a->sz, true);
+    if (a->lasr) {
+        tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
+    }
+    return true;
+}
+
+static bool trans_CASP(DisasContext *s, arg_CASP *a)
+{
+    if (!dc_isar_feature(aa64_atomics, s)) {
+        return false;
+    }
+    if (((a->rt | a->rs) & 1) != 0) {
+        return false;
+    }
+
+    gen_compare_and_swap_pair(s, a->rs, a->rt, a->rn, a->sz);
+    return true;
+}
+
+static bool trans_CAS(DisasContext *s, arg_CAS *a)
+{
+    if (!dc_isar_feature(aa64_atomics, s)) {
+        return false;
+    }
+    gen_compare_and_swap(s, a->rs, a->rt, a->rn, a->sz);
+    return true;
 }
 
 /*
@@ -4247,9 +4213,6 @@ static void disas_ldst_tag(DisasContext *s, uint32_t insn)
 static void disas_ldst(DisasContext *s, uint32_t insn)
 {
     switch (extract32(insn, 24, 6)) {
-    case 0x08: /* Load/store exclusive */
-        disas_ldst_excl(s, insn);
-        break;
     case 0x18: case 0x1c: /* Load register (literal) */
         disas_ld_lit(s, insn);
         break;
-- 
2.34.1

