Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2150196njk;
        Sun, 1 Dec 2024 07:11:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWLfeDD+PyGKHS2EKUOIfEMvi5khtPGNbFZZ9W2vdb9VPdI85Ih5lcdpM1inOJQBpv8a5lR1oNRbBHFJw==@linaro.org
X-Google-Smtp-Source: AGHT+IE4T3U13UqNUdWf5ug8fboc1Sxunb/aqlrVde0ZwjvlZ+XvP9psBXOF6+ny3BGcb2al7/CF
X-Received: by 2002:a05:620a:6403:b0:7b6:64ad:827b with SMTP id af79cd13be357-7b67c4a148bmr2849193485a.60.1733065897371;
        Sun, 01 Dec 2024 07:11:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733065897; cv=none;
        d=google.com; s=arc-20240605;
        b=goX1fwASPKLb57xIsdh2VmbVB7UDspxkRZojzxqfgBUG93XpxXLMkW/iG9K+HEGr5p
         CB8HvuiFzHUS8xaJB8ltXhs/N2x9Qe90sRhSiDoTd3UU5J+qTvO8lIY7X7EK0PSVKuA3
         5NqddAwCb8ETRFQe/oWp1N5tPNHVDlLw+A9/eamoU4uQBQXZJOLSZ5rICglhiEW5aDN4
         Ppr4bS312J4CVOOteBcWYC/irtTyjNNOqCyxZUESLIodxcTkmsElBVC73rhFSDeJzeVg
         FryEbKmP4By2GzuLs8H58JxzFZ6YYs20eodBkl1upBYfwkGO2+3LLuvy8EYzR4a2LSGb
         CEQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Yc3dt5/qw9Eh/M5TloW257GXIRkXy8l/MSNfhyYjMpI=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=AHzMXxpbh1Zaux7U2l8BaUC4Kro5XUtD8mLJoNLIi7nlpc/tAuBLeO41vksSMezBbI
         NqRmVbC8ggXgmWwf1mJeoAx7EeMoQc1Ph89xSTskkS332k28oeOy9fhd1hhYvyCJ2fZz
         8uZQ96MlGssC6BIFy+/f98u9pmGK9ShV9dA0noY/tLqh4OB7m9qYaXPQGVjUvBTx30aY
         rtIZkvk3UtdCDiQtRtVT6HLD6vX44s4b7yYqFhqK7BMmUtMuDo3/Lk8TMHeKh3xhmZv9
         4ALTdONvA4hvFJJtdWWN+BKhChGsqWmRhWSSoJjikbYJ/YerDuVgxbBJiX5/axyQ4hOI
         rrXw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WP+Jw34b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6849c237asi1121025485a.365.2024.12.01.07.11.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Dec 2024 07:11:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WP+Jw34b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tHlWo-0001KE-Cz; Sun, 01 Dec 2024 10:06:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlWl-0001Hv-JE
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:06:27 -0500
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlWj-00049l-NT
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:06:27 -0500
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-3ea427001c5so1717273b6e.3
 for <qemu-arm@nongnu.org>; Sun, 01 Dec 2024 07:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733065584; x=1733670384; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yc3dt5/qw9Eh/M5TloW257GXIRkXy8l/MSNfhyYjMpI=;
 b=WP+Jw34blFFB7tJHDYqG3FV5rY6DBdN3wAa2xnRf+unTJim6SnFtth0B1fiOny+SU1
 Fbx+FGFNlD1FLJQ5gQp9Pl6COrtlqBzBEGKqUIKMrWcDVlSyrjARm/rWFtlFnzhr1TUZ
 4NMQnUvVvXnUx+9AKBP3xH+kWG6t9MBP5mbaokXKxH4Qa6XZ9kyurHgktDNUdwvQ2Yea
 8ZLg56wy2rzuGjHDABSOgBnILDd2yNk5TY1BWyoi+zDBX4iNj04iTUMS41Qce04ZDVj7
 QyOJAWv/wdl1ofF7Xb+sMVUy/3cdi0kfj5UJAOnQfXH1k+kxFyPNCPQYJVaslvOo6xhZ
 DOtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733065584; x=1733670384;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yc3dt5/qw9Eh/M5TloW257GXIRkXy8l/MSNfhyYjMpI=;
 b=sr9N68PsV91VP7G5BGddS3DxtOIhgBFtPXuR5ZKfz728yBPGmMkvfUgOp6+48Rjg7E
 gqxRaeKazcmMdUdSefIJWeK4Gs8+kyCR26k/N2/g2WeC4liXal3tfNWGGvKZw6UTvjzA
 A53bu+j9MKDhKaUko87sFBueMEX/tTHvIjWwK/rWASo+VPFBv13lea9qH1y2WUwqF+ep
 hBTr5QVc6E7UTZ/cX4msfa4LhAJ2jhZmKQKQ+ZnIze8FIDevOs20N6kr2JTp7ppohuAw
 exHnHxjAd/bGA0Q/XfhmOO6uSi7g0jo7TP1jExgq1IFnHlKKusbZvkaQcG+BLbCBMFX6
 ne9Q==
X-Gm-Message-State: AOJu0YyBc6iHacg+ZLTz3t8NLGVIBNzU0zoPzFJWo0TKyz6FRMEjkzu4
 3SC9OmiKihPewn9+PzR98JfpsqQMzz7o+vkxAfYbyOpclsjZPmNIFxZ4ZWX+q56I7bUxZKDvJCJ
 sr0Y=
X-Gm-Gg: ASbGncsppM60P+iBE+pajMPq4UGWxuyL9qMMjlW5MmMLhE33RzNyIr+FIGJYcKTxXFi
 u0l8z3B3d/j6aAGJC8yLSD1FjzaZlVeIAVNuoCSBC+C5CHBi7XA3A4K5gYNLUSW0duMeBzsG039
 EXZbIC0o0uSjIvPmL0yCRqvVsZKnDA2scAaGGnqmE7Nl98SytnVAbxnqX8xZvTqe6WD2AxW0AfQ
 iwz3hgLDk+zePx8UYYHXCB/x8VSS9iEJFfY9Qrd0bAFtTYndSEaYPow/ou8Ci85ReMOuQNhaC2o
 Jh/yjbLbVacDKv/iU5nSVlMxuOXfUk+4BYyS
X-Received: by 2002:a05:6830:6f0c:b0:718:f57:11ea with SMTP id
 46e09a7af769-71d65c7aea2mr15382950a34.3.1733065584326; 
 Sun, 01 Dec 2024 07:06:24 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-71d7254473asm1822220a34.27.2024.12.01.07.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Dec 2024 07:06:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 12/67] target/arm: Convert disas_add_sub_ext_reg to decodetree
Date: Sun,  1 Dec 2024 09:05:11 -0600
Message-ID: <20241201150607.12812-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201150607.12812-1-richard.henderson@linaro.org>
References: <20241201150607.12812-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22a.google.com
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
X-TUID: 5j6ZNWhXbAVF

This includes ADD, SUB, ADDS, SUBS (extended register).

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
index 53629119b2..b4ccad34fb 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -727,6 +727,15 @@ ANDS_r          . 11 01010 .. . ..... ...... ..... .....  @logic_shift
 
 # Add/subtract (shifted reg)
 # Add/subtract (extended reg)
+
+&addsub_ext     rd rn rm sf sa st
+@addsub_ext     sf:1 .. ........ rm:5 st:3 sa:3 rn:5 rd:5  &addsub_ext
+
+ADD_ext         . 00 01011001 ..... ... ... ..... .....  @addsub_ext
+SUB_ext         . 10 01011001 ..... ... ... ..... .....  @addsub_ext
+ADDS_ext        . 01 01011001 ..... ... ... ..... .....  @addsub_ext
+SUBS_ext        . 11 01011001 ..... ... ... ..... .....  @addsub_ext
+
 # Add/subtract (carry)
 # Rotate right into flags
 # Evaluate into flags
-- 
2.43.0

