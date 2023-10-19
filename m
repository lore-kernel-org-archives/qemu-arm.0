Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp502649ejb;
        Thu, 19 Oct 2023 06:10:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZpXcu48d+eFsufDTHNbmY534b7KpXV9eOgqHm7xGLtuzTwA+uOKxDO1B+BfB6VBRNvW8E
X-Received: by 2002:a05:6000:1375:b0:32d:9a17:2a70 with SMTP id q21-20020a056000137500b0032d9a172a70mr1580540wrz.68.1697721036800;
        Thu, 19 Oct 2023 06:10:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697721036; cv=none;
        d=google.com; s=arc-20160816;
        b=RS1ljkxmDCEfmBAlLi46JNDb+qdqq1VUXrYiEv1BOitRttIAKjJqvsbn/dC8hddrug
         67/Tbq2AlEwtPdbiUW6EoH7n6MWkZ/0eKGMPiylyzyQzXaG+TKNTxjwNQVLPrfyLf1A3
         GcDFQ2ij6zbk9kDjOfHmxNhOxlKxVMZaaVKdq3CoWsIKocWDmvSQxgoR6uaP+g4mIrgn
         emWibqB95gjIbyWI0SuDE0pCvXCE++q26dqJcJscu5H12+HaoHOE+rLrAJ3tqF8SKgL7
         RTtH00wttX9BJZMhZYFLUhsQgkr4N1fHFio6KR/+pIl6OS6vjF/ZC3K5Fh7UD8k1sTRy
         /PAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WuH7XtOKs5G9Ns2H+BnAt+HjsoiLIzrJP7Sikrea0Vo=;
        fh=rYBZhAJdgCvxZRRcO2tKw9iXjHkAG8ZfVdmqU/2KeAE=;
        b=MVIdNKEVxiw9dErjj7tzNAxmVCW2xoJIIUgrwg7DzUmubjOOeDSU0msRTkKDi3tokB
         DG+Bdvd8AjjIoOimmlxVdp111GbiAiKCTCceRLhOYKfnYcEvcOiu7US9Mc8QlyuojYBC
         fM3vLUbC9lOCYgXuy4FeWvXMg3C97spZUk732qBmRfs9huO1Qa1/dP0kS0YqD6rycvX1
         kYwyGoPlN4qxMK05f6DbP5+tzUGEvZSJy2HeHk/FiuHlbkL8XhoCUj9jXxAXNXS8b9Rj
         eAZUt4eZ6sU1rBkkPSdG9rC/nbKFICrFIhfT/IwtM2nqo8FZn5D9W+4Kl3N9JznTJ7gg
         A00w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i92aIzOU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x5-20020adfdd85000000b0032d81859527si2524046wrl.842.2023.10.19.06.10.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 06:10:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i92aIzOU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtSmh-0004Rm-Iq; Thu, 19 Oct 2023 09:09:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtSmR-0004M9-1l
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 09:09:47 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtSmO-0007Ci-Sc
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 09:09:38 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-406609df1a6so72830825e9.3
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 06:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697720974; x=1698325774; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WuH7XtOKs5G9Ns2H+BnAt+HjsoiLIzrJP7Sikrea0Vo=;
 b=i92aIzOUdayOZ6agwNL5c/JOzhuUpczsum+3ccFhwjCw7yhD5w3NoB3EuG8SQNvuCs
 rQOGKXYmUBaoS7hkozxUD5KLB4HLTI837EctSTMVUE5VbVHKpvO1QYcKKx/hpEpaqqyo
 edvg095qMpRhc3jbPMyhBz9RdPUPxYu9yUJVltu0m7Fz6UNCFyDUKN19M8RoMSPsVtqt
 kw6Zwd7Q5pEwDzu6NWukXQejItc0qS/vJWh2RiXXNjCd9OikwnWxRHVcMKvQ6mM/kcoM
 EB6eq5miedZM7319qkIExGlaN3JtKB0/BuMQEPyfxdIMu35MvCerQaHzbQ1OxPYgrpro
 iaTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697720974; x=1698325774;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WuH7XtOKs5G9Ns2H+BnAt+HjsoiLIzrJP7Sikrea0Vo=;
 b=d7YZPiuHp/bqKk3/49bBppKEbgEhor4XFyGkdvr3rtILO/ltFoBpKwOeWMyegHClz2
 3Byv38RMyeBqfMEooHx0exX/8lycxO05MbfbNw0FII2fgiKV7NI+npt7dN66asEkjoeL
 C7eqif0HIH4FTTkvqRN+N0mwVYJMCIkCkxcQpXJ3zNlYKpiX8BUhROMRy9fIx9/sgF3e
 ts8bgtx/HMu2wKbUVDSzDUxwR1git6nmxAkogezgpe6pSj/aNh7WNfrpLtiAPEWYvS4o
 l1RYYNZhQhCwnbZJ35aLEuUIvFXI7xZ5D9fRpLCN+amNZeeswjRuczbiu5UNa4OSaHuO
 pJTw==
X-Gm-Message-State: AOJu0YxtlZEViBB3iBymapTE+EST9YLADJjcjAR15tavnS8PzAlR06ll
 SoaGHNPVwGxroVvZ/Wk+XWWYdoFkTqrG5bIj52PjJQ==
X-Received: by 2002:a05:600c:4588:b0:3fb:a102:6d7a with SMTP id
 r8-20020a05600c458800b003fba1026d7amr1762628wmo.28.1697720973980; 
 Thu, 19 Oct 2023 06:09:33 -0700 (PDT)
Received: from m1x-phil.lan (176-131-216-177.abo.bbox.fr. [176.131.216.177])
 by smtp.gmail.com with ESMTPSA id
 17-20020a05600c231100b00401d8181f8bsm4373980wmo.25.2023.10.19.06.09.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Oct 2023 06:09:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 1/9] hw/sd/pxa2xx: Realize sysbus device before accessing it
Date: Thu, 19 Oct 2023 15:09:16 +0200
Message-ID: <20231019130925.18744-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019130925.18744-1-philmd@linaro.org>
References: <20231019130925.18744-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
X-TUID: u0CJBeMVFI2U

sysbus_mmio_map() and sysbus_connect_irq() should not be
called on unrealized device.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/sd/pxa2xx_mmci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/sd/pxa2xx_mmci.c b/hw/sd/pxa2xx_mmci.c
index 124fbf8bbd..9f7a880bac 100644
--- a/hw/sd/pxa2xx_mmci.c
+++ b/hw/sd/pxa2xx_mmci.c
@@ -483,11 +483,11 @@ PXA2xxMMCIState *pxa2xx_mmci_init(MemoryRegion *sysmem,
 
     dev = qdev_new(TYPE_PXA2XX_MMCI);
     sbd = SYS_BUS_DEVICE(dev);
+    sysbus_realize_and_unref(sbd, &error_fatal);
     sysbus_mmio_map(sbd, 0, base);
     sysbus_connect_irq(sbd, 0, irq);
     qdev_connect_gpio_out_named(dev, "rx-dma", 0, rx_dma);
     qdev_connect_gpio_out_named(dev, "tx-dma", 0, tx_dma);
-    sysbus_realize_and_unref(sbd, &error_fatal);
 
     return PXA2XX_MMCI(dev);
 }
-- 
2.41.0

