Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp2964654wre;
        Mon, 28 May 2018 16:39:32 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIY0FoHx2n1qfonkSvKCVsZ+OD5qqV0NBmyL5DseCfpbEiNUhCrQlPgjE9+AQG5G+/tvQd0
X-Received: by 2002:a0c:9781:: with SMTP id l1-v6mr4197883qvd.64.1527550772148;
        Mon, 28 May 2018 16:39:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527550772; cv=none;
        d=google.com; s=arc-20160816;
        b=TqQG631Im57E/YXTq52whhMQdsu2dUR1Fzru3j+N6N6DoQz5Gj01M/n+aVh+xewqGq
         USTJkZk+IrmSjmQXD5UYmoR6X+fmsFBTq/Xo+jvwx0+mO1IZj9JlmSiT5h7924SD01ZS
         q6A7B3XPVSpILDSUuRWWkh+ZoZ3TC5fIXotvSo6QbNvaA8jRZulEgYZfi1Ne2MhJ4L0c
         zGNoWSdm+hFh5UH8whxwup4Flm6pjB3w3TplXYjH2/WtNVgOow7DZKYbQFjRjvRUlTVd
         CLqinIFdyuI+rV/71FCdoHkTnp87TTGy8KJr+cXbgPdmxAw5cXVZLrO31oTVdzNAyQW2
         WvEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=RvyTWQK4IVshF6tgbiQNR16lbtDMJb01dTVsShZHb54=;
        b=PzHDEKmophHcGpKciVv9b/2vtPSCpBxM7hhf5bZPsgGYsZDc9vaV9RRCNj9tyhE/Q3
         tA+s24MrLviWKdLz5gWj71unRgx5ZlYkkqiGmzmFCSQZ1sFnezv8H+10xj8tZ3V3fXw2
         GyWZ5VXVqiNsJK5fhwPMbF188ujrRQkLfx290zIQHBdDOuf4XNXpqg3QgIAVjCYnKKpn
         PdCIM89Dngv2EalN4aQQjI+UEq8nyFBtsa4l7bPRYIsA9/rx4a05Fyog/yxP1hksF3RR
         U//xHQon9yshayIqVphUDCrI3BVgjjc/Fkdhpv/fX8NC5HkFmyH0/knmiDa/eiqGVZZn
         XwcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HKPif/M0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x64-v6si6419183qvx.96.2018.05.28.16.39.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 May 2018 16:39:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HKPif/M0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58234 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNRjf-0006y9-I2
	for alex.bennee@linaro.org; Mon, 28 May 2018 19:39:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33037)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRZ3-0007Wi-D5
	for qemu-devel@nongnu.org; Mon, 28 May 2018 19:28:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRZ1-0001Sx-4A
	for qemu-devel@nongnu.org; Mon, 28 May 2018 19:28:33 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:40744)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRZ0-0001Sb-UT; Mon, 28 May 2018 19:28:31 -0400
Received: by mail-qk0-x242.google.com with SMTP id r66-v6so10188677qkr.7;
	Mon, 28 May 2018 16:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=RvyTWQK4IVshF6tgbiQNR16lbtDMJb01dTVsShZHb54=;
	b=HKPif/M0Zv7bPPhLGCagcwZn0DVDa1t2Z2nUS4zx6d38WNXw5QxFqLuDhpl++5PaNs
	3NSX4Y+J1Un0UE3+vETcFAJrDfBj72IM5RDpB7KkEg40RXfpAmIRC5MjXeYTroyALkrT
	rPyvSuPlJRo0gE7r7PalccW6gr3ykSw1ofCDJ09eUozm0Vf9Dr5sN384tEYle6EBVazs
	P7ynC17/DFkdaygvL53rYe82EWHR5geH6E0c/SSQ68LBcb6nsd2Xd0XyjGcslwjwLdzX
	oCr3wQQ8BH3es2pVks6aM2rF9ctGFmCJUIAFHcl3AFgV/q0QvbQFlMkgN1L4e4/ELUdX
	GU+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=RvyTWQK4IVshF6tgbiQNR16lbtDMJb01dTVsShZHb54=;
	b=rtaY4mADmWTv71pukO4xPvWqlY0g/AN+5sQQKiFyVqdyahE/wSfjRdrO8qTHycn0aI
	OjSGKW4U6VIsxHdTeDgGvs6Uzt7XSLfcZDo3fZx/zHuNS1IkA0RIAevPCBko0aCqGqwY
	ua1haAMZsXe1cRe2AL+ABRvAJSNrcZfjC7+wudgpNnp7HArR7w3aBLNc0+/A4aknZK2r
	I9AJ41A2RmmN0YuJYuRvgnbOj5AokzPDGGh1tQZHS8C1oEI4JrxxpSx7LDgdpZ6CCsiE
	gN74MuEMiVpfeS8+r/dMsya2ZS+RHT7z/zbtht3f0L2X3hlc1Me2HKbCIoedxIrODwhQ
	x2Dg==
X-Gm-Message-State: ALKqPwdHpIlsXnSN4P3OSCbErJfYzuPWR7DQqU9ML2S/319HyCxHYB9q
	48IyYKSAs8D9A8Z0i/TNQSY=
X-Received: by 2002:a37:4cf:: with SMTP id
	198-v6mr1953230qke.186.1527550110149; 
	Mon, 28 May 2018 16:28:30 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	s19-v6sm23756182qki.62.2018.05.28.16.28.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 May 2018 16:28:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Date: Mon, 28 May 2018 20:27:10 -0300
Message-Id: <20180528232719.4721-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180528232719.4721-1-f4bug@amsat.org>
References: <20180528232719.4721-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-devel] [PATCH v4 12/21] hw: Do not include
 "sysemu/block-backend.h" if it is not necessary
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
	David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
	Max Filippov <jcmvbkbc@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Yongbok Kim <yongbok.kim@mips.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"open list:virtio-blk" <qemu-block@nongnu.org>,
	qemu-trivial@nongnu.org, Magnus Damm <magnus.damm@gmail.com>,
	Alexander Graf <agraf@suse.de>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	"open list:X86" <xen-devel@lists.xenproject.org>,
	David Gibson <david@gibson.dropbear.id.au>, Fam Zheng <famz@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	"open list:virtio-ccw" <qemu-s390x@nongnu.org>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Kevin Wolf <kwolf@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Max Reitz <mreitz@redhat.com>, Michael Walle <michael@walle.cc>,
	"open list:sPAPR" <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: S9PD0mOtsLqB

Remove those unneeded includes to speed up the compilation
process a little bit. (Continue 7eceff5b5a1fa cleanup)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/collie.c                          | 1 -
 hw/arm/gumstix.c                         | 1 -
 hw/arm/mainstone.c                       | 1 -
 hw/arm/nseries.c                         | 1 -
 hw/arm/omap1.c                           | 1 -
 hw/arm/omap2.c                           | 1 -
 hw/arm/omap_sx1.c                        | 1 -
 hw/arm/pxa2xx.c                          | 1 -
 hw/arm/spitz.c                           | 1 -
 hw/arm/versatilepb.c                     | 1 -
 hw/arm/vexpress.c                        | 1 -
 hw/arm/virt.c                            | 1 -
 hw/arm/xilinx_zynq.c                     | 1 -
 hw/arm/z2.c                              | 1 -
 hw/block/dataplane/virtio-blk.c          | 1 -
 hw/block/virtio-blk.c                    | 1 -
 hw/core/qdev-properties.c                | 1 -
 hw/cris/axis_dev88.c                     | 1 -
 hw/display/tc6393xb.c                    | 1 -
 hw/ide/pci.c                             | 1 -
 hw/ide/via.c                             | 1 -
 hw/isa/isa-superio.c                     | 1 -
 hw/lm32/lm32_boards.c                    | 1 -
 hw/lm32/milkymist.c                      | 1 -
 hw/microblaze/petalogix_ml605_mmu.c      | 1 -
 hw/microblaze/petalogix_s3adsp1800_mmu.c | 1 -
 hw/mips/mips_r4k.c                       | 1 -
 hw/ppc/spapr.c                           | 1 -
 hw/ppc/virtex_ml507.c                    | 2 --
 hw/s390x/virtio-ccw.c                    | 1 -
 hw/scsi/mptsas.c                         | 1 -
 hw/sd/pl181.c                            | 1 -
 hw/sd/sdhci.c                            | 1 -
 hw/sd/ssi-sd.c                           | 1 -
 hw/sh4/r2d.c                             | 1 -
 hw/virtio/virtio-pci.c                   | 1 -
 hw/xen/xen_devconfig.c                   | 1 -
 hw/xtensa/xtfpga.c                       | 1 -
 38 files changed, 39 deletions(-)

diff --git a/hw/arm/collie.c b/hw/arm/collie.c
index f8c566e2e5..48b732c176 100644
--- a/hw/arm/collie.c
+++ b/hw/arm/collie.c
@@ -16,7 +16,6 @@
 #include "strongarm.h"
 #include "hw/arm/arm.h"
 #include "hw/block/flash.h"
-#include "sysemu/block-backend.h"
 #include "exec/address-spaces.h"
 #include "cpu.h"
 
diff --git a/hw/arm/gumstix.c b/hw/arm/gumstix.c
index ea2a3c532d..56cb763c4e 100644
--- a/hw/arm/gumstix.c
+++ b/hw/arm/gumstix.c
@@ -42,7 +42,6 @@
 #include "hw/block/flash.h"
 #include "hw/devices.h"
 #include "hw/boards.h"
-#include "sysemu/block-backend.h"
 #include "exec/address-spaces.h"
 #include "sysemu/qtest.h"
 #include "cpu.h"
diff --git a/hw/arm/mainstone.c b/hw/arm/mainstone.c
index 4215c025fc..0beb5c426b 100644
--- a/hw/arm/mainstone.c
+++ b/hw/arm/mainstone.c
@@ -21,7 +21,6 @@
 #include "hw/devices.h"
 #include "hw/boards.h"
 #include "hw/block/flash.h"
-#include "sysemu/block-backend.h"
 #include "hw/sysbus.h"
 #include "exec/address-spaces.h"
 #include "sysemu/qtest.h"
diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
index 32687afced..906b7ca22d 100644
--- a/hw/arm/nseries.c
+++ b/hw/arm/nseries.c
@@ -35,7 +35,6 @@
 #include "hw/hw.h"
 #include "hw/bt.h"
 #include "hw/loader.h"
-#include "sysemu/block-backend.h"
 #include "hw/sysbus.h"
 #include "qemu/log.h"
 #include "exec/address-spaces.h"
diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
index e54c1f8f99..854996c1ac 100644
--- a/hw/arm/omap1.c
+++ b/hw/arm/omap1.c
@@ -28,7 +28,6 @@
 #include "hw/arm/omap.h"
 #include "sysemu/sysemu.h"
 #include "hw/arm/soc_dma.h"
-#include "sysemu/block-backend.h"
 #include "sysemu/blockdev.h"
 #include "sysemu/qtest.h"
 #include "qemu/range.h"
diff --git a/hw/arm/omap2.c b/hw/arm/omap2.c
index b8d0910a1f..cc4250b7da 100644
--- a/hw/arm/omap2.c
+++ b/hw/arm/omap2.c
@@ -23,7 +23,6 @@
 #include "qapi/error.h"
 #include "qemu-common.h"
 #include "cpu.h"
-#include "sysemu/block-backend.h"
 #include "sysemu/blockdev.h"
 #include "sysemu/qtest.h"
 #include "hw/boards.h"
diff --git a/hw/arm/omap_sx1.c b/hw/arm/omap_sx1.c
index eccc19c77b..84550f0236 100644
--- a/hw/arm/omap_sx1.c
+++ b/hw/arm/omap_sx1.c
@@ -33,7 +33,6 @@
 #include "hw/boards.h"
 #include "hw/arm/arm.h"
 #include "hw/block/flash.h"
-#include "sysemu/block-backend.h"
 #include "sysemu/qtest.h"
 #include "exec/address-spaces.h"
 #include "cpu.h"
diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index a2803fdee4..b67b0cefb6 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -19,7 +19,6 @@
 #include "hw/i2c/i2c.h"
 #include "hw/ssi/ssi.h"
 #include "chardev/char-fe.h"
-#include "sysemu/block-backend.h"
 #include "sysemu/blockdev.h"
 #include "sysemu/qtest.h"
 #include "qemu/cutils.h"
diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
index e419e3c00e..3cc27a1e44 100644
--- a/hw/arm/spitz.c
+++ b/hw/arm/spitz.c
@@ -27,7 +27,6 @@
 #include "hw/audio/wm8750.h"
 #include "audio/audio.h"
 #include "hw/boards.h"
-#include "sysemu/block-backend.h"
 #include "hw/sysbus.h"
 #include "exec/address-spaces.h"
 #include "cpu.h"
diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
index e01e3192ff..a5a06b6d40 100644
--- a/hw/arm/versatilepb.c
+++ b/hw/arm/versatilepb.c
@@ -19,7 +19,6 @@
 #include "hw/pci/pci.h"
 #include "hw/i2c/i2c.h"
 #include "hw/boards.h"
-#include "sysemu/block-backend.h"
 #include "exec/address-spaces.h"
 #include "hw/block/flash.h"
 #include "qemu/error-report.h"
diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index f1e33c8a36..5bfe2e4348 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -35,7 +35,6 @@
 #include "hw/boards.h"
 #include "hw/loader.h"
 #include "exec/address-spaces.h"
-#include "sysemu/block-backend.h"
 #include "hw/block/flash.h"
 #include "sysemu/device_tree.h"
 #include "qemu/error-report.h"
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a3a28e20e8..3aa19b2935 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -38,7 +38,6 @@
 #include "hw/vfio/vfio-amd-xgbe.h"
 #include "hw/devices.h"
 #include "net/net.h"
-#include "sysemu/block-backend.h"
 #include "sysemu/device_tree.h"
 #include "sysemu/numa.h"
 #include "sysemu/sysemu.h"
diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 899a26326f..f1496d2927 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -26,7 +26,6 @@
 #include "sysemu/sysemu.h"
 #include "hw/boards.h"
 #include "hw/block/flash.h"
-#include "sysemu/block-backend.h"
 #include "hw/loader.h"
 #include "hw/misc/zynq-xadc.h"
 #include "hw/ssi/ssi.h"
diff --git a/hw/arm/z2.c b/hw/arm/z2.c
index 730a5392e9..697a822f1e 100644
--- a/hw/arm/z2.c
+++ b/hw/arm/z2.c
@@ -21,7 +21,6 @@
 #include "hw/boards.h"
 #include "sysemu/sysemu.h"
 #include "hw/block/flash.h"
-#include "sysemu/block-backend.h"
 #include "ui/console.h"
 #include "hw/audio/wm8750.h"
 #include "audio/audio.h"
diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
index 101f32cf66..d648aeb73b 100644
--- a/hw/block/dataplane/virtio-blk.c
+++ b/hw/block/dataplane/virtio-blk.c
@@ -19,7 +19,6 @@
 #include "qemu/thread.h"
 #include "qemu/error-report.h"
 #include "hw/virtio/virtio-access.h"
-#include "sysemu/block-backend.h"
 #include "hw/virtio/virtio-blk.h"
 #include "virtio-blk.h"
 #include "block/aio.h"
diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index b1532e4e91..50b5c869e3 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -18,7 +18,6 @@
 #include "qemu/error-report.h"
 #include "trace.h"
 #include "hw/block/block.h"
-#include "sysemu/block-backend.h"
 #include "sysemu/blockdev.h"
 #include "hw/virtio/virtio-blk.h"
 #include "dataplane/virtio-blk.h"
diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 5bbc2d98b5..989778ab7f 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -5,7 +5,6 @@
 #include "hw/pci/pci.h"
 #include "qapi/qmp/qerror.h"
 #include "qemu/error-report.h"
-#include "sysemu/block-backend.h"
 #include "hw/block/block.h"
 #include "net/hub.h"
 #include "qapi/visitor.h"
diff --git a/hw/cris/axis_dev88.c b/hw/cris/axis_dev88.c
index 409f3d581a..56ee398ee5 100644
--- a/hw/cris/axis_dev88.c
+++ b/hw/cris/axis_dev88.c
@@ -34,7 +34,6 @@
 #include "hw/loader.h"
 #include "elf.h"
 #include "boot.h"
-#include "sysemu/block-backend.h"
 #include "exec/address-spaces.h"
 #include "sysemu/qtest.h"
 #include "sysemu/sysemu.h"
diff --git a/hw/display/tc6393xb.c b/hw/display/tc6393xb.c
index 464465b7c2..8392e59493 100644
--- a/hw/display/tc6393xb.c
+++ b/hw/display/tc6393xb.c
@@ -18,7 +18,6 @@
 #include "hw/block/flash.h"
 #include "ui/console.h"
 #include "ui/pixel_ops.h"
-#include "sysemu/block-backend.h"
 #include "sysemu/blockdev.h"
 
 #define IRQ_TC6393_NAND		0
diff --git a/hw/ide/pci.c b/hw/ide/pci.c
index 1ab0a892d0..fe1ceeb0cd 100644
--- a/hw/ide/pci.c
+++ b/hw/ide/pci.c
@@ -26,7 +26,6 @@
 #include "hw/hw.h"
 #include "hw/pci/pci.h"
 #include "hw/isa/isa.h"
-#include "sysemu/block-backend.h"
 #include "sysemu/dma.h"
 #include "qemu/error-report.h"
 #include "hw/ide/pci.h"
diff --git a/hw/ide/via.c b/hw/ide/via.c
index 117ac4d95e..238f038d72 100644
--- a/hw/ide/via.c
+++ b/hw/ide/via.c
@@ -27,7 +27,6 @@
 #include "hw/hw.h"
 #include "hw/pci/pci.h"
 #include "hw/isa/isa.h"
-#include "sysemu/block-backend.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/dma.h"
 
diff --git a/hw/isa/isa-superio.c b/hw/isa/isa-superio.c
index 76286c81a1..9359be7008 100644
--- a/hw/isa/isa-superio.c
+++ b/hw/isa/isa-superio.c
@@ -13,7 +13,6 @@
 #include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "sysemu/sysemu.h"
-#include "sysemu/block-backend.h"
 #include "sysemu/blockdev.h"
 #include "chardev/char.h"
 #include "hw/isa/superio.h"
diff --git a/hw/lm32/lm32_boards.c b/hw/lm32/lm32_boards.c
index 907e875d02..167058348e 100644
--- a/hw/lm32/lm32_boards.c
+++ b/hw/lm32/lm32_boards.c
@@ -27,7 +27,6 @@
 #include "hw/devices.h"
 #include "hw/boards.h"
 #include "hw/loader.h"
-#include "sysemu/block-backend.h"
 #include "elf.h"
 #include "lm32_hwsetup.h"
 #include "lm32.h"
diff --git a/hw/lm32/milkymist.c b/hw/lm32/milkymist.c
index f9688e059e..c36bbc4ae2 100644
--- a/hw/lm32/milkymist.c
+++ b/hw/lm32/milkymist.c
@@ -30,7 +30,6 @@
 #include "hw/boards.h"
 #include "hw/loader.h"
 #include "elf.h"
-#include "sysemu/block-backend.h"
 #include "milkymist-hw.h"
 #include "lm32.h"
 #include "exec/address-spaces.h"
diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/petalogix_ml605_mmu.c
index cf6bf3f32a..6c4a544eac 100644
--- a/hw/microblaze/petalogix_ml605_mmu.c
+++ b/hw/microblaze/petalogix_ml605_mmu.c
@@ -36,7 +36,6 @@
 #include "sysemu/sysemu.h"
 #include "hw/devices.h"
 #include "hw/boards.h"
-#include "sysemu/block-backend.h"
 #include "hw/char/serial.h"
 #include "exec/address-spaces.h"
 #include "hw/ssi/ssi.h"
diff --git a/hw/microblaze/petalogix_s3adsp1800_mmu.c b/hw/microblaze/petalogix_s3adsp1800_mmu.c
index 1186002a76..0da3e62102 100644
--- a/hw/microblaze/petalogix_s3adsp1800_mmu.c
+++ b/hw/microblaze/petalogix_s3adsp1800_mmu.c
@@ -34,7 +34,6 @@
 #include "sysemu/sysemu.h"
 #include "hw/devices.h"
 #include "hw/boards.h"
-#include "sysemu/block-backend.h"
 #include "exec/address-spaces.h"
 #include "hw/char/xilinx_uartlite.h"
 
diff --git a/hw/mips/mips_r4k.c b/hw/mips/mips_r4k.c
index e04b49d3c5..e5cf8ed1a3 100644
--- a/hw/mips/mips_r4k.c
+++ b/hw/mips/mips_r4k.c
@@ -30,7 +30,6 @@
 #include "hw/timer/mc146818rtc.h"
 #include "hw/input/i8042.h"
 #include "hw/timer/i8254.h"
-#include "sysemu/block-backend.h"
 #include "exec/address-spaces.h"
 #include "sysemu/qtest.h"
 #include "qemu/error-report.h"
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index ebf30dd60b..2e910428f3 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -35,7 +35,6 @@
 #include "elf.h"
 #include "net/net.h"
 #include "sysemu/device_tree.h"
-#include "sysemu/block-backend.h"
 #include "sysemu/cpus.h"
 #include "sysemu/hw_accel.h"
 #include "kvm_ppc.h"
diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
index a80cbdd7ee..b4bb90d50b 100644
--- a/hw/ppc/virtex_ml507.c
+++ b/hw/ppc/virtex_ml507.c
@@ -44,8 +44,6 @@
 #include "hw/ppc/ppc4xx.h"
 #include "ppc405.h"
 
-#include "sysemu/block-backend.h"
-
 #define EPAPR_MAGIC    (0x45504150)
 #define FLASH_SIZE     (16 * 1024 * 1024)
 
diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
index 22df33b509..b68798ac52 100644
--- a/hw/s390x/virtio-ccw.c
+++ b/hw/s390x/virtio-ccw.c
@@ -13,7 +13,6 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/hw.h"
-#include "sysemu/block-backend.h"
 #include "sysemu/blockdev.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/kvm.h"
diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
index 3f061f3f68..4176e871e1 100644
--- a/hw/scsi/mptsas.c
+++ b/hw/scsi/mptsas.c
@@ -26,7 +26,6 @@
 #include "hw/hw.h"
 #include "hw/pci/pci.h"
 #include "sysemu/dma.h"
-#include "sysemu/block-backend.h"
 #include "hw/pci/msi.h"
 #include "qemu/iov.h"
 #include "hw/scsi/scsi.h"
diff --git a/hw/sd/pl181.c b/hw/sd/pl181.c
index 3ba1f7dd23..1cc94dbfdf 100644
--- a/hw/sd/pl181.c
+++ b/hw/sd/pl181.c
@@ -8,7 +8,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "sysemu/block-backend.h"
 #include "sysemu/blockdev.h"
 #include "hw/sysbus.h"
 #include "hw/sd/sd.h"
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 63c44a4ee8..b65403947b 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -26,7 +26,6 @@
 #include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "hw/hw.h"
-#include "sysemu/block-backend.h"
 #include "sysemu/blockdev.h"
 #include "sysemu/dma.h"
 #include "qemu/timer.h"
diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index ae04b6641b..96542ecd62 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -11,7 +11,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "sysemu/block-backend.h"
 #include "sysemu/blockdev.h"
 #include "hw/ssi/ssi.h"
 #include "hw/sd/sd.h"
diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
index 6b01d6eed8..8fe8766eb9 100644
--- a/hw/sh4/r2d.c
+++ b/hw/sh4/r2d.c
@@ -40,7 +40,6 @@
 #include "hw/loader.h"
 #include "hw/usb.h"
 #include "hw/block/flash.h"
-#include "sysemu/block-backend.h"
 #include "exec/address-spaces.h"
 
 #define FLASH_BASE 0x00000000
diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 5eb0c323ca..3a01fe90f0 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -32,7 +32,6 @@
 #include "hw/pci/msix.h"
 #include "hw/loader.h"
 #include "sysemu/kvm.h"
-#include "sysemu/block-backend.h"
 #include "virtio-pci.h"
 #include "qemu/range.h"
 #include "hw/virtio/virtio-bus.h"
diff --git a/hw/xen/xen_devconfig.c b/hw/xen/xen_devconfig.c
index fac9d3fcdc..aebc19bd71 100644
--- a/hw/xen/xen_devconfig.c
+++ b/hw/xen/xen_devconfig.c
@@ -1,7 +1,6 @@
 #include "qemu/osdep.h"
 #include "hw/xen/xen_backend.h"
 #include "qemu/option.h"
-#include "sysemu/block-backend.h"
 #include "sysemu/blockdev.h"
 
 /* ------------------------------------------------------------- */
diff --git a/hw/xtensa/xtfpga.c b/hw/xtensa/xtfpga.c
index 63734c70ec..5dc13034f9 100644
--- a/hw/xtensa/xtfpga.c
+++ b/hw/xtensa/xtfpga.c
@@ -38,7 +38,6 @@
 #include "net/net.h"
 #include "hw/sysbus.h"
 #include "hw/block/flash.h"
-#include "sysemu/block-backend.h"
 #include "chardev/char.h"
 #include "sysemu/device_tree.h"
 #include "qemu/error-report.h"
-- 
2.17.0

