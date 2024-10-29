Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp106786njj;
        Tue, 29 Oct 2024 02:19:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW5JpDTgKV2qKLkUP+e+9w5br8+ZmXfql8Y+s4vKspG4dJzUMqkIqciPmPa+H81NYERp+yAiBwxl86nrg==@linaro.org
X-Google-Smtp-Source: AGHT+IGv3QrhC1oPViCTW4dmaroaLKSZ139lxOT8S0CNdrgP1In8zjHcZlfGlXqKtVwcLHAnqYIU
X-Received: by 2002:a05:620a:4110:b0:7b1:534b:5385 with SMTP id af79cd13be357-7b193f0bd6fmr1501758085a.37.1730193563388;
        Tue, 29 Oct 2024 02:19:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730193563; cv=none;
        d=google.com; s=arc-20240605;
        b=KhumYAN+ECCcVzpovHBdumX3M9+tQ5Zz9BP/nfLpf4D0hmEyJqhlJB1roia6+pAEH7
         Rhf1vWsm2jjHFt14gxTyRz89GYxrAj91jf2Z9+lQgY8kYF0Hcqs9yPLpdoySEZ8D21Fm
         V2YvoeubMMHYS6loSDrOwICK00bLQolVqHzyjXlkIm0fQ2cpieg3XttsuAbHI/ey2Ahw
         Z1cdBkYDfYgi/LEx7vELqO4GW51a46wnfiZ9/3BKvnvxnbyLCOLLz1FpjLZYtzMPFlOh
         vPClNp0U2E2du4TT4kzIsscdW55UK+JU5DclwRCGT1l0HuOfyicAU3FJT+FStY0B0le6
         FT3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=KMGW2OrpToXnlcz7PbYDNHJtZUo7wx5866teQTVm4PU=;
        fh=4rHsaFhVkVMXk5u1IVZO4usPBujjRbqK1KMv0eZ+6CI=;
        b=fqPocI6FW2ynfkPYK0b76c4mHAQd4bOMK21Gup2pEUiMeKG6vpc1CKfJSdypiV5W0/
         ccn38gGr1hPHmpD3VHDJxsoVbOCArIEgxcJ26CdWGI1CFD6XW6SeI0l8SeQvlTuntHMr
         10q6l234s45TVgGLGZjspQ8h0zYWT/FMWPQfc9Erdf7k0z7TcA/EQLB6zJ96xdeAUzFi
         1SeSFqy92AmEjcmNqQ3D/pwLYnMhTy3J4KG+hfj+FaUYeJMbo9do37Z4oC0iYUmQ5655
         owWSe6ArQdjJ43dq2K0Np9t4FSAgLiINTIRT/C33yiOwObDAzB11hA5xThPFcVV9PoUP
         v+og==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b18d291068si1030809885a.212.2024.10.29.02.19.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Oct 2024 02:19:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t5iMD-0000Ws-B1; Tue, 29 Oct 2024 05:17:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t5iMB-0000WE-0N; Tue, 29 Oct 2024 05:17:43 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t5iM9-0003A3-Iy; Tue, 29 Oct 2024 05:17:42 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 29 Oct
 2024 17:17:30 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 29 Oct 2024 17:17:30 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Bin Meng <bmeng.cn@gmail.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:SD (Secure Card)" <qemu-block@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v1 1/8] aspeed/soc: Support RTC for AST2700
Date: Tue, 29 Oct 2024 17:17:22 +0800
Message-ID: <20241029091729.3317512-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241029091729.3317512-1-jamin_lin@aspeedtech.com>
References: <20241029091729.3317512-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: JGhmHdAO6nDS

The RTC controller between AST2600 and AST2700 are identical. Add RTC model for
AST2700 RTC support. The RTC controller registers base address is start at
0x12C0_F000 and its alarm interrupt is connected to GICINT13.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/arm/aspeed_ast27x0.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index dca660eb6b..7ab4bec644 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -63,6 +63,7 @@ static const hwaddr aspeed_soc_ast2700_memmap[] = {
     [ASPEED_DEV_ADC]       =  0x14C00000,
     [ASPEED_DEV_I2C]       =  0x14C0F000,
     [ASPEED_DEV_GPIO]      =  0x14C0B000,
+    [ASPEED_DEV_RTC]       =  0x12C0F000,
 };
 
 #define AST2700_MAX_IRQ 288
@@ -376,6 +377,8 @@ static void aspeed_soc_ast2700_init(Object *obj)
 
     snprintf(typename, sizeof(typename), "aspeed.gpio-%s", socname);
     object_initialize_child(obj, "gpio", &s->gpio, typename);
+
+    object_initialize_child(obj, "rtc", &s->rtc, TYPE_ASPEED_RTC);
 }
 
 /*
@@ -670,6 +673,14 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_GPIO));
 
+    /* RTC */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->rtc), errp)) {
+        return;
+    }
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->rtc), 0, sc->memmap[ASPEED_DEV_RTC]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->rtc), 0,
+                       aspeed_soc_get_irq(s, ASPEED_DEV_RTC));
+
     create_unimplemented_device("ast2700.dpmcu", 0x11000000, 0x40000);
     create_unimplemented_device("ast2700.iomem0", 0x12000000, 0x01000000);
     create_unimplemented_device("ast2700.iomem1", 0x14000000, 0x01000000);
-- 
2.34.1

