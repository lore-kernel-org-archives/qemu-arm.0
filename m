Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2543613ejf;
        Tue, 27 Feb 2024 00:42:09 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVYqlZMFLpvCRMgD1rkbIDKeug4dJ/PZ3fQsn5aoRzDUv8VUBPOOF9CCeVqckiUiW5CaGvX6tUK+WMZkUFvuxp6Ir4hsNFo
X-Google-Smtp-Source: AGHT+IFJOrgt7oCHKjnnHSD77Ogv5HP20b8LiVzgrYeFRnNXReanpFfMRbRlFCIZ7tLJkw2MPXdI
X-Received: by 2002:a05:620a:2947:b0:787:e5ed:585 with SMTP id n7-20020a05620a294700b00787e5ed0585mr1185147qkp.48.1709023329183;
        Tue, 27 Feb 2024 00:42:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709023329; cv=none;
        d=google.com; s=arc-20160816;
        b=cJBIRi8kpnr8fJ3vv1JW/t57x3zgvxsTnL6RJr14u2+hfJCsXFbzZnV0H+uuWJ91vL
         x5w+9aic4rrcxO5b2c/VgkOb+HszQ4aB3g02qkjw+WGENCJZv6uFqthjRtaYdJjBDxr2
         RQeSVzJDVEEC2FxHo3rSycrlrHyqrluNW9YuOT7tapKXU9k0mh96NL/XEp9/HepS06X5
         CNF93c6Q4ovbwyA3/RPvE2hDrOcWg9LFW0JuyH54EM9H727spG1iQBLZBQjFzucBWJmA
         luHE1xm4SDHWZpknR+PFJE/yidI1jiXDqBEw+XO57lCs352rtbjucCBu1ruHJvmcGHDR
         pBLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=F4m0v/in85DGPLUDveir9W6g6TNXCVbXdqiQPBjdgEs=;
        fh=SY/XSlrBBtxeKg+BPnnxAXvYCNghyd/HND3u6RClIXI=;
        b=uuQ4xnaxmRgWf06FDuo/VlGozzQgdfvgedJuyp4Mr58QniKiIT0dCk+LpYswmbYQmt
         jHF0wvatUwp+zwZKWs/XQr6hrlOqnyvnTQMZqeAoTH/16NnMeTe8wGp1Na2ba6cAxubM
         Lws8OZeqWCSMxWtlUNtu+5uxPT6bmj3E9woUzrbfFXcwxL3hD+eRjMIGbwWBeBE0eG7c
         nhUkin0PzO0VAwvFIhor9ijRbCtS52NkWQFCSENQwbkbCRjPILuGBC3/w5tURl7mTHDm
         c+Pdv/03CCLrsPgxsqZr+2YjiMy/YluOuuF+S5KBioiBANSKKuvpgom3GPBtoeeczYnI
         dxLw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DBJSLat2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k11-20020a05620a07eb00b00787af0d7452si6961040qkk.260.2024.02.27.00.42.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Feb 2024 00:42:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DBJSLat2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ret0N-0005rN-5C; Tue, 27 Feb 2024 03:40:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ret0L-0005pb-MC
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 03:40:01 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ret0I-0007MU-Ku
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 03:40:01 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-412ad34f3adso2603955e9.2
 for <qemu-arm@nongnu.org>; Tue, 27 Feb 2024 00:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709023197; x=1709627997; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F4m0v/in85DGPLUDveir9W6g6TNXCVbXdqiQPBjdgEs=;
 b=DBJSLat2yaKXo9mPcMH5NLel2QodCcVSKNyi4J950M+fe3Da8JWf2nWEwo1DbFse20
 QVV+WLHyGGI7Ip2LL3W4YgWZEx2UbjSIyLwYq66Zm7YJ5atWmebVZpDrh7hbSpdPVeyB
 UsuWAdn4U7vsB4m0ELV/IhlJoUG0eUeA3Tdm183sl7NgdRsdx87CXAJWw/ntzC2udYm5
 879UEOQUltR6j6pwKKgChN2XMKlgcsUbrB8N+xFewmPm9jLn6iTGMBs+qxQmaGonFWHh
 fT/iBV7S7tRqXACMUg4cGobRYpcLktKWerTTQ5wYvhNFOrvyf+GOn6FgPVi2feA+oedG
 co5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709023197; x=1709627997;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F4m0v/in85DGPLUDveir9W6g6TNXCVbXdqiQPBjdgEs=;
 b=AgY3O2T1c8ssfLo/PN7f8bc6khXKVQHeVrZH48UlL+E2do2BI7BllbC4/4N/iaOpMe
 gANUkHJjpw9L5C2oj6Uk1SnQe851eYAGMzwCCaaQ2vh/2Ieq+tEbZl57ffqdGdvbCl31
 R2LEJdOPBH8/fR4ylV4K+eV+vtwDVuk7j8THYP6JltpGaUQxf8VNWBL+mK6bnVoMVUt3
 F+qs7D8M6Ggx5oYVQ8dpR5zDlSXtecKOecGuv3BFgp7utSb9S59QHOIsBM9vqPkta8lo
 lL6vp6SvKI88hLi9SJU2XENQ4nLSwVgShGZ0tIB1DPGrKPEqWIH2RnxC2Ri2eJNbgCih
 Mogg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMXbF2D2tRNhNnxb4DrQHeAuQGL/muu/OdGRhI0+6kDo2NRlD5l6YSJJ/5XiM0h/obUiU64GzitmCF24hoIOTn7KzN
X-Gm-Message-State: AOJu0YyRtis46+tQR39yWdbPC1oMVXtvTHGyGewoKO2FIuThU6g48REs
 bQWPrtUsXPYhlPHLv1qUSslFjq+a//Y5i/h3japCOMV8eoGmP2fxoJW8TWdeW2k=
X-Received: by 2002:a05:6000:71b:b0:33d:c652:7c41 with SMTP id
 bs27-20020a056000071b00b0033dc6527c41mr6627002wrb.71.1709023196656; 
 Tue, 27 Feb 2024 00:39:56 -0800 (PST)
Received: from m1x-phil.lan (mic92-h03-176-184-33-214.dsl.sta.abo.bbox.fr.
 [176.184.33.214]) by smtp.gmail.com with ESMTPSA id
 m22-20020a056000175600b0033d1b653e4csm10609691wrf.54.2024.02.27.00.39.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 27 Feb 2024 00:39:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 01/30] hw/arm: Inline sysbus_create_simple(PL110 / PL111)
Date: Tue, 27 Feb 2024 09:39:17 +0100
Message-ID: <20240227083948.5427-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240227083948.5427-1-philmd@linaro.org>
References: <20240227083948.5427-1-philmd@linaro.org>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: jgoY1NhaDMJX

We want to set another qdev property (a link) for the pl110
and pl111 devices, we can not use sysbus_create_simple() which
only passes sysbus base address and IRQs as arguments. Inline
it so we can set the link property in the next commit.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240226173805.289-2-philmd@linaro.org>
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

