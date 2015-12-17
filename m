Received: by 10.182.158.201 with SMTP id ww9csp246158obb;
        Thu, 17 Dec 2015 01:02:57 -0800 (PST)
X-Received: by 10.55.72.3 with SMTP id v3mr66060877qka.107.1450342977043;
        Thu, 17 Dec 2015 01:02:57 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p53si10515618qge.106.2015.12.17.01.02.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Dec 2015 01:02:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51638 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a9USe-0008IA-PB
	for alex.bennee@linaro.org; Thu, 17 Dec 2015 04:02:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41280)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1a9URn-00073G-EX
	for qemu-devel@nongnu.org; Thu, 17 Dec 2015 04:02:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1a9URm-0000Nu-8s
	for qemu-devel@nongnu.org; Thu, 17 Dec 2015 04:02:03 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52198)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1a9URg-0000MC-Nz; Thu, 17 Dec 2015 04:01:56 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 476CC19EF1A;
	Thu, 17 Dec 2015 09:01:56 +0000 (UTC)
Received: from nilsson.home.kraxel.org (ovpn-116-37.ams2.redhat.com
	[10.36.116.37])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBH91sIK008392; Thu, 17 Dec 2015 04:01:55 -0500
Received: by nilsson.home.kraxel.org (Postfix, from userid 500)
	id C2FA680F9D; Thu, 17 Dec 2015 10:01:53 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 17 Dec 2015 10:01:47 +0100
Message-Id: <1450342910-26827-4-git-send-email-kraxel@redhat.com>
In-Reply-To: <1450342910-26827-1-git-send-email-kraxel@redhat.com>
References: <1450342910-26827-1-git-send-email-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, "Gabriel L. Somlo" <somlo@cmu.edu>,
	Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	"open list:ARM ACPI Subsystem" <qemu-arm@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Marc=20Mar=C3=AD?= <markmb@redhat.com>,
	Laszlo Ersek <lersek@redhat.com>, Richard Henderson <rth@twiddle.net>
Subject: [Qemu-devel] [PULL 3/6] fw_cfg: remove offset argument from
	callback prototype
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vvuKuakBGhNo

From: "Gabriel L. Somlo" <somlo@cmu.edu>

Read callbacks are now only invoked at item selection, before any
data is read. As such, the value of the offset argument passed to
the callback will always be 0. Also, the two callback instances
currently in use both leave their offset argument unused.

This patch removes the offset argument from the fw_cfg read callback
prototype, and from the currently available instances. The unused
(write) callback prototype is also removed (write support was removed
earlier, in commit 023e3148).

Cc: Laszlo Ersek <lersek@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Marc Mar=C3=AD <markmb@redhat.com>
Signed-off-by: Gabriel Somlo <somlo@cmu.edu>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Message-id: 1446733972-1602-4-git-send-email-somlo@cmu.edu
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/arm/virt-acpi-build.c  | 2 +-
 hw/i386/acpi-build.c      | 2 +-
 hw/nvram/fw_cfg.c         | 2 +-
 include/hw/nvram/fw_cfg.h | 3 +--
 4 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 3c2c5d6..8fd0b1c 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -631,7 +631,7 @@ static void acpi_ram_update(MemoryRegion *mr, GArray =
*data)
     memory_region_set_dirty(mr, 0, size);
 }
=20
-static void virt_acpi_build_update(void *build_opaque, uint32_t offset)
+static void virt_acpi_build_update(void *build_opaque)
 {
     AcpiBuildState *build_state =3D build_opaque;
     AcpiBuildTables tables;
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 95e0c65..29e30ce 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1818,7 +1818,7 @@ static void acpi_ram_update(MemoryRegion *mr, GArra=
y *data)
     memory_region_set_dirty(mr, 0, size);
 }
=20
-static void acpi_build_update(void *build_opaque, uint32_t offset)
+static void acpi_build_update(void *build_opaque)
 {
     AcpiBuildState *build_state =3D build_opaque;
     AcpiBuildTables tables;
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 6e6414b..c2d3a0a 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -266,7 +266,7 @@ static int fw_cfg_select(FWCfgState *s, uint16_t key)
         arch =3D !!(key & FW_CFG_ARCH_LOCAL);
         e =3D &s->entries[arch][key & FW_CFG_ENTRY_MASK];
         if (e->read_callback) {
-            e->read_callback(e->callback_opaque, s->cur_offset);
+            e->read_callback(e->callback_opaque);
         }
     }
=20
diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
index a1cfaa4..664eaf6 100644
--- a/include/hw/nvram/fw_cfg.h
+++ b/include/hw/nvram/fw_cfg.h
@@ -70,8 +70,7 @@ typedef struct FWCfgDmaAccess {
     uint64_t address;
 } QEMU_PACKED FWCfgDmaAccess;
=20
-typedef void (*FWCfgCallback)(void *opaque, uint8_t *data);
-typedef void (*FWCfgReadCallback)(void *opaque, uint32_t offset);
+typedef void (*FWCfgReadCallback)(void *opaque);
=20
 /**
  * fw_cfg_add_bytes:
--=20
1.8.3.1

