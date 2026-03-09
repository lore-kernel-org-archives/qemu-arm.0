Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB65FCA16A
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Mar 2026 17:50:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vzeja-0000pf-5D; Mon, 09 Mar 2026 13:49:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vzeit-0000bQ-Mm
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 13:49:06 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vzeio-0002pb-LD
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 13:48:55 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-48532925a4bso9484655e9.1
 for <qemu-arm@nongnu.org>; Mon, 09 Mar 2026 10:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773078526; x=1773683326; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S0fhuaBJdOuUGUkX7QYGpAS75ZDvg8jajU+pZxhAjHw=;
 b=zIx5+CzIMdl19j7Uuw3Qh17UhHZJ7hJHEvrLuhHOnx007uerrkVIJmZIzcZmAk9ZAy
 Lu22Nu1V7llbJCwSMXfcFc2CMRPNMuLtzpWocVC9+fAnKUYSD4T1X0604mNa9UvWihpc
 cHgMyegy3nqx9+fVjsGMmOIFJqdbrlc6MUM3VvZYdGkh1Aa68Iy1HQZ6K+HGA+yq6NcN
 3chgjiOKCuMGc+qaANfU1O3PNPSNDXfGcU3j6FiIwZqqYTc+UYXhNMKRI+NmmVLPLl48
 18cobMCTsF7LEk4IVEgvwec+Tz3HaMXfWov9Pxua4mmMFF9QI9LIExSnv1GUw7t3RUDq
 q51g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773078526; x=1773683326;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=S0fhuaBJdOuUGUkX7QYGpAS75ZDvg8jajU+pZxhAjHw=;
 b=MQta99+F9fz1uUj5AUX/DW3+nQxj7lrZ1/4qT28CyylXNGPuAnYVmT657lS7fbn+t6
 GQO9cvCg7BeRhqRB4Hw2PuXvXFbT5d5NmynW3eSizhtRikjcz6ef7978eL0UVhpmtExZ
 /s7+yGHXjB8n3Sr4FK1QHpOCMzNthyQr9x/WamQm6Wifm+Bgux8W2P4/o43L/rY5D9oa
 ckA2yKGf9rx/2CCnHoWmr28T9vNdw4ImRxMQWWtERot2LGvHszVkveMqICyQQFgRxQqg
 3JPSOXOboUTHnzSifJ9Ah/r82yNxdFEfwj4tAbFN5PfOWK5j5J2AtdjH/mAm3uB1b1Cb
 jfLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzIbuik96LuL82VGWW1ZqMVC6elLrmLfqoT1fce0cvjzBuk98stfUf/o/15vdr9byNIXq17SKeqg==@nongnu.org
X-Gm-Message-State: AOJu0YxnQ3ELxWP3ohxbgj4p9xTkMi4DE1D//bY8Hesh4fDUKTwWbwtE
 pGI4oRUEbmY9XTBrLViWA9kHUhLReFvosvs4rls0gLnzOzlnrcgwQUIZ7GPKzss50gI=
X-Gm-Gg: ATEYQzyrWe5a4GGQv7Rw2OcClHSIPS8zEm0TyoaGjEGynxuHLGZD0/16J3gSqFrQP28
 /UGLmLjc1P71iPpnePDnGvyL9lEXtjFFz3gAeND45lVUL0ZvJ1HxtOqKAXpY5Bqgr/yAcz/CWEN
 uL1zzK7SXkciTnxfHXdttBKqZbhXzRYJFXftHHFcCuo/FdPHoLaIuPvFiZZbQtVl0joroHSXMja
 f3rR5y1zJdtDorFV8YpMkzdIkrwDPajPL4im39nyTegyCal/4TkQgN4+dqiFjc26xa5+N2xZ3QE
 /5yQpHzMSBziEZnWPj9RkFJXGjurE/dK2yJWyEIp4NF8KQNS9PU/SSb8u4Zx/xpfG3q+ws81eOv
 F5BpKVSbRZVIvCgidJ653Zy014dLGIYF/8o7EOi8tH3whFo1NpgK8YR97SAt1cCsGZDIWVbzq/6
 PpnpHjmNQSK4zmyE+R/56+RVs=
X-Received: by 2002:a05:600c:4591:b0:483:6d4a:7e6d with SMTP id
 5b1f17b1804b1-48526978644mr181996735e9.30.1773078526127; 
 Mon, 09 Mar 2026 10:48:46 -0700 (PDT)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48531818b5asm93719395e9.3.2026.03.09.10.48.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2026 10:48:45 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 1F7995FB96;
 Mon, 09 Mar 2026 17:48:42 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Brad Smith <brad@comstyle.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Kyle Evans <kevans@freebsd.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 5/5] tests/functional: add VBSA linux tests
Date: Mon,  9 Mar 2026 17:48:41 +0000
Message-ID: <20260309174841.4184117-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260309174841.4184117-1-alex.bennee@linaro.org>
References: <20260309174841.4184117-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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

This extends the VBSA test to run the linux tests. The sysarch-acs
test suite does provide some pre-built images which is good because
the tests require a patched kernel. However due to the structure of
the image we need to jump one or two hoops to get something useful:

  - download and double decompress (zip then xz) the image
  - navigate grub to launch the Linux Execution Environment
  - shutdown the system once tests are done
  - extract the logs from the MSDOS file system and parse them

It does make the code a bit ugly but it works for me at least. So far
the subset of tests run is limited but that might be solved by adding
some more devices to the PCIe bus to exercise the SMMU behaviour.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - dropped unused imports
  - use archive_extract for the zip step
  - drop virtuilization=on and smmu=max lines from config
  - use utf8 encodings for file access
  - don't use f"" strings when not needed
  - hack grub.cfg rather than using key presses
---
 tests/functional/aarch64/test_virt_vbsa.py | 122 +++++++++++++++++++--
 1 file changed, 111 insertions(+), 11 deletions(-)

diff --git a/tests/functional/aarch64/test_virt_vbsa.py b/tests/functional/aarch64/test_virt_vbsa.py
index 1dd4cecde1e..57bfe5d7af2 100755
--- a/tests/functional/aarch64/test_virt_vbsa.py
+++ b/tests/functional/aarch64/test_virt_vbsa.py
@@ -10,7 +10,8 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 
 import shutil
-from subprocess import check_call, DEVNULL
+import re
+from subprocess import check_call, check_output, DEVNULL
 
 from qemu_test import QemuSystemTest, Asset
 from qemu_test import get_qemu_img, skipIfMissingCommands
@@ -28,6 +29,20 @@ def wait_for_console_pattern(self, success_message, vm=None):
                                  failure_message='FAILED',
                                  vm=vm)
 
+    def append_firmware_blobs(self):
+        """
+        Setup QEMU firmware blobs for boot.
+        """
+        code_path = self.build_file('pc-bios', 'edk2-aarch64-code.fd')
+        vars_source = self.build_file('pc-bios', 'edk2-arm-vars.fd')
+        vars_path = self.scratch_file('vars.fd')
+        shutil.copy(vars_source, vars_path)
+
+        self.vm.add_args('-drive',
+                         f'if=pflash,format=raw,readonly=on,file={code_path}')
+        self.vm.add_args('-drive', f'if=pflash,format=raw,file={vars_path}')
+
+
     ASSET_VBSA_EFI = Asset(
         'https://github.com/ARM-software/sysarch-acs/raw/refs/heads/main'
         '/prebuilt_images/VBSA/v25.12_VBSA_0.7.0/Vbsa.efi',
@@ -45,20 +60,12 @@ def test_aarch64_vbsa_uefi_tests(self):
 
         self.vm.set_console()
 
-        # virt machine wi
+        # virt machine
         self.set_machine('virt')
         self.vm.add_args('-M', 'virt,gic-version=max,virtualization=on')
         self.vm.add_args('-cpu', 'max', '-m', '1024')
 
-        # We will use the QEMU firmware blobs to boot
-        code_path = self.build_file('pc-bios', 'edk2-aarch64-code.fd')
-        vars_source = self.build_file('pc-bios', 'edk2-arm-vars.fd')
-        vars_path = self.scratch_file('vars.fd')
-        shutil.copy(vars_source, vars_path)
-
-        self.vm.add_args('-drive',
-                         f'if=pflash,format=raw,readonly=on,file={code_path}')
-        self.vm.add_args('-drive', f'if=pflash,format=raw,file={vars_path}')
+        self.append_firmware_blobs()
 
         # Build an EFI FAT32 file-system for the UEFI tests
         vbsa_efi = self.ASSET_VBSA_EFI.fetch()
@@ -102,5 +109,98 @@ def test_aarch64_vbsa_uefi_tests(self):
         self.wait_for_console_pattern('VBSA tests complete. Reset the system.')
 
 
+    ASSET_SYSREADY_IMAGE = Asset(
+        'https://github.com/ARM-software/arm-systemready/'
+        'releases/download/v25.10_SR_3.1.0/systemready_acs_live_image.img.xz.zip',
+        'df2c359de15784b1da6a8e6f3c98a053ee38ac0b3f241ccea62e17db092eb03a')
+
+    ROOT_PROMPT = '/ # '
+
+    @skipIfMissingCommands("sfdisk", "jq", "sed")
+    def test_aarch64_vbsa_linux_tests(self):
+        """
+        Launch the Linux based VBSA test from the ACS prebuilt images.
+
+        We can use the pre-built images and then trigger the Linux
+        build and run the tests. We then need to slurp the results
+        from the partition.
+        """
+
+        self.vm.set_console()
+
+        # Plain virt machine
+        self.set_machine('virt')
+        self.vm.add_args('-M', 'virt,gic-version=max')
+        self.vm.add_args('-cpu', 'max', '-m', '1024', '-smp', '4')
+
+        self.append_firmware_blobs()
+
+        # First fetch, decompress (twice) and prepare the disk image
+        # on an NVME device (the kernel only has drivers for that).
+        self.archive_extract(self.ASSET_SYSREADY_IMAGE, format="zip")
+        disk_image_xz = self.scratch_file("systemready_acs_live_image.img.xz")
+        disk_image = self.uncompress(disk_image_xz)
+
+        self.vm.add_args('-device',
+                         'nvme,drive=hd,serial=QEMU_ROOT_SSD')
+        self.vm.add_args('-blockdev',
+                         f'driver=raw,node-name=hd,file.driver=file,file.filename={disk_image}')
+
+        # Tweak grub.cfg default to avoid manually navigating grub
+        grub_cfg = self.scratch_file("grub.cfg")
+        offset = int(check_output(f"sfdisk --json {disk_image} |"
+                                  "jq '.partitiontable.partitions[0].start * 512'",
+                                  shell=True))
+        check_call(["mcopy", "-i", f"{disk_image}@@{offset}",
+                    "::/EFI/BOOT/grub.cfg", grub_cfg])
+
+        with open(grub_cfg, 'a', encoding="utf8") as f:
+            f.write("set default='Linux Execution Enviroment'")
+
+        check_call(["mcopy", "-D", "o",  "-i", f"{disk_image}@@{offset}",
+                    grub_cfg, "::/EFI/BOOT/grub.cfg"])
+
+        # Launch QEMU and wait for grub and select the "Linux
+        # Execution Environment" so we can launch the test.
+
+        self.vm.launch()
+        self.wait_for_console_pattern(self.ROOT_PROMPT)
+        ec_and_wait(self, "/usr/bin/bsa.sh --skip "
+                    "B_REP_1,B_IEP_1,B_PCIe_11,B_MEM_06",
+                    self.ROOT_PROMPT)
+
+        # Now we can shutdown
+        ec_and_wait(self, "halt -f", "reboot: System halted")
+        self.vm.shutdown()
+
+        # and extract the test logs
+        bsa_app_res = self.scratch_file("BsaResultsApp.log")
+        bsa_kern_res = self.scratch_file("BsaResultsKernel.log")
+
+        check_call(["mcopy", "-i", f"{disk_image}@@{offset}",
+                    "::acs_results/Linux/BsaResultsApp.log", bsa_app_res])
+        check_call(["mcopy", "-i", f"{disk_image}@@{offset}",
+                    "::acs_results/Linux/BsaResultsKernel.log", bsa_kern_res])
+
+        # for now just check the kernel log for the result summary
+        test_result_re = re.compile(r"\[.*\]\s+(.+): Result:\s+(\w+)")
+        summary_re = re.compile(r"Total Tests Run =\s*(\d+), Tests Passed =\s*(\d+), Tests Failed =\s*(\d+)")
+
+        with open(bsa_kern_res, 'r', encoding="utf8") as f:
+            for line in f:
+                test_match = test_result_re.search(line)
+                if test_match:
+                    desc = test_match.group(1)
+                    status = test_match.group(2)
+                    self.log.info(f"Test: {desc} status: {status}")
+
+                match = summary_re.search(line)
+                if match:
+                    total, passed, failed = match.groups()
+
+                    if int(failed) > 0:
+                        self.fail(f"{failed} tests failed ({total})")
+
+
 if __name__ == '__main__':
     QemuSystemTest.main()
-- 
2.47.3


