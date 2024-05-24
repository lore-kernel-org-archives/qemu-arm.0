Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp1994272ejb;
        Fri, 24 May 2024 16:27:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVIar+YEZKlH6EeyWkCe3+nN5hDZfLzEfVbxeSzhgk1sM04ELkqCT0r/Rj5VhuCHGzYC06ZL/6/jkoqHpifDH7nScP4Lgb2
X-Google-Smtp-Source: AGHT+IHhVaRo6UP+IBBv2SDivOpc5xv5qoVEpRDdJFvrmHgnkjpANMyNzX4UADVee7/RHiTKW2ht
X-Received: by 2002:a05:6808:1281:b0:3c9:6e96:88fb with SMTP id 5614622812f47-3d1a5483b98mr4733293b6e.4.1716593220569;
        Fri, 24 May 2024 16:27:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716593220; cv=none;
        d=google.com; s=arc-20160816;
        b=TFZhc+8b6iOy0GiFE9thCkFrs4Vq9n8IUSB3sJLW9ykdTVENQwWaffQ0JUqriNGmAR
         Z8RFXFUR+Z3k1gxpZASwvpp0IuywWMRL3/LLaQGyszp12UpO/HnpXCkL+QpjKz6I6ew6
         ruqHw3y9/nincCjxyhuCifTP7PJmXK8joIcF8kv21EUSosheMQNVKhDT9KwKdd7ukqXf
         F+wWLTcod0Cmzif/SnNIK/2HNwC4kMz+5KIsiyAyLgEJPKoXqukWPMESX6/5yfoGiEEQ
         6Qr29/PcX3xeUpaV0VTuZqt2L5redFjaDdROUSQCUJlePviiLIoVAKz06Y3mBdSXp6Qp
         od6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=uJ0q4kYSciCCJ5iNnH0cT/11J4ZEDfTPyyL262CCOCQ=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=nYiZ3Xw5lkl1eQ6GjfgCfDQZ0510qTH7dCI2y2CJd5FAO82vleKtRpDhfXES20FBZc
         5X6N2+ilVh7Cu0+FOKGMAw0y4Un5Up8/Qe81yP3GElmo3Fy1JlYQ/Lj+65c8OeHEVDJb
         8PuryS7/FsXl481QOW+SWqOmfT2ItYWR7xl+RCB4S2FjHvO7GfWk2YR5Xo2TxmXM3KBN
         OCyep54P6VVkAgCuj4z7gsQ8/W0qUHpPfqvteAvrhIppovvoQ0Lez9MRCRLIQ0ulTNFX
         Fkux5u1yFNC8pQJckQdSHmDhZ7C+y+O02JQ9pV+tAyrASkntjmPSCOsRkVoXZmAt9t2A
         Y3qw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="m/PfeRW9";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ac070f0decsi27719276d6.199.2024.05.24.16.27.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 May 2024 16:27:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="m/PfeRW9";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sAeJB-0003Fr-I8; Fri, 24 May 2024 19:26:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeI3-0007ob-R9
 for qemu-arm@nongnu.org; Fri, 24 May 2024 19:25:35 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeHt-0006wF-At
 for qemu-arm@nongnu.org; Fri, 24 May 2024 19:25:35 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6f8ea5e3812so1320468b3a.2
 for <qemu-arm@nongnu.org>; Fri, 24 May 2024 16:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716593115; x=1717197915; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uJ0q4kYSciCCJ5iNnH0cT/11J4ZEDfTPyyL262CCOCQ=;
 b=m/PfeRW9mPt6DQ7OXihTEGWyVk3C/nVlqDJT78WF/JSffTqiW9g6W7ohSlHRzrU5X3
 rDvrDu1doTxB5muO9Vr/e8TwmAmhAhe4PQLByQUrNlBz1C1nKeboUz/pISa2zTNOZJd1
 9qfSMYi666m4txlCQm3omIDb587UKkANCLit1N6X9Qvtp1xBr9GytG2q3/0KXrimkGct
 DP10Wo0f2jjUwy3kNmTcIljSnusRDXchaGGkjsF5VCJh3G61Wro5c/qlELwIpBAomNnF
 TzxeLx/mCwr5OD4r2Qe2Nn+syj0DgBqtt4qLoZTY83aaDYklx20N245CDOMdKqAKUemF
 ECAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716593115; x=1717197915;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uJ0q4kYSciCCJ5iNnH0cT/11J4ZEDfTPyyL262CCOCQ=;
 b=qkSt+mTfX7mhPXInsL4kUDzLpxBIEbP1Yi66ZmIR+OhjIDz9jrMQX0vithJjPBU9aD
 wazbiT+Ycz8sJwEF4LyL4UpJHmzeY1pvCZeRyy0z+EfJwT2p80S3+0XxunZoqOziRWwz
 zwyN1LgeNCusFpjxOkWw0gfBB8uhty/g5w5tHi8azVuS74sht+sA8wlqdV5sNmQO5JnZ
 q4rhkDo9G7sCFO1DbeRaoUp8dLG6GEKfkqfCEDudtqZLnsJFulyYKkUO1Kqyn627H137
 OgeSrOgTY7J7Y7d4EmDrrhjdY37kUyqGq6kRjA5BmdXCn/10UB7K/1Qedjgi5IKKLjVA
 94Eg==
X-Gm-Message-State: AOJu0YzRUoXXjaGSGht3VSmY8P3XSiOQ29PI3jJwnzjCeIrul6bFzBoH
 6PBeLPXVjt1Hds7Tw99wkQDPsSznfvd9blb8/cH6py//Irpg8l1H5oFWLkZ649zUXF8rrb38YZD
 i
X-Received: by 2002:a05:6a00:418a:b0:6e6:970f:a809 with SMTP id
 d2e1a72fcca58-6f8f392b6a8mr4068086b3a.20.1716593115251; 
 Fri, 24 May 2024 16:25:15 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fbf2cfd1sm1591695b3a.3.2024.05.24.16.25.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 16:25:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 60/67] target/arm: Convert SMAX, SMIN, UMAX,
 UMIN to decodetree
Date: Fri, 24 May 2024 16:21:14 -0700
Message-Id: <20240524232121.284515-61-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240524232121.284515-1-richard.henderson@linaro.org>
References: <20240524232121.284515-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
X-TUID: y5wveJfzZlnA

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/a64.decode      |  4 ++++
 target/arm/tcg/translate-a64.c | 22 ++++++----------------
 2 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 1c448b4f7c..bc98963bc5 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -918,6 +918,10 @@ SHSUB_v         0.00 1110 ..1 ..... 00100 1 ..... ..... @qrrr_e
 UHSUB_v         0.10 1110 ..1 ..... 00100 1 ..... ..... @qrrr_e
 SRHADD_v        0.00 1110 ..1 ..... 00010 1 ..... ..... @qrrr_e
 URHADD_v        0.10 1110 ..1 ..... 00010 1 ..... ..... @qrrr_e
+SMAX_v          0.00 1110 ..1 ..... 01100 1 ..... ..... @qrrr_e
+UMAX_v          0.10 1110 ..1 ..... 01100 1 ..... ..... @qrrr_e
+SMIN_v          0.00 1110 ..1 ..... 01101 1 ..... ..... @qrrr_e
+UMIN_v          0.10 1110 ..1 ..... 01101 1 ..... ..... @qrrr_e
 
 ### Advanced SIMD scalar x indexed element
 
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 9ef5de6755..db6f59df17 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5460,6 +5460,10 @@ TRANS(SHSUB_v, do_gvec_fn3_no64, a, gen_gvec_shsub)
 TRANS(UHSUB_v, do_gvec_fn3_no64, a, gen_gvec_uhsub)
 TRANS(SRHADD_v, do_gvec_fn3_no64, a, gen_gvec_srhadd)
 TRANS(URHADD_v, do_gvec_fn3_no64, a, gen_gvec_urhadd)
+TRANS(SMAX_v, do_gvec_fn3_no64, a, tcg_gen_gvec_smax)
+TRANS(UMAX_v, do_gvec_fn3_no64, a, tcg_gen_gvec_umax)
+TRANS(SMIN_v, do_gvec_fn3_no64, a, tcg_gen_gvec_smin)
+TRANS(UMIN_v, do_gvec_fn3_no64, a, tcg_gen_gvec_umin)
 
 static bool do_cmop_v(DisasContext *s, arg_qrrr_e *a, TCGCond cond)
 {
@@ -10925,8 +10929,6 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
             return;
         }
         /* fall through */
-    case 0xc: /* SMAX, UMAX */
-    case 0xd: /* SMIN, UMIN */
     case 0xe: /* SABD, UABD */
     case 0xf: /* SABA, UABA */
     case 0x12: /* MLA, MLS */
@@ -10959,6 +10961,8 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
     case 0x09: /* SQSHL, UQSHL */
     case 0x0a: /* SRSHL, URSHL */
     case 0x0b: /* SQRSHL, UQRSHL */
+    case 0x0c: /* SMAX, UMAX */
+    case 0x0d: /* SMIN, UMIN */
     case 0x10: /* ADD, SUB */
     case 0x11: /* CMTST, CMEQ */
         unallocated_encoding(s);
@@ -10970,20 +10974,6 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
     }
 
     switch (opcode) {
-    case 0x0c: /* SMAX, UMAX */
-        if (u) {
-            gen_gvec_fn3(s, is_q, rd, rn, rm, tcg_gen_gvec_umax, size);
-        } else {
-            gen_gvec_fn3(s, is_q, rd, rn, rm, tcg_gen_gvec_smax, size);
-        }
-        return;
-    case 0x0d: /* SMIN, UMIN */
-        if (u) {
-            gen_gvec_fn3(s, is_q, rd, rn, rm, tcg_gen_gvec_umin, size);
-        } else {
-            gen_gvec_fn3(s, is_q, rd, rn, rm, tcg_gen_gvec_smin, size);
-        }
-        return;
     case 0xe: /* SABD, UABD */
         if (u) {
             gen_gvec_fn3(s, is_q, rd, rn, rm, gen_gvec_uabd, size);
-- 
2.34.1

