Received: by 2002:a17:504:959a:b0:1be9:327d:8ee3 with SMTP id e26csp208879njl;
        Tue, 1 Oct 2024 07:12:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVvSP/iyLYRspjuo0JVTQ+zpGljCWHoXU1fxP2+w/OTMdPMBIXoIxOugjPNaeOSfyjKmmPYznLigFfo1A==@linaro.org
X-Google-Smtp-Source: AGHT+IEzGlAc9uhEhnCBko3PoEv7WC4mwQtVnEMU+tdwEAFmiF6KyJrwE53k7zjChvdqAjEFQ35W
X-Received: by 2002:a05:6214:458d:b0:6c7:c63f:b414 with SMTP id 6a1803df08f44-6cb3b6407b6mr266812606d6.33.1727791968569;
        Tue, 01 Oct 2024 07:12:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727791968; cv=none;
        d=google.com; s=arc-20240605;
        b=BmtyWTbAOj3FVqdJVa180605lnV8s7yyXdKZwqHhznq276R3SrxRCIKJeBgo7KdAcA
         +B7sJwlDbXSJ+89aj+WM1V/OdBCWEOSybDQVDm1G0Dt6pw/gSw/9bt78t0r0QuAkZ4VH
         MzDynvbzmO0jutnTva+IB99j/2ivVnCWIMJf7X2/Lz27P7lgtB7fd2dUyS1gH7/4XTC5
         KARuTaYbqHVQGdAQXxBaJ3lTWld8bRPRJhdTs9BlShLHOw8k2UFzSijEd7LyaEuly7yB
         KoAjs9pY0FxaNvKDCJ7TPPaIZGZ2zS8i/tPFwyFJXfv1x5G3KEfWdLHfuyxmjxRe3Pi1
         9w2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=P7X2P7xC7BUNyYbRFwZ6RF4khGRcXt4YfmazKdKTwfs=;
        fh=RdJersRTvVIU6GkG8yrSEUovA6vfgZWQMb4aw2HkXSs=;
        b=lvB5fTqoultM975h1TYKAZHMgbBQWxjs2/h80Xapawdo5HH1sgZLbs8qfofMDg+1Qb
         FyYgh63O2dUHaA9mJqyeezVD46U2SN5VAPoGgnCJemVPRoxfe5pd+mM1YuwDsjLXYuGA
         m+R4kzuP82QzCx55mgaVHFqtSarR4ZX3LdO3vdCB7go8WlQW4iEGCjFjwST/eLA+DBnT
         J2sItwbJ/G6vFvwaKFvYzqZ+W7lpeULqliHPa3GUD7koVzvjzbOr4yZkQyRajVFoulwn
         gsvD2NiYRqg9aPtxDPhdOA3/OYYAV/YfTAEwkVSmbNH7bG9nW5nVR0XCFkWkoLZSzMfl
         1fNw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45c9f2c0823si104308411cf.225.2024.10.01.07.12.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Oct 2024 07:12:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1svdbd-0007Rn-6V; Tue, 01 Oct 2024 10:12:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1svdbb-0007Qi-8v; Tue, 01 Oct 2024 10:11:59 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1svdbX-0002zy-0F; Tue, 01 Oct 2024 10:11:57 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 1 Oct
 2024 10:43:35 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 1 Oct 2024 10:43:35 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
 <clg@redhat.com>
Subject: [PATCH v7 3/8] hw/gpio/aspeed: Support different memory region ops
Date: Tue, 1 Oct 2024 10:43:29 +0800
Message-ID: <20241001024334.834807-4-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241001024334.834807-1-jamin_lin@aspeedtech.com>
References: <20241001024334.834807-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Xi34D8VuqFlh

It set "aspeed_gpio_ops" struct which containing read and write callbacks
to be used when I/O is performed on the GPIO region.

Besides, in the previous design of ASPEED SOCs, one register is used for
setting one function for 32 GPIO pins.
ex: GPIO000 is used for setting data value for GPIO A, B, C and D in AST2600.
ex: GPIO004 is used for setting direction for GPIO A, B, C and D in AST2600.

However, the register set have a significant change in AST2700.
Each GPIO pin has their own control register. In other words, users are able to
set one GPIO pin’s direction, interrupt enable, input mask and so on
in one register. The aspeed_gpio_read/aspeed_gpio_write callback functions
are not compatible AST2700.

Introduce a new "const MemoryRegionOps *" attribute in AspeedGPIOClass and
use it in aspeed_gpio_realize function.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/gpio/aspeed_gpio.c         | 7 ++++++-
 include/hw/gpio/aspeed_gpio.h | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index 564459ad4f..8725606aec 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -1046,7 +1046,7 @@ static void aspeed_gpio_realize(DeviceState *dev, Error **errp)
         }
     }
 
-    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_gpio_ops, s,
+    memory_region_init_io(&s->iomem, OBJECT(s), agc->reg_ops, s,
                           TYPE_ASPEED_GPIO, agc->mem_size);
 
     sysbus_init_mmio(sbd, &s->iomem);
@@ -1131,6 +1131,7 @@ static void aspeed_gpio_ast2400_class_init(ObjectClass *klass, void *data)
     agc->reg_table = aspeed_3_3v_gpios;
     agc->reg_table_count = GPIO_3_3V_REG_ARRAY_SIZE;
     agc->mem_size = 0x1000;
+    agc->reg_ops = &aspeed_gpio_ops;
 }
 
 static void aspeed_gpio_2500_class_init(ObjectClass *klass, void *data)
@@ -1143,6 +1144,7 @@ static void aspeed_gpio_2500_class_init(ObjectClass *klass, void *data)
     agc->reg_table = aspeed_3_3v_gpios;
     agc->reg_table_count = GPIO_3_3V_REG_ARRAY_SIZE;
     agc->mem_size = 0x1000;
+    agc->reg_ops = &aspeed_gpio_ops;
 }
 
 static void aspeed_gpio_ast2600_3_3v_class_init(ObjectClass *klass, void *data)
@@ -1155,6 +1157,7 @@ static void aspeed_gpio_ast2600_3_3v_class_init(ObjectClass *klass, void *data)
     agc->reg_table = aspeed_3_3v_gpios;
     agc->reg_table_count = GPIO_3_3V_REG_ARRAY_SIZE;
     agc->mem_size = 0x800;
+    agc->reg_ops = &aspeed_gpio_ops;
 }
 
 static void aspeed_gpio_ast2600_1_8v_class_init(ObjectClass *klass, void *data)
@@ -1167,6 +1170,7 @@ static void aspeed_gpio_ast2600_1_8v_class_init(ObjectClass *klass, void *data)
     agc->reg_table = aspeed_1_8v_gpios;
     agc->reg_table_count = GPIO_1_8V_REG_ARRAY_SIZE;
     agc->mem_size = 0x800;
+    agc->reg_ops = &aspeed_gpio_ops;
 }
 
 static void aspeed_gpio_1030_class_init(ObjectClass *klass, void *data)
@@ -1179,6 +1183,7 @@ static void aspeed_gpio_1030_class_init(ObjectClass *klass, void *data)
     agc->reg_table = aspeed_3_3v_gpios;
     agc->reg_table_count = GPIO_3_3V_REG_ARRAY_SIZE;
     agc->mem_size = 0x1000;
+    agc->reg_ops = &aspeed_gpio_ops;
 }
 
 static const TypeInfo aspeed_gpio_info = {
diff --git a/include/hw/gpio/aspeed_gpio.h b/include/hw/gpio/aspeed_gpio.h
index 8cd2ff5496..e1e6c54333 100644
--- a/include/hw/gpio/aspeed_gpio.h
+++ b/include/hw/gpio/aspeed_gpio.h
@@ -77,6 +77,7 @@ struct AspeedGPIOClass {
     const AspeedGPIOReg *reg_table;
     unsigned reg_table_count;
     uint64_t mem_size;
+    const MemoryRegionOps *reg_ops;
 };
 
 struct AspeedGPIOState {
-- 
2.34.1

