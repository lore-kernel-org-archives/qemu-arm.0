Received: by 2002:a0c:fe44:0:0:0:0:0 with SMTP id u4csp1027331qvs;
        Tue, 13 Jul 2021 14:21:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLx6kwr8OvQqTmIOo5/uviZ+fjCimjUYtCPbt13PNLBdAEBIfCHaIrFQ15saLhW0M1S3dj
X-Received: by 2002:a05:6402:3d4:: with SMTP id t20mr8449497edw.274.1626211281130;
        Tue, 13 Jul 2021 14:21:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626211281; cv=none;
        d=google.com; s=arc-20160816;
        b=XWmtj7nTt7snLA/fkp/UDu2nWoOGwvSVshowJ6od5Wt0oI8hN3o3d2sjPuBmrAT/rO
         j8jAluyY0feKgVsNQc13HfDjH9n394xQHcOToG0/JO6eVndmcqZhuKl9fVAHcL4ZUGvx
         Mf/BS7eW5rD6qh5wDyWaaqOYnX8iSauLPl7uBA0ab+Xm1s/0xDdLk4fhtI7Z7T6fAUu0
         NC1bZeE9Jpu8AT+7w1CBEMpzYlUPXrL32RvKXuNzIjoVobCycTx1/JXooJrIaOQpyitY
         +MNF8RuIvN1Hj49gP09P1UIrK6znAxsABdwCf2ygIRy9Qxr/2gRvPJWrHFkE0IFqltGJ
         479g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=JtX7+yJJi9eBr6Yjxo5IXUWuTnmp8evQVTVARjL0NOU=;
        b=J05OSwvQFyCUiJBDq9YaUerPVJJ2qTsm2MhUHkUWD6P9GxbUa42NZAAfOu1YVRMX6i
         0CID2Q6IU3Na/vbJRr6q8kieikY6bqaAmdQjLG3ISzWNmv/4GqP2GEfet6S3Kb0R/iom
         /x/l8tP5BJJoTz9T2qeySPeYf6EdPs8LRhLniQRUncBtE93JQPHk/ycuaERyppue96wm
         mWqWelsuX6EGk7jRwhHmzPb0HH1uGrlsXroegxOWMvMSfdlt5TR/VpegMJBnyO49dIsT
         +BHTohFNRUiluAPlKIR5wF6qWwZT3AwQ/Mgi543OlqZQUxWoIPRwIOfyl+aqVb62+g+W
         1pyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QDrXrTDK;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id nd21si20813139ejc.248.2021.07.13.14.21.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Jul 2021 14:21:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QDrXrTDK;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626211280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JtX7+yJJi9eBr6Yjxo5IXUWuTnmp8evQVTVARjL0NOU=;
	b=QDrXrTDK7TxQ/jvJJWp1wm2Kkpa9ezfpwSbaFJrqnXReB83dN7hE1y5q7PCy1pEUmPWfZt
	vGZDLkJ1NcwuirNbvH66+eSZQ/XiFzSP4ULO4+E+ruvHN6cMEvGlAuTXPgAgJezHKtPMx1
	NCf1pm7Av5gpljuMpqqa6bxZ1UB9yIc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-TYmfDntyMKalfrS6Fcf_RQ-1; Tue, 13 Jul 2021 17:21:18 -0400
X-MC-Unique: TYmfDntyMKalfrS6Fcf_RQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D5A0100B3B4;
	Tue, 13 Jul 2021 21:21:16 +0000 (UTC)
Received: from p50.localhost.net (ovpn-117-22.rdu2.redhat.com [10.10.117.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 85DCF19C44;
	Tue, 13 Jul 2021 21:20:59 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Ryo ONODERA <ryoon@netbsd.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Willian Rampazzo <willianr@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	John Snow <jsnow@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Willian Rampazzo <wrampazz@redhat.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Beraldo Leal <bleal@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	qemu-arm@nongnu.org,
	Eric Auger <eric.auger@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-ppc@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	Thomas Huth <thuth@redhat.com>,
	Kamil Rytarowski <kamil@netbsd.org>,
	Cleber Rosa <crosa@redhat.com>,
	Peter Xu <peterx@redhat.com>
Subject: [PULL 11/23] avocado_qemu: Add Intel iommu tests
Date: Tue, 13 Jul 2021 17:19:11 -0400
Message-Id: <20210713211923.3809241-12-crosa@redhat.com>
In-Reply-To: <20210713211923.3809241-1-crosa@redhat.com>
References: <20210713211923.3809241-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
X-TUID: rw6qmwqKjJRQ

From: Eric Auger <eric.auger@redhat.com>

Add Intel IOMMU functional tests based on fedora 31.
Different configs are checked:
- strict
- caching mode, strict
- passthrough.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Willian Rampazzo <willianr@redhat.com>
Tested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Acked-by: Peter Xu <peterx@redhat.com>
Message-Id: <20210706131729.30749-5-eric.auger@redhat.com>
[CR: split long lines]
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/intel_iommu.py | 119 ++++++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)
 create mode 100644 tests/acceptance/intel_iommu.py

diff --git a/tests/acceptance/intel_iommu.py b/tests/acceptance/intel_iommu.py
new file mode 100644
index 0000000000..474d62f6bf
--- /dev/null
+++ b/tests/acceptance/intel_iommu.py
@@ -0,0 +1,119 @@
+# INTEL_IOMMU Functional tests
+#
+# Copyright (c) 2021 Red Hat, Inc.
+#
+# Author:
+#  Eric Auger <eric.auger@redhat.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+import os
+
+from avocado import skipIf
+from avocado_qemu import LinuxTest
+
+@skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
+class IntelIOMMU(LinuxTest):
+    """
+    :avocado: tags=arch:x86_64
+    :avocado: tags=distro:fedora
+    :avocado: tags=distro_version:31
+    :avocado: tags=machine:q35
+    :avocado: tags=accel:kvm
+    :avocado: tags=intel_iommu
+    """
+
+    IOMMU_ADDON = ',iommu_platform=on,disable-modern=off,disable-legacy=on'
+    kernel_path = None
+    initrd_path = None
+    kernel_params = None
+
+    def set_up_boot(self):
+        path = self.download_boot()
+        self.vm.add_args('-device', 'virtio-blk-pci,bus=pcie.0,scsi=off,' +
+                         'drive=drv0,id=virtio-disk0,bootindex=1,'
+                         'werror=stop,rerror=stop' + self.IOMMU_ADDON)
+        self.vm.add_args('-device', 'virtio-gpu-pci' + self.IOMMU_ADDON)
+        self.vm.add_args('-drive',
+                         'file=%s,if=none,cache=writethrough,id=drv0' % path)
+
+    def setUp(self):
+        super(IntelIOMMU, self).setUp(None, 'virtio-net-pci' + self.IOMMU_ADDON)
+
+    def add_common_args(self):
+        self.vm.add_args('-device', 'virtio-rng-pci,rng=rng0')
+        self.vm.add_args('-object',
+                         'rng-random,id=rng0,filename=/dev/urandom')
+
+    def common_vm_setup(self, custom_kernel=None):
+        self.require_accelerator("kvm")
+        self.add_common_args()
+        self.vm.add_args("-accel", "kvm")
+
+        if custom_kernel is None:
+            return
+
+        kernel_url = self.distro.pxeboot_url + 'vmlinuz'
+        initrd_url = self.distro.pxeboot_url + 'initrd.img'
+        self.kernel_path = self.fetch_asset(kernel_url)
+        self.initrd_path = self.fetch_asset(initrd_url)
+
+    def run_and_check(self):
+        if self.kernel_path:
+            self.vm.add_args('-kernel', self.kernel_path,
+                             '-append', self.kernel_params,
+                             '-initrd', self.initrd_path)
+        self.launch_and_wait()
+        self.ssh_command('cat /proc/cmdline')
+        self.ssh_command('dmesg | grep -e DMAR -e IOMMU')
+        self.ssh_command('find /sys/kernel/iommu_groups/ -type l')
+        self.ssh_command('dnf -y install numactl-devel')
+
+    def test_intel_iommu(self):
+        """
+        :avocado: tags=intel_iommu_intremap
+        """
+
+        self.common_vm_setup(True)
+        self.vm.add_args('-device', 'intel-iommu,intremap=on')
+        self.vm.add_args('-machine', 'kernel_irqchip=split')
+
+        self.kernel_params = (self.distro.default_kernel_params +
+                              ' quiet intel_iommu=on')
+        self.run_and_check()
+
+    def test_intel_iommu_strict(self):
+        """
+        :avocado: tags=intel_iommu_strict
+        """
+
+        self.common_vm_setup(True)
+        self.vm.add_args('-device', 'intel-iommu,intremap=on')
+        self.vm.add_args('-machine', 'kernel_irqchip=split')
+        self.kernel_params = (self.distro.default_kernel_params +
+                              ' quiet intel_iommu=on,strict')
+        self.run_and_check()
+
+    def test_intel_iommu_strict_cm(self):
+        """
+        :avocado: tags=intel_iommu_strict_cm
+        """
+
+        self.common_vm_setup(True)
+        self.vm.add_args('-device', 'intel-iommu,intremap=on,caching-mode=on')
+        self.vm.add_args('-machine', 'kernel_irqchip=split')
+        self.kernel_params = (self.distro.default_kernel_params +
+                              ' quiet intel_iommu=on,strict')
+        self.run_and_check()
+
+    def test_intel_iommu_pt(self):
+        """
+        :avocado: tags=intel_iommu_pt
+        """
+
+        self.common_vm_setup(True)
+        self.vm.add_args('-device', 'intel-iommu,intremap=on')
+        self.vm.add_args('-machine', 'kernel_irqchip=split')
+        self.kernel_params = (self.distro.default_kernel_params +
+                              ' quiet intel_iommu=on iommu=pt')
+        self.run_and_check()
-- 
2.31.1
