Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1948946lfg;
        Tue, 25 Feb 2020 09:26:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqzZyWd0BPF0/adCoY1HRBTte7KSaoWaGnQkw9g7pmLS1DZTmQx7m/RoEiVdWL8qMxe1tVwi
X-Received: by 2002:ac8:7b45:: with SMTP id m5mr55936290qtu.360.1582651562361;
        Tue, 25 Feb 2020 09:26:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582651562; cv=none;
        d=google.com; s=arc-20160816;
        b=M+EEis6SQJ3ktI9L1lkegTX6gqe0L77Ari0hyWu7TqOIa/aNQMCy6yuFGI7lD+nh0J
         /kZfP8k7FbOlhvtcdjFSmmTTnCPZoG0lnXb6G/WVAFNhlKFmxYmvuWk5g+HJhJhVAB3P
         +gvvk+bMm08c2PXJWkIpnsHbZJWxGUrGwn+QH5fy6w8GRqp5l3H/UsbFI19gvW3cX69y
         g3uZnnqdSckRo3H4EhaFCTm2C6zGKtrJnnmxcZsYwlVUqOwdOa9afXEd/l8lTtlEhSPY
         V41VsBcMsS5mUuz+ELf1XTJAYkArn4x9NPnVkzgIyr6r7hcC+2ULTfVyDPH63AjD5ASk
         wfQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=+hErfkB//vQMpzpimdJ7xGrMEtGrqQVvI4PejSztOYg=;
        b=pHSeU8/zM39LmJT1AE+hL6Fo1JaL1i6v3locjU+vBz30HMD/JLvM6aeifHE4lk5Y8m
         lwotmH3YfYEuCVvWRHXg5jxB2Fa3gpmnvNZJVdIX4aHdsJPOIHh/qnHrI/j0iWe9e8TJ
         EgbKCzrUjbfoVYsEe6HxrLENe8eQ9tNTVcXRFaqntgdt1P8Bn6DYqAQtFJF/3dRSnnsl
         lu6+kFf3SyTcfvgv1YTR69r71DEo4uRL5ZgXTAsVJMRHJjuZMIhOCisDakNs8lBcdGV9
         Uq1kqn9kBfC6FGNrCVmuWjJfScLvt1D6MR4Z3URKiNqKzbeZ6aNJ+j6vI9S9ePpKD9n7
         3fQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HO64cMxw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d9si64605qki.342.2020.02.25.09.26.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2020 09:26:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HO64cMxw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:32808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6dy5-0001DU-Re
	for alex.bennee@linaro.org; Tue, 25 Feb 2020 12:26:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39061)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6dxQ-00018s-EW
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 12:25:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6dxO-00083b-Vo
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 12:25:20 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:58913
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6dxO-00083G-RM
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 12:25:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582651518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+hErfkB//vQMpzpimdJ7xGrMEtGrqQVvI4PejSztOYg=;
 b=HO64cMxwUfifCRy3ZEtwzg3SUqcoieb2lS5zqSy/5nxgFulBQ6JoZ5F+KiSobRFrv1JUDz
 bi1SjZtuCS0QZ1gFZ21PeJ4NFObi4tsBjf19IQtVllJMBjvdGDZWL6osswGpZ9V45nZRBP
 5KmBxutYGS5KRXE4YmSMUli3/eA85Vo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-ynHbEEpnML6TSU2G7SB0hQ-1; Tue, 25 Feb 2020 12:25:12 -0500
X-MC-Unique: ynHbEEpnML6TSU2G7SB0hQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C2C61005512;
 Tue, 25 Feb 2020 17:25:11 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-195.brq.redhat.com [10.40.205.195])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 13C0A60C88;
 Tue, 25 Feb 2020 17:25:05 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] tests/acceptance: Add a test for the N800 and N810 arm
 machines
Date: Tue, 25 Feb 2020 18:24:58 +0100
Message-Id: <20200225172501.29609-2-philmd@redhat.com>
In-Reply-To: <20200225172501.29609-1-philmd@redhat.com>
References: <20200225172501.29609-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Bf5dRapQh9ct

From: Thomas Huth <thuth@redhat.com>

Old kernels from the Meego project can be used to check that Linux
is at least starting on these machines.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-Id: <20200129131920.22302-1-thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 MAINTAINERS                          |  1 +
 tests/acceptance/machine_arm_n8x0.py | 49 ++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 tests/acceptance/machine_arm_n8x0.py

diff --git a/MAINTAINERS b/MAINTAINERS
index 36d94c17a6..83e5a83418 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -687,6 +687,7 @@ F: hw/rtc/twl92230.c
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
2.21.1

