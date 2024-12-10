Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3440480njb;
        Tue, 10 Dec 2024 08:22:25 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWlCQPDNImH7YgefF2HvPmHoKf6QK7A4ZltT9nYPwZpAJfmdhFh7ItkTNo67L0RyuyNwyxTTno4X0PMgQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFBCAIkB0Clz7R0QGozbO+/IYTuVfUe6hhhhWF2fk+oLyIA6cR4CvXufXn4iI1IqrLlIfDO
X-Received: by 2002:a05:6214:d06:b0:6d8:7d6b:cb78 with SMTP id 6a1803df08f44-6d91e44684emr84425756d6.47.1733847745117;
        Tue, 10 Dec 2024 08:22:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733847745; cv=none;
        d=google.com; s=arc-20240605;
        b=ihSufsEKcIXz/vY71eAfTrP+gAgeAwJOOmB49q0w/0mo1WOp5Sgepj+5tSlf+jGQ8i
         FTD7A1vvFD9iEzCQYMQ0fKjArdDat5xJYSAG+DTjmyMpGqffwTNjxoQYq7Rp1CYFi7Wv
         Gpgu5yur5b0Wz8OU2WMANukX+1M+FzIo4poZfK3QWpOafbsIG8YFG4qJ8872DIfMxJlx
         gk3ArLMD1h27gr9Y9CJCDsje0X7OZ6UMFimUZX+DzOj10wzPThrJzP72v3R5eIMMV13e
         qN1OswxcuuDBdf4CoReltYBkwuevcxyjeDZXzSAXjsKoaVagLfCmpWVnJjj+Uz7HLAuB
         P5Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9Aqe7AiIYBOFmb8LLSvrb79BS28+QL4PQSesWGDIC9U=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=JwdhsAJHQ44b43TNb1lPlamv6DN0waFnp0/wYZAk8S1ZRnQiE2IsX6ZX3FT+uwzr1m
         NchVP/4E7pC7Rx4WTHQ03Wmu5NR32XwtbLPwKs7rxV8+vvCOl4ioutypnSRR93exQsLV
         ZecDoG6AeOXqLwMsgULiUidxz5rpn6gY5Z0+hpXtXBqU1b1YEUnBjxPEotKgJgkbOAxV
         Yt+a+tmYo9fH25UQWh5g4zHXW3F3007Kj1nKg56mQ9etrfDJ8AVdTuF56g8zd3BaiZXR
         J1+L/Twf2gwUKS2O3pqMFmh1/9XcY9IKnE52J+MJuehu4AHwpdxUuz32FC3TJH+fCx4F
         hGhw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="wRMjQuf/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d92fe3c0b4si10490806d6.477.2024.12.10.08.22.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2024 08:22:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="wRMjQuf/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tL2wa-0002c2-Id; Tue, 10 Dec 2024 11:18:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL2wV-0002aL-Co
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 11:18:36 -0500
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL2wT-0006NR-6z
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 11:18:35 -0500
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-53ff1f7caaeso3304725e87.0
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2024 08:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733847511; x=1734452311; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9Aqe7AiIYBOFmb8LLSvrb79BS28+QL4PQSesWGDIC9U=;
 b=wRMjQuf/KlcXxSUFHDqFFY6H6weXrqDxa54YsRNi0k9++R08CyLTk/SAdp6Ha6zK4P
 70NlM2eX/FerqBiGvpxlIAITNs0lzjX78QsNjMOWQ0rb301HsaO2XWWPFontaeMQHrFU
 c0yA3ToD0zPQ5jGgCkcOJ5uyFg1FCuQ+5LWs9qUVBkaqW+j25tZkACb/KGHEKUw1Zas5
 bRjghBol710httHtxde9YdNVjv5wzwNZ6lRYd/sPnaWrBRABwPkfwdRw71Cx5/jRsODE
 xRhZX9I9fLFxC+fk2NAMvDRlmfS7dEdnxLA1ZPBhpox/i5MWUzWgPZMy4jqrEK3KExA7
 GO4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733847511; x=1734452311;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9Aqe7AiIYBOFmb8LLSvrb79BS28+QL4PQSesWGDIC9U=;
 b=hQ1bSh0iojChJYCgPcbwFWG45kelI9Eom0+Krw+Kk5f3lIDfJmamzdGnxSu9unmLQb
 0U4QZkVVzp/K/irAiLnJkY62M0d/vAeIAY427VuixtTPGGWcl2Epa+ZbuAPagvKz3YKw
 17EJZHOLWfTpJmCXZvfQJ03EF5dzX2laTSTDzYro4IvWVAok3TkP+zIY+WYsiURRijLs
 GKjbTQSnSQnwsQAHSitSeUX6y4s+aK3cT+BOZztAJTb4lwQY52kdvv0MgOzfa731WVzC
 ++MHpIRGaQ3RH0BZvnwIIZ2nrJ2v8GGFOh3BixXwxbLh/i/fOH5HpftjNDsFFACeOy5V
 UpMg==
X-Gm-Message-State: AOJu0YyWlRHtEC9qN2PUFAzljbES9aZBKPKgf6Z0n3fRSQqr+hMHxJ5m
 Mm3UggYut9OOpeWaMBC60gLOOa5EkDJI/8C4ncC9he5xvFzlIcnADM7m4dCxk2k=
X-Gm-Gg: ASbGnctZWdjRCkJd1UA4Q1I/mfcJUDzzjOBiZsCdNBujy5U/HlaTzajDWdWT5sUNmBZ
 LxjFdBOY+Bu8osm+Et28M9D02x4NdXuYoxGvY4R7QvyeJzdI5aQVsm3y6rCMrVRklbrzmvGU5Ht
 JRVpPZzD/QTzyX6iA4n/7MZVo7tmQpMrourIR99NmO5RbXjpc0PErL8Roo2wnXJfKKHwzEglfRT
 b5or1JaHddqVyUkDw8MEP2h/g3dsuRcPfPeWzbwipz/fb1tpYJBmjyjIbk=
X-Received: by 2002:a05:6512:b26:b0:540:2311:28c5 with SMTP id
 2adb3069b0e04-54024112f8dmr1769224e87.57.1733847511522; 
 Tue, 10 Dec 2024 08:18:31 -0800 (PST)
Received: from stoup.. ([91.209.212.80]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53f93377eefsm1026343e87.67.2024.12.10.08.18.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 08:18:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 12/69] target/arm: Convert disas_add_sub_ext_reg to
 decodetree
Date: Tue, 10 Dec 2024 10:16:36 -0600
Message-ID: <20241210161733.1830573-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241210161733.1830573-1-richard.henderson@linaro.org>
References: <20241210161733.1830573-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x135.google.com
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
X-TUID: uwki64WNL+vX

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

