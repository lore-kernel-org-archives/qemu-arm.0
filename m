Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1027476ejo;
        Tue, 12 Dec 2023 08:33:31 -0800 (PST)
X-Received: by 2002:a7b:c848:0:b0:40b:5e21:dd2c with SMTP id c8-20020a7bc848000000b0040b5e21dd2cmr3698264wml.90.1702398811670;
        Tue, 12 Dec 2023 08:33:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702398811; cv=none;
        d=google.com; s=arc-20160816;
        b=KstqX2ONgM07SqXF2YeT7adCRBoSIebIM4w7ivzVrlGaGx1tLdd1zJNHoxFGNK7T/O
         Fhwvwi+ED92R/RF5xSoWfaa4XGp2bNdHDCDVpgXm46YnZoeePzYlr3gLLu27wS5di2Uy
         3DYutT5ndNHDfPjRK4RusN0sD2tp+iP4wx628Fe3H7NEh7bLdLX4YlKIEqB1JaM+Tctu
         45VPty9cAKWBsQBLVF4olM0Xv0t4bZxGmflYTGLUQY+a8u3rZO68PULcOJwV4/WuRlO4
         HPkXsOoc9+DszJG7rj/Zl4x1POc2l4+fYQyNKkF2jasedZ+wAIxoQi0O6ebRnPPdyQCq
         N7EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ejOqBltD1xTQKLI2FwnA20wzkl1UqkA3fAXzw/L3kFk=;
        fh=CkupYgn1Qmdh7jizui9HJgGegpqbRR5NXz1VyjRE1Hs=;
        b=pUhJzoNFra8zgycASVk6de3TsINvhMDMSjwwzP/GpTtswhPVHvgPcrQdufdWyIATsC
         HUFkk2VPChXZHuD2QhHL6FT6lTTfFQaiVHf9Eh/4swLhgRqHn12jgwobE70JrXHDujtt
         irRkR7F+8cujNQhlg8EaKoDbOYy63xr1IE3v+HEobx4W4G/SX4cHzQaoHYTaJfORQBXX
         AAdSD4uFngx51tZLAbhJL6tr0WeRsCx35Onk8DuJTXIFKynYqPWPnlk/FZASjmBe+75+
         oWGq1iOgt+b4vxBE+kR6DK4v/JabBz5maUmlAXeTDpqOQUhhK0Ud2SmQjkQExneZJL2w
         2qxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=siRhIvMR;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m3-20020a05600c160300b0040b4275b19csor698947wmn.10.2023.12.12.08.33.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 08:33:31 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=siRhIvMR;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702398811; x=1703003611; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ejOqBltD1xTQKLI2FwnA20wzkl1UqkA3fAXzw/L3kFk=;
        b=siRhIvMR0FgVAskW3qn60kF8dyp+nvp5zW9ZCd4bCsIDWrhAL8AkW8vr11g/QWbnhU
         GKiddyZ5GY0XDCBlb1x6s+lM5dUIwsyTaU2RP1M0EVkh/DqTLPzUMFOPuNmw+fWiNi/T
         1Ql/NJHGAPbReJkGrwX9M3aYkaBdVzWgL9Ym+vlEWx8s3hF9lSlzblNUIUOWsUrs9Y5y
         EJ0tg+YuQJWFaZKQSDwkK4EJ3UNKxVVBagxUkXCdVO7IHXP9zq30QLx+xl8a8xjeNDYw
         9UmDVIe4elZO6JCWB2HBRem1VoJ11Q/jNfG43Kur2X0T4bumsWepLLpQULh0b2hCTE1i
         7L8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702398811; x=1703003611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ejOqBltD1xTQKLI2FwnA20wzkl1UqkA3fAXzw/L3kFk=;
        b=ejQ2Ql8aC34WJ1O4XB2GWfZCB5OzadeAmwzUkSvnwLkw1WP+DQIBQjpcNdNg4drJ6C
         tAtiDiX1nHtn83SrMqPKMpFUd9eBM9LM3Ypjnrmh/5FFGXF6CSaT9bsKNX1fBrKOgRaq
         PsvoG/hnJYdi7AiR/AnyOpz0Ud+sxQkwOck4WW7/11r20l8FF3ks5da1b0Fcq7liT7m+
         F7fd9olswAhrwFeFnYtvNqoXQu1PzB4dT9WCSM2jv1WVh7PuE+8Rf2aaOeBhU+xGbG6X
         dtvxw7Lh1JyNKggYrEuWurBi4CAxhMmmZmcCCs3aP4C9J3Ic5OQLiNkvCYDGE2S3qy9f
         FOMQ==
X-Gm-Message-State: AOJu0YwUizvt24wYoTiEK1zAynjh5vjMa5we9qO5W5TlgTgpku3huqVT
	Kngc7qeiT5BZRnZ7oIXdnstsHgGy
X-Google-Smtp-Source: AGHT+IHgkWlki8ql5EojYFYDQS9C+91RboiBl8Qb2//hW6OcAIW62feJ7Uh7gtJVyNUa844MjFzDFQ==
X-Received: by 2002:a05:600c:3411:b0:40b:5e59:ccb2 with SMTP id y17-20020a05600c341100b0040b5e59ccb2mr3422703wmp.147.1702398811326;
        Tue, 12 Dec 2023 08:33:31 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id k40-20020a05600c1ca800b0040b45356b72sm19317706wms.33.2023.12.12.08.33.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 12 Dec 2023 08:33:31 -0800 (PST)
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
Subject: [PATCH 32/33] hw/cpu/arm: Remove 'num-cpu' property alias
Date: Tue, 12 Dec 2023 17:29:32 +0100
Message-ID: <20231212162935.42910-33-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212162935.42910-1-philmd@linaro.org>
References: <20231212162935.42910-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: gZUDhtpUxm+e

All callers access the 'num-cores' property.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Better to squash earlier and replace in place, so no need for alias?
---
 hw/cpu/arm11mpcore.c     | 1 -
 hw/cpu/cortex_mpcore.c   | 2 --
 hw/cpu/realview_mpcore.c | 1 -
 3 files changed, 4 deletions(-)

diff --git a/hw/cpu/arm11mpcore.c b/hw/cpu/arm11mpcore.c
index 67c96a3a7c..32756e05e9 100644
--- a/hw/cpu/arm11mpcore.c
+++ b/hw/cpu/arm11mpcore.c
@@ -133,7 +133,6 @@ static void mpcore_priv_initfn(Object *obj)
 
 static Property mpcore_priv_properties[] = {
     DEFINE_PROP_UINT32("num-cores", ARM11MPCorePriveState, num_cpu, 1),
-    DEFINE_PROP_UINT32("num-cpu", ARM11MPCorePriveState, num_cpu, 1), /* alias */
     /* The ARM11 MPCORE TRM says the on-chip controller may have
      * anything from 0 to 224 external interrupt IRQ lines (with another
      * 32 internal). We default to 32+32, which is the number provided by
diff --git a/hw/cpu/cortex_mpcore.c b/hw/cpu/cortex_mpcore.c
index c5de6c3ae4..3cc9feef16 100644
--- a/hw/cpu/cortex_mpcore.c
+++ b/hw/cpu/cortex_mpcore.c
@@ -156,7 +156,6 @@ static void cortex_mpcore_priv_realize(DeviceState *dev, Error **errp)
 static Property cortex_mpcore_priv_properties[] = {
     DEFINE_PROP_UINT8("cluster-id", CortexMPPrivState, cluster_id, 0),
     DEFINE_PROP_UINT32("num-cores", CortexMPPrivState, num_cores, 1),
-    DEFINE_PROP_UINT32("num-cpu", CortexMPPrivState, num_cores, 1), /* alias */
 
     DEFINE_PROP_STRING("cpu-type", CortexMPPrivState, cpu_type),
     DEFINE_PROP_BOOL("cpu-has-el3", CortexMPPrivState, cpu_has_el3, true),
@@ -175,7 +174,6 @@ static Property cortex_mpcore_priv_properties[] = {
                      TYPE_MEMORY_REGION, MemoryRegion *),
 
     DEFINE_PROP_UINT32("gic-spi-num", CortexMPPrivState, gic_spi_num, 0),
-    DEFINE_PROP_UINT32("num-irq", CortexMPPrivState, gic_spi_num, 0), /* alias */
 
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/hw/cpu/realview_mpcore.c b/hw/cpu/realview_mpcore.c
index e985d230e0..4d4965126b 100644
--- a/hw/cpu/realview_mpcore.c
+++ b/hw/cpu/realview_mpcore.c
@@ -99,7 +99,6 @@ static void mpcore_rirq_init(Object *obj)
 
     object_initialize_child(obj, "a11priv", &s->priv, TYPE_ARM11MPCORE_PRIV);
     object_property_add_alias(obj, "num-cores", OBJECT(&s->priv), "num-cores");
-    object_property_add_alias(obj, "num-cpu", OBJECT(&s->priv), "num-cores");
     privbusdev = SYS_BUS_DEVICE(&s->priv);
     sysbus_init_mmio(sbd, sysbus_mmio_get_region(privbusdev, 0));
 
-- 
2.41.0
