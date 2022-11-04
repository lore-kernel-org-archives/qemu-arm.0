Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp382950ejx;
        Fri, 4 Nov 2022 00:53:59 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7t1eB+/xc5KEit6v9QoSE2VmTGsnp5zchWFR3yJRPKP+uygCH9Fsyc5iu9xwgErD/x+oGH
X-Received: by 2002:a17:90b:128a:b0:213:26c2:2c06 with SMTP id fw10-20020a17090b128a00b0021326c22c06mr51566402pjb.26.1667548438922;
        Fri, 04 Nov 2022 00:53:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667548438; cv=none;
        d=google.com; s=arc-20160816;
        b=UR6daKI89umPrtHtpm11LHRey0+iXwL/5pxtGg2lmUvdrnYnt54mqKi3fh5ZnltSYJ
         rqWyABvh87BPwAoSjTxRgVC1x7Di2xzJ7ku9Qeh9UcxVlTwtfnbv/nCTf9njZR09UonQ
         NwIEnhtAe0xVFResJZqoKEZ3dq98EXNyktuFB31H6e6TD0CXRQUAou3ShzZLlyZBNaYo
         YTGk7TMkD6QCl+S6tBd1+l2GXFJWKvehg1k0XXeXPSKv97Qrt34DtIdPW2O6/eOyY/3G
         RRfZNmG++qXvurYeqKOYJOOnXIiyr3+d+0v6qftVbqEdRXlpPjG1bdCBIbqSBXtoEZhj
         KZjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=lFaRCVksGfiRu+DqfD9N8knZjzobJNr5mzTB4CYozBE=;
        b=uiXLtlV6XYquc4/8axKgtV0rR38TrPYOXrVRMEv0+7mVxbgArkoP8zofCP407X4G+W
         Gtszm0pPgfiGVKpY3Y5irQ8tb7N4fMOBodlvSiJvpwE25yFMhZhONef/MVO+O+jJkY7f
         JrdJ9rSP/z+3UE8fzO0R/tCneNzzPRgrEi1796hG43oAzAtFwKmxF8NVJo4JQPaadVKx
         mIuVvkPN1//XSosqeieRRRmnnus4+W8EtelNNSveISLDP0OnzfEFSKIiyFnSGo0hQTUB
         YblatlRAeSmySMS+CAFYOGaUseXle7kVJQuBKlCU5osA6a1QK7FY/mEYE15MTUMe0W2s
         TNlA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of srs0=em2v=3e=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) smtp.mailfrom="SRS0=EM2V=3E=kaod.org=clg@ozlabs.org"
Return-Path: <SRS0=EM2V=3E=kaod.org=clg@ozlabs.org>
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org. [150.107.74.76])
        by mx.google.com with ESMTPS id e13-20020a056a001a8d00b0056d8f42a69csi4349712pfv.145.2022.11.04.00.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 00:53:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of srs0=em2v=3e=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) client-ip=150.107.74.76;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of srs0=em2v=3e=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) smtp.mailfrom="SRS0=EM2V=3E=kaod.org=clg@ozlabs.org"
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4N3Xv836mYz4xwt;
	Fri,  4 Nov 2022 18:53:56 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4N3Xv54fspz4xFs;
	Fri,  4 Nov 2022 18:53:53 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH] tests/avocado/machine_aspeed.py: Reduce noise on the console for SDK tests
Date: Fri,  4 Nov 2022 08:53:47 +0100
Message-Id: <20221104075347.370503-1-clg@kaod.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: cZdbvQ4b1IZC

The Aspeed SDK images are based on OpenBMC which starts a lot of
services. The output noise on the console can break from time to time
the test waiting for the logging prompt.

Change the U-Boot bootargs variable to add "quiet" to the kernel
command line and reduce the output volume. This also drops the test on
the CPU id which was nice to have but not essential.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 tests/avocado/machine_aspeed.py | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index fba6527026..1fc385e1c8 100644
--- a/tests/avocado/machine_aspeed.py
+++ b/tests/avocado/machine_aspeed.py
@@ -12,6 +12,7 @@
 from avocado_qemu import wait_for_console_pattern
 from avocado_qemu import exec_command
 from avocado_qemu import exec_command_and_wait_for_pattern
+from avocado_qemu import interrupt_interactive_console_until_pattern
 from avocado.utils import archive
 from avocado import skipIf
 
@@ -182,6 +183,8 @@ def test_arm_ast2600_evb_buildroot(self):
 
 class AST2x00MachineSDK(QemuSystemTest):
 
+    EXTRA_BOOTARGS = ' quiet'
+
     # FIXME: Although these tests boot a whole distro they are still
     # slower than comparable machine models. There may be some
     # optimisations which bring down the runtime. In the meantime they
@@ -194,7 +197,7 @@ def wait_for_console_pattern(self, success_message, vm=None):
                                  failure_message='Kernel panic - not syncing',
                                  vm=vm)
 
-    def do_test_arm_aspeed_sdk_start(self, image, cpu_id):
+    def do_test_arm_aspeed_sdk_start(self, image):
         self.require_netdev('user')
         self.vm.set_console()
         self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
@@ -202,9 +205,13 @@ def do_test_arm_aspeed_sdk_start(self, image, cpu_id):
         self.vm.launch()
 
         self.wait_for_console_pattern('U-Boot 2019.04')
-        self.wait_for_console_pattern('## Loading kernel from FIT Image')
+        interrupt_interactive_console_until_pattern(
+            self, 'Hit any key to stop autoboot:', 'ast#')
+        exec_command_and_wait_for_pattern(
+            self, 'setenv bootargs ${bootargs}' + self.EXTRA_BOOTARGS, 'ast#')
+        exec_command_and_wait_for_pattern(
+            self, 'boot', '## Loading kernel from FIT Image')
         self.wait_for_console_pattern('Starting kernel ...')
-        self.wait_for_console_pattern('Booting Linux on physical CPU ' + cpu_id)
 
     @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
     def test_arm_ast2500_evb_sdk(self):
@@ -221,7 +228,7 @@ def test_arm_ast2500_evb_sdk(self):
         archive.extract(image_path, self.workdir)
 
         self.do_test_arm_aspeed_sdk_start(
-            self.workdir + '/ast2500-default/image-bmc', '0x0')
+            self.workdir + '/ast2500-default/image-bmc')
         self.wait_for_console_pattern('ast2500-default login:')
 
     @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
@@ -243,7 +250,7 @@ def test_arm_ast2600_evb_sdk(self):
         self.vm.add_args('-device',
                          'ds1338,bus=aspeed.i2c.bus.5,address=0x32');
         self.do_test_arm_aspeed_sdk_start(
-            self.workdir + '/ast2600-default/image-bmc', '0xf00')
+            self.workdir + '/ast2600-default/image-bmc')
         self.wait_for_console_pattern('ast2600-default login:')
         exec_command_and_wait_for_pattern(self, 'root', 'Password:')
         exec_command_and_wait_for_pattern(self, '0penBmc', 'root@ast2600-default:~#')
-- 
2.38.1
