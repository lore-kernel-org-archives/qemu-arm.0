Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C45C4CD342D
	for <qemu-arm@archiver.kernel.org>; Thu, 13 Nov 2025 00:45:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vJLRl-0000Eg-6S; Wed, 12 Nov 2025 19:44:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3vCkVaQYKCLMrnUbgsZhhZeX.VhfjXfn-TkfghgZgn.hkZ@flex--yubinz.bounces.google.com>)
 id 1vJLRA-0008Dy-Ed
 for qemu-arm@nongnu.org; Wed, 12 Nov 2025 19:43:54 -0500
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3vCkVaQYKCLMrnUbgsZhhZeX.VhfjXfn-TkfghgZgn.hkZ@flex--yubinz.bounces.google.com>)
 id 1vJLR8-0006Mh-R6
 for qemu-arm@nongnu.org; Wed, 12 Nov 2025 19:43:44 -0500
Received: by mail-pl1-x649.google.com with SMTP id
 d9443c01a7336-29557f43d56so2843975ad.3
 for <qemu-arm@nongnu.org>; Wed, 12 Nov 2025 16:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1762994620; x=1763599420; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=5Kxuh89ZbVpuBnK0iNS17A8q7q9Tk7IbRw3pGfio+9k=;
 b=G7iimJhAqRvBA6Q0N2HUUeu+jlO3j5anznhv3ytFcI23YH9r6AMJSQJUjw1a3hUNqc
 GOc8JWIBAp7J3qkFcrRt6VtX7s4uHd3eDZK5P+ua185C2EV+i4DNLoHlsK0gSya7bJuq
 hqrf4mXXLvbmO/BzePyB21v+D0Wf9Yk9nHQ9b0o0DuoAaKxVXBnCXSLSjcoOrMZbQCpC
 yMljjaEilBXBnwpj9UDkURcR8yeUGwTWFtfs9BR6DV3FU9vKv8is6W5AWAGP1/YPrfdF
 iWIw+RDtvimFDLReEEfxegh5dx+tRph8jR/D+glrAugkXswJI45S0g7HzeQCQoghsaY1
 wvYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762994620; x=1763599420;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5Kxuh89ZbVpuBnK0iNS17A8q7q9Tk7IbRw3pGfio+9k=;
 b=uqaN6wQuvnim7Cdd7ZUez955eWhuTILjBOQFlDWbb0qhLHNljVvH+LlsDI7W+JyX19
 Gp9A32SyxFiAIQzgvauoaUYJbR0Fu2vpmt7kDeWV/6PXMS/ctezGIsRSebaGncUK9mMH
 noXgdGBX86q/LcAfRem8FDBeqfEzCOp6dOk0lVez2KHU+d8RoDlNObPHLYIm/z/sFsrH
 O8MHnseWPtbCYY/myhup8Le26UK28RlUMR1jSejpucF7BPXYhXK+0eIiM8IQ61jcUkt4
 EXl9PMvFJJDGc1uUOJ4izGgPx1rt+lPNbBfNfErOtQk0w3tML0sOnEIiIMfR79ChQlXB
 j/pQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMrVUQUZuZdJZbBjvYH4bc2VqLT1oaN5QF4fzzsSz0ZiweyVbd1sTqj9/KbI6TVcm5Y3Hq06HORQ==@nongnu.org
X-Gm-Message-State: AOJu0Yx1+XWWBAnlUOOdsSWNgqJAbJQKxteI0FKf3Aj6Naypwtu20V+v
 MTCWPig9aFWqXXJoJur19h9ZOXYF/YAX04f1qHZM+ml+xffbhq7zZujxayoCgmt6tEZcmTFRawM
 MFc1Y7A==
X-Google-Smtp-Source: AGHT+IH5pubLGjohaJx3y6zzgyU2Sg/949CuKLf5/uizcPtfpU7HTbgnwVH6iLbdPy9HSUTocu0W7Y64eGM=
X-Received: from dlnn26.prod.google.com ([2002:a05:7022:619a:b0:11a:45fb:3026])
 (user=yubinz job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:286:b0:298:8ec:9993
 with SMTP id d9443c01a7336-2984edc8d47mr64303805ad.38.1762994620629; Wed, 12
 Nov 2025 16:43:40 -0800 (PST)
Date: Thu, 13 Nov 2025 00:43:28 +0000
In-Reply-To: <20251113-quanta-q71l-eeproms-v2-0-e72451b974b0@google.com>
Mime-Version: 1.0
References: <20251113-quanta-q71l-eeproms-v2-0-e72451b974b0@google.com>
X-Mailer: b4 0.14.2
Message-ID: <20251113-quanta-q71l-eeproms-v2-1-e72451b974b0@google.com>
Subject: [PATCH v2 1/3] hw/nvram: Add a new auxiliary function to init at24c
 eeprom
From: Yubin Zou <yubinz@google.com>
To: qemu-devel@nongnu.org
Cc: "=?utf-8?q?C=C3=A9dric_Le_Goater?=" <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org,
 Yubin Zou <yubinz@google.com>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="utf-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::649;
 envelope-from=3vCkVaQYKCLMrnUbgsZhhZeX.VhfjXfn-TkfghgZgn.hkZ@flex--yubinz.bounces.google.com;
 helo=mail-pl1-x649.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Hao Wu <wuhaotsh@google.com>

In NPCM7xx boards, at24c eeproms are backed by drives. However,
these drives use unit number as unique identifier. So if we
specify two drives with the same unit number, error will occured:
`Device with id 'none85' exists`.

Instead of using i2c address as unit number, we now assign unique
unit numbers for each eeproms in each board. This avoids conflict
in providing multiple eeprom contents with the same address.

We add an auxiliary function in the at24c eeprom module for this.
This allows it to easily add at24c eeprom to non-nuvoton boards
like aspeed as well.

Change-Id: I2f056cc0507d39164335a03bc18b5c94015b4b11
Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 hw/nvram/eeprom_at24c.c         | 17 +++++++++++++++++
 include/hw/nvram/eeprom_at24c.h |  4 ++++
 2 files changed, 21 insertions(+)

diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
index 82ea97e552a15c8bcd38e38939b53545b01ad273..8542ca2b037d6e896c7b394e7ff4b6ec27297ad7 100644
--- a/hw/nvram/eeprom_at24c.c
+++ b/hw/nvram/eeprom_at24c.c
@@ -17,6 +17,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
 #include "system/block-backend.h"
+#include "system/blockdev.h"
 #include "qom/object.h"
 
 /* #define DEBUG_AT24C */
@@ -264,3 +265,19 @@ static void at24c_eeprom_register(void)
 }
 
 type_init(at24c_eeprom_register)
+
+void at24c_eeprom_init_one(I2CBus *i2c_bus, int bus, uint8_t addr,
+                           uint32_t rsize, int unit_number)
+{
+    I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
+    DeviceState *dev = DEVICE(i2c_dev);
+    BlockInterfaceType type = IF_NONE;
+    DriveInfo *dinfo;
+
+    dinfo = drive_get(type, bus, unit_number);
+    if (dinfo) {
+        qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo));
+    }
+    qdev_prop_set_uint32(dev, "rom-size", rsize);
+    i2c_slave_realize_and_unref(i2c_dev, i2c_bus, &error_abort);
+}
diff --git a/include/hw/nvram/eeprom_at24c.h b/include/hw/nvram/eeprom_at24c.h
index acb9857b2adddd1fe5a924652f6ebae13b674b66..fdac7c1c022f9f73307bb3ecf761caa732e999bc 100644
--- a/include/hw/nvram/eeprom_at24c.h
+++ b/include/hw/nvram/eeprom_at24c.h
@@ -36,4 +36,8 @@ I2CSlave *at24c_eeprom_init(I2CBus *bus, uint8_t address, uint32_t rom_size);
 I2CSlave *at24c_eeprom_init_rom(I2CBus *bus, uint8_t address, uint32_t rom_size,
                                 const uint8_t *init_rom, uint32_t init_rom_size);
 
+/* Init one at24c eeprom device */
+void at24c_eeprom_init_one(I2CBus *i2c_bus, int bus, uint8_t addr,
+                           uint32_t rsize, int unit_number);
+
 #endif

-- 
2.51.2.1041.gc1ab5b90ca-goog


