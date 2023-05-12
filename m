Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp4842774ejq;
        Fri, 12 May 2023 07:43:23 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6otZRGrbe3wY7xyjaEu9zLcyU0vr4/YofwjxBY+hdsvaHztmvIop3SG2/7Gw5OXnhvysWF
X-Received: by 2002:ac8:5a85:0:b0:3ef:38a2:9fdb with SMTP id c5-20020ac85a85000000b003ef38a29fdbmr36317547qtc.60.1683902602793;
        Fri, 12 May 2023 07:43:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683902602; cv=none;
        d=google.com; s=arc-20160816;
        b=x/Y1bfXCOwJJUvGFMU/zZEsi6eUGr0VbSGeW3porLbP4ZpWRZPhL3Khid7+NGo73R0
         WWsTO54LZTDAoqf+86N0maI5ImtLosMbfWZOp1gW9SnsBvckz7MSH0zYW/4/CjR8zoPz
         adGAfpndMIFXuAFyvzhve1KZ27/xZgXGXoW9K0X0y9H9RiV9dcq0V1TgZy6eqUQUGs5g
         evdUGaovazJzZ/K85lUpL1RtqtnP+LBNymmrvvUqY72OW6xFRK7/9ZMXAfbeFzM2DAko
         eNJfOZMcb8AB7VFDDszxhRU5vBCoAG4EJZLotPiQriAgVRuxcxWDRGH+yIqCgnR+S3Uk
         Wdsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=B7nyR7O1R/Xj3JLca+ITi9DYuDIC2bfZZm42nTKWjuM=;
        b=fPuOCYVNzD3UvfprMMXy+x66O00xkaFkoR+4P8Q0AJY08O9wpGfc9MALFKqgrf2TKt
         L2IrdoQ5OyPEiG1lE3iU2XYz3tZIPtHMEU9RPn8+Fl4SarsfQvZiyPuD996KawXphjVz
         kgAgDQWHWtacdB1/H6GARUjq9x2wLNUQGDJvamRmR892Nnxncp4dxZivTP3AoemkAcRf
         xjGAwOVGOdTeaRLRVGOsC2+PeOWHNOwJtdTddJmrgZ1qvc8s/eP6Prc5aiMo7H4rdc3M
         raviKX9CA3kjNZOdeBw3k3OX39HeIr0XIqglSOeaLGdUEaVQa0kmU1Fc/UZf/rjlRHhj
         blcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CXfpV45F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c15-20020a05620a11af00b0074de91d7505si8739651qkk.207.2023.05.12.07.43.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 May 2023 07:43:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CXfpV45F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pxTxc-00077W-AE; Fri, 12 May 2023 10:41:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxZ-000734-DA
 for qemu-arm@nongnu.org; Fri, 12 May 2023 10:41:29 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxL-0004jM-1r
 for qemu-arm@nongnu.org; Fri, 12 May 2023 10:41:29 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-30789a4c537so5092300f8f.0
 for <qemu-arm@nongnu.org>; Fri, 12 May 2023 07:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683902473; x=1686494473;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B7nyR7O1R/Xj3JLca+ITi9DYuDIC2bfZZm42nTKWjuM=;
 b=CXfpV45F7L784+TxMCo4L8LJOinY7JibefPKU3zr+KdYvDfafa0UpeABMqBCmjTXCf
 jFqmx7oqqe7yKDfVAaLgS64UquFmW/kjab5vrTe6m2LdADTQRJIr5gKCNmRSSm+Xw2r0
 UhNyyDV3qhS4CEpxdEANvySr905mzLn7NZYuJIhaRs/YusscjeTgTdPQqofDm4buNdky
 WMT8jCQaSGk7E+FAznGqPM29BDcZs5jXMnQevbwTG7zngEJT+na58w+NtG5SLU44sXsK
 C7rrIYJVlBq1q+ufMhtgvfgCihLObey/dLTbEQsquoqZRtecQszBUmp+mBd6O1buk2cF
 LIIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683902473; x=1686494473;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B7nyR7O1R/Xj3JLca+ITi9DYuDIC2bfZZm42nTKWjuM=;
 b=HrpmiBRN0GpzoraCrMFulshdxt+wXYvMC7bxZ6JCTrXHLL7zCMyIXtQonOn46kGQxI
 i1swWlU9qwEKCbazoqyQbOdHxDZkdFT0w/8ic7yN5LfZk1sJll8IVZKXJNwqAp4w3XNJ
 PjnWt59+Kls/MhzAFCqx2Mdm6XPWu60dFXVX0AZft1/NZaIQwRk9qjhlbbrOAJ96d0Mp
 3uWvQhAi2XV42yjmQvvjRL1gsmtL083xYAFhg6wlH2U53PF6oARJBkPg3UaSAq1GRgP8
 ZidY/ElPvAkVvRXQO0DR3VbH02cy7jd93TNkxFu4ca1w8qo5AAYHauKx2cnnM4LUJrZz
 8yPw==
X-Gm-Message-State: AC+VfDy1f2sM8NoQYAZlRbKOiKsdmwGqD61kHHz0ZHnSVlMRRg6YPGF1
 vMdhMKXq4WOWkJU6zypFOdCJoBGI/URdTCvYcSk=
X-Received: by 2002:adf:d092:0:b0:306:31fb:1c3d with SMTP id
 y18-20020adfd092000000b0030631fb1c3dmr16725735wrh.32.1683902473599; 
 Fri, 12 May 2023 07:41:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a7bcc0c000000b003f17848673fsm28916167wmh.27.2023.05.12.07.41.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 07:41:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 11/20] target/arm: Convert Bitfield to decodetree
Date: Fri, 12 May 2023 15:40:57 +0100
Message-Id: <20230512144106.3608981-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230512144106.3608981-1-peter.maydell@linaro.org>
References: <20230512144106.3608981-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: cmLcQwMmnmuk

From: Richard Henderson <richard.henderson@linaro.org>

Convert the BFM, SBFM, UBFM instructions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
[PMM: Rebased]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/a64.decode      |  13 +++
 target/arm/tcg/translate-a64.c | 144 ++++++++++++++++++---------------
 2 files changed, 94 insertions(+), 63 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 350b37c8f37..4d5709f9857 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -84,3 +84,16 @@ MOVZ            . 10 100101 .. ................ .....   @movw_64
 MOVZ            . 10 100101 .. ................ .....   @movw_32
 MOVK            . 11 100101 .. ................ .....   @movw_64
 MOVK            . 11 100101 .. ................ .....   @movw_32
+
+# Bitfield
+
+&bitfield       rd rn sf immr imms
+@bitfield_64    1 .. ...... 1 immr:6 imms:6 rn:5 rd:5      &bitfield sf=1
+@bitfield_32    0 .. ...... 0 0 immr:5 0 imms:5 rn:5 rd:5  &bitfield sf=0
+
+SBFM            . 00 100110 . ...... ...... ..... ..... @bitfield_64
+SBFM            . 00 100110 . ...... ...... ..... ..... @bitfield_32
+BFM             . 01 100110 . ...... ...... ..... ..... @bitfield_64
+BFM             . 01 100110 . ...... ...... ..... ..... @bitfield_32
+UBFM            . 10 100110 . ...... ...... ..... ..... @bitfield_64
+UBFM            . 10 100110 . ...... ...... ..... ..... @bitfield_32
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index a36b98925fb..f5649de60a8 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -4431,82 +4431,103 @@ static bool trans_MOVK(DisasContext *s, arg_movw *a)
     return true;
 }
 
-/* Bitfield
- *   31  30 29 28         23 22  21  16 15  10 9    5 4    0
- * +----+-----+-------------+---+------+------+------+------+
- * | sf | opc | 1 0 0 1 1 0 | N | immr | imms |  Rn  |  Rd  |
- * +----+-----+-------------+---+------+------+------+------+
+/*
+ * Bitfield
  */
-static void disas_bitfield(DisasContext *s, uint32_t insn)
+
+static bool trans_SBFM(DisasContext *s, arg_SBFM *a)
 {
-    unsigned int sf, n, opc, ri, si, rn, rd, bitsize, pos, len;
-    TCGv_i64 tcg_rd, tcg_tmp;
+    TCGv_i64 tcg_rd = cpu_reg(s, a->rd);
+    TCGv_i64 tcg_tmp = read_cpu_reg(s, a->rn, 1);
+    unsigned int bitsize = a->sf ? 64 : 32;
+    unsigned int ri = a->immr;
+    unsigned int si = a->imms;
+    unsigned int pos, len;
 
-    sf = extract32(insn, 31, 1);
-    opc = extract32(insn, 29, 2);
-    n = extract32(insn, 22, 1);
-    ri = extract32(insn, 16, 6);
-    si = extract32(insn, 10, 6);
-    rn = extract32(insn, 5, 5);
-    rd = extract32(insn, 0, 5);
-    bitsize = sf ? 64 : 32;
-
-    if (sf != n || ri >= bitsize || si >= bitsize || opc > 2) {
-        unallocated_encoding(s);
-        return;
-    }
-
-    tcg_rd = cpu_reg(s, rd);
-
-    /* Suppress the zero-extend for !sf.  Since RI and SI are constrained
-       to be smaller than bitsize, we'll never reference data outside the
-       low 32-bits anyway.  */
-    tcg_tmp = read_cpu_reg(s, rn, 1);
-
-    /* Recognize simple(r) extractions.  */
     if (si >= ri) {
         /* Wd<s-r:0> = Wn<s:r> */
         len = (si - ri) + 1;
-        if (opc == 0) { /* SBFM: ASR, SBFX, SXTB, SXTH, SXTW */
-            tcg_gen_sextract_i64(tcg_rd, tcg_tmp, ri, len);
-            goto done;
-        } else if (opc == 2) { /* UBFM: UBFX, LSR, UXTB, UXTH */
-            tcg_gen_extract_i64(tcg_rd, tcg_tmp, ri, len);
-            return;
+        tcg_gen_sextract_i64(tcg_rd, tcg_tmp, ri, len);
+        if (!a->sf) {
+            tcg_gen_ext32u_i64(tcg_rd, tcg_rd);
         }
-        /* opc == 1, BFXIL fall through to deposit */
+    } else {
+        /* Wd<32+s-r,32-r> = Wn<s:0> */
+        len = si + 1;
+        pos = (bitsize - ri) & (bitsize - 1);
+
+        if (len < ri) {
+            /*
+             * Sign extend the destination field from len to fill the
+             * balance of the word.  Let the deposit below insert all
+             * of those sign bits.
+             */
+            tcg_gen_sextract_i64(tcg_tmp, tcg_tmp, 0, len);
+            len = ri;
+        }
+
+        /*
+         * We start with zero, and we haven't modified any bits outside
+         * bitsize, therefore no final zero-extension is unneeded for !sf.
+         */
+        tcg_gen_deposit_z_i64(tcg_rd, tcg_tmp, pos, len);
+    }
+    return true;
+}
+
+static bool trans_UBFM(DisasContext *s, arg_UBFM *a)
+{
+    TCGv_i64 tcg_rd = cpu_reg(s, a->rd);
+    TCGv_i64 tcg_tmp = read_cpu_reg(s, a->rn, 1);
+    unsigned int bitsize = a->sf ? 64 : 32;
+    unsigned int ri = a->immr;
+    unsigned int si = a->imms;
+    unsigned int pos, len;
+
+    tcg_rd = cpu_reg(s, a->rd);
+    tcg_tmp = read_cpu_reg(s, a->rn, 1);
+
+    if (si >= ri) {
+        /* Wd<s-r:0> = Wn<s:r> */
+        len = (si - ri) + 1;
+        tcg_gen_extract_i64(tcg_rd, tcg_tmp, ri, len);
+    } else {
+        /* Wd<32+s-r,32-r> = Wn<s:0> */
+        len = si + 1;
+        pos = (bitsize - ri) & (bitsize - 1);
+        tcg_gen_deposit_z_i64(tcg_rd, tcg_tmp, pos, len);
+    }
+    return true;
+}
+
+static bool trans_BFM(DisasContext *s, arg_BFM *a)
+{
+    TCGv_i64 tcg_rd = cpu_reg(s, a->rd);
+    TCGv_i64 tcg_tmp = read_cpu_reg(s, a->rn, 1);
+    unsigned int bitsize = a->sf ? 64 : 32;
+    unsigned int ri = a->immr;
+    unsigned int si = a->imms;
+    unsigned int pos, len;
+
+    tcg_rd = cpu_reg(s, a->rd);
+    tcg_tmp = read_cpu_reg(s, a->rn, 1);
+
+    if (si >= ri) {
+        /* Wd<s-r:0> = Wn<s:r> */
         tcg_gen_shri_i64(tcg_tmp, tcg_tmp, ri);
+        len = (si - ri) + 1;
         pos = 0;
     } else {
-        /* Handle the ri > si case with a deposit
-         * Wd<32+s-r,32-r> = Wn<s:0>
-         */
+        /* Wd<32+s-r,32-r> = Wn<s:0> */
         len = si + 1;
         pos = (bitsize - ri) & (bitsize - 1);
     }
 
-    if (opc == 0 && len < ri) {
-        /* SBFM: sign extend the destination field from len to fill
-           the balance of the word.  Let the deposit below insert all
-           of those sign bits.  */
-        tcg_gen_sextract_i64(tcg_tmp, tcg_tmp, 0, len);
-        len = ri;
-    }
-
-    if (opc == 1) { /* BFM, BFXIL */
-        tcg_gen_deposit_i64(tcg_rd, tcg_rd, tcg_tmp, pos, len);
-    } else {
-        /* SBFM or UBFM: We start with zero, and we haven't modified
-           any bits outside bitsize, therefore the zero-extension
-           below is unneeded.  */
-        tcg_gen_deposit_z_i64(tcg_rd, tcg_tmp, pos, len);
-        return;
-    }
-
- done:
-    if (!sf) { /* zero extend final result */
+    tcg_gen_deposit_i64(tcg_rd, tcg_rd, tcg_tmp, pos, len);
+    if (!a->sf) {
         tcg_gen_ext32u_i64(tcg_rd, tcg_rd);
     }
+    return true;
 }
 
 /* Extract
@@ -4573,9 +4594,6 @@ static void disas_extract(DisasContext *s, uint32_t insn)
 static void disas_data_proc_imm(DisasContext *s, uint32_t insn)
 {
     switch (extract32(insn, 23, 6)) {
-    case 0x26: /* Bitfield */
-        disas_bitfield(s, insn);
-        break;
     case 0x27: /* Extract */
         disas_extract(s, insn);
         break;
-- 
2.34.1

