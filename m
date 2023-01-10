Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3317423ejc;
        Tue, 10 Jan 2023 08:45:33 -0800 (PST)
X-Received: by 2002:a05:600c:4f8a:b0:3d9:f559:1f7e with SMTP id n10-20020a05600c4f8a00b003d9f5591f7emr4664039wmq.20.1673369133057;
        Tue, 10 Jan 2023 08:45:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673369133; cv=none;
        d=google.com; s=arc-20160816;
        b=dcQEbchAy0C4UE5w6FWV1gRlHKu/yQzfIqaGUQOsZDPtZLkP1wdNYT5xnb26I6na8t
         eX0Jk+DPYorLG76+N0/HgmQcyNI13N6LtafwS2rCeyvByZbikQWhm7lT7+1wXBVTHFeW
         r+e70yh0YBEqNhUnywJvU32RcuMEcXTibYie1AJkdnm+aIYoZ76jel1pER3oVhXhbk8m
         6N4BEkxB0ODRSlamGuA6d3qQT3rFfEzqZa79EeJFtvZYn8iBOAjKcXyp1nvViIiAbm/n
         yfv/W5e4bfGMT5B+ryziyGK5WBzxU2kGickkpeZGcd0YIa9iPlq1iG7ndojJ+dS/JeEX
         lnmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=eBfsDWznx6tTCpJqF4G0yaUMUab40XH3oUrTJlLuOAc=;
        b=QCO32BuoB+/m3ktVnCGGiKSl/ow37UgFBGAFgJLzDyMZereNo34HXLZbkvLz5p6lJL
         lGYH5h+/ItsLFun2PRPA1ydYi6U+kDJWSDJ9lIxuqanGT/yNmEWcHovsQFoE5PHcLyOR
         uanH86LY1AnnzEnTOD1tVTrqYFrGWQLeaeJMtp9A6nrO2e3EY69Qi+ZwQgBvzU7m2z+r
         PY6WnHMf8v1NM0vkQJufMdnsdADL9Y1o9iIUbnxT4YIg36v1/tiDXlXW40v0lTedqe1d
         xHadtrxRYKxb9unKJFlRkgHZ0KWrX2j1a06RdUKv6GBrCpXu9ZfEs+EVPMFw4jUdYEtR
         ThbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q1Hf8Pcn;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j2-20020a05600c1c0200b003cfc02ab974sor3851200wms.28.2023.01.10.08.45.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Jan 2023 08:45:33 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q1Hf8Pcn;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eBfsDWznx6tTCpJqF4G0yaUMUab40XH3oUrTJlLuOAc=;
        b=Q1Hf8PcnDurO/pGRztswZA4ojK+XIGZ+kZ0mpmEl4K/NeCjqTsuSccaJPMM++ci3p4
         P9JOJ+zZM45adzqNUCulSZt1Lpk/baJ6p3XMsgbT1D8GL2ZXZI5tiWZb98y0PW9WGbDe
         rm4MgKMH4CBqzN7r/MHn+BeaBTf04QQOxlcr/gRitbsNHA2VrHs7z0QZdvKXA3ICGSaS
         /yyrYV7UsA6vNxim+NuIx818bKg1c6Pi3V0EaZ1yXD3tzwChUBmkjtfP66PN++mBjFRE
         fh1BL9bv1yLHZKTSXSArBL8HcW7/DHuOfsf6k4Dvavu89NrRTJU+UrZVz79P1TGJ56bC
         z23Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eBfsDWznx6tTCpJqF4G0yaUMUab40XH3oUrTJlLuOAc=;
        b=6Hqwq+RDlOaU3JaS1XqS5PoKx8DywG3EEZvFtmxvyWKAhJeUnkmfmHuVElz1GmKd41
         Ffnn65pWNxYLzA8vgk10gvLkQJQ9KqQguLFvkW2lZfTrDHy0uHMx35ixAvFJB3RnD/Gv
         LkxcDhgv82mFeFQeSsQkLXv/9aMDq5O6WORHQ7VlV7D71Bn+3l7z4TgG7y71r6DCgEFp
         AAdEL7GFAVw6Q4S1exD5cIl6M8GFRWlYe0S5InqxKy/yx2kwjioJzEhY5sQIRjWCaMsj
         8GRxvsTGwijlURBKZQmzRjBZM9XXa4VvERYXjl/GOR9b3xZXRcR5qQ2NA4M0ummgnbaU
         bcRQ==
X-Gm-Message-State: AFqh2koGOe0CFNqXX8+1bUa8JShe3YC89sneT3We5YJ+XY6b+Nd6DonQ
	b3FoYzEwBMKPzUXknxXFA+AMY2r1
X-Google-Smtp-Source: AMrXdXvDHwRvAqIH9Pj4ZVntUfLbrZ99eoOz8BgIOBBcdQnI1KBBDc0tqwuJfimooMoJm7oBWUEpDw==
X-Received: by 2002:a05:600c:46c7:b0:3d9:ee3d:2f54 with SMTP id q7-20020a05600c46c700b003d9ee3d2f54mr6894261wmo.13.1673369132823;
        Tue, 10 Jan 2023 08:45:32 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id m18-20020a05600c4f5200b003c71358a42dsm26965063wmq.18.2023.01.10.08.45.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Jan 2023 08:45:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Antonio Caggiano <antonio.caggiano@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Jan Kiszka <jan.kiszka@web.de>,
	Beniamino Galvani <b.galvani@gmail.com>
Subject: [PATCH 15/18] hw/arm/fsl-imx31: Replace object_initialize(ARMCPU) by object_new()
Date: Tue, 10 Jan 2023 17:44:03 +0100
Message-Id: <20230110164406.94366-16-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110164406.94366-1-philmd@linaro.org>
References: <20230110164406.94366-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: KGo3WgwsZ5LF

Replace the ARMCPU field in FslIMX25State by a reference to
an allocated ARMCPU. Instead of initializing the field with
object_initialize(), allocate it with object_new().

As we don't access ARMCPU internal fields or size, we can
move from arm_ss[] to the more generic softmmu_ss[] the followin
units:

 - fsl-imx31.c
 - kzm.c

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/fsl-imx31.c         | 9 +++++----
 hw/arm/kzm.c               | 2 +-
 hw/arm/meson.build         | 2 +-
 include/hw/arm/fsl-imx31.h | 4 ++--
 4 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/hw/arm/fsl-imx31.c b/hw/arm/fsl-imx31.c
index def27bb913..26c6bb67f0 100644
--- a/hw/arm/fsl-imx31.c
+++ b/hw/arm/fsl-imx31.c
@@ -32,7 +32,8 @@ static void fsl_imx31_init(Object *obj)
     FslIMX31State *s = FSL_IMX31(obj);
     int i;
 
-    object_initialize_child(obj, "cpu", &s->cpu, ARM_CPU_TYPE_NAME("arm1136"));
+    s->cpu = ARM_CPU(object_new(ARM_CPU_TYPE_NAME("arm1136")));
+    object_property_add_child(obj, "cpu", OBJECT(s->cpu));
 
     object_initialize_child(obj, "avic", &s->avic, TYPE_IMX_AVIC);
 
@@ -65,7 +66,7 @@ static void fsl_imx31_realize(DeviceState *dev, Error **errp)
     uint16_t i;
     Error *err = NULL;
 
-    if (!qdev_realize(DEVICE(&s->cpu), NULL, errp)) {
+    if (!qdev_realize(DEVICE(s->cpu), NULL, errp)) {
         return;
     }
 
@@ -74,9 +75,9 @@ static void fsl_imx31_realize(DeviceState *dev, Error **errp)
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->avic), 0, FSL_IMX31_AVIC_ADDR);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->avic), 0,
-                       qdev_get_gpio_in(DEVICE(&s->cpu), ARM_CPU_IRQ));
+                       qdev_get_gpio_in(DEVICE(s->cpu), ARM_CPU_IRQ));
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->avic), 1,
-                       qdev_get_gpio_in(DEVICE(&s->cpu), ARM_CPU_FIQ));
+                       qdev_get_gpio_in(DEVICE(s->cpu), ARM_CPU_FIQ));
 
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->ccm), errp)) {
         return;
diff --git a/hw/arm/kzm.c b/hw/arm/kzm.c
index b1b281c9ac..8c6cdb06f5 100644
--- a/hw/arm/kzm.c
+++ b/hw/arm/kzm.c
@@ -126,7 +126,7 @@ static void kzm_init(MachineState *machine)
     kzm_binfo.ram_size = machine->ram_size;
 
     if (!qtest_enabled()) {
-        arm_load_kernel(&s->soc.cpu, machine, &kzm_binfo);
+        arm_load_kernel(s->soc.cpu, machine, &kzm_binfo);
     }
 }
 
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index ccda1f5149..b244db5962 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -20,7 +20,6 @@ arm_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3.c', 'orange
 arm_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2836.c', 'raspi.c'))
 arm_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqmp.c', 'xlnx-zcu102.c'))
 arm_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal.c', 'xlnx-versal-virt.c'))
-arm_ss.add(when: 'CONFIG_FSL_IMX31', if_true: files('fsl-imx31.c', 'kzm.c'))
 arm_ss.add(when: 'CONFIG_FSL_IMX6', if_true: files('fsl-imx6.c'))
 arm_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
   'aspeed_soc.c',
@@ -41,6 +40,7 @@ softmmu_ss.add(when: 'CONFIG_DIGIC', if_true: files('digic_boards.c'))
 softmmu_ss.add(when: 'CONFIG_EMCRAFT_SF2', if_true: files('msf2-som.c'))
 softmmu_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4_boards.c'))
 softmmu_ss.add(when: 'CONFIG_FSL_IMX25', if_true: files('fsl-imx25.c', 'imx25_pdk.c'))
+softmmu_ss.add(when: 'CONFIG_FSL_IMX31', if_true: files('fsl-imx31.c', 'kzm.c'))
 softmmu_ss.add(when: 'CONFIG_GUMSTIX', if_true: files('gumstix.c'))
 softmmu_ss.add(when: 'CONFIG_HIGHBANK', if_true: files('highbank.c'))
 softmmu_ss.add(when: 'CONFIG_INTEGRATOR', if_true: files('integratorcp.c'))
diff --git a/include/hw/arm/fsl-imx31.h b/include/hw/arm/fsl-imx31.h
index c116a73e0b..c117136901 100644
--- a/include/hw/arm/fsl-imx31.h
+++ b/include/hw/arm/fsl-imx31.h
@@ -27,7 +27,7 @@
 #include "hw/gpio/imx_gpio.h"
 #include "hw/watchdog/wdt_imx2.h"
 #include "exec/memory.h"
-#include "target/arm/cpu.h"
+#include "hw/arm/cpu.h"
 #include "qom/object.h"
 
 #define TYPE_FSL_IMX31 "fsl-imx31"
@@ -43,7 +43,7 @@ struct FslIMX31State {
     DeviceState parent_obj;
 
     /*< public >*/
-    ARMCPU         cpu;
+    ARMCPU         *cpu;
     IMXAVICState   avic;
     IMX31CCMState  ccm;
     IMXSerialState uart[FSL_IMX31_NUM_UARTS];
-- 
2.38.1
