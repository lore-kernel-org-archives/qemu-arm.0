Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp327532lfp;
        Wed, 29 Jan 2020 01:04:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqzRqSyHL1/ACfTWI4TjkkvUkibqK1IFewdjhUoZflQzaF8PHU/WeESnqwoPoFqYHS11CRS2
X-Received: by 2002:a25:6e04:: with SMTP id j4mr20951175ybc.36.1580288677759;
        Wed, 29 Jan 2020 01:04:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580288677; cv=none;
        d=google.com; s=arc-20160816;
        b=qLMhCWHq4AidO7RlfEFb2lbAxQfuxDWUOdxUxxwDjxJUaQg7OQCX+N7vOEkibzJeZF
         wdM7F25v+iHr6pvDKz+Uyg5fJgAxYl5OSgkWCR2F2My41yNdA0pmXgD5k8DYvdFPur+B
         1nuVMF3ZHFoBlfLr+u7Iq6/Dh4ZI3C8H5upoSZLmlGIskJpzv7VOq94a4M58MRl0wObk
         e4sF3VwNm1DkonXD+OCd3mMMIBwYssPU2LplCGcR/qJBM30mHD5L5yNiEC6CY9Wdx99f
         tAsNpe6VJrNJRUQW27evtUuhSDGHhe7lTjP3VW0AhznKJbwkKH+eREsGORpY2rbr7Gkw
         Ajiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=5wyuV6xqCpsjKs9B9HCaRX/oVVS5cN7WdVgh2xGykQc=;
        b=QkBrd9q4/+c5MBHa27oLuikVd/5QaI1uWPW205DHGqMdxXzbQ9IL9s6PAe5efPwbRL
         4FVNSQ8huhdm8DR/WJxOpW+fOZQENxy3qkQMqrCadhdqoPmBT9AjlK22vGwBYB0daSuH
         N3zD+tFDCuAl1HbvMArf2gyhlIxNwrCuODC6YkZktq1GJYQtUNBNNreZgPTN5EJTYeN0
         t4MgHCZtCzXKcm26ZVvVkzBSFXx270jqKZuPNt+Je3AgAX3VNVftFEwwvCLxCha0bmJq
         t0sJ0DJ/BHISL4DWCJysDfL3h26rPlViRqx9cBt0DqTg1qEtWVigSRXAmZWgJwRRD6Vz
         zzCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="ZkBUO/Jm";
       spf=pass (google.com: domain of thuth@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id m136si951841ybf.47.2020.01.29.01.04.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Jan 2020 01:04:37 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 205.139.110.120 as permitted sender) client-ip=205.139.110.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="ZkBUO/Jm";
       spf=pass (google.com: domain of thuth@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580288677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5wyuV6xqCpsjKs9B9HCaRX/oVVS5cN7WdVgh2xGykQc=;
	b=ZkBUO/JmkISMh784XT1HwyLkWMoNefpiebU63ydKfWCtHKDA5nY2VlYHwtSvzvaq+iI0o5
	1B3DXeSyw67GRgU1Lxv1V8iVSvJQWjZclXo21+7tiHMZpO0nWADiDSvEArm/N5U4bqvoOL
	lUknwvdxoZoWMdKbymdmEN7bRj8xvt0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-l3GMa-xpNG6KiLKiqcC6xg-1; Wed, 29 Jan 2020 04:04:31 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BEE9107ACC5;
	Wed, 29 Jan 2020 09:04:30 +0000 (UTC)
Received: from thuth.com (ovpn-116-210.ams2.redhat.com [10.36.116.210])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9635560BE0;
	Wed, 29 Jan 2020 09:04:25 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Subject: [PATCH v2] tests/acceptance: Add a test for the canon-a1100 machine
Date: Wed, 29 Jan 2020 10:04:20 +0100
Message-Id: <20200129090420.13954-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: l3GMa-xpNG6KiLKiqcC6xg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: d5FQQfvHwZgE

The canon-a1100 machine can be used with the Barebox firmware. The
QEMU Advent Calendar 2018 features a pre-compiled image which we
can use for testing.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Tested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v2:
 - Rename file and add class docstring to please pylint
 - Add entry to MAINTAINERS
 - Add :avocado: tags=3Ddevice:pflash_cfi02

 MAINTAINERS                                |  1 +
 tests/acceptance/machine_arm_canona1100.py | 35 ++++++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 tests/acceptance/machine_arm_canona1100.py

diff --git a/MAINTAINERS b/MAINTAINERS
index efd3f3875f..ddf6fe0794 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -561,6 +561,7 @@ S: Odd Fixes
 F: include/hw/arm/digic.h
 F: hw/*/digic*
 F: include/hw/*/digic*
+F: tests/acceptance/machine_arm_canona1100.py
=20
 Gumstix
 M: Peter Maydell <peter.maydell@linaro.org>
diff --git a/tests/acceptance/machine_arm_canona1100.py b/tests/acceptance/=
machine_arm_canona1100.py
new file mode 100644
index 0000000000..0e5c43dbcf
--- /dev/null
+++ b/tests/acceptance/machine_arm_canona1100.py
@@ -0,0 +1,35 @@
+# Functional test that boots the canon-a1100 machine with firmware
+#
+# Copyright (c) 2020 Red Hat, Inc.
+#
+# Author:
+#  Thomas Huth <thuth@redhat.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+from avocado_qemu import Test
+from avocado_qemu import wait_for_console_pattern
+from avocado.utils import archive
+
+class CanonA1100Machine(Test):
+    """Boots the barebox firmware and checks that the console is operation=
al"""
+
+    timeout =3D 90
+
+    def test_arm_canona1100(self):
+        """
+        :avocado: tags=3Darch:arm
+        :avocado: tags=3Dmachine:canon-a1100
+        :avocado: tags=3Ddevice:pflash_cfi02
+        """
+        tar_url =3D ('https://www.qemu-advent-calendar.org'
+                   '/2018/download/day18.tar.xz')
+        tar_hash =3D '068b5fc4242b29381acee94713509f8a876e9db6'
+        file_path =3D self.fetch_asset(tar_url, asset_hash=3Dtar_hash)
+        archive.extract(file_path, self.workdir)
+        self.vm.set_console()
+        self.vm.add_args('-bios',
+                         self.workdir + '/day18/barebox.canon-a1100.bin')
+        self.vm.launch()
+        wait_for_console_pattern(self, 'running /env/bin/init')
--=20
2.18.1
