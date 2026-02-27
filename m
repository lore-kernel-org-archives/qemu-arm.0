Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C1CFFEFB5A
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Feb 2026 15:19:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvzbi-0000OY-L2; Fri, 27 Feb 2026 10:18:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vvzbf-0000Ng-5h
 for qemu-arm@nongnu.org; Fri, 27 Feb 2026 10:18:20 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vvzbb-0005lN-Li
 for qemu-arm@nongnu.org; Fri, 27 Feb 2026 10:18:18 -0500
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b7cf4a975d2so280324866b.2
 for <qemu-arm@nongnu.org>; Fri, 27 Feb 2026 07:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772205494; x=1772810294; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=whYwc363DlBWavn49nvRwmkQKGaamlvRPoo53Es7/go=;
 b=G+GgLNBaDXi4nm1Wb04dMxb3m9skf5ozCsfQQ74d6u/h+YPKyrnTIcp1VJgZO8cNjd
 L5ThXBU/oEeuQugfYy/X7TgRV7nBWHlKDgpQoSSOgv63HRZvabGhrzaSuz4ZlauT2kST
 uJ0Q/2a3MUCKSOg5I6VxFHqPpWytlWG6jWCn7Bmhkadl1wi7dkFfa8k324Oa2KWs7zKA
 alZZ5VoBbKmd+le90/MkWQ5GHDlFkd3BGjxFm0DpkfHe8BZlgbtqrkoovHE6TEgTaHtt
 5QOKYveYVTLh+28lWEDAL/MsQg2CE18jt6T4FIyA1vdpXBOwT8sv+cgKPOHpn6BR7K+d
 exnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772205494; x=1772810294;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=whYwc363DlBWavn49nvRwmkQKGaamlvRPoo53Es7/go=;
 b=H3PhMWIhYPdElVnar5JhJb5PuIj/IZQ9k5SYuVHq2dWXVssR78jKd0SlPFz9dt9sBb
 npBE3XtOT42DGjklDywFJPwyBspm0wvLTVkgn9BGvuhTyqnNjAZaJ13LIQ41TpjPiBdh
 rBIHQzoKo18R8AvffieY/lPZPXTaH+35XDvggtFhTJKxAvK+6IShFBkRivVlyxqcfH75
 c4cTE8PlrrkrlZ1iYlpiHzMKT64mGMT+VCJhSeTxm9amByA18mJo4ZId8l0wLxM6lJbC
 YKt7s3l8dO3rcD2DjfaPmhztr7Bg8TrHWereRTBt3RuYrEYk04ZsQqlbCkSbf/gZe27m
 v3ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEislydemIB3zNiUwP1W1rZbThcITzK2i9948yhCXyu/UpLenZ/IHvmGx0Itb5YjSOxyHQrHDaLA==@nongnu.org
X-Gm-Message-State: AOJu0YxK+9jM5AMpB32n3dx5RXF+pV2yDhb/yjvCxLphFZhh8wZAw1w0
 z7G2Gzd4vD9LfZOtKHFiH0DasJDXWdtw3Gbet/FgNXXvAFx3yKeqAVnuyshh6j5PBVs=
X-Gm-Gg: ATEYQzzrhNC9B9REt0DupFabhn6Yv0fYqeYXbiswvn7nGimdDsytJZeXcA2R2PIhVvJ
 3OrW1pX/ooVMqp1JZML3uCiOjJpGyp8FfYS3goXPGzH5D2KD9HJ8dbenuGE8UMV8/GYSp69W5YY
 HzGhQ4n3CyWmoFoF8UGb9pxW5LzRUTaz1O97z8lsnw3LJxbTEpDE6joFg9C8/FyTv5r3ruEHI5x
 48M3P3VAl57pEU5awZy7JOCSM2Ti8Q99X0rSjrClyu11BU/0FDWd/aY8Z7ySRD8lPeZQcC0tCGj
 6WwMZWhmChSlP0n/d2PG7FUj/9YjcBUD1nhwDwN6e2sxWbYSBFFu+5ROW0HDP6A8/v7+N+pLMdy
 X+x2SG4Xu+OBFpV2EzKT0hnHqhWsReRHsD8kvboJrQxiLqLk/7RisdDGyWAZuAGW9QUQ1UP3XkS
 KrXK/GZWI8Y3DKyLqp3TigFTGouJ2SgnZFtA==
X-Received: by 2002:a17:906:26ca:b0:b87:3c4a:e68f with SMTP id
 a640c23a62f3a-b9376512748mr173471766b.36.1772205493562; 
 Fri, 27 Feb 2026 07:18:13 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9385836a84sm21349666b.59.2026.02.27.07.18.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 07:18:10 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id CEDA45FA8E;
 Fri, 27 Feb 2026 15:18:05 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PULL 7/7] tests/functional: add Arm VBSA uefi conformance test
Date: Fri, 27 Feb 2026 15:18:04 +0000
Message-ID: <20260227151805.2335641-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260227151805.2335641-1-alex.bennee@linaro.org>
References: <20260227151805.2335641-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x636.google.com
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

Reviewed-by: Mohamed Mediouni <mohamed@unpredictable.fr>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-ID: <20260226185303.1920021-8-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

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
index 00000000000..1dd4cecde1e
--- /dev/null
+++ b/tests/functional/aarch64/test_virt_vbsa.py
@@ -0,0 +1,106 @@
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
+from qemu_test import get_qemu_img, skipIfMissingCommands
+from qemu_test import wait_for_console_pattern
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
+    ASSET_VBSA_EFI = Asset(
+        'https://github.com/ARM-software/sysarch-acs/raw/refs/heads/main'
+        '/prebuilt_images/VBSA/v25.12_VBSA_0.7.0/Vbsa.efi',
+        '80f37d2fb86d152d95dec4d05ff099c9e47ee8a89314268e08056b0e1359e1fa')
+
+    ASSET_BSA_SHELL = Asset(
+        'https://github.com/ARM-software/sysarch-acs/raw/refs/heads/main'
+        '/prebuilt_images/VBSA/v25.12_VBSA_0.7.0/Shell.efi',
+        'e526604f0d329b481c6a1f62f7a0db8ea24ce8178b2c6abda8e247425f38775c')
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
+        self.vm.add_args('-cpu', 'max', '-m', '1024')
+
+        # We will use the QEMU firmware blobs to boot
+        code_path = self.build_file('pc-bios', 'edk2-aarch64-code.fd')
+        vars_source = self.build_file('pc-bios', 'edk2-arm-vars.fd')
+        vars_path = self.scratch_file('vars.fd')
+        shutil.copy(vars_source, vars_path)
+
+        self.vm.add_args('-drive',
+                         f'if=pflash,format=raw,readonly=on,file={code_path}')
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
+        check_call(['mcopy', '-i', img_path, bsa_shell,
+                    '::/EFI/BOOT/BOOTAA64.EFI'],
+                   stdout=DEVNULL, stderr=DEVNULL)
+
+        check_call(['mcopy', '-i', img_path, vbsa_efi, '::/Vbsa.efi'],
+                   stdout=DEVNULL, stderr=DEVNULL)
+
+        self.vm.add_args('-drive',
+                         f'file={img_path},format=raw,if=none,id=drive0')
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
+
+if __name__ == '__main__':
+    QemuSystemTest.main()
-- 
2.47.3


