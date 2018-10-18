Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2260888wrt;
        Thu, 18 Oct 2018 06:10:18 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63ugjYHL6KBHI0lMy1AdWl16ZhW30f/diUplK00WcZoFQtPC/bqa54Yg0ugWn23k7PmXWET
X-Received: by 2002:a37:4dc5:: with SMTP id a188-v6mr28512387qkb.326.1539868218288;
        Thu, 18 Oct 2018 06:10:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539868218; cv=none;
        d=google.com; s=arc-20160816;
        b=b6Zy6uHQrhW1bu/QGr1ouwflGF7wu3GN58hN/WdL2f/b5+RSI9pjnYDhs32px7luCJ
         TAcViDftKJ0RJERpXqptBk9D3WA8iYr8ANMK6jZ4ecM3mtWJZvkJ/eeEJB2CjSyDfl3c
         37Mh7ca7bcZCFGDJ5s7z4oBrjMwA5nX1IrSVBmgHV9mjdDjc/GpHJVKOM9Lxp5joF1H+
         sj26kuyZRBxZsIoWBtihxCRo2upReAzSSKZfDRhArePqIoIrCHzkIGCMDY2rYtxq4p/i
         LHR/u536583Lmt4kvo3iMuOihJVQcnEBxxL0ToXaDCa3QdLBz1Sm+y5zZckTvt8Muu/u
         a+Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=xHy576qli0p5wtxF2ateN5NRCxFenW/Bv0O+xi2c9p0=;
        b=EI+kw71wGJhzZN4lD60mRVbUwExTMIjzctdAXpMpSpoRmHgey3LYx+8WiBG2maTKrQ
         n7ahhH35fV27EgAOCtz8vi/Qhpwpoiif2y4sBQsJgIGZPpIiKiJNZN1B+DDSXzGiYPo0
         fZnUIB/METhcZGbTKPAqzoa+tCoE3yH05HFHkud+uGfbQ8nA0D5DNnaIfu4llCngh+oY
         mwHD70RI5jq8g7spRI5YFuX/OXMtp6Y2Cd3fGbmeZcu8miCymjLw7SR6GvP2zHX/o+Ea
         1+Q1Nx6v9a4T1cEgPY76Ha4Sey8+Pk2H/2FEzJE4lMPPJw5bPJ236lOO+6iZsLCCErgh
         RDmA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g18-v6si5826348qtk.14.2018.10.18.06.10.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 06:10:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42348 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gD849-0002ih-Lu
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 09:10:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39286)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gD7z4-0006rL-2J
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 09:05:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gD7z2-0003V0-5l
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 09:05:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58944)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gD7z1-0003S9-Ry; Thu, 18 Oct 2018 09:05:00 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1371A88E55;
	Thu, 18 Oct 2018 13:04:59 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.158])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 54FCA10018F8;
	Thu, 18 Oct 2018 13:04:56 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Peng Hao <peng.hao2@zte.com.cn>
Date: Thu, 18 Oct 2018 15:04:34 +0200
Message-Id: <20181018130434.23237-5-philmd@redhat.com>
In-Reply-To: <20181018130434.23237-1-philmd@redhat.com>
References: <20181018130434.23237-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 18 Oct 2018 13:04:59 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 4/4] hw/arm/virt: Use the pvpanic device
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
	Wen Congyang <wency@cn.fujitsu.com>,
	Hu Tao <hutao@cn.fujitsu.com>, qemu-devel@nongnu.org,
	"open list:ARM" <qemu-arm@nongnu.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ys/jH/54PPjs

Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
[PMD: Use TYPE_PVPANIC definition, split in 2 patches]
---
 default-configs/arm-softmmu.mak |  2 +-
 hw/arm/virt.c                   | 21 +++++++++++++++++++++
 include/hw/arm/virt.h           |  1 +
 3 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index 2420491aac..def07fa095 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -43,7 +43,7 @@ CONFIG_USB_MUSB=3Dy
 CONFIG_USB_EHCI_SYSBUS=3Dy
 CONFIG_PLATFORM_BUS=3Dy
 CONFIG_VIRTIO_MMIO=3Dy
-
+CONFIG_PVPANIC=3Dy
 CONFIG_ARM11MPCORE=3Dy
 CONFIG_A9MPCORE=3Dy
 CONFIG_A15MPCORE=3Dy
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9f677825f9..40469e6785 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -59,6 +59,7 @@
 #include "qapi/visitor.h"
 #include "standard-headers/linux/input.h"
 #include "hw/arm/smmuv3.h"
+#include "hw/misc/pvpanic.h"
=20
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
@@ -140,6 +141,7 @@ static const MemMapEntry a15memmap[] =3D {
     [VIRT_UART] =3D               { 0x09000000, 0x00001000 },
     [VIRT_RTC] =3D                { 0x09010000, 0x00001000 },
     [VIRT_FW_CFG] =3D             { 0x09020000, 0x00000018 },
+    [VIRT_PVPANIC_MMIO] =3D       { 0x09020018, 0x00000002 },
     [VIRT_GPIO] =3D               { 0x09030000, 0x00001000 },
     [VIRT_SECURE_UART] =3D        { 0x09040000, 0x00001000 },
     [VIRT_SMMU] =3D               { 0x09050000, 0x00020000 },
@@ -802,6 +804,23 @@ static void create_gpio(const VirtMachineState *vms,=
 qemu_irq *pic)
     g_free(nodename);
 }
=20
+static void create_pvpanic_device(const VirtMachineState *vms)
+{
+    char *nodename;
+    hwaddr base =3D vms->memmap[VIRT_PVPANIC_MMIO].base;
+    hwaddr size =3D vms->memmap[VIRT_PVPANIC_MMIO].size;
+
+    sysbus_create_simple(TYPE_PVPANIC, base, NULL);
+
+    nodename =3D g_strdup_printf("/pvpanic-mmio@%" PRIx64, base);
+    qemu_fdt_add_subnode(vms->fdt, nodename);
+    qemu_fdt_setprop_string(vms->fdt, nodename,
+                            "compatible", "pvpanic,mmio");
+    qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
+                                 2, base, 2, size);
+    g_free(nodename);
+}
+
 static void create_virtio_devices(const VirtMachineState *vms, qemu_irq =
*pic)
 {
     int i;
@@ -1548,6 +1567,8 @@ static void machvirt_init(MachineState *machine)
=20
     create_pcie(vms, pic);
=20
+    create_pvpanic_device(vms);
+
     create_gpio(vms, pic);
=20
     /* Create mmio transports, so the user can create virtio backends
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 4cc57a7ef6..61cc3109b2 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -70,6 +70,7 @@ enum {
     VIRT_MMIO,
     VIRT_RTC,
     VIRT_FW_CFG,
+    VIRT_PVPANIC_MMIO,
     VIRT_PCIE,
     VIRT_PCIE_MMIO,
     VIRT_PCIE_PIO,
--=20
2.17.2

