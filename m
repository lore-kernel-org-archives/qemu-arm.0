Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp475044njb;
        Fri, 26 Jul 2024 06:45:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV9A5xT9kTFkLd5+2m1aQuTfiKUlWRfWUlgtfooSldn5SKPfSh6Tawe6Wbj3VbZuqyyTncwiUUZMBdjjnnXWO7nwjtaI9RF
X-Google-Smtp-Source: AGHT+IEdMMTzkdpIv027o734vZjSKacoHz53W7tJ2gKgXRAvIx6J2WT3x3F+YrOn0Ng26l9Rm+MC
X-Received: by 2002:a05:6102:2c8c:b0:48f:e7c2:1faf with SMTP id ada2fe7eead31-493d6542f2emr8503970137.28.1722001526594;
        Fri, 26 Jul 2024 06:45:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722001526; cv=none;
        d=google.com; s=arc-20160816;
        b=Ie35Zp5MUXOVLIVjBV5OapugUzEQ4WpvWqgOqYK9+rkd4FrA3+hJG6ouuhEtOcdBkq
         b/RQ9Vc+A3bwY+4VklDhSOVJwVSo5WfiKeYl3RxVn5wzTNpMwyN7iNEO9Ndi9ubnaOh/
         GwyKjLFtlSnx+QTh3oEZhXCFZydrPGX8YD17RuSWkMdj0q6UoFwYxA1bxDzW6ZfRe8ip
         XAIJ8SoOZQHZVBwkxjShxTdX9sbpGgThWEc+mLcCTNp1g+RR9XtWpkP013o9rbkp572h
         Vo7iFIvn+ao3M3yB59H/8mHOw0XxDahA3xnoTMrQsf3grjUQPVw9XVUSyrnXxKmW6Lp9
         slzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=iANeBO6ReZ4SXr/ZZKfmq7nYRFwkGFSuGPP72ITezII=;
        fh=+JUQlqeb+WOWoY8tr4tplfLgDiP2lWYvcRFLGxWHojE=;
        b=BUtL1wJyxyocsZTB1PvGVMz0MEV9q2grVFw/27BKHKP+sw1nEzn1/kP+mwrCJPPuu3
         t+DdglBpXjhMBnaTVPHQaxqu5ICjihxHcL3GWw50I1FQgCxZ63xN64nkIi0ffZO8aJxv
         kW68uFYqTmtt5LVGg4pz/rJaXwReTTuLsM3XZ183V/+oJoPiWWXJT3KnXnj6BtnK+Ktc
         nLx/NpS0PgOmxJEgVd7+2tGm2FH9fG17lwQlvQ6AQLzWce0mnEsV5Oj3UdxcqYsa02bJ
         /rBjR10IfSSwGTUTuO5wnuICVp/PUmVfVjteaS6AhC5SIJoqdGCMPY4FwDOPg9p3CEGH
         dR5A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=itpWQ+rU;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-831b2eea833si676179241.192.2024.07.26.06.45.26
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 06:45:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=itpWQ+rU;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722001526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iANeBO6ReZ4SXr/ZZKfmq7nYRFwkGFSuGPP72ITezII=;
	b=itpWQ+rUFNh53xa0WaPG1peuvnrvEOK7JwvCwbi4FkDceo1B+jjYYFwsJJOlLkazZgZ9aO
	PyM/wsoLApelStWRUHyzUzgw1pmV86HJ1CSlz/V8oLonhkXjGQvZW/FALRaffcqyvyCRng
	zkEU7H8V3Ny4jJHoydVar2ryXxWnB60=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-336-YaN_GngSPvyKyKgwQTcq-w-1; Fri,
 26 Jul 2024 09:45:23 -0400
X-MC-Unique: YaN_GngSPvyKyKgwQTcq-w-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CEAF81955BFA;
	Fri, 26 Jul 2024 13:45:20 +0000 (UTC)
Received: from p1.localdomain.com (unknown [10.22.17.77])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D164F1955D45;
	Fri, 26 Jul 2024 13:45:16 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	David Woodhouse <dwmw2@infradead.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	qemu-arm@nongnu.org,
	Radoslaw Biernacki <rad@semihalf.com>,
	Cleber Rosa <crosa@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 07/13] tests/avocado/kvm_xen_guest.py: cope with asset RW requirements
Date: Fri, 26 Jul 2024 09:44:32 -0400
Message-ID: <20240726134438.14720-8-crosa@redhat.com>
In-Reply-To: <20240726134438.14720-1-crosa@redhat.com>
References: <20240726134438.14720-1-crosa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: aF3d/Xr4Lf2t

Some of these tests actually require the root filesystem image,
obtained through Avocado's asset feature and kept in a common cache
location, to be writable.

This makes a distinction between the tests that actually have this
requirement and those who don't.  The goal is to be as safe as
possible, avoiding causing cache misses (because the assets get
modified and thus need to be dowloaded again) while avoid copying the
root filesystem backing file whenever possible.

This also allow these tests to be run in parallel with newer Avocado
versions.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/avocado/kvm_xen_guest.py | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/tests/avocado/kvm_xen_guest.py b/tests/avocado/kvm_xen_guest.py
index 318fadebc3..d73fa888ef 100644
--- a/tests/avocado/kvm_xen_guest.py
+++ b/tests/avocado/kvm_xen_guest.py
@@ -10,6 +10,7 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 
 import os
+import shutil
 
 from qemu.machine import machine
 
@@ -43,7 +44,7 @@ def get_asset(self, name, sha1):
         return self.fetch_asset(name=f"qemu-kvm-xen-guest-{name}",
                                 locations=(url), asset_hash=sha1)
 
-    def common_vm_setup(self):
+    def common_vm_setup(self, readwrite=False):
         # We also catch lack of KVM_XEN support if we fail to launch
         self.require_accelerator("kvm")
 
@@ -56,11 +57,19 @@ def common_vm_setup(self):
                                           "367962983d0d32109998a70b45dcee4672d0b045")
         self.rootfs = self.get_asset("rootfs.ext4",
                                      "f1478401ea4b3fa2ea196396be44315bab2bb5e4")
+        if readwrite:
+            dest = os.path.join(self.workdir, os.path.basename(self.rootfs))
+            shutil.copy(self.rootfs, dest)
+            self.rootfs = dest
 
-    def run_and_check(self):
+    def run_and_check(self, readwrite=False):
+        if readwrite:
+            drive = f"file={self.rootfs},if=none,format=raw,id=drv0"
+        else:
+            drive = f"file={self.rootfs},if=none,readonly=on,format=raw,id=drv0"
         self.vm.add_args('-kernel', self.kernel_path,
                          '-append', self.kernel_params,
-                         '-drive',  f"file={self.rootfs},if=none,snapshot=on,format=raw,id=drv0",
+                         '-drive',  drive,
                          '-device', 'xen-disk,drive=drv0,vdev=xvda',
                          '-device', 'virtio-net-pci,netdev=unet',
                          '-netdev', 'user,id=unet,hostfwd=:127.0.0.1:0-:22')
@@ -90,11 +99,11 @@ def test_kvm_xen_guest(self):
         :avocado: tags=kvm_xen_guest
         """
 
-        self.common_vm_setup()
+        self.common_vm_setup(True)
 
         self.kernel_params = (self.KERNEL_DEFAULT +
                               ' xen_emul_unplug=ide-disks')
-        self.run_and_check()
+        self.run_and_check(True)
         self.ssh_command('grep xen-pirq.*msi /proc/interrupts')
 
     def test_kvm_xen_guest_nomsi(self):
@@ -102,11 +111,11 @@ def test_kvm_xen_guest_nomsi(self):
         :avocado: tags=kvm_xen_guest_nomsi
         """
 
-        self.common_vm_setup()
+        self.common_vm_setup(True)
 
         self.kernel_params = (self.KERNEL_DEFAULT +
                               ' xen_emul_unplug=ide-disks pci=nomsi')
-        self.run_and_check()
+        self.run_and_check(True)
         self.ssh_command('grep xen-pirq.* /proc/interrupts')
 
     def test_kvm_xen_guest_noapic_nomsi(self):
@@ -114,11 +123,11 @@ def test_kvm_xen_guest_noapic_nomsi(self):
         :avocado: tags=kvm_xen_guest_noapic_nomsi
         """
 
-        self.common_vm_setup()
+        self.common_vm_setup(True)
 
         self.kernel_params = (self.KERNEL_DEFAULT +
                               ' xen_emul_unplug=ide-disks noapic pci=nomsi')
-        self.run_and_check()
+        self.run_and_check(True)
         self.ssh_command('grep xen-pirq /proc/interrupts')
 
     def test_kvm_xen_guest_vapic(self):
-- 
2.45.2
