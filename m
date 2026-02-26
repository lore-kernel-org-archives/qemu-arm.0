Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 119BFFD8FF5
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Feb 2026 18:54:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvgUL-0008Gb-Oh; Thu, 26 Feb 2026 13:53:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vvgU9-0008EO-1A
 for qemu-arm@nongnu.org; Thu, 26 Feb 2026 13:53:20 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vvgU5-0003Xw-4h
 for qemu-arm@nongnu.org; Thu, 26 Feb 2026 13:53:16 -0500
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-65fa4713bd3so2326450a12.3
 for <qemu-arm@nongnu.org>; Thu, 26 Feb 2026 10:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772131990; x=1772736790; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ndupL3oUN02SVuVkMK/kSxRCtIhg07JpVkz01Y9bmaU=;
 b=XGvDE4fH5q4C1zk4LGWdI4yrG+dFACKYIx0510HaTu1PrHimp0DaUx4kInMrTW+pBS
 s8PZwNAN+StD8lQTHlsm5AddRdJno4O+4Gg6IuFLMnQ2IbRzLCAP9AqiY6gizLcgXzaK
 OAUeziAnfzypGz4vSDuF4JOlfgEAabA7DTOiy/O2nRBARB7/vPOzqbYWsiFdxY4GNMEb
 WfBR7FdsiTrc46JLAB/9DyYpRzmwW/0UHzYk4HebfUpW7+e5moH/v53GKGuBHuU46FMJ
 PBPK2X9s99rjdXAa1UzTLgAsLJ+jJ3ygnoRjPF2SXfsyOjP6FpDZ0jgGZRwYZA9+kkOj
 gzYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772131990; x=1772736790;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ndupL3oUN02SVuVkMK/kSxRCtIhg07JpVkz01Y9bmaU=;
 b=eWgjc+zV6A2RoHTBSgjExjmSI+Y/O8Rwu4zcdZw65dPhS7Xq+cb9FGzAQUqYXh/Nzq
 DPosNgMfpbDwYtdRxmK6sThs+ycOcHNIczSZF7E29JptCHNEJjtM8LTHSYkCPk7hVcrd
 fRHstzcdBEnhR0Lrx/GgwYTxnUiyASJgXkcpxqO9DPvO1xEG/Z+l18EfM3EX1kyKiLGy
 vpKujggl4EaibGgRCfYuec+vDUcMw8EJXYafszSUHeLziW0Q0yN9LHTsPSvvJBUhrsLk
 jE0xidCsTlcWWEFitkQ1cNH7MDmwlaHoal+dh8lCOH5pxq9DD+XR3w5fFxzkfSZIeuWP
 8zbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXg41YCEBiAZyK6iIqzU9N/szDiEyuVQpM940nMBaUJy3M3P0eBeQhiTtMW/RppDnFDf/moTV8/8Q==@nongnu.org
X-Gm-Message-State: AOJu0YwnYlArgji/jywKcCj5UVO4E99frLCDwGXNbbOaTyMeEOozuGzu
 VYyDLXZ+08s8/RP1qazQfs/D3oT+QEOtB2L166kcFUjpyma/zpPILIyeUoU26XOYSks=
X-Gm-Gg: ATEYQzyzNX061CUrgAQ/v6xcByMZYrh4wMtVLYp/PvZcW18gHeTo80CiMCckC6GWBE1
 5/yAVqAHoQzWD2HoOBv9ZwgHwX7Mry8vN3psnWeIQengd5JwSWOi6o97u54JzTrIW4xaOSsqreR
 FoCttow756zSS5z5Gd8I5fCb8FKCprr12V0XcOQ8e4UrpI1Ck1HJj4YR51joAz3EUYzMZRpSL6f
 ZBOM+Z1NlGcRAWP+bJixmIFmFpWk95uiqiJFJNLjdKQu0dn31AOV+JgZzsdwgYK8JCRRthBh30t
 3hFb1tyf9Xb++oi3m4p73e4SJdzaGD5MosXy3Fmd2NWGvGM81LprlncxMzBxgRsZ5bm7336xCDm
 5rckDkxM37rO4sGyw9160CiR4mCmR1O/NlBQIj4e+xaqgUoKJ2MxuX5QjZL968lD/5ao7/b0QcW
 V/wp3kcu1jhF5nlyhMUEXQjxpuJeR1YZZzzQ==
X-Received: by 2002:a05:6402:26c9:b0:65f:a9e1:4a4e with SMTP id
 4fb4d7f45d1cf-65fdd6c02a8mr217403a12.4.1772131990286; 
 Thu, 26 Feb 2026 10:53:10 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65fac06dc16sm713945a12.23.2026.02.26.10.53.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 10:53:07 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 1BB3C5F8D7;
 Thu, 26 Feb 2026 18:53:04 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Brad Smith <brad@comstyle.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Subject: [PATCH v2 7/7] tests/functional: add Arm VBSA uefi conformance test
Date: Thu, 26 Feb 2026 18:53:02 +0000
Message-ID: <20260226185303.1920021-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260226185303.1920021-1-alex.bennee@linaro.org>
References: <20260226185303.1920021-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Message-ID: <20260213154859.1551283-7-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - use the VBSA prebuilt shell
  - fail the test if we see FAILED in the console stream
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
index 00000000000..3da06904ea9
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
+                                 failure_message='FAILED',
+                                 vm=vm)
+
+    ASSET_VBSA_EFI = Asset('https://github.com/ARM-software/sysarch-acs/raw/refs/heads/main'
+                           '/prebuilt_images/VBSA/v25.12_VBSA_0.7.0/Vbsa.efi',
+                           '80f37d2fb86d152d95dec4d05ff099c9e47ee8a89314268e08056b0e1359e1fa')
+
+    ASSET_BSA_SHELL = Asset('https://github.com/ARM-software/sysarch-acs/raw/refs/heads/main'
+                            '/prebuilt_images/VBSA/v25.12_VBSA_0.7.0/Shell.efi',
+                            'e526604f0d329b481c6a1f62f7a0db8ea24ce8178b2c6abda8e247425f38775c')
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


