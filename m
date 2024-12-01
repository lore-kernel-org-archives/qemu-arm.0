Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2147217njk;
        Sun, 1 Dec 2024 07:07:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWZN3tvP5IflWvO/qAGvcsPVVfGJLF+l6WADa+pYDFlAalImyMICJVpMDm/RB5gRALsx4EWbhCF/85lWw==@linaro.org
X-Google-Smtp-Source: AGHT+IGkiOIZ8ZuDMQLOcjKCp29hGIGBDpUENpCLY24x7dLTRg9cCq5NmUIgFSXFGNHBxHEuRcr9
X-Received: by 2002:a05:600c:3b25:b0:431:5632:448b with SMTP id 5b1f17b1804b1-434a9df26c0mr156492815e9.25.1733065664293;
        Sun, 01 Dec 2024 07:07:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733065664; cv=none;
        d=google.com; s=arc-20240605;
        b=dZgucbVpTJtxhFi1vHVXHJjovqcs/hk8jJuuxdFMeW5sAcfH+Y7mchNeACLYyxpOpc
         F2MPBNQ837aJ8sZLUnoR2GU0U/ua5JZ4kF7t0cnR78fz944HwjNqnzYt7UDvR2h40m29
         q5WAWcOeZ0bS5aWsvy5Eu6kWPBmd0jR1VJRu4mnjWJbERTdlqGGTcxD/tTnzUWtvB5dG
         FV+GmGGErU+aXWBogWM2idSbI27+DB75l/dauhspCf2owWbgPvSUCGJB1H1dA5TfXL3D
         IT+BRk+JN3rz7CzYhrGFMIxo1qXHKVyYQDzdym+LJeWLiKYMMqyJYHbVWsOJoLN6JNzI
         UhUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=VmXfcGZY+uOUXXSUJkFqHvnMcpF+Gs5GFplkRxYn1Z4=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=emZzXzIs45ZtalJPbiiJ5z+pnWSA37WdhnzZHFcRSiARdPnnqVp0V7Kg6T6vt7gZF9
         yon6KQlwTW7O8QHCUaRxGUKv9WWUkB1dZuQxzirovvW876BTJhiYYZhEIsgUrvJwPOSL
         r+VS+iGj87PzZnHcVIhLRo8E3uErxH8gKCmbdVOejRDpdVTsNsFAKK5XDK6pTjf5dtwU
         xJVXwtPB6Mpw4ZIaUwFWJ4ADM3E6TMKUB994cyO9GniYw2jj2VSXDIRZxCSj9ht4wH53
         RcTl/WMdUNdi2lJg/9SoT92kPd/plAK+XwLir+x1A4ElmvC3QBeGnPTgibQC1sAMP/PK
         oVpA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mOj4xZQL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-385d7f103d3si3943514f8f.31.2024.12.01.07.07.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Dec 2024 07:07:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mOj4xZQL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tHlX9-0001bY-4E; Sun, 01 Dec 2024 10:06:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlX6-0001Zo-OO
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:06:48 -0500
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlX5-0004Lf-77
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:06:48 -0500
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-29e5c0c46c3so238509fac.3
 for <qemu-arm@nongnu.org>; Sun, 01 Dec 2024 07:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733065605; x=1733670405; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VmXfcGZY+uOUXXSUJkFqHvnMcpF+Gs5GFplkRxYn1Z4=;
 b=mOj4xZQLBMTnsZdMnBgwQY+QfATpbQ60VjyrHChuLkslZlJ9y6cBJsWf+pR9mzFKkW
 EvL3Q/PwNL3ZBJ3kcFDGEFiZ1aoQIFkoBU93hZgyYczEOVY0uZZARAX/c6fosuPkMAKt
 pTSbYI0D+ZeF+VhZlHwuryovZHZa2SRK9d1zvF62ExFAoYdrRzO2uepcL1Sacvfxt0Qo
 5a0jK2GxK4+ypkeM3rzaa9eo1V6EUUnNib4ntlZWirRz5m7Rhz8LIYssUMemBkgx2Xfg
 4tiRg3GaDeRaTycXKIL4G+RLN6TxQd5bo60VUxlRUSV8idTF/wW82KLYPV/NHjurT7Sb
 uCnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733065605; x=1733670405;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VmXfcGZY+uOUXXSUJkFqHvnMcpF+Gs5GFplkRxYn1Z4=;
 b=rccY+jBjAczWPuMUC4XYEZvaaF4a20kgBMkmROIZQ3OJhnBBPfx3a84OIPR2Tovo/s
 N9b1VQvw1xguwZPAX2yzWV+HIGpyEZPJ/iLAzHtr7Lx/vOBROerLdRU5iYH7n4yL5TX3
 DHRTrB/TwsdVpJtaWXW4ixQbfaT1f5US/OkLnSKJwdtblmzMoLXmZkzxRI7wYlNGzrIr
 U/4UrCe1+W58xgou9YH2OFo7Fg4tbG6p8Se8B0XxiIsuLmnqFfMDP4UsZeRlpy8BuJZi
 o5z1oQH62p1dpySFu/p/MJ/rpqbH9EnsVDkJVzP3fds+Gqn9I5H6sIiXSaXBycYhtsUL
 fapg==
X-Gm-Message-State: AOJu0YynDe8hPyJzAFofPZVEv0ltfKp8W4uHG1wdk39lVdLzq0/87Bit
 BXKKZNaQbbo0w8OiizFbeWt71YrFYzKCg67BbyoP0gkLmsDW4NyBxuCA5NJnIz4=
X-Gm-Gg: ASbGncvltAZxe4AOsaPQfmbUOMoXrrUYJRxZc3mxw8UMpzj2NZvyehlaIWOqSgpjQhR
 olsR6DocD10Kh9PRKF/VAyJKQyGRGp2RR3NPJi9Z2JWYuWOIsQy7CfWL4ieYPEjBDI/7HoNOLi9
 dFnGMo3Q2JWnymIVjAAkKtvT/hNvxcfyl7Xrg44+yuQydeqfj9FmB91WNwlemLB8RFaTAvrbNCD
 gbMiHaheLK+/nMkVKmP+TXP2fHMGJjxLFiZIcvedA2SMaeKbkBynASDYBVL6D4KlM0UWZmK6K6R
 /m9BZGSMrwSUdB7rwwoP7TtqlexMe3aVAG3n
X-Received: by 2002:a05:6871:7b08:b0:29e:5897:e9ed with SMTP id
 586e51a60fabf-29e5897ed21mr1399903fac.35.1733065605487; 
 Sun, 01 Dec 2024 07:06:45 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-71d7254473asm1822220a34.27.2024.12.01.07.06.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Dec 2024 07:06:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 32/67] target/arm: Convert FJCVTZS to decodetree
Date: Sun,  1 Dec 2024 09:05:31 -0600
Message-ID: <20241201150607.12812-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201150607.12812-1-richard.henderson@linaro.org>
References: <20241201150607.12812-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x31.google.com
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
X-TUID: BeCpBGIZ2YqP

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 41 +++++++++++++++++-----------------
 target/arm/tcg/a64.decode      |  2 ++
 2 files changed, 22 insertions(+), 21 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 68bef0963b..90e1567ad1 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -8718,6 +8718,26 @@ TRANS(FCVTZU_g, do_fcvt_g, a, FPROUNDING_ZERO, false)
 TRANS(FCVTAS_g, do_fcvt_g, a, FPROUNDING_TIEAWAY, true)
 TRANS(FCVTAU_g, do_fcvt_g, a, FPROUNDING_TIEAWAY, false)
 
+static bool trans_FJCVTZS(DisasContext *s, arg_FJCVTZS *a)
+{
+    if (!dc_isar_feature(aa64_jscvt, s)) {
+        return false;
+    }
+    if (fp_access_check(s)) {
+        TCGv_i64 t = read_fp_dreg(s, a->rn);
+        TCGv_ptr fpstatus = fpstatus_ptr(FPST_FPCR);
+
+        gen_helper_fjcvtzs(t, t, fpstatus);
+
+        tcg_gen_ext32u_i64(cpu_reg(s, a->rd), t);
+        tcg_gen_extrh_i64_i32(cpu_ZF, t);
+        tcg_gen_movi_i32(cpu_CF, 0);
+        tcg_gen_movi_i32(cpu_NF, 0);
+        tcg_gen_movi_i32(cpu_VF, 0);
+    }
+    return true;
+}
+
 static void handle_fmov(DisasContext *s, int rd, int rn, int type, bool itof)
 {
     /* FMOV: gpr to or from float, double, or top half of quad fp reg,
@@ -8779,20 +8799,6 @@ static void handle_fmov(DisasContext *s, int rd, int rn, int type, bool itof)
     }
 }
 
-static void handle_fjcvtzs(DisasContext *s, int rd, int rn)
-{
-    TCGv_i64 t = read_fp_dreg(s, rn);
-    TCGv_ptr fpstatus = fpstatus_ptr(FPST_FPCR);
-
-    gen_helper_fjcvtzs(t, t, fpstatus);
-
-    tcg_gen_ext32u_i64(cpu_reg(s, rd), t);
-    tcg_gen_extrh_i64_i32(cpu_ZF, t);
-    tcg_gen_movi_i32(cpu_CF, 0);
-    tcg_gen_movi_i32(cpu_NF, 0);
-    tcg_gen_movi_i32(cpu_VF, 0);
-}
-
 /* Floating point <-> integer conversions
  *   31   30  29 28       24 23  22  21 20   19 18 16 15         10 9  5 4  0
  * +----+---+---+-----------+------+---+-------+-----+-------------+----+----+
@@ -8847,13 +8853,6 @@ static void disas_fp_int_conv(DisasContext *s, uint32_t insn)
             break;
 
         case 0b00111110: /* FJCVTZS */
-            if (!dc_isar_feature(aa64_jscvt, s)) {
-                goto do_unallocated;
-            } else if (fp_access_check(s)) {
-                handle_fjcvtzs(s, rd, rn);
-            }
-            break;
-
         default:
         do_unallocated:
             unallocated_encoding(s);
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 427924ad95..7b83d06d0d 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1363,6 +1363,8 @@ FCVTZU_g        . 0011110 .. 111001 000000 ..... .....  @icvt
 FCVTAS_g        . 0011110 .. 100100 000000 ..... .....  @icvt
 FCVTAU_g        . 0011110 .. 100101 000000 ..... .....  @icvt
 
+FJCVTZS         0 0011110 01 111110 000000 ..... .....  @rr
+
 # Floating-point data processing (1 source)
 
 FMOV_s          00011110 .. 1 000000 10000 ..... .....      @rr_hsd
-- 
2.43.0

