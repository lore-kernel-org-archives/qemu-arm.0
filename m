Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp559249lfp;
        Wed, 29 Jan 2020 05:20:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqyVRGLopmDlpM0BYd0WGdLsN0Hi/SXa2NxRxYNC7kTqdnPAO8CCOvXXwr3MhJ6a+cwI/0I0
X-Received: by 2002:aa7:d505:: with SMTP id y5mr8081700edq.370.1580304009903;
        Wed, 29 Jan 2020 05:20:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580304009; cv=none;
        d=google.com; s=arc-20160816;
        b=0cOGD0emML1jrEYaxZPxI/hYvZnBxctgo+CrzwNdGdSqD2DB2FnghLWtKre4hZ3kmp
         fVqnlnb7Am9ADB5qERi3ErdmE2v1VHJgG36fwtNrZNsl4yEskn+cpnwb4cOBjLowkPvZ
         USiLsgkxaq52uPdR4rnewmWwGRYqgxAmrMZNlKilUX3sV6H5zvu2cKOnRsNuTZzdXd8I
         ASjLunVQ9fmu1q32kq60475D5i79dNWIUQrZg8yYr6gVpZDjYFKK4D0kimtyaInP76YI
         rDtOEl8OOuKZofwdSMmbrzaIQhS14fJsx9mtbKhzJY4typaH+6Udy0YnVQL58/u9SzZj
         Pm1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=KmeI+7oXvqzalvY4bsXXeKKa/FeDHGMNqU98zZjgdbY=;
        b=VDtLlTJ0XTF1haqRS0d68oaoWkJ6Dm6WKdH1e9F5/EeueGechmcQ7ealuPqFYJDCn0
         mVHOoER/Ye+n7xU/LYEU8+xrI19QWQI4LKDO5qEPq4bnZbdFvh8ACcOeASJnYg9tnNO7
         CYBAsBxGBG4c7+Cm6VyoPko6RV4wAQeNqAPAy2FzGsss49BAYrKn3XQ8NbAK+JsQ5w60
         wSLuviNrZZDjU4tmNX1KcASRTnABgrUmNxPnRt7YK2oJzdjRQKftuqRUHqfFZ6Pfv3qH
         dP+JeOAoYp8Mwl6xE/I7K1dE8jen+aGUr/x0+JAAyJ3wRpQsXfLUh02GpCFg8vHwN5HR
         NfrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WTtSe+Zl;
       spf=pass (google.com: domain of thuth@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id g22si1010897edp.187.2020.01.29.05.20.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Jan 2020 05:20:09 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WTtSe+Zl;
       spf=pass (google.com: domain of thuth@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580304008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KmeI+7oXvqzalvY4bsXXeKKa/FeDHGMNqU98zZjgdbY=;
	b=WTtSe+ZlLvipCi2Avp7g//nMPLJnpyyAPkHVFRK1XO5QKC7/+H0iCeKThFn6RXCRcBenJZ
	oxypgn9+ivGX78W8kxqftp/hWugpTwjpBYiQ4n6Pl/wt1z1NtE1OrUThmF5MtHKR34lEll
	MbDryeInXlkU5Rc5S79tTBgUlW4txuA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-LD7z4yD7P4SWLyxDKyGWvQ-1; Wed, 29 Jan 2020 08:19:29 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26E9518C43C3;
	Wed, 29 Jan 2020 13:19:28 +0000 (UTC)
Received: from thuth.com (ovpn-116-210.ams2.redhat.com [10.36.116.210])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9184D5DA66;
	Wed, 29 Jan 2020 13:19:23 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Subject: [RFC PATCH] tests/acceptance: Add a test for the N800 and N810 arm machines
Date: Wed, 29 Jan 2020 14:19:20 +0100
Message-Id: <20200129131920.22302-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: LD7z4yD7P4SWLyxDKyGWvQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-TUID: 5dYCrtshEaUs

Old kernels from the Meego project can be used to check that Linux
is at least starting on these machines.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 The serial console is written to the second UART, so this needs Phil's
 "Allow to use other serial consoles than default" patch as a prerequisite:
 Based-on: <20200120235159.18510-5-f4bug@amsat.org>

 MAINTAINERS                          |  1 +
 tests/acceptance/machine_arm_n8x0.py | 49 ++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 tests/acceptance/machine_arm_n8x0.py

diff --git a/MAINTAINERS b/MAINTAINERS
index ddf6fe0794..560507e821 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -672,6 +672,7 @@ F: hw/rtc/twl92230.c
 F: include/hw/display/blizzard.h
 F: include/hw/input/tsc2xxx.h
 F: include/hw/misc/cbus.h
+F: tests/acceptance/machine_arm_n8x0.py
=20
 Palm
 M: Andrzej Zaborowski <balrogg@gmail.com>
diff --git a/tests/acceptance/machine_arm_n8x0.py b/tests/acceptance/machin=
e_arm_n8x0.py
new file mode 100644
index 0000000000..e5741f2d8d
--- /dev/null
+++ b/tests/acceptance/machine_arm_n8x0.py
@@ -0,0 +1,49 @@
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
+class N8x0Machine(Test):
+    """Boots the Linux kernel and checks that the console is operational""=
"
+
+    timeout =3D 90
+
+    def __do_test_n8x0(self):
+        kernel_url =3D ('http://stskeeps.subnetmask.net/meego-n8x0/'
+                      'meego-arm-n8x0-1.0.80.20100712.1431-'
+                      'vmlinuz-2.6.35~rc4-129.1-n8x0')
+        kernel_hash =3D 'e9d5ab8d7548923a0061b6fbf601465e479ed269'
+        kernel_path =3D self.fetch_asset(kernel_url, asset_hash=3Dkernel_h=
ash)
+
+        self.vm.set_console(console_index=3D1)
+        self.vm.add_args('-kernel', kernel_path,
+                         '-append', 'printk.time=3D0 console=3DttyS1')
+        self.vm.launch()
+        wait_for_console_pattern(self, 'TSC2005 driver initializing')
+
+    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code=
')
+    def test_n800(self):
+        """
+        :avocado: tags=3Darch:arm
+        :avocado: tags=3Dmachine:n800
+        """
+        self.__do_test_n8x0()
+
+    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code=
')
+    def test_n810(self):
+        """
+        :avocado: tags=3Darch:arm
+        :avocado: tags=3Dmachine:n810
+        """
+        self.__do_test_n8x0()
--=20
2.18.1
