Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp392424njb;
        Fri, 11 Oct 2024 06:20:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWYO6UgNAovFqtMGvun2zeYCMZWh4FjfJYmmoDfYvcWTL4VTdcQ1eASInda532BrztsYWtCNoVgLCNjyQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEbitZ5hEOMvUjGR6ATDrjfWBZNscBLCMxy5uB0FIuI2ezYn0dZvToTuhdnFv3oBMPimo6O
X-Received: by 2002:a05:620a:46ac:b0:7a1:c40b:b1e4 with SMTP id af79cd13be357-7b11a3dd629mr317596285a.55.1728652812354;
        Fri, 11 Oct 2024 06:20:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728652812; cv=none;
        d=google.com; s=arc-20240605;
        b=j7/2cFndje0wvrzsTmNBP52347ZOcI9VmIEqxIvJa9SJGfHpfDNA3ZA6G+iPXIJysP
         NQi3bkbOUnUNZUFp8AuZ5kxa+iQjAQgJyyrnFuIojNnO5zaWLblLM3/o+MWf/wvuC75z
         jIbCMP0omFYbfQF+blGojrrmSkPXOTAdnPXSTugDQ0mSZplVkpVc7+jdZes50lRPw4nv
         +h+XMzfdPJnV8tbBWLm6zMn7Kz0LBP2qYO6hxgBw3FhRtOsl+DBncIgn5UeBSm986hGn
         l2Wq43SAsFAShUwJlNQ0o1PLwIJ9cOlHGhBtRItRvN+NJ72pWgKIrUptW8GyBMp8h0bA
         kRpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=iExu0BKUjo7aDQdE9TBBJh4waWrgjWK9Bk9xyIATP/0=;
        fh=yV7XiH9Iqz9ECmsY7O4iL5H1OqntXAXD46ZP2pth0HE=;
        b=CKm2tQFLVYllJ3p/plw631vHNx8sufSFEsZ1AAJIQ2xw2k+8mwKz27+f8WKYIZ1Yxy
         U/9N8q73Z1fNXGnkEqhtJx7srFMAIwS0PC0fCWA51QMdxfgBWzleVl/IEey02Rh1hU2m
         IcU5m3vycnfmQuJRZlON0ZAWAZ4BLtKPBWV1urrWqe/qrgFl55dAFojo+8c4PUKj1Y+j
         HGWpbeHWOzizXS+x0FaRx0SPUKQZE/obqk7MVt5KHu/La+pt5XVihVYoJg0sNgtd4E89
         inM37PiJmt4srHkAqjUtC/uBG7Gn8IA6ZI2DG0mpw5mJwx8ouuEdbZI62B6QLNh3+sO1
         +iWQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fdTB8PMw;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7b1149c253csi384092885a.614.2024.10.11.06.20.12
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 06:20:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fdTB8PMw;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728652812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iExu0BKUjo7aDQdE9TBBJh4waWrgjWK9Bk9xyIATP/0=;
	b=fdTB8PMw7Fjr0LatQ6qH9xA9K5q4K3crOdtL+TsMKskcaFe2Rz++Uo2mMuF6P+OmQMa5J6
	rBakbltG9BPqpNuLREmU+4aRO8rMhE0FvEeYMrlj3zEJWaaAJRcVnXXJaEAKEE2LyGMPyD
	ackHRr4qaBLOLTJ/iG5Tb9AhOgPxuoU=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-479-g6v04WiFPy2gb6K7UpXmEg-1; Fri,
 11 Oct 2024 09:20:08 -0400
X-MC-Unique: g6v04WiFPy2gb6K7UpXmEg-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E80711955F3F;
	Fri, 11 Oct 2024 13:20:06 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.193.77])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E0CD31955E8F;
	Fri, 11 Oct 2024 13:20:03 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Magnus Damm <magnus.damm@gmail.com>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH 02/17] tests/functional: Convert the Avocado ppc64 tuxrun tests
Date: Fri, 11 Oct 2024 15:19:19 +0200
Message-ID: <20241011131937.377223-3-thuth@redhat.com>
In-Reply-To: <20241011131937.377223-1-thuth@redhat.com>
References: <20241011131937.377223-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-TUID: q+lkmH0ow2B+

Move the tests to a new file so that they can be run via
qemu-system-ppc64 in the functional framework.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/avocado/tuxrun_baselines.py     |  92 ---------------------
 tests/functional/test_ppc64_tuxrun.py | 110 ++++++++++++++++++++++++++
 2 files changed, 110 insertions(+), 92 deletions(-)
 create mode 100755 tests/functional/test_ppc64_tuxrun.py

diff --git a/tests/avocado/tuxrun_baselines.py b/tests/avocado/tuxrun_baselines.py
index 736e4aa289..56c8bdb2dc 100644
--- a/tests/avocado/tuxrun_baselines.py
+++ b/tests/avocado/tuxrun_baselines.py
@@ -182,63 +182,6 @@ def common_tuxrun(self,
         self.vm.launch()
         self.run_tuxtest_tests(haltmsg)
 
-    def ppc64_common_tuxrun(self, sums, prefix):
-        # add device args to command line.
-        self.require_netdev('user')
-        self.vm.add_args('-netdev', 'user,id=vnet,hostfwd=:127.0.0.1:0-:22',
-                         '-device', 'virtio-net,netdev=vnet')
-        self.vm.add_args('-netdev', '{"type":"user","id":"hostnet0"}',
-                         '-device', '{"driver":"virtio-net-pci","netdev":'
-                         '"hostnet0","id":"net0","mac":"52:54:00:4c:e3:86",'
-                         '"bus":"pci.0","addr":"0x9"}')
-        self.vm.add_args('-device', '{"driver":"qemu-xhci","p2":15,"p3":15,'
-                         '"id":"usb","bus":"pci.0","addr":"0x2"}')
-        self.vm.add_args('-device', '{"driver":"virtio-scsi-pci","id":"scsi0"'
-                         ',"bus":"pci.0","addr":"0x3"}')
-        self.vm.add_args('-device', '{"driver":"virtio-serial-pci","id":'
-                         '"virtio-serial0","bus":"pci.0","addr":"0x4"}')
-        self.vm.add_args('-device', '{"driver":"scsi-cd","bus":"scsi0.0"'
-                         ',"channel":0,"scsi-id":0,"lun":0,"device_id":'
-                         '"drive-scsi0-0-0-0","id":"scsi0-0-0-0"}')
-        self.vm.add_args('-device', '{"driver":"virtio-balloon-pci",'
-                         '"id":"balloon0","bus":"pci.0","addr":"0x6"}')
-        self.vm.add_args('-audiodev', '{"id":"audio1","driver":"none"}')
-        self.vm.add_args('-device', '{"driver":"usb-tablet","id":"input0"'
-                         ',"bus":"usb.0","port":"1"}')
-        self.vm.add_args('-device', '{"driver":"usb-kbd","id":"input1"'
-                         ',"bus":"usb.0","port":"2"}')
-        self.vm.add_args('-device', '{"driver":"VGA","id":"video0",'
-                         '"vgamem_mb":16,"bus":"pci.0","addr":"0x7"}')
-        self.vm.add_args('-object', '{"qom-type":"rng-random","id":"objrng0"'
-                         ',"filename":"/dev/urandom"}',
-                         '-device', '{"driver":"virtio-rng-pci","rng":"objrng0"'
-                         ',"id":"rng0","bus":"pci.0","addr":"0x8"}')
-        self.vm.add_args('-object', '{"qom-type":"cryptodev-backend-builtin",'
-                         '"id":"objcrypto0","queues":1}',
-                         '-device', '{"driver":"virtio-crypto-pci",'
-                         '"cryptodev":"objcrypto0","id":"crypto0","bus"'
-                         ':"pci.0","addr":"0xa"}')
-        self.vm.add_args('-device', '{"driver":"spapr-pci-host-bridge"'
-                         ',"index":1,"id":"pci.1"}')
-        self.vm.add_args('-device', '{"driver":"spapr-vscsi","id":"scsi1"'
-                         ',"reg":12288}')
-        self.vm.add_args('-m', '2G,slots=32,maxmem=4G',
-                         '-object', 'memory-backend-ram,id=ram1,size=1G',
-                         '-device', 'pc-dimm,id=dimm1,memdev=ram1')
-
-        # Create a temporary qcow2 and launch the test-case
-        with tempfile.NamedTemporaryFile(prefix=prefix,
-                                         suffix='.qcow2') as qcow2:
-            process.run(self.qemu_img + ' create -f qcow2 ' +
-                        qcow2.name + ' 1G')
-
-            self.vm.add_args('-drive', 'file=' + qcow2.name +
-                         ',format=qcow2,if=none,id='
-                         'drive-virtio-disk1',
-                         '-device', 'virtio-blk-pci,bus=pci.0,'
-                         'addr=0xb,drive=drive-virtio-disk1,id=virtio-disk1'
-                         ',bootindex=2')
-            self.common_tuxrun(csums=sums, drive="scsi-hd")
 
     #
     # The tests themselves. The configuration is derived from how
@@ -436,41 +379,6 @@ def test_ppc32(self):
 
         self.common_tuxrun(csums=sums, drive="virtio-blk-pci")
 
-    def test_ppc64(self):
-        """
-        :avocado: tags=arch:ppc64
-        :avocado: tags=machine:pseries
-        :avocado: tags=cpu:POWER10
-        :avocado: tags=endian:big
-        :avocado: tags=console:hvc0
-        :avocado: tags=tuxboot:ppc64
-        :avocado: tags=image:vmlinux
-        :avocado: tags=extradev:driver=spapr-vscsi
-        :avocado: tags=root:sda
-        """
-        sums = { "rootfs.ext4.zst" :
-                 "1d953e81a4379e537fc8e41e05a0a59d9b453eef97aa03d47866c6c45b00bdff",
-                 "vmlinux" :
-                 "f22a9b9e924174a4c199f4c7e5d91a2339fcfe51c6eafd0907dc3e09b64ab728" }
-        self.ppc64_common_tuxrun(sums, prefix='tuxrun_ppc64_')
-
-    def test_ppc64le(self):
-        """
-        :avocado: tags=arch:ppc64
-        :avocado: tags=machine:pseries
-        :avocado: tags=cpu:POWER10
-        :avocado: tags=console:hvc0
-        :avocado: tags=tuxboot:ppc64le
-        :avocado: tags=image:vmlinux
-        :avocado: tags=extradev:driver=spapr-vscsi
-        :avocado: tags=root:sda
-        """
-        sums = { "rootfs.ext4.zst" :
-                 "b442678c93fb8abe1f7d3bfa20556488de6b475c22c8fed363f42cf81a0a3906",
-                 "vmlinux" :
-                 "979eb61b445a010fb13e2b927126991f8ceef9c590fa2be0996c00e293e80cf2" }
-        self.ppc64_common_tuxrun(sums, prefix='tuxrun_ppc64le_')
-
     def test_riscv32(self):
         """
         :avocado: tags=arch:riscv32
diff --git a/tests/functional/test_ppc64_tuxrun.py b/tests/functional/test_ppc64_tuxrun.py
new file mode 100755
index 0000000000..552b53c97a
--- /dev/null
+++ b/tests/functional/test_ppc64_tuxrun.py
@@ -0,0 +1,110 @@
+#!/usr/bin/env python3
+#
+# Functional test that boots known good tuxboot images the same way
+# that tuxrun (www.tuxrun.org) does. This tool is used by things like
+# the LKFT project to run regression tests on kernels.
+#
+# Copyright (c) 2023 Linaro Ltd.
+#
+# Author:
+#  Alex Bennée <alex.bennee@linaro.org>
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+import tempfile
+
+from qemu_test import run_cmd, Asset
+from qemu_test.tuxruntest import TuxRunBaselineTest
+
+class TuxRunPPC64Test(TuxRunBaselineTest):
+
+    def ppc64_common_tuxrun(self, kernel_asset, rootfs_asset, prefix):
+        self.set_machine('pseries')
+        self.cpu='POWER10'
+        self.console='hvc0'
+        self.root='sda'
+        self.extradev='spapr-vscsi'
+        # add device args to command line.
+        self.require_netdev('user')
+        self.vm.add_args('-netdev', 'user,id=vnet,hostfwd=:127.0.0.1:0-:22',
+                         '-device', 'virtio-net,netdev=vnet')
+        self.vm.add_args('-netdev', '{"type":"user","id":"hostnet0"}',
+                         '-device', '{"driver":"virtio-net-pci","netdev":'
+                         '"hostnet0","id":"net0","mac":"52:54:00:4c:e3:86",'
+                         '"bus":"pci.0","addr":"0x9"}')
+        self.vm.add_args('-device', '{"driver":"qemu-xhci","p2":15,"p3":15,'
+                         '"id":"usb","bus":"pci.0","addr":"0x2"}')
+        self.vm.add_args('-device', '{"driver":"virtio-scsi-pci","id":"scsi0"'
+                         ',"bus":"pci.0","addr":"0x3"}')
+        self.vm.add_args('-device', '{"driver":"virtio-serial-pci","id":'
+                         '"virtio-serial0","bus":"pci.0","addr":"0x4"}')
+        self.vm.add_args('-device', '{"driver":"scsi-cd","bus":"scsi0.0"'
+                         ',"channel":0,"scsi-id":0,"lun":0,"device_id":'
+                         '"drive-scsi0-0-0-0","id":"scsi0-0-0-0"}')
+        self.vm.add_args('-device', '{"driver":"virtio-balloon-pci",'
+                         '"id":"balloon0","bus":"pci.0","addr":"0x6"}')
+        self.vm.add_args('-audiodev', '{"id":"audio1","driver":"none"}')
+        self.vm.add_args('-device', '{"driver":"usb-tablet","id":"input0"'
+                         ',"bus":"usb.0","port":"1"}')
+        self.vm.add_args('-device', '{"driver":"usb-kbd","id":"input1"'
+                         ',"bus":"usb.0","port":"2"}')
+        self.vm.add_args('-device', '{"driver":"VGA","id":"video0",'
+                         '"vgamem_mb":16,"bus":"pci.0","addr":"0x7"}')
+        self.vm.add_args('-object', '{"qom-type":"rng-random","id":"objrng0"'
+                         ',"filename":"/dev/urandom"}',
+                         '-device', '{"driver":"virtio-rng-pci","rng":"objrng0"'
+                         ',"id":"rng0","bus":"pci.0","addr":"0x8"}')
+        self.vm.add_args('-object', '{"qom-type":"cryptodev-backend-builtin",'
+                         '"id":"objcrypto0","queues":1}',
+                         '-device', '{"driver":"virtio-crypto-pci",'
+                         '"cryptodev":"objcrypto0","id":"crypto0","bus"'
+                         ':"pci.0","addr":"0xa"}')
+        self.vm.add_args('-device', '{"driver":"spapr-pci-host-bridge"'
+                         ',"index":1,"id":"pci.1"}')
+        self.vm.add_args('-device', '{"driver":"spapr-vscsi","id":"scsi1"'
+                         ',"reg":12288}')
+        self.vm.add_args('-m', '2G,slots=32,maxmem=4G',
+                         '-object', 'memory-backend-ram,id=ram1,size=1G',
+                         '-device', 'pc-dimm,id=dimm1,memdev=ram1')
+
+        # Create a temporary qcow2 and launch the test-case
+        with tempfile.NamedTemporaryFile(prefix=prefix,
+                                         suffix='.qcow2') as qcow2:
+            run_cmd([self.qemu_img, 'create', '-f', 'qcow2', qcow2.name, ' 1G'])
+
+            self.vm.add_args('-drive', 'file=' + qcow2.name +
+                         ',format=qcow2,if=none,id='
+                         'drive-virtio-disk1',
+                         '-device', 'virtio-blk-pci,bus=pci.0,'
+                         'addr=0xb,drive=drive-virtio-disk1,id=virtio-disk1'
+                         ',bootindex=2')
+            self.common_tuxrun(kernel_asset, rootfs_asset=rootfs_asset,
+                               drive="scsi-hd")
+
+    ASSET_PPC64_KERNEL = Asset(
+        'https://storage.tuxboot.com/20230331/ppc64/vmlinux',
+        '1d953e81a4379e537fc8e41e05a0a59d9b453eef97aa03d47866c6c45b00bdff')
+    ASSET_PPC64_ROOTFS = Asset(
+        'https://storage.tuxboot.com/20230331/ppc64/rootfs.ext4.zst',
+        'f22a9b9e924174a4c199f4c7e5d91a2339fcfe51c6eafd0907dc3e09b64ab728')
+
+    def test_ppc64(self):
+        self.ppc64_common_tuxrun(kernel_asset=self.ASSET_PPC64_KERNEL,
+                                 rootfs_asset=self.ASSET_PPC64_ROOTFS,
+                                 prefix='tuxrun_ppc64_')
+
+    ASSET_PPC64LE_KERNEL = Asset(
+        'https://storage.tuxboot.com/20230331/ppc64le/vmlinux',
+        '979eb61b445a010fb13e2b927126991f8ceef9c590fa2be0996c00e293e80cf2')
+    ASSET_PPC64LE_ROOTFS = Asset(
+        'https://storage.tuxboot.com/20230331/ppc64le/rootfs.ext4.zst',
+        'b442678c93fb8abe1f7d3bfa20556488de6b475c22c8fed363f42cf81a0a3906')
+
+    def test_ppc64le(self):
+        self.ppc64_common_tuxrun(kernel_asset=self.ASSET_PPC64LE_KERNEL,
+                                 rootfs_asset=self.ASSET_PPC64LE_ROOTFS,
+                                 prefix='tuxrun_ppc64le_')
+
+
+if __name__ == '__main__':
+    TuxRunBaselineTest.main()
-- 
2.46.1
