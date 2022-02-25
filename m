Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp2063236lfq;
        Fri, 25 Feb 2022 13:03:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwgyby4iCSigXLH1dOoXb/dprSH3792fMuwWR0KZE2t9o2x2c6cazJjHKljv0afB0TYfiUl
X-Received: by 2002:a05:6214:1c84:b0:432:6dd5:ba71 with SMTP id ib4-20020a0562141c8400b004326dd5ba71mr7544548qvb.109.1645822995344;
        Fri, 25 Feb 2022 13:03:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645822995; cv=none;
        d=google.com; s=arc-20160816;
        b=usgeRPsTTPxRxHio0niLMUVQ/4od6lHGDNbWUOfHaSOROH8Nlcr35USpj2wkqr/bj4
         RArabxGUvmlQYZ3Qyk1th9BOc7dggopr9dlO48iFV+jiVG4LYz1+kpcKzBWPVCmWkuDl
         exlNk0eSLz0bLX8MT98AjmM9CijmPHIVcc85EgHa8FGpXRqo6H1fvdfQ4XFzpX9iAQFT
         iBkcnYtV721z63mnlbe4njuHPXhHDc7pKXcp3PYCEw9WL+AVlTvlHel0s9jqrZx0wLN9
         4wphvtS7OrQTt7VO/owXTZeKVt9NgKl/XP6LW+UCZPP/vEJyVmawkU6vNHzEK+qoaKjn
         Jc/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=0aodK9aG97P8KUU55S4+p+lKKbpYAdCciia2KsOdnVc=;
        b=VdUUwTlQhLatyxrAOtIlzVU8besGoIdkOP+xrP8/hXBkXW04EUw5Z/pkaD+5oUnplE
         nbCGqxONYL5+KySyc/6CDlWqpZRQd1NToVlc5MHZi2pR+p/qxGS+0AcVQHc6FM4jyc9W
         OetUuZDgTjxh+E9uDyFvi2RJt0WKwIbdSukM6wYTS/pbPzVHdbIXeaEilXfvrhvBjZh2
         HfHDkbczOynhMgSOoyjRx6cuOwmxkP5BTUvKEZoSQ2RXyQOgvtV19QXU2MybA6u/q4bL
         KYmcUHYeDKWlFZmc9ugY8efkonRsE90UJaur0rN7oC35+GRhcyw31S5dIk02HELDDQ0V
         ATyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Dd+kWfWm;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id v20-20020ac85794000000b002de4f61abd1si2056596qta.212.2022.02.25.13.03.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Feb 2022 13:03:15 -0800 (PST)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Dd+kWfWm;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645822994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0aodK9aG97P8KUU55S4+p+lKKbpYAdCciia2KsOdnVc=;
	b=Dd+kWfWmXUvgEpY4g7ZcXRSNUaqg5zEJ1c+9K44OAn6TmHO2aSh14L48mGduiNeFfwTVVz
	s34DqlVK9mULTszveBnsqvlxzIZWJlEbv6awzJCqwvobXOrk2rjLXXUFjGg9V5iQoDekRh
	NUE4F91DNwzPuWXc/B6K/eJCo99NIIQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-147-LepH11EMN1aZlYQQYS4jqw-1; Fri, 25 Feb 2022 16:03:11 -0500
X-MC-Unique: LepH11EMN1aZlYQQYS4jqw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3AB1D1006AA5;
	Fri, 25 Feb 2022 21:03:08 +0000 (UTC)
Received: from p50.localhost.localdomain.com (unknown [10.22.16.50])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D0D12ED84;
	Fri, 25 Feb 2022 21:03:05 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-ppc@nongnu.org,
	Fabien Chouteau <chouteau@adacore.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Cleber Rosa <crosa@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org,
	Eric Auger <eric.auger@redhat.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Greg Kurz <groug@kaod.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	David Gibson <david@gibson.dropbear.id.au>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Beraldo Leal <bleal@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	qemu-s390x@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Eric Farman <farman@linux.ibm.com>
Subject: [PATCH 2/9] Avocado tests: use logging namespace that is preserved in test logs
Date: Fri, 25 Feb 2022 16:01:49 -0500
Message-Id: <20220225210156.2032055-3-crosa@redhat.com>
In-Reply-To: <20220225210156.2032055-1-crosa@redhat.com>
References: <20220225210156.2032055-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
X-TUID: Kc4Qp2F/g5Mj

Since Avocado 92.0[1], there's no universal preservation of logged
content via Python's "logging" APIs into the test log files.  This
changes were motivated by the fact that doing so is intrusive as it
touches on Python's root logger.

Test writers are now expected to use "avocado." as a namespace prefix
for everything that Avocado should collect/preserve, and other
prefixes for logged content that should be handled differently.

[1] - https://avocado-framework.readthedocs.io/en/94.0/releases/92_0.html#users-test-writers

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/avocado/avocado_qemu/__init__.py    | 5 ++---
 tests/avocado/linux_initrd.py             | 3 +--
 tests/avocado/machine_arm_integratorcp.py | 3 +--
 tests/avocado/machine_mips_malta.py       | 3 +--
 tests/avocado/replay_kernel.py            | 5 ++---
 tests/avocado/replay_linux.py             | 5 ++---
 tests/avocado/reverse_debugging.py        | 5 ++---
 tests/avocado/tesseract_utils.py          | 6 +++---
 tests/avocado/virtio_check_params.py      | 3 +--
 9 files changed, 15 insertions(+), 23 deletions(-)

diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index 75063c0c30..88cec83e5c 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -8,7 +8,6 @@
 # This work is licensed under the terms of the GNU GPL, version 2 or
 # later.  See the COPYING file in the top-level directory.
 
-import logging
 import os
 import shutil
 import subprocess
@@ -138,7 +137,7 @@ def _console_interaction(test, success_message, failure_message,
     if vm is None:
         vm = test.vm
     console = vm.console_socket.makefile(mode='rb', encoding='utf-8')
-    console_logger = logging.getLogger('console')
+    console_logger = test.log.getChild('console')
     while True:
         if send_string:
             vm.console_socket.sendall(send_string.encode())
@@ -370,7 +369,7 @@ class LinuxSSHMixIn:
     """Contains utility methods for interacting with a guest via SSH."""
 
     def ssh_connect(self, username, credential, credential_is_key=True):
-        self.ssh_logger = logging.getLogger('ssh')
+        self.ssh_logger = self.log.getChild('ssh')
         res = self.vm.command('human-monitor-command',
                               command_line='info usernet')
         port = get_info_usernet_hostfwd_port(res)
diff --git a/tests/avocado/linux_initrd.py b/tests/avocado/linux_initrd.py
index ba02e5a563..6ebf299cd4 100644
--- a/tests/avocado/linux_initrd.py
+++ b/tests/avocado/linux_initrd.py
@@ -9,7 +9,6 @@
 # later.  See the COPYING file in the top-level directory.
 
 import os
-import logging
 import tempfile
 
 from avocado_qemu import QemuSystemTest
@@ -79,7 +78,7 @@ def test_with_2gib_file_should_work_with_linux_v4_16(self):
                              '-m', '5120')
             self.vm.launch()
             console = self.vm.console_socket.makefile()
-            console_logger = logging.getLogger('console')
+            console_logger = self.log.getChild('console')
             while True:
                 msg = console.readline()
                 console_logger.debug(msg.strip())
diff --git a/tests/avocado/machine_arm_integratorcp.py b/tests/avocado/machine_arm_integratorcp.py
index 1ffe1073ef..697ee76f6c 100644
--- a/tests/avocado/machine_arm_integratorcp.py
+++ b/tests/avocado/machine_arm_integratorcp.py
@@ -9,7 +9,6 @@
 # later.  See the COPYING file in the top-level directory.
 
 import os
-import logging
 
 from avocado import skipUnless
 from avocado_qemu import QemuSystemTest
@@ -84,7 +83,7 @@ def test_framebuffer_tux_logo(self):
         self.vm.command('human-monitor-command', command_line='stop')
         self.vm.command('human-monitor-command',
                         command_line='screendump %s' % screendump_path)
-        logger = logging.getLogger('framebuffer')
+        logger = self.log.getChild('framebuffer')
 
         cpu_count = 1
         match_threshold = 0.92
diff --git a/tests/avocado/machine_mips_malta.py b/tests/avocado/machine_mips_malta.py
index f1895d59f3..5f98ba1620 100644
--- a/tests/avocado/machine_mips_malta.py
+++ b/tests/avocado/machine_mips_malta.py
@@ -9,7 +9,6 @@
 
 import os
 import gzip
-import logging
 
 from avocado import skipUnless
 from avocado_qemu import QemuSystemTest
@@ -72,7 +71,7 @@ def do_test_i6400_framebuffer_logo(self, cpu_cores_count):
         self.vm.command('human-monitor-command', command_line='stop')
         self.vm.command('human-monitor-command',
                         command_line='screendump %s' % screendump_path)
-        logger = logging.getLogger('framebuffer')
+        logger = self.log.getChild('framebuffer')
 
         match_threshold = 0.95
         screendump_bgr = cv2.imread(screendump_path, cv2.IMREAD_COLOR)
diff --git a/tests/avocado/replay_kernel.py b/tests/avocado/replay_kernel.py
index c68a953730..40f52b3913 100644
--- a/tests/avocado/replay_kernel.py
+++ b/tests/avocado/replay_kernel.py
@@ -11,7 +11,6 @@
 import os
 import lzma
 import shutil
-import logging
 import time
 
 from avocado import skip
@@ -36,7 +35,7 @@ class ReplayKernelBase(LinuxKernelTest):
 
     def run_vm(self, kernel_path, kernel_command_line, console_pattern,
                record, shift, args, replay_path):
-        logger = logging.getLogger('replay')
+        logger = self.log.getChild('replay')
         start_time = time.time()
         vm = self.get_vm()
         vm.set_console()
@@ -74,7 +73,7 @@ def run_rr(self, kernel_path, kernel_command_line, console_pattern,
                          True, shift, args, replay_path)
         t2 = self.run_vm(kernel_path, kernel_command_line, console_pattern,
                          False, shift, args, replay_path)
-        logger = logging.getLogger('replay')
+        logger = self.log.getChild('replay')
         logger.info('replay overhead {:.2%}'.format(t2 / t1 - 1))
 
 class ReplayKernelNormal(ReplayKernelBase):
diff --git a/tests/avocado/replay_linux.py b/tests/avocado/replay_linux.py
index 15953f9e49..b56eeccfdd 100644
--- a/tests/avocado/replay_linux.py
+++ b/tests/avocado/replay_linux.py
@@ -9,7 +9,6 @@
 # later.  See the COPYING file in the top-level directory.
 
 import os
-import logging
 import time
 
 from avocado import skipUnless
@@ -55,7 +54,7 @@ def launch_and_wait(self, record, args, shift):
             vm.add_args(*args)
         self.vm_add_disk(vm, self.boot_path, 0, self.hdd)
         self.vm_add_disk(vm, self.cloudinit_path, 1, self.cd)
-        logger = logging.getLogger('replay')
+        logger = self.log.getChild('replay')
         if record:
             logger.info('recording the execution...')
             mode = 'record'
@@ -91,7 +90,7 @@ def launch_and_wait(self, record, args, shift):
     def run_rr(self, args=None, shift=7):
         t1 = self.launch_and_wait(True, args, shift)
         t2 = self.launch_and_wait(False, args, shift)
-        logger = logging.getLogger('replay')
+        logger = self.log.getChild('replay')
         logger.info('replay overhead {:.2%}'.format(t2 / t1 - 1))
 
 @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout')
diff --git a/tests/avocado/reverse_debugging.py b/tests/avocado/reverse_debugging.py
index d2921e70c3..2cb39f3e59 100644
--- a/tests/avocado/reverse_debugging.py
+++ b/tests/avocado/reverse_debugging.py
@@ -8,7 +8,6 @@
 # This work is licensed under the terms of the GNU GPL, version 2 or
 # later.  See the COPYING file in the top-level directory.
 import os
-import logging
 
 from avocado import skipIf
 from avocado_qemu import BUILD_DIR
@@ -35,7 +34,7 @@ class ReverseDebugging(LinuxKernelTest):
     endian_is_le = True
 
     def run_vm(self, record, shift, args, replay_path, image_path, port):
-        logger = logging.getLogger('replay')
+        logger = self.log.getChild('replay')
         vm = self.get_vm()
         vm.set_console()
         if record:
@@ -95,7 +94,7 @@ def vm_get_icount(vm):
         return vm.qmp('query-replay')['return']['icount']
 
     def reverse_debugging(self, shift=7, args=None):
-        logger = logging.getLogger('replay')
+        logger = self.log.getChild('replay')
 
         # create qcow2 for snapshots
         logger.info('creating qcow2 image for VM snapshots')
diff --git a/tests/avocado/tesseract_utils.py b/tests/avocado/tesseract_utils.py
index 72cd9ab798..e0c5a6a454 100644
--- a/tests/avocado/tesseract_utils.py
+++ b/tests/avocado/tesseract_utils.py
@@ -31,8 +31,8 @@ def tesseract_available(expected_version):
 
 
 def tesseract_ocr(image_path, tesseract_args='', tesseract_version=3):
-    console_logger = logging.getLogger('tesseract')
-    console_logger.debug(image_path)
+    logger = logging.getLogger('avocado.test.tesseract')
+    logger.debug(image_path)
     if tesseract_version == 4:
         tesseract_args += ' --oem 1'
     proc = process.run("tesseract {} {} stdout".format(tesseract_args,
@@ -41,6 +41,6 @@ def tesseract_ocr(image_path, tesseract_args='', tesseract_version=3):
     for line in proc.stdout_text.split('\n'):
         sline = line.strip()
         if len(sline):
-            console_logger.debug(sline)
+            logger.debug(sline)
             lines += [sline]
     return lines
diff --git a/tests/avocado/virtio_check_params.py b/tests/avocado/virtio_check_params.py
index e869690473..fa19e9dbcb 100644
--- a/tests/avocado/virtio_check_params.py
+++ b/tests/avocado/virtio_check_params.py
@@ -20,7 +20,6 @@
 import sys
 import os
 import re
-import logging
 
 sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
 from qemu.machine import QEMUMachine
@@ -75,7 +74,7 @@ def query_virtqueue(self, vm, dev_type_name):
 
     def check_mt(self, mt, dev_type_name):
         mt['device'] = dev_type_name # Only for the debug() call.
-        logger = logging.getLogger('machine')
+        logger = self.log.getChild('machine')
         logger.debug(mt)
         with QEMUMachine(self.qemu_bin) as vm:
             vm.set_machine(mt["name"])
-- 
2.35.1
