Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp392379njb;
        Fri, 11 Oct 2024 06:20:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVorrK7pHRYKv3QOgEnH9EO//JkD/5m+TwqZRUEG4hO1c8OYzrnz5uVzj///bt7uig1FWWPvauabCMacg==@linaro.org
X-Google-Smtp-Source: AGHT+IEyU/qnb5myaIJRtTW3ph9WRY7a/u0S1ddk0IDDchnbJWpWmIoIOSfO1o52SZPDkiO9c9vI
X-Received: by 2002:a05:620a:1708:b0:7ac:9bdd:6e78 with SMTP id af79cd13be357-7b11a379f68mr397540585a.14.1728652808247;
        Fri, 11 Oct 2024 06:20:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728652808; cv=none;
        d=google.com; s=arc-20240605;
        b=SRXAu864rVmQk6mSjlPb8e9qbSxonwAM3rI/Vh2tCu8xENdaxqlXB137DOPy/iMDxX
         qAk9pJrAoLNsrO2gLCAmwrKtycJ9+xAUA29cnMCLMcRRGnw5itWjdEL8/lQYiMqrYey6
         tNVuR2qQxT7HvP6SGkveGfAfkE75/ZRd3rYSeNszOGJcNSpkPFWTQYe5ZUtE5Fp+68Dj
         5ib+DZz2x1MSibihreyQE4ucPBBNzzvnHr0+RIS2XuAxiQEQySSZXLyHNzNTby2W3QAx
         nZSwR8Puj4FNo9wKKnQB7pkHPciA3zgPhLwE3nLiIGvQReKm2kncD4GvOHVJx3Z+YY++
         /+kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=OUgsTaBnHviGRvhwISvHm7Ex/ZTmQ4HeHoZthDt3Qsg=;
        fh=yV7XiH9Iqz9ECmsY7O4iL5H1OqntXAXD46ZP2pth0HE=;
        b=g6j7YfbtV1akXOY3PiiXro8uM++LRmRd6/SVeIHkH7Ri3OiPVS3AbHXQj5O1BjQay6
         ZOnUYi3Wpfl2qaK4WIFqga7wBms2KVMN2kpGCT6OcNzHyGAa+zBPM52Bi60MtgisnP/m
         RCsU6pJmZFCnEOzbtN7a9JGzRk+LA7opz6LL0h9s5F5XobI7TfgGyFZULMZspX+Gn7fI
         Ssri6OzdeaoD8WJq02VPdIQNOU8eM4Lx0WE8tGQG9Zf674d82F7lUqnPDTI4rB9HoF7p
         RVSbRY18T/OnchoVmkQVrKmDilEImrYBv82RsC4tw6Npe7EY/gpI4AIGXWoY27pm7nvp
         VPLg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fXwQqmir;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7b11e531fedsi65723885a.473.2024.10.11.06.20.08
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 06:20:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fXwQqmir;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728652807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OUgsTaBnHviGRvhwISvHm7Ex/ZTmQ4HeHoZthDt3Qsg=;
	b=fXwQqmirEcjIHlWZ9AhcN1cWO1VlieJLwmZzR/WxV4uuFoNiaGkFspFx9/hcwVmtYummES
	p1jf5A6xUPt3KlWec1Zr+tkqkl1Bx5n5W9pLpqpkDUhUfxvbm5c+NyGnCggcZbmy1ryuPB
	YxclTFakc9MJqcYGYXaHCjfell+18j0=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-199-bneyTQ9kM32OWukVG5Iscw-1; Fri,
 11 Oct 2024 09:20:04 -0400
X-MC-Unique: bneyTQ9kM32OWukVG5Iscw-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2A4471955F29;
	Fri, 11 Oct 2024 13:20:03 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.193.77])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 264E91956052;
	Fri, 11 Oct 2024 13:19:59 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Magnus Damm <magnus.damm@gmail.com>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH 01/17] tests/functional: Add a base class for the TuxRun tests
Date: Fri, 11 Oct 2024 15:19:18 +0200
Message-ID: <20241011131937.377223-2-thuth@redhat.com>
In-Reply-To: <20241011131937.377223-1-thuth@redhat.com>
References: <20241011131937.377223-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-TUID: RIBOPMvCafj4

Add a base class for the TuxRun tests, based on the code from
tests/avocado/tuxrun_baselines.py (the test have to be put into
separate file in the following commits, depending on the target
architecture that gets tested).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/functional/qemu_test/tuxruntest.py | 158 +++++++++++++++++++++++
 1 file changed, 158 insertions(+)
 create mode 100644 tests/functional/qemu_test/tuxruntest.py

diff --git a/tests/functional/qemu_test/tuxruntest.py b/tests/functional/qemu_test/tuxruntest.py
new file mode 100644
index 0000000000..904da6f609
--- /dev/null
+++ b/tests/functional/qemu_test/tuxruntest.py
@@ -0,0 +1,158 @@
+# Functional test that boots known good tuxboot images the same way
+# that tuxrun (www.tuxrun.org) does. This tool is used by things like
+# the LKFT project to run regression tests on kernels.
+#
+# Copyright (c) 2023 Linaro Ltd.
+#
+# Author:
+#  Alex Bennée <alex.bennee@linaro.org>
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+import os
+import time
+
+from qemu_test import QemuSystemTest
+from qemu_test import exec_command, exec_command_and_wait_for_pattern
+from qemu_test import wait_for_console_pattern
+from qemu_test import has_cmd, run_cmd, get_qemu_img
+
+class TuxRunBaselineTest(QemuSystemTest):
+
+    KERNEL_COMMON_COMMAND_LINE = 'printk.time=0'
+    # Tests are ~10-40s, allow for --debug/--enable-gcov overhead
+    timeout = 100
+
+    def get_tag(self, tagname, default=None):
+        """
+        Get the metadata tag or return the default.
+        """
+        utag = self._get_unique_tag_val(tagname)
+        print(f"{tagname}/{default} -> {utag}")
+        if utag:
+            return utag
+
+        return default
+
+    def setUp(self):
+        super().setUp()
+
+        # We need zstd for all the tuxrun tests
+        # See https://github.com/avocado-framework/avocado/issues/5609
+        (has_zstd, msg) = has_cmd('zstd')
+        if has_zstd is False:
+            self.skipTest(msg)
+        self.zstd = 'zstd'
+
+        # Pre-init TuxRun specific settings: Most machines work with
+        # reasonable defaults but we sometimes need to tweak the
+        # config. To avoid open coding everything we store all these
+        # details in the metadata for each test.
+
+        # The tuxboot tag matches the root directory
+        self.tuxboot = self.arch
+
+        # Most Linux's use ttyS0 for their serial port
+        self.console = "ttyS0"
+
+        # Does the machine shutdown QEMU nicely on "halt"
+        self.wait_for_shutdown = True
+
+        self.root = "vda"
+
+        # Occasionally we need extra devices to hook things up
+        self.extradev = None
+
+        self.qemu_img = get_qemu_img(self)
+
+    def wait_for_console_pattern(self, success_message, vm=None):
+        wait_for_console_pattern(self, success_message,
+                                 failure_message='Kernel panic - not syncing',
+                                 vm=vm)
+
+    def fetch_tuxrun_assets(self, kernel_asset, rootfs_asset, dtb_asset=None):
+        """
+        Fetch the TuxBoot assets.
+        """
+        kernel_image =  kernel_asset.fetch()
+        disk_image_zst = rootfs_asset.fetch()
+
+        run_cmd([self.zstd, "-f", "-d", disk_image_zst,
+                 "-o", self.workdir + "/rootfs.ext4"])
+
+        dtb = dtb_asset.fetch() if dtb_asset is not None else None
+
+        return (kernel_image, self.workdir + "/rootfs.ext4", dtb)
+
+    def prepare_run(self, kernel, disk, drive, dtb=None, console_index=0):
+        """
+        Setup to run and add the common parameters to the system
+        """
+        self.vm.set_console(console_index=console_index)
+
+        # all block devices are raw ext4's
+        blockdev = "driver=raw,file.driver=file," \
+            + f"file.filename={disk},node-name=hd0"
+
+        kcmd_line = self.KERNEL_COMMON_COMMAND_LINE
+        kcmd_line += f" root=/dev/{self.root}"
+        kcmd_line += f" console={self.console}"
+
+        self.vm.add_args('-kernel', kernel,
+                         '-append', kcmd_line,
+                         '-blockdev', blockdev)
+
+        # Sometimes we need extra devices attached
+        if self.extradev:
+            self.vm.add_args('-device', self.extradev)
+
+        self.vm.add_args('-device',
+                         f"{drive},drive=hd0")
+
+        # Some machines need an explicit DTB
+        if dtb:
+            self.vm.add_args('-dtb', dtb)
+
+    def run_tuxtest_tests(self, haltmsg):
+        """
+        Wait for the system to boot up, wait for the login prompt and
+        then do a few things on the console. Trigger a shutdown and
+        wait to exit cleanly.
+        """
+        self.wait_for_console_pattern("Welcome to TuxTest")
+        time.sleep(0.2)
+        exec_command(self, 'root')
+        time.sleep(0.2)
+        exec_command(self, 'cat /proc/interrupts')
+        time.sleep(0.1)
+        exec_command(self, 'cat /proc/self/maps')
+        time.sleep(0.1)
+        exec_command(self, 'uname -a')
+        time.sleep(0.1)
+        exec_command_and_wait_for_pattern(self, 'halt', haltmsg)
+
+        # Wait for VM to shut down gracefully if it can
+        if self.wait_for_shutdown:
+            self.vm.wait()
+        else:
+            self.vm.shutdown()
+
+    def common_tuxrun(self,
+                      kernel_asset,
+                      rootfs_asset,
+                      dtb_asset=None,
+                      drive="virtio-blk-device",
+                      haltmsg="reboot: System halted",
+                      console_index=0):
+        """
+        Common path for LKFT tests. Unless we need to do something
+        special with the command line we can process most things using
+        the tag metadata.
+        """
+        (kernel, disk, dtb) = self.fetch_tuxrun_assets(kernel_asset, rootfs_asset,
+                                                       dtb_asset)
+
+        self.prepare_run(kernel, disk, drive, dtb, console_index)
+        self.vm.launch()
+        self.run_tuxtest_tests(haltmsg)
+        os.remove(disk)
-- 
2.46.1
