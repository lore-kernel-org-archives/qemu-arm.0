Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp2260639wrx;
        Sun, 7 Apr 2019 01:19:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzA+LQYYt0hUcwEUxkdlR2O21ot2MNgBPJVI2wYU7RGDG2DcT04GA1hSk/Z1MzrxU0DnaUF
X-Received: by 2002:a05:6000:120c:: with SMTP id e12mr13820741wrx.187.1554625160146;
        Sun, 07 Apr 2019 01:19:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554625160; cv=none;
        d=google.com; s=arc-20160816;
        b=q6Wpnt4EQxI5FLRm0/g2RjAzMkD0j3X0H175ec0cMo2WC1o9M6g0XfIu/UMd/ut0qg
         E3I3KxICKlA3z2ehAscdlWpzBvGrIMzqI+zXnziYEuiMx7lXSzwbeYmXJvgE0QcQlgJD
         couEhlbiglzPCbvJGsuquEHCoh//nbjTiKJ0y56ns1Ti4F+Afnca0Lemb0n117Rf8QNZ
         Zc3vo9lOsyN/Q7iey+Nfl8G63QvYa9MW0fAPK29xZUPDQcjScsR3nZPxstIrCIl2lNNt
         esrKLYgf1fzp/Poi8ALgCFlLzTwAm4NzQcB8PyIJOlY/qt6s4vtZgr9vxjVjPkk5Lyxm
         0jSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from;
        bh=OaYSKgyBx78FDdOLQW0M6frPrrJXhIfQkIQMC3Ky57E=;
        b=EH5Dp6NpBX6aLcix9Lwi+CuAJ6n5iJFzDfXuPZFTFqo1nHxnWF4QCxldXH59sbOkQW
         c9YW+ncFXu53PAAIWw35EMkT2a01zkLcqbcNvdwbYS8d1DrL8E7BlLK3w4fLZB6i4Zjc
         mSUPiqoTUsbtoYK0ck8HgpH7R3RyOpwm1qsWUb9ki6/DaV/cIV+zi8p2qZ17ab48ri8A
         4ZcQhQZJLahIj8fnNb0fhqKVTDeHd4wLWrkhsH2M2feEz5+BBZ8C/bG0p1Hp3X33EX3U
         3KcnjcqTGftqFz22TZny6PXsf6IAjpzVfLPDV2tpFD6vsxkqRUPsSRozC6o0XuZ8ibID
         4dAg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1si17153219wrq.7.2019.04.07.01.19.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 07 Apr 2019 01:19:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:35929 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hD31J-0001AT-ML
	for alex.bennee@linaro.org; Sun, 07 Apr 2019 04:19:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34211)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <guoheyi@huawei.com>) id 1hD317-0001AC-To
	for qemu-arm@nongnu.org; Sun, 07 Apr 2019 04:19:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <guoheyi@huawei.com>) id 1hD316-000727-Ns
	for qemu-arm@nongnu.org; Sun, 07 Apr 2019 04:19:05 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2257 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <guoheyi@huawei.com>)
	id 1hD316-0006yN-96; Sun, 07 Apr 2019 04:19:04 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id B4069CDBAB1A1E366A48;
	Sun,  7 Apr 2019 16:18:58 +0800 (CST)
Received: from linux-wjgadX.huawei.com (10.90.31.46) by
	DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server
	id 14.3.408.0; Sun, 7 Apr 2019 16:18:52 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Date: Sun, 7 Apr 2019 16:14:53 +0800
Message-ID: <1554624893-8363-1-git-send-email-guoheyi@huawei.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.191
Subject: [Qemu-arm] [RFC] arm/virt: add one more uart for UEFI runtime debug
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
Cc: Heyi Guo <guoheyi@huawei.com>, wanghaibin.wang@huawei.com,
	Laszlo Ersek <lersek@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fMux+VPBX2NQ

This patch is based on the discussion in TianoCore edk2-devel mailing
list:
https://lists.01.org/pipermail/edk2-devel/2019-March/037986.html

The conclusion is that we need an individual UART for UEFI runtime
services to print debug message at runtime, to avoid conflicting with
the system UART. We cannot use the secure UART either, for we may both
have Trusted Firmware and UEFI runtime services running on the VM, and
it is not easy to keep synchronization between the two components.

To keep backward compatibility, UEFI UART is put behind the secure
UART when secure world is enabled.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Heyi Guo <guoheyi@huawei.com>
---
 hw/arm/virt.c         | 29 +++++++++++++++++++++++------
 include/hw/arm/virt.h |  1 +
 2 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ce2664a..cbc5a66 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -131,6 +131,7 @@ static const MemMapEntry base_memmap[] = {
     [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
     [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
     [VIRT_SMMU] =               { 0x09050000, 0x00020000 },
+    [VIRT_UEFI_UART] =          { 0x09070000, 0x00001000 },
     [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
     /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
     [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
@@ -166,6 +167,7 @@ static const int a15irqmap[] = {
     [VIRT_PCIE] = 3, /* ... to 6 */
     [VIRT_GPIO] = 7,
     [VIRT_SECURE_UART] = 8,
+    [VIRT_UEFI_UART] = 9,
     [VIRT_MMIO] = 16, /* ...to 16 + NUM_VIRTIO_TRANSPORTS - 1 */
     [VIRT_GIC_V2M] = 48, /* ...to 48 + NUM_GICV2M_SPIS - 1 */
     [VIRT_SMMU] = 74,    /* ...to 74 + NUM_SMMU_IRQS - 1 */
@@ -713,13 +715,23 @@ static void create_uart(const VirtMachineState *vms, qemu_irq *pic, int uart,
     if (uart == VIRT_UART) {
         qemu_fdt_setprop_string(vms->fdt, "/chosen", "stdout-path", nodename);
     } else {
+        const char *status_string;
+
+        if (uart == VIRT_SECURE_UART) {
+            status_string = "secure-status";
+        } else {
+            status_string = "uefi-status";
+        }
+
         /* Mark as not usable by the normal world */
         qemu_fdt_setprop_string(vms->fdt, nodename, "status", "disabled");
-        qemu_fdt_setprop_string(vms->fdt, nodename, "secure-status", "okay");
+        qemu_fdt_setprop_string(vms->fdt, nodename, status_string, "okay");
 
-        qemu_fdt_add_subnode(vms->fdt, "/secure-chosen");
-        qemu_fdt_setprop_string(vms->fdt, "/secure-chosen", "stdout-path",
-                                nodename);
+        if (uart == VIRT_SECURE_UART) {
+            qemu_fdt_add_subnode(vms->fdt, "/secure-chosen");
+            qemu_fdt_setprop_string(vms->fdt, "/secure-chosen", "stdout-path",
+                                    nodename);
+        }
     }
 
     g_free(nodename);
@@ -1423,6 +1435,7 @@ static void machvirt_init(MachineState *machine)
     MemoryRegion *ram = g_new(MemoryRegion, 1);
     bool firmware_loaded = bios_name || drive_get(IF_PFLASH, 0, 0);
     bool aarch64 = true;
+    int uart_index = 0;
 
     /*
      * In accelerated mode, the memory map is computed earlier in kvm_type()
@@ -1616,13 +1629,17 @@ static void machvirt_init(MachineState *machine)
 
     fdt_add_pmu_nodes(vms);
 
-    create_uart(vms, pic, VIRT_UART, sysmem, serial_hd(0));
+    create_uart(vms, pic, VIRT_UART, sysmem, serial_hd(uart_index++));
 
     if (vms->secure) {
         create_secure_ram(vms, secure_sysmem);
-        create_uart(vms, pic, VIRT_SECURE_UART, secure_sysmem, serial_hd(1));
+        create_uart(vms, pic, VIRT_SECURE_UART, secure_sysmem,
+                    serial_hd(uart_index++));
     }
 
+    /* Create UART for UEFI runtime services debug */
+    create_uart(vms, pic, VIRT_UEFI_UART, sysmem, serial_hd(uart_index));
+
     vms->highmem_ecam &= vms->highmem && (!firmware_loaded || aarch64);
 
     create_rtc(vms, pic);
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 507517c..565769f 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -77,6 +77,7 @@ enum {
     VIRT_GPIO,
     VIRT_SECURE_UART,
     VIRT_SECURE_MEM,
+    VIRT_UEFI_UART,
     VIRT_LOWMEMMAP_LAST,
 };
 
-- 
1.8.3.1

