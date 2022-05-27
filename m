Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1233717lfh;
        Fri, 27 May 2022 12:13:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9Or4RSoUI3hu3bBbII+lK64dwxOYaAH9FEwfgoeZ2abK9iWlx1OziUYJ3aGCA/+Q0EdXF
X-Received: by 2002:a05:622a:1484:b0:2f3:c837:57a6 with SMTP id t4-20020a05622a148400b002f3c83757a6mr34730685qtx.460.1653678827742;
        Fri, 27 May 2022 12:13:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653678827; cv=none;
        d=google.com; s=arc-20160816;
        b=Ufh6wkqB4UTofdFzERyz6ZnWrCs5lBUxZVr4dJ9q6Y80ojO/XzCZ/51YRRtcmQ6zo4
         wWLSl7q7+20hyS9VjuFNoxidUFhKPdMWD2C/hG9qZWrHH4XstJXHbGsjl37wnlrQfkD0
         Ndp9gYk4Zre0oiP5fwiZf2CS3qx6hrzyxAbLT2C9V99plT85KAiMCQC7sE+lEKPJ9gWg
         oeqZowGhOyeuL+bFoNgvBP8krZX5Pl617Mf+3/WqfMZO9WXhM+rWMOkmNzc4IULsa0au
         +BeFYA+Gil+OXjOIGeflfJ8XnvOyPrtSp1n2AmkIJ2nH8LcfNtNB6K4dt2lfSK/bOxNT
         SlrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/TvMDP335TvRNw/a1H/Zr3oPyOBkp4XgORGf+idJ1kw=;
        b=EYtPL6alm8B+eNQ5dBp2FNDbiIth5Riqp5Da3IxjZNBA7hqd7PcyQfgWdSqNWThLx3
         MYH2wUyD8tD8yy6ADK7Vpx1b4xcTLW5CyqKLCk6ovP4OlH2fBBOq9O2pEDKrO9ROIzq2
         6E+anSKZBkSi0bj/c0HHfvH1fB9HWevNxj+ml5fljeDDqn8K1NGgKx4t0nWsCLvw2KoA
         dwopGioOft3oTcMYr2rdv9UHoISRJVcuaU/1qjDLeSlv9NUXjqLWH7e0amwovAnFebTp
         tT+6EHR06geVZKmwQjxwTzDPtbky+Su6u0c4U6Y6OWn7wNnjAyaeT7uHOWZuGBmwu2dh
         lMbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kVRkYvsh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i4-20020ad45c64000000b0046266ef106csi3596378qvh.495.2022.05.27.12.13.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 12:13:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kVRkYvsh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nufP9-00075K-8Z
	for alex.bennee@linaro.org; Fri, 27 May 2022 15:13:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuec4-0003JR-9Q
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:04 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:46803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueby-0004LC-1S
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:03 -0400
Received: by mail-pg1-x534.google.com with SMTP id j21so4548403pga.13
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/TvMDP335TvRNw/a1H/Zr3oPyOBkp4XgORGf+idJ1kw=;
 b=kVRkYvshhLyMNEd6kQLskD9Q6XBOwsPPcGwvTAJUCv32N+HTSpV0tJuj7L0G+gkIPA
 4ViI8BNtq9eK/EeF7hCEj+Sj4pBm+7FIxRmKupq/k+bQP8YjYEOWtniprsMArcg5wr1e
 I5LlN5tK82PID1ppmqTA55MTSJPl8BINUBRnfcthe8A0BEbpL/bnKgfWX4XqY/kKyXb9
 e2HYWw5d2oKmxvTQeQDQPz5jDvC3VJ1a1JlzRiYc0TpdaOB62Udh9nZiUGknWtCuRvGf
 CpSKwa5DbZ4Oz6wYVGWZX3v9QhCkFLB7XBgoDlhOmjBNVNB8p+lbN67uPXlc6mfzCiGK
 h4CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/TvMDP335TvRNw/a1H/Zr3oPyOBkp4XgORGf+idJ1kw=;
 b=1YAALJYprlCmmJmEheDOsvEW8QY/4DKkUtk9EoAc/EHaAYupjLgTe6NYc+UjEKMx9n
 O0ThZt8bROUmMaIFLVUUbm4i4ra49CmGqc67T0HOEiT3b0hF+1WIDPNwYhpNUJmXB4kl
 Fa3Olt6Jt0B/Zhifb481ueDqrv7ELMquGMvqQYqmEK7qq5LhKw3UOCmn0OYKEaoK9flh
 u1Hi9JJoAJmrrX4xNUx83FigPaS4jO0iEpZyhOhkHLbNOu4PVGofYMNmRUAsAK895rLd
 ZtilYBWiu63BhcOp/6CVqRQK7bkugQGZTaxMf2hUQLmAftd8puznXYrVXXyZbY9L/gtR
 /3JA==
X-Gm-Message-State: AOAM5316FuSw356NGeFvsQ88pgIGyT+MWHBP4AUwi89iD0NpLbSr/aKE
 cUhDypjL2QXXgRcnhbPUPcbRVPpXWu+ECQ==
X-Received: by 2002:a05:6a00:cd2:b0:518:e103:7cee with SMTP id
 b18-20020a056a000cd200b00518e1037ceemr16711973pfv.67.1653675771615; 
 Fri, 27 May 2022 11:22:51 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:22:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 046/114] target/arm: Use TRANS_FEAT for do_shift_zpzi
Date: Fri, 27 May 2022 11:17:59 -0700
Message-Id: <20220527181907.189259-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hmjzV2AuVM1x

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 52 +++++++++++++++-----------------------
 1 file changed, 20 insertions(+), 32 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index c7c16863c0..98f9cfa86c 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -926,41 +926,29 @@ static bool do_shift_zpzi(DisasContext *s, arg_rpri_esz *a, bool asr,
     return gen_gvec_ool_arg_zpzi(s, fns[a->esz], a);
 }
 
-static bool trans_ASR_zpzi(DisasContext *s, arg_rpri_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        gen_helper_sve_asr_zpzi_b, gen_helper_sve_asr_zpzi_h,
-        gen_helper_sve_asr_zpzi_s, gen_helper_sve_asr_zpzi_d,
-    };
-    return do_shift_zpzi(s, a, true, fns);
-}
+static gen_helper_gvec_3 * const asr_zpzi_fns[4] = {
+    gen_helper_sve_asr_zpzi_b, gen_helper_sve_asr_zpzi_h,
+    gen_helper_sve_asr_zpzi_s, gen_helper_sve_asr_zpzi_d,
+};
+TRANS_FEAT(ASR_zpzi, aa64_sve, do_shift_zpzi, a, true, asr_zpzi_fns)
 
-static bool trans_LSR_zpzi(DisasContext *s, arg_rpri_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        gen_helper_sve_lsr_zpzi_b, gen_helper_sve_lsr_zpzi_h,
-        gen_helper_sve_lsr_zpzi_s, gen_helper_sve_lsr_zpzi_d,
-    };
-    return do_shift_zpzi(s, a, false, fns);
-}
+static gen_helper_gvec_3 * const lsr_zpzi_fns[4] = {
+    gen_helper_sve_lsr_zpzi_b, gen_helper_sve_lsr_zpzi_h,
+    gen_helper_sve_lsr_zpzi_s, gen_helper_sve_lsr_zpzi_d,
+};
+TRANS_FEAT(LSR_zpzi, aa64_sve, do_shift_zpzi, a, false, lsr_zpzi_fns)
 
-static bool trans_LSL_zpzi(DisasContext *s, arg_rpri_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        gen_helper_sve_lsl_zpzi_b, gen_helper_sve_lsl_zpzi_h,
-        gen_helper_sve_lsl_zpzi_s, gen_helper_sve_lsl_zpzi_d,
-    };
-    return do_shift_zpzi(s, a, false, fns);
-}
+static gen_helper_gvec_3 * const lsl_zpzi_fns[4] = {
+    gen_helper_sve_lsl_zpzi_b, gen_helper_sve_lsl_zpzi_h,
+    gen_helper_sve_lsl_zpzi_s, gen_helper_sve_lsl_zpzi_d,
+};
+TRANS_FEAT(LSL_zpzi, aa64_sve, do_shift_zpzi, a, false, lsl_zpzi_fns)
 
-static bool trans_ASRD(DisasContext *s, arg_rpri_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        gen_helper_sve_asrd_b, gen_helper_sve_asrd_h,
-        gen_helper_sve_asrd_s, gen_helper_sve_asrd_d,
-    };
-    return do_shift_zpzi(s, a, false, fns);
-}
+static gen_helper_gvec_3 * const asrd_fns[4] = {
+    gen_helper_sve_asrd_b, gen_helper_sve_asrd_h,
+    gen_helper_sve_asrd_s, gen_helper_sve_asrd_d,
+};
+TRANS_FEAT(ASRD, aa64_sve, do_shift_zpzi, a, false, asrd_fns)
 
 static gen_helper_gvec_3 * const sqshl_zpzi_fns[4] = {
     gen_helper_sve2_sqshl_zpzi_b, gen_helper_sve2_sqshl_zpzi_h,
-- 
2.34.1

