Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2148324njk;
        Sun, 1 Dec 2024 07:09:02 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUY3ZilwpDoeB/gVNKkPXa5Rlgjl/qEahPWiqNijRY0lmkmPTOHOlSLVejHsnEFVIvtsF/POD5UuZRJdw==@linaro.org
X-Google-Smtp-Source: AGHT+IFFeD0BQ8Sw6rOFzuQ0g0Wnxzq0TG8L/G98i9tIoNtIYggkH6x0bjABL2ZZW7tUwOYVHOOI
X-Received: by 2002:a05:6122:17aa:b0:50b:e9a5:cd7b with SMTP id 71dfb90a1353d-515569beb9bmr22744544e0c.9.1733065742512;
        Sun, 01 Dec 2024 07:09:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733065742; cv=none;
        d=google.com; s=arc-20240605;
        b=Q29+DOA0P/VyrQFIoWQV+vIK5+Fhc4lCE1y65FWjxPMIgXmsIDU7L9E6CxCNK2mi91
         2eux8119Yk60v3E0I5rsLdMeAKpcDK/uMIvkyoqbl8PODwbsN3FLeo4pTXiS0H5Y8By3
         vjXTxvYErFhFV9DHHHGWQCH4+WjBMzS8q6WEHxuvCsGGGu9KAK9zz8HmP/Xi3jA/wVaO
         BQewRp8KWuzkRjynnU4jTblEYpdtFZ2Ph1wBvQZwx9YRRw0oBq1DP3DKsqWqfvh2g5rN
         AdT2Yhh8B+VxIeQjrpqzAqmYiXhssd7QTZG+QW3cCFhT9jQ+REkZTzTgeX24FJC9ds5M
         HBaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=e1OIFt6Wa9ivuGHrhRCcysL/gALDZ16yEs6HdTP8v7U=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=BbQDUxZE1D8Yp8IAzy0+4mCO2mQqJg248bwSSpJKoqbzGw00+1jD4OWUSI0pwyC/QO
         gj8Xna/JOtsZdIs76/Vg+gxe2sYMWqIkWnjc9FpbwwhXzeFTlPmRyNZfcYMh7hw7rNh/
         EMZa3tsYSUBkMtlvHHaVA6XuKI7VkT7sT/IV766nro4tgfLHTZC4UypqNhWKeGBO4c9P
         +rvMZjnXwThPqTgq8kbSSl2eO5EpM2+NEeL7Hmb09vIp/U8R8kihvCsTwlVNw94RCHrZ
         IU8qRWmSWS/ROgGPIh51132Tg7esLsj3qK3UsM6rDliC8ehxFS5uw5L5qWP4lwBluPtj
         UDjg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HG+FMbOg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-5156cbed039si3668825e0c.32.2024.12.01.07.09.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Dec 2024 07:09:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HG+FMbOg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tHlWr-0001NK-SS; Sun, 01 Dec 2024 10:06:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlWn-0001Jl-NJ
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:06:29 -0500
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlWm-0004An-5q
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:06:29 -0500
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-5f1e7639391so1051847eaf.0
 for <qemu-arm@nongnu.org>; Sun, 01 Dec 2024 07:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733065587; x=1733670387; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e1OIFt6Wa9ivuGHrhRCcysL/gALDZ16yEs6HdTP8v7U=;
 b=HG+FMbOgfKTAyK5sTeeqbKd6jIyKdhAcbpVUR1CaWh5GieImoLrLhALzvzBynj4Tm7
 ODQjtOEDpMT912HmiVS0tyRnO/3F5Bgvga80MToX2GsdH/Yo76MBmP2OBAjIjTV91QA0
 Pi+NULxMsLLvwVbZynIAyInRGaHjSNbPzDRhhrbVMYv3r56i50pm4pm6Ual92lMN6c2/
 HCiMxSB3ZqR+mnTpRnG1imkw6u7NTPfIr130SwxZ9IgxIw+RwLZaM48beKMUC9CWd+Kj
 p6lhhXHD+bl8yxfSUB1wapOCrWd4JCh8SeKotSxPjbeGG+REQ3Z2nZi/C+F4cGbWFjdQ
 f0Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733065587; x=1733670387;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e1OIFt6Wa9ivuGHrhRCcysL/gALDZ16yEs6HdTP8v7U=;
 b=WRkVisOakuFGHuIcGDKyKOIoNq0+mE/DBZFN9+5KkjqtJGthDUSW2hliIvQ3U4ycvN
 sDEoo8KYhsWAJT2ucOli9LlA+V/x3YuVA5kW6dNoB1Ob+xGSUi44LRIEXAgB04R6AzE8
 81/kWYpLd5+HhiBURPY8tEICMmBD5PjtATgnfrZvuRMlTL2HSddRS3xn5GAkBmZ21tl9
 ZspxhRDBTDYijMtVCOLJa7UsZKIofnqePeYJqqPN2G2fAoNH5xwILIlRTNSR008cx5t0
 Kc1YQTrbyKp1pt9YzNIEb7n7DiRKlYYY77sBJ/u1FSYvb+hREfhH5ew4wz5fHaSxZCjI
 f6pg==
X-Gm-Message-State: AOJu0YxXYt4ujhbpMcCEnWAf+g4l1a1WWxBjjPaKu4Ouwnp8Ma/fVdTR
 iwL4ENfx4S3Q/K1DVJidoQU1Da9Agrik6lQM36et/IbJqaagOVH2PpL5grxM2RJ9Gx4EhfZQyOw
 QVBE=
X-Gm-Gg: ASbGncvI9QNFEfODR5MIgTymRvjzc9xM0ZD2ZouMZAOR14BeXNHfORS4DZy1Qfp2Zc0
 gBXcomPPqSrvyKxmLSjZY7LFolv8VmZyCvp+iPMyPSihsY0ffhENI94VwuIgAi5e5+FJTFRgMqw
 S8utXhjQzYH3ykRW0682UNsgs1eaq++ZxAjsK7Hf2H5IGFHri7Ymz1BVSoFJt2BwB4XXnSlitqw
 lPXJfS6tgCmgdnHhs4fh89T/SIl+a4cjjxCzkXcjMpa9jBtAKf8QxLybCPEXF5/e5bxIx6mE2nw
 S25TdUxLkfjxWAUdYnA5Vlh9fvMSkVS2TRIm
X-Received: by 2002:a05:6830:7199:b0:71d:5043:1026 with SMTP id
 46e09a7af769-71d65c932demr13944881a34.9.1733065586925; 
 Sun, 01 Dec 2024 07:06:26 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-71d7254473asm1822220a34.27.2024.12.01.07.06.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Dec 2024 07:06:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 15/67] target/arm: Convert disas_adc_sbc to decodetree
Date: Sun,  1 Dec 2024 09:05:14 -0600
Message-ID: <20241201150607.12812-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201150607.12812-1-richard.henderson@linaro.org>
References: <20241201150607.12812-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2e.google.com
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
X-TUID: u+HEgNhmLSd7

This includes ADC, SBC, ADCS, SBCS.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 43 +++++++++++++---------------------
 target/arm/tcg/a64.decode      |  6 +++++
 2 files changed, 22 insertions(+), 27 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 99ff787c61..d7747fcf57 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -8017,42 +8017,34 @@ TRANS(SMSUBL, do_muladd, a, true, true, MO_SL)
 TRANS(UMADDL, do_muladd, a, true, false, MO_UL)
 TRANS(UMSUBL, do_muladd, a, true, true, MO_UL)
 
-/* Add/subtract (with carry)
- *  31 30 29 28 27 26 25 24 23 22 21  20  16  15       10  9    5 4   0
- * +--+--+--+------------------------+------+-------------+------+-----+
- * |sf|op| S| 1  1  0  1  0  0  0  0 |  rm  | 0 0 0 0 0 0 |  Rn  |  Rd |
- * +--+--+--+------------------------+------+-------------+------+-----+
- */
-
-static void disas_adc_sbc(DisasContext *s, uint32_t insn)
+static bool do_adc_sbc(DisasContext *s, arg_rrr_sf *a,
+                       bool is_sub, bool setflags)
 {
-    unsigned int sf, op, setflags, rm, rn, rd;
     TCGv_i64 tcg_y, tcg_rn, tcg_rd;
 
-    sf = extract32(insn, 31, 1);
-    op = extract32(insn, 30, 1);
-    setflags = extract32(insn, 29, 1);
-    rm = extract32(insn, 16, 5);
-    rn = extract32(insn, 5, 5);
-    rd = extract32(insn, 0, 5);
+    tcg_rd = cpu_reg(s, a->rd);
+    tcg_rn = cpu_reg(s, a->rn);
 
-    tcg_rd = cpu_reg(s, rd);
-    tcg_rn = cpu_reg(s, rn);
-
-    if (op) {
+    if (is_sub) {
         tcg_y = tcg_temp_new_i64();
-        tcg_gen_not_i64(tcg_y, cpu_reg(s, rm));
+        tcg_gen_not_i64(tcg_y, cpu_reg(s, a->rm));
     } else {
-        tcg_y = cpu_reg(s, rm);
+        tcg_y = cpu_reg(s, a->rm);
     }
 
     if (setflags) {
-        gen_adc_CC(sf, tcg_rd, tcg_rn, tcg_y);
+        gen_adc_CC(a->sf, tcg_rd, tcg_rn, tcg_y);
     } else {
-        gen_adc(sf, tcg_rd, tcg_rn, tcg_y);
+        gen_adc(a->sf, tcg_rd, tcg_rn, tcg_y);
     }
+    return true;
 }
 
+TRANS(ADC, do_adc_sbc, a, false, false)
+TRANS(SBC, do_adc_sbc, a, true, false)
+TRANS(ADCS, do_adc_sbc, a, false, true)
+TRANS(SBCS, do_adc_sbc, a, true, true)
+
 /*
  * Rotate right into flags
  *  31 30 29                21       15          10      5  4      0
@@ -8305,10 +8297,6 @@ static void disas_data_proc_reg(DisasContext *s, uint32_t insn)
     switch (op2) {
     case 0x0:
         switch (op3) {
-        case 0x00: /* Add/subtract (with carry) */
-            disas_adc_sbc(s, insn);
-            break;
-
         case 0x01: /* Rotate right into flags */
         case 0x21:
             disas_rotate_right_into_flags(s, insn);
@@ -8322,6 +8310,7 @@ static void disas_data_proc_reg(DisasContext *s, uint32_t insn)
             break;
 
         default:
+        case 0x00: /* Add/subtract (with carry) */
             goto do_unallocated;
         }
         break;
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index c6609749ae..34bff988f7 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -746,6 +746,12 @@ ADDS_ext        . 01 01011001 ..... ... ... ..... .....  @addsub_ext
 SUBS_ext        . 11 01011001 ..... ... ... ..... .....  @addsub_ext
 
 # Add/subtract (carry)
+
+ADC             . 00 11010000 ..... 000000 ..... .....  @rrr_sf
+ADCS            . 01 11010000 ..... 000000 ..... .....  @rrr_sf
+SBC             . 10 11010000 ..... 000000 ..... .....  @rrr_sf
+SBCS            . 11 11010000 ..... 000000 ..... .....  @rrr_sf
+
 # Rotate right into flags
 # Evaluate into flags
 # Conditional compare (regster)
-- 
2.43.0

