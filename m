Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp783675wru;
        Sat, 11 Aug 2018 02:09:36 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwFDe04VwtjmIpU0IKJT4ngYnraNYAgk6EnlWF/f579hIUITJJVkWIDjpJOIusjPFslk+IR
X-Received: by 2002:aed:235a:: with SMTP id i26-v6mr9446183qtc.382.1533978576733;
        Sat, 11 Aug 2018 02:09:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533978576; cv=none;
        d=google.com; s=arc-20160816;
        b=i9/mftc52Yfbjlm/OvBnCRkcBYHSPszYHSvLPMWr+yUQHSgZfqf53q5NUE6ERNEdK7
         H/G4NY1XcZjQy74pvdkoboyXeZy8YRSr+YQ+4aXHFskaIMppl8fERYpXfaSWmYAOkz2o
         2ZpsMBFs7u/7k2rUvQyToEKd8/D0ND7kdoQBg4mHpd5slPAPXStsAxlf6FjhQbSjwkEM
         FX4H7zljMmqZR+HIQEzAKXvHHJ+n/A5rRmiZqsG876TmvqUNKH/FODuzDWnMqTJDwjSc
         N4WUEQSQSy0x7lVEYM1er8R0M0b1IXSsSWYQ3jGYxNe6bOZVKux5f5ZaBkifVhg9K1Bx
         Ac8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=IQtJCzsKm9wkLR9igz8thms+AQxrY3XzqkPIASW9IGo=;
        b=kvbO15G5UDmtholuGStD1fF2vlMYRHRXtXrLBZO80ZyQRYF1yO2TdrSXQXD7+z0cPr
         9aJlRtmN6GBvhGVe2YwWxFTUUgCsDL8nnX2OCOVD1W1TnOlIC0cv8+YU28Yne7gTYqKr
         kKrDP4Lu11LqOHiMyUSLNx4baeBR/PFR8yerDO420D430vCs/1Tlo60PKCxwr4AWBfDa
         gQtUCHX4Cmcu9WGCwa4FcMlRmTySpyfdR74//1mMCSltQF6IYcC/wTY0IhgLdZKGZBrS
         jW8mj+8vSSYTZ9okoav0EU2aLW3g01gG3sLhl/mOg9C+hqV9u9ajnL+0472f4cHqIjFV
         tq2w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m27-v6si9152851qtm.216.2018.08.11.02.09.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 11 Aug 2018 02:09:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59367 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1foPtw-0006II-4p
	for alex.bennee@linaro.org; Sat, 11 Aug 2018 05:09:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55001)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>) id 1foPtA-0005sj-Bt
	for qemu-arm@nongnu.org; Sat, 11 Aug 2018 05:08:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>) id 1foPt8-0001CR-KG
	for qemu-arm@nongnu.org; Sat, 11 Aug 2018 05:08:48 -0400
Received: from steffen-goertz.de ([88.198.119.201]:34686)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>)
	id 1foPt8-0001BC-9l; Sat, 11 Aug 2018 05:08:46 -0400
Received: from localhost.localdomain (tmo-080-6.customers.d1-online.com
	[80.187.80.6])
	by steffen-goertz.de (Postfix) with ESMTPSA id B4BB94BBB1;
	Sat, 11 Aug 2018 11:05:37 +0200 (CEST)
From: =?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>
To: qemu-devel@nongnu.org
Date: Sat, 11 Aug 2018 11:08:32 +0200
Message-Id: <20180811090836.4024-4-contrib@steffen-goertz.de>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180811090836.4024-1-contrib@steffen-goertz.de>
References: <20180811090836.4024-1-contrib@steffen-goertz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 88.198.119.201
Subject: [Qemu-arm] [PATCH 3/7] arm: Add chip variant property to nRF51 SoC
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Jim Mussared <jim@groklearning.com>, Stefan Hajnoczi <stefanha@gmail.com>,
	=?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VAVlAF6l1kr+

Nordic Semiconductor nRF51 SOCs are available
in different "variants" which differ in available memory.
This patchs adds a "variant" attribute to the SOC
so that the user can choose between different variants and
thus memory sizes.

See product specification http://infocenter.nordicsemi.com/pdf/nRF51822_P=
S_v3.1.pdf
section 10.6

Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
---
 hw/arm/microbit.c          |  4 ++--
 hw/arm/nrf51_soc.c         | 40 +++++++++++++++++++++++++++-----------
 include/hw/arm/nrf51_soc.h | 15 +++++++++++---
 3 files changed, 43 insertions(+), 16 deletions(-)

diff --git a/hw/arm/microbit.c b/hw/arm/microbit.c
index 8f3c446f52..d6776dea0a 100644
--- a/hw/arm/microbit.c
+++ b/hw/arm/microbit.c
@@ -27,11 +27,11 @@ static void microbit_init(MachineState *machine)
     object_property_add_child(OBJECT(machine), "nrf51", soc, &error_fata=
l);
     object_property_set_link(soc, OBJECT(system_memory),
                              "memory", &error_abort);
+    qdev_prop_set_uint32(DEVICE(soc), "variant", NRF51_VARIANT_AA);
=20
     object_property_set_bool(soc, true, "realized", &error_abort);
=20
-    armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
-            NRF51_SOC(soc)->flash_size);
+    armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename, 0x0=
0);
 }
=20
=20
diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
index 441d05e1ef..85bce2c1e0 100644
--- a/hw/arm/nrf51_soc.c
+++ b/hw/arm/nrf51_soc.c
@@ -32,15 +32,21 @@
 #define FLASH_BASE      0x00000000
 #define SRAM_BASE       0x20000000
=20
-/* The size and base is for the NRF51822 part. If other parts
- * are supported in the future, add a sub-class of NRF51SoC for
- * the specific variants */
-#define NRF51822_FLASH_SIZE     (256 * 1024)
-#define NRF51822_SRAM_SIZE      (16 * 1024)
+#define PAGE_SIZE       1024
=20
 /* IRQ lines can be derived from peripheral base addresses */
 #define BASE_TO_IRQ(base) (((base) >> 12) & 0x1F)
=20
+/* RAM and CODE size in number of pages for different NRF51Variants vari=
ants */
+struct {
+  hwaddr ram_size;
+  hwaddr flash_size;
+} NRF51VariantAttributes[] =3D {
+        [NRF51_VARIANT_AA] =3D {.ram_size =3D 16, .flash_size =3D 256 },
+        [NRF51_VARIANT_AB] =3D {.ram_size =3D 16, .flash_size =3D 128 },
+        [NRF51_VARIANT_AC] =3D {.ram_size =3D 32, .flash_size =3D 256 },
+};
+
 static void nrf51_soc_realize(DeviceState *dev_soc, Error **errp)
 {
     NRF51State *s =3D NRF51_SOC(dev_soc);
@@ -51,13 +57,21 @@ static void nrf51_soc_realize(DeviceState *dev_soc, E=
rror **errp)
         return;
     }
=20
+    if (!(s->part_variant > NRF51_VARIANT_INVALID
+            && s->part_variant < NRF51_VARIANT_MAX)) {
+        error_setg(errp, "VARIANT not set or invalid");
+        return;
+    }
+
     object_property_set_link(OBJECT(&s->cpu), OBJECT(&s->container), "me=
mory",
             &err);
     object_property_set_bool(OBJECT(&s->cpu), true, "realized", &err);
=20
     memory_region_add_subregion_overlap(&s->container, 0, s->board_memor=
y, -1);
=20
-    memory_region_init_ram(&s->flash, OBJECT(s), "nrf51.flash", s->flash=
_size,
+    /* FLASH */
+    memory_region_init_ram(&s->flash, NULL, "nrf51_soc.flash",
+            NRF51VariantAttributes[s->part_variant].flash_size * PAGE_SI=
ZE,
             &err);
     if (err) {
         error_propagate(errp, err);
@@ -66,7 +80,9 @@ static void nrf51_soc_realize(DeviceState *dev_soc, Err=
or **errp)
     memory_region_set_readonly(&s->flash, true);
     memory_region_add_subregion(&s->container, FLASH_BASE, &s->flash);
=20
-    memory_region_init_ram(&s->sram, NULL, "nrf51.sram", s->sram_size, &=
err);
+    /* SRAM */
+    memory_region_init_ram(&s->sram, NULL, "nrf51_soc.sram",
+            NRF51VariantAttributes[s->part_variant].ram_size * PAGE_SIZE=
, &err);
     if (err) {
         error_propagate(errp, err);
         return;
@@ -85,17 +101,19 @@ static void nrf51_soc_init(Object *obj)
     memory_region_init(&s->container, obj, "nrf51-container", UINT64_MAX=
);
=20
     object_initialize(&s->cpu, sizeof(s->cpu), TYPE_ARMV7M);
-    object_property_add_child(OBJECT(s), "armv6m", OBJECT(&s->cpu), &err=
or_abort);
+    object_property_add_child(OBJECT(s), "armv6m", OBJECT(&s->cpu),
+                              &error_abort);
     qdev_set_parent_bus(DEVICE(&s->cpu), sysbus_get_default());
-    qdev_prop_set_string(DEVICE(&s->cpu), "cpu-type", ARM_CPU_TYPE_NAME(=
"cortex-m0"));
+    qdev_prop_set_string(DEVICE(&s->cpu), "cpu-type",
+                         ARM_CPU_TYPE_NAME("cortex-m0"));
     qdev_prop_set_uint32(DEVICE(&s->cpu), "num-irq", 32);
 }
=20
 static Property nrf51_soc_properties[] =3D {
     DEFINE_PROP_LINK("memory", NRF51State, board_memory, TYPE_MEMORY_REG=
ION,
                      MemoryRegion *),
-    DEFINE_PROP_UINT32("sram-size", NRF51State, sram_size, NRF51822_SRAM=
_SIZE),
-    DEFINE_PROP_UINT32("flash-size", NRF51State, flash_size, NRF51822_FL=
ASH_SIZE),
+    DEFINE_PROP_INT32("variant", NRF51State, part_variant,
+                      NRF51_VARIANT_INVALID),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
diff --git a/include/hw/arm/nrf51_soc.h b/include/hw/arm/nrf51_soc.h
index e380ec26b8..24212f9174 100644
--- a/include/hw/arm/nrf51_soc.h
+++ b/include/hw/arm/nrf51_soc.h
@@ -29,14 +29,23 @@ typedef struct NRF51State {
     MemoryRegion sram;
     MemoryRegion flash;
=20
-    uint32_t sram_size;
-    uint32_t flash_size;
-
     MemoryRegion *board_memory;
=20
     MemoryRegion container;
=20
+    /* Properties */
+    int32_t part_variant;
 } NRF51State;
=20
+
+/* Variants as described in nRF51 product specification section 10.6 tab=
le 73 */
+typedef enum {
+    NRF51_VARIANT_INVALID =3D -1,
+    NRF51_VARIANT_AA =3D 0,
+    NRF51_VARIANT_AB =3D 1,
+    NRF51_VARIANT_AC =3D 2,
+    NRF51_VARIANT_MAX =3D 3
+} NRF51Variants;
+
 #endif
=20
--=20
2.18.0

