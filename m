Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1948900lfg;
        Tue, 25 Feb 2020 09:25:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqx2dZTHN0OIfe9vdYcDZec4dieX+39i7tBmN50a7coteN4DW/Wy0Z5Y5VmUEk9LxK5DbqiY
X-Received: by 2002:a37:9d4f:: with SMTP id g76mr16078140qke.169.1582651559537;
        Tue, 25 Feb 2020 09:25:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582651559; cv=none;
        d=google.com; s=arc-20160816;
        b=x3yKodWurOmtzy3KHSR4I8O/xc+BzYg4yLJ2CCNVd3+0QyEZNFcy8ObQLWlhJepboi
         Ea0Rjx5oMSUQaKD1tdklHCXSRwcDAubYNFuoDGksaUuqtD4i7MTlDILZTnLGdJI9Ig2g
         1J3DIcvYVKkIRym5JkpE7pqS9Sq4+2qKkp7YQG73JYP3GQHb+2OHykcei9DsF9LrZyA9
         ugXbXtE0uuqtoEY41W+7O9n06sdaQ7VfCk8bYnrqVeC4Pws84v3rxivbXr/dGKwTpRw3
         hh9eEySI6TA0T14DrrpdR7Z5x4pIZZfIv8Cq5YRlL+YhvQM0JUyfB15EiqnOnn2E0CoH
         RAmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=E0sDdYdU2Zg83hGZi3GeRkZRcAWYITv/cxF0BtQAkBg=;
        b=NMy9xbtZqp54iUFqj7lObNtdPBw9JpnlgZblGubDNkI8B2YPXI300sO2/iMQWImT6P
         /CmgXVw46Jc6ozTpXlkDm4Gxrbrq9mlmCKoDnANWQcWQ7GCxMSsRfd8JgGQxTNPYu05D
         iztz4ZtfR/so8wsnnNjC8Y9ITPO9XzsE0BwMkdCD5Oz4uYN5FY+Of44FSeM4PcEp/nHJ
         aARQLKD5kL27tVZwjavLqLIZ+e4K0+mexYnFDCuGSSN8jZMkfwjxkhSffDqet2gc9HQH
         PDm28Yl1ps3kK9dEZdjBmibZJzZx2GEGmO4OBJK9HCwnE8DThyLBKS5Ggqw9zSfRM8dt
         1X6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=D6ojraKz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n11si7759169qtv.5.2020.02.25.09.25.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2020 09:25:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=D6ojraKz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:32830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6dy2-0001lh-Sv
	for alex.bennee@linaro.org; Tue, 25 Feb 2020 12:25:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39585)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6dxe-0001fx-TC
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 12:25:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6dxd-0008Mv-Ad
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 12:25:34 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:52166
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6dxd-0008MD-76
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 12:25:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582651532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E0sDdYdU2Zg83hGZi3GeRkZRcAWYITv/cxF0BtQAkBg=;
 b=D6ojraKzaw6dJ42KY5CVj9pfObhbwnapBL/4bwlL7JtTl894usj0sa8Zovc08Po2os3iQk
 lSyaRJd3XGLtH0sbwy6+yFzaB9hDr7inm9wmkU8/0cxCCmUQ5TgzTAPhawQRWgFeS0WSU6
 +TQ+y/1GI4mK+fug/TqzIB6+D0xwBl8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70--UjjEoXJO0aaisDBY_C-vA-1; Tue, 25 Feb 2020 12:25:23 -0500
X-MC-Unique: -UjjEoXJO0aaisDBY_C-vA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0F5E800D5B;
 Tue, 25 Feb 2020 17:25:22 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-195.brq.redhat.com [10.40.205.195])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B23FF61069;
 Tue, 25 Feb 2020 17:25:18 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] tests/acceptance/integratorcp: Verify Tux is displayed on
 framebuffer
Date: Tue, 25 Feb 2020 18:25:01 +0100
Message-Id: <20200225172501.29609-5-philmd@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Andrzej Zaborowski <balrogg@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ckUHdcGvAubZ

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Add a test that verifies the Tux logo is displayed on the framebuffer.

We simply follow the OpenCV "Template Matching with Multiple Objects"
tutorial, replacing Lionel Messi by Tux:
https://docs.opencv.org/4.2.0/d4/dc6/tutorial_py_template_matching.html

When OpenCV and NumPy are installed, this test can be run using:

  $ AVOCADO_ALLOW_UNTRUSTED_CODE=3Dhmmm \
    avocado --show=3Dapp,framebuffer run -t device:framebuffer \
      tests/acceptance/machine_arm_integratorcp.py
  JOB ID     : 8c46b0f8269242e87d738247883ea2a470df949e
  JOB LOG    : avocado/job-results/job-2020-01-31T21.38-8c46b0f/job.log
   (1/1) tests/acceptance/machine_arm_integratorcp.py:IntegratorMachine.tes=
t_framebuffer_tux_logo:
  framebuffer: found Tux at position [x, y] =3D (0, 0)
  PASS (3.96 s)
  RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | =
CANCEL 0
  JOB TIME   : 4.23 s

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20200131211102.29612-3-f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 tests/acceptance/machine_arm_integratorcp.py | 52 ++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/tests/acceptance/machine_arm_integratorcp.py b/tests/acceptanc=
e/machine_arm_integratorcp.py
index 22afd3b82a..49c8ebff78 100644
--- a/tests/acceptance/machine_arm_integratorcp.py
+++ b/tests/acceptance/machine_arm_integratorcp.py
@@ -9,11 +9,26 @@
 # later.  See the COPYING file in the top-level directory.
=20
 import os
+import logging
=20
 from avocado import skipUnless
 from avocado_qemu import Test
 from avocado_qemu import wait_for_console_pattern
=20
+
+NUMPY_AVAILABLE =3D True
+try:
+    import numpy as np
+except ImportError:
+    NUMPY_AVAILABLE =3D False
+
+CV2_AVAILABLE =3D True
+try:
+    import cv2
+except ImportError:
+    CV2_AVAILABLE =3D False
+
+
 class IntegratorMachine(Test):
=20
     timeout =3D 90
@@ -45,3 +60,40 @@ def test_integratorcp_console(self):
         """
         self.boot_integratorcp()
         wait_for_console_pattern(self, 'Log in as root')
+
+    @skipUnless(NUMPY_AVAILABLE, 'Python NumPy not installed')
+    @skipUnless(CV2_AVAILABLE, 'Python OpenCV not installed')
+    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code=
')
+    def test_framebuffer_tux_logo(self):
+        """
+        Boot Linux and verify the Tux logo is displayed on the framebuffer=
.
+        :avocado: tags=3Darch:arm
+        :avocado: tags=3Dmachine:integratorcp
+        :avocado: tags=3Ddevice:pl110
+        :avocado: tags=3Ddevice:framebuffer
+        """
+        screendump_path =3D os.path.join(self.workdir, "screendump.pbm")
+        tuxlogo_url =3D ('https://github.com/torvalds/linux/raw/v2.6.12/'
+                       'drivers/video/logo/logo_linux_vga16.ppm')
+        tuxlogo_hash =3D '3991c2ddbd1ddaecda7601f8aafbcf5b02dc86af'
+        tuxlogo_path =3D self.fetch_asset(tuxlogo_url, asset_hash=3Dtuxlog=
o_hash)
+
+        self.boot_integratorcp()
+        framebuffer_ready =3D 'Console: switching to colour frame buffer d=
evice'
+        wait_for_console_pattern(self, framebuffer_ready)
+        self.vm.command('human-monitor-command', command_line=3D'stop')
+        self.vm.command('human-monitor-command',
+                        command_line=3D'screendump %s' % screendump_path)
+        logger =3D logging.getLogger('framebuffer')
+
+        cpu_count =3D 1
+        match_threshold =3D 0.92
+        screendump_bgr =3D cv2.imread(screendump_path)
+        screendump_gray =3D cv2.cvtColor(screendump_bgr, cv2.COLOR_BGR2GRA=
Y)
+        result =3D cv2.matchTemplate(screendump_gray, cv2.imread(tuxlogo_p=
ath, 0),
+                                   cv2.TM_CCOEFF_NORMED)
+        loc =3D np.where(result >=3D match_threshold)
+        tux_count =3D 0
+        for tux_count, pt in enumerate(zip(*loc[::-1]), start=3D1):
+            logger.debug('found Tux at position [x, y] =3D %s', pt)
+        self.assertGreaterEqual(tux_count, cpu_count)
--=20
2.21.1

