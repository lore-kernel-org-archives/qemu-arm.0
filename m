Received: by 10.223.197.9 with SMTP id q9csp6632619wrf;
        Thu, 19 Oct 2017 03:06:41 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+QpRfvHWeRgyejIi+bdBLbfEua+7H/KkcdloLhOD/iE+l7OMJJggO7mvaCM25EpGodyKAFl
X-Received: by 10.233.237.195 with SMTP id c186mr1229973qkg.69.1508407601581;
        Thu, 19 Oct 2017 03:06:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508407601; cv=none;
        d=google.com; s=arc-20160816;
        b=wiaRrYeCxfvKhqU6Vs4VyhYyF0hGc9KPjvJZuswtYk2XOUzab+OJ9BUSV4UM/1iNTV
         pFG8wtiiZ8fy+SLnBnqr2mR4R/It0Js/+pVPiJJ4bsd3s/EgSf4eWxRAK822Ox+yG6PC
         d1WvW45agiqBVoxMWwsJ1LEIs4I+vRv3EZU03fMbT4LJOetvdmzqpDp0TRNl2KB8qYyN
         +4C8EfTfqKFvpb1+FDF0pEmPQpI7tnQk3OdeFl91Mkuiw/gSLjS77N6selDN0HCFAyJ5
         bN8LRyh5m2ewM23c1ZbBb67KHUFLNpdNRNRJmJnh/Cr7rnK5YSKnLmeoq7zjijfCW14f
         LoWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=oaDxaiKJhJTOACLvKsQB8MD16Qv2y3BKIlnU5BEVc2w=;
        b=Mc1hvk70N710vz1yS12eAklOy9MN01/WixzQImK04mPZjuPlazP5ixbTHKPvPsu5C5
         Glmkst4Bjpz7BpxI0QHNlLN48LirgYcetBQmXiL0X+Gr2DlHadG0uxT4JpgzvrCeD3aV
         C1gz6nz0GzfKU6HKaF/Il62FrJYG2i+npaIFx/poPeQiNKKO0PqSPhzgIh34wrZMPH1v
         UTy9SM4xD0Ydj/SPzX8X77PIpCVvB0exArw+ubmZ9XZPd273AIF7yNXP4tAbyGVNALva
         DQSoq91K3bDEdDd9YPvT+gkoYpGiTGPowbUQucWx39Nhic4h1knFq7EE8+o0zHj2Hagu
         W7lQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c32si539367qtc.135.2017.10.19.03.06.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Oct 2017 03:06:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48458 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e57ip-0003x6-9X
	for alex.bennee@linaro.org; Thu, 19 Oct 2017 06:06:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43526)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e57go-0002nN-Ly
	for qemu-devel@nongnu.org; Thu, 19 Oct 2017 06:04:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e57gk-0007wA-Mf
	for qemu-devel@nongnu.org; Thu, 19 Oct 2017 06:04:34 -0400
Received: from 17.mo5.mail-out.ovh.net ([46.105.56.132]:43800)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1e57gk-0007v6-GW
	for qemu-devel@nongnu.org; Thu, 19 Oct 2017 06:04:30 -0400
Received: from player786.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id 103A7145A18
	for <qemu-devel@nongnu.org>; Thu, 19 Oct 2017 12:04:29 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
	[90.76.52.173]) (Authenticated sender: clg@kaod.org)
	by player786.ha.ovh.net (Postfix) with ESMTPSA id 4B2F280079;
	Thu, 19 Oct 2017 12:04:21 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Oct 2017 12:04:03 +0200
Message-Id: <20171019100410.26239-2-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171019100410.26239-1-clg@kaod.org>
References: <20171019100410.26239-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 8695324982241430289
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedttddrudekgddvgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.56.132
Subject: [Qemu-devel] [PATCH v4 1/8] aspeed: introduce a dummy ROM device to
 catch invalid writes
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KLceyYS66428

Some legacy firmwares access unimplemented addresses on the Aspeed SoC
(old U-Boot code using variables in the bss when it shouldn't do).
Let's add a dummy ROM device to catch the invalid writes and support
new board without using the 'ignore_memory_transaction_failures' flags.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index ab895ad490af..e44733153819 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -166,6 +166,19 @@ static void aspeed_board_init_flashes(AspeedSMCState=
 *s, const char *flashtype,
     }
 }
=20
+static void boot_rom_rw_flash_write(void *opaque, hwaddr offset, uint64_=
t value,
+                              unsigned size)
+{
+    qemu_log_mask(LOG_GUEST_ERROR,
+                  "%s: 0x%" HWADDR_PRIx " <- 0x%" PRIx64 " [%u]\n",
+                  __func__, offset, value, size);
+}
+
+static const MemoryRegionOps boot_rom_rw_flash_ops =3D {
+    .write =3D boot_rom_rw_flash_write,
+    .endianness =3D DEVICE_NATIVE_ENDIAN,
+};
+
 static void aspeed_board_init(MachineState *machine,
                               const AspeedBoardConfig *cfg)
 {
@@ -209,6 +222,7 @@ static void aspeed_board_init(MachineState *machine,
     if (drive0) {
         AspeedSMCFlash *fl =3D &bmc->soc.fmc.flashes[0];
         MemoryRegion *boot_rom =3D g_new(MemoryRegion, 1);
+        MemoryRegion *boot_rom_rw =3D  g_new(MemoryRegion, 1);
=20
         /*
          * create a ROM region using the default mapping window size of
@@ -221,6 +235,16 @@ static void aspeed_board_init(MachineState *machine,
         memory_region_add_subregion(get_system_memory(), FIRMWARE_ADDR,
                                     boot_rom);
         write_boot_rom(drive0, FIRMWARE_ADDR, fl->size, &error_abort);
+
+        /*
+         * Create a fake ROM region to track invalid writes done by
+         * some legacy firmwares
+         */
+        memory_region_init_rom_device(boot_rom_rw, NULL, &boot_rom_rw_fl=
ash_ops,
+                                      NULL, "aspeed.boot_rom_rw", fl->si=
ze,
+                                      &error_abort);
+        memory_region_add_subregion_overlap(get_system_memory(), FIRMWAR=
E_ADDR,
+                                            boot_rom_rw, 0);
     }
=20
     aspeed_board_binfo.kernel_filename =3D machine->kernel_filename;
--=20
2.13.6

