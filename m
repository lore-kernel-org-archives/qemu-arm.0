Received: by 2002:a0c:fe44:0:0:0:0:0 with SMTP id u4csp1027120qvs;
        Tue, 13 Jul 2021 14:21:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6wdSo0hL7kHwiYhVlZ1CQRZtYfLWl0VTBGT+ZE8S2pRNhfYYZjtz5A7JoB7bHDn2Tegdc
X-Received: by 2002:aa7:db93:: with SMTP id u19mr8442022edt.227.1626211264147;
        Tue, 13 Jul 2021 14:21:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626211264; cv=none;
        d=google.com; s=arc-20160816;
        b=IWV3aeS90Ax6ftN5bo3ToJl2kVkwhl4cF54ycVzNw7bS+KnMb1KE8wIeameH/de36p
         VL973VNuy6TdKM09mJCkjpof3rIczFru6F/n79YdEO6f9/aimBI1q46TkJdmKk9ZzbaS
         0fHwIfltAB/mCVMujdpX7Zr0UDJw5SnxnvJJfycuUYlxxyK98FLMX/m4+epCLsNEjdst
         gNlUlNy9NZbpD/F22GB6Kyd/Ys9uPZZvdGzz6qpc448LHoxlHmaJz9qBKZBVK/Z2lc9P
         eqKwgAkH5WduhjdEa1PdAJrTUlyiW0e1y3XwUdzcVb2jELsAuXaNMSSTq6TRMY12SLSH
         8WUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=/5TXKC1dQEU+Xky60erz3/gHcfcWsiMRRr6v27umNWU=;
        b=QDy2SE7O2ttRQpfjyHHYjXVk06UcDKlSuoV2A4Tnq4RbUyLNDy0pLOis2ScBSxofos
         bPZRkTsCjMhffqPNU6bJvjdWIj8f03r1y9NWw214wygOa8eiX+Ck3jXA7zNs/KA408LK
         /2ercw4dKPx0jnAfpzBoiKzWoMY3mnidvBeAb7Ogw6oa+oEU4AP1PIZYutZXiYda8HbN
         kpz5KeS2MllVkypD6DSyUh73+bUAKelcNgwc4kuoCXQJLvCn1og3/OMwM78A/OjSJG5x
         atjRH8Q6/O307CCyDR5nw6ycetpkE6Q3u3JjpekGrpfN5N2K+prm2Q2lNHdTaTmSwbyV
         iooQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SAX6PyGC;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id t7si22330293edd.369.2021.07.13.14.21.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Jul 2021 14:21:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SAX6PyGC;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626211263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/5TXKC1dQEU+Xky60erz3/gHcfcWsiMRRr6v27umNWU=;
	b=SAX6PyGC8V3XRYSS5RE5r6ybj9KFHQVXs4OrHsU1clYL8XtzVdxy+ve7/aNJY22kdidNyG
	7Ar0Fn7Wk4wAOmqeCzPzj9l2wPel8PxB4RlkNoryozfbsknaybML34xva6LVDFwugrX0lJ
	1bNwwN2uClpjHWueVDSmLsmsqbCLZVU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-aqCCbEMmN22sgMgKfZkL2w-1; Tue, 13 Jul 2021 17:21:01 -0400
X-MC-Unique: aqCCbEMmN22sgMgKfZkL2w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75AB68015F5;
	Tue, 13 Jul 2021 21:20:59 +0000 (UTC)
Received: from p50.localhost.net (ovpn-117-22.rdu2.redhat.com [10.10.117.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 21AF219C44;
	Tue, 13 Jul 2021 21:20:57 +0000 (UTC)
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
	Cleber Rosa <crosa@redhat.com>
Subject: [PULL 10/23] avocado_qemu: Add SMMUv3 tests
Date: Tue, 13 Jul 2021 17:19:10 -0400
Message-Id: <20210713211923.3809241-11-crosa@redhat.com>
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
X-TUID: gPTOwBbEHigc

From: Eric Auger <eric.auger@redhat.com>

Add new tests checking the good behavior of the SMMUv3 protecting
2 virtio pci devices (block and net). We check the guest boots and
we are able to install a package. Different guest configs are tested:
standard, passthrough an strict=0. This is tested with both fedora 31 and
33. The former uses a 5.3 kernel without range invalidation whereas the
latter uses a 5.8 kernel that features range invalidation.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Tested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20210706131729.30749-4-eric.auger@redhat.com>
[CR: split long lines]
[CR: added MAINTAINERS entry]
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 MAINTAINERS              |   1 +
 tests/acceptance/smmu.py | 137 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 138 insertions(+)
 create mode 100644 tests/acceptance/smmu.py

diff --git a/MAINTAINERS b/MAINTAINERS
index c340bb02b0..148153d74f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -171,6 +171,7 @@ L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/smmu*
 F: include/hw/arm/smmu*
+F: tests/acceptance/smmu.py
 
 AVR TCG CPUs
 M: Michael Rolnik <mrolnik@gmail.com>
diff --git a/tests/acceptance/smmu.py b/tests/acceptance/smmu.py
new file mode 100644
index 0000000000..b3c4de6bf4
--- /dev/null
+++ b/tests/acceptance/smmu.py
@@ -0,0 +1,137 @@
+# SMMUv3 Functional tests
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
+from avocado_qemu import LinuxTest, BUILD_DIR
+
+@skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
+class SMMU(LinuxTest):
+    """
+    :avocado: tags=accel:kvm
+    :avocado: tags=cpu:host
+    :avocado: tags=arch:aarch64
+    :avocado: tags=machine:virt
+    :avocado: tags=distro:fedora
+    :avocado: tags=smmu
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
+        self.vm.add_args('-drive',
+                         'file=%s,if=none,cache=writethrough,id=drv0' % path)
+
+    def setUp(self):
+        super(SMMU, self).setUp(None, 'virtio-net-pci' + self.IOMMU_ADDON)
+
+    def common_vm_setup(self, custom_kernel=False):
+        self.require_accelerator("kvm")
+        self.vm.add_args("-accel", "kvm")
+        self.vm.add_args("-cpu", "host")
+        self.vm.add_args("-machine", "iommu=smmuv3")
+        self.vm.add_args("-d", "guest_errors")
+        self.vm.add_args('-bios', os.path.join(BUILD_DIR, 'pc-bios',
+                         'edk2-aarch64-code.fd'))
+        self.vm.add_args('-device', 'virtio-rng-pci,rng=rng0')
+        self.vm.add_args('-object',
+                         'rng-random,id=rng0,filename=/dev/urandom')
+
+        if custom_kernel is False:
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
+        self.ssh_command('dnf -y install numactl-devel')
+
+
+    # 5.3 kernel without RIL #
+
+    def test_smmu_noril(self):
+        """
+        :avocado: tags=smmu_noril
+        :avocado: tags=smmu_noril_tests
+        :avocado: tags=distro_version:31
+        """
+        self.common_vm_setup()
+        self.run_and_check()
+
+    def test_smmu_noril_passthrough(self):
+        """
+        :avocado: tags=smmu_noril_passthrough
+        :avocado: tags=smmu_noril_tests
+        :avocado: tags=distro_version:31
+        """
+        self.common_vm_setup(True)
+        self.kernel_params = (self.distro.default_kernel_params +
+                              ' iommu.passthrough=on')
+        self.run_and_check()
+
+    def test_smmu_noril_nostrict(self):
+        """
+        :avocado: tags=smmu_noril_nostrict
+        :avocado: tags=smmu_noril_tests
+        :avocado: tags=distro_version:31
+        """
+        self.common_vm_setup(True)
+        self.kernel_params = (self.distro.default_kernel_params +
+                              ' iommu.strict=0')
+        self.run_and_check()
+
+    # 5.8 kernel featuring range invalidation
+    # >= v5.7 kernel
+
+    def test_smmu_ril(self):
+        """
+        :avocado: tags=smmu_ril
+        :avocado: tags=smmu_ril_tests
+        :avocado: tags=distro_version:33
+        """
+        self.common_vm_setup()
+        self.run_and_check()
+
+    def test_smmu_ril_passthrough(self):
+        """
+        :avocado: tags=smmu_ril_passthrough
+        :avocado: tags=smmu_ril_tests
+        :avocado: tags=distro_version:33
+        """
+        self.common_vm_setup(True)
+        self.kernel_params = (self.distro.default_kernel_params +
+                              ' iommu.passthrough=on')
+        self.run_and_check()
+
+    def test_smmu_ril_nostrict(self):
+        """
+        :avocado: tags=smmu_ril_nostrict
+        :avocado: tags=smmu_ril_tests
+        :avocado: tags=distro_version:33
+        """
+        self.common_vm_setup(True)
+        self.kernel_params = (self.distro.default_kernel_params +
+                              ' iommu.strict=0')
+        self.run_and_check()
-- 
2.31.1
