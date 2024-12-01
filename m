Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2149749njk;
        Sun, 1 Dec 2024 07:11:02 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX+ggachrd5pC4bvZbkaCa4rHAwimQbvZ+hSmp1VAip/rHjdaw947Cm0totV7G6fpkurDAd7s7nWJSyDw==@linaro.org
X-Google-Smtp-Source: AGHT+IHppXyCxP+MfmEJFjBMVd0RmPblcOvRhXU+QuJVXd06Kfk7elnL2GA5i+5G/JWsZHz351yA
X-Received: by 2002:a05:622a:308:b0:463:1039:e222 with SMTP id d75a77b69052e-466b3548665mr311534111cf.30.1733065862084;
        Sun, 01 Dec 2024 07:11:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733065862; cv=none;
        d=google.com; s=arc-20240605;
        b=SY95r4KTGcRRYMA3/bn9lBf4VXDUXmSzD7G/YA6hNR7Ntj787vxEGrklbnCvAq9YPJ
         opdbhw72nMWpSpky11od8py0tb+4Xtdb5aq+qFABATlU3liQwAZ0s4Dk9+kAJP56e7dp
         YKwhrzmPZ+XhUfgRp63+Gpc9nE6/1hAmu2hsvfa1lJeZ2m90Q+kJtVMF6Q9Gv7/WgPLd
         H4UWjRpM8LZx2D41QI9ToQkMJ1ogRmDb8w61lJu66F7F67DmcRBGRblWrpCyhMvnENtN
         YPR3EXMeO6k7L2qKRpSgeU9+RzEpRAhkqIQA43wFlZ/8hkA6cI8vXZwqaaO6Flf6gk9d
         uWOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5vZ+D4zf1PBhpfrDUbIquFaEGgs8hQN808U2e75k8ik=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=IdZuqQlNNV/f4j1dKeaWQiLVWRjMVhV1YJNBaOBJ6u5AKYJWkesufqPn+Ar6jDLgg3
         F5qRv3kKpN5eAhvHLzoMwQF+OoL1SMEOrzb7HmxzKh2NTmagHjdwYL2fKsW7w9hA8soc
         1wzGOrXf7us8N9iBK9ZpKT1QqWn+oQiii1dC0sNylYxJEqQff7ZxwgAFL7fhwk1eqT70
         uNCmXYNcI89l+bCtCDWAtGr9Lmim4jbw+9FximojToKFnqizKyY8SGNjo1cpteamdeMR
         xhaLTfPjVgSpA5AngRbws//+ScdXZUAdhOm1GgFdFBkhkomMlXlMfaWLcgc+mOQYz+43
         15og==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qD95fmXZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-5156cd0c1a7si3816147e0c.89.2024.12.01.07.11.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Dec 2024 07:11:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qD95fmXZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tHlX3-0001Ws-Pi; Sun, 01 Dec 2024 10:06:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlX1-0001Vh-VI
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:06:43 -0500
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlX0-0004Jw-55
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:06:43 -0500
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-3ea5120dd60so1637506b6e.1
 for <qemu-arm@nongnu.org>; Sun, 01 Dec 2024 07:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733065601; x=1733670401; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5vZ+D4zf1PBhpfrDUbIquFaEGgs8hQN808U2e75k8ik=;
 b=qD95fmXZQTtaV1B+A4Jw9npw4uD+8lIV3gehigSvoVz2ng/LCp0GMtnzTMVJrNg0mD
 Fy+dFJyMGoTlM6EwU0aOW70HR/4Hhrv1vdiufwQXqOO9WYntv1SGu0hiHl4/JMKS7My1
 +6NjG+uERnBEHq1pGkrLZaiGYYqdYMqBtbxOdCAaRIC3WCysKlpbTLByzaeVsBZ1k1RX
 Vj8wCJM7zFSJtkaYqfMV5MnlYXEj+jDKyVjXVUgFj44THEp26qna5OtmeGZBk70+cd+z
 G9fbT6RYc4nIFvy5rn9+5I63R6jnFHYojIgQkKKlr8ZOzXKtE/g58tOfSOvYiHOs4Rbc
 9LEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733065601; x=1733670401;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5vZ+D4zf1PBhpfrDUbIquFaEGgs8hQN808U2e75k8ik=;
 b=SeWiNudCyxgIMRDqZsg0o9dc6chNFybp4VGqb3YiytgmKaQjga8EfU/s3wNRuHX7Zn
 U492xJHLopbbNsBLSTqYoh9n8Tii+srsCnerw+/CRAcpdakBqSnqIf+oxyAJgjtElEwW
 ikVPoUhW+3m6bt+ZeeZhsAzebHjs3lJVORqcR9cFltN2FVnAnF2UgQ9J8i9NpRrce2Rj
 OzYCWTSXme1CN/C+d2v1VTIh0/Io1xzTk8efKJCOWWTCLhtLAcN8pYelAkKRxPZARW9n
 cLsI+9zhgd4aNW9yKe6EvldrLbKGrwf5AErsDiAIEg0MO90hmhMam3esApKLYOunPlzY
 z4pw==
X-Gm-Message-State: AOJu0Yzt14D6i1zvNY8qiAkUiv6coCVNULhR7+6ySeMpdNVLTwZ+CmQY
 LeiGIL1S2BiKpQ7ixOlMszbCZew5A+YnXpSQ618JrZOefJeKkZtP+2o/Zg9vGSbxEs60R6KeAOR
 zrWI=
X-Gm-Gg: ASbGncuAfupogW3Exzr0+EkwYjt9d0WDsJKbpLzZmKc5vg7BZi+5UNBfSR/TXPS5ufG
 x7v4p5/vUU4uKvbl26znZ56pb0LSPX2nOfWe+VQUkFqs4KphhGAZwpf6ogF3CxNclPJdaDi5UsZ
 fbM21qTW8V5MtmYHg38KCxBUdyxk3250vqNHBOGkFnxntN9EafGJDjE33A6CZgs/B1MF7GaelMg
 7BMYpiQnvzK7bDou1iWe+TZsus73rGR4/zk61CN36/SuabpbWGzL1+blMsPrlf7aV4bLEN5vRae
 AiECTD3+Apu5VeAj5UqDnhs7d5hraIcxb5Ie
X-Received: by 2002:a05:6808:22a4:b0:3ea:6ce3:a0bb with SMTP id
 5614622812f47-3ea6db611dcmr17116443b6e.5.1733065601053; 
 Sun, 01 Dec 2024 07:06:41 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-71d7254473asm1822220a34.27.2024.12.01.07.06.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Dec 2024 07:06:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 28/67] target/arm: Convert BFCVT to decodetree
Date: Sun,  1 Dec 2024 09:05:27 -0600
Message-ID: <20241201150607.12812-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201150607.12812-1-richard.henderson@linaro.org>
References: <20241201150607.12812-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22d.google.com
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
X-TUID: m5dM+suWEWcW

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 24 ++++++------------------
 target/arm/tcg/a64.decode      |  3 +++
 2 files changed, 9 insertions(+), 18 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index e8842012ea..b713c7d184 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -8424,6 +8424,11 @@ static const FPScalar1 f_scalar_frintx = {
 };
 TRANS(FRINTX_s, do_fp1_scalar, a, &f_scalar_frintx, -1)
 
+static const FPScalar1 f_scalar_bfcvt = {
+    .gen_s = gen_helper_bfcvt,
+};
+TRANS_FEAT(BFCVT_s, aa64_bf16, do_fp1_scalar, a, &f_scalar_bfcvt, -1)
+
 /* Floating-point data-processing (1 source) - single precision */
 static void handle_fp_1src_single(DisasContext *s, int opcode, int rd, int rn)
 {
@@ -8436,9 +8441,6 @@ static void handle_fp_1src_single(DisasContext *s, int opcode, int rd, int rn)
     tcg_res = tcg_temp_new_i32();
 
     switch (opcode) {
-    case 0x6: /* BFCVT */
-        gen_fpst = gen_helper_bfcvt;
-        break;
     case 0x10: /* FRINT32Z */
         rmode = FPROUNDING_ZERO;
         gen_fpst = gen_helper_frint32_s;
@@ -8458,6 +8460,7 @@ static void handle_fp_1src_single(DisasContext *s, int opcode, int rd, int rn)
     case 0x1: /* FABS */
     case 0x2: /* FNEG */
     case 0x3: /* FSQRT */
+    case 0x6: /* BFCVT */
     case 0x8: /* FRINTN */
     case 0x9: /* FRINTP */
     case 0xa: /* FRINTM */
@@ -8661,21 +8664,6 @@ static void disas_fp_1src(DisasContext *s, uint32_t insn)
         break;
 
     case 0x6:
-        switch (type) {
-        case 1: /* BFCVT */
-            if (!dc_isar_feature(aa64_bf16, s)) {
-                goto do_unallocated;
-            }
-            if (!fp_access_check(s)) {
-                return;
-            }
-            handle_fp_1src_single(s, opcode, rd, rn);
-            break;
-        default:
-            goto do_unallocated;
-        }
-        break;
-
     default:
     do_unallocated:
         unallocated_encoding(s);
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index fbfdf96eb3..476989c1b4 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -45,6 +45,7 @@
 &qrrrr_e        q rd rn rm ra esz
 
 @rr_h           ........ ... ..... ...... rn:5 rd:5     &rr_e esz=1
+@rr_s           ........ ... ..... ...... rn:5 rd:5     &rr_e esz=2
 @rr_d           ........ ... ..... ...... rn:5 rd:5     &rr_e esz=3
 @rr_sd          ........ ... ..... ...... rn:5 rd:5     &rr_e esz=%esz_sd
 @rr_hsd         ........ ... ..... ...... rn:5 rd:5     &rr_e esz=%esz_hsd
@@ -1337,6 +1338,8 @@ FRINTA_s        00011110 .. 1 001100 10000 ..... .....      @rr_hsd
 FRINTX_s        00011110 .. 1 001110 10000 ..... .....      @rr_hsd
 FRINTI_s        00011110 .. 1 001111 10000 ..... .....      @rr_hsd
 
+BFCVT_s         00011110 10 1 000110 10000 ..... .....      @rr_s
+
 # Floating-point Immediate
 
 FMOVI_s         0001 1110 .. 1 imm:8 100 00000 rd:5         esz=%esz_hsd
-- 
2.43.0

