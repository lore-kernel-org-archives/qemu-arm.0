Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FDA606A321
	for <qemu-arm@archiver.kernel.org>; Sat, 31 Oct 2026 14:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fufmAz6M
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xNAWi-0000wS-Bk; Sat, 31 Oct 2026 10:57:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovankhai97@gmail.com>)
 id 1xNARK-0008Pu-3z
 for qemu-arm@nongnu.org; Sat, 31 Oct 2026 10:52:18 -0400
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dovankhai97@gmail.com>)
 id 1xNARF-0006aL-V7
 for qemu-arm@nongnu.org; Sat, 31 Oct 2026 10:52:12 -0400
Received: by mail-dy1-x132d.google.com with SMTP id
 5a478bee46e88-36a0f27c9f4so2895141eec.1
 for <qemu-arm@nongnu.org>; Sat, 31 Oct 2026 07:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793458328; x=1794063128; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zxz7IR9SbTS+cf6Io66Vcw/XVN1Qt6OTxJHymoEYyL8=;
 b=fufmAz6Mf5bjrQugW8JnKDLisc8NOldnvJs2uXlDNepj8zSgQrYTzM0e5o+voXW2q7
 hhwrvgOa//Aqa7Z+8uGjLhhuBa/ZUQzvR1D5n4YBBpmOJ7UR0sjM94HAIWcv5P5ReVKs
 G+Hf6SZRmiA1uifiGLaX0+Xg+rAXcRPUkiWRUQUG5+zkLanKnw4GvOZkqRLT49nWH5R7
 X4f6P0w95qZUPiwYSJ8AU5DyfADKCvXsNfASFo/6znKL+isKtZ3jOCf/t/OtEAS+Ol+J
 5OlCTBcERBzlYhhXsQVbQ+GvbQDa+uG6r2xhqKR6PFCUooz4lU2rceSMtLWRDDA59LgC
 BYcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793458328; x=1794063128;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=zxz7IR9SbTS+cf6Io66Vcw/XVN1Qt6OTxJHymoEYyL8=;
 b=qDH9F4Z3XjDtcGlBZpXcYdqUZPv5TtcesIrdMEKtQ5pa08ppBn+1nY2FF8gD/3hnzN
 fLd64qtkMRyJGgdB7AxXUFKKaSZldfLTn0TnfXmIvlYBqqeaiJudASl8ZizF1KkfObuI
 s/kyWrjIn9lOUtaHpoJCntkatBmginAGcZ+SIwkr3Y9zNMZJ1WlrrsHOZrLfhUzUX/9Q
 YWTPZZlNdqelfHpWV1u6egW0425haZAPly0k8GEprtkn4RB1VaNPuSygYeVCVrMA2P6m
 pplBwZ3oxVNdMT12B662SwifopjEHRCvWgYOS8QBTeJrl3ExQU0mDG9VN5ZZtOKWF+H2
 A+Pg==
X-Gm-Message-State: AFq9FYLHrGEYZxb57FCdIRpyKA+1jIIXHR131dfeqVvD2rEbZ8QLxznQ
 7/dyN8J4HW4F07usFvylqatCH5bsqVi0XHJiwoF6XyukXXKSV4kkk40K0eJW/y1l
X-Gm-Gg: AYBFou0zCq5n48H+QWKmL8SmNgTDRnvrxhg++LjHnUh2ZSx/jE02A+dbUBOnAXV6qCq
 jnKozWICdmEWGzumQ2GYL+O7AxI4ofRwd3pS9k4uh/KGMI2Imy760BxwvxWyDj79WtSqZKax51S
 gTbO5F3VLCLGB26JIS/7KulGNR+qzE/2FnLVdzMuvRrHlbxOJhxoP8AqePOBjCrXG31fNMMcNPu
 4rgdgpm1PY0fMB/Kq/uLzwNZ7QOOWaH4xCRFGKNuHRoMOJAGzUb3tBe/r+c3XpxMTyEsY2fFsV+
 n3P2QhZjJleNKx7HmQo5/uphfTosqnqULI1VI+nsh39qxA5ojSiIIa3Jjph6ixgXNRM2/EMuYfM
 YVA7q3qb5R3XeppMlvzchIKhpa+VYPRPgM3kNPZdC/bGeGU+eo5ayRwFf/q15v9QwVeJdzj3SkM
 d2r62nsXlstMfvQt2QzFdKKskrFYqhQt1S+EK0hRVVpEOPP2k0NQy4RwvotQaqvNPigGY17JeIP
 wxhezZiDdbeDmUFpn53OcRpqd1kz+qKGMn4A3Dv7xYCrb0gBM3p3tXWZokXHxp8amLZUpN8CRrn
 cufgkNhTB9/zgYFypoPpeCruSzxXIWD6
X-Received: by 2002:a05:7301:7306:b0:369:38e3:5363 with SMTP id
 5a478bee46e88-36a4234586bmr7146890eec.7.1793458327938; 
 Sat, 31 Oct 2026 07:52:07 -0700 (PDT)
Received: from ubuntu.lan ([2405:4802:913e:86f0:fc32:76b2:b6d6:a3f6])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36a428c17bdsm17541006eec.6.2026.10.31.07.52.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 07:52:07 -0700 (PDT)
From: Khai Do <dovankhai97@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com,
 strahinja.p.jankovic@gmail.com, Khai Do <dovankhai97@gmail.com>
Subject: [PATCH 5/5] hw/arm/allwinner-h618: Connect Allwinner SID controller
Date: Sat, 31 Oct 2026 21:51:47 +0700
Message-ID: <20261031145147.32683-6-dovankhai97@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261031145147.32683-1-dovankhai97@gmail.com>
References: <20261031145147.32683-1-dovankhai97@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::132d;
 envelope-from=dovankhai97@gmail.com; helo=mail-dy1-x132d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 31 Oct 2026 10:57:32 -0400
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Wire up the Allwinner Security ID (SID) eFuse controller into the
H618 SoC model:
- Map SID MMIO registers at 0x03006000 with 512 bytes capacity
- Remove sid from unimplemented peripheral list
- Configure default fixed SID identifier in Orange Pi Zero 2W machine
- Select ALLWINNER_SID in Kconfig

Signed-off-by: Khai Do <dovankhai97@gmail.com>
---
 hw/arm/Kconfig                  |  1 +
 hw/arm/allwinner-h618.c         | 11 ++++++++++-
 hw/arm/orangepi-zero2w.c        |  8 ++++++++
 include/hw/arm/allwinner-h618.h |  3 +++
 4 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 21480e277d..a1c09272fd 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -339,6 +339,7 @@ config ALLWINNER_H618
     default y if TCG && AARCH64
     select SERIAL_MM
     select ARM_GIC
+    select ALLWINNER_SID
     select UNIMP
 
 config MAX78000_SOC
diff --git a/hw/arm/allwinner-h618.c b/hw/arm/allwinner-h618.c
index 59e0196fc6..2135df78e7 100644
--- a/hw/arm/allwinner-h618.c
+++ b/hw/arm/allwinner-h618.c
@@ -29,6 +29,7 @@ const hwaddr allwinner_h618_memmap[] = {
     [AW_H618_DEV_GIC_CPU]  = 0x03022000,
     [AW_H618_DEV_GIC_HYP]  = 0x03024000,
     [AW_H618_DEV_GIC_VCPU] = 0x03026000,
+    [AW_H618_DEV_SID]      = 0x03006000,
     [AW_H618_DEV_UART0]    = 0x05000000,
     [AW_H618_DEV_UART1]    = 0x05000400,
     [AW_H618_DEV_UART2]    = 0x05000800,
@@ -44,7 +45,6 @@ static const struct AwH618Unimplemented {
 } unimplemented[] = {
     { "ccu",       0x03001000, 4 * KiB },
     { "dma",       0x03002000, 4 * KiB },
-    { "sid",       0x03006000, 4 * KiB },
     { "smc",       0x03007000, 4 * KiB },
     { "timer",     0x03009000, 4 * KiB },
     { "pwm",       0x0300a000, 4 * KiB },
@@ -91,6 +91,10 @@ static void allwinner_h618_init(Object *obj)
     }
 
     object_initialize_child(obj, "gic", &s->gic, TYPE_ARM_GIC);
+
+    object_initialize_child(obj, "sid", &s->sid, TYPE_AW_SID);
+    object_property_add_alias(obj, "identifier", OBJECT(&s->sid),
+                              "identifier");
 }
 
 static void allwinner_h618_realize(DeviceState *dev, Error **errp)
@@ -172,6 +176,11 @@ static void allwinner_h618_realize(DeviceState *dev, Error **errp)
                                             ppibase + AW_H618_GIC_PPI_MAINT));
     }
 
+    /* Security Identifier */
+    qdev_prop_set_uint32(DEVICE(&s->sid), "size", 512);
+    sysbus_realize(SYS_BUS_DEVICE(&s->sid), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sid), 0, s->memmap[AW_H618_DEV_SID]);
+
     /* SRAM */
     memory_region_init_ram(&s->sram_a1, OBJECT(dev), "sram A1",
                            64 * KiB, &error_abort);
diff --git a/hw/arm/orangepi-zero2w.c b/hw/arm/orangepi-zero2w.c
index fe87a98efc..1cc9ad7ba6 100644
--- a/hw/arm/orangepi-zero2w.c
+++ b/hw/arm/orangepi-zero2w.c
@@ -40,6 +40,14 @@ static void orangepi_zero2w_init(MachineState *machine)
     object_property_add_child(OBJECT(machine), "soc", OBJECT(h618));
     object_unref(OBJECT(h618));
 
+    /* Setup SID properties. Currently using a default fixed SID identifier. */
+    if (qemu_uuid_is_null(&h618->sid.identifier)) {
+        qdev_prop_set_string(DEVICE(h618), "identifier",
+                             "03006180-1111-2222-3333-000044556677");
+    } else if (ldl_be_p(&h618->sid.identifier.data[0]) != 0x03006180) {
+        warn_report("Security Identifier value does not include H618 prefix");
+    }
+
     /* Mark H618 object realized */
     qdev_realize(DEVICE(h618), NULL, &error_abort);
 
diff --git a/include/hw/arm/allwinner-h618.h b/include/hw/arm/allwinner-h618.h
index e1b7162759..d4c3d19725 100644
--- a/include/hw/arm/allwinner-h618.h
+++ b/include/hw/arm/allwinner-h618.h
@@ -11,6 +11,7 @@
 
 #include "qom/object.h"
 #include "hw/intc/arm_gic.h"
+#include "hw/misc/allwinner-sid.h"
 #include "target/arm/cpu.h"
 
 /**
@@ -23,6 +24,7 @@ enum {
     AW_H618_DEV_GIC_CPU,
     AW_H618_DEV_GIC_HYP,
     AW_H618_DEV_GIC_VCPU,
+    AW_H618_DEV_SID,
     AW_H618_DEV_UART0,
     AW_H618_DEV_UART1,
     AW_H618_DEV_UART2,
@@ -50,6 +52,7 @@ struct AwH618State {
     ARMCPU cpus[AW_H618_NUM_CPUS];
     const hwaddr *memmap;
     GICState gic;
+    AwSidState sid;
     MemoryRegion sram_a1;
     MemoryRegion sram_a2;
 };
-- 
2.43.0


