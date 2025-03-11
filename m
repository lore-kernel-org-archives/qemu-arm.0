Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp1753652njc;
        Tue, 11 Mar 2025 03:50:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX2SNM0weV9bhgAkpreqf0LBLfrxF/AB86Ge+la18uBW/cArIKu8VhCJB6ul9wQ2nKnsG2TZRkwGVmGzg==@linaro.org
X-Google-Smtp-Source: AGHT+IE4iSGME3xUXETkl8Ofo8Bk7tSkwCEYhyfspAAhRC8f7NMktpF3LrH3A9T1v1BNhO2rhL5I
X-Received: by 2002:a05:6214:5096:b0:6e6:5bb2:c1a8 with SMTP id 6a1803df08f44-6e9006c85edmr249850636d6.34.1741690211219;
        Tue, 11 Mar 2025 03:50:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741690211; cv=none;
        d=google.com; s=arc-20240605;
        b=D9pfrFxALB/fpgPKjvrELabu9qGLyD7Ms+YqRfivpMhWbsnLsBtHIpYRSIe8zky96e
         Qd30JM5stdz4RKIDS2uW3RIqaXg1MUOW5xer57WJ2XuNMgLj54yLNZDTHpS60ehtU+0T
         d6LQLk5V5QpsRp2HX5KqUutLHTq7TMwgj9vWaYz2I4EHp3WWJ7jtk7rxy1FtTnSozVRz
         qqZB8+3lRxLHmU0XQ/xRxG1m0DIHN/WY3IqUgVzYdkT+/wzGbXE+lCqrGiFT60EQXwpg
         e0w11b2jHNsBkYol7iUMWCIkgEi8dhcqNWrBJPL2BJJwpE6EVK10OrXsdWQ1qVAbtu10
         xf7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=B51SnBuZVNEp9ZOTJRpMCfOTCApW2zfCqbWGsDc+aMY=;
        fh=ZIbOb9e3AEmOv8oro5Z8x69hibJw429uMiiqcnC7Je8=;
        b=aF+a4CsaxkMEH7IRLIxoRoIlX8SaAUQ6W/qGS7LxQcsLqD15khAh8wWQlBRn4/bGXK
         G33NknzXStKjVqH38pzoGVJdmylCHI4Au1oCg7ckQdyR0E1g+Ess4hZW7/ICXI3FSn6B
         v6A0rXKFRQ76xxOp+H2t7qI94Pa8ufQ0OgHhFbBpJvcsQuUV1smg0G6QX/rpCu9VjJzA
         Ihp9d/7M+yfwnWcNbkCvWZ4tHyc4DLxaDHwijN9hwJ3e2kRHP/vHJQOFepv2/hz9WxMr
         RZEpj5Uc+OgAGYZ/Ly3esdRPPL5GS5xJ7IpU2cmPrGT8y81FDtQ+mkIKKTb25/WythkR
         MYbQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fPu46PgH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e91c6b2d6csi36306276d6.267.2025.03.11.03.50.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Mar 2025 03:50:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fPu46PgH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1trxBC-0005gZ-Ut; Tue, 11 Mar 2025 06:49:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1trxB3-0005fO-6H
 for qemu-arm@nongnu.org; Tue, 11 Mar 2025 06:49:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1trxAz-00041U-BY
 for qemu-arm@nongnu.org; Tue, 11 Mar 2025 06:49:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741690170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=B51SnBuZVNEp9ZOTJRpMCfOTCApW2zfCqbWGsDc+aMY=;
 b=fPu46PgH9j6wNPMfn94Sis9R7aLG9GHgFgiKEA4+GB+w+HTomCo7mp+tepQOcPyXDP8/l0
 RVmQb3KYmWXy9de37H4oCATtkw1iu/s2QZMrhRQ9IH85QY9BaWavHZffU3OtqSgV4JcTyv
 E1Ops1FcAKv88M5ebB4OzY2Ac5QYHCw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-434-dmj6SVrbPUKitIVnzkcUNQ-1; Tue,
 11 Mar 2025 06:49:27 -0400
X-MC-Unique: dmj6SVrbPUKitIVnzkcUNQ-1
X-Mimecast-MFC-AGG-ID: dmj6SVrbPUKitIVnzkcUNQ_1741690166
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 6CDEF1809CA6; Tue, 11 Mar 2025 10:49:26 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.33.32])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id E2A991956094; Tue, 11 Mar 2025 10:49:22 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Eric Auger <eric.auger@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH for-10.1] tests/functional: Convert the SMMU test to the
 functional framework
Date: Tue, 11 Mar 2025 11:49:20 +0100
Message-ID: <20250311104920.364102-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 1hS+NpUCdOii

This test was using cloudinit and a "dnf install" command in the guest
to exercise the NIC with SMMU enabled. Since we don't have the cloudinit
stuff in the functional framework and we should not rely on having access
to external networks (once our ASSETs have been cached), we rather boot
into the initrd first, manually mount the root disk and then use the
check_http_download() function from the functional framework here instead
for testing whether the network works as expected.

Unfortunately, there seems to be a small race when using the files
from Fedora 33: To enter the initrd shell, we have to send a "return"
once. But it does not seem to work if we send it too early. Using a
sleep(0.2) makes it work reliably for me, but to make it even more
unlikely to trigger this situation, let's better limit the Fedora 33
tests to only run with KVM.

Finally, while we're at it, we also add some lines for testing writes
to the hard disk, as we already do it in the test_intel_iommu test.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS                                   |   2 +-
 tests/functional/meson.build                  |   2 +
 .../test_aarch64_smmu.py}                     | 243 +++++++++++-------
 3 files changed, 159 insertions(+), 88 deletions(-)
 rename tests/{avocado/smmu.py => functional/test_aarch64_smmu.py} (17%)
 mode change 100644 => 100755

diff --git a/MAINTAINERS b/MAINTAINERS
index 90e48b26715..211e70c6942 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -218,7 +218,7 @@ L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/smmu*
 F: include/hw/arm/smmu*
-F: tests/avocado/smmu.py
+F: tests/functional/test_aarch64_smmu.py
 
 AVR TCG CPUs
 M: Michael Rolnik <mrolnik@gmail.com>
diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index 43a34c6447e..e8bf0e4a6bc 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -18,6 +18,7 @@ test_timeouts = {
   'aarch64_rme_sbsaref' : 1200,
   'aarch64_sbsaref_alpine' : 1200,
   'aarch64_sbsaref_freebsd' : 720,
+  'aarch64_smmu' : 720,
   'aarch64_tuxrun' : 240,
   'aarch64_virt' : 720,
   'acpi_bits' : 420,
@@ -84,6 +85,7 @@ tests_aarch64_system_thorough = [
   'aarch64_sbsaref',
   'aarch64_sbsaref_alpine',
   'aarch64_sbsaref_freebsd',
+  'aarch64_smmu',
   'aarch64_tcg_plugins',
   'aarch64_tuxrun',
   'aarch64_virt',
diff --git a/tests/avocado/smmu.py b/tests/functional/test_aarch64_smmu.py
old mode 100644
new mode 100755
similarity index 17%
rename from tests/avocado/smmu.py
rename to tests/functional/test_aarch64_smmu.py
index 83fd79e922e..bba8599401c
--- a/tests/avocado/smmu.py
+++ b/tests/functional/test_aarch64_smmu.py
@@ -1,3 +1,5 @@
+#!/usr/bin/env python3
+#
 # SMMUv3 Functional tests
 #
 # Copyright (c) 2021 Red Hat, Inc.
@@ -7,44 +9,48 @@
 #
 # This work is licensed under the terms of the GNU GPL, version 2 or
 # later.  See the COPYING file in the top-level directory.
+
 import os
+import time
+
+from qemu_test import LinuxKernelTest, Asset, exec_command_and_wait_for_pattern
+from qemu_test import BUILD_DIR
+from qemu.utils import kvm_available
 
-from avocado import skipUnless
-from avocado_qemu import BUILD_DIR
-from avocado_qemu.linuxtest import LinuxTest
-
-@skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is unstable on GitLab')
-class SMMU(LinuxTest):
-    """
-    :avocado: tags=accel:kvm
-    :avocado: tags=cpu:host
-    :avocado: tags=arch:aarch64
-    :avocado: tags=machine:virt
-    :avocado: tags=distro:fedora
-    :avocado: tags=smmu
-    :avocado: tags=flaky
-    """
 
+class SMMU(LinuxKernelTest):
+
+    default_kernel_params = ('earlyprintk=pl011,0x9000000 no_timer_check '
+                             'printk.time=1 rd_NO_PLYMOUTH net.ifnames=0 '
+                             'console=ttyAMA0 rd.rescue')
     IOMMU_ADDON = ',iommu_platform=on,disable-modern=off,disable-legacy=on'
     kernel_path = None
     initrd_path = None
     kernel_params = None
 
-    def set_up_boot(self):
-        path = self.download_boot()
+    GUEST_PORT = 8080
+
+    def set_up_boot(self, path):
         self.vm.add_args('-device', 'virtio-blk-pci,bus=pcie.0,' +
                          'drive=drv0,id=virtio-disk0,bootindex=1,'
                          'werror=stop,rerror=stop' + self.IOMMU_ADDON)
         self.vm.add_args('-drive',
-                         'file=%s,if=none,cache=writethrough,id=drv0' % path)
-
-    def setUp(self):
-        super(SMMU, self).setUp(None, 'virtio-net-pci' + self.IOMMU_ADDON)
-
-    def common_vm_setup(self, custom_kernel=False):
-        self.require_accelerator("kvm")
-        self.vm.add_args("-accel", "kvm")
-        self.vm.add_args("-cpu", "host")
+                f'file={path},if=none,cache=writethrough,id=drv0,snapshot=on')
+
+        self.vm.add_args('-netdev',
+                         'user,id=n1,hostfwd=tcp:127.0.0.1:0-:%d' %
+                         self.GUEST_PORT)
+        self.vm.add_args('-device', 'virtio-net,netdev=n1' + self.IOMMU_ADDON)
+
+    def common_vm_setup(self, kernel, initrd, disk):
+        self.set_machine("virt")
+        self.require_netdev('user')
+        if kvm_available(qemu_bin=self.qemu_bin):
+            self.vm.add_args("-accel", "kvm")
+            self.vm.add_args("-cpu", "host")
+        else:
+            self.vm.add_args("-cpu", "cortex-a57")
+        self.vm.add_args('-m', '1G')
         self.vm.add_args("-machine", "iommu=smmuv3")
         self.vm.add_args("-d", "guest_errors")
         self.vm.add_args('-bios', os.path.join(BUILD_DIR, 'pc-bios',
@@ -53,87 +59,150 @@ def common_vm_setup(self, custom_kernel=False):
         self.vm.add_args('-object',
                          'rng-random,id=rng0,filename=/dev/urandom')
 
-        if custom_kernel is False:
-            return
+        self.kernel_path = kernel.fetch()
+        self.initrd_path = initrd.fetch()
+        self.set_up_boot(disk.fetch())
+
+    def run_and_check(self, filename, hashsum):
+        self.vm.add_args('-initrd', self.initrd_path)
+        self.vm.add_args('-append', self.kernel_params)
+        self.launch_kernel(self.kernel_path, initrd=self.initrd_path,
+                           wait_for='attach it to a bug report.')
+        prompt = '# '
+        # Fedora 33 requires 'return' to be pressed to enter the shell.
+        # There seems to be a small race between detecting the previous ':'
+        # and sending the newline, so we need to add a small delay here.
+        self.wait_for_console_pattern(':')
+        time.sleep(0.2)
+        exec_command_and_wait_for_pattern(self, '\n', prompt)
+        exec_command_and_wait_for_pattern(self, 'cat /proc/cmdline',
+                                          self.kernel_params)
+
+        # Checking for SMMU enablement:
+        self.log.info("Checking whether SMMU has been enabled...")
+        exec_command_and_wait_for_pattern(self, 'dmesg | grep smmu',
+                                          'arm-smmu-v3')
+        self.wait_for_console_pattern(prompt)
+        exec_command_and_wait_for_pattern(self,
+                                    'find /sys/kernel/iommu_groups/ -type l',
+                                    'devices/0000:00:')
+        self.wait_for_console_pattern(prompt)
+
+        # Copy a file (checked later), umount afterwards to drop disk cache:
+        self.log.info("Checking hard disk...")
+        exec_command_and_wait_for_pattern(self,
+                        "while ! (dmesg -c | grep vda:) ; do sleep 1 ; done",
+                        "vda2")
+        exec_command_and_wait_for_pattern(self, 'mount /dev/vda2 /sysroot',
+                                          'mounted filesystem')
+        exec_command_and_wait_for_pattern(self, 'cp /bin/vi /sysroot/root/vi',
+                                          prompt)
+        exec_command_and_wait_for_pattern(self, 'umount /sysroot', prompt)
+        # Switch from initrd to the cloud image filesystem:
+        exec_command_and_wait_for_pattern(self, 'mount /dev/vda2 /sysroot',
+                                          prompt)
+        exec_command_and_wait_for_pattern(self,
+                ('for d in dev proc sys run ; do '
+                 'mount -o bind /$d /sysroot/$d ; done'), prompt)
+        exec_command_and_wait_for_pattern(self, 'chroot /sysroot', prompt)
+        # Check files on the hard disk:
+        exec_command_and_wait_for_pattern(self,
+            ('if diff -q /root/vi /usr/bin/vi ; then echo "file" "ok" ; '
+             'else echo "files differ"; fi'), 'file ok')
+        self.wait_for_console_pattern(prompt)
+        exec_command_and_wait_for_pattern(self, f'sha256sum {filename}',
+                                          hashsum)
+
+        # Check virtio-net via HTTP:
+        exec_command_and_wait_for_pattern(self, 'dhclient eth0', prompt)
+        self.check_http_download(filename, hashsum, self.GUEST_PORT)
 
-        kernel_url = self.distro.pxeboot_url + 'vmlinuz'
-        initrd_url = self.distro.pxeboot_url + 'initrd.img'
-        self.kernel_path = self.fetch_asset(kernel_url)
-        self.initrd_path = self.fetch_asset(initrd_url)
 
-    def run_and_check(self):
-        if self.kernel_path:
-            self.vm.add_args('-kernel', self.kernel_path,
-                             '-append', self.kernel_params,
-                             '-initrd', self.initrd_path)
-        self.launch_and_wait()
-        self.ssh_command('cat /proc/cmdline')
-        self.ssh_command('dnf -y install numactl-devel')
+    # 5.3 kernel without RIL #
 
+    ASSET_KERNEL_F31 = Asset(
+        ('https://archives.fedoraproject.org/pub/archive/fedora/linux/'
+         'releases/31/Server/aarch64/os/images/pxeboot/vmlinuz'),
+        '413c7f95e7f40cfa3e73290ffae855c88fae54cccc46123a4b4ed2db7d5c2120')
 
-    # 5.3 kernel without RIL #
+    ASSET_INITRD_F31 = Asset(
+        ('https://archives.fedoraproject.org/pub/archive/fedora/linux/'
+         'releases/31/Server/aarch64/os/images/pxeboot/initrd.img'),
+        '9f3146b28bc531c689f3c5f114cb74e4bd7bd548e0ba19fa77921d8bd256755a')
+
+    ASSET_DISK_F31 = Asset(
+        ('https://archives.fedoraproject.org/pub/archive/fedora/linux/releases'
+         '/31/Cloud/aarch64/images/Fedora-Cloud-Base-31-1.9.aarch64.qcow2'),
+        '1e18d9c0cf734940c4b5d5ec592facaed2af0ad0329383d5639c997fdf16fe49')
+
+    F31_FILENAME = '/boot/initramfs-5.3.7-301.fc31.aarch64.img'
+    F31_HSUM = '1a4beec6607d94df73d9dd1b4985c9c23dd0fdcf4e6ca1351d477f190df7bef9'
 
     def test_smmu_noril(self):
-        """
-        :avocado: tags=smmu_noril
-        :avocado: tags=smmu_noril_tests
-        :avocado: tags=distro_version:31
-        """
-        self.common_vm_setup()
-        self.run_and_check()
+        self.common_vm_setup(self.ASSET_KERNEL_F31, self.ASSET_INITRD_F31,
+                             self.ASSET_DISK_F31)
+        self.kernel_params = self.default_kernel_params
+        self.run_and_check(self.F31_FILENAME, self.F31_HSUM)
 
     def test_smmu_noril_passthrough(self):
-        """
-        :avocado: tags=smmu_noril_passthrough
-        :avocado: tags=smmu_noril_tests
-        :avocado: tags=distro_version:31
-        """
-        self.common_vm_setup(True)
-        self.kernel_params = (self.distro.default_kernel_params +
+        self.common_vm_setup(self.ASSET_KERNEL_F31, self.ASSET_INITRD_F31,
+                             self.ASSET_DISK_F31)
+        self.kernel_params = (self.default_kernel_params +
                               ' iommu.passthrough=on')
-        self.run_and_check()
+        self.run_and_check(self.F31_FILENAME, self.F31_HSUM)
 
     def test_smmu_noril_nostrict(self):
-        """
-        :avocado: tags=smmu_noril_nostrict
-        :avocado: tags=smmu_noril_tests
-        :avocado: tags=distro_version:31
-        """
-        self.common_vm_setup(True)
-        self.kernel_params = (self.distro.default_kernel_params +
+        self.common_vm_setup(self.ASSET_KERNEL_F31, self.ASSET_INITRD_F31,
+                             self.ASSET_DISK_F31)
+        self.kernel_params = (self.default_kernel_params +
                               ' iommu.strict=0')
-        self.run_and_check()
+        self.run_and_check(self.F31_FILENAME, self.F31_HSUM)
+
 
     # 5.8 kernel featuring range invalidation
     # >= v5.7 kernel
 
+    ASSET_KERNEL_F33 = Asset(
+        ('https://archives.fedoraproject.org/pub/archive/fedora/linux/'
+         'releases/33/Server/aarch64/os/images/pxeboot/vmlinuz'),
+        '0ef9e34f80b49fa2ac098899b27075e95c11d5b646f6ca4df2e89237a40f9e4f')
+
+    ASSET_INITRD_F33 = Asset(
+        ('https://archives.fedoraproject.org/pub/archive/fedora/linux/'
+         'releases/33/Server/aarch64/os/images/pxeboot/initrd.img'),
+        '92513f55295c2c16a777f7b6c35ccd70a438e9e1e40b6ba39e0e60900615b3df')
+
+    ASSET_DISK_F33 = Asset(
+        ('https://archives.fedoraproject.org/pub/archive/fedora/linux/releases'
+         '/33/Cloud/aarch64/images/Fedora-Cloud-Base-33-1.2.aarch64.qcow2'),
+        'e7f75cdfd523fe5ac2ca9eeece68edc1a81f386a17f969c1d1c7c87031008a6b')
+
+    F33_FILENAME = '/boot/initramfs-5.8.15-301.fc33.aarch64.img'
+    F33_HSUM = '079cfad0caa82e84c8ca1fb0897a4999dd769f262216099f518619e807a550d9'
+
     def test_smmu_ril(self):
-        """
-        :avocado: tags=smmu_ril
-        :avocado: tags=smmu_ril_tests
-        :avocado: tags=distro_version:33
-        """
-        self.common_vm_setup()
-        self.run_and_check()
+        self.require_accelerator("kvm")
+        self.common_vm_setup(self.ASSET_KERNEL_F33, self.ASSET_INITRD_F33,
+                             self.ASSET_DISK_F33)
+        self.kernel_params = self.default_kernel_params
+        self.run_and_check(self.F33_FILENAME, self.F33_HSUM)
 
     def test_smmu_ril_passthrough(self):
-        """
-        :avocado: tags=smmu_ril_passthrough
-        :avocado: tags=smmu_ril_tests
-        :avocado: tags=distro_version:33
-        """
-        self.common_vm_setup(True)
-        self.kernel_params = (self.distro.default_kernel_params +
+        self.require_accelerator("kvm")
+        self.common_vm_setup(self.ASSET_KERNEL_F33, self.ASSET_INITRD_F33,
+                             self.ASSET_DISK_F33)
+        self.kernel_params = (self.default_kernel_params +
                               ' iommu.passthrough=on')
-        self.run_and_check()
+        self.run_and_check(self.F33_FILENAME, self.F33_HSUM)
 
     def test_smmu_ril_nostrict(self):
-        """
-        :avocado: tags=smmu_ril_nostrict
-        :avocado: tags=smmu_ril_tests
-        :avocado: tags=distro_version:33
-        """
-        self.common_vm_setup(True)
-        self.kernel_params = (self.distro.default_kernel_params +
+        self.require_accelerator("kvm")
+        self.common_vm_setup(self.ASSET_KERNEL_F33, self.ASSET_INITRD_F33,
+                             self.ASSET_DISK_F33)
+        self.kernel_params = (self.default_kernel_params +
                               ' iommu.strict=0')
-        self.run_and_check()
+        self.run_and_check(self.F33_FILENAME, self.F33_HSUM)
+
+
+if __name__ == '__main__':
+    LinuxKernelTest.main()
-- 
2.48.1

