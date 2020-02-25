Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1948484lfg;
        Tue, 25 Feb 2020 09:25:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqx29xAHU6mSDqUXI+Af0C41IS+infECyXsbmcdjMZAVGCljB17q9rlJso1PEvKHltIH6h+4
X-Received: by 2002:a37:d15:: with SMTP id 21mr3913061qkn.485.1582651533387;
        Tue, 25 Feb 2020 09:25:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582651533; cv=none;
        d=google.com; s=arc-20160816;
        b=cRwtFf0Otc2GPK/hSEd8LBa49/nIe7K/oauMx8pr3aZL/fr0swGWsk/6//lqhr2mYo
         m7qGG5PYtUSRo9XY5quRgTG06ThqMzsNuYOAKPqbaN94tlj3tTsFrwkXA68myEAPFe4Y
         tnaVhoq2DGmOJmzOTIh3kz+REZquC65FIyHiNjJ1cNmG8KXqf0vY22lGofe1iY0P4Jws
         qKI2LpiFVTIWYeqmkgkYRO0dT3bpkJYKYypvHPIOwPfT1E6ohYgfTH7an/PxxwRJjobB
         FZ7gG/UFKh3C0RH8lUV6OzDGIBVcACrL+CrkGw958ya4Atwgt6qbs1D+xN0UUCOYvdU8
         Hp4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=E1x/lOM4B825jaBbL2cKvPbjosT9AxJPSDhGOuqBy+g=;
        b=nuuYsOO7/p/8UNYx4X4qfQqPtAmLDOWwsIbwKmPO34rJRXFrxR83E5Zol/A0w7fCTT
         lumT27U3LqS5UwKel85JMWwN15p6vRZcqn1jNVrCi3n1mK2XjMb8vif1QX5vs2PSuEIw
         kUSDR7kvJ9CCwjfrGaIuoTFy0bOZ9tyUfcYNY7403085Du360dlsqRtXcy2bg3QBTbVZ
         iD5gIHBblwkrMjGc6bHecV76iVDZqdrTXKkJi7YM+B+8p93HzYfn95XF0wNNcQp1lVys
         6/Q6G5QVNxVPJldbmHY2B/7LKXROcKVbclAeXXsfzfDBLXu/lLU1wJ/KA2bdZB1aB+p5
         Xkiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RXuMpNw4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v38si7403634qtj.318.2020.02.25.09.25.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2020 09:25:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RXuMpNw4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:32814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6dxc-0001Jf-PR
	for alex.bennee@linaro.org; Tue, 25 Feb 2020 12:25:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39079)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6dxR-0001AJ-9X
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 12:25:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6dxP-00084N-Le
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 12:25:21 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:24135
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6dxP-00083q-HN
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 12:25:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582651519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E1x/lOM4B825jaBbL2cKvPbjosT9AxJPSDhGOuqBy+g=;
 b=RXuMpNw4Mk7k8PLZUG5k1EfKHqtVLkrXh0ZdLzyyhenDUgoLnC68pwuNqvyRiHhJEiV2LL
 aUD4mF+b5agXLZ9bx8HS4J63tNgK48IR1OXMpmWWUA0RvnDi5YGlu60+WnhGHK1sBBnCAG
 0yfrNT8GbEbBzODwhsuS1NsY2PnCI5U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-ASFY5XKzN7icXZUlLjJVGQ-1; Tue, 25 Feb 2020 12:25:15 -0500
X-MC-Unique: ASFY5XKzN7icXZUlLjJVGQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A57FB8017CC;
 Tue, 25 Feb 2020 17:25:14 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-195.brq.redhat.com [10.40.205.195])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8ADA860FC4;
 Tue, 25 Feb 2020 17:25:11 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] tests/acceptance: Add a test for the integratorcp arm
 machine
Date: Tue, 25 Feb 2020 18:24:59 +0100
Message-Id: <20200225172501.29609-3-philmd@redhat.com>
In-Reply-To: <20200225172501.29609-1-philmd@redhat.com>
References: <20200225172501.29609-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1UiLlhoylDF4

From: Thomas Huth <thuth@redhat.com>

There is a kernel and initrd available on github which we can use
for testing this machine.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20200131170233.14584-1-thuth@redhat.com>
[PMD: Renamed test method, moved description from class to method]
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 MAINTAINERS                                  |  1 +
 tests/acceptance/machine_arm_integratorcp.py | 43 ++++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 tests/acceptance/machine_arm_integratorcp.py

diff --git a/MAINTAINERS b/MAINTAINERS
index 83e5a83418..06ceb57cba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -614,6 +614,7 @@ S: Maintained
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
index 0000000000..d928ed79b4
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
+
+    timeout =3D 90
+
+    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code=
')
+    def test_integratorcp_console(self):
+        """
+        Boots the Linux kernel and checks that the console is operational
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
2.21.1

