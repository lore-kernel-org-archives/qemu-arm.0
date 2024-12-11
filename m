Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4192046njb;
        Wed, 11 Dec 2024 08:35:20 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVT+jLnbMKxBT+eha2aeIbdq4drs/PhqJmq3Y1HtWqZ+CFvEr672JBZ0BpNdKtDg8QYbo7F7NrFtmSvXg==@linaro.org
X-Google-Smtp-Source: AGHT+IFkOMj/R2alUEy+QsdPgcm40J5/YAHpI9PTSlCGVLcw0UPDdNRzPHA/g3CQntQnMslwvjCN
X-Received: by 2002:a05:6214:21ca:b0:6d9:dd:5c5a with SMTP id 6a1803df08f44-6d935319225mr53261266d6.23.1733934920630;
        Wed, 11 Dec 2024 08:35:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733934920; cv=none;
        d=google.com; s=arc-20240605;
        b=ix6WkUcM7urSGqI+8/dCqrYso8gkCFjd2SDuKnkzsfFRC88PJQ3QGi8Z2NCI6XWQZJ
         h3Im5N/WATSaLp2sR+rz+2YAoaaasOLzR/PU0obiSBu3BeeGUyT488tpWBFeOb8RO4aA
         fx9TECs6CDBEikW2Dms+EwEEZHnbaVDM9t3i0iwnnYV/6LHdrEaz2HKso/ZU8XIEi+lT
         DVLsf9eHuaY6X9+wQC5iZC4C5jLbFi9VwmLC/zzJ37DVYqkjqRZCsseWxh89pDO5bal5
         b/Nd4qBZdXS4rMA5KhACSDVmuKBIlrMO/VbRL0BBDXx6NNbncdpLATnAZULXHp9fbway
         QHfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9Aqe7AiIYBOFmb8LLSvrb79BS28+QL4PQSesWGDIC9U=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=cSAzh5K6pAgrxh4nPD0YhLf6h5BWUZjlL7CvmsylG/N3ewPRN5cD6MY1JRSef3PeJy
         ewzmtNNYokZLSxcCilOIS3DVnjt378tRtm3GcTb6N70e+PML+HX3x3wj6Ys716Z9O25H
         QfX9RuR32omKPCDrNneggK4AjgKly+Pb9M4pU6nWKO+FR9QPctjFgnOaVP+zKdZ5YtbU
         JfYeHmbRF4ei1LiWBeNm9giN8PnbIwmqxieWgPilgrUnCFJM3h/LnU3u/2fYvKWnaejJ
         uSOMO0yT37tShkzuPraMp+M6Df7CnaFJx07nsrVmwo6MLw3QU+Bt4M+CCnTxR+q8UYOv
         VJqA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K7O8tsv0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8daa07a75si176852366d6.185.2024.12.11.08.35.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 08:35:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K7O8tsv0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLPdY-0006OD-6e; Wed, 11 Dec 2024 11:32:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPcd-0004LU-5n
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:31:35 -0500
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPcb-0001G8-2D
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:31:34 -0500
Received: by mail-qt1-x82a.google.com with SMTP id
 d75a77b69052e-4678afeb133so6564131cf.0
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 08:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733934692; x=1734539492; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9Aqe7AiIYBOFmb8LLSvrb79BS28+QL4PQSesWGDIC9U=;
 b=K7O8tsv0T15jU39jSprH/C8K6wMHC3O3aa3pp2PyY4chDN8d9BVlpJTc5+tW3Gwll0
 NF+FLEwBambFDC8qXF6K6/irXCh8BLvu9DKWW/sw4jTYC+4yZ3FgQKc2OwYqCGjdNpv9
 co0/w/gw10/0UXlYEqqXrBAa+ylPm1O3DXOmWzy+E9Ja4uzninLRVsHsKkKxpMewRbJb
 X7ea/wtNOd0dNHH3cE96iXYHS7ZGwHm7+o8tXjYvwWjzgXA8ojShdPeBapEvScJHRpdf
 7TuWEAugGHoV6fKZgDnzf3CiyJaBVaL9s9c4KO+3hie8NDzvxXyOOGalZDP1JRai6cTq
 3bXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733934692; x=1734539492;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9Aqe7AiIYBOFmb8LLSvrb79BS28+QL4PQSesWGDIC9U=;
 b=l4l9matkf8u4nUDKWLGn1F2aBj7LWkDdgDp8IvwvLvtK1RT2/v5+pciaGzfwK1/uLI
 NR4921PXWi96sByegwYxS0FQ0QNOPcwONybBcoHhfAYOo0mmJeVHsz3JyRv4LqUAp4Cr
 OhOF6bODpzieAmmQ32/LaWfgmhTs/mKifr7OZV0J4KlzT+jNX9ZCwUBOSLW2yiVLsIYU
 I6sa+WYW30h5iud6EKQxl8/sdy6QjVjk2gdeKtjsgMpegi1OCYRBgTU/ljzEUnNaGanB
 AbprZn4GWOHzG19vH2cjWsHGerkFdR7Fs2+3eTHNthX0PW0u4JRAiS8bg3NJWe0R5o7v
 Et9g==
X-Gm-Message-State: AOJu0Ywfz/DrrPuy3AGFBxLMo2iNUTkQ6KwxReOu+qZqiYjiu5R4H1z3
 3hmGNTtyBzeSOKqBEQRU7y5pOjId9qLkwBLeV02OdNdNYUVn8oIyCkES/YCq/Xo=
X-Gm-Gg: ASbGncvt+7G2zv3anpPVzUPkC0qiTl0gNiMVpTbUquJ8VrnG05Hssj7qpkCOwTlOa59
 fVOIFglqu9zcNdxmUB6/Ke0Aez+7mH2JZbzT4IbQQH/D6RQjeoTwWbETpSy/cyRez59XkU4eAdO
 +fXuZLQ2Q+qC8gYCE24YER7pvFh+znQ0kT9LlAgYTzMJPo3OtgRIQT8o18f1feXRFSq9zjw7CsD
 3YUV+1gHs0Uc6EkkK3i1wXFKfSN9777MTtpjnLmCD3pHyrigkr5TUSNsan6hw==
X-Received: by 2002:ac8:5ad1:0:b0:465:2fba:71b5 with SMTP id
 d75a77b69052e-46789527242mr56873671cf.13.1733934691947; 
 Wed, 11 Dec 2024 08:31:31 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-46755db613csm43849381cf.70.2024.12.11.08.31.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 08:31:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 12/69] target/arm: Convert disas_add_sub_ext_reg to
 decodetree
Date: Wed, 11 Dec 2024 10:29:39 -0600
Message-ID: <20241211163036.2297116-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211163036.2297116-1-richard.henderson@linaro.org>
References: <20241211163036.2297116-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82a.google.com
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
X-TUID: iHjOiEpcQRIr

This includes ADD, SUB, ADDS, SUBS (extended register).

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 65 +++++++++++-----------------------
 target/arm/tcg/a64.decode      |  9 +++++
 2 files changed, 29 insertions(+), 45 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index ecc8899dd8..8f777875fe 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -7864,57 +7864,27 @@ TRANS(AND_r, do_logic_reg, a, tcg_gen_and_i64, tcg_gen_andc_i64, false)
 TRANS(ANDS_r, do_logic_reg, a, tcg_gen_and_i64, tcg_gen_andc_i64, true)
 TRANS(EOR_r, do_logic_reg, a, tcg_gen_xor_i64, tcg_gen_eqv_i64, false)
 
-/*
- * Add/subtract (extended register)
- *
- *  31|30|29|28       24|23 22|21|20   16|15  13|12  10|9  5|4  0|
- * +--+--+--+-----------+-----+--+-------+------+------+----+----+
- * |sf|op| S| 0 1 0 1 1 | opt | 1|  Rm   |option| imm3 | Rn | Rd |
- * +--+--+--+-----------+-----+--+-------+------+------+----+----+
- *
- *  sf: 0 -> 32bit, 1 -> 64bit
- *  op: 0 -> add  , 1 -> sub
- *   S: 1 -> set flags
- * opt: 00
- * option: extension type (see DecodeRegExtend)
- * imm3: optional shift to Rm
- *
- * Rd = Rn + LSL(extend(Rm), amount)
- */
-static void disas_add_sub_ext_reg(DisasContext *s, uint32_t insn)
+static bool do_addsub_ext(DisasContext *s, arg_addsub_ext *a,
+                          bool sub_op, bool setflags)
 {
-    int rd = extract32(insn, 0, 5);
-    int rn = extract32(insn, 5, 5);
-    int imm3 = extract32(insn, 10, 3);
-    int option = extract32(insn, 13, 3);
-    int rm = extract32(insn, 16, 5);
-    int opt = extract32(insn, 22, 2);
-    bool setflags = extract32(insn, 29, 1);
-    bool sub_op = extract32(insn, 30, 1);
-    bool sf = extract32(insn, 31, 1);
+    TCGv_i64 tcg_rm, tcg_rn, tcg_rd, tcg_result;
 
-    TCGv_i64 tcg_rm, tcg_rn; /* temps */
-    TCGv_i64 tcg_rd;
-    TCGv_i64 tcg_result;
-
-    if (imm3 > 4 || opt != 0) {
-        unallocated_encoding(s);
-        return;
+    if (a->sa > 4) {
+        return false;
     }
 
     /* non-flag setting ops may use SP */
     if (!setflags) {
-        tcg_rd = cpu_reg_sp(s, rd);
+        tcg_rd = cpu_reg_sp(s, a->rd);
     } else {
-        tcg_rd = cpu_reg(s, rd);
+        tcg_rd = cpu_reg(s, a->rd);
     }
-    tcg_rn = read_cpu_reg_sp(s, rn, sf);
+    tcg_rn = read_cpu_reg_sp(s, a->rn, a->sf);
 
-    tcg_rm = read_cpu_reg(s, rm, sf);
-    ext_and_shift_reg(tcg_rm, tcg_rm, option, imm3);
+    tcg_rm = read_cpu_reg(s, a->rm, a->sf);
+    ext_and_shift_reg(tcg_rm, tcg_rm, a->st, a->sa);
 
     tcg_result = tcg_temp_new_i64();
-
     if (!setflags) {
         if (sub_op) {
             tcg_gen_sub_i64(tcg_result, tcg_rn, tcg_rm);
@@ -7923,19 +7893,25 @@ static void disas_add_sub_ext_reg(DisasContext *s, uint32_t insn)
         }
     } else {
         if (sub_op) {
-            gen_sub_CC(sf, tcg_result, tcg_rn, tcg_rm);
+            gen_sub_CC(a->sf, tcg_result, tcg_rn, tcg_rm);
         } else {
-            gen_add_CC(sf, tcg_result, tcg_rn, tcg_rm);
+            gen_add_CC(a->sf, tcg_result, tcg_rn, tcg_rm);
         }
     }
 
-    if (sf) {
+    if (a->sf) {
         tcg_gen_mov_i64(tcg_rd, tcg_result);
     } else {
         tcg_gen_ext32u_i64(tcg_rd, tcg_result);
     }
+    return true;
 }
 
+TRANS(ADD_ext, do_addsub_ext, a, false, false)
+TRANS(SUB_ext, do_addsub_ext, a, true, false)
+TRANS(ADDS_ext, do_addsub_ext, a, false, true)
+TRANS(SUBS_ext, do_addsub_ext, a, true, true)
+
 /*
  * Add/subtract (shifted register)
  *
@@ -8374,8 +8350,7 @@ static void disas_data_proc_reg(DisasContext *s, uint32_t insn)
     if (!op1) {
         if (op2 & 8) {
             if (op2 & 1) {
-                /* Add/sub (extended register) */
-                disas_add_sub_ext_reg(s, insn);
+                goto do_unallocated;
             } else {
                 /* Add/sub (shifted register) */
                 disas_add_sub_reg(s, insn);
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 8e2949d236..0539694506 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -727,6 +727,15 @@ ANDS_r          . 11 01010 .. . ..... ...... ..... .....    @logic_shift
 
 # Add/subtract (shifted reg)
 # Add/subtract (extended reg)
+
+&addsub_ext     rd rn rm sf sa st
+@addsub_ext     sf:1 .. ........ rm:5 st:3 sa:3 rn:5 rd:5   &addsub_ext
+
+ADD_ext         . 00 01011001 ..... ... ... ..... .....     @addsub_ext
+SUB_ext         . 10 01011001 ..... ... ... ..... .....     @addsub_ext
+ADDS_ext        . 01 01011001 ..... ... ... ..... .....     @addsub_ext
+SUBS_ext        . 11 01011001 ..... ... ... ..... .....     @addsub_ext
+
 # Add/subtract (carry)
 # Rotate right into flags
 # Evaluate into flags
-- 
2.43.0

