Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp552678ejs;
        Tue, 9 Jan 2024 10:09:46 -0800 (PST)
X-Received: by 2002:a7b:ce8e:0:b0:40e:4838:f167 with SMTP id q14-20020a7bce8e000000b0040e4838f167mr1603456wmj.76.1704823786659;
        Tue, 09 Jan 2024 10:09:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704823786; cv=none;
        d=google.com; s=arc-20160816;
        b=wdA7+ns/AOilNuzDomCOdCrOETP4BYphBtpoIzcnN8JIP1Orh7KJdfvdR/KxMQQl6h
         gubjCh/Ep9cy0+Qi3nX4pC4jN/Y3/xPcXfcq1F+OIHOGR9P4zt9KcIu9OCTqy0AEnzHA
         8HurDY5OVjSWsv6jLqIjLfUBqL2IazYXb1g4Q6u+HAkHBLfAtcAhd+sqarqEEDNv5Vvd
         wHjlu10zMJPpD8q4nquDMeahqn5QD4HGCf5GAq8NU7R7vM4bfVBK4y7TSgbfiax4HUMc
         AtIYor6bAh/MV+UnCLIZe7InAuMmRpIk/3BDGfIQh2Vl6lIc0JIY4psyBJO0ETZ3KY+k
         rWmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=W5YYwF8QpDX8Jtsvrc0+qop9CxJbiTqbmmnqrqDqyeI=;
        fh=v69mdd+nxs/0WeTIWzLZOPCx0ynE2o0vtvId2fSwkBY=;
        b=btVCflTIIFOLAxSl8GRKVW16suFCqsZo8akmF20iGFW2ycd6I/WyUPqWUHB1dT3vM6
         NRZQSqVHGeQyazoNlr8xuB1cpcHQ035X0HoObdBSiFjNBYcUoeu3cQtaQpC2X1SXirfr
         Z3jibXSwwI6rYEmTTa6kp/A0cZLRBeEt0hrrLSK0zdrWM89Ri/vqDbAK55sd2kg6mFic
         ClTrtfSOO+M0bGKC1EbqTPbmjQJVBJmSQKEe6y4wmcpPMcE+Ky1xF2UarJipguy5tOtr
         sByAyUBVMTAWVX1D7RyirVVzagxFFJwFIX3rl7f2qaYYRdz9G/uPg04WgPLcR3izF3HL
         4lfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ROEcbQPN;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m39-20020a05600c3b2700b0040d856161bfsor1056019wms.3.2024.01.09.10.09.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Jan 2024 10:09:46 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ROEcbQPN;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704823786; x=1705428586; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W5YYwF8QpDX8Jtsvrc0+qop9CxJbiTqbmmnqrqDqyeI=;
        b=ROEcbQPNDr4pH2lS8DqFDXZXKGliITOWEoRNNCtQVVrlWIaXJeQPpbImc2HTAIHG7f
         K7x+ImU5W4rPD9daVO3mMszGpDmogdEOqysOWVolUNIs7sf+zdpYpJGA0vZEMox1o6ox
         hXJAJ8lxjbwlTAbUGSBeeoAf8RpdsXhH4DxtZHw4jhtsxwiilvVSs7OmJYrEf5qKLY3i
         bQcox/iOOqVhnY/ywmoRyiRvyxhwX5ibwBHeL4MOEgbPcK/xca7pBmFXqkkvq6F483B/
         sKkYOWXo4tNvFsErkQn2e7aSkBFD7fPddH0JsvGZIOZafIGSPWJlKedhcU2ff6SPmUkv
         uDiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704823786; x=1705428586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W5YYwF8QpDX8Jtsvrc0+qop9CxJbiTqbmmnqrqDqyeI=;
        b=l0vDlTUmjOL7M7guChQ7OZ8ey4m5OlAmBPODkMPTmTBceL40BF5JZtisxBqVIUgpzn
         Oim6PEXKUCGvS9XMtbIPBNKNqs0oyC0aqN36uuxRUCdI/GN2rBFZilT1TRK0SqgEK/3q
         AsT3XFtqyHdvQe/oRrr0vSHQBt0NCNsJ9BZcY/EQxH2BBwtepxIAhDOKA3003mNroFIB
         lOabYX72XGN3Q2tWKVSrwZnRXd0hWm8UhCAu+cGyJuu/CwBLAuc7RPYXyEDtU+BerLDE
         jPzSPNZt3J+Aurjf8Bfkc2MKbxIRvsuQ1zE5dT4IEQRLQhbicWXTIvzhQYRxX39jgZRp
         qTEA==
X-Gm-Message-State: AOJu0YyUX3K5SpmdkmJVD3dW4jOcw3xGHaVCZtmwLlm+qEkJ8sEkPBdT
	jv/DKkEFILKMAR+E7JAy9JC5e19Qo8HFNUoI
X-Google-Smtp-Source: AGHT+IFcMy2+PSIqkJXkJOk7zBkIxvTDngWDXIqHtM26yr/0CW5VAufouu0pTj6L7lD/cN8qwlpJHQ==
X-Received: by 2002:a05:600c:5405:b0:40d:87b7:24c7 with SMTP id he5-20020a05600c540500b0040d87b724c7mr2804585wmb.125.1704823786329;
        Tue, 09 Jan 2024 10:09:46 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (rsa59-h02-176-184-32-47.dsl.sta.abo.bbox.fr. [176.184.32.47])
        by smtp.gmail.com with ESMTPSA id x6-20020a5d54c6000000b0033674734a58sm3001364wrv.79.2024.01.09.10.09.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 09 Jan 2024 10:09:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Alistair Francis <alistair@alistair23.me>,
	Peter Maydell <peter.maydell@linaro.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 02/14] hw/arm/armv7m: Introduce cpudev variable in armv7m_realize()
Date: Tue,  9 Jan 2024 19:09:17 +0100
Message-ID: <20240109180930.90793-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240109180930.90793-1-philmd@linaro.org>
References: <20240109180930.90793-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: pls5ZOZ18i5o

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
