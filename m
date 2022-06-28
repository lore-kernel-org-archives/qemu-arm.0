Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2885465lft;
        Mon, 27 Jun 2022 21:26:37 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tGaWw409GT3DT3H2ddF5/WUueDzjIjqlK/2z2oYytlicdNzLOCZmkvOln1OiuVVDdkTJLT
X-Received: by 2002:a37:6793:0:b0:6ae:f690:1d9e with SMTP id b141-20020a376793000000b006aef6901d9emr10321130qkc.581.1656390397420;
        Mon, 27 Jun 2022 21:26:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656390397; cv=none;
        d=google.com; s=arc-20160816;
        b=OuIjGNOp+PzsGZ+Pd7ylTb/d2L9aZktETnZARPwFh/7xNUJj8T3XGIX5xMHdyHJsBK
         vfkmR8p2X0UMXFhWVozlNnsQudgJhaVMFOXcA0oMLK69aXifLgDhWTvYqsRZXXMIsHzE
         1vneDtzyfwLQ1XRYESPcabzP9Cqo1zgaNwHc1CD8Mv5uuglf5JWfmCVcvOFYcGveMMMq
         3z57T/UN2plqDIvoMdAdgV6zK98JpikT6fLJcETifWgNdO1qhkSsGCQv7xovb7HBXMRs
         4K2z2H/sax1hjFR41GiWL//rGr9ho8Th53/MoaOz9QVqO8UVP48FZj6FLn6oasEbjEW4
         qpUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1GgZc9nURd8Ki/xGkxNJXDBbrbUEmb8e2LeVeo/xY5Y=;
        b=JzLJ9y8gyCLLEZuhYrV7skgumYQY+7HlWbd05E2h2duSTfYm+F9O2mXpTubrdfE4Mx
         XW/lB9FYQrOahc3YJfIdHuk1k3OIhp5AoS1iv7p+Q6bzN2LZrOwEjdRlUJ2Q29nyeNBf
         +uLiDZv/+YsjP44WKp6XYMsFHiXvHqwbPTQ522tQF/lbr/CCR0JrzVmkDX8Mx7NITe+L
         oQ4LP9lOtNrAQFF7nYRCkVox3BYDFN4StpJhAs7BPZAjTnYReH+h8kTpQvDr85VaezF2
         A1qmQq/dms3AQSoayyHShUW/9/fcuAHEdn/KxiJ0dvYbx/er2XT+wY9i3WcoG1uQVmrX
         EKFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ftzrPRJO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s17-20020a05620a29d100b006af1a0a48c1si3680785qkp.8.2022.06.27.21.26.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jun 2022 21:26:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ftzrPRJO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o62o8-00005y-Qj
	for alex.bennee@linaro.org; Tue, 28 Jun 2022 00:26:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62jJ-0001Kp-2M
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 00:21:37 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:47076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62jH-0003ct-AD
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 00:21:36 -0400
Received: by mail-pf1-x432.google.com with SMTP id a15so10858221pfv.13
 for <qemu-arm@nongnu.org>; Mon, 27 Jun 2022 21:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1GgZc9nURd8Ki/xGkxNJXDBbrbUEmb8e2LeVeo/xY5Y=;
 b=ftzrPRJOXPNLUS1dzYc+neLQ9r1o+tLefWD+Jbqsdw1VUFuQ8I+iMFE7UtAXn6NJ9y
 AVGe4feLBC1pD4MGJd7sqNz0xbvUMG0TENMMwW4Pot13eDRz7Xql/3sQjZe04kDUcERZ
 2NqU8QRH+MgNdzI4yXzisByRZ5GXhLzbenfTvdoUJ9Jsb7q/7byjyhRRTOQDlEbbh2ir
 2tnyIYPYl1orOmFDHxW+VS6j7tHGE316Kev25aJx8m8BPAkgVFZeu9nUbvAVRJMVxztW
 xQkktUcaLt/cVJeomdvp1BK6I/YW9HsGQt9mVBSIaJAKZyw/ovM4dhS7wXMO5+L9+QmH
 iRvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1GgZc9nURd8Ki/xGkxNJXDBbrbUEmb8e2LeVeo/xY5Y=;
 b=QMc4wbApv3deXq2fqT0S0TQP3wIvCERGNoA325DxzwG79sHXZ3Xkk2epsOnFh69TJl
 W72CwW6HHbYrzILuBM7R0lTTa8pKTmWuqEqIwrR4yJy0dIxxYY3QZ0GUiwlSs32lgGdR
 imzDfVM04opur4wNVrq17R199ehqmpLwSZFShP/M7/Rr+7njUezEeEgH9dyXiuRZnFDG
 l5CaqVcxu3fkslwNT1hXZiakEqRoMXhtP1/e/7gOvSY4kCCbeY7YXYjIppUNr+0O9htk
 4HBDdQGt0mjyt6Y9jSHUjkjo64+PQY+APbDPgDoiUBRuTzOa+DGRTAuJ0q5OR/ZSdlWs
 G3Zg==
X-Gm-Message-State: AJIora8qAMCK9Zd7EApbvJ0pH6OwAbj7+I2a0fGfYM5oZA+sW/mRZWi/
 b4ox5RpTrOVYA20YTkfRv+7RY49iAPm0+w==
X-Received: by 2002:a63:8848:0:b0:40d:e25:dd99 with SMTP id
 l69-20020a638848000000b0040d0e25dd99mr15640890pgd.603.1656390094499; 
 Mon, 27 Jun 2022 21:21:34 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 jg6-20020a17090326c600b0016a087cfad8sm7994929plb.264.2022.06.27.21.21.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:21:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 05/45] target/arm: Mark RDFFR, WRFFR,
 SETFFR as non-streaming
Date: Tue, 28 Jun 2022 09:50:37 +0530
Message-Id: <20220628042117.368549-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628042117.368549-1-richard.henderson@linaro.org>
References: <20220628042117.368549-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oNJyq0gyOjPH

Mark these as a non-streaming instructions, which should trap
if full a64 support is not enabled in streaming mode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sme-fa64.decode | 2 --
 target/arm/translate-sve.c | 9 ++++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/target/arm/sme-fa64.decode b/target/arm/sme-fa64.decode
index bce717ae5f..a48f164ed4 100644
--- a/target/arm/sme-fa64.decode
+++ b/target/arm/sme-fa64.decode
@@ -60,8 +60,6 @@ FAIL    1100 1110 ---- ---- ---- ---- ---- ----   # Advanced SIMD cryptography e
 
 FAIL    0000 0100 --1- ---- 1011 -0-- ---- ----   # FTSSEL, FEXPA
 FAIL    0000 0101 --10 0001 100- ---- ---- ----   # COMPACT
-FAIL    0010 0101 --01 100- 1111 000- ---0 ----   # RDFFR, RDFFRS
-FAIL    0010 0101 --10 1--- 1001 ---- ---- ----   # WRFFR, SETFFR
 FAIL    0100 0101 --0- ---- 1011 ---- ---- ----   # BDEP, BEXT, BGRP
 FAIL    0100 0101 000- ---- 0110 1--- ---- ----   # PMULLB, PMULLT (128b result)
 FAIL    0110 0100 --1- ---- 1110 01-- ---- ----   # FMMLA, BFMMLA
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 5d1db0d3ff..d6faec15fe 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1785,7 +1785,8 @@ static bool do_predset(DisasContext *s, int esz, int rd, int pat, bool setflag)
 TRANS_FEAT(PTRUE, aa64_sve, do_predset, a->esz, a->rd, a->pat, a->s)
 
 /* Note pat == 31 is #all, to set all elements.  */
-TRANS_FEAT(SETFFR, aa64_sve, do_predset, 0, FFR_PRED_NUM, 31, false)
+TRANS_FEAT_NONSTREAMING(SETFFR, aa64_sve,
+                        do_predset, 0, FFR_PRED_NUM, 31, false)
 
 /* Note pat == 32 is #unimp, to set no elements.  */
 TRANS_FEAT(PFALSE, aa64_sve, do_predset, 0, a->rd, 32, false)
@@ -1799,11 +1800,13 @@ static bool trans_RDFFR_p(DisasContext *s, arg_RDFFR_p *a)
         .rd = a->rd, .pg = a->pg, .s = a->s,
         .rn = FFR_PRED_NUM, .rm = FFR_PRED_NUM,
     };
+
+    s->is_nonstreaming = true;
     return trans_AND_pppp(s, &alt_a);
 }
 
-TRANS_FEAT(RDFFR, aa64_sve, do_mov_p, a->rd, FFR_PRED_NUM)
-TRANS_FEAT(WRFFR, aa64_sve, do_mov_p, FFR_PRED_NUM, a->rn)
+TRANS_FEAT_NONSTREAMING(RDFFR, aa64_sve, do_mov_p, a->rd, FFR_PRED_NUM)
+TRANS_FEAT_NONSTREAMING(WRFFR, aa64_sve, do_mov_p, FFR_PRED_NUM, a->rn)
 
 static bool do_pfirst_pnext(DisasContext *s, arg_rr_esz *a,
                             void (*gen_fn)(TCGv_i32, TCGv_ptr,
-- 
2.34.1

