Received: by 2002:a17:505:70c3:b0:1be9:327d:8ee3 with SMTP id lw3csp1101419njc;
        Mon, 30 Sep 2024 01:54:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWUSembOrzIQJrSwb7Rg6aCBzrRQvXnvFTP4eZOTGL+lQkBmZB8uLOth7Kk+l7S4lMbZjPRWhtQFEXA6g==@linaro.org
X-Google-Smtp-Source: AGHT+IGlzklaz3EiO6pUeJnDUQ3ao58IKi/5yh6fnAIjZ/ExpiCnd5Q6uILPNT7p+4bYwZ7HQtt7
X-Received: by 2002:a05:6214:5d8f:b0:6c5:50be:dd74 with SMTP id 6a1803df08f44-6cb3b64cb65mr170520786d6.45.1727686447569;
        Mon, 30 Sep 2024 01:54:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727686447; cv=none;
        d=google.com; s=arc-20240605;
        b=UoNtq3BDFNaY9sklVDuaV4RoYivPS27BTlqZQyyNmx2L8EhY8FFKEHx57VYBj/sdhH
         y5VcmGcGydxhznppbwhvqWmSRcmPGbFvnOW7vkHUkOSnh2Bnr8eQ4yS6vmZ+JhOARhNM
         z7gvRsmcFOigTUzlThpIlzKHDII9F0/wz3h/DXkC87NSsKYpcNJa5qwouHiHyBGlXj3L
         pI7Bti0fJ/vG2eUzsUh/1d+C2Xf3arrAk6skdxhwAdQ2fD9WkHcb1S3qZRIImEYhzcvH
         aViu33ZPvwrMRf1AquSRJ6pcenAoN4fcj4L2hKauP9WPhzW4Td8/tsxT9GiF4RQbRDnZ
         yAJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=P7X2P7xC7BUNyYbRFwZ6RF4khGRcXt4YfmazKdKTwfs=;
        fh=RdJersRTvVIU6GkG8yrSEUovA6vfgZWQMb4aw2HkXSs=;
        b=iEkNh6st//NSXumloNDL1Ao7lp6gzino85+fuEEkGVO0BI8KKOnTd61EzAVQ5vwbQl
         K8wX7knFKeDEabAfobA7q3yklMty8Z0RS9C1YIKDhEoM5WA921NWEgbqFLM2PMgEfjSd
         kc6PZQ5d1Bqxjr6WzTRjV3FHNX4NnkLs7deVc9IggAxlYdarCaBQraR6BjYxeMOdEB6I
         LHW0CoN7iwcQUl/UDQ1wkaATOiv92Q+p2cvIDht0IceL8soqI5Jv7W+Hd4QBsQw/DZQZ
         VCgyBFZxPzgZzzjQ9bqBkJeQc1et3aA5mOnJ4Yyymhsh7GWFNQ4GEZ0yDVvB8EXIIO6v
         yhlA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cb3b688a88si86509986d6.397.2024.09.30.01.54.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Sep 2024 01:54:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1svC9h-0004Hs-12; Mon, 30 Sep 2024 04:53:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1svC9K-0003FA-KN; Mon, 30 Sep 2024 04:52:59 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1svC9I-00025U-AZ; Mon, 30 Sep 2024 04:52:58 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 30 Sep
 2024 16:52:40 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 30 Sep 2024 16:52:40 +0800
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
Subject: [PATCH v6 3/8] hw/gpio/aspeed: Support different memory region ops
Date: Mon, 30 Sep 2024 16:52:34 +0800
Message-ID: <20240930085239.3089901-4-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240930085239.3089901-1-jamin_lin@aspeedtech.com>
References: <20240930085239.3089901-1-jamin_lin@aspeedtech.com>
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
X-TUID: j7eXv1ro88Nl

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

