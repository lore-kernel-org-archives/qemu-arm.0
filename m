Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp2048246lfj;
        Tue, 11 Jan 2022 16:31:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwHQzoo2lZxdoE0ZRs/31PSdO98yP4CooL3uOOExQ/MtLtAIz3eMvApoolzHVXyws9LDuyw
X-Received: by 2002:a05:6902:1209:: with SMTP id s9mr9660776ybu.48.1641947500512;
        Tue, 11 Jan 2022 16:31:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641947500; cv=none;
        d=google.com; s=arc-20160816;
        b=kwFVoBp60z+oS7/9lTOnIXgywsNjWDz6UqwCJ9yTROigeRNeLgPc5P2WN39FrklxVm
         kmcEr2bc5WLsoDybTcDhwUVHPN44QCyHb7o+7NXf5TYHJp/VaAsf8R5sVgNMWLFV7xcB
         5V2Z0gLapjYuIKcdrWChdeHRujueahmn8IPV97fuqkVE3MwtAA0IDKlTO8DtJPkxEnMY
         Oi4XetAV56CCcdhq0IAUojP+9w0wvgAk06lyApIIsBENWjdU4Etb1X689xEXhzCwvuG5
         4tEhAht/9+nAeXZQWVBLgbDr5VNmbXT+hzQyhTCXUknRQQqyKuxEvXDBsLS43iWxy9cM
         +qMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=0ZRSoPQaiY5p4Jycz+o3xvYFFOsg7FBKad4LO9NucLo=;
        b=ckx7xiScVi23vGC830/t4OgbwNGE7djgNhggRa6UCza/mxT35rxZ4TCkKdEpLXnDfb
         CdL79gD4nE1Kl21JCUDMOxFW3yo8siha+iza4GGcR01+OohWVqKD3mu3Fxfe/9EfadnV
         crt+l9k2LnLc3/q4yofqCtd/1uEBFm9uiAlysl0WJX9nq9ll/IeVVtl8lrzNVSS88FNi
         FV7ajsReA+5/91TPL+V0Mx2xvpy8zBYM3vpTAdJJdmxsETzejcJqXfzFFFG+Jm6ougXQ
         JsSd4IdjQQLov7c6qWWxq9g5bb68bxDyJK+HFWrizPgOW+cBBV7ULaSqRS9Jav8SQQlG
         5+OQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=PjA14Owa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w69si2063930ybe.282.2022.01.11.16.31.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jan 2022 16:31:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=PjA14Owa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:45476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n7RYB-0005KS-VJ
	for alex.bennee@linaro.org; Tue, 11 Jan 2022 19:31:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <38x_eYQYKCMAzoz0yxmuumrk.iuswks0-gxstutmt0.uxm@flex--titusr.bounces.google.com>)
 id 1n7RXU-0005JL-4y
 for qemu-arm@nongnu.org; Tue, 11 Jan 2022 19:30:56 -0500
Received: from [2607:f8b0:4864:20::a49] (port=50109
 helo=mail-vk1-xa49.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <38x_eYQYKCMAzoz0yxmuumrk.iuswks0-gxstutmt0.uxm@flex--titusr.bounces.google.com>)
 id 1n7RXS-0004qK-7q
 for qemu-arm@nongnu.org; Tue, 11 Jan 2022 19:30:55 -0500
Received: by mail-vk1-xa49.google.com with SMTP id
 w65-20020a1f6244000000b00317041f0e4bso219871vkb.16
 for <qemu-arm@nongnu.org>; Tue, 11 Jan 2022 16:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=0ZRSoPQaiY5p4Jycz+o3xvYFFOsg7FBKad4LO9NucLo=;
 b=PjA14OwaZ10G9m/p7Nf2Iv/BPvhY4Um1TlfyFmhydbzsznjDL4kaVaV9PE8GtszMVT
 fH7xGmIAod1Xolb4Yzo+Xr8bEihf/ultZ4KJLRpo8ArFamHBy3qNht0sGnfiAECmq2DL
 FupfOfDtbWEDyqqTlACKHEaxmGDGP9G3guOlxqkTm2cojoc7FMqbRBCI/P0zQpJX/7su
 FUtyrK1dI2fBJYnpQdlB8pm9BXUcyx1egGg2jW4K//Z9aXfve1LGXRpmN570EMjhyyui
 oZ06xbmqbsxwat5/sDb2JJ2T1XQ78QOpamyQkyxM7Xo1nLIsnEteiJYUWB/HvAjlZpO1
 e17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=0ZRSoPQaiY5p4Jycz+o3xvYFFOsg7FBKad4LO9NucLo=;
 b=SffmJ9HKs3VSh8oMjam/dzrd5IXA7tQEhdaRTlUNWhQOOGyz8jJK3kUCkVP1p79WsP
 q3OMRzBhyoTFqt/4X9ggEdqDIFip9uUMlktKeC3KjKkpr+7dOgoYrt1PtZpq2qf/GVv6
 d5q0ikWlR+zNYlSeuUjh3HGBTlcW97YVnMlWXF0ZNFVI9H28ZnBjPMmt24+rzAMvkRUM
 NXLrmexvLxo9b+CfIX5Ao0++KwQonZDcD9SA5AdJJzclm504dy7widP/VlrbIfStBVyw
 saQkEP7VMYve4tWiu4Qs5b6RjB04AjVa+DgIpaBci63L7mzURkopvCb7cJPyzKH44tr6
 mqPA==
X-Gm-Message-State: AOAM530olZ3yeH30i8PesbWIytcjBw9IfaQq5wervdraVQXjIxAOCvI2
 QwqB1rtDw8pbt4n8gPkjKe425NVVf7c=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a05:6122:513:: with SMTP id
 x19mr3536346vko.40.1641947123264; Tue, 11 Jan 2022 16:25:23 -0800 (PST)
Date: Wed, 12 Jan 2022 00:25:15 +0000
In-Reply-To: <20220112002515.3991540-1-titusr@google.com>
Message-Id: <20220112002515.3991540-3-titusr@google.com>
Mime-Version: 1.0
References: <20220112002515.3991540-1-titusr@google.com>
X-Mailer: git-send-email 2.34.1.575.g55b058a8bb-goog
Subject: [PATCH 3/3] hw/arm: kudo add max31790 behind bus 1 switch at 75
From: Titus Rwantare <titusr@google.com>
To: minyard@acm.org, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, f4bug@amsat.org, 
 venture@google.com, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a49
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::a49;
 envelope-from=38x_eYQYKCMAzoz0yxmuumrk.iuswks0-gxstutmt0.uxm@flex--titusr.bounces.google.com;
 helo=mail-vk1-xa49.google.com
X-Spam_score_int: -87
X-Spam_score: -8.8
X-Spam_bar: --------
X-Spam_report: (-8.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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
X-TUID: EDzHtxDx2DpZ

From: Patrick Venture <venture@google.com>

Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Titus Rwantare <titusr@google.com>
---
 hw/arm/npcm7xx_boards.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 7d0f3148be..6fea2e161f 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -342,6 +342,7 @@ static void kudo_bmc_i2c_init(NPCM7xxState *soc)
     i2c_mux = i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 13),
                                       TYPE_PCA9548, 0x77);
 
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 2), "max31790", 0x2c);
     /* tmp105 is compatible with the lm75 */
     i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 2), "tmp105", 0x48);
     i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 3), "tmp105", 0x49);
-- 
2.34.1.575.g55b058a8bb-goog

