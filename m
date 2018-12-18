Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3920478wrt;
        Tue, 18 Dec 2018 08:20:50 -0800 (PST)
X-Google-Smtp-Source: AFSGD/W7SciDsaBekz2zkn76WFhzHE7N0slOytKEa35NHvL5ieuixxHwfaDt3NFwY2o6ARwf0zen
X-Received: by 2002:a0c:9418:: with SMTP id h24mr17993938qvh.216.1545150050444;
        Tue, 18 Dec 2018 08:20:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1545150050; cv=none;
        d=google.com; s=arc-20160816;
        b=O6lwGdgRg856dWuUZ4PBb/nyLEo9SLlnh9tLjbRyyL5y2TF10Js0hTcvgAV0JwAvA9
         mdb6G3NOxr+b5EOQ9vg/OZLuOguX7YEIv2mPaONmc+0RkSp6+LLbDsr3xOfRS98xZHPw
         +YQuoZAnW6vmKAnzlfQKhcuf5hGPJZ6XOyfZodaw2e6CrNLNpcDv4ToR08cXBsKwG7wt
         AqflAbLDdpZOP/qVS4Ifa0vOALRqGUAeQmh1PLHxqN/FUyDlvJ2Yo/ShXwYCaqxAqlzo
         /9yQQat9oiP3VP4mHhl79IH2xggcjyDSgDtoC6BjljtxJeyKTcaSeRNGKL/oDaUuIjG3
         u0mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date;
        bh=aco0LsDNjSQkxmSBFceKazeElfVMlfeqrENpWiA2Z98=;
        b=x3/IOrv1G4M7xpKXNo4YG9inzgRb68iT/+JthHRGlX56HQa+PaFUit1NyC076EeUAR
         nwd4A38jL5VJYA7/6RS4+eua6ZlnryB+MXQmIEJVfxXkJhJmmnaw3w1irZJVyQbTz4j2
         XfLyf5d2CRGkIOfovHqlPCVZpNo9EJiGS6iJAu6uVMWvc0USdU+lFRM9TdXj3MwCbeIc
         zAHpWD5qOt/98fTRDhdUh6ri54PrYiNLWF1wlBjZSgoeavg5PvMZjXZAVlcmPO1r9zUZ
         w0BiysMJ+7bFB664omk1S/OE+iL5XJmOgTTMlP+iL6Fi3SacXCWyKOjzCS8WG7kX0f16
         SWsA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f15si250198qth.61.2018.12.18.08.20.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 18 Dec 2018 08:20:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54859 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gZI6z-00054k-O5
	for alex.bennee@linaro.org; Tue, 18 Dec 2018 11:20:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53874)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gZHyG-00054J-9h
	for qemu-arm@nongnu.org; Tue, 18 Dec 2018 11:11:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gZHyF-0001ri-2i
	for qemu-arm@nongnu.org; Tue, 18 Dec 2018 11:11:48 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37428)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1gZHyE-0001qM-Q7; Tue, 18 Dec 2018 11:11:47 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F1548BDE1;
	Tue, 18 Dec 2018 16:11:45 +0000 (UTC)
Received: from redhat.com (ovpn-120-67.rdu2.redhat.com [10.10.120.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E099C60C65;
	Tue, 18 Dec 2018 16:11:41 +0000 (UTC)
Date: Tue, 18 Dec 2018 11:11:41 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20181218161008.3882-9-mst@redhat.com>
References: <20181218161008.3882-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20181218161008.3882-1-mst@redhat.com>
X-Mutt-Fcc: =sent
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 18 Dec 2018 16:11:46 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL v2 08/30] hw/smbios: Move to the hw/firmware/
 subdirectory
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Corey Minyard <minyard@acm.org>,
	Laszlo Ersek <lersek@redhat.com>, qemu-arm@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UnFdC7HjVlP1

From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

SMBIOS is just another firmware interface used by some QEMU models.
We will later introduce more firmware interfaces in this subdirectory.

Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/{smbios =3D> firmware}/smbios.h | 0
 hw/arm/virt.c                            | 2 +-
 hw/i386/pc.c                             | 2 +-
 hw/i386/pc_piix.c                        | 2 +-
 hw/i386/pc_q35.c                         | 2 +-
 hw/smbios/smbios-stub.c                  | 2 +-
 hw/smbios/smbios.c                       | 2 +-
 hw/smbios/smbios_type_38.c               | 2 +-
 tests/bios-tables-test.c                 | 2 +-
 vl.c                                     | 2 +-
 MAINTAINERS                              | 2 +-
 11 files changed, 10 insertions(+), 10 deletions(-)
 rename include/hw/{smbios =3D> firmware}/smbios.h (100%)

diff --git a/include/hw/smbios/smbios.h b/include/hw/firmware/smbios.h
similarity index 100%
rename from include/hw/smbios/smbios.h
rename to include/hw/firmware/smbios.h
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 5b678237b7..c2641e56ea 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -55,7 +55,7 @@
 #include "hw/intc/arm_gic.h"
 #include "hw/intc/arm_gicv3_common.h"
 #include "kvm_arm.h"
-#include "hw/smbios/smbios.h"
+#include "hw/firmware/smbios.h"
 #include "qapi/visitor.h"
 #include "standard-headers/linux/input.h"
 #include "hw/arm/smmuv3.h"
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 115bc2825c..470cc5daf9 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -37,7 +37,7 @@
 #include "hw/pci/pci_bus.h"
 #include "hw/nvram/fw_cfg.h"
 #include "hw/timer/hpet.h"
-#include "hw/smbios/smbios.h"
+#include "hw/firmware/smbios.h"
 #include "hw/loader.h"
 #include "elf.h"
 #include "multiboot.h"
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 6981cfa740..e000c7511a 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -30,7 +30,7 @@
 #include "hw/i386/pc.h"
 #include "hw/i386/apic.h"
 #include "hw/display/ramfb.h"
-#include "hw/smbios/smbios.h"
+#include "hw/firmware/smbios.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_ids.h"
 #include "hw/usb.h"
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 58459bdab5..8836d21485 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -47,7 +47,7 @@
 #include "hw/i386/amd_iommu.h"
 #include "hw/i386/intel_iommu.h"
 #include "hw/display/ramfb.h"
-#include "hw/smbios/smbios.h"
+#include "hw/firmware/smbios.h"
 #include "hw/ide/pci.h"
 #include "hw/ide/ahci.h"
 #include "hw/usb.h"
diff --git a/hw/smbios/smbios-stub.c b/hw/smbios/smbios-stub.c
index d3a385441a..64e5ba93ec 100644
--- a/hw/smbios/smbios-stub.c
+++ b/hw/smbios/smbios-stub.c
@@ -23,7 +23,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qapi/qmp/qerror.h"
-#include "hw/smbios/smbios.h"
+#include "hw/firmware/smbios.h"
=20
 void smbios_entry_add(QemuOpts *opts, Error **errp)
 {
diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index 4bff9b5ea4..818be8a838 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -24,7 +24,7 @@
 #include "sysemu/sysemu.h"
 #include "qemu/uuid.h"
 #include "sysemu/cpus.h"
-#include "hw/smbios/smbios.h"
+#include "hw/firmware/smbios.h"
 #include "hw/loader.h"
 #include "exec/cpu-common.h"
 #include "smbios_build.h"
diff --git a/hw/smbios/smbios_type_38.c b/hw/smbios/smbios_type_38.c
index a1ad28d059..0c08f282de 100644
--- a/hw/smbios/smbios_type_38.c
+++ b/hw/smbios/smbios_type_38.c
@@ -9,7 +9,7 @@
=20
 #include "qemu/osdep.h"
 #include "hw/ipmi/ipmi.h"
-#include "hw/smbios/smbios.h"
+#include "hw/firmware/smbios.h"
 #include "qemu/error-report.h"
 #include "smbios_build.h"
=20
diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
index d661d9be62..dfa74a5bec 100644
--- a/tests/bios-tables-test.c
+++ b/tests/bios-tables-test.c
@@ -13,7 +13,7 @@
 #include "qemu/osdep.h"
 #include <glib/gstdio.h>
 #include "qemu-common.h"
-#include "hw/smbios/smbios.h"
+#include "hw/firmware/smbios.h"
 #include "qemu/bitmap.h"
 #include "acpi-utils.h"
 #include "boot-sector.h"
diff --git a/vl.c b/vl.c
index 2a8b2ee16d..522f0131f4 100644
--- a/vl.c
+++ b/vl.c
@@ -61,7 +61,7 @@ int main(int argc, char **argv)
 #include "hw/display/vga.h"
 #include "hw/bt.h"
 #include "sysemu/watchdog.h"
-#include "hw/smbios/smbios.h"
+#include "hw/firmware/smbios.h"
 #include "hw/acpi/acpi.h"
 #include "hw/xen/xen.h"
 #include "hw/qdev.h"
diff --git a/MAINTAINERS b/MAINTAINERS
index 83c127f0d6..5d83b59542 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1260,7 +1260,7 @@ M: Michael S. Tsirkin <mst@redhat.com>
 M: Igor Mammedov <imammedo@redhat.com>
 S: Supported
 F: include/hw/acpi/*
-F: include/hw/smbios/*
+F: include/hw/firmware/smbios.h
 F: hw/mem/*
 F: hw/acpi/*
 F: hw/smbios/*
--=20
MST

