Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4450561wre;
        Wed, 30 May 2018 00:51:57 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJbBBaM8DRMm2oaWsP+VfczEhN4FY2RYPuqwXCPya0gx9nNxZKj50/448nyGSozNlEzl+NX
X-Received: by 2002:aed:3124:: with SMTP id 33-v6mr1554543qtg.48.1527666717414;
        Wed, 30 May 2018 00:51:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527666717; cv=none;
        d=google.com; s=arc-20160816;
        b=gVBcDiQvNqf7x3LWxUjyr78XjI/zDsm4/kK7Yh8YtGY73r4i4T7twgufRG2uqgLcZp
         tCv749IdV8vfIuINqv6cP/2ndtjXtPfSOJMPauPgKEGz9VwKGihpZu24y+mlJoyhxst3
         ZFAUGo3qCU+JnoKdAw90YYxCrn2RlOyf38heZRK6plJnCWapGZBDi94oUEnIOGjMPY8H
         N+lQb0lfT0VFuevK9l5dy/L6XMAEOr8qoJpid31v9DbeJOZ9w3e5GR7KQWcJB8esJJuf
         rh2fMeonuCM2vHJVo9I6ul1o26kDXJrT2g4YfoHim0wrSSxEB+1PJe1KF/RJQVn6sxtJ
         zUYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=dY3tCSUvbVY0AQD/fTVu50HxeNSLWDNlLFzWcnYlzeU=;
        b=Z0lw2H8vkWYcOEt1Vas6ls031ihYpl/IGJ9IzE/xNCQM+/7+fTiaH3wVLXl1lHY5Ip
         CuIYN3IeBVT2X0/4+1g+au5OEH0LrkPS5GDvBN3wYRyEWEntVAb3TxR3aOUrjtZ3yo7e
         /73s1HpHgCA4UL89vzKYp0P1fxTwqT3kt2YSIrfIihxxeI7ZWE2jwgzKLX0cj61cwN4j
         1+3L+E8eVcDa3QJ/jZFWSXEtnH1pBZrnTC9IIn7HeiFw0/ky0Iy2jNh44n9uzi8hpT6o
         PmVax6fj6xPCkpTi3RoBBcAjGj1PVOXPUpme2HaOGiqEtQtX6QhIJN8F0gKvKBEs6mOV
         Y8/A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p27-v6si10222225qtl.92.2018.05.30.00.51.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 00:51:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36851 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNvtk-0006v3-QK
	for alex.bennee@linaro.org; Wed, 30 May 2018 03:51:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47248)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNvsS-0006K0-9n
	for qemu-devel@nongnu.org; Wed, 30 May 2018 03:50:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNvsO-0001Ec-CR
	for qemu-devel@nongnu.org; Wed, 30 May 2018 03:50:36 -0400
Received: from 3.mo178.mail-out.ovh.net ([46.105.44.197]:33794)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fNvsO-0001EB-2g
	for qemu-devel@nongnu.org; Wed, 30 May 2018 03:50:32 -0400
Received: from player770.ha.ovh.net (unknown [10.109.105.30])
	by mo178.mail-out.ovh.net (Postfix) with ESMTP id 7D94018D3A
	for <qemu-devel@nongnu.org>; Wed, 30 May 2018 09:50:30 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
	[86.201.141.10]) (Authenticated sender: clg@kaod.org)
	by player770.ha.ovh.net (Postfix) with ESMTPSA id EDB14C007F;
	Wed, 30 May 2018 09:50:23 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 30 May 2018 09:50:01 +0200
Message-Id: <20180530075002.4618-4-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20180530075002.4618-1-clg@kaod.org>
References: <20180530075002.4618-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 6324742729837480721
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedthedrheelgdduvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.44.197
Subject: [Qemu-devel] [PATCH 3/4] aspeed/smc: add a new memory region
 dedicated to MMIO execution
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Alistair Francis <alistair@alistair23.me>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5zki2S4mte5+

The Aspeed SoC are generally booted from one of the flash modules
behind the FMC controller. The FMC CS0 flash module is mapped at a
specific address depending on the SoC revision and also at 0x0, the
default boot-up address.

To support this second mapping, we add a new 'ROM' like memory region
under the FMC flash module model and activate support for MMIO
execution with a 'request_ptr' handler. The latter fills up a cache of
flash content to be executed or read by the boot up process.

Also add a 'mmio_exec' bool to activate the feature which still has
some issues.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ssi/aspeed_smc.h |   7 +++
 hw/ssi/aspeed_smc.c         | 122 ++++++++++++++++++++++++++++++++++++++=
+++++-
 2 files changed, 128 insertions(+), 1 deletion(-)

diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index 1f557313fa93..5e853afe725d 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -48,6 +48,8 @@ typedef struct AspeedSMCController {
     uint32_t nregs;
 } AspeedSMCController;
=20
+#define ASPEED_SMC_CACHE_SIZE    1024  /* 1K is the minimum */
+
 typedef struct AspeedSMCFlash {
     struct AspeedSMCState *controller;
=20
@@ -56,6 +58,10 @@ typedef struct AspeedSMCFlash {
=20
     MemoryRegion mmio;
     DeviceState *flash;
+
+    MemoryRegion mmio_rom;
+    uint8_t cache[ASPEED_SMC_CACHE_SIZE];
+    hwaddr cache_addr;
 } AspeedSMCFlash;
=20
 #define TYPE_ASPEED_SMC "aspeed.smc"
@@ -79,6 +85,7 @@ typedef struct AspeedSMCState {
=20
     MemoryRegion mmio;
     MemoryRegion mmio_flash;
+    bool mmio_exec;
=20
     qemu_irq irq;
     int irqline;
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 5808181568c4..d599eebc7d21 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -604,6 +604,96 @@ static const MemoryRegionOps aspeed_smc_flash_ops =3D=
 {
     },
 };
=20
+static bool aspeed_smc_flash_rom_is_cached(AspeedSMCFlash *fl, hwaddr ad=
dr)
+{
+    return (addr >=3D fl->cache_addr &&
+            addr <=3D fl->cache_addr + ASPEED_SMC_CACHE_SIZE - 4);
+}
+
+static void aspeed_smc_flash_rom_load_cache(AspeedSMCFlash *fl, hwaddr a=
ddr)
+{
+    AspeedSMCState *s =3D fl->controller;
+    hwaddr cache_addr =3D addr & ~(ASPEED_SMC_CACHE_SIZE - 1);
+    int i;
+
+    if (fl->cache_addr !=3D ~0ULL) {
+        memory_region_invalidate_mmio_ptr(&fl->mmio_rom, fl->cache_addr,
+                                          ASPEED_SMC_CACHE_SIZE);
+    }
+
+    aspeed_smc_flash_select(fl);
+    aspeed_smc_flash_setup(fl, cache_addr);
+
+    for (i =3D 0; i < ASPEED_SMC_CACHE_SIZE; i++) {
+        fl->cache[i] =3D ssi_transfer(s->spi, 0x0);
+    }
+
+    aspeed_smc_flash_unselect(fl);
+
+    fl->cache_addr =3D cache_addr;
+}
+
+static void *aspeed_smc_flash_rom_request_ptr(void *opaque, hwaddr addr,
+                                              unsigned *size, unsigned *=
offset)
+{
+    AspeedSMCFlash *fl =3D opaque;
+
+    if (!aspeed_smc_flash_rom_is_cached(fl, addr)) {
+        aspeed_smc_flash_rom_load_cache(fl, addr);
+    }
+
+    *size =3D ASPEED_SMC_CACHE_SIZE;
+    *offset =3D fl->cache_addr;
+    return fl->cache;
+}
+
+static uint64_t aspeed_smc_flash_rom_read(void *opaque, hwaddr addr,
+                                          unsigned size)
+{
+    AspeedSMCFlash *fl =3D opaque;
+    AspeedSMCState *s =3D fl->controller;
+    uint64_t ret =3D 0;
+    int i;
+
+    /*
+     * Transfer or use the cache if possible. Reloading the cache
+     * while loading from the flash can break the TCG execution flow.
+     */
+    if (!aspeed_smc_flash_rom_is_cached(fl, addr)) {
+        aspeed_smc_flash_select(fl);
+        aspeed_smc_flash_setup(fl, addr);
+
+        for (i =3D 0; i < size; i++) {
+            ret |=3D (uint64_t) ssi_transfer(s->spi, 0x0) << (8 * i);
+        }
+
+        aspeed_smc_flash_unselect(fl);
+    } else {
+        for (i =3D 0; i < size; i++) {
+            ret |=3D (uint64_t) fl->cache[addr - fl->cache_addr + i] << =
(8 * i);
+        }
+    }
+    return ret;
+}
+
+static void aspeed_smc_flash_rom_write(void *opaque, hwaddr addr, uint64=
_t data,
+                                       unsigned size)
+{
+    qemu_log_mask(LOG_GUEST_ERROR, "%s: flash is not writable at 0x%"
+                  HWADDR_PRIx "\n", __func__, addr);
+}
+
+static const MemoryRegionOps aspeed_smc_flash_rom_ops =3D {
+    .read =3D aspeed_smc_flash_rom_read,
+    .write =3D aspeed_smc_flash_rom_write,
+    .request_ptr =3D aspeed_smc_flash_rom_request_ptr,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .valid =3D {
+        .min_access_size =3D 1,
+        .max_access_size =3D 4,
+    },
+};
+
 static void aspeed_smc_flash_update_cs(AspeedSMCFlash *fl)
 {
     const AspeedSMCState *s =3D fl->controller;
@@ -778,21 +868,51 @@ static void aspeed_smc_realize(DeviceState *dev, Er=
ror **errp)
                               fl, name, fl->size);
         memory_region_add_subregion(&s->mmio_flash, offset, &fl->mmio);
         offset +=3D fl->size;
+
+        /*
+         * The system is generally booted from one of the flash
+         * modules behind the FMC controller. Initialize the 'ROM'
+         * region which supports MMIO execution and let the board
+         * decide how to use them.
+         */
+        if ((s->ctrl->segments =3D=3D aspeed_segments_ast2500_fmc ||
+             s->ctrl->segments =3D=3D aspeed_segments_fmc) && s->mmio_ex=
ec) {
+            snprintf(name, sizeof(name), "%s.%d-rom", s->ctrl->name, i);
+
+            memory_region_init_io(&fl->mmio_rom, OBJECT(s),
+                                  &aspeed_smc_flash_rom_ops,
+                                  fl, name, fl->size);
+            fl->cache_addr =3D ~0ULL;
+        }
     }
 }
=20
+static const VMStateDescription vmstate_aspeed_smc_flash =3D {
+    .name =3D TYPE_ASPEED_SMC "/flash",
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+    .fields =3D (VMStateField []) {
+        VMSTATE_UINT8_ARRAY(cache, AspeedSMCFlash, ASPEED_SMC_CACHE_SIZE=
),
+        VMSTATE_UINT64(cache_addr, AspeedSMCFlash),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
 static const VMStateDescription vmstate_aspeed_smc =3D {
-    .name =3D "aspeed.smc",
+    .name =3D TYPE_ASPEED_SMC,
     .version_id =3D 1,
     .minimum_version_id =3D 1,
     .fields =3D (VMStateField[]) {
         VMSTATE_UINT32_ARRAY(regs, AspeedSMCState, ASPEED_SMC_R_MAX),
+        VMSTATE_STRUCT_VARRAY_POINTER_UINT32(flashes, AspeedSMCState, nu=
m_cs,
+                                     vmstate_aspeed_smc_flash, AspeedSMC=
Flash),
         VMSTATE_END_OF_LIST()
     }
 };
=20
 static Property aspeed_smc_properties[] =3D {
     DEFINE_PROP_UINT32("num-cs", AspeedSMCState, num_cs, 1),
+    DEFINE_PROP_BOOL("mmio-exec", AspeedSMCState, mmio_exec, false),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
--=20
2.13.6

