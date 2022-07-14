Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp793979lfp;
        Thu, 14 Jul 2022 11:36:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1senH33s4ZOiA144GjmDzcfojctnuFs9VIsAfmelt1QvdEhYYKACz3qXNP56wWuoP819Ghs
X-Received: by 2002:a05:622a:11cc:b0:31d:3d12:6583 with SMTP id n12-20020a05622a11cc00b0031d3d126583mr9571604qtk.260.1657823806066;
        Thu, 14 Jul 2022 11:36:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657823806; cv=none;
        d=google.com; s=arc-20160816;
        b=tZWQXtnHAPmi65jf88uw9sEqKZnn4WyACkEiuN26DdYcYUZSGsmoX9Az0F8tvegzDt
         sTyIBsbm9LdMKZz80u+8P2+d3LlpM+yBGaYTvG+YlDBM37nqzYunbuqI5nhsV3moc3uh
         D+1vGRNKyh7Kpock6ApzXBYQz9tgIXIx1SSoU4a5gvwXaVWBkEzPJl2CdT/v8Ttwkf5h
         9fmyMtn6qVyb6eIe94zD9WFWuw7YWEcgnVRxaA0l1pgQhiZucj7DS0gMoT/CTnQdfNcY
         L3tNJm8BVpOCB5tNpIxPx66cvEAa9gglpnLCm1VNyN73ipgGG0cfZp3Qg0iYWEsRJOPF
         e+Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=v6m/uiCVYIYdHovo0UBGiIH0rA+CsNRH+5x6YrDpxrQ=;
        b=Q7MPEVSm4BewElCJGQ4Paesu1aYDoIT6p+g6sb2qlFfYWRwzh4J4nXbwYwnadNjJ3b
         d60BiAVaPfuX8DK+vHb4/5+28T29QbKx0ekILpCxY0XjuZgo6CjJm3LskvWOMDv9e+Er
         BZJwJP7cOGbVFXh5IJCEVAWvt+4PPPK5gQYEYubwMYW0yogAfR5IEMXY5I/s7r5e/RiZ
         uIdWiirLIBRw8JszSxyTQyqGEctGyEL6ESBAhUpq/6ZVs94mHAC+FMB79XDpWdxCUsOd
         NAjNRk3Jj0IV0jg66Jx2SFR/Rp4NW0CtcjaTIhaFlZR/4EW4S0tzAaMc2YzcZhOjMA0F
         wdtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=mf0oDkX7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n68-20020a37bd47000000b006b5c05a9eafsi1424261qkf.167.2022.07.14.11.36.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jul 2022 11:36:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=mf0oDkX7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:57562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oC3hd-0005Z6-Ib
	for alex.bennee@linaro.org; Thu, 14 Jul 2022 14:36:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3X2DQYggKCH4ywjcqvujiqqing.eqosgow-ctopqpipw.qti@flex--wuhaotsh.bounces.google.com>)
 id 1oC3Zz-0005nE-CN
 for qemu-arm@nongnu.org; Thu, 14 Jul 2022 14:28:51 -0400
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649]:46607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3X2DQYggKCH4ywjcqvujiqqing.eqosgow-ctopqpipw.qti@flex--wuhaotsh.bounces.google.com>)
 id 1oC3Zx-00085D-Sr
 for qemu-arm@nongnu.org; Thu, 14 Jul 2022 14:28:51 -0400
Received: by mail-pl1-x649.google.com with SMTP id
 o5-20020a170902d4c500b0016c643623e8so583925plg.13
 for <qemu-arm@nongnu.org>; Thu, 14 Jul 2022 11:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=v6m/uiCVYIYdHovo0UBGiIH0rA+CsNRH+5x6YrDpxrQ=;
 b=mf0oDkX7fjw1v48O0pywLMLCuTCMDdPWLFJp44Qw4B7l6CV+7FO38XDw+8tvASslJN
 hyUiCc6pMp5XkHZSDV6pB5dNqVKR84RW7+sV56uXOmAmZVJMkQ8gAS2UKQLCgsgoixQd
 sxDrywkKOqe0YoIF9ggx9yMkUY9RKDTY1VkQsHC0PS3oxm0OKnAEzYyurE0CoyoQNROh
 tGqUtCNuVp8hWnxbNFZDJUSAAdYm5+aGTSxyL3g1w8DKbtaWQQMhMARvRVXUzbe7tsN3
 7YTQ2b0TEw9/o9RhnQuK0sRjnrhmbAHQJcxPd1TnT94btxVhtlHuihj+6G7zfLylzPHY
 JIBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=v6m/uiCVYIYdHovo0UBGiIH0rA+CsNRH+5x6YrDpxrQ=;
 b=6ZdVgFSVEPq/U65/H+xcQcUzQFHI2CAKIoJk6qNxxmw1G0FUKdAw47V32cSbfFFCB4
 qE7aG3KC0BLjLNtbAAWx3x2+iaU9qOzXBw1eRv+rXfbfJR1RuApSHj+cQY7CPxQvR2PR
 fnE9n3DQdnUWsHC5fDgxx4Vio4ZGfwKUlyPXNTEA48Ey6vUXTIzHApS28KwpjIs1kj6P
 gfG1cNkhZ8qRrM+wcHhcp8R8IftAIxhP7djCv6qQvemaNw9Uy3nngAE/qdsq8RrZBn92
 peVb57xve6CdsbGpxoxtqL3hd1t8ie31ulttvZGwaVp3ZoqPRjFw25R8p8eE0hkFjZf8
 NK8w==
X-Gm-Message-State: AJIora9AyzIe7tzDX+mpJjqkF3egKm5TnqsspAbwCRl1/+zkfOUZ4rVw
 VJR4uTnFFlMWAuuCOP0Ya1VD9wURvlJ3tQ==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90a:249:b0:1e0:a8a3:3c6c with SMTP id
 t9-20020a17090a024900b001e0a8a33c6cmr627285pje.0.1657823327147; Thu, 14 Jul
 2022 11:28:47 -0700 (PDT)
Date: Thu, 14 Jul 2022 11:28:32 -0700
In-Reply-To: <20220714182836.89602-1-wuhaotsh@google.com>
Message-Id: <20220714182836.89602-5-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20220714182836.89602-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
Subject: [PATCH v5 4/8] hw/adc: Make adci[*] R/W in NPCM7XX ADC
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 wuhaotsh@google.com, venture@google.com, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, hskinnemoen@google.com, f4bug@amsat.org, 
 bin.meng@windriver.com, qemu-block@nongnu.org, armbru@redhat.com, 
 thuth@redhat.com, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::649;
 envelope-from=3X2DQYggKCH4ywjcqvujiqqing.eqosgow-ctopqpipw.qti@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x649.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: AplZ1xW27+5A

Our sensor test requires both reading and writing from a sensor's
QOM property. So we need to make the input of ADC module R/W instead
of write only for that to work.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Titus Rwantare <titusr@google.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/adc/npcm7xx_adc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/adc/npcm7xx_adc.c b/hw/adc/npcm7xx_adc.c
index 47fb9e5f74..bc6f3f55e6 100644
--- a/hw/adc/npcm7xx_adc.c
+++ b/hw/adc/npcm7xx_adc.c
@@ -242,7 +242,7 @@ static void npcm7xx_adc_init(Object *obj)
 
     for (i = 0; i < NPCM7XX_ADC_NUM_INPUTS; ++i) {
         object_property_add_uint32_ptr(obj, "adci[*]",
-                &s->adci[i], OBJ_PROP_FLAG_WRITE);
+                &s->adci[i], OBJ_PROP_FLAG_READWRITE);
     }
     object_property_add_uint32_ptr(obj, "vref",
             &s->vref, OBJ_PROP_FLAG_WRITE);
-- 
2.37.0.170.g444d1eabd0-goog

