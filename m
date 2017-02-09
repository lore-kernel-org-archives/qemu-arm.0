Received: by 10.25.77.65 with SMTP id a62csp304692lfb;
        Thu, 9 Feb 2017 04:53:46 -0800 (PST)
X-Received: by 10.55.54.19 with SMTP id d19mr2891081qka.290.1486644826201;
        Thu, 09 Feb 2017 04:53:46 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w29si7912402qtc.100.2017.02.09.04.53.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Feb 2017 04:53:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37425 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cboEJ-0002rD-Fx
	for alex.bennee@linaro.org; Thu, 09 Feb 2017 07:53:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59133)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1cboDx-0002bG-7e
	for qemu-arm@nongnu.org; Thu, 09 Feb 2017 07:53:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1cboDs-0007OU-Ct
	for qemu-arm@nongnu.org; Thu, 09 Feb 2017 07:53:21 -0500
Received: from mx2.suse.de ([195.135.220.15]:54704)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <agraf@suse.de>)
	id 1cboDs-0007O0-74; Thu, 09 Feb 2017 07:53:16 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id D4471AD63;
	Thu,  9 Feb 2017 12:53:14 +0000 (UTC)
From: Alexander Graf <agraf@suse.de>
To: qemu-devel@nongnu.org
Date: Thu,  9 Feb 2017 13:53:27 +0100
Message-Id: <1486644810-33181-2-git-send-email-agraf@suse.de>
X-Mailer: git-send-email 1.8.5.6
In-Reply-To: <1486644810-33181-1-git-send-email-agraf@suse.de>
References: <1486644810-33181-1-git-send-email-agraf@suse.de>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic] [fuzzy]
X-Received-From: 195.135.220.15
Subject: [Qemu-arm] [PATCH v2 1/4] target-arm: Declare virtio-mmio as
 dma-coherent in dt
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>, qemu-arm@nongnu.org,
	Laszlo Ersek <lersek@redhat.com>,
	Shannon Zhao <shannon.zhao@linaro.org>, mst@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sdfL94GWYn71

QEMU emulated hardware is always dma coherent with its guest. We do
annotate that correctly on the PCI host controller, but left out
virtio-mmio.

Recent kernels have started to interpret that flag rather than take
dma coherency as granted with virtio-mmio. While that is considered
a kernel bug, as it breaks previously working systems, it showed that
our dt description is incomplete.

This patch adds the respective marker that allows guest OSs to evaluate
that our virtio-mmio devices are indeed cache coherent.

Signed-off-by: Alexander Graf <agraf@suse.de>
---
 hw/arm/vexpress.c | 1 +
 hw/arm/virt.c     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index 58760f4..e057568 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -452,6 +452,7 @@ static int add_virtio_mmio_node(void *fdt, uint32_t acells, uint32_t scells,
                                        acells, addr, scells, size);
     qemu_fdt_setprop_cells(fdt, nodename, "interrupt-parent", intc);
     qemu_fdt_setprop_cells(fdt, nodename, "interrupts", 0, irq, 1);
+    qemu_fdt_setprop(fdt, nodename, "dma-coherent", NULL, 0);
     g_free(nodename);
     if (rc) {
         return -1;
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 1f216cf..14881fa 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -797,6 +797,7 @@ static void create_virtio_devices(const VirtMachineState *vms, qemu_irq *pic)
         qemu_fdt_setprop_cells(vms->fdt, nodename, "interrupts",
                                GIC_FDT_IRQ_TYPE_SPI, irq,
                                GIC_FDT_IRQ_FLAGS_EDGE_LO_HI);
+        qemu_fdt_setprop(vms->fdt, nodename, "dma-coherent", NULL, 0);
         g_free(nodename);
     }
 }
-- 
2.10.0

