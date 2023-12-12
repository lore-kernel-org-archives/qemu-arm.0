Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1027073ejo;
        Tue, 12 Dec 2023 08:33:03 -0800 (PST)
X-Received: by 2002:a7b:c44f:0:b0:40c:330f:f300 with SMTP id l15-20020a7bc44f000000b0040c330ff300mr1353173wmi.331.1702398783385;
        Tue, 12 Dec 2023 08:33:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702398783; cv=none;
        d=google.com; s=arc-20160816;
        b=Yu0h11z4D1wdh78mJVZW3+KEzSInRY7RbN0BC3UOJEYMprmAaxaF+/PuzbT1K6DqGl
         aMQxhHAOp/B/uiLz67dXw+lBXXtlAnAPBix0/v0I/Nu2/2AukMj4KDKJme7TQ2oVGBly
         2+ABBHenpKv4neQOBKlk41GNImFxeUFDUlobx09WRbIFrKd9Nq213pJN21ZGTy8LP8fi
         XXSTVl7w2CIRhAWObWTm7JzzBvBS1NAXxptozFACB7TLCnNYKnQ5uOC7oC3G0lhbvjnQ
         7kUdrDeH6rFVJSTSLpJmZoCzKuzBBe5MXj//CgQ5pqLnXOdiSYPErgnljtNJNAdDTzOv
         uMmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=HtRA1ZcQFW7z3eKOx2yAyRkVJ7SlDZA04aMcZUs1m4I=;
        fh=CkupYgn1Qmdh7jizui9HJgGegpqbRR5NXz1VyjRE1Hs=;
        b=XEZ8arZdXfY8HouDyKQPSc5iSdMKlAiFqRQJEsTogDFrYExDsqpXuVuh81YLAwuUnc
         O8E/jT0J9IYnufs+XbzEUeR160opsqY62ebCFGGxF9h+F7u91XcOBX3XoCYZdbrsIP8x
         qzrq7fZY9mTkL+sHF8S2J+jucaNMID7nRr3pteyTaPsqs/2YRfqXocNc7XC3M9vB3GbR
         ux2jb3SJgf7sjZOi5LcCd/Q+oBX0GYCC6AA30mvMCSVJMqXSEzNzPBpM1A1bYIyMsg0D
         jJCN4BZLA+X9dKk7CqeprgZJgNRUWxQbXzPRSpYU9KhQga+LbOcMxVwvQfM6ZSo04MdZ
         VpYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mwJF4EFO;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o10-20020a05600c164a00b0040b38f206aasor2178090wmn.13.2023.12.12.08.33.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 08:33:03 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mwJF4EFO;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702398783; x=1703003583; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HtRA1ZcQFW7z3eKOx2yAyRkVJ7SlDZA04aMcZUs1m4I=;
        b=mwJF4EFOhpn2VFivgsHz6xNk24hQkDZloSVaq9nEjzPAbJeaTRucE2x1bqNnMIQOXJ
         hZttFqONcCr6Y7gN6qGvnPmG/4pm+q68iMEHVA7GpoEmbp0plKT9BCS4TRdJSi7Q1aJJ
         cjPknSK76n7mRw1X7Xd1wjH12gfs2XOT8SQpiz9/kgpmFDFsVurlNk2YOPOnU0gI5lyr
         9//GGl/9kTUvN4rLQQQ9cTINnyqd03mlUJQgmB8K6mZnN8Qcl/Ct+a1WpmsATKiszNF5
         4RXX+dC2ZlCA+mwjSnkBFAX7Lvd2vZKSzxprUPCYYMPqxSludo7G/9uFgCCiG1A8xmJw
         xQnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702398783; x=1703003583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HtRA1ZcQFW7z3eKOx2yAyRkVJ7SlDZA04aMcZUs1m4I=;
        b=fJVPu+DJZh4u80qjH66SnaxRqL6uUMoJZpJAZuSV5PQOngrlTds2MYakxxQTnApI7e
         Wdjmzlmwq8aZPPyNlQ5ftQUivukh3C/lvbRi4Fes6BsvfLU3Uvd7zobiljKLckx05gcm
         eh/mucxO8ty4+OUm4zX1U/rKdHFP3mhObey43wP02Xw0fYfK31dhrp+uHRraH05xjJZ6
         57qJEtHOHMSNEV3qbKvF66F96C5WqB07dAvYknadCuBt0L+QGhS7+4HkwaSiUPjxpirK
         3lCyeLf8YtS7VTb4wG7/jYG7iAEbI5nzOjWvTdepoW06CavdSCRKHIBSjId7chM8BJjb
         ooPg==
X-Gm-Message-State: AOJu0Yxrdq0TNkENFQPbdFw7ANH2MC27aEKPU1fY1TOEZCfS7bGfKNIZ
	N8iE/CHuZwXAH2I/1b0SxxFHMssucsixGVF/TC89yA==
X-Google-Smtp-Source: AGHT+IHmB1gMHyfBTapoK6ubgT1kUI5aeRYDa46oOtCc66PwG5Jhqp1N4vhbcxsCs9bUukgHOyUtsw==
X-Received: by 2002:a1c:4c07:0:b0:40c:3419:6ed6 with SMTP id z7-20020a1c4c07000000b0040c34196ed6mr1818330wmf.85.1702398783009;
        Tue, 12 Dec 2023 08:33:03 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id p1-20020a05600c1d8100b0040b47c69d08sm19472560wms.18.2023.12.12.08.33.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 12 Dec 2023 08:33:02 -0800 (PST)
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
Subject: [PATCH 28/33] hw/arm/vexpress: Let the A9/A15MPcore create/wire the CPU cores
Date: Tue, 12 Dec 2023 17:29:28 +0100
Message-ID: <20231212162935.42910-29-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212162935.42910-1-philmd@linaro.org>
References: <20231212162935.42910-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: GNZhGHSlZgcr

Set the properties on the mpcore object to let it create and
wire the CPU cores. Remove the redundant code.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/vexpress.c | 51 ++++++-----------------------------------------
 1 file changed, 6 insertions(+), 45 deletions(-)

diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index 294b6f15f2..c104759588 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -210,45 +210,19 @@ static void init_cpus(MachineState *ms, const char *cpu_type,
                       qemu_irq *pic, bool secure, bool virt)
 {
     DeviceState *dev;
-    SysBusDevice *busdev;
-    int n;
-    unsigned int smp_cpus = ms->smp.cpus;
 
-    /* Create the actual CPUs */
-    for (n = 0; n < smp_cpus; n++) {
-        Object *cpuobj = object_new(cpu_type);
-
-        if (!secure) {
-            object_property_set_bool(cpuobj, "has_el3", false, NULL);
-        }
-        if (!virt) {
-            if (object_property_find(cpuobj, "has_el2")) {
-                object_property_set_bool(cpuobj, "has_el2", false, NULL);
-            }
-        }
-
-        if (object_property_find(cpuobj, "reset-cbar")) {
-            object_property_set_int(cpuobj, "reset-cbar", periphbase,
-                                    &error_abort);
-        }
-        qdev_realize(DEVICE(cpuobj), NULL, &error_fatal);
-    }
-
-    /* Create the private peripheral devices (including the GIC);
-     * this must happen after the CPUs are created because a15mpcore_priv
-     * wires itself up to the CPU's generic_timer gpio out lines.
-     */
     dev = qdev_new(privdev);
+    qdev_prop_set_uint32(dev, "num-cores", ms->smp.cpus);
+    qdev_prop_set_string(dev, "cpu-type", cpu_type);
     if (!secure) {
         qdev_prop_set_bit(dev, "cpu-has-el3", false);
     }
     if (!virt) {
         qdev_prop_set_bit(dev, "cpu-has-el2", false);
     }
-    qdev_prop_set_uint32(dev, "num-cpu", smp_cpus);
-    busdev = SYS_BUS_DEVICE(dev);
-    sysbus_realize_and_unref(busdev, &error_fatal);
-    sysbus_mmio_map(busdev, 0, periphbase);
+    qdev_prop_set_uint64(dev, "cpu-reset-cbar", periphbase);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, periphbase);
 
     /* Interrupts [42:0] are from the motherboard;
      * [47:43] are reserved; [63:48] are daughterboard
@@ -256,22 +230,9 @@ static void init_cpus(MachineState *ms, const char *cpu_type,
      * external interrupts starting from 32 (because there
      * are internal interrupts 0..31).
      */
-    for (n = 0; n < 64; n++) {
+    for (int n = 0; n < 64; n++) {
         pic[n] = qdev_get_gpio_in(dev, n);
     }
-
-    /* Connect the CPUs to the GIC */
-    for (n = 0; n < smp_cpus; n++) {
-        DeviceState *cpudev = DEVICE(qemu_get_cpu(n));
-
-        sysbus_connect_irq(busdev, n, qdev_get_gpio_in(cpudev, ARM_CPU_IRQ));
-        sysbus_connect_irq(busdev, n + smp_cpus,
-                           qdev_get_gpio_in(cpudev, ARM_CPU_FIQ));
-        sysbus_connect_irq(busdev, n + 2 * smp_cpus,
-                           qdev_get_gpio_in(cpudev, ARM_CPU_VIRQ));
-        sysbus_connect_irq(busdev, n + 3 * smp_cpus,
-                           qdev_get_gpio_in(cpudev, ARM_CPU_VFIQ));
-    }
 }
 
 static void a9_daughterboard_init(VexpressMachineState *vms,
-- 
2.41.0
