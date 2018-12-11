Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp798803wrt;
        Tue, 11 Dec 2018 08:40:23 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VjDUgT9okm3DdCdwehiEtujXbVzUe4l5HadRJX+KNKhuMuMpFXiTtrD9lT97sSrKXr0hHJ
X-Received: by 2002:ac8:544e:: with SMTP id d14mr16858604qtq.279.1544546423137;
        Tue, 11 Dec 2018 08:40:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544546423; cv=none;
        d=google.com; s=arc-20160816;
        b=RCc9diT0g675pOIajAtrHc6j5Dhywy2EcrntfdY1xd16DMYBmMoGTZFqwJofMTT6mF
         fMSBVwBuoFSpo8/Yb8rOLnwdRPSKaeEkTDhgL2SRDWSF00el2qwtwG8mxJuqBMP8fy7S
         F7STxRVBdFtzPNGiYrIq00CgDw3yUYkDybVhHCClZfkUZHqP6qTDRpMmRGMCKCPINWQo
         aeODJZL+VnDDfj1H+sGett6R2vk3eJSFS4MXRUymX9veeHrtr1aHF2uEo78ZzI2NcxIl
         dXALkPTy5JIZUPhDExtVtrBHCJKG1o8t1022B1CotZSaNYHZAqNGppyL7Kl8nX+3AJeB
         snlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=X1qmFeQhhGHqtdVOgm3uHqN3b7649FwasvJYlRMAo1A=;
        b=QWdMsVPN7hILi3XG+OEL/iVkArN1j6pZPI7koRL1Dmz3KbC6/lk6XTcvPT4Y+1vH9p
         fr45THiu5WU+gDT1xluSZjc/xDuIiuqOesmE5nSTPHdtYUV3b7X2Z/htRH1Funw8mrCn
         PPap9LUTgSVfgLlPYhlkj53QH95n7RI/pjmVM6hPmTOGPBRIRISVKPOp//yaBYfqspHN
         abpjXoQJatBZhGjVwRft37ZUhspT541B3b/gktg3Gl1vE67ZLngNjYNQka3KCIWbtO8Z
         w9qsACN+bXzfM6BjIbm4uS5J26Nye0M8RJo/hmgeqP8DoRNaUcUAmwcdGVv6MxYxUC77
         JfGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a62si785879qke.165.2018.12.11.08.40.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Dec 2018 08:40:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39988 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gWl54-0007AW-I4
	for alex.bennee@linaro.org; Tue, 11 Dec 2018 11:40:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39057)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gWl0O-0003S9-ET
	for qemu-devel@nongnu.org; Tue, 11 Dec 2018 11:35:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gWl0M-000796-Bn
	for qemu-devel@nongnu.org; Tue, 11 Dec 2018 11:35:32 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59798)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gWl01-0006qO-Gd; Tue, 11 Dec 2018 11:35:13 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D282C30821EF;
	Tue, 11 Dec 2018 16:35:05 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-183.brq.redhat.com [10.40.204.183])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B3C0C4DC49;
	Tue, 11 Dec 2018 16:34:57 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>
Date: Tue, 11 Dec 2018 17:34:06 +0100
Message-Id: <20181211163406.3322-5-philmd@redhat.com>
In-Reply-To: <20181211163406.3322-1-philmd@redhat.com>
References: <20181211163406.3322-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Tue, 11 Dec 2018 16:35:06 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 4/4] hw/smbios: Move to the hw/firmware/
 subdirectory
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Corey Minyard <minyard@acm.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KORWdL+lrWIY

SMBIOS is just another firmware interface used by some QEMU models.
We will later introduce more firmware interfaces in this subdirectory.

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 MAINTAINERS                              | 2 +-
 hw/arm/virt.c                            | 2 +-
 hw/i386/pc.c                             | 2 +-
 hw/i386/pc_piix.c                        | 2 +-
 hw/i386/pc_q35.c                         | 2 +-
 hw/smbios/smbios-stub.c                  | 2 +-
 hw/smbios/smbios.c                       | 2 +-
 hw/smbios/smbios_type_38.c               | 2 +-
 include/hw/{smbios =3D> firmware}/smbios.h | 0
 tests/bios-tables-test.c                 | 2 +-
 vl.c                                     | 2 +-
 11 files changed, 10 insertions(+), 10 deletions(-)
 rename include/hw/{smbios =3D> firmware}/smbios.h (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 63effdc473..f7ba25c146 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1238,7 +1238,7 @@ M: Michael S. Tsirkin <mst@redhat.com>
 M: Igor Mammedov <imammedo@redhat.com>
 S: Supported
 F: include/hw/acpi/*
-F: include/hw/smbios/*
+F: include/hw/firmware/smbios.h
 F: hw/mem/*
 F: hw/acpi/*
 F: hw/smbios/*
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index f69e7eb399..49813bca1b 100644
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
index f095725dba..afa1098082 100644
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
index 7092d6d13f..e3ee3091d2 100644
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
index 4702bb13c4..bc31cd5822 100644
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
index 9d737642cb..2a61f38637 100644
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
diff --git a/include/hw/smbios/smbios.h b/include/hw/firmware/smbios.h
similarity index 100%
rename from include/hw/smbios/smbios.h
rename to include/hw/firmware/smbios.h
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
index a5ae5f23d2..bfc3114dd4 100644
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
--=20
2.17.2

