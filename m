Received: by 2002:a17:907:7006:b0:a35:eedd:80b0 with SMTP id wr6csp260053ejb;
        Thu, 1 Feb 2024 06:15:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEf8+zGsOs3LynxuD6yCfRebh6+Q9QqWqSuASam+Vco42bAy0UwcPUJ6oUO38n0yRNzZWgu
X-Received: by 2002:a05:6808:f92:b0:3bf:b8b2:e3a with SMTP id o18-20020a0568080f9200b003bfb8b20e3amr1118456oiw.13.1706796957255;
        Thu, 01 Feb 2024 06:15:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706796957; cv=none;
        d=google.com; s=arc-20160816;
        b=dPMyyy6O1mSWYfeyruWmH2nkd7QcgtdyXqomHUixy39pEzlHwMJbcNM9vcbAeRG4/4
         a+fN00v3GQpqK2/dttIW1fJN1NkiFVSfb6iMsJ0oK5gD3WcuhGDwOryX4yH6IVgX3GIN
         JvwMI4yHljLPZqMT4Ahyydu6TKk6TENznYYV7BD2J0CgBduPlZS8KkSTahGGBalUzD/P
         WiOEtlW+u7teAusUzUPMqHSibRg/LJKVQvzm0Guzke24OEbIORW5jqCp0/SzsHaEr6fE
         Jr/mRgvT4AlKzAf1I3ADiylsUxpVGPi6DaWdjQ5+6rvI87hu1csCZE1XVZX1+USODKm+
         3dng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=XwiLQBWlsnPdISQMIkbVjkAq78OSrC4f51CIgtfJUoI=;
        fh=XwA/0lg4uEXVqQr+gQ5hlFanV7lWZd1pqUoH0mBM4Ls=;
        b=LxBopVlXwuQLAvd9id/zS1Ya9dayZaIRFgN+1xqPP5ZGWQ4cB+ZjQIvK9mRhJDpah+
         H+B4rM58gm3nV3XZejvOaaHPBV1eklEsHsZOf49efl1s6NwQpfX57Ed0fTh04TZd+eYO
         NcyTsv6qeEFLrCZRdvwMbGHxQsreiLSyfm1NTNf3mNc6StcnFuaCwT9L3is2q19f5nm0
         J7kw1oIU8XwC3In+M4juSX2dEKsFmb4BTljiAH74Y1Bg+m67kuRwbDkmIpV+5maiajdS
         ghP7upLudStLiN6E0e0IEMYv+hBhbQPv6R0y1g901s4dCngulpwNdYSdxX/1/Xq9kuHD
         V8BQ==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
X-Forwarded-Encrypted: i=0; AJvYcCXG5jmHSjmYokSK2Kw8y6i+EeDbhLYWSUwZGMlXqed9LQ46sMS3wznoi8QavGWMJ3VY8X0CqihGm6HC/xGeu8R8rw59ktE/
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w18-20020a05622a191200b0042a6305a48esi14304369qtc.97.2024.02.01.06.15.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Feb 2024 06:15:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rVXpZ-0001q8-H9; Thu, 01 Feb 2024 09:14:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Qo6T=JK=kaod.org=clg@ozlabs.org>)
 id 1rVXpH-0001Pv-KJ; Thu, 01 Feb 2024 09:13:59 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Qo6T=JK=kaod.org=clg@ozlabs.org>)
 id 1rVXp9-0007qn-FG; Thu, 01 Feb 2024 09:13:59 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4TQgqk6hFhz4wcn;
 Fri,  2 Feb 2024 01:13:38 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TQgqj2vpTz4wcM;
 Fri,  2 Feb 2024 01:13:37 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Ninad Palsule <ninad@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 16/17] hw/fsi: Added FSI documentation
Date: Thu,  1 Feb 2024 15:12:52 +0100
Message-ID: <20240201141253.806055-17-clg@kaod.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240201141253.806055-1-clg@kaod.org>
References: <20240201141253.806055-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=Qo6T=JK=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Bh96dIdm6h1C

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

