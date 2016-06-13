Received: by 10.25.85.209 with SMTP id j200csp1203849lfb;
        Mon, 13 Jun 2016 06:21:23 -0700 (PDT)
X-Received: by 10.55.144.68 with SMTP id s65mr14242973qkd.209.1465824077419;
        Mon, 13 Jun 2016 06:21:17 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v78si15216801qgv.6.2016.06.13.06.21.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 06:21:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56449 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCRno-0000VA-OM
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 09:21:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48486)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1bCRdh-0008ED-KX
	for qemu-devel@nongnu.org; Mon, 13 Jun 2016 09:10:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1bCRdf-000059-0w
	for qemu-devel@nongnu.org; Mon, 13 Jun 2016 09:10:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48479)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1bCRdT-0008TA-Jz; Mon, 13 Jun 2016 09:10:35 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D986D7F0B1;
	Mon, 13 Jun 2016 13:10:33 +0000 (UTC)
Received: from nilsson.home.kraxel.org (ovpn-116-43.ams2.redhat.com
	[10.36.116.43])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5DDAWJa026172; Mon, 13 Jun 2016 09:10:33 -0400
Received: by nilsson.home.kraxel.org (Postfix, from userid 500)
	id 4E97B81EDA; Mon, 13 Jun 2016 15:10:31 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 13 Jun 2016 15:10:29 +0200
Message-Id: <1465823429-24403-5-git-send-email-kraxel@redhat.com>
In-Reply-To: <1465823429-24403-1-git-send-email-kraxel@redhat.com>
References: <1465823429-24403-1-git-send-email-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 13 Jun 2016 13:10:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 4/4] vl: Eliminate usb_enabled()
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
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Alexander Graf <agraf@suse.de>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rJ0pCd7QDbDa

From: Eduardo Habkost <ehabkost@redhat.com>

This wrapper for machine_usb(current_machine) is not necessary,
replace all usages of usb_enabled() with machine_usb().

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Alexander Graf <agraf@suse.de>
Cc: qemu-arm@nongnu.org
Cc: qemu-ppc@nongnu.org
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Marcel Apfelbaum <marcel@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-id: 1465419025-21519-3-git-send-email-ehabkost@redhat.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/arm/nseries.c        |  2 +-
 hw/arm/realview.c       |  2 +-
 hw/arm/versatilepb.c    |  2 +-
 hw/i386/pc_piix.c       |  2 +-
 hw/i386/pc_q35.c        |  2 +-
 hw/ppc/mac_oldworld.c   |  2 +-
 hw/ppc/prep.c           |  2 +-
 include/sysemu/sysemu.h |  1 -
 vl.c                    | 11 +++--------
 9 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
index d4eb141..fea911e 100644
--- a/hw/arm/nseries.c
+++ b/hw/arm/nseries.c
@@ -1351,7 +1351,7 @@ static void n8x0_init(MachineState *machine,
     n8x0_dss_setup(s);
     n8x0_cbus_setup(s);
     n8x0_uart_setup(s);
-    if (usb_enabled()) {
+    if (machine_usb(machine)) {
         n8x0_usb_setup(s);
     }
 
diff --git a/hw/arm/realview.c b/hw/arm/realview.c
index 7d0aa6f..8eafcca 100644
--- a/hw/arm/realview.c
+++ b/hw/arm/realview.c
@@ -254,7 +254,7 @@ static void realview_init(MachineState *machine,
         sysbus_connect_irq(busdev, 2, pic[50]);
         sysbus_connect_irq(busdev, 3, pic[51]);
         pci_bus = (PCIBus *)qdev_get_child_bus(dev, "pci");
-        if (usb_enabled()) {
+        if (machine_usb(machine)) {
             pci_create_simple(pci_bus, -1, "pci-ohci");
         }
         n = drive_get_max_bus(IF_SCSI);
diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
index 20dd356..8ae5392 100644
--- a/hw/arm/versatilepb.c
+++ b/hw/arm/versatilepb.c
@@ -276,7 +276,7 @@ static void versatile_init(MachineState *machine, int board_id)
             pci_nic_init_nofail(nd, pci_bus, "rtl8139", NULL);
         }
     }
-    if (usb_enabled()) {
+    if (machine_usb(machine)) {
         pci_create_simple(pci_bus, -1, "pci-ohci");
     }
     n = drive_get_max_bus(IF_SCSI);
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 14dd0cc..82c7c0a 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -262,7 +262,7 @@ static void pc_init1(MachineState *machine,
 
     pc_cmos_init(pcms, idebus[0], idebus[1], rtc_state);
 
-    if (pcmc->pci_enabled && usb_enabled()) {
+    if (pcmc->pci_enabled && machine_usb(machine)) {
         pci_create_simple(pci_bus, piix3_devfn + 2, "piix3-usb-uhci");
     }
 
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 04aae89..31a6a59 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -234,7 +234,7 @@ static void pc_q35_init(MachineState *machine)
     ide_drive_get(hd, ICH_AHCI(ahci)->ahci.ports);
     ahci_ide_create_devs(ahci, hd);
 
-    if (usb_enabled()) {
+    if (machine_usb(machine)) {
         /* Should we create 6 UHCI according to ich9 spec? */
         ehci_create_ich9_with_companions(host_bus, 0x1d);
     }
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index a9bb1c2..4479487 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -309,7 +309,7 @@ static void ppc_heathrow_init(MachineState *machine)
     dev = qdev_create(adb_bus, TYPE_ADB_MOUSE);
     qdev_init_nofail(dev);
 
-    if (usb_enabled()) {
+    if (machine_usb(machine)) {
         pci_create_simple(pci_bus, -1, "pci-ohci");
     }
 
diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
index 07ffe72..054af1e 100644
--- a/hw/ppc/prep.c
+++ b/hw/ppc/prep.c
@@ -649,7 +649,7 @@ static void ppc_prep_init(MachineState *machine)
     memory_region_add_subregion(sysmem, 0xFEFF0000, xcsr);
 #endif
 
-    if (usb_enabled()) {
+    if (machine_usb(machine)) {
         pci_create_simple(pci_bus, -1, "pci-ohci");
     }
 
diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 9428141..7313673 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -233,7 +233,6 @@ void qemu_boot_set(const char *boot_order, Error **errp);
 QemuOpts *qemu_get_machine_opts(void);
 
 bool defaults_enabled(void);
-bool usb_enabled(void);
 
 extern QemuOptsList qemu_legacy_drive_opts;
 extern QemuOptsList qemu_common_drive_opts;
diff --git a/vl.c b/vl.c
index b0bcc25..45eff56 100644
--- a/vl.c
+++ b/vl.c
@@ -1072,11 +1072,6 @@ bool defaults_enabled(void)
     return has_defaults;
 }
 
-bool usb_enabled(void)
-{
-    return machine_usb(current_machine);
-}
-
 #ifndef _WIN32
 static int parse_add_fd(void *opaque, QemuOpts *opts, Error **errp)
 {
@@ -1393,7 +1388,7 @@ static int usb_device_add(const char *devname)
     const char *p;
 #endif
 
-    if (!usb_enabled()) {
+    if (!machine_usb(current_machine)) {
         return -1;
     }
 
@@ -1425,7 +1420,7 @@ static int usb_device_del(const char *devname)
         return -1;
     }
 
-    if (!usb_enabled()) {
+    if (!machine_usb(current_machine)) {
         return -1;
     }
 
@@ -4501,7 +4496,7 @@ int main(int argc, char **argv, char **envp)
     }
 
     /* init USB devices */
-    if (usb_enabled()) {
+    if (machine_usb(current_machine)) {
         if (foreach_device_config(DEV_USB, usb_parse) < 0)
             exit(1);
     }
-- 
1.8.3.1

