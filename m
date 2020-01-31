Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp870768lfp;
        Fri, 31 Jan 2020 09:02:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqzFgh4hRZ99Xt4KyXeQKUaDLlvZc2aAWlDSSahZhi+DFULcKdwv4wBR5PaN+JXYPfJzPbhX
X-Received: by 2002:a81:a7c3:: with SMTP id e186mr8804621ywh.7.1580490178874;
        Fri, 31 Jan 2020 09:02:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580490178; cv=none;
        d=google.com; s=arc-20160816;
        b=YjcqhzMmlKX0EkYA6/PAksWUT5jNzOeEsirie1i5rzWMSx6QftGcrN8JXw/eKPUDhc
         fuMeKNI4G3xT5cWaxwYqzRNAQ/sjv+Dcab9R6psgV2db6WbH+j9b+gSNSCouKZy5453a
         HmTvUasbFopMNlsNs2MECQpy2rntTPXmMHIL2rCiNwcrP7qyw54+G+/Cil7pnPd0fyFj
         bB9yudKndOermD6EizHuMHXLmI6wvnULzq2IwXJU40IX7Bw4hKddd5oE/E9iHGj9kvth
         s2vWq7Hfbaq9ZpxCQlgDpOvIaNCkbajRVr8Qz3lIqlTX9UdyW70Ifoduec4LZQwe1gnO
         1FRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=HvVjaR4hiIqrKejAHJ+Fb1dU6Wg4eHD3W0GTo8C4l7g=;
        b=gR6zOiUEh4Omz4WpiA5M1FBWnYjrPY9Xe14t7RwCY3lhzqiebuF5eLaN3PH1rVpvlV
         d2cSO+c+9c6MEx5xm9QtsSp+ESgsJYlqo9JbaMlYskpWEKBNjLyTSzQDG+I9vWG6a9qM
         CpZrOmuxHFSIm9hrs5PkXhmirQdOSvgKoka7hePtLahSR5LskzN5QktYJ2ZT2cRRx/Tg
         0V5OXJs4+yziRE1/2Ui6ns/BUqcgmqI4rP9EIhwqCVPVGZxG5WsXzESI5PTMshZboBkn
         xGR67C1XtUOoPIYjTkhu+40y9AdSGOMGH+wRmYG5ARfbqDCuaYudcpfCl9EMSmPiC4Sq
         6Dwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=c1XzagcW;
       spf=pass (google.com: domain of thuth@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id i20si5888905ybt.73.2020.01.31.09.02.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 Jan 2020 09:02:58 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=c1XzagcW;
       spf=pass (google.com: domain of thuth@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580490178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HvVjaR4hiIqrKejAHJ+Fb1dU6Wg4eHD3W0GTo8C4l7g=;
	b=c1XzagcWbcws2Um4vzk/fZrDw68t41QXu+FzOPPIYbyDVbloubdIvmHUyg7YWF3w6asYCD
	V8UtpfQNAuM04nzM8UBL12gyeyL1/ojcoT7/IXTTt383ZQFQsVbSqrMvDhALIpGQdpwWWj
	957ZC0LiXK56j/G1mWDCXQ2dAGBPv9o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-rtA98fGzNdyDkUqau5jtxQ-1; Fri, 31 Jan 2020 12:02:46 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9D83107ACC4;
	Fri, 31 Jan 2020 17:02:43 +0000 (UTC)
Received: from thuth.com (ovpn-116-176.ams2.redhat.com [10.36.116.176])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 041101036B47;
	Fri, 31 Jan 2020 17:02:36 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Subject: [PATCH] tests/acceptance: Add a test for the integratorcp arm machine
Date: Fri, 31 Jan 2020 18:02:33 +0100
Message-Id: <20200131170233.14584-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: rtA98fGzNdyDkUqau5jtxQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-TUID: n7AJ8dmjza31

There is a kernel and initrd available on github which we can use
for testing this machine.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS                                  |  1 +
 tests/acceptance/machine_arm_integratorcp.py | 43 ++++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 tests/acceptance/machine_arm_integratorcp.py

diff --git a/MAINTAINERS b/MAINTAINERS
index 6e4976d366..6a03835037 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -599,6 +599,7 @@ S: Maintained
 F: hw/arm/integratorcp.c
 F: hw/misc/arm_integrator_debug.c
 F: include/hw/misc/arm_integrator_debug.h
+F: tests/acceptance/machine_arm_integratorcp.py
=20
 MCIMX6UL EVK / i.MX6ul
 M: Peter Maydell <peter.maydell@linaro.org>
diff --git a/tests/acceptance/machine_arm_integratorcp.py b/tests/acceptanc=
e/machine_arm_integratorcp.py
new file mode 100644
index 0000000000..4f9ab40f2f
--- /dev/null
+++ b/tests/acceptance/machine_arm_integratorcp.py
@@ -0,0 +1,43 @@
+# Functional test that boots a Linux kernel and checks the console
+#
+# Copyright (c) 2020 Red Hat, Inc.
+#
+# Author:
+#  Thomas Huth <thuth@redhat.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+import os
+
+from avocado import skipUnless
+from avocado_qemu import Test
+from avocado_qemu import wait_for_console_pattern
+
+class IntegratorMachine(Test):
+    """Boots the Linux kernel and checks that the console is operational""=
"
+
+    timeout =3D 90
+
+    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code=
')
+    def test_integratorcp(self):
+        """
+        :avocado: tags=3Darch:arm
+        :avocado: tags=3Dmachine:integratorcp
+        """
+        kernel_url =3D ('https://github.com/zayac/qemu-arm/raw/master/'
+                      'arm-test/kernel/zImage.integrator')
+        kernel_hash =3D '0d7adba893c503267c946a3cbdc63b4b54f25468'
+        kernel_path =3D self.fetch_asset(kernel_url, asset_hash=3Dkernel_h=
ash)
+
+        initrd_url =3D ('https://github.com/zayac/qemu-arm/raw/master/'
+                      'arm-test/kernel/arm_root.img')
+        initrd_hash =3D 'b51e4154285bf784e017a37586428332d8c7bd8b'
+        initrd_path =3D self.fetch_asset(initrd_url, asset_hash=3Dinitrd_h=
ash)
+
+        self.vm.set_console()
+        self.vm.add_args('-kernel', kernel_path,
+                         '-initrd', initrd_path,
+                         '-append', 'printk.time=3D0 console=3DttyAMA0')
+        self.vm.launch()
+        wait_for_console_pattern(self, 'Log in as root')
--=20
2.18.1
