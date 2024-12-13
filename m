Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp677738njb;
        Fri, 13 Dec 2024 11:11:22 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVpvx+5DohfmnkUN4jU5I2gF9wSjoSg0A83k8WhTpzyW0dmkcRUNbSW1qL3n+c1KFA/L4/i9BrMWIr7Lw==@linaro.org
X-Google-Smtp-Source: AGHT+IFrRw1bteavPf9S03vUi6XQprhUz0PGMI/kZJCd7sSLDraMcVyDGA4SYKYsaamTGh2ez9JV
X-Received: by 2002:ac8:5741:0:b0:460:8e3b:6790 with SMTP id d75a77b69052e-467a5849d40mr66066641cf.48.1734117082151;
        Fri, 13 Dec 2024 11:11:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734117082; cv=none;
        d=google.com; s=arc-20240605;
        b=bpZmNR6Uf8rC5buwJ84RyLX7Iuzn1rtDfB9dFcv2/9IMgeeVvlS90Kn3OW1vQR5rzx
         MJ2kbAEIO4tvJdrWrEo3j2v1oiTJJnwgeLlLjVjPSn7HKKQ27neymtV51frR0PRRxz5g
         YQ00e4n2PSwROqhYjL0GX4LtNqGX9wLeGum/zm3dQkFRsSA+z2O5NKO3u1TWthhOA3jJ
         sujQzxrsP6fRZkoHiOMdnTVsqIWfV1pb/uM2Cng7+wkDVdRaHli03SoWqxzs4r26quXK
         waPdro24/Ha4r1055pO+drdZhjr9bFaGVeM+v4wPeMhQLj/kJ4ryCVIo4mOeL5X9s1vX
         l/lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5MVjQ/sFVZOHfVsO0iGOMYvfVDMa5zTFWs8lXg66XlI=;
        fh=2LVXFCOsl2Nwb0U5Of/C/2edvrmC+HZycH6VrIgzjes=;
        b=JW+AyUqAWyoGtct5ysMs4/+w+5axC5reAfyLeEuUZgaENcbMU17a1iaC1nxIBN9jxd
         /jSVryfyAIuc7RQpDdmY0JCbVqrTqO5ls0Ar5mlhDrEuy22bgmZkROK44y5LRVfAUD3Y
         N5Vt9GlN5/gGpt6s6UTIvRSEXJY+CUWdJ7JHrg5M8haD4nizlcvXCkRlAneVAMFEKXoe
         aTMCEhWKDew8ZVT08faU0R3onUMJGzwWal0kcItpd+uQm+kbGFTEndfaItGgRlj04SHP
         W2PyfMOK5FB2cBatFzWDpbObGsnZMVNr8tIvnUfsqID4TEuI0SuQ9gbxYZnIK8MtuFpj
         jX7Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="hCN/N+Hr";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-467b2cb9a54si1480701cf.153.2024.12.13.11.11.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Dec 2024 11:11:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="hCN/N+Hr";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tMB2O-0003Vd-4y; Fri, 13 Dec 2024 14:09:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tMB22-0002c0-Qn
 for qemu-devel@nongnu.org; Fri, 13 Dec 2024 14:09:06 -0500
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tMB1w-0006ar-PY
 for qemu-devel@nongnu.org; Fri, 13 Dec 2024 14:08:55 -0500
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-71e287897ceso1220974a34.0
 for <qemu-devel@nongnu.org>; Fri, 13 Dec 2024 11:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734116931; x=1734721731; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5MVjQ/sFVZOHfVsO0iGOMYvfVDMa5zTFWs8lXg66XlI=;
 b=hCN/N+HrrjL1pw/PSd7fRHiTVJTbKiM0ihecyIHzwusutuMOQidTwJtuMxWlEByxPs
 vTn2OmLgfV+X+60IKVaVlqilNQnFp7Muow4Oz6RoVyb8GAW12qQBCK9d9iD9ksGAksF0
 lIFqsR/RKgV7g0rU7Vv2cHAAxbXuUfzer8IBM1srgK9kIX8qvDVdl4phkVfz9+YILJM6
 wsamUGqjQPpZWGkaEctE1X77/XYaCjHojlonXLl+FmhZBM4K9aqu8T8mT5+x4jVkNbi+
 4Hxrih/NhLIcVkFYjmKkkelDs0y16fviU2ZDuzcyIIkdk2MiZBnfDHz3da3tcAbyOpIK
 eK2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734116931; x=1734721731;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5MVjQ/sFVZOHfVsO0iGOMYvfVDMa5zTFWs8lXg66XlI=;
 b=JWZzlWK6qK6+6vCKQcRIjsq3PEKUg0FU6ziZsJAkEAilNSplEA3VWreJKQB1ceMkjb
 1fEepEiXog7QoCBKEg8dXZM4/FcQZcsjA2bfPW6QCHShCVuX5pWLQYnHcAJ1Q1FXWsox
 Snbq4UJC3cFsgGXj4+t1xj3HRwhQAUyZAJtd2duZdiTpDcwlsWpmbcDl5sbDtSgqKH8O
 4t8UZfKmSRBMOxaFok90cL4Tpo2fGbBBvTE9jx9IhcvT7BGkGkNsx28aaWam4dFC6s6q
 7UNlJWgjPNr5QKPQ4UOhOSGFPdRD3nXzGCWaJB3ysHrmo+Pp0Xwo0z4yOIC4T5hwRNmd
 ev4Q==
X-Gm-Message-State: AOJu0Ywh/RzJhvcg2ciZb/Ed6Tg74FFpSzi5K4kTh048+PSWATtn1Nyq
 TqsGds8WwAcvsSm31Vprf7tgZeJR6nNITGCuoShg3K8JWsG+gHX1hLp8lB7StbEGM99LgkPvfaJ
 V2b/OuYz7
X-Gm-Gg: ASbGncvmzrJw54bJwyBteSk1kzu4b3Ut6+8bxSdUqNKNr1dQ81iXvXcwVzxsasDtnbh
 Xx0ygboRY1BORlVUR97b/dU8/P4aciF0/FhWV5tQMyc1do2EPrkBcb+ul+yXQ566nBcrm34zBhE
 P8NB5IW6KEAGqoWpjolQOYTfIPtnHaOdvjupvTjHlZKOFfVGy4y4N7E+zZJSFrgpeTqpwy3l1ES
 Je5W6M4PFmWIfkWwBxTyPyh65EbKGa5UD7GS5mgti4mz4xTuaSd1jHSdToRECxB
X-Received: by 2002:a05:6830:498e:b0:71d:eee3:fd1a with SMTP id
 46e09a7af769-71e3b5bcfd6mr2358437a34.0.1734116930999; 
 Fri, 13 Dec 2024 11:08:50 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-71e4834da91sm29697a34.18.2024.12.13.11.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 11:08:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Tyrone Ting <kfting@nuvoton.com>,
 Hao Wu <wuhaotsh@google.com>, qemu-arm@nongnu.org (open list:STM32F205)
Subject: [PATCH 14/71] hw/adc: Constify all Property
Date: Fri, 13 Dec 2024 13:06:48 -0600
Message-ID: <20241213190750.2513964-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241213190750.2513964-1-richard.henderson@linaro.org>
References: <20241213190750.2513964-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: SwIuO1GUbHBR

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/adc/aspeed_adc.c  | 2 +-
 hw/adc/npcm7xx_adc.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/adc/aspeed_adc.c b/hw/adc/aspeed_adc.c
index 598f2bdf48..f94c6f2be3 100644
--- a/hw/adc/aspeed_adc.c
+++ b/hw/adc/aspeed_adc.c
@@ -286,7 +286,7 @@ static const VMStateDescription vmstate_aspeed_adc_engine = {
     }
 };
 
-static Property aspeed_adc_engine_properties[] = {
+static const Property aspeed_adc_engine_properties[] = {
     DEFINE_PROP_UINT32("engine-id", AspeedADCEngineState, engine_id, 0),
     DEFINE_PROP_UINT32("nr-channels", AspeedADCEngineState, nr_channels, 0),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/hw/adc/npcm7xx_adc.c b/hw/adc/npcm7xx_adc.c
index de8469dae4..1781ff4c0b 100644
--- a/hw/adc/npcm7xx_adc.c
+++ b/hw/adc/npcm7xx_adc.c
@@ -267,7 +267,7 @@ static const VMStateDescription vmstate_npcm7xx_adc = {
     },
 };
 
-static Property npcm7xx_timer_properties[] = {
+static const Property npcm7xx_timer_properties[] = {
     DEFINE_PROP_UINT32("iref", NPCM7xxADCState, iref, NPCM7XX_ADC_DEFAULT_IREF),
     DEFINE_PROP_END_OF_LIST(),
 };
-- 
2.43.0

