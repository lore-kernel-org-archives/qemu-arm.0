Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2203268ejf;
        Mon, 26 Feb 2024 09:38:30 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVg6pU3p1hEkWwqerZFqM556jcRm7xf3d+mwnlSpmfPEMCSWmUuXYjjKk3sFbwJmK+wIiCrWVWO450LyRelQH/MNs8d4hwo
X-Google-Smtp-Source: AGHT+IHcBlZ6wNTm0dpIqq6oup1W0uWBWRNhD9IO81btgQHW+ICE6hQPPuUomxTJsAEhZFYLxgiq
X-Received: by 2002:a05:6830:349f:b0:6e4:a9e1:26c7 with SMTP id c31-20020a056830349f00b006e4a9e126c7mr522594otu.35.1708969109977;
        Mon, 26 Feb 2024 09:38:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708969109; cv=none;
        d=google.com; s=arc-20160816;
        b=wCh+SiIi15J2aZxFkapJAyWrLV6ABZOxfjuMuAoC0pbhAJNJM0V+EZjIq0qLNRh3Re
         Vnm1L8XSOctrnIGDYFDJ5AcnHw6jIRm0oW5lCumUuQBArb6BfquM1hT8XpSd9HNa8WBW
         CNN70vH/GSTbqvDtmP3BtPIeK14mF9EzJBt0Wtl2F+k0MvpjnQtz9J9/ZL2RlsF+sU4a
         TwaT0vDlwAPtov9P2icsCfZQjmcWt8GkiAom71br3lE+kuppgBkpTizo+epJ2DRsDVV9
         Yf/SRr4I7S3iIbHCAeADlpH7oTowf4u2v2S2OAjvPy9Owo35UJmAIkWSHnb4nDCJ8r5J
         PI5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=pYkVqFHaNeYFq74/W6niP/tmlfQNyHPTT4iDH8DS3Ls=;
        fh=nvo5RjCIyzrsfNZsFyc8KAYF9iiDE6P73sa+fgZTnCQ=;
        b=0n6o4sjVKHfMel5eFk9NEE/JQKR9QODcxVLb168GqJNhevzMW5v1f/8inXlRtkfyk0
         Zwh84XPm4gPXn4p14qDpuFA0S8B9EYpYrKt6eBQdxoqBTBXQJqUM7gTv2Pne4EDlXHQ5
         HOgsNbLht+1+ssgjiLNtJ7SzGBFgVfXxeLtclupKkT/ubkDYe8hirKKfYA/t5D4BD24z
         y+gKCs3aNLF9fYP4p19l9Go2p+azbWNGPFbbREqC8NaNIdG1V4YG8h/qnW/7Vbu6HPTv
         YMB2E5VX65I/ZTJJLd6t4n4D3Nw5qTbgjOmqiXhGQQpXNcAqvc4RA8azaro18IG91I7L
         d92w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kmYX7tMP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o17-20020ac85551000000b0042e66404858si5369863qtr.667.2024.02.26.09.38.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Feb 2024 09:38:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kmYX7tMP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1reevm-0003yC-8P; Mon, 26 Feb 2024 12:38:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1reevg-0003uk-Mj
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 12:38:16 -0500
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1reevf-00075E-1y
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 12:38:16 -0500
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2d269b2ff48so38303441fa.3
 for <qemu-arm@nongnu.org>; Mon, 26 Feb 2024 09:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708969093; x=1709573893; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pYkVqFHaNeYFq74/W6niP/tmlfQNyHPTT4iDH8DS3Ls=;
 b=kmYX7tMPkirHAn2C3iewuPl0Kg/upksx1hDE0JgYb5aD2MY+em74uOPXqDROZ4MPlz
 1T4UHwAH+gz8zjrlYHJVV+LMXENv8mM6GDDCX6Q/HZgLlzWS8qztYgzJgLcrpuWN+Tq3
 4XDP0Uq8ksMi1hDBYuDN3GGnvTUUAgKhIxHmKDe0yJxjjgJeOSTwYK4We9WsGE7CiS3D
 CR7lHbk0bmVIR0uA09N9qFd0nsSY+jLHMjVlRMxtT1+nfjPIzKcQGiw3JUeb2xuZvevH
 1zP1cmO7k9be5ioBrAIucjlDu/nXptHsSonaGcCCdNsaz336bWSrL3e121t/TlPypV4u
 rDEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708969093; x=1709573893;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pYkVqFHaNeYFq74/W6niP/tmlfQNyHPTT4iDH8DS3Ls=;
 b=Vorf3nGeQA2+q5XSVUf3qOzeOyZb6pndujh8z1gLCQ79ajgXnn2HA1D+lQOrUYwi4d
 V0wz1Mq7FAb0iJG5RouGKk3ybpFnjuCAdGKpWezOeD6XoZKGQKI37K9JPCxKclj+8u7J
 qBkicgk89wSyYc+/Whgvix+zfozncdg4fMCe0p1wUSXEd4ryaHiDtD1LUz0rN+JVqOQd
 Vy4PvabG1XDoVQn2sDhhyYPChqzZSJUDn+1qhLxk4dUoiZ4I8yQxvE/ZJnZmEZ4Bo6ME
 J9hNcOYIqawZ4DHRkG41eHW2ZST3RfwK3NLi+ILE6bTslkS1bVKl/PBkCjSejk9ZHTd9
 EgYQ==
X-Gm-Message-State: AOJu0YyYYzq+jcErO1whsVlmAYgXdc9JI2PWLCCm0XFMjg4j6asLbGA5
 SoTYLZzsfO3Du93i0uRzrOjD/Vz22k0z4wBgZzcV2+UZFuFcnaaXHPHbcPKYkXk=
X-Received: by 2002:a2e:b8c7:0:b0:2d2:4ee4:c8a5 with SMTP id
 s7-20020a2eb8c7000000b002d24ee4c8a5mr5108039ljp.50.1708969093150; 
 Mon, 26 Feb 2024 09:38:13 -0800 (PST)
Received: from m1x-phil.lan ([176.187.223.153])
 by smtp.gmail.com with ESMTPSA id
 k22-20020a7bc416000000b0041061f094a2sm12474343wmi.11.2024.02.26.09.38.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 26 Feb 2024 09:38:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 1/6] hw/arm: Inline sysbus_create_simple(PL110 / PL111)
Date: Mon, 26 Feb 2024 18:37:59 +0100
Message-ID: <20240226173805.289-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240226173805.289-1-philmd@linaro.org>
References: <20240226173805.289-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x233.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: kyAEFzgZYkMc

We want to set another qdev property (a link) for the pl110
and pl111 devices, we can not use sysbus_create_simple() which
only passes sysbus base address and IRQs as arguments. Inline
it so we can set the link property in the next commit.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/arm/integratorcp.c |  5 ++++-
 hw/arm/realview.c     |  5 ++++-
 hw/arm/versatilepb.c  |  6 +++++-
 hw/arm/vexpress.c     | 10 ++++++++--
 4 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/hw/arm/integratorcp.c b/hw/arm/integratorcp.c
index f016d20485..5b002da350 100644
--- a/hw/arm/integratorcp.c
+++ b/hw/arm/integratorcp.c
@@ -670,7 +670,10 @@ static void integratorcp_init(MachineState *machine)
         smc91c111_init(0xc8000000, pic[27]);
     }
 
-    sysbus_create_simple("pl110", 0xc0000000, pic[22]);
+    dev = qdev_new("pl110");
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0xc0000000);
+    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[22]);
 
     integrator_binfo.ram_size = ram_size;
     arm_load_kernel(cpu, machine, &integrator_binfo);
diff --git a/hw/arm/realview.c b/hw/arm/realview.c
index 9058f5b414..77300e92e5 100644
--- a/hw/arm/realview.c
+++ b/hw/arm/realview.c
@@ -238,7 +238,10 @@ static void realview_init(MachineState *machine,
     sysbus_create_simple("pl061", 0x10014000, pic[7]);
     gpio2 = sysbus_create_simple("pl061", 0x10015000, pic[8]);
 
-    sysbus_create_simple("pl111", 0x10020000, pic[23]);
+    dev = qdev_new("pl111");
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0x10020000);
+    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[23]);
 
     dev = sysbus_create_varargs("pl181", 0x10005000, pic[17], pic[18], NULL);
     /* Wire up MMC card detect and read-only signals. These have
diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
index d10b75dfdb..7e04b23af8 100644
--- a/hw/arm/versatilepb.c
+++ b/hw/arm/versatilepb.c
@@ -299,7 +299,11 @@ static void versatile_init(MachineState *machine, int board_id)
 
     /* The versatile/PB actually has a modified Color LCD controller
        that includes hardware cursor support from the PL111.  */
-    dev = sysbus_create_simple("pl110_versatile", 0x10120000, pic[16]);
+    dev = qdev_new("pl110_versatile");
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0x10120000);
+    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[16]);
+
     /* Wire up the mux control signals from the SYS_CLCD register */
     qdev_connect_gpio_out(sysctl, 0, qdev_get_gpio_in(dev, 0));
 
diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index aa5f3ca0d4..671986c21e 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -276,6 +276,7 @@ static void a9_daughterboard_init(VexpressMachineState *vms,
 {
     MachineState *machine = MACHINE(vms);
     MemoryRegion *sysmem = get_system_memory();
+    DeviceState *dev;
 
     if (ram_size > 0x40000000) {
         /* 1GB is the maximum the address space permits */
@@ -297,7 +298,9 @@ static void a9_daughterboard_init(VexpressMachineState *vms,
     /* Daughterboard peripherals : 0x10020000 .. 0x20000000 */
 
     /* 0x10020000 PL111 CLCD (daughterboard) */
-    sysbus_create_simple("pl111", 0x10020000, pic[44]);
+    dev = qdev_new("pl111");
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0x10020000);
+    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[44]);
 
     /* 0x10060000 AXI RAM */
     /* 0x100e0000 PL341 Dynamic Memory Controller */
@@ -650,7 +653,10 @@ static void vexpress_common_init(MachineState *machine)
 
     /* VE_COMPACTFLASH: not modelled */
 
-    sysbus_create_simple("pl111", map[VE_CLCD], pic[14]);
+    dev = qdev_new("pl111");
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, map[VE_CLCD]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[14]);
 
     dinfo = drive_get(IF_PFLASH, 0, 0);
     pflash0 = ve_pflash_cfi01_register(map[VE_NORFLASH0], "vexpress.flash0",
-- 
2.41.0

