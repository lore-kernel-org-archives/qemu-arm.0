Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp1258535ejs;
        Wed, 10 Jan 2024 11:53:41 -0800 (PST)
X-Received: by 2002:adf:e10e:0:b0:337:774d:7660 with SMTP id t14-20020adfe10e000000b00337774d7660mr358515wrz.65.1704916421149;
        Wed, 10 Jan 2024 11:53:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704916421; cv=none;
        d=google.com; s=arc-20160816;
        b=ggmMLPMQqYMO0NjOZHszjzpcCf2m5fPaXKTdp86B/1MQpZF7sfSoyXrlCp7+u2GvGR
         Z/Gb5jAiWt0XfCVUnHW8TUTcVK3NVXcH0oU2HnaQltho1983aR2EkYvMz55zIFYv0w1R
         qJrheUlmYQ3nrNMzI60A8LeHDD1IXds+VLWz1XBR8D7V9pmyX8yZLdf8msnueJMbhJYR
         dvGIjUpqwBOH79siDo0tcK7az84Hh3Q+zOMPJKl3ulcJTbiVH0wAxVAok+K50id/0f8n
         /n9loIfKD1WN7gX5q0T0/9rTKicQ7+vAUXv+HO2nH4pYx5Tqql3Dx8nndW7fZAsPN0/u
         VYIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=W5YYwF8QpDX8Jtsvrc0+qop9CxJbiTqbmmnqrqDqyeI=;
        fh=0Bn9ysFO5uhdOoEvdDNDnkwY7yFMuDt2XLw3k0zcWt8=;
        b=WKy6Wl/2bxWxZjp9aubbcwUUwi2/oREnT9FQDMrruYBtDQ8lZL1au06vkslxJnaBLq
         Q8jbZNnTnoGfOwS13QdMm7XczwCn7ub7Nstve1XyGkME9sEMkwyVaZGS9iT3dT7V+rg+
         q/6WGkerAfE9U6aHAY7zdaEDWiuDuzgeqDI0zDBMBme3EioWC6q05EIkrYYy/wRHtwDh
         4jT+5cV4hh6MXfbiSTcQwOuXSFyEnZ9wFaXghR7bz0YIY4R9Oikx8iPDGEyeNCQWZhdi
         gz9ZfByGYR6VG980Mc6F3qtV7KJpWlYqdae2nozUdPsCr/nJPXBfCGjF0jxwetsDa1rO
         o4fQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Nz1kNCtE;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j11-20020adfe50b000000b00336669db399sor536429wrm.4.2024.01.10.11.53.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 10 Jan 2024 11:53:41 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Nz1kNCtE;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704916421; x=1705521221; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W5YYwF8QpDX8Jtsvrc0+qop9CxJbiTqbmmnqrqDqyeI=;
        b=Nz1kNCtEg/GC31ZyZUdi58NDiX+zedJwoqzGMQn7a4sjGvdpQ/PQBjcfyTs/i8O0Oz
         udRS2Pki0RbfMiGeuFFAK9cC/fRDprIyX/xWIwf9YQvNOOy732rIQ+56HfU7lV8wDpfY
         V5sPQaoNMjatxxbrIoVsVpFria3IqrV/x35F2pqv9tngk3zJY3MelQxRsG15/lShnGo5
         b2RpGaaWdxdaWye1YgD73oScijv+MhWsw6F7eRFhXtY/fvTfZaUcU20UIFjw6kqrgKNT
         f4EKE8Uh/THvODkIQh5gZyftHwFZGmBpCVvzBz3OngMCqJnIjCFjpJqTbxOxOeJQD1yE
         UjhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704916421; x=1705521221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W5YYwF8QpDX8Jtsvrc0+qop9CxJbiTqbmmnqrqDqyeI=;
        b=KHP01koOLwaW0EWFvrd4+S+GJ9xMCAR52/8m7y/ndmJnBC95CLNk8tpU+Q2nl2E/HK
         kRjLxCDn84HRZKFVRBoqNJVfRiUvrlQViWRvgDgX8BMSA2Zh9dj0IWP/kt5iToaKyzbe
         ArrOl4+MT+QBB2y6AKk4uEuz9PL31IqauRU0grOWsnOmJioa0hsFkJzugJGa+NUW1Tku
         Acsjj1qRd9HI1YbrC4C5mkOwCGYG+f0rTzfd6lqR118CCZ2MdL15Ae++LeuMbOYTcYUs
         axMxCVRdppHetyaZzlBAERVAR9GoRtL4JYtbQW9WMuXaoO8uQMJ5KmFCOtzPAn73O+bW
         lneA==
X-Gm-Message-State: AOJu0YxkIHax/4SHmyVPoBKmI07zF5PB2tDoNMCzBlvJCSV48d3/+4zI
	lblJ1kjB2E5MTD1aLj0Dyj7ZnM1KoitFPHr1
X-Google-Smtp-Source: AGHT+IGxC/nnlqKU3ONI5WNDIBxZz59NGE+y4irL+gMYhAm8f5/ZbCysM0p/xD4AuA5tSqpwOHjIUA==
X-Received: by 2002:a05:600c:3c9c:b0:40d:5d0a:cf4a with SMTP id bg28-20020a05600c3c9c00b0040d5d0acf4amr370282wmb.34.1704916420849;
        Wed, 10 Jan 2024 11:53:40 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (vau06-h02-176-184-43-236.dsl.sta.abo.bbox.fr. [176.184.43.236])
        by smtp.gmail.com with ESMTPSA id jh3-20020a05600ca08300b0040e50d82af5sm3155192wmb.32.2024.01.10.11.53.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 10 Jan 2024 11:53:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	qemu-arm@nongnu.org,
	Kevin Wolf <kwolf@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Rob Herring <robh@kernel.org>,
	Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 01/14] hw/arm/armv7m: Introduce cpudev variable in armv7m_realize()
Date: Wed, 10 Jan 2024 20:53:15 +0100
Message-ID: <20240110195329.3995-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240110195329.3995-1-philmd@linaro.org>
References: <20240110195329.3995-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ggKL/qg/WUAe

We are going to cast s->cpu as DeviceState multiple times.
Add a local 'cpudev' variable to simplify code review, having
a single DEVICE(s->cpu) conversion.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/armv7m.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 50c6c6b1f5..d239468558 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -277,6 +277,7 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
 {
     ARMv7MState *s = ARMV7M(dev);
     SysBusDevice *sbd;
+    DeviceState *cpudev;
     Error *err = NULL;
     int i;
 
@@ -299,6 +300,7 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
         error_propagate(errp, err);
         return;
     }
+    cpudev = DEVICE(s->cpu);
 
     object_property_set_link(OBJECT(s->cpu), "memory", OBJECT(&s->container),
                              &error_abort);
@@ -356,7 +358,7 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
     s->cpu->env.nvic = &s->nvic;
     s->nvic.cpu = s->cpu;
 
-    if (!qdev_realize(DEVICE(s->cpu), NULL, errp)) {
+    if (!qdev_realize(cpudev, NULL, errp)) {
         return;
     }
 
@@ -426,8 +428,7 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
 
     /* Wire the NVIC up to the CPU */
     sbd = SYS_BUS_DEVICE(&s->nvic);
-    sysbus_connect_irq(sbd, 0,
-                       qdev_get_gpio_in(DEVICE(s->cpu), ARM_CPU_IRQ));
+    sysbus_connect_irq(sbd, 0, qdev_get_gpio_in(cpudev, ARM_CPU_IRQ));
 
     memory_region_add_subregion(&s->container, 0xe000e000,
                                 sysbus_mmio_get_region(sbd, 0));
-- 
2.41.0
