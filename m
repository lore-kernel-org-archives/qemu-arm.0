Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4326481ejb;
        Thu, 29 Dec 2022 07:24:09 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvn8kyOcCt6eOxh/jvDUDgp3ps/pT+spSzYV3rN61gKkIS8qME0yLcKSqmZynmsrZKsFT7m
X-Received: by 2002:ac8:6906:0:b0:3a7:eb76:880b with SMTP id bt6-20020ac86906000000b003a7eb76880bmr32569384qtb.41.1672327449313;
        Thu, 29 Dec 2022 07:24:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672327449; cv=none;
        d=google.com; s=arc-20160816;
        b=dwDD22AleZMV4dXon0kNCnifJAIetWVTLh1xE/hmuXF0FzLFQyegLnoiGEasSE2fs0
         PWhBzM6+guCW7gKlCzlizb/qyzIpQj6A7XQzLnJzvdoCvBI0RAB7c6Kk61jIbcd6KPpj
         EioziCLG7yaFCPmVCgkg2fjS/74a8mJw4z5l/GrQr0azco1lUgKnf2YbZtHDE5StueLH
         VMQlJ+3DzQzoDBxLLVzRvKh5vEHQHWxfXLxe3cQWx8sYc+XKtjwQfsqXLW06JySQFIBo
         u4b+4eqCPCyf/dlffJkSntOluGqVap0TAZQ9gOKEn/F53/60NmVmyDpofydmOs64YQ1d
         zfFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Xi5ZHXXGo8A6r2aP9t4KsthF9mgQVNhCtKP7hpHMuLs=;
        b=FEp6rPfbHlBJ1j3PAqczPyMRsbZ9hE9MKWly305gICHbzlFBICjTJ7nY49MTP2aiUL
         KOwK+tA3fjtSEq3xPQ99wfjWHWQ29gBUmfzNviy6xQ2S8yh518OMAk2TcfIkdIoA9MRJ
         NHlFeCvSX/CzmqxmMmtf9VAjhtiRuKJvdu0zowKOxigG496Nm4qcXvTRZIgLwdwNju/J
         j6oXrEKjtHqQbHl2/fSNZA/AQlNKv+tl72Cz28BnZYM6cpNT84zsryKJ7JUWDGtuJmjK
         Bt1VjN5TMXc6sS7VkFFZYRn59LPzxlz9wa65KRCTEJGuHU1TkG2HnNfyYm8qBXDwxo/I
         wNWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CySXw9IO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h1-20020ac87141000000b003892a2f3457si8339595qtp.156.2022.12.29.07.24.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Dec 2022 07:24:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CySXw9IO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pAul3-0001Gg-VJ; Thu, 29 Dec 2022 10:23:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAul2-0001GL-Hm
 for qemu-arm@nongnu.org; Thu, 29 Dec 2022 10:23:48 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAul0-0007rt-OG
 for qemu-arm@nongnu.org; Thu, 29 Dec 2022 10:23:48 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 ay2-20020a05600c1e0200b003d22e3e796dso13403968wmb.0
 for <qemu-arm@nongnu.org>; Thu, 29 Dec 2022 07:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xi5ZHXXGo8A6r2aP9t4KsthF9mgQVNhCtKP7hpHMuLs=;
 b=CySXw9IOxSOxxlfpHVwSDjtmWmCT3LdebuyyX/l6sxOsgNFFpbXlt+ItMSJeCGM9TQ
 AACl59NpwyNYIUKE3S0Ge5kUjqLC583VkJLdhRWxQymJXSD0ExQT2W4JyWhIM8ZJ0v0x
 gENCkDF6TNPOR9sk7WAEavCYC9GvBLCKSn6eqTw8r0pfmV/gH07K0eO9prndDi4mB5yA
 d/UvAcO0XGwMZo/uUrdgbWjHD6EY1HDXmrBSTFhXmvS5+F1A0yfF8bIWRK272COkP81d
 PcXg86aGgkPCmvLGqa+vLzz9b5uaXxF9N/n4rlhJvc00i3b8q6q+gkLwyX3vrez+/8St
 5FiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xi5ZHXXGo8A6r2aP9t4KsthF9mgQVNhCtKP7hpHMuLs=;
 b=eKB3Rz65uWiUWt2hMhcneWoaw6bhaDp93MnDYj/yA+32GWrTeZR4pi+d/xDj1hHkoX
 u220JQ6ZEEkGVgtEGR6fyyGJUp8Q0vJWm+a1sXnvNQfm3wYAj/U/xOO5bp8DcrtOiogZ
 bMcrKyC8O2xVdLpYWKJjB+q1sNJBeVMQ38V9lzmtNFHjhiOUuTk5LWExIImTizFDMvAk
 LAXocfpyftZj2tFYgiKYa1wri2oeyLmi12gTGCS44dIAuAE4+j4KZpjKSYCMONeSOHX1
 O0eiIo7ABFbUUIGIdnzT/VXzdOBfGaWHMoz/pXthxHCzmFRtEj3c7d6EUlfMIQsNaIAm
 Hquw==
X-Gm-Message-State: AFqh2kobXzCeVRU/RwEWqNZDbeiRWIVhegs2KkMjVKlfBpDk5ati26n4
 xfNnk807LhhzZXLdfyOvHZJY8Q==
X-Received: by 2002:a05:600c:214a:b0:3cf:6910:51d4 with SMTP id
 v10-20020a05600c214a00b003cf691051d4mr20210202wml.29.1672327425109; 
 Thu, 29 Dec 2022 07:23:45 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 k2-20020a05600c1c8200b003d974076f13sm21072528wms.3.2022.12.29.07.23.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 29 Dec 2022 07:23:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Steven Lee <steven_lee@aspeedtech.com>, Peter Delevoryas <peter@pjd.dev>,
 Peter Delevoryas <pdel@meta.com>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Troy Lee <troy_lee@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Delevoryas <pdel@fb.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>
Subject: [PATCH 3/9] hw/arm/aspeed_ast10x0: Add various unimplemented
 peripherals
Date: Thu, 29 Dec 2022 16:23:19 +0100
Message-Id: <20221229152325.32041-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221229152325.32041-1-philmd@linaro.org>
References: <20221229152325.32041-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: AZ6rOKZ71Qur

Based on booting Zephyr demo from [1] running QEMU with
'-d unimp' and checking missing devices in [2].

[1] https://github.com/AspeedTech-BMC/zephyr/releases/tag/v00.01.07
[2] https://github.com/AspeedTech-BMC/zephyr/blob/v00.01.08/dts/arm/aspeed/ast10x0.dtsi

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/aspeed_ast10x0.c     | 35 +++++++++++++++++++++++++++++++++++
 include/hw/arm/aspeed_soc.h | 11 +++++++++++
 2 files changed, 46 insertions(+)

diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index 3500294df7..d7dbc1a801 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -28,10 +28,15 @@ static const hwaddr aspeed_soc_ast1030_memmap[] = {
     [ASPEED_DEV_FMC]       = 0x7E620000,
     [ASPEED_DEV_SPI1]      = 0x7E630000,
     [ASPEED_DEV_SPI2]      = 0x7E640000,
+    [ASPEED_DEV_UDC]       = 0x7E6A2000,
     [ASPEED_DEV_SCU]       = 0x7E6E2000,
+    [ASPEED_DEV_JTAG0]     = 0x7E6E4000,
+    [ASPEED_DEV_JTAG1]     = 0x7E6E4100,
     [ASPEED_DEV_ADC]       = 0x7E6E9000,
+    [ASPEED_DEV_ESPI]      = 0x7E6EE000,
     [ASPEED_DEV_SBC]       = 0x7E6F2000,
     [ASPEED_DEV_GPIO]      = 0x7E780000,
+    [ASPEED_DEV_SGPIOM]    = 0x7E780500,
     [ASPEED_DEV_TIMER1]    = 0x7E782000,
     [ASPEED_DEV_UART1]     = 0x7E783000,
     [ASPEED_DEV_UART2]     = 0x7E78D000,
@@ -79,12 +84,17 @@ static const int aspeed_soc_ast1030_irqmap[] = {
     [ASPEED_DEV_LPC]       = 35,
     [ASPEED_DEV_PECI]      = 38,
     [ASPEED_DEV_FMC]       = 39,
+    [ASPEED_DEV_ESPI]      = 42,
     [ASPEED_DEV_PWM]       = 44,
     [ASPEED_DEV_ADC]       = 46,
     [ASPEED_DEV_SPI1]      = 65,
     [ASPEED_DEV_SPI2]      = 66,
     [ASPEED_DEV_I2C]       = 110, /* 110 ~ 123 */
     [ASPEED_DEV_KCS]       = 138, /* 138 -> 142 */
+    [ASPEED_DEV_UDC]       = 9,
+    [ASPEED_DEV_SGPIOM]    = 51,
+    [ASPEED_DEV_JTAG0]     = 27,
+    [ASPEED_DEV_JTAG1]     = 53,
 };
 
 static qemu_irq aspeed_soc_ast1030_get_irq(AspeedSoCState *s, int dev)
@@ -155,6 +165,15 @@ static void aspeed_soc_ast1030_init(Object *obj)
     object_initialize_child(obj, "iomem", &s->iomem, TYPE_UNIMPLEMENTED_DEVICE);
     object_initialize_child(obj, "sbc-unimplemented", &s->sbc_unimplemented,
                             TYPE_UNIMPLEMENTED_DEVICE);
+    object_initialize_child(obj, "pwm", &s->pwm, TYPE_UNIMPLEMENTED_DEVICE);
+    object_initialize_child(obj, "espi", &s->espi, TYPE_UNIMPLEMENTED_DEVICE);
+    object_initialize_child(obj, "udc", &s->udc, TYPE_UNIMPLEMENTED_DEVICE);
+    object_initialize_child(obj, "sgpiom", &s->sgpiom,
+                            TYPE_UNIMPLEMENTED_DEVICE);
+    object_initialize_child(obj, "jtag[0]", &s->jtag[0],
+                            TYPE_UNIMPLEMENTED_DEVICE);
+    object_initialize_child(obj, "jtag[1]", &s->jtag[1],
+                            TYPE_UNIMPLEMENTED_DEVICE);
 }
 
 static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
@@ -337,6 +356,22 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
                     sc->memmap[ASPEED_DEV_GPIO]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_GPIO));
+
+    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->pwm), "aspeed.pwm",
+                                  sc->memmap[ASPEED_DEV_PWM], 0x100);
+
+    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->espi), "aspeed.espi",
+                                  sc->memmap[ASPEED_DEV_ESPI], 0x800);
+
+    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->udc), "aspeed.udc",
+                                  sc->memmap[ASPEED_DEV_UDC], 0x1000);
+    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->sgpiom), "aspeed.sgpiom",
+                                  sc->memmap[ASPEED_DEV_SGPIOM], 0x100);
+
+    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->jtag[0]), "aspeed.jtag",
+                                  sc->memmap[ASPEED_DEV_JTAG0], 0x20);
+    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->jtag[1]), "aspeed.jtag",
+                                  sc->memmap[ASPEED_DEV_JTAG1], 0x20);
 }
 
 static void aspeed_soc_ast1030_class_init(ObjectClass *klass, void *data)
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 8389200b2d..9a5e3c0bac 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -44,6 +44,7 @@
 #define ASPEED_CPUS_NUM  2
 #define ASPEED_MACS_NUM  4
 #define ASPEED_UARTS_NUM 13
+#define ASPEED_JTAG_NUM  2
 
 struct AspeedSoCState {
     /*< private >*/
@@ -87,6 +88,11 @@ struct AspeedSoCState {
     UnimplementedDeviceState video;
     UnimplementedDeviceState emmc_boot_controller;
     UnimplementedDeviceState dpmcu;
+    UnimplementedDeviceState pwm;
+    UnimplementedDeviceState espi;
+    UnimplementedDeviceState udc;
+    UnimplementedDeviceState sgpiom;
+    UnimplementedDeviceState jtag[ASPEED_JTAG_NUM];
 };
 
 #define TYPE_ASPEED_SOC "aspeed-soc"
@@ -174,6 +180,11 @@ enum {
     ASPEED_DEV_DPMCU,
     ASPEED_DEV_DP,
     ASPEED_DEV_I3C,
+    ASPEED_DEV_ESPI,
+    ASPEED_DEV_UDC,
+    ASPEED_DEV_SGPIOM,
+    ASPEED_DEV_JTAG0,
+    ASPEED_DEV_JTAG1,
 };
 
 qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int dev);
-- 
2.38.1

