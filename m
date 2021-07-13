Received: by 2002:a0c:fe44:0:0:0:0:0 with SMTP id u4csp1026890qvs;
        Tue, 13 Jul 2021 14:20:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyH8xi9yBMzHNYC2w1i5+x8ivJ44gjUxH+fOBW4sBbrlTRLZIIUNtfGCthKGDt+jhjorsx1
X-Received: by 2002:aa7:ca05:: with SMTP id y5mr8517935eds.353.1626211245289;
        Tue, 13 Jul 2021 14:20:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626211245; cv=none;
        d=google.com; s=arc-20160816;
        b=npc+0PEdfKUwAXdIslXmr3RNV/qaJrplzCsQrV12PfzkzWJqTsDQiB7Z0fJW2SgLb7
         PnGM0xyxtZFkUNuQHtzxnoaQSA+w2PdAKI2jNdjNN2CLHYTpPwuhCTn7MAz44l8FIg+V
         yTr65389G4nT2Wuj2jV2AjaO5hdXLI3nimPxyuOpsAJiXiLWFdgLOFs/DwLbhF93Amfv
         SkqF6IAcDz4h/NRsBxdB/qlBwaEQ5HNOFvvMUyQZvXpZ57J960B7iK+H7hTGf4kD9eIy
         97POv4JtrgdmfSHcfKVGyxT25kM07JCgt5bHGACkxfidjfvcz+5Ww8TsKh2RHkFyQx9S
         7LbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=7I/gsK3Fum/jvHVEyzJdD3/PNj9ftt2gW1TCv6cq5vU=;
        b=ttqmntzDNOImwQYSZDJKZq8tO8l1aM37GHJV14RaiQ+fI2McgFh+GtZW9RNDaiZqSv
         W3WB75TcCvxn/90plRWbabcNW46fX/isp2oCqip9ICvRM40L0SZ3DvA19ubpHKYDiErM
         KZRSDRvKF4G9gnBX8Pod//abO3UwhpQnvm463PHo3OL+oENqpIHojCPUD8fim4FIgVl3
         YSsP9KxeK/EiqEXhYOQrFeIEl+vRhTzVqVc4twSLNqftEoBbdQxdXo6fPb5FY79mFh/J
         DjZYpKAkjQTsegFHIQAWmtXn0V/rAsZhfudOVHF15OL1J9SlEbno48RoghvpofCG99N0
         qXXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=blBoumVk;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id i10si896999edr.278.2021.07.13.14.20.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Jul 2021 14:20:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=blBoumVk;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626211244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7I/gsK3Fum/jvHVEyzJdD3/PNj9ftt2gW1TCv6cq5vU=;
	b=blBoumVkHk2qVAn45DOX9n9U+J6t3ubwJjqzcTj1fml4jP/1j6o2zBpoz8Hodyh2tx+w2z
	X96+Kke6dJQVLbb5QNNW9+L/LRxk4eJLl92EPwNKAnxKNY3vAhYxUChZO5kSmkzpJUtYV5
	upBd91Fm2IZUkZ1O0RsocM9OuINpboA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-3wywiKNXMBu_9ZqYd_LMPA-1; Tue, 13 Jul 2021 17:20:41 -0400
X-MC-Unique: 3wywiKNXMBu_9ZqYd_LMPA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 469D01007273;
	Tue, 13 Jul 2021 21:20:39 +0000 (UTC)
Received: from p50.localhost.net (ovpn-117-22.rdu2.redhat.com [10.10.117.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE5ED19C44;
	Tue, 13 Jul 2021 21:20:36 +0000 (UTC)
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
Subject: [PULL 06/23] Acceptance Tests: support choosing specific distro and version
Date: Tue, 13 Jul 2021 17:19:06 -0400
Message-Id: <20210713211923.3809241-7-crosa@redhat.com>
In-Reply-To: <20210713211923.3809241-1-crosa@redhat.com>
References: <20210713211923.3809241-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 3INlONh9o5JW

The tests based on the LinuxTest class give the test writer a ready to
use guest operating system, currently pinned to Fedora 31.

With this change, it's now possible to choose different distros and
versions, similar to how other tags and parameter can be set for the
target arch, accelerator, etc.

One of the reasons for this work, is that some development features
depend on updates on the guest side.  For instance the tests on
virtiofs_submounts.py, require newer kernels, and may benefit from
running, say on Fedora 34, without the need for a custom kernel.

Please notice that the pre-caching of the Fedora 31 images done during
the early stages of `make check-acceptance` (before the tests are
actually executed) are not expanded here to cover every new image
added.  But, the tests will download other needed images (and cache
them) during the first execution.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Message-Id: <20210414221457.1653745-4-crosa@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 docs/devel/testing.rst                    | 65 +++++++++++++++++++++++
 tests/acceptance/avocado_qemu/__init__.py | 47 ++++++++++++----
 2 files changed, 102 insertions(+), 10 deletions(-)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 4e42392810..19cbf532ae 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -922,6 +922,39 @@ The preserved value of the ``qemu_bin`` parameter or the result of the
 dynamic probe for a QEMU binary in the current working directory or
 source tree.
 
+LinuxTest
+~~~~~~~~~
+
+Besides the attributes present on the ``avocado_qemu.Test`` base
+class, the ``avocado_qemu.LinuxTest`` adds the following attributes:
+
+distro
+......
+
+The name of the Linux distribution used as the guest image for the
+test.  The name should match the **Provider** column on the list
+of images supported by the avocado.utils.vmimage library:
+
+https://avocado-framework.readthedocs.io/en/latest/guides/writer/libs/vmimage.html#supported-images
+
+distro_version
+..............
+
+The version of the Linux distribution as the guest image for the
+test.  The name should match the **Version** column on the list
+of images supported by the avocado.utils.vmimage library:
+
+https://avocado-framework.readthedocs.io/en/latest/guides/writer/libs/vmimage.html#supported-images
+
+distro_checksum
+...............
+
+The sha256 hash of the guest image file used for the test.
+
+If this value is not set in the code or by a test parameter (with the
+same name), no validation on the integrity of the image will be
+performed.
+
 Parameter reference
 -------------------
 
@@ -962,6 +995,38 @@ qemu_bin
 
 The exact QEMU binary to be used on QEMUMachine.
 
+LinuxTest
+~~~~~~~~~
+
+Besides the parameters present on the ``avocado_qemu.Test`` base
+class, the ``avocado_qemu.LinuxTest`` adds the following parameters:
+
+distro
+......
+
+The name of the Linux distribution used as the guest image for the
+test.  The name should match the **Provider** column on the list
+of images supported by the avocado.utils.vmimage library:
+
+https://avocado-framework.readthedocs.io/en/latest/guides/writer/libs/vmimage.html#supported-images
+
+distro_version
+..............
+
+The version of the Linux distribution as the guest image for the
+test.  The name should match the **Version** column on the list
+of images supported by the avocado.utils.vmimage library:
+
+https://avocado-framework.readthedocs.io/en/latest/guides/writer/libs/vmimage.html#supported-images
+
+distro_checksum
+...............
+
+The sha256 hash of the guest image file used for the test.
+
+If this value is not set in the code or by this parameter no
+validation on the integrity of the image will be performed.
+
 Skipping tests
 --------------
 The Avocado framework provides Python decorators which allow for easily skip
diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 3a144cded4..1f1728ab83 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -345,8 +345,39 @@ class LinuxTest(Test, LinuxSSHMixIn):
     username = 'root'
     password = 'password'
 
+    def _set_distro(self):
+        distro = self.params.get(
+            'distro',
+            default=self._get_unique_tag_val('distro'))
+        if not distro:
+            distro = 'fedora'
+        self.distro = distro
+
+        distro_version = self.params.get(
+            'distro_version',
+            default=self._get_unique_tag_val('distro_version'))
+        if not distro_version:
+            distro_version = '31'
+        self.distro_version = distro_version
+
+        # The distro checksum behaves differently than distro name and
+        # version. First, it does not respect a tag with the same
+        # name, given that it's not expected to be used for filtering
+        # (distro name versions are the natural choice).  Second, the
+        # order of precedence is: parameter, attribute and then value
+        # from KNOWN_DISTROS.
+        distro_checksum = self.params.get('distro_checksum',
+                                          default=self.distro_checksum)
+        if not distro_checksum:
+            distro_checksum = get_known_distro_checksum(self.distro,
+                                                        self.distro_version,
+                                                        self.arch)
+        if distro_checksum:
+            self.distro_checksum = distro_checksum
+
     def setUp(self, ssh_pubkey=None, network_device_type='virtio-net'):
         super(LinuxTest, self).setUp()
+        self._set_distro()
         self.vm.add_args('-smp', '2')
         self.vm.add_args('-m', '1024')
         # The following network device allows for SSH connections
@@ -382,20 +413,16 @@ def download_boot(self):
         vmimage.QEMU_IMG = qemu_img
 
         self.log.info('Downloading/preparing boot image')
-        distro = 'fedora'
-        distro_version = '31'
-        known_distro_checksum = get_known_distro_checksum(distro,
-                                                          distro_version,
-                                                          self.arch)
-        distro_checksum = self.distro_checksum or known_distro_checksum
         # Fedora 31 only provides ppc64le images
         image_arch = self.arch
-        if image_arch == 'ppc64':
-            image_arch = 'ppc64le'
+        if self.distro == 'fedora':
+            if image_arch == 'ppc64':
+                image_arch = 'ppc64le'
+
         try:
             boot = vmimage.get(
-                distro, arch=image_arch, version=distro_version,
-                checksum=distro_checksum,
+                self.distro, arch=image_arch, version=self.distro_version,
+                checksum=self.distro_checksum,
                 algorithm='sha256',
                 cache_dir=self.cache_dirs[0],
                 snapshot_dir=self.workdir)
-- 
2.31.1
