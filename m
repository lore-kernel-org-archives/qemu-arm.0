Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1205708ejb;
        Fri, 20 Oct 2023 06:05:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVZQfdX2UKAPd5VMg8ncvVfju/gZ3Jfj1Q0picLqC7ogvzEgVjK+xXxRR6HK/O/1AM5JNT
X-Received: by 2002:a05:6214:cca:b0:66d:2d07:eab4 with SMTP id 10-20020a0562140cca00b0066d2d07eab4mr2279685qvx.42.1697807110803;
        Fri, 20 Oct 2023 06:05:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697807110; cv=none;
        d=google.com; s=arc-20160816;
        b=CBS/08tIlpLf6/Hzt5emMmbxLwMUr4JXCWdnwoj5dFVVSlN1D6bbMWprukAFzBvetC
         XrkYiCdNdzcBLoKS8/8xXxL9oXddy0Z8gLLJu2uBrF4JGY3YYe8woU1Z9Cl2v0ze6HMg
         W69kYV3mPlerT1lk3yf+11Y/isNx3nu4DxyEcpXUDp+83xpiebTY99gnRQUCYbhIygvC
         P0FVJveR7aWlBS7el5jPKGLQ3bMALGmzMhd70ULpO29rvfNNWv7toZa9Ihh1L0+cpSXn
         LEx15m4ATxCd56GJUVjygq4wOgACC/EjTL8UBTmCEEZoRDZxjwFQ2q3vAygUV8Srxguc
         8r/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=UmDbO/dcRUqE0czIvHJsu49pLqguapp9vtFtJrgXUPM=;
        fh=QWGggua+3ufs1S3QlzhTWcDhlhc7bBCtXi/Y+/UuB8A=;
        b=ls9LbJqd82lhqtUBr52qR1S8ZILzNBNP2L31qQ1JkURVucv/x7mC00UcRAu9S0qixi
         Pbwc1zyczlgA4ga4z5sS0kRSlDPVLGJq5bkMXoFEgGg6D3t3wFFYMwXjmFEfTom13cqD
         Pbqr7dFpzGBNXE7XztjUKnx3rbq3mZUDxHlTP7ZHU3E90Hm0LhCSydnQXD+LAQhXVtuk
         ucua97CYVoEtgIgNCnACkisUmMtN3A8EMB6EYq0d9Ji+heYF2RwHRW8vhQbKXN7+UQ46
         6BMgFErLAOOKZ0eulJoDScC8MLo3ZzQdA/rRP1zhDztdOnOv4D4VyvGhgiMDuiKfFYy3
         edYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k2lBeoG9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c19-20020a05622a025300b004123092feb6si1252151qtx.340.2023.10.20.06.05.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Oct 2023 06:05:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k2lBeoG9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtpBU-0002Ti-U8; Fri, 20 Oct 2023 09:05:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtpAt-0001DW-E0
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 09:04:23 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtpAb-0005Ko-No
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 09:04:23 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-53e70b0a218so1151714a12.2
 for <qemu-arm@nongnu.org>; Fri, 20 Oct 2023 06:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697807044; x=1698411844; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UmDbO/dcRUqE0czIvHJsu49pLqguapp9vtFtJrgXUPM=;
 b=k2lBeoG910M0jYNxBlYsd7Xo0RPA2TJGgHN3ZlfloV6jh/xDTxeMGa2YqPRv/158s/
 fkxGTHNDeIPI0wbJ0YL5mCQFLJCMSTo2casywlQ6NMiHylMGG92KmbX9bZwL6BFJJN2j
 SnvYRe6c4t2kBaRF8lQ33DIXL/mcXGfp20GkrVHhBd1snEMFRk3THD4A35k2zDH/MAXz
 nLKAYM4zVUr+GfnLo6CvbshYeLlMAG7bz3U4K1U3D+2NzjbweuNM9GbCxVfKMJfE+nTW
 Q7e9+wRkMh36Ed68T0l9bBhs6uayqyDNJ5q5JBBSBY8WFCQdsOuBMrqwqQFal11BrQXR
 Pihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697807044; x=1698411844;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UmDbO/dcRUqE0czIvHJsu49pLqguapp9vtFtJrgXUPM=;
 b=EurOml9uOWOMRd+DSaOyS9q7Ogij+e/z6SBxPZ9Mla92ll2vviSceYXzgv30txnO/v
 apX10DnWrZTLZ8f8b9oCyWvK9WedmmtClP1CYGtzlvtYuS8X67u+updgcgXm53jQrOF9
 8SS+wiQAbY35Z2Y5HbUQiRay5TtPjdaQ3SyhPOcGjgSGjvwsai961QGZwgT3ZURuNh4U
 aEte10Uw0fScLOGEJ9pbE+yA9qn0eE4kEBIKjYS1huCl0nmz4TGSWL5kyDn3LHnKIHAO
 FC+/C/Jaw1cOgE9pUqurbRW12ldTK5C05/u1An/MZXbpuvdn4DmtdvjM4xtiO3AdxWKC
 h/Jw==
X-Gm-Message-State: AOJu0YxgxZYKoc8EPNgW93MLNSM2mjKsv2pxYaaehXIJcEBZjjjbd2ON
 Ia6Zu8mQTb5yI1f/CPzZCx9N6Q==
X-Received: by 2002:a50:9ecb:0:b0:53e:f9ef:ca6b with SMTP id
 a69-20020a509ecb000000b0053ef9efca6bmr1462884edf.7.1697807044042; 
 Fri, 20 Oct 2023 06:04:04 -0700 (PDT)
Received: from m1x-phil.lan (tbo33-h01-176-171-212-97.dsl.sta.abo.bbox.fr.
 [176.171.212.97]) by smtp.gmail.com with ESMTPSA id
 q28-20020a50cc9c000000b0053f84540db8sm1449027edi.17.2023.10.20.06.04.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Oct 2023 06:04:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 5/9] hw/pcmcia/pxa2xx: Inline pxa2xx_pcmcia_init()
Date: Fri, 20 Oct 2023 15:03:26 +0200
Message-ID: <20231020130331.50048-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020130331.50048-1-philmd@linaro.org>
References: <20231020130331.50048-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: WY+rqiqQqY3G

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/pxa.h |  2 --
 hw/arm/pxa2xx.c      | 12 ++++++++----
 hw/pcmcia/pxa2xx.c   | 10 ----------
 3 files changed, 8 insertions(+), 16 deletions(-)

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
index 3d512a292c..e3111fdf1a 100644
--- a/hw/pcmcia/pxa2xx.c
+++ b/hw/pcmcia/pxa2xx.c
@@ -138,16 +138,6 @@ static void pxa2xx_pcmcia_set_irq(void *opaque, int line, int level)
     qemu_set_irq(s->irq, level);
 }
 
-PXA2xxPCMCIAState *pxa2xx_pcmcia_init(MemoryRegion *sysmem,
-                                      hwaddr base)
-{
-    DeviceState *dev;
-
-    dev = sysbus_create_simple(TYPE_PXA2XX_PCMCIA, base, NULL);
-
-    return PXA2XX_PCMCIA(dev);
-}
-
 static void pxa2xx_pcmcia_initfn(Object *obj)
 {
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
-- 
2.41.0

