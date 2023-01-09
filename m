Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2203262ejc;
        Mon, 9 Jan 2023 04:17:07 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvLDD4TQkKqVwPqWcVFitxCP0XdJRj3YrnmOjmVKZOH/BBiwPiRSR9UzIST87a83O+upX+p
X-Received: by 2002:a05:6214:3b05:b0:4bb:8e32:93c9 with SMTP id nm5-20020a0562143b0500b004bb8e3293c9mr91599398qvb.25.1673266627143;
        Mon, 09 Jan 2023 04:17:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673266627; cv=none;
        d=google.com; s=arc-20160816;
        b=T+fqCz8zCdNNTCpvMbyiwg3t4xGMbiM/aTFSZJK4oHcHvd+NOA+EV+ir1sRsl22mQK
         JJPiRxPRr3wpZ273luHhwLuCzGGPk+cc5cAI1X5BqpSazS542SzNErQFVD0BJrYztvQo
         WukswUIXxSOhQPpRwyjYEM6TdqbQLryVxuG/J8ciYGANJFSBZ/8sSGVhztGQo2s4Z3cI
         qmTRKDhBxb2X/pPL7mZIiHGMns+AzApryKLL5W1TxH3b4abiSjbuyyttu3uO62OgiO0N
         gzsQHnozsEuqDuUFp5R+JU/5hdsQi8mAO8awLgGnxxB05GzbA6VygcF0ZArvlHiJANOw
         EF1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=kABC6Dg8afXn22QWktdCfTPtG/Bv98gX9IL+lt9WyQQ=;
        b=gijzi4wqzBcq0QjSRnm+aWjf9fr9xEgnjAQedtXeLkcLlZL7shHp8SpAArb5YtJBpV
         cNhh9SnW0O6K5OUm94t1Ao+s63i2QN0GIo66aPg0ti7DN5qEc+cFibAEMfK9HA9UcGuN
         RTz6QEJTVb5YJpKira116AK2wHtIDhPPqS3rWVlgTbeRs3zoC8pTP154wv/dmzzlDdjj
         UqJXFcNF59qn4ERfbaogrUGGHXD8/YoGKliCXMnd4RIcGmJFob6asjxNO3zHPpZDSdW1
         zUS4H8HI2IY+mZmyrDRkuvs9/bUOA0MRg9oDcLEI5TFvUPwFv7WiFBhgGRfR5AzMvMO8
         q9+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MpY4iZiX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pn8-20020a056214130800b00531d9d2fbc7si4533166qvb.154.2023.01.09.04.17.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 04:17:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MpY4iZiX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pEqih-0002sT-Je; Mon, 09 Jan 2023 06:53:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqid-0002rc-Fk
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 06:53:35 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqib-00082W-NK
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 06:53:35 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 k26-20020a05600c1c9a00b003d972646a7dso8780160wms.5
 for <qemu-arm@nongnu.org>; Mon, 09 Jan 2023 03:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kABC6Dg8afXn22QWktdCfTPtG/Bv98gX9IL+lt9WyQQ=;
 b=MpY4iZiX5WIaoEoozJxdF8cC26tBpsQTe6o+9CeNBtAyqsEBH1emKIrLxEM+A8qBBw
 QyHaQUQBSRie0wFHpyW+VKScOudKrvYGYqLsAuRksLZOJW0P51NGY8IbaTeZ62npMLXS
 LNOo6JNc4fxZr7Mc23wmUr7x0O16A/ldOp5f3VwLM/MfTy0TWi6A1m20kN1O2kddPNEB
 FetHlSO5ayv7NSwc5OqG6yThPjgMWdmMe3/FvIlDX4OUWWR0+Q3lzTik74w5xtLeDBjK
 i6O/NixQs7CvhX24quiwoAnDde6cMqCW4DstQk8V9ZQHjPsus115ytlwQ8mJHIgTAtgq
 3hIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kABC6Dg8afXn22QWktdCfTPtG/Bv98gX9IL+lt9WyQQ=;
 b=WfA/FpD3akRxvw7z86dnYIKiDFhirnnS6K60waTYexC9PK1AMSYg9LHZVNQswSkGvA
 Xdh2FJFB90ioBT3Bzt9rWPug0x+Q2BYkyIcdQc5c9Lu+Av6GEGxECgi8pmI9y5ZZ2dzz
 kDHGyDta6lBXEYZun+2mVJ8fKrVrShYLW2POns+7tVIS3p5SDJ5wG9nYk7QGcZEuzR/b
 SiSSEESPT6b2XIVePWOVwdI2i5X9Kr/DXcEoV+pSuLy4mT0g8ZZNGnVkSwmF0q5THwkv
 +RTn9G7xSh0kAXNjiVpZwTb4h58HBMWyKehE25x0SRvU7QprXeuNOVYpi9IImjC2XOQ0
 0VEQ==
X-Gm-Message-State: AFqh2kr0+ILpM7NpO1ON/PZv6CiXvmltvVGCuLtEYHGljbDAM9qlQdI2
 FhXvWxbbB1BBFiWhgP/OMAlUXQ==
X-Received: by 2002:a05:600c:4fcf:b0:3d1:d396:1ade with SMTP id
 o15-20020a05600c4fcf00b003d1d3961ademr45806891wmq.9.1673265212398; 
 Mon, 09 Jan 2023 03:53:32 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 f28-20020a05600c491c00b003d9bd56e9c1sm10568247wmp.11.2023.01.09.03.53.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 03:53:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 03/13] hw/arm/collie: Use the IEC binary prefix definitions
Date: Mon,  9 Jan 2023 12:53:06 +0100
Message-Id: <20230109115316.2235-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109115316.2235-1-philmd@linaro.org>
References: <20230109115316.2235-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
X-TUID: HGIEdJrqXl3h

IEC binary prefixes ease code review: the unit is explicit.

Add definitions for RAM / Flash / Flash blocksize.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/collie.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/hw/arm/collie.c b/hw/arm/collie.c
index 8df31e2793..d59c376e60 100644
--- a/hw/arm/collie.c
+++ b/hw/arm/collie.c
@@ -20,6 +20,10 @@
 #include "cpu.h"
 #include "qom/object.h"
 
+#define RAM_SIZE            (512 * MiB)
+#define FLASH_SIZE          (32 * MiB)
+#define FLASH_SECTOR_SIZE   (64 * KiB)
+
 struct CollieMachineState {
     MachineState parent;
 
@@ -31,7 +35,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(CollieMachineState, COLLIE_MACHINE)
 
 static struct arm_boot_info collie_binfo = {
     .loader_start = SA_SDCS0,
-    .ram_size = 0x20000000,
+    .ram_size = RAM_SIZE,
 };
 
 static void collie_init(MachineState *machine)
@@ -52,14 +56,14 @@ static void collie_init(MachineState *machine)
     memory_region_add_subregion(get_system_memory(), SA_SDCS0, machine->ram);
 
     dinfo = drive_get(IF_PFLASH, 0, 0);
-    pflash_cfi01_register(SA_CS0, "collie.fl1", 0x02000000,
+    pflash_cfi01_register(SA_CS0, "collie.fl1", FLASH_SIZE,
                     dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                    64 * KiB, 4, 0x00, 0x00, 0x00, 0x00, 0);
+                    FLASH_SECTOR_SIZE, 4, 0x00, 0x00, 0x00, 0x00, 0);
 
     dinfo = drive_get(IF_PFLASH, 0, 1);
-    pflash_cfi01_register(SA_CS1, "collie.fl2", 0x02000000,
+    pflash_cfi01_register(SA_CS1, "collie.fl2", FLASH_SIZE,
                     dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                    64 * KiB, 4, 0x00, 0x00, 0x00, 0x00, 0);
+                    FLASH_SECTOR_SIZE, 4, 0x00, 0x00, 0x00, 0x00, 0);
 
     sysbus_create_simple("scoop", 0x40800000, NULL);
 
@@ -75,7 +79,7 @@ static void collie_machine_class_init(ObjectClass *oc, void *data)
     mc->init = collie_init;
     mc->ignore_memory_transaction_failures = true;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("sa1110");
-    mc->default_ram_size = 0x20000000;
+    mc->default_ram_size = RAM_SIZE;
     mc->default_ram_id = "strongarm.sdram";
 }
 
-- 
2.38.1

