Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp503503ejb;
        Thu, 19 Oct 2023 06:11:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrK1RwKrAMjUhAU8RMWz8iPChEmFKzvCzbkGSSkfVS/E+s4ICnkGpUbpWfK/g5uOdN+jsX
X-Received: by 2002:a05:600c:4e86:b0:401:dc7c:2494 with SMTP id f6-20020a05600c4e8600b00401dc7c2494mr1909001wmq.27.1697721107728;
        Thu, 19 Oct 2023 06:11:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697721107; cv=none;
        d=google.com; s=arc-20160816;
        b=sxhgkl5i5uUastvlOP9tQqnnWQI+39pI/0ULf+gR1otLBUau/8S4SBOSjqABmDhV0G
         Y7bEtBAPqAm1DxU1gSRTG8xNAXfSj3BWxbCJ/bEqzNV/nhnBRI27EfgEcQOu8pXdDj1X
         qkik924ZL0fPSZ1ephFVBUKvT02XFBW84uDc9XhtKbz3bl1XqWyL0BoUzbU1tb4K+OLq
         ad2fpxCeaS2H4PdykB9hYAzNFfXmrgW1jyzOKonEE83fU36vDLHT4Z8t+ROBZom/zgB6
         YoDpo/bCWOTeT8wXWRi8u6peGtqryW1N4uGGLmshEYCZ1RbSlXAVlgwbXE18iYBJgeeV
         I9kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=kCYRI8Q1kvi4VpcB4GZtS6fXIL0c6XiuN6TOx6QUjpw=;
        fh=rYBZhAJdgCvxZRRcO2tKw9iXjHkAG8ZfVdmqU/2KeAE=;
        b=Puen75JXbP+qMNOE4ff2CARIHSnr7ijasNMTkKAOlZbpaNNvvT7mios5HtHeNWkBa6
         U3L0Ijf52lsjRW1Mq2CEzqjfkCbIOwicDZ4yQ413TEV9aZHjDRDi76ew3RcszZ6Qyjfi
         FD7HC1pc1CGIjA8FODsOwoB77CaPhxbdy5/jXToBGviOb4ESCmwokXdxBsv+9kOeBCiR
         dY1+8c5MZWc0YAAaVgVmwlsxDy7V8JeSkaBovsKL4WKSBLMQpqNpBB4BM3QnMtDJoLgW
         /8/ydVQJaM1va06bNCUVoKsVAtUY2NLlMm2f7ScdiFYlUCcSPszXZXVdWISADUKkE2pR
         gspw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XeP2VzGj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g16-20020a05600c4ed000b003fe41c115ffsi2528834wmq.219.2023.10.19.06.11.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 06:11:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XeP2VzGj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtSmv-0005F8-LH; Thu, 19 Oct 2023 09:10:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtSmn-0004qd-AC
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 09:10:01 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtSmk-0007lo-SN
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 09:10:00 -0400
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-50797cf5b69so8474223e87.2
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 06:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697720997; x=1698325797; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kCYRI8Q1kvi4VpcB4GZtS6fXIL0c6XiuN6TOx6QUjpw=;
 b=XeP2VzGjGC5sm1fK9s87Nzoq2buKj95HByZEIs9Jctr+TkbyFYtmxE+WEDcRILUTuC
 maHMhc9wLUPFTkSiRm2Gkum/YBOVa5Sf/O5fMI/2XXKmhUgEaBZDIHT6pkIbHs0ZMv5m
 HcG6Euz+x0VzQTyQvh9ObWCpOTcNejMmXLftlDQ3VwsfUn6E4sig8XcUqhH1v1gisE+k
 Y0oD1uvqcPi83Y6OnoDlm3VerffpMMsoaDibDD8KH/hAEErIcJZ6PfJ3+EwqqBPW4iL7
 rBrorCy+we2cpQiDtVUK8ZH66eSMYkq/pFTT8cP9isIpxZavFuJxAIRkyBfZBeSJysFK
 jgZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697720997; x=1698325797;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kCYRI8Q1kvi4VpcB4GZtS6fXIL0c6XiuN6TOx6QUjpw=;
 b=Zc8o0C+nyIh59LnSCpuPO0cwF/Q3JpK33NQiuj314F5qG+TCROS35+sQPIPvRRnc7/
 uPozmwJ5ZY72WodNrxlq6FLwoBtGEBokj3ZItRg2cQdpEggIQiTPAy/pKWtrYwC+Ys5C
 wPgOAyPCPakHezHN2iF/oL2mPdSvHhSKFGHWa2Nl5UkOiMITcDakXTBrVGdAqyu5Yqhz
 MgYqwULkPa3ydpY8RzItvEwNbdtEM6KFW8fdthpt11DNM6tdvNdpKL2bu4rmf4vFPQfK
 /rT2C/HPxh7VW5Zl8S8ZACLeEJVtn4xDf2k9fkOThRmTs+jaLZVrmXidacMXESbLcHbD
 6voA==
X-Gm-Message-State: AOJu0Yy0ioHFWshxXgGkGoT+ujPlpQG6YwxdfFmUAUApdzGqgsVfn6To
 nTaHw3ouOMCVLc63QKKoW8NDCQ==
X-Received: by 2002:a05:6512:b9f:b0:507:a650:991d with SMTP id
 b31-20020a0565120b9f00b00507a650991dmr1840661lfv.58.1697720997128; 
 Thu, 19 Oct 2023 06:09:57 -0700 (PDT)
Received: from m1x-phil.lan (176-131-216-177.abo.bbox.fr. [176.131.216.177])
 by smtp.gmail.com with ESMTPSA id
 1-20020a05600c028100b004077219aed5sm4324781wmk.6.2023.10.19.06.09.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Oct 2023 06:09:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 5/9] hw/pcmcia/pxa2xx: Inline pxa2xx_pcmcia_init()
Date: Thu, 19 Oct 2023 15:09:20 +0200
Message-ID: <20231019130925.18744-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019130925.18744-1-philmd@linaro.org>
References: <20231019130925.18744-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12c.google.com
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
X-TUID: WUCCazDGcEOM

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/pxa.h |  2 --
 hw/arm/pxa2xx.c      | 12 ++++++++----
 hw/pcmcia/pxa2xx.c   |  6 ------
 3 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/include/hw/arm/pxa.h b/include/hw/arm/pxa.h
index 54eb895e42..4c6caee113 100644
--- a/include/hw/arm/pxa.h
+++ b/include/hw/arm/pxa.h
@@ -100,8 +100,6 @@ void pxa2xx_mmci_handlers(PXA2xxMMCIState *s, qemu_irq readonly,
 #define TYPE_PXA2XX_PCMCIA "pxa2xx-pcmcia"
 OBJECT_DECLARE_SIMPLE_TYPE(PXA2xxPCMCIAState, PXA2XX_PCMCIA)
 
-PXA2xxPCMCIAState *pxa2xx_pcmcia_init(MemoryRegion *sysmem,
-                                      hwaddr base);
 int pxa2xx_pcmcia_attach(void *opaque, PCMCIACardState *card);
 int pxa2xx_pcmcia_detach(void *opaque);
 void pxa2xx_pcmcia_set_irq_cb(void *opaque, qemu_irq irq, qemu_irq cd_irq);
diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index 07d5dd8691..601ddd8766 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -2205,8 +2205,10 @@ PXA2xxState *pxa270_init(unsigned int sdram_size, const char *cpu_type)
     sysbus_create_simple("sysbus-ohci", 0x4c000000,
                          qdev_get_gpio_in(s->pic, PXA2XX_PIC_USBH1));
 
-    s->pcmcia[0] = pxa2xx_pcmcia_init(address_space, 0x20000000);
-    s->pcmcia[1] = pxa2xx_pcmcia_init(address_space, 0x30000000);
+    s->pcmcia[0] = PXA2XX_PCMCIA(sysbus_create_simple(TYPE_PXA2XX_PCMCIA,
+                                                      0x20000000, NULL));
+    s->pcmcia[1] = PXA2XX_PCMCIA(sysbus_create_simple(TYPE_PXA2XX_PCMCIA,
+                                                      0x30000000, NULL));
 
     sysbus_create_simple(TYPE_PXA2XX_RTC, 0x40900000,
                     qdev_get_gpio_in(s->pic, PXA2XX_PIC_RTCALARM));
@@ -2338,8 +2340,10 @@ PXA2xxState *pxa255_init(unsigned int sdram_size)
         s->ssp[i] = (SSIBus *)qdev_get_child_bus(dev, "ssi");
     }
 
-    s->pcmcia[0] = pxa2xx_pcmcia_init(address_space, 0x20000000);
-    s->pcmcia[1] = pxa2xx_pcmcia_init(address_space, 0x30000000);
+    s->pcmcia[0] = PXA2XX_PCMCIA(sysbus_create_simple(TYPE_PXA2XX_PCMCIA,
+                                                      0x20000000, NULL));
+    s->pcmcia[1] = PXA2XX_PCMCIA(sysbus_create_simple(TYPE_PXA2XX_PCMCIA,
+                                                      0x30000000, NULL));
 
     sysbus_create_simple(TYPE_PXA2XX_RTC, 0x40900000,
                     qdev_get_gpio_in(s->pic, PXA2XX_PIC_RTCALARM));
diff --git a/hw/pcmcia/pxa2xx.c b/hw/pcmcia/pxa2xx.c
index a2ab96d749..e3111fdf1a 100644
--- a/hw/pcmcia/pxa2xx.c
+++ b/hw/pcmcia/pxa2xx.c
@@ -138,12 +138,6 @@ static void pxa2xx_pcmcia_set_irq(void *opaque, int line, int level)
     qemu_set_irq(s->irq, level);
 }
 
-PXA2xxPCMCIAState *pxa2xx_pcmcia_init(MemoryRegion *sysmem,
-                                      hwaddr base)
-{
-    return PXA2XX_PCMCIA(sysbus_create_simple(TYPE_PXA2XX_PCMCIA, base, NULL));
-}
-
 static void pxa2xx_pcmcia_initfn(Object *obj)
 {
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
-- 
2.41.0

