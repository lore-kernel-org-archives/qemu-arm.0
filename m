Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp877457ejc;
        Fri, 26 Jan 2024 05:34:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGvRxWmMTOULautZE+03CIKLWBoWYCNmcEIingV6fdT2N5Tciy8RnYb/GqNNl8v9F7gAIn5
X-Received: by 2002:ae9:e915:0:b0:783:cdc1:9f64 with SMTP id x21-20020ae9e915000000b00783cdc19f64mr1113921qkf.13.1706276049029;
        Fri, 26 Jan 2024 05:34:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706276049; cv=none;
        d=google.com; s=arc-20160816;
        b=ITHvsDOJeePAn/dsHerRUltzQiAZMo3twqss5UpY97RF0PQ4Zw1FJMNadmm6vkQief
         C+PAPUwD+bO7OKufyF9XdsJo65en0QuHp5ccXN90fu4EbSQ6aThshL25DeeWIKGTd8uj
         z0S8bzSl49B80lEM5BLuhyupSfvo6jd93m3TXcUgfHfJiLtfzmxykOktHPG2UKmNdaEv
         o9yoTW+cTLj7L3ZklStJW66J2QfFIb7vaQNZu1/qDCC+khMxJpjYv16f2AVIorar0dJ3
         iSkbdTPriuouZGv96RohwVb7T638xyff3LrVGqHYDlrtOJohC+qq6E4MK/RdgbF9hjlr
         qSHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=XwiLQBWlsnPdISQMIkbVjkAq78OSrC4f51CIgtfJUoI=;
        fh=jLTX6LcWZDFHmzG0EpD0PNf260/p6eka/EHAnWM+BUw=;
        b=Es5sTK5IbAB/URccZsSreUiOYtcwv1SkFwrZkcKZjpoV3OC3Mu0Hvt/Zo8oyPr1mcV
         4vANSvBPI9o7JH+ZFl3HlfoxmmyBfpZafaW7hfWbYhFG9oN+03zwdvm8XNsp2w9q0rGS
         XWAZYH+4Z9MN4lCufXNJZ3PrQWVguAZwEWWLurqSs4NZioR+gYYK1m5ImET3irrY5jte
         OgupsjelsfC+/eaTiAh1HhuwQLZeFQeGvTNysCqxuufwD5OL6q6BXkHVX3estMmTQ5a3
         ocUP7mi6tY+N6fteLKkTV+E7EVDBIoG+zcmU0U0ty0r0tNoxfTVGjMS/vC5Knq/nWi12
         BOOg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r3-20020a05620a03c300b0078165c35587si1286919qkm.462.2024.01.26.05.34.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 05:34:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rTMKY-0004xl-2a; Fri, 26 Jan 2024 08:33:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5gEp=JE=kaod.org=clg@ozlabs.org>)
 id 1rTMKR-0004ct-2I; Fri, 26 Jan 2024 08:33:07 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5gEp=JE=kaod.org=clg@ozlabs.org>)
 id 1rTMKN-00089p-Q5; Fri, 26 Jan 2024 08:33:06 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4TLzCf5K8Wz4x7q;
 Sat, 27 Jan 2024 00:33:02 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TLzCd1Rlyz4wny;
 Sat, 27 Jan 2024 00:33:00 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Ninad Palsule <ninad@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 16/17] hw/fsi: Added FSI documentation
Date: Fri, 26 Jan 2024 14:32:15 +0100
Message-ID: <20240126133217.996306-17-clg@kaod.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126133217.996306-1-clg@kaod.org>
References: <20240126133217.996306-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=5gEp=JE=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: cf4+BJHrfwgc

From: Ninad Palsule <ninad@linux.ibm.com>

Documentation for IBM FSI model.

Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
[ clg : - Removed source file list
        - Fixed aspeed machine reference ]
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 docs/specs/fsi.rst   | 122 +++++++++++++++++++++++++++++++++++++++++++
 docs/specs/index.rst |   1 +
 2 files changed, 123 insertions(+)
 create mode 100644 docs/specs/fsi.rst

diff --git a/docs/specs/fsi.rst b/docs/specs/fsi.rst
new file mode 100644
index 000000000000..af8782253152
--- /dev/null
+++ b/docs/specs/fsi.rst
@@ -0,0 +1,122 @@
+======================================
+IBM's Flexible Service Interface (FSI)
+======================================
+
+The QEMU FSI emulation implements hardware interfaces between ASPEED SOC, FSI
+master/slave and the end engine.
+
+FSI is a point-to-point two wire interface which is capable of supporting
+distances of up to 4 meters. FSI interfaces have been used successfully for
+many years in IBM servers to attach IBM Flexible Support Processors(FSP) to
+CPUs and IBM ASICs.
+
+FSI allows a service processor access to the internal buses of a host POWER
+processor to perform configuration or debugging. FSI has long existed in POWER
+processes and so comes with some baggage, including how it has been integrated
+into the ASPEED SoC.
+
+Working backwards from the POWER processor, the fundamental pieces of interest
+for the implementation are: (see the `FSI specification`_ for more details)
+
+1. The Common FRU Access Macro (CFAM), an address space containing various
+   "engines" that drive accesses on buses internal and external to the POWER
+   chip. Examples include the SBEFIFO and I2C masters. The engines hang off of
+   an internal Local Bus (LBUS) which is described by the CFAM configuration
+   block.
+
+2. The FSI slave: The slave is the terminal point of the FSI bus for FSI
+   symbols addressed to it. Slaves can be cascaded off of one another. The
+   slave's configuration registers appear in address space of the CFAM to
+   which it is attached.
+
+3. The FSI master: A controller in the platform service processor (e.g. BMC)
+   driving CFAM engine accesses into the POWER chip. At the hardware level
+   FSI is a bit-based protocol supporting synchronous and DMA-driven accesses
+   of engines in a CFAM.
+
+4. The On-Chip Peripheral Bus (OPB): A low-speed bus typically found in POWER
+   processors. This now makes an appearance in the ASPEED SoC due to tight
+   integration of the FSI master IP with the OPB, mainly the existence of an
+   MMIO-mapping of the CFAM address straight onto a sub-region of the OPB
+   address space.
+
+5. An APB-to-OPB bridge enabling access to the OPB from the ARM core in the
+   AST2600. Hardware limitations prevent the OPB from being directly mapped
+   into APB, so all accesses are indirect through the bridge.
+
+The LBUS is modelled to maintain the qdev bus hierarchy and to take advantages
+of the object model to automatically generate the CFAM configuration block.
+The configuration block presents engines in the order they are attached to the
+CFAM's LBUS. Engine implementations should subclass the LBusDevice and set the
+'config' member of LBusDeviceClass to match the engine's type.
+
+CFAM designs offer a lot of flexibility, for instance it is possible for a
+CFAM to be simultaneously driven from multiple FSI links. The modeling is not
+so complete; it's assumed that each CFAM is attached to a single FSI slave (as
+a consequence the CFAM subclasses the FSI slave).
+
+As for FSI, its symbols and wire-protocol are not modelled at all. This is not
+necessary to get FSI off the ground thanks to the mapping of the CFAM address
+space onto the OPB address space - the models follow this directly and map the
+CFAM memory region into the OPB's memory region.
+
+The following commands start the ``rainier-bmc`` machine with built-in FSI
+model. There are no model specific arguments. Please check this document to
+learn more about Aspeed ``rainier-bmc`` machine: (:doc:`../../system/arm/aspeed`)
+
+.. code-block:: console
+
+  qemu-system-arm -M rainier-bmc -nographic \
+  -kernel fitImage-linux.bin \
+  -dtb aspeed-bmc-ibm-rainier.dtb \
+  -initrd obmc-phosphor-initramfs.rootfs.cpio.xz \
+  -drive file=obmc-phosphor-image.rootfs.wic.qcow2,if=sd,index=2 \
+  -append "rootwait console=ttyS4,115200n8 root=PARTLABEL=rofs-a"
+
+The implementation appears as following in the qemu device tree:
+
+.. code-block:: console
+
+  (qemu) info qtree
+  bus: main-system-bus
+    type System
+    ...
+    dev: aspeed.apb2opb, id ""
+      gpio-out "sysbus-irq" 1
+      mmio 000000001e79b000/0000000000001000
+      bus: opb.1
+        type opb
+        dev: fsi.master, id ""
+          bus: fsi.bus.1
+            type fsi.bus
+            dev: cfam.config, id ""
+            dev: cfam, id ""
+              bus: lbus.1
+                type lbus
+                dev: scratchpad, id ""
+                  address = 0 (0x0)
+      bus: opb.0
+        type opb
+        dev: fsi.master, id ""
+          bus: fsi.bus.0
+            type fsi.bus
+            dev: cfam.config, id ""
+            dev: cfam, id ""
+              bus: lbus.0
+                type lbus
+                dev: scratchpad, id ""
+                  address = 0 (0x0)
+
+pdbg is a simple application to allow debugging of the host POWER processors
+from the BMC. (see the `pdbg source repository`_ for more details)
+
+.. code-block:: console
+
+  root@p10bmc:~# pdbg -a getcfam 0x0
+  p0: 0x0 = 0xc0022d15
+
+.. _FSI specification:
+   https://openpowerfoundation.org/specifications/fsi/
+
+.. _pdbg source repository:
+   https://github.com/open-power/pdbg
diff --git a/docs/specs/index.rst b/docs/specs/index.rst
index b3f482b0aa58..1484e3e76077 100644
--- a/docs/specs/index.rst
+++ b/docs/specs/index.rst
@@ -24,6 +24,7 @@ guest hardware that is specific to QEMU.
    acpi_erst
    sev-guest-firmware
    fw_cfg
+   fsi
    vmw_pvscsi-spec
    edu
    ivshmem-spec
-- 
2.43.0

