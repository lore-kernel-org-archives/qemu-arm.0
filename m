Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp1910875njc;
        Mon, 24 Mar 2025 05:36:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWM+jyQypNH4DwFszC8Br9lx+nlNrLXjaIjD/S1CZph0CSA7GaTynO4JDxVP6k+s4QPYOGLUfdUNU1z/g==@linaro.org
X-Google-Smtp-Source: AGHT+IFMJYdhgSqA/x8UO11BC+IkncvLJk2eDlFiIwZkZGM+7UB0EyC4RNtQhiUl80pQ4MLvSh6n
X-Received: by 2002:a05:622a:4117:b0:476:8db0:8cc3 with SMTP id d75a77b69052e-4771dd61bd9mr167505581cf.10.1742819771072;
        Mon, 24 Mar 2025 05:36:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742819771; cv=none;
        d=google.com; s=arc-20240605;
        b=Pj+HcHpVhmUxVqiajwJBtPwBfrXEMqedyxVZvftH5cZH4Xbt6H9+icTxvdu2mTStQG
         mWCyW7fTxkWHO12w8pC+WNTqjaz18oDE0XYFjLZHQQBm0QjO87MMH0uNzIFqXJKdl3GS
         CkcNXy04wLGbaFxggAL7Sbgjsk8t/JZrLz1QqnV0/nRtIUSTBVKpSLG9IFpVh0/ZBP9x
         aoAO/ZUgat6PewZTSsLpjXaqxpViBY+RdGjpZ94Eu63N62pEYhgCLIxxNUxo7FNgyrum
         /SYwK7GyTWNJo0B7R1hllTEDJKSrYpLKyM0sHG5fb+/s0eevs2vYcfSQG3Xg0gELi3jg
         m/Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=86sdwo4b+yKpS/hBlDzZCZPiZvbM0whm3cQ/+71WLso=;
        fh=n7WEMLlAzAxlZ8r+nhwJNRuLqs/n1SOoTYf2DFAgh6M=;
        b=FmoIUpQmpzEJklFxw1IuJASlMWkLKb90dPfpv0Pt1jhBCJxUPhZGfxeLRUwUdV1+z8
         fL8Wc/x2z6TSOw8K7lxhZVhfmL9Xc01l78FS5Hdcwlp6hTSdHPDPJU3hgBG6KTLafvi6
         2+8jhldHr3nrloTWAVw3ZctyBvpA0O14XVtIQhlsfGjgFxX/VmT+TBZiUJsh/tNiTuQO
         ERGqDZLjdub1akEfNye3sLgFXZpF8i+lmlRftWriEKc0J5Sg9GCuxDBpDsQ4EAs94etd
         sc18BdPho1QRWdRtZhXDswDt8yeLj/T6ND38fp5sQV5zVAOSEXsipC59IWY6VJwDhNG/
         CtiA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="gRoU/K1t";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4771d1800f2si72403881cf.200.2025.03.24.05.36.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Mar 2025 05:36:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="gRoU/K1t";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1twh23-0004qY-NE; Mon, 24 Mar 2025 08:35:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1twh1L-0004bp-8D
 for qemu-arm@nongnu.org; Mon, 24 Mar 2025 08:35:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1twh1B-0000Zn-Bh
 for qemu-arm@nongnu.org; Mon, 24 Mar 2025 08:35:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742819698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=86sdwo4b+yKpS/hBlDzZCZPiZvbM0whm3cQ/+71WLso=;
 b=gRoU/K1ttbPtczzVIIEF6Aw6F00U/Fu/J+8ISHuvq4j+XvRq+2A6eeJ3Dhs4H7FdIYK9X3
 olyJkSi/7+yqNSjeOk1XoHsKQp9G9qYuTD1Xp6Id08Oqgje9vKbC7F4CCOVFSJiEmM9bMd
 P9jvSSYRhPfvtEciXsl84zLBm8ZazmA=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-230-CBwzbX-ePJmymylKE2d1IQ-1; Mon,
 24 Mar 2025 08:34:56 -0400
X-MC-Unique: CBwzbX-ePJmymylKE2d1IQ-1
X-Mimecast-MFC-AGG-ID: CBwzbX-ePJmymylKE2d1IQ_1742819695
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 32EE81800EC5; Mon, 24 Mar 2025 12:34:55 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.34.76])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 34FA31956095; Mon, 24 Mar 2025 12:34:51 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 "Daniel P . Berrange" <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] tests/functional: Add missing require_netdev('user')
 statements
Date: Mon, 24 Mar 2025 13:34:50 +0100
Message-ID: <20250324123450.111307-1-thuth@redhat.com>
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
 RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: UN4EbQUi+xT5

From: Thomas Huth <thuth@redhat.com>

A bunch of tests are using "-netdev user" but fail to check
for the availability of SLIRP in the binary, so these tests
fail if QEMU has been configured with "--disable-slirp"
(most of the tests are disabled by default with a decorator,
that's likely why nobody noticed this problem yet). Add the
missing self.require_netdev('user') statements to skip the
tests if SLIRP is not available.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/functional/test_aarch64_rme_sbsaref.py | 1 +
 tests/functional/test_aarch64_rme_virt.py    | 4 +++-
 tests/functional/test_arm_bpim2u.py          | 2 ++
 tests/functional/test_arm_cubieboard.py      | 2 ++
 tests/functional/test_arm_orangepi.py        | 4 ++++
 tests/functional/test_ppc64_hv.py            | 3 +++
 tests/functional/test_x86_64_kvm_xen.py      | 1 +
 7 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/tests/functional/test_aarch64_rme_sbsaref.py b/tests/functional/test_aarch64_rme_sbsaref.py
index ddcc9493a6c..0f4f6103a1e 100755
--- a/tests/functional/test_aarch64_rme_sbsaref.py
+++ b/tests/functional/test_aarch64_rme_sbsaref.py
@@ -33,6 +33,7 @@ class Aarch64RMESbsaRefMachine(QemuSystemTest):
     def test_aarch64_rme_sbsaref(self):
         self.set_machine('sbsa-ref')
         self.require_accelerator('tcg')
+        self.require_netdev('user')
 
         self.vm.set_console()
 
diff --git a/tests/functional/test_aarch64_rme_virt.py b/tests/functional/test_aarch64_rme_virt.py
index 38e01721a4e..f4ad4d33d58 100755
--- a/tests/functional/test_aarch64_rme_virt.py
+++ b/tests/functional/test_aarch64_rme_virt.py
@@ -60,8 +60,10 @@ class Aarch64RMEVirtMachine(QemuSystemTest):
     # and launching a nested VM using it.
     def test_aarch64_rme_virt(self):
         self.set_machine('virt')
-        self.vm.set_console()
         self.require_accelerator('tcg')
+        self.require_netdev('user')
+
+        self.vm.set_console()
 
         stack_path_tar_gz = self.ASSET_RME_STACK_VIRT.fetch()
         self.archive_extract(stack_path_tar_gz, format="tar")
diff --git a/tests/functional/test_arm_bpim2u.py b/tests/functional/test_arm_bpim2u.py
index 12cd3597460..8de6ccba881 100755
--- a/tests/functional/test_arm_bpim2u.py
+++ b/tests/functional/test_arm_bpim2u.py
@@ -140,6 +140,8 @@ def test_arm_bpim2u_gmac(self):
     @skipBigDataTest()
     def test_arm_bpim2u_openwrt_22_03_3(self):
         self.set_machine('bpim2u')
+        self.require_netdev('user')
+
         # This test download a 8.9 MiB compressed image and expand it
         # to 127 MiB.
         image_path = self.uncompress(self.ASSET_SD_IMAGE)
diff --git a/tests/functional/test_arm_cubieboard.py b/tests/functional/test_arm_cubieboard.py
index 423db710e82..b87a28154da 100755
--- a/tests/functional/test_arm_cubieboard.py
+++ b/tests/functional/test_arm_cubieboard.py
@@ -107,6 +107,8 @@ def test_arm_cubieboard_openwrt_22_03_2(self):
         # This test download a 7.5 MiB compressed image and expand it
         # to 126 MiB.
         self.set_machine('cubieboard')
+        self.require_netdev('user')
+
         image_path = self.uncompress(self.ASSET_OPENWRT)
         image_pow2ceil_expand(image_path)
 
diff --git a/tests/functional/test_arm_orangepi.py b/tests/functional/test_arm_orangepi.py
index 28919391e5d..1815f56e027 100755
--- a/tests/functional/test_arm_orangepi.py
+++ b/tests/functional/test_arm_orangepi.py
@@ -147,6 +147,8 @@ def test_arm_orangepi_sd(self):
     @skipBigDataTest()
     def test_arm_orangepi_armbian(self):
         self.set_machine('orangepi-pc')
+        self.require_netdev('user')
+
         # This test download a 275 MiB compressed image and expand it
         # to 1036 MiB, but the underlying filesystem is 1552 MiB...
         # As we expand it to 2 GiB we are safe.
@@ -181,6 +183,8 @@ def test_arm_orangepi_armbian(self):
     @skipBigDataTest()
     def test_arm_orangepi_uboot_netbsd9(self):
         self.set_machine('orangepi-pc')
+        self.require_netdev('user')
+
         # This test download a 304MB compressed image and expand it to 2GB
         # We use the common OrangePi PC 'plus' build of U-Boot for our secondary
         # program loader (SPL). We will then set the path to the more specific
diff --git a/tests/functional/test_ppc64_hv.py b/tests/functional/test_ppc64_hv.py
index 62f996adf6d..1920e91f18b 100755
--- a/tests/functional/test_ppc64_hv.py
+++ b/tests/functional/test_ppc64_hv.py
@@ -125,6 +125,7 @@ def do_test_kvm(self, hpt=False):
 
     def test_hv_pseries(self):
         self.require_accelerator("tcg")
+        self.require_netdev('user')
         self.set_machine('pseries')
         self.vm.add_args("-accel", "tcg,thread=multi")
         self.vm.add_args('-device', 'nvme,serial=1234,drive=drive0')
@@ -136,6 +137,7 @@ def test_hv_pseries(self):
 
     def test_hv_pseries_kvm(self):
         self.require_accelerator("kvm")
+        self.require_netdev('user')
         self.set_machine('pseries')
         self.vm.add_args("-accel", "kvm")
         self.vm.add_args('-device', 'nvme,serial=1234,drive=drive0')
@@ -147,6 +149,7 @@ def test_hv_pseries_kvm(self):
 
     def test_hv_powernv(self):
         self.require_accelerator("tcg")
+        self.require_netdev('user')
         self.set_machine('powernv')
         self.vm.add_args("-accel", "tcg,thread=multi")
         self.vm.add_args('-device', 'nvme,bus=pcie.2,addr=0x0,serial=1234,drive=drive0',
diff --git a/tests/functional/test_x86_64_kvm_xen.py b/tests/functional/test_x86_64_kvm_xen.py
index 3bedef6c98c..c6abf6bba3b 100755
--- a/tests/functional/test_x86_64_kvm_xen.py
+++ b/tests/functional/test_x86_64_kvm_xen.py
@@ -41,6 +41,7 @@ class KVMXenGuest(QemuSystemTest):
     def common_vm_setup(self):
         # We also catch lack of KVM_XEN support if we fail to launch
         self.require_accelerator("kvm")
+        self.require_netdev('user')
 
         self.vm.set_console()
 
-- 
2.49.0

