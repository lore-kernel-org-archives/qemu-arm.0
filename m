Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2053932lfg;
        Sat, 27 Mar 2021 01:28:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9uORFqNNPFduE3lltqNlh59wN4aWwWdZrBU2DVxJ46THewfBD1BFIAJYrKT4sSg5NbNVm
X-Received: by 2002:a25:db4c:: with SMTP id g73mr24646836ybf.2.1616833710496;
        Sat, 27 Mar 2021 01:28:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616833710; cv=none;
        d=google.com; s=arc-20160816;
        b=AuGAHMHXC8Y2X8GoIt6HauP9EKLpzOmBbU/2eHT2pnd3lyawVLLUS4FH3lJD9UuWFn
         cRG+zcXG03j5PmWZJWX8DxbYNLtihkhNtsECog5/Nl9YTpLRbLjO1vOyL07u6Wh5T73v
         1YBG6gl84aabkKlVoFkmEAh1QbOAWktH+n3//DcCQbmKhhZlTufNwXFSYGkh34qUN1gO
         hAZOop+qaplJCGSOGMJR2GCK1kDuWOR6GjIbNs9QYnQoi5oCiyJJxnmp9Sn4dSlJK3Sq
         Mvhwyf9CcUccnJURniXStbeQBp/z6J4KQuCEWcoQMqnx4GZOC4iQdlN3xPqKEKHMHnXA
         r6pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=cFhvxZPnQMNjWaFOpwDWJG8JPND0PFSBZCTtOixDLZE=;
        b=pbUWTcf23Mq8UFJOAKgj9re9uIltXa7nlM+DKnMRPOH62XT6pBK7nfOEl2+VXRcJwi
         QZnfFbz8BFKV9qvYE5jlV6zoVtHYZRtAgBV+hSHZVUT6+mvJl0CZuqNJM3hhJsnFD5V5
         zFIyxhe57Vejr53x9w5gHkQ/WtiZB1IYfUnKZxstrGh0k6zPX3a4WuHCV1+yuqf2vzdu
         yve9X8ewhxWjmLt4NC1nw4i6p+j2QYtNU3hjsbpMiQZLKqCh8W9m/YgOK8UsJEsRXg2N
         UzLqZTqlUWV57nAIvjm79EiTv13mt2g8s85obfTRdn8j1uv61ZZnCC6No4H0xFmUwIyf
         WwdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="A/QqKUDg";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l4si7079781ybt.97.2021.03.27.01.28.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 27 Mar 2021 01:28:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="A/QqKUDg";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lQ4J3-0004HJ-QV
	for alex.bennee@linaro.org; Sat, 27 Mar 2021 04:28:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lQ4Iq-0004Gq-Ny
 for qemu-arm@nongnu.org; Sat, 27 Mar 2021 04:28:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lQ4In-00070a-8G
 for qemu-arm@nongnu.org; Sat, 27 Mar 2021 04:28:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616833691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cFhvxZPnQMNjWaFOpwDWJG8JPND0PFSBZCTtOixDLZE=;
 b=A/QqKUDgomUN7UqCGcCRFsu1M5iAq3aoL08dQ/CHEpDl5FJ+62kcHWLv2USwABtdvsdCpv
 uAzjCRuFDEV9ku80747XWYDYknbOxs3Ar9swt5qzS6VZWv93xM3vpYVSDuXmSqxrD347/D
 JE/CIeWQ6hTaMI6Rr0QyYfDuRcHXTT0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-dc4bf2OpPQqXsz0xmefH-g-1; Sat, 27 Mar 2021 04:28:09 -0400
X-MC-Unique: dc4bf2OpPQqXsz0xmefH-g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1BA0B10059C0;
 Sat, 27 Mar 2021 08:28:08 +0000 (UTC)
Received: from thuth.com (ovpn-112-12.ams2.redhat.com [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8B2695DDAD;
 Sat, 27 Mar 2021 08:28:06 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw: Do not include hw/sysbus.h if it is not necessary
Date: Sat, 27 Mar 2021 09:28:04 +0100
Message-Id: <20210327082804.2259480-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /UVrxRDnVt9W

Many files include hw/sysbus.h without needing it. Remove the superfluous
include statements.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/cubieboard.c         | 1 -
 hw/arm/orangepi.c           | 1 -
 hw/char/riscv_htif.c        | 1 -
 hw/char/sifive_uart.c       | 1 -
 hw/char/virtio-serial-bus.c | 1 -
 hw/core/generic-loader.c    | 1 -
 hw/core/guest-loader.c      | 1 -
 hw/ide/ahci_internal.h      | 1 -
 hw/input/lasips2.c          | 1 -
 hw/intc/arm_gic_kvm.c       | 1 -
 hw/intc/arm_gicv3.c         | 1 -
 hw/intc/arm_gicv3_kvm.c     | 1 -
 hw/intc/s390_flic_kvm.c     | 1 -
 hw/isa/lpc_ich9.c           | 1 -
 hw/isa/piix4.c              | 1 -
 hw/moxie/moxiesim.c         | 1 -
 hw/nios2/generic_nommu.c    | 1 -
 hw/nubus/nubus-bus.c        | 1 -
 hw/nvram/spapr_nvram.c      | 1 -
 hw/rx/rx-gdbsim.c           | 1 -
 hw/s390x/s390-ccw.c         | 1 -
 hw/s390x/virtio-ccw.c       | 1 -
 hw/timer/mips_gictimer.c    | 1 -
 hw/usb/xen-usb.c            | 1 -
 hw/vfio/ap.c                | 1 -
 hw/vfio/ccw.c               | 1 -
 hw/xen/xen-bus-helper.c     | 1 -
 27 files changed, 27 deletions(-)

diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
index 9d0d728180..3ec30ca5af 100644
--- a/hw/arm/cubieboard.c
+++ b/hw/arm/cubieboard.c
@@ -20,7 +20,6 @@
 #include "qapi/error.h"
 #include "cpu.h"
 #include "sysemu/sysemu.h"
-#include "hw/sysbus.h"
 #include "hw/boards.h"
 #include "hw/qdev-properties.h"
 #include "hw/arm/allwinner-a10.h"
diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c
index 40cdb5c6d2..b8d38c9e8d 100644
--- a/hw/arm/orangepi.c
+++ b/hw/arm/orangepi.c
@@ -22,7 +22,6 @@
 #include "exec/address-spaces.h"
 #include "qapi/error.h"
 #include "cpu.h"
-#include "hw/sysbus.h"
 #include "hw/boards.h"
 #include "hw/qdev-properties.h"
 #include "hw/arm/allwinner-h3.h"
diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
index ba1af1cfc4..ddae738d56 100644
--- a/hw/char/riscv_htif.c
+++ b/hw/char/riscv_htif.c
@@ -23,7 +23,6 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/log.h"
-#include "hw/sysbus.h"
 #include "hw/char/riscv_htif.h"
 #include "hw/char/serial.h"
 #include "chardev/char.h"
diff --git a/hw/char/sifive_uart.c b/hw/char/sifive_uart.c
index ee7adb8e30..fe12666789 100644
--- a/hw/char/sifive_uart.c
+++ b/hw/char/sifive_uart.c
@@ -19,7 +19,6 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/log.h"
-#include "hw/sysbus.h"
 #include "chardev/char.h"
 #include "chardev/char-fe.h"
 #include "hw/irq.h"
diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
index b20038991a..dd6bc27b3b 100644
--- a/hw/char/virtio-serial-bus.c
+++ b/hw/char/virtio-serial-bus.c
@@ -28,7 +28,6 @@
 #include "qemu/error-report.h"
 #include "qemu/queue.h"
 #include "hw/qdev-properties.h"
-#include "hw/sysbus.h"
 #include "trace.h"
 #include "hw/virtio/virtio-serial.h"
 #include "hw/virtio/virtio-access.h"
diff --git a/hw/core/generic-loader.c b/hw/core/generic-loader.c
index 2b2a7b5e9a..d14f932eea 100644
--- a/hw/core/generic-loader.c
+++ b/hw/core/generic-loader.c
@@ -32,7 +32,6 @@
 
 #include "qemu/osdep.h"
 #include "hw/core/cpu.h"
-#include "hw/sysbus.h"
 #include "sysemu/dma.h"
 #include "sysemu/reset.h"
 #include "hw/boards.h"
diff --git a/hw/core/guest-loader.c b/hw/core/guest-loader.c
index bde44e27b4..d3f9d1a06e 100644
--- a/hw/core/guest-loader.c
+++ b/hw/core/guest-loader.c
@@ -26,7 +26,6 @@
 
 #include "qemu/osdep.h"
 #include "hw/core/cpu.h"
-#include "hw/sysbus.h"
 #include "sysemu/dma.h"
 #include "hw/loader.h"
 #include "hw/qdev-properties.h"
diff --git a/hw/ide/ahci_internal.h b/hw/ide/ahci_internal.h
index 7f32e87731..109de9e2d1 100644
--- a/hw/ide/ahci_internal.h
+++ b/hw/ide/ahci_internal.h
@@ -26,7 +26,6 @@
 
 #include "hw/ide/ahci.h"
 #include "hw/ide/internal.h"
-#include "hw/sysbus.h"
 #include "hw/pci/pci.h"
 
 #define AHCI_MEM_BAR_SIZE         0x1000
diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 60afb94c78..275737842e 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -26,7 +26,6 @@
 #include "hw/qdev-properties.h"
 #include "hw/input/ps2.h"
 #include "hw/input/lasips2.h"
-#include "hw/sysbus.h"
 #include "exec/hwaddr.h"
 #include "sysemu/sysemu.h"
 #include "trace.h"
diff --git a/hw/intc/arm_gic_kvm.c b/hw/intc/arm_gic_kvm.c
index 9494185cf4..49f79a8674 100644
--- a/hw/intc/arm_gic_kvm.c
+++ b/hw/intc/arm_gic_kvm.c
@@ -23,7 +23,6 @@
 #include "qapi/error.h"
 #include "qemu/module.h"
 #include "cpu.h"
-#include "hw/sysbus.h"
 #include "migration/blocker.h"
 #include "sysemu/kvm.h"
 #include "kvm_arm.h"
diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
index 66eaa97198..d63f8af604 100644
--- a/hw/intc/arm_gicv3.c
+++ b/hw/intc/arm_gicv3.c
@@ -18,7 +18,6 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
-#include "hw/sysbus.h"
 #include "hw/intc/arm_gicv3.h"
 #include "gicv3_internal.h"
 
diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 65a4c880a3..5c09f00dec 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -22,7 +22,6 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/intc/arm_gicv3_common.h"
-#include "hw/sysbus.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "sysemu/kvm.h"
diff --git a/hw/intc/s390_flic_kvm.c b/hw/intc/s390_flic_kvm.c
index b3fb9f8395..d1c8fb8016 100644
--- a/hw/intc/s390_flic_kvm.c
+++ b/hw/intc/s390_flic_kvm.c
@@ -17,7 +17,6 @@
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "qapi/error.h"
-#include "hw/sysbus.h"
 #include "sysemu/kvm.h"
 #include "hw/s390x/s390_flic.h"
 #include "hw/s390x/adapter.h"
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 3963b73520..160bea447a 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -34,7 +34,6 @@
 #include "qapi/visitor.h"
 #include "qemu/range.h"
 #include "hw/isa/isa.h"
-#include "hw/sysbus.h"
 #include "migration/vmstate.h"
 #include "hw/irq.h"
 #include "hw/isa/apm.h"
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index a50d97834c..d2d9196039 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -29,7 +29,6 @@
 #include "hw/southbridge/piix.h"
 #include "hw/pci/pci.h"
 #include "hw/isa/isa.h"
-#include "hw/sysbus.h"
 #include "hw/intc/i8259.h"
 #include "hw/dma/i8257.h"
 #include "hw/timer/i8254.h"
diff --git a/hw/moxie/moxiesim.c b/hw/moxie/moxiesim.c
index f7b57fcae1..196b730589 100644
--- a/hw/moxie/moxiesim.c
+++ b/hw/moxie/moxiesim.c
@@ -29,7 +29,6 @@
 #include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "cpu.h"
-#include "hw/sysbus.h"
 #include "net/net.h"
 #include "sysemu/reset.h"
 #include "sysemu/sysemu.h"
diff --git a/hw/nios2/generic_nommu.c b/hw/nios2/generic_nommu.c
index 19899e2c1e..b70a42dc2f 100644
--- a/hw/nios2/generic_nommu.c
+++ b/hw/nios2/generic_nommu.c
@@ -31,7 +31,6 @@
 #include "qemu-common.h"
 #include "cpu.h"
 
-#include "hw/sysbus.h"
 #include "hw/char/serial.h"
 #include "hw/boards.h"
 #include "exec/memory.h"
diff --git a/hw/nubus/nubus-bus.c b/hw/nubus/nubus-bus.c
index 942a6d5342..5c13452308 100644
--- a/hw/nubus/nubus-bus.c
+++ b/hw/nubus/nubus-bus.c
@@ -10,7 +10,6 @@
 
 #include "qemu/osdep.h"
 #include "hw/nubus/nubus.h"
-#include "hw/sysbus.h"
 #include "qapi/error.h"
 
 
diff --git a/hw/nvram/spapr_nvram.c b/hw/nvram/spapr_nvram.c
index 01f7752014..3bb4654c58 100644
--- a/hw/nvram/spapr_nvram.c
+++ b/hw/nvram/spapr_nvram.c
@@ -33,7 +33,6 @@
 #include "sysemu/device_tree.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/runstate.h"
-#include "hw/sysbus.h"
 #include "migration/vmstate.h"
 #include "hw/nvram/chrp_nvram.h"
 #include "hw/ppc/spapr.h"
diff --git a/hw/rx/rx-gdbsim.c b/hw/rx/rx-gdbsim.c
index 8c611b0a59..9b82feff52 100644
--- a/hw/rx/rx-gdbsim.c
+++ b/hw/rx/rx-gdbsim.c
@@ -22,7 +22,6 @@
 #include "qapi/error.h"
 #include "qemu-common.h"
 #include "cpu.h"
-#include "hw/sysbus.h"
 #include "hw/loader.h"
 #include "hw/rx/rx62n.h"
 #include "sysemu/sysemu.h"
diff --git a/hw/s390x/s390-ccw.c b/hw/s390x/s390-ccw.c
index b497571863..242491a1ae 100644
--- a/hw/s390x/s390-ccw.c
+++ b/hw/s390x/s390-ccw.c
@@ -15,7 +15,6 @@
 #include <libgen.h>
 #include "qapi/error.h"
 #include "qemu/module.h"
-#include "hw/sysbus.h"
 #include "hw/s390x/css.h"
 #include "hw/s390x/css-bridge.h"
 #include "hw/s390x/s390-ccw.h"
diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
index 06c0605681..1351aa3db7 100644
--- a/hw/s390x/virtio-ccw.c
+++ b/hw/s390x/virtio-ccw.c
@@ -17,7 +17,6 @@
 #include "hw/virtio/virtio.h"
 #include "migration/qemu-file-types.h"
 #include "hw/virtio/virtio-net.h"
-#include "hw/sysbus.h"
 #include "qemu/bitops.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
diff --git a/hw/timer/mips_gictimer.c b/hw/timer/mips_gictimer.c
index bc44cd934e..2b0696d4ac 100644
--- a/hw/timer/mips_gictimer.c
+++ b/hw/timer/mips_gictimer.c
@@ -7,7 +7,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/sysbus.h"
 #include "qemu/timer.h"
 #include "hw/timer/mips_gictimer.h"
 
diff --git a/hw/usb/xen-usb.c b/hw/usb/xen-usb.c
index 4d266d7bb4..0f7369e7ed 100644
--- a/hw/usb/xen-usb.c
+++ b/hw/usb/xen-usb.c
@@ -26,7 +26,6 @@
 #include "qemu/config-file.h"
 #include "qemu/main-loop.h"
 #include "qemu/option.h"
-#include "hw/sysbus.h"
 #include "hw/usb.h"
 #include "hw/xen/xen-legacy-backend.h"
 #include "monitor/qdev.h"
diff --git a/hw/vfio/ap.c b/hw/vfio/ap.c
index 9571c2f91f..f9dbec37da 100644
--- a/hw/vfio/ap.c
+++ b/hw/vfio/ap.c
@@ -14,7 +14,6 @@
 #include <linux/vfio.h>
 #include <sys/ioctl.h>
 #include "qapi/error.h"
-#include "hw/sysbus.h"
 #include "hw/vfio/vfio.h"
 #include "hw/vfio/vfio-common.h"
 #include "hw/s390x/ap-device.h"
diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
index b2df708e4b..e752c845e9 100644
--- a/hw/vfio/ccw.c
+++ b/hw/vfio/ccw.c
@@ -20,7 +20,6 @@
 #include <sys/ioctl.h>
 
 #include "qapi/error.h"
-#include "hw/sysbus.h"
 #include "hw/vfio/vfio.h"
 #include "hw/vfio/vfio-common.h"
 #include "hw/s390x/s390-ccw.h"
diff --git a/hw/xen/xen-bus-helper.c b/hw/xen/xen-bus-helper.c
index b459bb9396..5a1e12b374 100644
--- a/hw/xen/xen-bus-helper.c
+++ b/hw/xen/xen-bus-helper.c
@@ -6,7 +6,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/sysbus.h"
 #include "hw/xen/xen.h"
 #include "hw/xen/xen-bus.h"
 #include "hw/xen/xen-bus-helper.h"
-- 
2.27.0

