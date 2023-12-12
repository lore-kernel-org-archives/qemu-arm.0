Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1024918ejo;
        Tue, 12 Dec 2023 08:30:32 -0800 (PST)
X-Received: by 2002:a17:907:7251:b0:a02:54fa:4f2f with SMTP id ds17-20020a170907725100b00a0254fa4f2fmr3955392ejc.53.1702398632311;
        Tue, 12 Dec 2023 08:30:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702398632; cv=none;
        d=google.com; s=arc-20160816;
        b=KamHsX10J93lQTIaWDTK3fpq+OgC/2LDikpTtzrl43S1h0LLIkY9djNgFdfzC8nJyD
         NZu3auwpSNny6RJfBPvu5gbRHgwktzBqYIJLPP5z7lQEO+ung5LoeztPMh1tJS3ZHDxm
         Tnz3WAbNg2YWjcM0YZULqvFpIpW1iifbdeWmXJCrgRbAcPOC/qlsBnJA9rzUa+yFFNej
         IIe2dT+m0whuL9xnpF9Zja481YFouJUHjClvCshVlDeP4PZiwBb2+jnqMkj0yh5AUHTW
         PUHxFJNofuKi8MCBGwXWlEpruDghhNHkrG+8arWW8JF9UG7FJ2YrtHNNBJyqtw6hPzZ/
         mrsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ekMLwFEwN8A8wVtLlfYqHUo8mVDJrO6E1RnF8kOlbaw=;
        fh=CkupYgn1Qmdh7jizui9HJgGegpqbRR5NXz1VyjRE1Hs=;
        b=SScXzi0GhrU3fsKVv4ubOBbDMZnaGj138rgCP3fFaCu9lCsdYNvVBxX1f2fK0eTBX3
         +VnuHQSEvU15bMcQ+uGVdQHGAMR+6+uNmTo9duvOEFVWKfBS22NEYFtc+LF5eNb5j8Ih
         eHJaP+Ean5USSYXBPKoGebsMcVC4lxvpopc5JuOK7KzVKpIKWQmCKlW87ioV85447Mj5
         OFLF5DL9tyZBFNr7yQOvkb6v7hfS44HatwwXHbL9raJzZvvCaIKHByIQ2UfYyV+MbDZ4
         xqAxwOGlhEeQEfrclrgAsOrvAh3OWbK07w+2TxULlgMTHeHkv0L7ioEK7FxUFFNMecRt
         oCEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E3kXX6G4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id jy11-20020a170907762b00b00a1dec186ae2sor2591872ejc.16.2023.12.12.08.30.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 08:30:32 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E3kXX6G4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702398632; x=1703003432; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ekMLwFEwN8A8wVtLlfYqHUo8mVDJrO6E1RnF8kOlbaw=;
        b=E3kXX6G4mBdE16gYnLQyYlvw8Ex27FwegQ75n+gPW2Li6eeFPAqNW29+0477ykLxHK
         EhEiy/fh9G7qKCNFI5dQyVqidnxZCVADlnP2j2D7hmNLXcKLtSzSuezCV9Fg9kPuPFBJ
         BKC7wjXVKdT8rJ7SDcSqMolifwD2uldosWMj0NHkokolFMNv2oZOel3X+Erefh7siASf
         VhYiVpMx6D3iqQDxQEv9doDSjsEo8jwd8JqOtD4Ra4/TI5KHlp5G+vTviYTfUKtazRJ/
         XDlPgZ3mavFoj/dQyUIwSiL8wJkxzmxoAbUb8icNsrIYerAet4M+Om+Cdx5V2arj1ttq
         OxZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702398632; x=1703003432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ekMLwFEwN8A8wVtLlfYqHUo8mVDJrO6E1RnF8kOlbaw=;
        b=ihZhYYlSEOZ6A9yBbMdSb6Iknt/B4/UqvbCwspiEEit9iCVjxDOLTKmHkoJOrHXuhI
         Gajaf6VSsabgpzeU4iL6vz7dGMDtXAs/BODjNG85IllgJ5wRpHWIYff19dxapIH+mfiW
         yea2Dq0FuTglYtzSt5/EJo42BghkK5v9NX05MG9JMK+E/vXW14xRYHgJ4JFzaLEBzT0K
         ifRBQu6Rild9+E67mn5FcdDOr0WXOxYkBsqN/Czp5UNjUnHk+EneAWpHru8Ccjh6BZ1P
         xrjzIUZhnT7tnQdGQM9UvE23jwwAe17tr1LA811Iczf3ZB56SADQSV/ENkHmhZ6lN3cN
         4gHA==
X-Gm-Message-State: AOJu0YxQWjFXUIEX+YizCbnVYhCA4FPLsrXXD2SGkx9kWMi+hM4CT9az
	CUxq0vq7En2QTMb6Hp1AtGca8jGV
X-Google-Smtp-Source: AGHT+IFgJq5DvObeP9enEnn11Zs6PcFGrLfXqca1HfwYKoKlFuI1hXrRP+1xuG2m6bHxslTLww5n1Q==
X-Received: by 2002:a17:907:3d8e:b0:a19:a1ba:da4b with SMTP id he14-20020a1709073d8e00b00a19a1bada4bmr4130827ejc.114.1702398632039;
        Tue, 12 Dec 2023 08:30:32 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id vw18-20020a170907059200b00a1712cbddebsm6453045ejb.187.2023.12.12.08.30.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 12 Dec 2023 08:30:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Tyrone Ting <kfting@nuvoton.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Joel Stanley <joel@jms.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Anton Johansson <anjo@rev.ng>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Hao Wu <wuhaotsh@google.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Rob Herring <robh@kernel.org>,
	qemu-arm@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 07/33] hw/cpu/arm: Alias 'num-cpu' property on TYPE_REALVIEW_MPCORE
Date: Tue, 12 Dec 2023 17:29:07 +0100
Message-ID: <20231212162935.42910-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212162935.42910-1-philmd@linaro.org>
References: <20231212162935.42910-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: qM7xvxLFntFu

No need to duplicate and forward the 'num-cpu' property from
TYPE_ARM11MPCORE_PRIV to TYPE_REALVIEW_MPCORE, alias it with
QOM object_property_add_alias().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/cpu/realview_mpcore.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/hw/cpu/realview_mpcore.c b/hw/cpu/realview_mpcore.c
index 72c792eef1..7480b38d1a 100644
--- a/hw/cpu/realview_mpcore.c
+++ b/hw/cpu/realview_mpcore.c
@@ -14,7 +14,6 @@
 #include "hw/cpu/arm11mpcore.h"
 #include "hw/intc/realview_gic.h"
 #include "hw/irq.h"
-#include "hw/qdev-properties.h"
 #include "qom/object.h"
 
 #define TYPE_REALVIEW_MPCORE_RIRQ "realview_mpcore"
@@ -68,7 +67,6 @@ static void realview_mpcore_realize(DeviceState *dev, Error **errp)
     int n;
     int i;
 
-    qdev_prop_set_uint32(priv, "num-cpu", s->num_cpu);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->priv), errp)) {
         return;
     }
@@ -100,6 +98,7 @@ static void mpcore_rirq_init(Object *obj)
     int i;
 
     object_initialize_child(obj, "a11priv", &s->priv, TYPE_ARM11MPCORE_PRIV);
+    object_property_add_alias(obj, "num-cpu", OBJECT(&s->priv), "num-cpu");
     privbusdev = SYS_BUS_DEVICE(&s->priv);
     sysbus_init_mmio(sbd, sysbus_mmio_get_region(privbusdev, 0));
 
@@ -108,17 +107,11 @@ static void mpcore_rirq_init(Object *obj)
     }
 }
 
-static Property mpcore_rirq_properties[] = {
-    DEFINE_PROP_UINT32("num-cpu", mpcore_rirq_state, num_cpu, 1),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
 static void mpcore_rirq_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->realize = realview_mpcore_realize;
-    device_class_set_props(dc, mpcore_rirq_properties);
 }
 
 static const TypeInfo mpcore_rirq_info = {
-- 
2.41.0
