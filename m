Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F70EDF173
	for <qemu-arm@archiver.kernel.org>; Fri, 13 Feb 2026 15:50:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vqvPs-0001ti-4Z; Fri, 13 Feb 2026 10:49:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vqvPr-0001st-Cb
 for qemu-arm@nongnu.org; Fri, 13 Feb 2026 10:49:11 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vqvPm-0007xA-Qv
 for qemu-arm@nongnu.org; Fri, 13 Feb 2026 10:49:10 -0500
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-65a431e305eso1829738a12.0
 for <qemu-arm@nongnu.org>; Fri, 13 Feb 2026 07:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770997745; x=1771602545; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zC+gcSeZ99GKv5sRztPc7adAuVq0E0dT5LvwAnUamAA=;
 b=x2RnXYWRrYuiW5rFX9brGT8jgHHiM3Yeq8XqjsWO2x2DR9IK33V8MU9UsBk7QRCFmF
 M5GQ7a8wlkzTScOA9aR0tkmFM8HSWp70oWJNMigMQJw9Few6jqHOEnCZVGUnKjhVRJKF
 X9YQsTPfuPy1wZTtvjRfatPMdjdTpV3Ry0Ongi3SCwoabXX3boZADSohVwUGEnXLJNk/
 iRE3aZRffylxV9J2MswBwKtCugEfW3E3oo2LyXA0+SUQtVg/P00FSLMruAEdPn6gjy6E
 O4udj/8NnDhrHdF6xCGuBSy/3XUymfn+5F4ndZqvZgi30Fjk6X8ZK9FS0YFTVXJvwE4p
 Fl2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770997745; x=1771602545;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zC+gcSeZ99GKv5sRztPc7adAuVq0E0dT5LvwAnUamAA=;
 b=noRqU4xx+laSwqqNHOBrOckZeG9B0r6oJ4zlyXfyLocrOIBkX8r0YT3GVwYkfenvTH
 U4AsSBXr4lZslzfM6TeRB/QJi+Qokl8p/+twhAX+wOS/FQEUweVY5C3xDb1bdc1OCzO0
 bxQjVx5breDz6hhkV8eC6R/F619S8YcfZeXc3VGg/JmdDede5+CQY5sxrr2VTOjRqcvY
 ajeXOB7lR5nHxa01X3vQ40YyNB3D9QNuZldqYAoqszm9ihDXdLVPZoXHbKaSvnfLe2pP
 rsfopCjqT3b/Mh4zd7NJiHz6VJCCmjjUn/q5Zhldbjjo3YdRSxQ4pPwUOin8bbLQdu/a
 NpfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTdA9uGoUg9nSkgWmDRCdWFon9ku8J6426tTkxkLH3QJWuK8kHDAyxGCsPP1E8TE2Wf8kD22lfRQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy72oW/uCMrOlGI0UguxnGrDmL7/5ZcAzFfS39B3eH0vIerx9gg
 puQGAcfcimtW9n50zJrOAWy0KKoe+NGO7D3fyNb+qHsA9w0cyzyR5iuGhwmhWzqDFk0=
X-Gm-Gg: AZuq6aKg9kB2SQ0Pagw0gQXg7LV3PGPa1Jd9EBDjbaQWlGAjoFQwQ1dLNr65YfsuWHM
 3G0ByR6kkBy1GCFtsP5Yu0gVLhtZFX726yZDueH6u+IMBzCUOd+Yzio4oRfz1kEY4zeI5xcPooQ
 zzL9sTfBd6F0M026Cpg1o/xiPbrUS1vk7Kkjj1uAupdtC1pPfkQgb2/PYDodspTzh6e6TzYWSnY
 bLFdfTAbgH9O/IKwZP2kB11Zs8FNj7H0GPDW3QLIXJJ+74cihMQ6E6159wZFL5myn/w4TKUgXoT
 W71cf4KLLGbN/z3xYg51dnEZul959RXFwvVDdzeV9BDyrqDIrgeNCzJJuBZTUKYgAPpxRjaJ5W7
 Mm65GvTKF7aN9TKHgcSPan+euVQq0HekKP47vISivd2pMjorp35ume1x3NoRnkMfiJ2aF1qc9M+
 iOoR/MUuj9uEWGhHf+kpMAkOY=
X-Received: by 2002:a05:6402:42ce:b0:659:40a9:713a with SMTP id
 4fb4d7f45d1cf-65bb116439fmr1070623a12.12.1770997745082; 
 Fri, 13 Feb 2026 07:49:05 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65bad19bfc8sm774340a12.1.2026.02.13.07.49.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 07:49:04 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 6BF0F5FC85;
 Fri, 13 Feb 2026 15:49:00 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Brad Smith <brad@comstyle.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH 6/6] tests/functional: add Arm VBSA uefi conformance test
Date: Fri, 13 Feb 2026 15:48:59 +0000
Message-ID: <20260213154859.1551283-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260213154859.1551283-1-alex.bennee@linaro.org>
References: <20260213154859.1551283-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

The VBSA test is a subset of the wider Arm architecture compliance
suites (ACS) which validate machines meet particular minimum set of
requirements. The VBSA is for virtual machines so it makes sense we
should check the -M virt machine is compliant.

Fortunately there are prebuilt binaries published via github so all we
need to do is build an EFI partition and place things in the right
place.

There are some additional Linux based tests which are left for later.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/functional/aarch64/meson.build       |  1 +
 tests/functional/aarch64/test_virt_vbsa.py | 99 ++++++++++++++++++++++
 2 files changed, 100 insertions(+)
 create mode 100755 tests/functional/aarch64/test_virt_vbsa.py

diff --git a/tests/functional/aarch64/meson.build b/tests/functional/aarch64/meson.build
index 49eca120589..7ea8c22b048 100644
--- a/tests/functional/aarch64/meson.build
+++ b/tests/functional/aarch64/meson.build
@@ -46,6 +46,7 @@ tests_aarch64_system_thorough = [
   'tuxrun',
   'virt',
   'virt_gpu',
+  'virt_vbsa',
   'xen',
   'xlnx_versal',
 ]
diff --git a/tests/functional/aarch64/test_virt_vbsa.py b/tests/functional/aarch64/test_virt_vbsa.py
new file mode 100755
index 00000000000..53cabf9d6c5
--- /dev/null
+++ b/tests/functional/aarch64/test_virt_vbsa.py
@@ -0,0 +1,99 @@
+#!/usr/bin/env python3
+#
+# Functional test that runs the Arm VBSA conformance tests.
+#
+# Copyright (c) 2026 Linaro Ltd.
+#
+# Author:
+#  Alex Bennée <alex.bennee@linaro.org>
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+import shutil
+from subprocess import check_call, DEVNULL
+
+from qemu_test import QemuSystemTest, Asset
+from qemu_test import wait_for_console_pattern, get_qemu_img, skipIfMissingCommands
+from qemu_test import exec_command_and_wait_for_pattern as ec_and_wait
+
+
+@skipIfMissingCommands("mformat", "mcopy", "mmd")
+class Aarch64VirtMachine(QemuSystemTest):
+    KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
+    timeout = 360
+
+    def wait_for_console_pattern(self, success_message, vm=None):
+        wait_for_console_pattern(self, success_message,
+                                 failure_message='Kernel panic - not syncing',
+                                 vm=vm)
+
+    ASSET_VBSA_EFI = Asset('https://github.com/ARM-software/sysarch-acs/raw/refs/heads/main'
+                           '/prebuilt_images/VBSA/v25.12_VBSA_0.7.0/Vbsa.efi',
+                           '80f37d2fb86d152d95dec4d05ff099c9e47ee8a89314268e08056b0e1359e1fa')
+
+    ASSET_BSA_SHELL = Asset('https://github.com/ARM-software/bsa-acs/raw/refs/heads/main/'
+                            'prebuilt_images/BSA_DT/v20.05_05_ALPHA/Shell.efi',
+                            '763e7b293fa9d1582153ea8fd0cf60e2a7a87d092d35d342cf9b3b697f47b588')
+
+    def test_aarch64_vbsa_uefi_tests(self):
+        """
+        Launch the UEFI based VBSA test from an EFI file-system
+        """
+
+        self.vm.set_console()
+
+        # virt machine wi
+        self.set_machine('virt')
+        self.vm.add_args('-M', 'virt,gic-version=max,virtualization=on')
+        self.vm.add_args('-cpu', 'max','-m', '1024')
+
+        # We will use the QEMU firmware blobs to boot
+        code_path = self.build_file('pc-bios', 'edk2-aarch64-code.fd')
+        vars_source = self.build_file('pc-bios', 'edk2-arm-vars.fd')
+        vars_path = self.scratch_file('vars.fd')
+        shutil.copy(vars_source, vars_path)
+
+        self.vm.add_args('-drive', f'if=pflash,format=raw,readonly=on,file={code_path}')
+        self.vm.add_args('-drive', f'if=pflash,format=raw,file={vars_path}')
+
+        # Build an EFI FAT32 file-system for the UEFI tests
+        vbsa_efi = self.ASSET_VBSA_EFI.fetch()
+        bsa_shell = self.ASSET_BSA_SHELL.fetch()
+
+        img_path = self.scratch_file('vbsa.img')
+        qemu_img = get_qemu_img(self)
+        check_call([qemu_img, 'create', '-f', 'raw', img_path, '64M'],
+                   stdout=DEVNULL, stderr=DEVNULL)
+
+        check_call(['mformat', '-i', img_path, '-v', 'VBSA', '::'],
+                   stdout=DEVNULL, stderr=DEVNULL)
+
+        check_call(['mmd', '-i', img_path, '::/EFI'],
+                   stdout=DEVNULL, stderr=DEVNULL)
+
+        check_call(['mmd', '-i', img_path, '::/EFI/BOOT'],
+                   stdout=DEVNULL, stderr=DEVNULL)
+
+        check_call(['mcopy', '-i', img_path, bsa_shell, '::/EFI/BOOT/BOOTAA64.EFI'],
+                   stdout=DEVNULL, stderr=DEVNULL)
+
+        check_call(['mcopy', '-i', img_path, vbsa_efi, '::/Vbsa.efi'],
+                   stdout=DEVNULL, stderr=DEVNULL)
+
+        self.vm.add_args('-drive', f'file={img_path},format=raw,if=none,id=drive0')
+        self.vm.add_args('-device', 'virtio-blk-pci,drive=drive0')
+
+        self.vm.launch()
+
+        # wait for EFI prompt
+        self.wait_for_console_pattern('Shell>')
+
+        # Start the VBSA tests
+        ec_and_wait(self, "FS0:Vbsa.efi", 'VBSA Architecture Compliance Suite')
+
+        # could we parse the summary somehow?
+
+        self.wait_for_console_pattern('VBSA tests complete. Reset the system.')
+
+if __name__ == '__main__':
+    QemuSystemTest.main()
-- 
2.47.3


