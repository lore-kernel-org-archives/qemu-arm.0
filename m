Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp6271627wro;
        Tue, 30 Oct 2018 17:32:12 -0700 (PDT)
X-Google-Smtp-Source: AJdET5flJkiQSPn3apyHTun3htW0+liJ0NZfi6B8p70tSANsmaLJ0Az/5U2ysJ+LaFPpB8GalXGl
X-Received: by 2002:ae9:e901:: with SMTP id x1mr471491qkf.332.1540945932636;
        Tue, 30 Oct 2018 17:32:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540945932; cv=none;
        d=google.com; s=arc-20160816;
        b=waB1vtlZIE/Hiv8VaMrh9aMEDHoexhlDWIEu0I7WpXNZluT0i8eE9KvdZwA4SPXImz
         0CX5baNZA8/OUVo152qtyIQXPE0RAXsCrUXLawsOYJmvzRPT17Ya/iH2kJgAAPyhbkwG
         5jc1Tlu+7VCARN2DdCorGV7KUigIENL3aifTbS70NdPuh3v7qI2y3JqGp9HZPcxybzFQ
         sxJQIDWdsECIKGbZX4r2EcMS4SC4hRui3iz1gjQnI0zYKytQn6lmpEtwnfIK+8wnikc8
         y9FcNfOmXBFaIdNkBy2vNj714F02d7UoM7CuxKt3Vwg6BPwtZKgMsfHqnZ3dWfYoTnKv
         dQug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=d8KYm95gjkReFW1X8ePOjwgEcX83mcMTd715l5pYbGo=;
        b=vG5WwxxzkURf2biGyJIUlJ9pjnwkAtaXSNp3xJTjoryzOFNNYyKwnqXJIO1kkQfXrh
         i9aeFhGYgGe/WQULfQeSnvEJCK1Dr/ZlFfrw8uPKl2yEc+D8MZh5JtyeEl0MBm6HK6TY
         NGfsawc2NzoSgV67hM4HIYBqdgjUxKVSvI0yiU+/AKUe+uBO8aU5oOBPQ9KZYttYHMva
         6OZbJYZ8RX3nacqRHe/9tKJy+8jjefWFQ2zJqs9rqkfVYToFvifsK9NhWnPf5wz1lo5y
         dbw5WMzq2U/gMfh8WSFGt+BFqFKu1oD/liCKzxbtZyULuvNbLLxjjv09rDOpllnx/KbY
         +F6w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v68-v6si18007784qki.208.2018.10.30.17.32.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Oct 2018 17:32:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56231 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHeQe-0001bp-4H
	for alex.bennee@linaro.org; Tue, 30 Oct 2018 20:32:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41811)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>) id 1gHeLc-0005Vu-CE
	for qemu-devel@nongnu.org; Tue, 30 Oct 2018 20:27:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>) id 1gHeLb-0000f8-Ja
	for qemu-devel@nongnu.org; Tue, 30 Oct 2018 20:27:00 -0400
Received: from steffen-goertz.de ([88.198.119.201]:60510)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>)
	id 1gHeLZ-0000Iw-Ps; Tue, 30 Oct 2018 20:26:57 -0400
Received: from gouranga.fios-router.home
	(pool-71-183-97-129.nycmny.fios.verizon.net [71.183.97.129])
	by steffen-goertz.de (Postfix) with ESMTPSA id 52CB84FB76;
	Wed, 31 Oct 2018 01:23:38 +0100 (CET)
From: =?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>
To: qemu-devel@nongnu.org
Date: Tue, 30 Oct 2018 20:25:27 -0400
Message-Id: <20181031002526.14262-14-contrib@steffen-goertz.de>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181031002526.14262-1-contrib@steffen-goertz.de>
References: <20181031002526.14262-1-contrib@steffen-goertz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 88.198.119.201
Subject: [Qemu-devel] [PATCH v3 13/13] arm: Add Clock peripheral stub to
 NRF51 SOC
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Jim Mussared <jim@groklearning.com>, Stefan Hajnoczi <stefanha@gmail.com>,
	=?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	"open list:NRF51" <qemu-arm@nongnu.org>,
	Joel Stanley <joel@jms.id.au>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ge0N1QUnxe83

This stubs enables the microbit-micropython firmware to run
on the microbit machine.

Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
---
 hw/arm/nrf51_soc.c         | 27 +++++++++++++++++++++++++++
 include/hw/arm/nrf51_soc.h |  1 +
 2 files changed, 28 insertions(+)

diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
index c29b80c0ca..bccf2b9b2c 100644
--- a/hw/arm/nrf51_soc.c
+++ b/hw/arm/nrf51_soc.c
@@ -35,6 +35,26 @@
=20
 #define BASE_TO_IRQ(base) ((base >> 12) & 0x1F)
=20
+static uint64_t clock_read(void *opaque, hwaddr addr, unsigned int size)
+{
+    qemu_log_mask(LOG_UNIMP, "%s: 0x%" HWADDR_PRIx " [%u]\n",
+                  __func__, addr, size);
+    return 1;
+}
+
+static void clock_write(void *opaque, hwaddr addr, uint64_t data,
+                        unsigned int size)
+{
+    qemu_log_mask(LOG_UNIMP, "%s: 0x%" HWADDR_PRIx " <- 0x%" PRIx64 " [%=
u]\n",
+                  __func__, addr, data, size);
+}
+
+static const MemoryRegionOps clock_ops =3D {
+    .read =3D clock_read,
+    .write =3D clock_write
+};
+
+
 static void nrf51_soc_realize(DeviceState *dev_soc, Error **errp)
 {
     NRF51State *s =3D NRF51_SOC(dev_soc);
@@ -159,6 +179,13 @@ static void nrf51_soc_realize(DeviceState *dev_soc, =
Error **errp)
                                             BASE_TO_IRQ(base_addr)));
     }
=20
+    /* STUB Peripherals */
+    memory_region_init_io(&s->clock, NULL, &clock_ops, NULL,
+                          "nrf51_soc.clock", 0x1000);
+    memory_region_add_subregion_overlap(&s->container,
+                                        NRF51_IOMEM_BASE, &s->clock, -1)=
;
+
+
=20
     create_unimplemented_device("nrf51_soc.io", NRF51_IOMEM_BASE,
                                 NRF51_IOMEM_SIZE);
diff --git a/include/hw/arm/nrf51_soc.h b/include/hw/arm/nrf51_soc.h
index 89525dcb39..4610d0c7ae 100644
--- a/include/hw/arm/nrf51_soc.h
+++ b/include/hw/arm/nrf51_soc.h
@@ -40,6 +40,7 @@ typedef struct NRF51State {
     MemoryRegion iomem;
     MemoryRegion sram;
     MemoryRegion flash;
+    MemoryRegion clock;
=20
     uint32_t sram_size;
     uint32_t flash_size;
--=20
2.19.1

