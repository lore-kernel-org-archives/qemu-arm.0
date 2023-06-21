Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp807463ejt;
        Wed, 21 Jun 2023 05:19:50 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7vi6/vmTcd49NMXAqVpx28q1YRQTQGGj+k9p54IIUk0R34veG8CepriHq+B8kcSGe55538
X-Received: by 2002:ac8:5c12:0:b0:3ef:4a9b:5dca with SMTP id i18-20020ac85c12000000b003ef4a9b5dcamr18737023qti.29.1687349990616;
        Wed, 21 Jun 2023 05:19:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687349990; cv=none;
        d=google.com; s=arc-20160816;
        b=QBU45UI1dGhTubVWz1GnezRpCOHvMNa7eor4aWLeYbEJY3Kh2XXwaFJEkXT+z+mYZK
         JoXQOl2y8X4LqIER6d65WESmo6wKMgxsT9/r/AC6F2lWMjDqcNPdnQDNJtc/Yczyl8Qz
         rWAsWDT9SFxz5OFN8t4tiD1MUKfg9sfuVPLGiTp9bkHxUiXCExbKGtqhSzjRRJvNsguB
         RQUcXMifKcoE4NdeuyR4/B2IRIjTDfwJS5eOEazm15UT/AnDlsfq9Bx7uMQggk7Z2qc8
         WjBcNwwBCnK6Kc2uk8hFlxvdCvx17F7XOSlCw25HMqVSaMX2CqbDFv7HF2VVGYNkrk+x
         3EaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GpguwOP2tBZG1Q3kxp3nwyx4GamestPy42HvjJG3rb4=;
        b=sL52jjyPEGWcK8VlZZuM/sV8fqGTHeoetkNEbHmEKXj83dCR5n90k4f9vPRESzxtmm
         eqeeOX2dIzMCy2uvp0KLGNLhJjt/VfLA3kDkKjmTdOEL9PnQPAc7ZtA26hz5bVEqIAbj
         2cIQPqbvORx8K+MFmu+P7J+VtaMLpzUbZKPB1LCG1dXRQEJzXlTW+39CzMsB1ZNdPhHm
         81pom/CNlvoLvS2D+YwYOeDNF2yozscNiLo8Z6O9E9P5h8DULtpNksWuXRQwjexTFsln
         uoTMglz18StRSGVh3XbNs/zBmZeOQ3I7wirYu/n4jXqhpd/ivoPH4UsN7/GGJtauvmy5
         35mQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gnWTaINY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w17-20020ac87e91000000b003f224ede873si1715049qtj.103.2023.06.21.05.19.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Jun 2023 05:19:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gnWTaINY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBwo6-0006kH-Nj; Wed, 21 Jun 2023 08:19:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBwnn-0006dV-Tq
 for qemu-arm@nongnu.org; Wed, 21 Jun 2023 08:19:18 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBwnm-0000Hm-88
 for qemu-arm@nongnu.org; Wed, 21 Jun 2023 08:19:11 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5196a728d90so7653148a12.0
 for <qemu-arm@nongnu.org>; Wed, 21 Jun 2023 05:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687349948; x=1689941948;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GpguwOP2tBZG1Q3kxp3nwyx4GamestPy42HvjJG3rb4=;
 b=gnWTaINYoFK7YnMFmAGL1xVzTtBzYEUXaasI8RYPY9QU9oqxGogobY6/iyYGjpYvgH
 aEj5BsUI/4yHbEKg96SvlLJCLDKWXaWZL+POZMD3NbWxGk7In5qN/rXLSLO0URUv2qUQ
 LWVH5+WZNeD7bG5ZDdZaeASj2Y2Gp+vSesWlcP0uayyEh+MYLqDIjzoqmh7lgXMtGoJW
 v8j9aKh3olLwrTUuZbKMoey3drIrUSCn12lBTLqS7AUJdBzVOQ0KgRDrCyG0MUKQmvkx
 o3wy7B3tTlLk5ksrbJkAJqeE0TjeMvm/Hwum27kbYPgv3E0dvSgsQcFIWRe182PuOIrP
 QN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687349948; x=1689941948;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GpguwOP2tBZG1Q3kxp3nwyx4GamestPy42HvjJG3rb4=;
 b=Hu3S89uh0X1D7I1xaAmRI7sxgYFqXW3IuBYG3wE2N4qE14mXBbGN4bTYL0yzXLcF02
 tuHwPfeNXUd6HOXVeUO3zy9e8FqddiGYw6koqZBUuPiykWGIY14TibZmC1vlIsi8cVrk
 h/+DMTaTWE4u63e1c48xjEQRkW/PqLs7njDlA4sd2eyJME7q/2C7W6SFegrbyDUcfYiJ
 7BrG0viGNe21eXxCs6YBaYwLk7m3HlhEsGMWWIC/N2ECpK9C09oJzYbWMlQDmSbUz03N
 O58KK13y/cG82/hAY27GWoEn5lomfS16pfm+J8dh9JZQuquXQn8QrDSWyXRJXrpnHt/m
 QBBw==
X-Gm-Message-State: AC+VfDzRpGQLhEbHTHBhQEYK5t2FzMHkQVQQnHbsc29cXzxoSNDvOKpx
 Vsxv86523o6cPnyKV76j9O9DK43BFrt/oqFe2vCsNnjs
X-Received: by 2002:a05:6402:45a:b0:51a:2013:583 with SMTP id
 p26-20020a056402045a00b0051a20130583mr9985016edw.13.1687349948668; 
 Wed, 21 Jun 2023 05:19:08 -0700 (PDT)
Received: from stoup.lan ([176.176.128.70]) by smtp.gmail.com with ESMTPSA id
 s6-20020a056402014600b0051bdf152295sm543176edu.76.2023.06.21.05.19.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 05:19:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 4/9] target/arm: Support 32-byte alignment in pow2_align
Date: Wed, 21 Jun 2023 14:18:57 +0200
Message-Id: <20230621121902.1392277-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230621121902.1392277-1-richard.henderson@linaro.org>
References: <20230621121902.1392277-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x531.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: zF1N5+kpg9kZ

Now that we have removed TARGET_PAGE_BITS_MIN-6 from
TLB_FLAGS_MASK, we can test for 32-byte alignment.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 13c88ba1b9..286497ebf9 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -900,13 +900,7 @@ static inline void store_reg_from_load(DisasContext *s, int reg, TCGv_i32 var)
 MemOp pow2_align(unsigned i)
 {
     static const MemOp mop_align[] = {
-        0, MO_ALIGN_2, MO_ALIGN_4, MO_ALIGN_8, MO_ALIGN_16,
-        /*
-         * FIXME: TARGET_PAGE_BITS_MIN affects TLB_FLAGS_MASK such
-         * that 256-bit alignment (MO_ALIGN_32) cannot be supported:
-         * see get_alignment_bits(). Enforce only 128-bit alignment for now.
-         */
-        MO_ALIGN_16
+        0, MO_ALIGN_2, MO_ALIGN_4, MO_ALIGN_8, MO_ALIGN_16, MO_ALIGN_32
     };
     g_assert(i < ARRAY_SIZE(mop_align));
     return mop_align[i];
-- 
2.34.1

