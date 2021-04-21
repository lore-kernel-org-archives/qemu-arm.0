Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp645121lfb;
        Wed, 21 Apr 2021 10:42:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHq9GDEfI15PXBM+Ic2Um6O+r5OMlpDq9z6A1il1lGvr2V/lHOi0h+AhVROuFm1uLv3gYr
X-Received: by 2002:a92:da8c:: with SMTP id u12mr14186152iln.19.1619026941838;
        Wed, 21 Apr 2021 10:42:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619026941; cv=none;
        d=google.com; s=arc-20160816;
        b=nR/+ijbNDSMoY2DzmV/V9lLD2ktKvnWTHhtdT+JjIVF5rMT5RGT92CQ2CFP1IDSlcz
         XaLtLsCfCjJ0Kz+/Xn5NSmizGaNzicSSDqim8b68ODPzcoxBntgqSvd2n5wq/8XoveMo
         6kLSFZWhGevXnMEr1a8WlNZx9Y6xrKQMPpVKKmJ3IjalNKPtL92kIR8goKjqVDLYX2XG
         CjqJqEWTtBpH4RECW1j2Kx3gO4OTYi3fhmCO2FoV9EmuoVzGRMpxkEiZoH/LybV80xRP
         7lmVEPAEXoRXzhBXXdM64Cq8odvcBpG5AFpCa9Xjs8YJeA2G1Bz3P+djgdUPUyQ7PL9D
         o2rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=sl5IM3JcF5e310W4L+gwHgv6Za1BAPYcoJRNKSOE8Wo=;
        b=bIcxf/ktzA4Y16DqsdsYIdVxS20098adAMUibgiNFfVOtC+6ZlcId/rI1iRbYfGCUK
         ug0T+AVl0uFyU9xnffilnBEvjphkNEqprr29gDwYpcxB9oZ6EBB+U0vWP1lnWoUz9DRT
         WnqQaKHBEMOjcgPSn6m+aUwYQ4Z65mdOU+rmrui+Mpl0x0WRNsdTauG5k34abtY4ULwX
         PN9jQ/nAQBKcD4XeU06mfiP6ho9BeyfZ491JnalmJ6yP5lEMSckCbEIcVSHD/o1gud9k
         1KWKM2BmSj4y/m6ipfgGmO4lkt1TXtDwcdR7rijugJ/a+AmoE86RkP2dNvPqnFcudEgO
         GEuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QwQH5v8I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r9si188635ilo.79.2021.04.21.10.42.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Apr 2021 10:42:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QwQH5v8I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lZGrl-0004Dx-3Y
	for alex.bennee@linaro.org; Wed, 21 Apr 2021 13:42:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lZGr0-00048c-2F
 for qemu-arm@nongnu.org; Wed, 21 Apr 2021 13:41:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lZGqv-0007SG-SL
 for qemu-arm@nongnu.org; Wed, 21 Apr 2021 13:41:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619026889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sl5IM3JcF5e310W4L+gwHgv6Za1BAPYcoJRNKSOE8Wo=;
 b=QwQH5v8I0MomayuQEAkWAq4J5PYOPUJg7HhVvhFFu8nywuIN7ae54djcGFsIP3zfV0KMCi
 pjfgBqenxAtH8a0xuKX+o8GwF4uwFOa/TB4oS3/XIa4ZqGFLIx9aLlYqqP3HXp/fmSgC8/
 K+PaiXqnFnHNh7cGdYp/8mOXl8VA9+s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-S-IMFNwqP2-xczbQ87yiPA-1; Wed, 21 Apr 2021 13:41:20 -0400
X-MC-Unique: S-IMFNwqP2-xczbQ87yiPA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C292687504F;
 Wed, 21 Apr 2021 17:41:19 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-115-49.ams2.redhat.com [10.36.115.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 00F1819D80;
 Wed, 21 Apr 2021 17:41:16 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, philmd@redhat.com, peter.maydell@linaro.org,
 crosa@redhat.com, wainersm@redhat.com
Subject: [PATCH v2 2/2] avocado_qemu: Add SMMUv3 tests
Date: Wed, 21 Apr 2021 19:40:58 +0200
Message-Id: <20210421174058.12201-3-eric.auger@redhat.com>
In-Reply-To: <20210421174058.12201-1-eric.auger@redhat.com>
References: <20210421174058.12201-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YSNS+dPHCy+r

Add new tests checking the good behavior of the SMMUv3 protecting
2 virtio pci devices (block and net). We check the guest boots and
we are able to install a package. Different guest configs are tested:
standard, passthrough an strict=0. This is tested with both fedora 31 and
33. The former uses a 5.3 kernel without range invalidation whereas the
latter uses a 5.8 kernel that features range invalidation.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v1 -> v2:
- removed ssh import
- combined add_command_args() and common_vm_setup()
- moved tags in class' docstring and added tags=arch:aarch64
- use self.get_default_kernel_params()
- added RIL tests with fed33 + introduce new tags
---
 tests/acceptance/smmu.py | 133 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 133 insertions(+)
 create mode 100644 tests/acceptance/smmu.py

diff --git a/tests/acceptance/smmu.py b/tests/acceptance/smmu.py
new file mode 100644
index 0000000000..bcb5416a56
--- /dev/null
+++ b/tests/acceptance/smmu.py
@@ -0,0 +1,133 @@
+# SMMUv3 Functional tests
+#
+# Copyright (c) 2021 Red Hat, Inc.
+#
+# Author:
+#  Eric Auger <eric.auger@redhat.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+import os
+
+from avocado_qemu import LinuxTest, BUILD_DIR
+
+class SMMU(LinuxTest):
+    """
+    :avocado: tags=accel:kvm
+    :avocado: tags=cpu:host
+    :avocado: tags=arch:aarch64
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
+    def common_vm_setup(self, custom_kernel=None):
+        self.require_accelerator("kvm")
+        self.vm.add_args("-machine", "virt")
+        self.vm.add_args("-accel", "kvm")
+        self.vm.add_args("-cpu", "host")
+        self.vm.add_args("-smp", "8")
+        self.vm.add_args("-m", "4096")
+        self.vm.add_args("-machine", "iommu=smmuv3")
+        self.vm.add_args("-d", "guest_errors")
+        self.vm.add_args('-bios', os.path.join(BUILD_DIR, 'pc-bios',
+                         'edk2-aarch64-code.fd'))
+        self.vm.add_args('-device', 'virtio-rng-pci,rng=rng0')
+        self.vm.add_args('-object',
+                         'rng-random,id=rng0,filename=/dev/urandom')
+
+        if custom_kernel is None:
+            return
+
+        kernel_url = self.get_pxeboot_url() + 'vmlinuz'
+        initrd_url = self.get_pxeboot_url() + 'initrd.img'
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
+        self.kernel_params = self.get_default_kernel_params() + ' iommu.passthrough=on'
+        self.run_and_check()
+
+    def test_smmu_noril_nostrict(self):
+        """
+        :avocado: tags=smmu_noril_nostrict
+        :avocado: tags=smmu_noril_tests
+        :avocado: tags=distro_version:31
+        """
+        self.common_vm_setup(True)
+        self.kernel_params = self.get_default_kernel_params() + ' iommu.strict=0'
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
+        self.kernel_params = self.get_default_kernel_params() + ' iommu.passthrough=on'
+        self.run_and_check()
+
+    def test_smmu_ril_nostrict(self):
+        """
+        :avocado: tags=smmu_ril_nostrict
+        :avocado: tags=smmu_ril_tests
+        :avocado: tags=distro_version:33
+        """
+        self.common_vm_setup(True)
+        self.kernel_params = self.get_default_kernel_params() + ' iommu.strict=0'
+        self.run_and_check()
-- 
2.26.3

