Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp1996007ejb;
        Fri, 24 May 2024 16:32:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVYMwrLOWqtKsMzNl+Ib2+prfVLnopTHLz2DFljrXKXvC29yQnXX9GW6Pzk8kgYgRqdqjkL9AZJtWs0I3rgCCdtviE13ee+
X-Google-Smtp-Source: AGHT+IEsQ/h/NapjLdurDETOlHvngcmq0BML0QS8IcwmwbNu0HroBhqna/OhvBFUr4w7Qj+2Nd7O
X-Received: by 2002:ac8:7d81:0:b0:439:d07d:e25f with SMTP id d75a77b69052e-43fafb16fa4mr69677201cf.16.1716593524105;
        Fri, 24 May 2024 16:32:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716593524; cv=none;
        d=google.com; s=arc-20160816;
        b=pDqV/QXffSJIo0PXm15bnG6J+ca7U15EzervELE1x/uceajKYNqejqm9AukihfI81V
         e8bs8GReIL1h3h2UkmFNN8Z6cqRVeoX6UdiNJht1qBWG0quqjrX8McWbyNjKU8YktdJA
         gFaUo+TnQ6OsydRZRrfrwX1LqxaG6xDu+pAJAjp98+gt3WFXJ272hKLUiLnNuHNG+FNT
         TnG5hnL/n4ajPbuIssiqo71khNHBxRcISyNDKvNFYZn98NmC/gbQfDVREyfqojHGaQ2t
         Qg1Z3Ok2U7qxuFEaJWHYQcBqFxiVqfZc0WBTbkyZ58iJqyK/aNNETcDwc5fuABhVdfhQ
         /Obg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=uPywkpQAhrA1k7AEfIqLBpGakz9C1XFcBO78m8F0zkI=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=B4E42yu1n77eM7G3s7mH5o8JUYyL1seoK2ipJtb/zBHO7zQ/GSkN3+KyxNT61oeyhb
         PhFPpRJAd20SomdcQZayyr4hx/OAsTwjb11Y4ORV+csO6T7sZ7WQ4DFdLkqvEj9fcAQW
         LHwRVawHxgeush4cF2Dz4z9o1YaSckSQH71annWi4qB3O41ciNb0yHWz2hMQ6NQaCUVd
         oyEsZ7YZke9hyh/afVqGXfMTkgcqRJoGZPyznuTegQ7MH0fqrqg4BnK3yN+1eFfb8P4V
         wdL+MmLHUxPie9GYYoLDpEbPV+xwHERSrY6tZXcWkFGGCuo2NVxYtNYDHhLmDNquhm1O
         ZLGw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OzPBlGk+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43fb17baa94si29174351cf.20.2024.05.24.16.32.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 May 2024 16:32:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OzPBlGk+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sAeJ8-00034N-Nt; Fri, 24 May 2024 19:26:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeI1-0007hQ-4D
 for qemu-arm@nongnu.org; Fri, 24 May 2024 19:25:34 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeHt-0006yb-Ci
 for qemu-arm@nongnu.org; Fri, 24 May 2024 19:25:32 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-6f8f34cb0beso1044768b3a.1
 for <qemu-arm@nongnu.org>; Fri, 24 May 2024 16:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716593120; x=1717197920; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uPywkpQAhrA1k7AEfIqLBpGakz9C1XFcBO78m8F0zkI=;
 b=OzPBlGk+rk9RjOWDiKx5b6aTJXSV0G0EWxm9va00W8pbcGvhyrcIf38Gm/iyY1TaRC
 Jvd4FT+LT0kJ2vGAb3sy/zLM5sA+UtVXGhVTR8LJbHy42pvw0gVcSk1hYMf/BO8LrGtO
 4W/zcQtImN/ANPyAnk6Qm6QlqJQB+93m+OAHnbLnuinDiKa0Zhvw39KBKUwlyUMQ8Zv1
 rX1lnzVeBb/JHTTB9ohDFUCcdSdF42jIFRATI3R+v0t654cBs5sEc1q67rFfXQiDK8kp
 S79QtJSZQLq+4inMk48U9073PlKXck2gWgtRvDWxEk1tK1RRqu9p+BrhhBWOp2LN1GxG
 xagA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716593120; x=1717197920;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uPywkpQAhrA1k7AEfIqLBpGakz9C1XFcBO78m8F0zkI=;
 b=Vs/iRtAC+KK6DoElnmWwtyab+xqRCJ8V6tzcCONjGT7Dr93uA6Isez5aMnnYPQeGNW
 Qm+cTHYpgFRfoyH2Nj+hmb8d4bD3yy/5S+K9S30Kdh2MqVOxueewXl1tPJISxotSPeIE
 VyJ8i4Eu+XwlTTDnoVSDb6/zVUayXvkR71aW9gHUmtnV4D5d4Y0QJZYIhdq+gUTaMNb/
 cY2cHGACEn35uT+YyXk6DazZgkU63OVfhaGfYLa1iJTn2xCpcB+l4ZlgQ+EzsePwaOnx
 36d/tvuyyrfdH3tDaD/Z/a7ZqtcsRAUMzVsbckV+SVXwnrTBPmX33G2ao38QA3gtec1n
 GAXw==
X-Gm-Message-State: AOJu0Yy/YFxevY8gk9K/WfFcs59St+3yBTarArroqqEeF6AeQ4NttxbG
 SH9K7LkEsGvGtAOGViKzoEnN9iiFNwggiok+wDOVfF7FTTFCEq1DYfa1L5X8t/XPJqH7j0+IWsM
 H
X-Received: by 2002:a05:6a21:32a3:b0:1b0:194a:82f5 with SMTP id
 adf61e73a8af0-1b212dc7bf8mr5123624637.21.1716593120573; 
 Fri, 24 May 2024 16:25:20 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fbf2cfd1sm1591695b3a.3.2024.05.24.16.25.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 16:25:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 67/67] target/arm: Convert FCSEL to decodetree
Date: Fri, 24 May 2024 16:21:21 -0700
Message-Id: <20240524232121.284515-68-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240524232121.284515-1-richard.henderson@linaro.org>
References: <20240524232121.284515-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: miUZYD5a3V3e

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/a64.decode      |   4 ++
 target/arm/tcg/translate-a64.c | 108 ++++++++++++++-------------------
 2 files changed, 49 insertions(+), 63 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 6f6cd805b7..5dadbc74d7 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1000,6 +1000,10 @@ SQDMULH_vi      0.00 1111 10 . ..... 1100 . 0 ..... .....   @qrrx_s
 SQRDMULH_vi     0.00 1111 01 .. .... 1101 . 0 ..... .....   @qrrx_h
 SQRDMULH_vi     0.00 1111 10 . ..... 1101 . 0 ..... .....   @qrrx_s
 
+# Floating-point conditional select
+
+FCSEL           0001 1110 .. 1 rm:5 cond:4 11 rn:5 rd:5     esz=%esz_hsd
+
 # Floating-point data-processing (3 source)
 
 @rrrr_hsd       .... .... .. . rm:5  . ra:5  rn:5  rd:5     &rrrr_e esz=%esz_hsd
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 3c2963ebaa..845aaa2bfb 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5866,6 +5866,50 @@ static bool trans_ADDP_s(DisasContext *s, arg_rr_e *a)
     return true;
 }
 
+/*
+ * Floating-point conditional select
+ */
+
+static bool trans_FCSEL(DisasContext *s, arg_FCSEL *a)
+{
+    TCGv_i64 t_true, t_false;
+    DisasCompare64 c;
+
+    switch (a->esz) {
+    case MO_32:
+    case MO_64:
+        break;
+    case MO_16:
+        if (!dc_isar_feature(aa64_fp16, s)) {
+            return false;
+        }
+        break;
+    default:
+        return false;
+    }
+
+    if (!fp_access_check(s)) {
+        return true;
+    }
+
+    /* Zero extend sreg & hreg inputs to 64 bits now.  */
+    t_true = tcg_temp_new_i64();
+    t_false = tcg_temp_new_i64();
+    read_vec_element(s, t_true, a->rn, 0, a->esz);
+    read_vec_element(s, t_false, a->rm, 0, a->esz);
+
+    a64_test_cc(&c, a->cond);
+    tcg_gen_movcond_i64(c.cond, t_true, c.value, tcg_constant_i64(0),
+                        t_true, t_false);
+
+    /*
+     * Note that sregs & hregs write back zeros to the high bits,
+     * and we've already done the zero-extension.
+     */
+    write_fp_dreg(s, a->rd, t_true);
+    return true;
+}
+
 /*
  * Floating-point data-processing (3 source)
  */
@@ -7332,68 +7376,6 @@ static void disas_fp_ccomp(DisasContext *s, uint32_t insn)
     }
 }
 
-/* Floating point conditional select
- *   31  30  29 28       24 23  22  21 20  16 15  12 11 10 9    5 4    0
- * +---+---+---+-----------+------+---+------+------+-----+------+------+
- * | M | 0 | S | 1 1 1 1 0 | type | 1 |  Rm  | cond | 1 1 |  Rn  |  Rd  |
- * +---+---+---+-----------+------+---+------+------+-----+------+------+
- */
-static void disas_fp_csel(DisasContext *s, uint32_t insn)
-{
-    unsigned int mos, type, rm, cond, rn, rd;
-    TCGv_i64 t_true, t_false;
-    DisasCompare64 c;
-    MemOp sz;
-
-    mos = extract32(insn, 29, 3);
-    type = extract32(insn, 22, 2);
-    rm = extract32(insn, 16, 5);
-    cond = extract32(insn, 12, 4);
-    rn = extract32(insn, 5, 5);
-    rd = extract32(insn, 0, 5);
-
-    if (mos) {
-        unallocated_encoding(s);
-        return;
-    }
-
-    switch (type) {
-    case 0:
-        sz = MO_32;
-        break;
-    case 1:
-        sz = MO_64;
-        break;
-    case 3:
-        sz = MO_16;
-        if (dc_isar_feature(aa64_fp16, s)) {
-            break;
-        }
-        /* fallthru */
-    default:
-        unallocated_encoding(s);
-        return;
-    }
-
-    if (!fp_access_check(s)) {
-        return;
-    }
-
-    /* Zero extend sreg & hreg inputs to 64 bits now.  */
-    t_true = tcg_temp_new_i64();
-    t_false = tcg_temp_new_i64();
-    read_vec_element(s, t_true, rn, 0, sz);
-    read_vec_element(s, t_false, rm, 0, sz);
-
-    a64_test_cc(&c, cond);
-    tcg_gen_movcond_i64(c.cond, t_true, c.value, tcg_constant_i64(0),
-                        t_true, t_false);
-
-    /* Note that sregs & hregs write back zeros to the high bits,
-       and we've already done the zero-extension.  */
-    write_fp_dreg(s, rd, t_true);
-}
-
 /* Floating-point data-processing (1 source) - half precision */
 static void handle_fp_1src_half(DisasContext *s, int opcode, int rd, int rn)
 {
@@ -8205,7 +8187,7 @@ static void disas_data_proc_fp(DisasContext *s, uint32_t insn)
             break;
         case 3:
             /* Floating point conditional select */
-            disas_fp_csel(s, insn);
+            unallocated_encoding(s); /* in decodetree */
             break;
         case 0:
             switch (ctz32(extract32(insn, 12, 4))) {
-- 
2.34.1

