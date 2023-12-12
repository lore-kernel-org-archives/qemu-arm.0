Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1027172ejo;
        Tue, 12 Dec 2023 08:33:09 -0800 (PST)
X-Received: by 2002:a7b:cd91:0:b0:40c:3399:d5a0 with SMTP id y17-20020a7bcd91000000b0040c3399d5a0mr2776818wmj.100.1702398789773;
        Tue, 12 Dec 2023 08:33:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702398789; cv=none;
        d=google.com; s=arc-20160816;
        b=AINzru+rWTBYtkMz+e+OWthtf7Xwpv2hxQHDxhCe6ENafaGZ3HqA3rcq8p9nbSYrey
         CI14ENu/5sroXXAGGOB25wi14S6FjmgmrKTn8rbjF8PIBKwrUZK+8OuZt7BAMXbTaLAf
         023va6t6DhrkqNAKZtG6poKeOACIS933qhOZFkDij4deBrxGBw3q61LK8hYhA/dwL8DQ
         60TtpkRVnaF3WJ2Oe+I4dQ6t3Jbsctnvy9cn44HguYGOPlRHzIrM/4vwjUM9brz8u1f6
         q0sfRfnMgvZttfr/Z4urmhsLAOqPxyoESXUpLi9949kDXHtr5avosRC1UsN+U65jWWxO
         E/aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=OPLFBqDabQLYVHbUOqNffhd0DEwyb05vaEjM8y+M+3M=;
        fh=CkupYgn1Qmdh7jizui9HJgGegpqbRR5NXz1VyjRE1Hs=;
        b=oHYwu4vc7HLeCXMTY7JOheMHs9arZ/UMKRI6JwmKmq9aqln6afJTXDs2i+r5w3hUyI
         PSPuf5eIxN/AI3p1zxTRoZXvrMKVOpTgVMPV/tMk8w2t7ZkTbzsRdSPdHmSIaeG2g6iE
         ZQmkFGunXzmqa8Gi9UhgsnRKBSBGSgnMrxgrqnZ5/rz6GK4xSKSWxeVJndWN3wHnoKrG
         xqtN8q/zKOWXpcWMUVZIIRxY/zZZSnhh1cidz7tFC7VbeZQolaq46rTJtS8PgNB0a4Cb
         omNuH0mXGwn3fS1GcLqbVcq1ncU6zOf7//Vq8IhlzWZo0LAH6H96Jj27/vRT2YtaOVqN
         P3YA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yyRxCCsP;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ay1-20020a05600c1e0100b0040c21ef86a3sor3124636wmb.8.2023.12.12.08.33.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 08:33:09 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yyRxCCsP;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702398789; x=1703003589; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OPLFBqDabQLYVHbUOqNffhd0DEwyb05vaEjM8y+M+3M=;
        b=yyRxCCsPe/sVIqcEgzjjfLa0ilt7wTDLiKK4ZuDOgwfPsGgiUw+coRP5mVN/gXJW6t
         X2IPAXVpcIjDKR2qhlbsjkl/7Un4wFvP86ExMTbt2Qki/PAetyuNURGw5MKjwQ5LHZH3
         N/sBf4HXk6na1D+9QeiWbYfEuamIoLM/PeENZ6sy47BNyvNj+PBnGgmCxLVfLS6W1b8H
         rl9OQMvOOgimv54zQSBjUj0reHF5qlzZbJ17aWR5fFu6hzz72L4sv0FPgeFRtv4kX2Vd
         nNYqlRdIphSB9SlJC3ydHsv+02013QgkHwvOLz9erdSJWxVB94+hTDCg3Cbt7dAJn9v9
         pIRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702398789; x=1703003589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OPLFBqDabQLYVHbUOqNffhd0DEwyb05vaEjM8y+M+3M=;
        b=WW+Lo2wNn25ElQd82xsi+qiCuoNLMeV18CQPW4J+L/khWqgEe0YWrKCJbJc4UVtbyY
         HRCru8eMhjUbkG9G9GsBjfy+b9JWORpXF3MdB8z0qFh4ATj9bJNCLJ8rZe2qCqJo8Mr4
         lOhc3PcFF14v1PcSEGGSpo/OpCQy0VP4LaW+ML09ayZE/GNd2DLZB8hn1DLEj1yaktQ+
         xRyXO9PPgX8Lm0hR0Fh07SwRbL8BalZnsRXf/cWSM2KncRoskXhzePnbmOvfXu5VLAYJ
         Cn1G5XKeBgubCR76E/x+jl71igmZBwXDdX6G9cUNaN9TgExHx4QO2+zmL5fAwKHor8Fr
         Rlng==
X-Gm-Message-State: AOJu0YzzgdbKuTqQqez8Ieu5IqQz5y9I1adh48QunHx20JIzBLYL9RAX
	uv2hkEsM6zSxK1AdNv6tjY+OSUZG
X-Google-Smtp-Source: AGHT+IF1Ojrl2IyYsz/84g4YWjU8+ikQLoD7mLNtZdFpFRmWCmlEXTsgd+oesNBQPzJHjvSF2faQWg==
X-Received: by 2002:a05:600c:2a8d:b0:40c:3308:3afd with SMTP id x13-20020a05600c2a8d00b0040c33083afdmr3042997wmd.12.1702398789402;
        Tue, 12 Dec 2023 08:33:09 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id fc17-20020a05600c525100b0040c42681fcesm10272057wmb.15.2023.12.12.08.33.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 12 Dec 2023 08:33:09 -0800 (PST)
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
Subject: [PATCH 29/33] hw/arm/xilinx_zynq: Let the A9MPcore create/wire the CPU cores
Date: Tue, 12 Dec 2023 17:29:29 +0100
Message-ID: <20231212162935.42910-30-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212162935.42910-1-philmd@linaro.org>
References: <20231212162935.42910-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Zcyartu/S218

Set the properties on the mpcore object to let it create and
wire the CPU cores. Remove the redundant code.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/xilinx_zynq.c | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 28430dcfba..736e2115a6 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -192,22 +192,6 @@ static void zynq_init(MachineState *machine)
         exit(EXIT_FAILURE);
     }
 
-    cpu = ARM_CPU(object_new(machine->cpu_type));
-
-    /* By default A9 CPUs have EL3 enabled.  This board does not
-     * currently support EL3 so the CPU EL3 property is disabled before
-     * realization.
-     */
-    if (object_property_find(OBJECT(cpu), "has_el3")) {
-        object_property_set_bool(OBJECT(cpu), "has_el3", false, &error_fatal);
-    }
-
-    object_property_set_int(OBJECT(cpu), "midr", ZYNQ_BOARD_MIDR,
-                            &error_fatal);
-    object_property_set_int(OBJECT(cpu), "reset-cbar", MPCORE_PERIPHBASE,
-                            &error_fatal);
-    qdev_realize(DEVICE(cpu), NULL, &error_fatal);
-
     /* DDR remapped to address zero.  */
     memory_region_add_subregion(address_space_mem, 0, machine->ram);
 
@@ -239,15 +223,19 @@ static void zynq_init(MachineState *machine)
     sysbus_mmio_map(SYS_BUS_DEVICE(slcr), 0, 0xF8000000);
 
     dev = qdev_new(TYPE_A9MPCORE_PRIV);
-    qdev_prop_set_uint32(dev, "num-cpu", 1);
+    qdev_prop_set_uint32(dev, "num-cores", 1);
+    qdev_prop_set_string(dev, "cpu-type", machine->cpu_type);
     /*
      * By default A9 CPUs have EL3 enabled.  This board does not
      * currently support EL3 so the CPU EL3 property is disabled before
      * realization.
      */
     qdev_prop_set_bit(dev, "cpu-has-el3", false);
+    qdev_prop_set_uint64(dev, "cpu-reset-cbar", MPCORE_PERIPHBASE);
+    qdev_prop_set_uint64(dev, "cpu-midr", ZYNQ_BOARD_MIDR);
     busdev = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(busdev, &error_fatal);
+    cpu = CORTEX_MPCORE_PRIV(dev)->cpu[0];
     sysbus_mmio_map(busdev, 0, MPCORE_PERIPHBASE);
     sysbus_connect_irq(busdev, 0,
                        qdev_get_gpio_in(DEVICE(cpu), ARM_CPU_IRQ));
-- 
2.41.0
