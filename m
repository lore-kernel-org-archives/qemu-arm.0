Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1025327ejo;
        Tue, 12 Dec 2023 08:31:01 -0800 (PST)
X-Received: by 2002:a17:906:7e16:b0:a19:a19b:4222 with SMTP id e22-20020a1709067e1600b00a19a19b4222mr1876384ejr.141.1702398661119;
        Tue, 12 Dec 2023 08:31:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702398661; cv=none;
        d=google.com; s=arc-20160816;
        b=f0LXtoqWp4qdjbZA2yDz24xg0wPpRa4MogpAWRhbjLuW481ym2Ot39Fjqx7njbXkdK
         yLR3v/JimFEkquIdGNOYsLzNIEdZBv8WhV24N0yu+S9xJUc0V6tofUkRryKvb6BOBHUb
         5xsVV1wMaR4bJyu3CwApR5+wFw6XnKvoIepBcjTgqbIsZsdKIyhm8loGDOpRyp3p2jAt
         NjxvNkRlDIWbGGsi/mGBEV6ZvDBkIUAmkB1irSvBxwKYlgpOOvg7OMeFDxVha1A9Q/Ja
         SLUnM0j6nyj/zk/TRSVSsIC4mMqr2uS+fFeuejMwVHDFs8WRYJklCviaSImSI19UyJBs
         rsqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=suvN+YJQ4ci7BcP7cxgDGLkeAASL5qV684+uLcglZPc=;
        fh=CkupYgn1Qmdh7jizui9HJgGegpqbRR5NXz1VyjRE1Hs=;
        b=lsD9RCvoc2d3FSoaNzm560MAq8psqvmE7ZGXL8KOG8Xv2QAFPpGzl3AWfxKmz2aRIW
         dv7GZt8TIEeF2FQV38L7Ylpt+8tMSrV0tPj2nALDqPW7u6b80KdPZ0wHvbfn6rYijScP
         eNWgE0vxkOFxTGkUbHou0sSfn5hLqix/ViL26odQdT4Ma2jjjCSdGt5ar3ubiLCmlV31
         zglGXSdlpA6fKznBfBgAOTXdDrM4yprJEfgkL6FkA7HpBmNNwWVCO9+KgzQy6YHiYECB
         gJP82JftgoL16qHt0sxXV4nk4XzAYYsVMvoJo1YLFLX1HnhpfVI76uEauaQJAzgGEHw+
         A/Pg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IMPY5qhT;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id jz22-20020a17090775f600b00a1f70f6a439sor2053888ejc.8.2023.12.12.08.31.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 08:31:01 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IMPY5qhT;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702398661; x=1703003461; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=suvN+YJQ4ci7BcP7cxgDGLkeAASL5qV684+uLcglZPc=;
        b=IMPY5qhTOCKSJKueFDmbCUf89fdnL3OhZ5sQ0BS+nCRJFak9QMwUB69iUdO5DvqT+d
         BG1FSlcqS4vgeLdFGnEhfSa1mrjs+Kr+A4uMsEWbcX3fcKRzoMvCfl0a1Lq5VoGRmC0F
         OSuPcI/P6oOPbV0QB+IGBg12fo9h2t/BSPz7CvdOrohMkGOke6GGD5gGz7zpzkOeduyq
         7VQppRgFu5M1PxUUE/FWBRHQH76+Fm6+fOk7FjC30OyYqRyneZST0uB+Cy3ZpQtmktn9
         lJEyq+DiHW2flM5qXzo+87pkZqXLL/7XcugrmVJ0JRy82e1u+RyXAsmgQ4282L8FzRH+
         dsfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702398661; x=1703003461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=suvN+YJQ4ci7BcP7cxgDGLkeAASL5qV684+uLcglZPc=;
        b=t32ONWRm/Oms1f0wu6L1NP5oiOnpgD9wYI4I7FtI8dZoDyFoEJgpRpKq1qoJtfGpdt
         AU/JkGkGbpkQUL8aYZVTqPYis/Y+KHuulFq8WCdRaKClcGFX1dZrym4Y3z9t5g2QmNjP
         H+CDzib9SwGvgtQQHMiFg2D8mXq8x6WFcJuxz9KHgn2/lzkF8oXqm1DqFxWNTS+UYpMj
         aPDchsZ4xX0zEWrzezl3YgO/IZm4csBQHBBUSiEuqlMGLsiXwmfEfafsgqyB/OCb+1iN
         UzYsxS4Y9Dwtp/R4tqC07qpcvMCfG4YMH7BuGKAvYqFuxa6adjGQcjl4sDg07CEKc91k
         +tIA==
X-Gm-Message-State: AOJu0YykpzaoEWnMBfmw+gRkpH6ijHOFrwRxxCziwwxigTD1plIWydnK
	E2HcdhclfWP91Yn2ZkliTgILgInB
X-Google-Smtp-Source: AGHT+IHmBDaDXhDW4r1hPO1YrXSbvBvxkh74Jkp/r8xWGBdiM2yuCIjHrNpddidSrj2M6FPxqtpzxg==
X-Received: by 2002:a17:906:51c7:b0:a1b:70fb:4517 with SMTP id v7-20020a17090651c700b00a1b70fb4517mr2121788ejk.151.1702398660769;
        Tue, 12 Dec 2023 08:31:00 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id uh17-20020a170906b39100b00a1d5063b01csm6482417ejc.190.2023.12.12.08.30.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 12 Dec 2023 08:31:00 -0800 (PST)
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
Subject: [PATCH 11/33] hw/cpu/arm: Have A9MPCORE/A15MPCORE inheritate common CORTEX_MPCORE_PRIV
Date: Tue, 12 Dec 2023 17:29:11 +0100
Message-ID: <20231212162935.42910-12-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212162935.42910-1-philmd@linaro.org>
References: <20231212162935.42910-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: WTFTLMz8lhyo

TYPE_CORTEX_MPCORE_PRIV becomes the common parent to
TYPE_A9MPCORE_PRIV and TYPE_A15MPCORE_PRIV.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/cpu/cortex_mpcore.h |  6 ++++--
 hw/cpu/a15mpcore.c             | 14 ++++++++++++--
 hw/cpu/a9mpcore.c              | 13 +++++++++++--
 hw/arm/Kconfig                 |  2 ++
 4 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/include/hw/cpu/cortex_mpcore.h b/include/hw/cpu/cortex_mpcore.h
index c5dd7200d0..4084c6003a 100644
--- a/include/hw/cpu/cortex_mpcore.h
+++ b/include/hw/cpu/cortex_mpcore.h
@@ -32,6 +32,8 @@ OBJECT_DECLARE_TYPE(CortexMPPrivState, CortexMPPrivClass, CORTEX_MPCORE_PRIV)
 
 struct CortexMPPrivClass {
     SysBusDeviceClass parent_class;
+
+    DeviceRealize parent_realize;
 };
 
 struct CortexMPPrivState {
@@ -42,7 +44,7 @@ struct CortexMPPrivState {
 OBJECT_DECLARE_SIMPLE_TYPE(A9MPPrivState, A9MPCORE_PRIV)
 
 struct A9MPPrivState {
-    SysBusDevice parent_obj;
+    CortexMPPrivState parent_obj;
 
     uint32_t num_cpu;
     MemoryRegion container;
@@ -59,7 +61,7 @@ struct A9MPPrivState {
 OBJECT_DECLARE_SIMPLE_TYPE(A15MPPrivState, A15MPCORE_PRIV)
 
 struct A15MPPrivState {
-    SysBusDevice parent_obj;
+    CortexMPPrivState parent_obj;
 
     uint32_t num_cpu;
     uint32_t num_irq;
diff --git a/hw/cpu/a15mpcore.c b/hw/cpu/a15mpcore.c
index 0f56c40b86..5a57145179 100644
--- a/hw/cpu/a15mpcore.c
+++ b/hw/cpu/a15mpcore.c
@@ -48,15 +48,23 @@ static void a15mp_priv_initfn(Object *obj)
 
 static void a15mp_priv_realize(DeviceState *dev, Error **errp)
 {
+    CortexMPPrivClass *cc = CORTEX_MPCORE_PRIV_GET_CLASS(dev);
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
     A15MPPrivState *s = A15MPCORE_PRIV(dev);
     DeviceState *gicdev;
     SysBusDevice *gicsbd;
+    Error *local_err = NULL;
     int i;
     bool has_el3;
     bool has_el2 = false;
     Object *cpuobj;
 
+    cc->parent_realize(dev, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
     gicdev = DEVICE(&s->gic);
     qdev_prop_set_uint32(gicdev, "num-cpu", s->num_cpu);
     qdev_prop_set_uint32(gicdev, "num-irq", s->num_irq);
@@ -158,8 +166,10 @@ static Property a15mp_priv_properties[] = {
 static void a15mp_priv_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    CortexMPPrivClass *cc = CORTEX_MPCORE_PRIV_CLASS(klass);
 
-    dc->realize = a15mp_priv_realize;
+    device_class_set_parent_realize(dc, a15mp_priv_realize,
+                                    &cc->parent_realize);
     device_class_set_props(dc, a15mp_priv_properties);
     /* We currently have no saveable state */
 }
@@ -167,7 +177,7 @@ static void a15mp_priv_class_init(ObjectClass *klass, void *data)
 static const TypeInfo a15mp_types[] = {
     {
         .name           = TYPE_A15MPCORE_PRIV,
-        .parent         = TYPE_SYS_BUS_DEVICE,
+        .parent         = TYPE_CORTEX_MPCORE_PRIV,
         .instance_size  = sizeof(A15MPPrivState),
         .instance_init  = a15mp_priv_initfn,
         .class_init     = a15mp_priv_class_init,
diff --git a/hw/cpu/a9mpcore.c b/hw/cpu/a9mpcore.c
index e9cd71e92f..d59e49126b 100644
--- a/hw/cpu/a9mpcore.c
+++ b/hw/cpu/a9mpcore.c
@@ -46,11 +46,13 @@ static void a9mp_priv_initfn(Object *obj)
 
 static void a9mp_priv_realize(DeviceState *dev, Error **errp)
 {
+    CortexMPPrivClass *cc = CORTEX_MPCORE_PRIV_GET_CLASS(dev);
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
     A9MPPrivState *s = A9MPCORE_PRIV(dev);
     DeviceState *scudev, *gicdev, *gtimerdev, *mptimerdev, *wdtdev;
     SysBusDevice *scubusdev, *gicbusdev, *gtimerbusdev, *mptimerbusdev,
                  *wdtbusdev;
+    Error *local_err = NULL;
     int i;
     bool has_el3;
     CPUState *cpu0;
@@ -65,6 +67,12 @@ static void a9mp_priv_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    cc->parent_realize(dev, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
     scudev = DEVICE(&s->scu);
     qdev_prop_set_uint32(scudev, "num-cpu", s->num_cpu);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->scu), errp)) {
@@ -173,15 +181,16 @@ static Property a9mp_priv_properties[] = {
 static void a9mp_priv_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    CortexMPPrivClass *cc = CORTEX_MPCORE_PRIV_CLASS(klass);
 
-    dc->realize = a9mp_priv_realize;
+    device_class_set_parent_realize(dc, a9mp_priv_realize, &cc->parent_realize);
     device_class_set_props(dc, a9mp_priv_properties);
 }
 
 static const TypeInfo a9mp_types[] = {
     {
         .name           = TYPE_A9MPCORE_PRIV,
-        .parent         = TYPE_SYS_BUS_DEVICE,
+        .parent         = TYPE_CORTEX_MPCORE_PRIV,
         .instance_size  =  sizeof(A9MPPrivState),
         .instance_init  = a9mp_priv_initfn,
         .class_init     = a9mp_priv_class_init,
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 3040342fcb..ec6e585797 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -648,6 +648,7 @@ config CORTEX_MPCORE
 
 config A9MPCORE
     bool
+    select CORTEX_MPCORE
     select A9_GTIMER
     select A9SCU       # snoop control unit
     select ARM_GIC
@@ -655,6 +656,7 @@ config A9MPCORE
 
 config A15MPCORE
     bool
+    select CORTEX_MPCORE
     select ARM_GIC
 
 config ARM11MPCORE
-- 
2.41.0
