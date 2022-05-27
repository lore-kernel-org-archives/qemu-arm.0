Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1255051lfh;
        Fri, 27 May 2022 12:58:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPhsfilrAR45WXywo+1F8A24DOyOZJklFNpDVcOCdP/uVdTASTW0t9d8t7UK/ZtMSBYyqT
X-Received: by 2002:a05:622a:1a82:b0:2f3:b411:e016 with SMTP id s2-20020a05622a1a8200b002f3b411e016mr35087016qtc.218.1653681520081;
        Fri, 27 May 2022 12:58:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653681520; cv=none;
        d=google.com; s=arc-20160816;
        b=TcKZXV86xTDAydPTnQpQuTh1syRVBvav6fpBjhlOfbvCeWeNKgaeu/flgNXaIA0IHI
         r4wxz2ncFRaffE/yeSOMXxvKzj2OhAIym5zEid/diDC3I4WUmVUtpBvMC5iMYdoTsOjZ
         xciRUBWrnmGHuNnQNVCF27OnkUvjASqeRGBw5xWzQ5CGr3oCiJ5akaSolKia+RHzoq/P
         3QSvUl7kfDp9s0eMW4J5geguCEmyj1xF7khp0+4Qo688+vCcgn2nkwfOlCFqAxeWf15O
         OuesMSTJStR9uBikQClv0OXJg4WY/Jozj2OQ1wkUUw/R1rEuw1RYJfpAghQjhFCBDPwi
         zcRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ewrvqu3ItgdWbFZfMwinbl01TKF1FfprQDHhclHqnAY=;
        b=MRU1ZJC8R1EHCVLhKRmbwyVSFn+hHoBryyXcJm4HMRrEispfHEQGzPV2zl7DomYyx2
         2DLssMRgzlZknN3pVtc+x4nSzIgd6wcQu3Ri0Efpltesi4L3Cq2C9+7Z3A/ccIjgcMkD
         ibY5hCc9I02rd15Eyml28bSATG0MRZet4pmFL7K43XlDUVvH7pH8YJbXPOcLIeK3gRXF
         FCU4azrynjkQc4mXLzOr2h6zTczsoJZV4ahGkUT4OOMIuAATmbqyek5kbfLTmMoWDpv1
         c7S1vmiKD8HfsokIFTqQBKUbCceMCN50rFFqioX07P+eiARhpbmb2jqpIu2yQptF1Ugd
         Fqqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ycjgGWNR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y2-20020a05620a44c200b006a339d370bbsi4193943qkp.338.2022.05.27.12.58.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 12:58:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ycjgGWNR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nug6Z-0003Ir-Ii
	for alex.bennee@linaro.org; Fri, 27 May 2022 15:58:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefO-0001bs-Qx
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:26:30 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:33570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefK-0005Hq-U7
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:26:30 -0400
Received: by mail-pl1-x636.google.com with SMTP id f18so4856835plg.0
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ewrvqu3ItgdWbFZfMwinbl01TKF1FfprQDHhclHqnAY=;
 b=ycjgGWNRQrIOcYEnAvIDRhbKe5/o4DuHh6aXAHpvanW2fNOAalKmT9uJrKyol07wqE
 F8uhF3N6vOcU6Y8CYKuJq+3qMP33mIyo3Lacti4GOEJLRvrzm8oDP4lmr72fBi8Aj9rI
 ileWfwQBRCVQTWLo7L7n207sVgJ4wV3DMilrYvZF2qTqnP0iDU12jNkdwwhyjo03ECPe
 5qVWIT0hFSEEhHO4M+mNfW2JUq7kCSkvwH4Le/bCI035RgaLeuIa6TccevGN+03qfUom
 Ka4g7XgzAGrMt1Z+0vyrhaoDHyU3iATyjD7oZExiutxtkkrpcoO6O7aXsDiUF1eTRs9V
 p4Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ewrvqu3ItgdWbFZfMwinbl01TKF1FfprQDHhclHqnAY=;
 b=vrCkMhNqVt01Sx7Ew7Q+960GSlFFKXW3XRAHOyrZTkZKs9yL7hUvWOcsW5VZyPAYK3
 Kzgk8pOGiLbWe1L1m/7w8BQi5msSp2Rcks/qed1xAo8jicUO1ej82/KXWYA4k6l0Dj9y
 dEvCzSADSfcIYPSE4kHtKOVeOrvX9If8k/Hdd/wjLutB8LDsrbjDejxsv+aIjO9zOESE
 EHCdNG0ZPx+CKrUdU2O5MIp+Ki8vuAa02hlInpQHGi+71xsaTluyjF3n7J0wT0QH0CFF
 LA3oQD/hQQq/z08C1c03dUTP3XKmIj5K0Ime9QFjYUv/RJMQ7uL2IbNJy2sEP8vJ8c3q
 ebng==
X-Gm-Message-State: AOAM531/v6x3sdDq0eH6GqPtbPlGDbWCMMgJE6MmRBGoyHjRLyCk8wfw
 Zipxjk3F/ImK121zObvLncG32c4v+I8Hwg==
X-Received: by 2002:a17:902:da84:b0:161:d2d2:184d with SMTP id
 j4-20020a170902da8400b00161d2d2184dmr44653374plx.81.1653675984677; 
 Fri, 27 May 2022 11:26:24 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa7874d000000b0050dc762816fsm3781539pfo.73.2022.05.27.11.26.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:26:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 082/114] target/arm: Use TRANS_FEAT for MOVPRFX
Date: Fri, 27 May 2022 11:18:35 -0700
Message-Id: <20220527181907.189259-83-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
X-TUID: VpnnqNuUCs2u

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index a040d694ea..6e8d8d54bf 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6054,20 +6054,9 @@ static bool trans_PRF_rr(DisasContext *s, arg_PRF_rr *a)
  * In the meantime, just emit the moves.
  */
 
-static bool trans_MOVPRFX(DisasContext *s, arg_MOVPRFX *a)
-{
-    return do_mov_z(s, a->rd, a->rn);
-}
-
-static bool trans_MOVPRFX_m(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_sel_z(s, a->rd, a->rn, a->rd, a->pg, a->esz);
-}
-
-static bool trans_MOVPRFX_z(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_movz_zpz(s, a->rd, a->rn, a->pg, a->esz, false);
-}
+TRANS_FEAT(MOVPRFX, aa64_sve, do_mov_z, a->rd, a->rn)
+TRANS_FEAT(MOVPRFX_m, aa64_sve, do_sel_z, a->rd, a->rn, a->rd, a->pg, a->esz)
+TRANS_FEAT(MOVPRFX_z, aa64_sve, do_movz_zpz, a->rd, a->rn, a->pg, a->esz, false)
 
 /*
  * SVE2 Integer Multiply - Unpredicated
-- 
2.34.1

