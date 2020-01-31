Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1218261lfp;
        Fri, 31 Jan 2020 15:25:46 -0800 (PST)
X-Google-Smtp-Source: APXvYqx1LdapiZZT/Ox+SS6QXHRJF2qatCr4AbJKKGUoVqSKCfyBAN1I3Hua7nUrJcBQ+V0EsogA
X-Received: by 2002:aed:2ce4:: with SMTP id g91mr13075790qtd.352.1580513145994;
        Fri, 31 Jan 2020 15:25:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580513145; cv=none;
        d=google.com; s=arc-20160816;
        b=jUhb03VNcxlbcsqr3XQTmDNyjyIzteTqmwpq4BtqOQuZrKVgCRgsiyEmsLtiXqJqex
         aKRi0VfeQg0cwh3oENI5akdDEY3C10Xt6HumWWKv/V+GrFgdXjpx31hYP3C6icacrW31
         k3EZ/yFIIstcCi77z5b7zyuiEIeZxn8VY+a3gIl9y8zt81SzCJAxYbkSz6RkOlevznRv
         3R8sMNKjqs77tsTIzjhEZhJTUhED6/Tj1tV1Odm5YyF2Y4yaewIou4Dw7zInwvtaWHxC
         CHowd0Vpd1xPhwgoHeSQmvQKKOdXQRpeuLHe+H7urNB0dge6uIZOm1anDX7WcXhdWlJl
         JlzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=2gbflfUyeA19Rw2A8qLe2xe1KunFoxdHM6rso3ysFgE=;
        b=L5TdegkfcAsdKVQbYCbL5OW8u8Mlola8YmnkIp7ZBfS/ExT9MVcJpnMmlmtKRw8lI7
         j9Izf7Z2fsGL8+1/qTSo+vgkQip7mkf+ARq01CrtrEJAO6h21S8gNHKQbjYETyCwqacR
         HN+pi3f92Zg9zlgJUVS7ieebmEAPb9xUhyhXWFYD+Wm3Hu6fEgIgN0Rx9q+SMJRjiAOt
         Qtjeg3zpFEZHVYsJI2k1UR9mqHCdtGY1X66zvr34PW2tFZR6XA3sxMVo+m2e/p8kuV9A
         8u93fxh1+zwptVm329wqBdIbZdMjnSn+hp6l7D1j6SHeTAAnTCIILMHys0szYGOelK01
         xokw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=u6cbzj+i;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w6si7042030qto.220.2020.01.31.15.25.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 Jan 2020 15:25:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=u6cbzj+i;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:60814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ixffV-00066G-Ei
	for alex.bennee@linaro.org; Fri, 31 Jan 2020 18:25:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48838)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ixfeV-0005C3-4H
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 18:24:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ixfeT-00007G-N9
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 18:24:43 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:53231)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ixfeT-00006B-Gs; Fri, 31 Jan 2020 18:24:41 -0500
Received: by mail-wm1-x342.google.com with SMTP id p9so9855216wmc.2;
 Fri, 31 Jan 2020 15:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2gbflfUyeA19Rw2A8qLe2xe1KunFoxdHM6rso3ysFgE=;
 b=u6cbzj+iAaa/5DuPo+BFUNLQtxornNecgLiQbuAKbCZdvCX61Mr7M9Qi87RJpQPp6g
 WOxJaztsynnQBjgvcFR73MrJ55s+94LwmdE3kHXCvAv2C+Ea0qPa3MZNqFFBMzuFpZPT
 utoU6tmtisLgS+J6NTQJ+9cxv8HVGou+cdT5DMY/TI6O1eH0POdxRfEo7UX6TwdoSJ5O
 +1GOgbbESj7xhhPX+8q+vxIR3SedDq2Vsxh9CJXK5SzXIRG92LCWiUPGIN/SmVLTwNSk
 6zH6drNBCNmlNxh7713vqyUoxAcII+Yr9tfepOrHNSyeY9AKzwFCQSyjBAKWkVl2g+mv
 pzvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2gbflfUyeA19Rw2A8qLe2xe1KunFoxdHM6rso3ysFgE=;
 b=NvKzCX20Tz7Guv7R57Bdbg2+9aWR9VE2Uzws1tevS8cTBvPz7WW0sKbNGRmsLFvB0Z
 rVOCHh3HbwTrYK8NVNtHMTUvZQjvbAGI9Bd14Fjea5P2fALXGkll54GG0VJMfId+Z5Li
 k00x1G7V2WhGIQuCqHZfHCratnnOVfJBxwy+8p9sSr+6G4A6Gw9G0vMd9tlX/ON7sP+D
 EwH7SeXSIwsaFrn2DfK8fpgXtrgt6B3Xu/M7NO3mJFVpoW64l2fp+r93O+wnO/yWKIsX
 bbnSB3u5TylMeBI7vgfR79SyLkgk8KMEqKtBI1op9BtUqCqEWfIvUXovM6h3q/U2XLN8
 lPMg==
X-Gm-Message-State: APjAAAWIhDzAbbVTdr8P0a+P7Ni32UjuLWrpy5ZT9aRvAzsC4APZGQhy
 IX2f8glPXCNV1w2mrxlQtfNV54oD
X-Received: by 2002:a1c:4e03:: with SMTP id g3mr14227885wmh.22.1580513080177; 
 Fri, 31 Jan 2020 15:24:40 -0800 (PST)
Received: from x1w.redhat.com (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id c74sm9265172wmd.26.2020.01.31.15.24.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2020 15:24:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] tests/acceptance: Count Raspberry Pi logos displayed on
 framebuffer
Date: Sat,  1 Feb 2020 00:24:36 +0100
Message-Id: <20200131232436.23548-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200131232436.23548-1-f4bug@amsat.org>
References: <20200131232436.23548-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /w9MFFwPDfrg

Add a test that verifies that each core properly displays the
Raspberry Pi logo on the framebuffer device.

We simply follow the OpenCV "Template Matching with Multiple Objects"
tutorial, replacing Lionel Messi by a raspberrry:
https://docs.opencv.org/4.2.0/d4/dc6/tutorial_py_template_matching.html

When OpenCV and NumPy are installed, this test can be run using:

  $ avocado --show=app,framebuffer run -t device:bcm2835-fb tests/acceptance/
  JOB ID     : 9bbbc54c0a6fa180348d0b5305507f76852b4da2
  JOB LOG    : avocado/job-results/job-2020-01-31T23.48-9bbbc54/job.log
   (1/1) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_raspi2_framebuffer_logo:
  framebuffer: found raspberry at position (x, y) = (0, 0)
  framebuffer: found raspberry at position (x, y) = (71, 0)
  framebuffer: found raspberry at position (x, y) = (142, 0)
  framebuffer: found raspberry at position (x, y) = (213, 0)
  PASS (11.06 s)
  RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
  JOB TIME   : 11.39 s

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
The resulting match can be visualised at https://pasteboard.co/ISzNHtx.png
---
 tests/acceptance/boot_linux_console.py | 62 ++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index e40b84651b..4e69a83a12 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -12,6 +12,7 @@ import os
 import lzma
 import gzip
 import shutil
+import logging
 
 from avocado import skipUnless
 from avocado_qemu import Test
@@ -21,6 +22,19 @@ from avocado.utils import process
 from avocado.utils import archive
 
 
+NUMPY_AVAILABLE = True
+try:
+    import numpy as np
+except ImportError:
+    NUMPY_AVAILABLE = False
+
+CV2_AVAILABLE = True
+try:
+    import cv2
+except ImportError:
+    CV2_AVAILABLE = False
+
+
 class BootLinuxConsole(Test):
     """
     Boots a Linux kernel and checks that the console is operational and the
@@ -360,6 +374,54 @@ class BootLinuxConsole(Test):
         """
         self.do_test_arm_raspi2(0)
 
+    @skipUnless(NUMPY_AVAILABLE, 'Python NumPy not installed')
+    @skipUnless(CV2_AVAILABLE, 'Python OpenCV not installed')
+    def test_arm_raspi2_framebuffer_logo(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=machine:raspi2
+        :avocado: tags=device:bcm2835-fb
+        """
+        screendump_path = os.path.join(self.workdir, 'screendump.pbm')
+        rpilogo_url = ('https://github.com/raspberrypi/linux/raw/'
+                       'raspberrypi-kernel_1.20190517-1/'
+                       'drivers/video/logo/logo_linux_clut224.ppm')
+        rpilogo_hash = 'fff3cc20c6030acce0953147f9baac43f44ed6b0'
+        rpilogo_path = self.fetch_asset(rpilogo_url, asset_hash=rpilogo_hash)
+        deb_url = ('http://archive.raspberrypi.org/debian/'
+                   'pool/main/r/raspberrypi-firmware/'
+                   'raspberrypi-kernel_1.20190215-1_armhf.deb')
+        deb_hash = 'cd284220b32128c5084037553db3c482426f3972'
+        deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
+        kernel_path = self.extract_from_deb(deb_path, '/boot/kernel7.img')
+        dtb_path = self.extract_from_deb(deb_path, '/boot/bcm2709-rpi-2-b.dtb')
+
+        self.vm.set_console()
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'earlycon=pl011,0x3f201000 console=ttyAMA0')
+        self.vm.add_args('-kernel', kernel_path,
+                         '-dtb', dtb_path,
+                         '-append', kernel_command_line)
+        self.vm.launch()
+        framebuffer_ready = 'Console: switching to colour frame buffer device'
+        wait_for_console_pattern(self, framebuffer_ready)
+        self.vm.command('human-monitor-command', command_line='stop')
+        self.vm.command('human-monitor-command',
+                        command_line='screendump %s' % screendump_path)
+        logger = logging.getLogger('framebuffer')
+
+        cpu_cores_count = 4
+        match_threshold = 0.95
+        screendump_bgr = cv2.imread(screendump_path, cv2.IMREAD_COLOR)
+        rpilogo_bgr = cv2.imread(rpilogo_path, cv2.IMREAD_COLOR)
+        result = cv2.matchTemplate(screendump_bgr, rpilogo_bgr,
+                                   cv2.TM_CCOEFF_NORMED)
+        loc = np.where(result >= match_threshold)
+        rpilogo_count = 0
+        for rpilogo_count, pt in enumerate(zip(*loc[::-1]), start=1):
+            logger.debug('found raspberry at position (x, y) = %s', pt)
+        self.assertGreaterEqual(rpilogo_count, cpu_cores_count)
+
     def test_arm_exynos4210_initrd(self):
         """
         :avocado: tags=arch:arm
-- 
2.21.1

