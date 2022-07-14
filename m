Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp784282lfp;
        Thu, 14 Jul 2022 11:08:33 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1stO3fWZmHJFnf89j2c/8OQJD8DuUFb/s6cporR3VA3nUU7oddXetNVDXIlLbn4IKMLqGoh
X-Received: by 2002:a05:620a:19a4:b0:6b5:a4aa:7ae6 with SMTP id bm36-20020a05620a19a400b006b5a4aa7ae6mr6789237qkb.188.1657822113454;
        Thu, 14 Jul 2022 11:08:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657822113; cv=none;
        d=google.com; s=arc-20160816;
        b=K+Zt28XfhhMI3ylsMhLHLE/ktdOPD4i9/XRCZpo/47vIbA4e/o6RGylqZJ8qa36fKw
         ZP4O9IBAusPPu8I9Rivk8pXod5ziOBAGcqcUeotibb17NtfZVZFN6/XPG3hyJPC3Y00H
         KFBAXByZZFJDK2a/dS/55XxycMQuIHXglsF0CU4Rk7KvguO9t6e7Y0DzAKgvmNgjeiaT
         nzFdHij2seNRPR6wi8vF2pdkaLeueRsSzffxTH67avhZVHCOC/Ug80eL1SfQau/YuLMh
         Bi9BlDYUnjOJ1QBT8CVcnn9kns6/0MobCDO2OeI/TCYmYp87+LPTKr63i8/zQA4seEcD
         sJtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=9RSMCVtgEUKdUpQ4wTwqsgQXo0b+gCf5+b6+bpknwSs=;
        b=XfRno4qLSNPAJGj3bITsqbbWq3ML4Mw8aY4zbTu4pq5fAYWOkS9rgbqMpZS9JpV81g
         DxtQpQ+YVJVDjusxGVR5+PZiA68a9blNJEZcP99+/VpETZL/Rf1u+3WbW83G1bTEzYN7
         ELN/PaaBE4TAtA6ZuFClteQ5kIlTymlIEK3lAdbVVr7Htq/TGrL0XVUdySk0dDGpZQrI
         fijZWGiq2nTtqutNoJE0LeAAt+R+4A4OVTz+dwnxFORlC7gaFW1fQv1aPp7v2zqUAPFX
         ZdBKKy8eiw+Rr2zwobA3Erj76OqEi8IxcRoMoG944smYuT3+BSz2hhdohiPndeLpE5MQ
         AzqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=gNr+pIu8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q18-20020a05620a2a5200b006b58fb7e821si1853087qkp.22.2022.07.14.11.08.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jul 2022 11:08:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=gNr+pIu8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:43864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oC3GK-0000DA-VC
	for alex.bennee@linaro.org; Thu, 14 Jul 2022 14:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3vVnQYggKCM4GE1u8DC108805y.w86Ay6E-uB678707E.8B0@flex--wuhaotsh.bounces.google.com>)
 id 1oC38r-0007Kd-UM
 for qemu-arm@nongnu.org; Thu, 14 Jul 2022 14:00:49 -0400
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549]:35580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3vVnQYggKCM4GE1u8DC108805y.w86Ay6E-uB678707E.8B0@flex--wuhaotsh.bounces.google.com>)
 id 1oC38o-0005dq-Gx
 for qemu-arm@nongnu.org; Thu, 14 Jul 2022 14:00:49 -0400
Received: by mail-pg1-x549.google.com with SMTP id
 9-20020a631449000000b00412b1418c79so1559648pgu.2
 for <qemu-arm@nongnu.org>; Thu, 14 Jul 2022 11:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=9RSMCVtgEUKdUpQ4wTwqsgQXo0b+gCf5+b6+bpknwSs=;
 b=gNr+pIu8sqZJcM8nYeCB4Hv+y2dCsdaYgq3UkqxXTll2ZZR9Dh4ZVn5+kLZ3fKWyVU
 gAItdCii/WZ1pvOB0nYQ67xMINF3uruWE1Zxg0ePGgVi9zgiB1vNJIMtxV6MDgdcn5Cx
 7sdQOVQ9bmRFPGjw5WdaCBlHjY0nBiCpq1H0V2NKzSFX1l3sbi2aCLemtlWchX9g70Zj
 pmZwBxdmfizeOQ/NnZa5s1j2AWHk8jMCtdfvxZNtCYNDwvTgISAniiJzoo/ttk99p8YS
 iMx3qmfHQq4KQvzJkwJStduCkrOoPdn0AShqXrEN8AtUdoZRdUU1/mv1zEmklPlCSjlb
 oCxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=9RSMCVtgEUKdUpQ4wTwqsgQXo0b+gCf5+b6+bpknwSs=;
 b=MND0D+F9g+Y0Vw+rkqkSNLQCWiIj8sJbWAStZJKgA/s5D8lmEbA5dBJBu5jSTrMbKD
 pO7BrYESQPeQbtKoVTE9y0U4xWVshN1pT6nwoV7zrmi41dSAPHJOISRjWffi9PB+CzEW
 iHiqEq84f3LbKOCLPp4tpjZ4yT0qzl/mYPGcy7CIoGijBnWUsdTtRbEydxHD2Qgxaqc7
 G2vw3kqaHqCIDcrSvcn5cjbZTWUQzhomusnQ7JuuBsjKwsI8/gKlI9gJSU0HODQq1EZa
 sXbxtpL2XcLrWZYv/QraFLzbMxOtQJmyV8tXqWnwoVsDF4SsJl/mAYXlykapoC5s0npn
 TKUw==
X-Gm-Message-State: AJIora+h6JIpqPpHPSV+zX/tVNv9kSym/0xVm4ieHmp/9Vz5qw4hgZr6
 vwEu1+MBjHQBwWue+pWi/qGhnfMNFQ9Eog==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:902:a607:b0:16b:dd81:bf8b with SMTP
 id u7-20020a170902a60700b0016bdd81bf8bmr9311725plq.84.1657821629396; Thu, 14
 Jul 2022 11:00:29 -0700 (PDT)
Date: Thu, 14 Jul 2022 11:00:01 -0700
In-Reply-To: <20220714180006.77360-1-wuhaotsh@google.com>
Message-Id: <20220714180006.77360-4-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20220714180006.77360-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
Subject: [PATCH 3/8] hw/adc: Fix CONV bit in NPCM7XX ADC CON register
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 wuhaotsh@google.com, venture@google.com, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, hskinnemoen@google.com, f4bug@amsat.org, 
 bin.meng@windriver.com, qemu-block@nongnu.org, armbru@redhat.com, 
 thuth@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::549;
 envelope-from=3vVnQYggKCM4GE1u8DC108805y.w86Ay6E-uB678707E.8B0@flex--wuhaotsh.bounces.google.com;
 helo=mail-pg1-x549.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: YdLDsZvOzTOy

The correct bit for the CONV bit in NPCM7XX ADC is bit 13. This patch
fixes that in the module, and also lower the IRQ when the guest
is done handling an interrupt event from the ADC module.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Patrick Venture<venture@google.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/adc/npcm7xx_adc.c           | 2 +-
 tests/qtest/npcm7xx_adc-test.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/adc/npcm7xx_adc.c b/hw/adc/npcm7xx_adc.c
index 0f0a9f63e2..47fb9e5f74 100644
--- a/hw/adc/npcm7xx_adc.c
+++ b/hw/adc/npcm7xx_adc.c
@@ -36,7 +36,7 @@ REG32(NPCM7XX_ADC_DATA, 0x4)
 #define NPCM7XX_ADC_CON_INT     BIT(18)
 #define NPCM7XX_ADC_CON_EN      BIT(17)
 #define NPCM7XX_ADC_CON_RST     BIT(16)
-#define NPCM7XX_ADC_CON_CONV    BIT(14)
+#define NPCM7XX_ADC_CON_CONV    BIT(13)
 #define NPCM7XX_ADC_CON_DIV(rv) extract32(rv, 1, 8)
 
 #define NPCM7XX_ADC_MAX_RESULT      1023
diff --git a/tests/qtest/npcm7xx_adc-test.c b/tests/qtest/npcm7xx_adc-test.c
index 3fa6d9ece0..8048044d28 100644
--- a/tests/qtest/npcm7xx_adc-test.c
+++ b/tests/qtest/npcm7xx_adc-test.c
@@ -50,7 +50,7 @@
 #define CON_INT     BIT(18)
 #define CON_EN      BIT(17)
 #define CON_RST     BIT(16)
-#define CON_CONV    BIT(14)
+#define CON_CONV    BIT(13)
 #define CON_DIV(rv) extract32(rv, 1, 8)
 
 #define FST_RDST    BIT(1)
-- 
2.37.0.170.g444d1eabd0-goog

