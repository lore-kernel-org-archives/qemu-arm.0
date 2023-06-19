Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2884330ejt;
        Mon, 19 Jun 2023 08:58:51 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7nOuyj2HQHxIX8SDoNgVBg51ShorLYYLN+KpzBZspd+ms2ZTTYmCQZW40v9ZwioqzgBkOg
X-Received: by 2002:a05:622a:2d3:b0:3e3:8ed5:a47e with SMTP id a19-20020a05622a02d300b003e38ed5a47emr11223223qtx.10.1687190331071;
        Mon, 19 Jun 2023 08:58:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687190331; cv=none;
        d=google.com; s=arc-20160816;
        b=zzn4p9r7gcRvpcviTJC00oZ05p0G/h+eesp1r+oaBfA7dgWV2/dKezNV25yBNpmrfQ
         QYj4ACpv6edad095WhZRsv0wziq6lqsXVOTOHye+NSZLBUoXI0jQcrzmleolopxgPaPu
         3xT9HZQyhAGWjgFE45k3sMrr6r0YDcc+vQAV8JspkGYuAEPMmBv/8tbIFtiJtfeGso4O
         31VUMfEOnG5+tA0EPX9ipNGrAqMAbbQsxqTbrQUQzQa1lCy5CfUz9jslYpa4SBjToynV
         Z9gFQLkYMtA/r2YJGrVU8DcRXQUAhQy/oFjEH/XYSj/+k2QdX79akqoZGWGNimXAUFKn
         hAIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Eev3uKaN8Wb2cqWvQZ+Wt2oGXYaxE9Q7/zb4hJxICz8=;
        b=tD1gdzFAqda+PeYw/wTcwmY2iznJoPefDB5zyBRBnv2uxLSWU97zS3X7YDvqxMcIPk
         kAi9S8IuY8e+guTYlRj6u0DSVWqzUXZjWXk7b9roWLouPOV554aF4BEvaH3Zhhf3+tXB
         NdOfvDu7DjvhFfuaXL7Z5EBlZbcCGUv+AuJqOo3HWk/Z2AaSrlnzPdBoZ0fC+INS4xEu
         C5kzGhO+PPgfH4vtny/2kQShXTrEDqoA/yLQQ1PR8dFjPGMmmEnMUg1umnZevNdcJLq1
         UG0Yhp+SoEBtncSCQTn4N5euZKlgXkrYAmOzuUphd1tUE5t4lhQxc88qwEUJxcoKSDAq
         /soQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hxNxcZLn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n7-20020a05622a040700b003ef41417024si11511qtx.562.2023.06.19.08.58.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 08:58:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hxNxcZLn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qBHEo-0006nV-FD; Mon, 19 Jun 2023 11:56:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBHEM-0006eg-Vu
 for qemu-devel@nongnu.org; Mon, 19 Jun 2023 11:55:56 -0400
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBHEK-0004qG-J7
 for qemu-devel@nongnu.org; Mon, 19 Jun 2023 11:55:49 -0400
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2b46bfa66d2so28726081fa.2
 for <qemu-devel@nongnu.org>; Mon, 19 Jun 2023 08:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687190146; x=1689782146;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Eev3uKaN8Wb2cqWvQZ+Wt2oGXYaxE9Q7/zb4hJxICz8=;
 b=hxNxcZLnDVaCulfDDlhDXJjF8ol5izA6NKZfxGkV7JpFb3mkDbIqb5xHv3GkEAHfQ+
 g0S7dwkF5TrciMT+Jed8nyPgG9QY/Njj6i9TzujQGKRGix/c0p87ipbSckSCzMwdbpK0
 pvw8IzmGFc1xZKQ/yrdZgVzZzzZkbrSqbNzZHHe3Nu5NQPX6a9dbgrJNsAXoqFDkK9Jv
 9eKxJWT46wqSJlK74TI97K0NiEKU18W6yZIS6APaoFFuKwJLuSXQjcPxpYum0M3Jq/dn
 yf26r66+laY4VceTI5jg1NthfiJktpBKmN6oGNW3lAt3F4p5BgyrFKtoNA5ka2ZFpFKb
 G/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687190146; x=1689782146;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Eev3uKaN8Wb2cqWvQZ+Wt2oGXYaxE9Q7/zb4hJxICz8=;
 b=bHHXJcXldmG/vXsW7YbXybdT7NPxM1vQ357M4JQvnwNqfupy5cuYhIIfnMvnsCaW0Y
 FiiLr7qDdtCbzCnDbS5N7hJKyAk71UMjTv4YcCmdGP28ifkZ7lZKwwYvG+TKsROmlYgy
 bZSt1dvWXAG5OnfTjkVjMtLLYvJmt0Qd98smNrhFQE0aqWr+1YU94MAlykaxbF4tYraI
 xDSOwSXBMI8nAlNo9PJ7pCN0M/yGoVwn2EwARLLj7Zh6dUGoZT9606LM6tpFhof5WLpQ
 QOoSdbv6U/G6ykboa5K/gH0YFM9YxBv8m7STcc91T5wMmaB34QNEl2H7gNfT9//Y2l/f
 uaIA==
X-Gm-Message-State: AC+VfDzdlkwXRLMciolLmloRbJxOQ30x1YIyDC5qWi+JYIehRLecc5YQ
 tkpBzNF66uZb2teCXbYf2mRW9KxpbRQY70WM4LI55A==
X-Received: by 2002:a2e:3006:0:b0:2b2:3a4:4ec3 with SMTP id
 w6-20020a2e3006000000b002b203a44ec3mr5793612ljw.26.1687190146587; 
 Mon, 19 Jun 2023 08:55:46 -0700 (PDT)
Received: from m1x-phil.lan (sar95-h02-176-184-10-225.dsl.sta.abo.bbox.fr.
 [176.184.10.225]) by smtp.gmail.com with ESMTPSA id
 y21-20020a17090614d500b009886192584esm2757581ejc.28.2023.06.19.08.55.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 19 Jun 2023 08:55:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 15/34] target/arm/tcg: Export some generic vector helpers
Date: Mon, 19 Jun 2023 17:54:51 +0200
Message-Id: <20230619155510.80991-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230619155510.80991-1-philmd@linaro.org>
References: <20230619154302.80350-1-philmd@linaro.org>
 <20230619155510.80991-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x230.google.com
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: fNgH2Ji9CxNs

We want to extract gvec helpers to a new translate-gvec.c
file. Some helpers will still be accessed out of it, from
the current translate.c. Expose their prototype.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/tcg/translate.h | 5 +++++
 target/arm/tcg/translate.c | 8 ++++----
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index d2a98b9f3a..7d57a71b67 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -418,6 +418,11 @@ void gen_sshl_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b);
 void gen_ushl_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b);
 void gen_sshl_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b);
 
+void gen_urshr32_i32(TCGv_i32 d, TCGv_i32 a, int32_t sh);
+void gen_srshr32_i32(TCGv_i32 d, TCGv_i32 a, int32_t sh);
+void gen_urshr64_i64(TCGv_i64 d, TCGv_i64 a, int64_t sh);
+void gen_srshr64_i64(TCGv_i64 d, TCGv_i64 a, int64_t sh);
+
 void gen_gvec_uqadd_qc(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
                        uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz);
 void gen_gvec_sqadd_qc(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 2b3951cece..adefa737c9 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -1925,7 +1925,7 @@ static void gen_srshr16_i64(TCGv_i64 d, TCGv_i64 a, int64_t sh)
     tcg_gen_vec_add16_i64(d, d, t);
 }
 
-static void gen_srshr32_i32(TCGv_i32 d, TCGv_i32 a, int32_t sh)
+void gen_srshr32_i32(TCGv_i32 d, TCGv_i32 a, int32_t sh)
 {
     TCGv_i32 t;
 
@@ -1940,7 +1940,7 @@ static void gen_srshr32_i32(TCGv_i32 d, TCGv_i32 a, int32_t sh)
     tcg_gen_add_i32(d, d, t);
 }
 
-static void gen_srshr64_i64(TCGv_i64 d, TCGv_i64 a, int64_t sh)
+void gen_srshr64_i64(TCGv_i64 d, TCGv_i64 a, int64_t sh)
 {
     TCGv_i64 t = tcg_temp_new_i64();
 
@@ -2120,7 +2120,7 @@ static void gen_urshr16_i64(TCGv_i64 d, TCGv_i64 a, int64_t sh)
     tcg_gen_vec_add16_i64(d, d, t);
 }
 
-static void gen_urshr32_i32(TCGv_i32 d, TCGv_i32 a, int32_t sh)
+void gen_urshr32_i32(TCGv_i32 d, TCGv_i32 a, int32_t sh)
 {
     TCGv_i32 t;
 
@@ -2135,7 +2135,7 @@ static void gen_urshr32_i32(TCGv_i32 d, TCGv_i32 a, int32_t sh)
     tcg_gen_add_i32(d, d, t);
 }
 
-static void gen_urshr64_i64(TCGv_i64 d, TCGv_i64 a, int64_t sh)
+void gen_urshr64_i64(TCGv_i64 d, TCGv_i64 a, int64_t sh)
 {
     TCGv_i64 t = tcg_temp_new_i64();
 
-- 
2.38.1

