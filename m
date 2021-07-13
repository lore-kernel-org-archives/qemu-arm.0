Received: by 2002:a0c:fe44:0:0:0:0:0 with SMTP id u4csp1026862qvs;
        Tue, 13 Jul 2021 14:20:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtOXyX6qqzgJPmmNJD5RklHbf2U6rL0LyLKQv9HfgZ4dOErvWjlYYuXH1QL5gFc0FRWrEp
X-Received: by 2002:aa7:da13:: with SMTP id r19mr7702674eds.252.1626211242338;
        Tue, 13 Jul 2021 14:20:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626211242; cv=none;
        d=google.com; s=arc-20160816;
        b=ZPR0zduPls369gSOgMjMhz65I/4gqy9yXebRK4LmPxdBf6fYAEOdRDdRCP4Mg3/LCz
         jeZeqoBT5xTwiCEEvQCho14xwWzhV9bpU1yQDVQ3rrX8YHorlbRLCrvvYWYnrvwiu0+F
         QRwOm1szSG7f8q9DftKfecfvZyaxLfW56KP3DUo9qR2OihmimnWR4G/+g8ZZqtbbTDGb
         YO+6lDvkBhzuj9p9wPR1dLexajpnPJ7o6/f3VgiCVAvf8DQlcUSiDlD/KlO4VzcuxLL2
         nxuz5Y1HEmQwCCcEqrnJ/iAqDjpiyR+9O/PKkUA0jO8xrhnrujaGYZRm/VwxYHj/LEcu
         xCPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=THmLqQsKEXOZbRKhS9beyVzcLcgkjletg78pbbNWyqE=;
        b=xdAaY9b5OimGjT151sxEPbbAPVzCYQzgKVxznRAtL1yYyXB3VN/vFSdOLNlgT9cper
         kEsczA9zCNburij5cZx9QqO/LhXTMJ/rfvuwpXZ/gGWff6eKZH0eWaO6m0WzK1cpxKu9
         HD2Adli4X6NSuHS+jF3aCnKhrJyISfhsAtMkthGYFG2eoF6x9+Jpw5ecOQdo+zEKounl
         VebnvYSc/nHWQZqnddRjEzVkfYpme5FLE4x6Ig0JD1kwhyU6SczcZfn7KrW/TBHU9Y/Y
         ulBTFosT27AXkyx7Ov1ZqMZT1ED8ZPhNr+uxvA0CL710O3UCwhXHgs15aTdOE/Z9/bM0
         0s3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="I/d7rox9";
       spf=pass (google.com: domain of crosa@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id x16si4615361edd.147.2021.07.13.14.20.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Jul 2021 14:20:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="I/d7rox9";
       spf=pass (google.com: domain of crosa@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626211241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=THmLqQsKEXOZbRKhS9beyVzcLcgkjletg78pbbNWyqE=;
	b=I/d7rox9QWGCfd1IA33t2hex23EywHHc6lhpkh5r7J6SUo9psykh/mMXcsaTTldGlhwLmo
	wmeQB9cRPo7NDGbl+PEaPscL9zhhQj8omiFwPsRJLjUZj95eLtV2+pF97l1/lx8lb32rN3
	UhzWz+o4mnaKN4AOW05Za7fiF8ifugY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-oqOCcSalMbupp5Khgj-0Ew-1; Tue, 13 Jul 2021 17:20:39 -0400
X-MC-Unique: oqOCcSalMbupp5Khgj-0Ew-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF1211084F54;
	Tue, 13 Jul 2021 21:20:36 +0000 (UTC)
Received: from p50.localhost.net (ovpn-117-22.rdu2.redhat.com [10.10.117.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7218A19C44;
	Tue, 13 Jul 2021 21:20:34 +0000 (UTC)
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
Subject: [PULL 05/23] Acceptance Tests: move definition of distro checksums to the framework
Date: Tue, 13 Jul 2021 17:19:05 -0400
Message-Id: <20210713211923.3809241-6-crosa@redhat.com>
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
X-TUID: 5yptSbF9p1G5

Instead of having, by default, the checksum in the tests, and the
definition of tests in the framework, let's keep them together.

A central definition for distributions is available, and it should
allow other known distros to be added more easily.

No behavior change is expected here, and tests can still define
a distro_checksum value if for some reason they want to override
the known distribution information.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Message-Id: <20210414221457.1653745-3-crosa@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Eric Auger <eric.auger@redhat.com>
[CR: split long lines]
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/avocado_qemu/__init__.py | 39 +++++++++++++++++++++--
 tests/acceptance/boot_linux.py            | 12 -------
 2 files changed, 37 insertions(+), 14 deletions(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 0e62c15c60..3a144cded4 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -304,6 +304,35 @@ def ssh_command(self, command):
         return stdout_lines, stderr_lines
 
 
+#: A collection of known distros and their respective image checksum
+KNOWN_DISTROS = {
+    'fedora': {
+        '31': {
+            'x86_64':
+            {'checksum': ('e3c1b309d9203604922d6e255c2c5d09'
+                          '8a309c2d46215d8fc026954f3c5c27a0')},
+            'aarch64':
+            {'checksum': ('1e18d9c0cf734940c4b5d5ec592facae'
+                          'd2af0ad0329383d5639c997fdf16fe49')},
+            'ppc64':
+            {'checksum': ('7c3528b85a3df4b2306e892199a9e1e4'
+                          '3f991c506f2cc390dc4efa2026ad2f58')},
+            's390x':
+            {'checksum': ('4caaab5a434fd4d1079149a072fdc789'
+                          '1e354f834d355069ca982fdcaf5a122d')},
+            }
+        }
+    }
+
+
+def get_known_distro_checksum(distro, distro_version, arch):
+    try:
+        return KNOWN_DISTROS.get(distro).get(distro_version).\
+            get(arch).get('checksum')
+    except AttributeError:
+        return None
+
+
 class LinuxTest(Test, LinuxSSHMixIn):
     """Facilitates having a cloud-image Linux based available.
 
@@ -353,14 +382,20 @@ def download_boot(self):
         vmimage.QEMU_IMG = qemu_img
 
         self.log.info('Downloading/preparing boot image')
+        distro = 'fedora'
+        distro_version = '31'
+        known_distro_checksum = get_known_distro_checksum(distro,
+                                                          distro_version,
+                                                          self.arch)
+        distro_checksum = self.distro_checksum or known_distro_checksum
         # Fedora 31 only provides ppc64le images
         image_arch = self.arch
         if image_arch == 'ppc64':
             image_arch = 'ppc64le'
         try:
             boot = vmimage.get(
-                'fedora', arch=image_arch, version='31',
-                checksum=self.distro_checksum,
+                distro, arch=image_arch, version=distro_version,
+                checksum=distro_checksum,
                 algorithm='sha256',
                 cache_dir=self.cache_dirs[0],
                 snapshot_dir=self.workdir)
diff --git a/tests/acceptance/boot_linux.py b/tests/acceptance/boot_linux.py
index 3901c23690..34c4366366 100644
--- a/tests/acceptance/boot_linux.py
+++ b/tests/acceptance/boot_linux.py
@@ -20,9 +20,6 @@ class BootLinuxX8664(LinuxTest):
     :avocado: tags=arch:x86_64
     """
 
-    distro_checksum = ('e3c1b309d9203604922d6e255c2c5d09'
-                       '8a309c2d46215d8fc026954f3c5c27a0')
-
     def test_pc_i440fx_tcg(self):
         """
         :avocado: tags=machine:pc
@@ -67,9 +64,6 @@ class BootLinuxAarch64(LinuxTest):
     :avocado: tags=machine:gic-version=2
     """
 
-    distro_checksum = ('1e18d9c0cf734940c4b5d5ec592facae'
-                       'd2af0ad0329383d5639c997fdf16fe49')
-
     def add_common_args(self):
         self.vm.add_args('-bios',
                          os.path.join(BUILD_DIR, 'pc-bios',
@@ -121,9 +115,6 @@ class BootLinuxPPC64(LinuxTest):
     :avocado: tags=arch:ppc64
     """
 
-    distro_checksum = ('7c3528b85a3df4b2306e892199a9e1e4'
-                       '3f991c506f2cc390dc4efa2026ad2f58')
-
     def test_pseries_tcg(self):
         """
         :avocado: tags=machine:pseries
@@ -139,9 +130,6 @@ class BootLinuxS390X(LinuxTest):
     :avocado: tags=arch:s390x
     """
 
-    distro_checksum = ('4caaab5a434fd4d1079149a072fdc789'
-                       '1e354f834d355069ca982fdcaf5a122d')
-
     @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
     def test_s390_ccw_virtio_tcg(self):
         """
-- 
2.31.1
