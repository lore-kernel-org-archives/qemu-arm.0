Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id j7-20020a5d4527000000b00332fda15056sm4387336wra.110.2023.12.01.07.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 07:12:31 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 782DF5FB6B;
	Fri,  1 Dec 2023 15:12:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Joel Stanley <joel@jms.id.au>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eric Auger <eric.auger@redhat.com>,
	qemu-arm@nongnu.org (open list:ASPEED BMCs),
	qemu-s390x@nongnu.org (open list:S390 Virtio-ccw)
Subject: [PULL 6/6] gitlab: add optional job to run flaky avocado tests
Date: Fri,  1 Dec 2023 15:12:28 +0000
Message-Id: <20231201151228.2610209-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231201151228.2610209-1-alex.bennee@linaro.org>
References: <20231201151228.2610209-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 3Fa/IySLWIBA

One problem with flaky tests is they often only fail under CI
conditions which makes it hard to debug. We add an optional allow_fail
job so developers can trigger the only the flaky tests in the CI
environment if they are debugging.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20231201093633.2551497-8-alex.bennee@linaro.org>

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 76465b8f3d..bd132306c1 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -1387,16 +1387,17 @@ the code snippet below:
   def test(self):
       do_something()
 
-Tests should not live in this state forever and should either be fixed
-or eventually removed.
-
-To run such tests locally you will need to set the environment
-variable. For example:
+You can also add ``:avocado: tags=flaky`` to the test meta-data so
+only the flaky tests can be run as a group:
 
 .. code::
 
-   env QEMU_TEST_FLAKY_TESTS=1 ./pyvenv/bin/avocado run \
-      tests/avocado/boot_linux.py:BootLinuxPPC64.test_pseries_tcg
+   env QEMU_TEST_FLAKY_TESTS=1 ./pyvenv/bin/avocado \
+      run tests/avocado -filter-by-tags=flaky
+
+Tests should not live in this state forever and should either be fixed
+or eventually removed.
+
 
 Uninstalling Avocado
 ~~~~~~~~~~~~~~~~~~~~
diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 62b5379a5e..91663946de 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -217,6 +217,36 @@ avocado-system-opensuse:
     MAKE_CHECK_ARGS: check-avocado
     AVOCADO_TAGS: arch:s390x arch:x86_64 arch:aarch64
 
+#
+# Flaky tests. We don't run these by default and they are allow fail
+# but often the CI system is the only way to trigger the failures.
+#
+
+build-system-flaky:
+  extends:
+    - .native_build_job_template
+    - .native_build_artifact_template
+  needs:
+    job: amd64-debian-container
+  variables:
+    IMAGE: debian
+    QEMU_JOB_OPTIONAL: 1
+    TARGETS: aarch64-softmmu arm-softmmu mips64el-softmmu
+      ppc64-softmmu rx-softmmu s390x-softmmu sh4-softmmu x86_64-softmmu
+    MAKE_CHECK_ARGS: check-build
+
+avocado-system-flaky:
+  extends: .avocado_test_job_template
+  needs:
+    - job: build-system-flaky
+      artifacts: true
+  allow_failure: true
+  variables:
+    IMAGE: debian
+    MAKE_CHECK_ARGS: check-avocado
+    QEMU_JOB_OPTIONAL: 1
+    QEMU_TEST_FLAKY_TESTS: 1
+    AVOCADO_TAGS: flaky
 
 # This jobs explicitly disable TCG (--disable-tcg), KVM is detected by
 # the configure script. The container doesn't contain Xen headers so
diff --git a/tests/avocado/boot_linux.py b/tests/avocado/boot_linux.py
index 9e9773e6e1..7c4769904e 100644
--- a/tests/avocado/boot_linux.py
+++ b/tests/avocado/boot_linux.py
@@ -99,6 +99,7 @@ def test_pseries_tcg(self):
         """
         :avocado: tags=machine:pseries
         :avocado: tags=accel:tcg
+        :avocado: tags=flaky
         """
         self.require_accelerator("tcg")
         self.vm.add_args("-accel", "tcg")
@@ -118,6 +119,7 @@ def test_s390_ccw_virtio_tcg(self):
         """
         :avocado: tags=machine:s390-ccw-virtio
         :avocado: tags=accel:tcg
+        :avocado: tags=flaky
         """
         self.require_accelerator("tcg")
         self.vm.add_args("-accel", "tcg")
diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index ba2f99b53a..7487337f46 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -1384,6 +1384,7 @@ def test_sh4_r2d(self):
         """
         :avocado: tags=arch:sh4
         :avocado: tags=machine:r2d
+        :avocado: tags=flaky
         """
         tar_hash = 'fe06a4fd8ccbf2e27928d64472939d47829d4c7e'
         self.vm.add_args('-append', 'console=ttySC1')
diff --git a/tests/avocado/intel_iommu.py b/tests/avocado/intel_iommu.py
index 2dd11a6346..f04ee1cf9d 100644
--- a/tests/avocado/intel_iommu.py
+++ b/tests/avocado/intel_iommu.py
@@ -22,6 +22,7 @@ class IntelIOMMU(LinuxTest):
     :avocado: tags=machine:q35
     :avocado: tags=accel:kvm
     :avocado: tags=intel_iommu
+    :avocado: tags=flaky
     """
 
     IOMMU_ADDON = ',iommu_platform=on,disable-modern=off,disable-legacy=on'
diff --git a/tests/avocado/linux_initrd.py b/tests/avocado/linux_initrd.py
index c40a987bd1..aad5b19bd9 100644
--- a/tests/avocado/linux_initrd.py
+++ b/tests/avocado/linux_initrd.py
@@ -57,6 +57,8 @@ def test_with_2gib_file_should_exit_error_msg_with_linux_v3_6(self):
 
     def test_with_2gib_file_should_work_with_linux_v4_16(self):
         """
+        :avocado: tags=flaky
+
         QEMU has supported up to 4 GiB initrd for recent kernel
         Expect guest can reach 'Unpacking initramfs...'
         """
diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index 258fb50c47..6fa5459a07 100644
--- a/tests/avocado/machine_aspeed.py
+++ b/tests/avocado/machine_aspeed.py
@@ -317,6 +317,7 @@ def test_arm_ast2500_evb_sdk(self):
         """
         :avocado: tags=arch:arm
         :avocado: tags=machine:ast2500-evb
+        :avocado: tags=flaky
         """
 
         image_url = ('https://github.com/AspeedTech-BMC/openbmc/releases/'
@@ -336,6 +337,7 @@ def test_arm_ast2600_evb_sdk(self):
         """
         :avocado: tags=arch:arm
         :avocado: tags=machine:ast2600-evb
+        :avocado: tags=flaky
         """
 
         image_url = ('https://github.com/AspeedTech-BMC/openbmc/releases/'
diff --git a/tests/avocado/machine_mips_malta.py b/tests/avocado/machine_mips_malta.py
index 959dcf5602..99bee49e9a 100644
--- a/tests/avocado/machine_mips_malta.py
+++ b/tests/avocado/machine_mips_malta.py
@@ -109,6 +109,7 @@ def test_mips_malta_i6400_framebuffer_logo_7cores(self):
         :avocado: tags=machine:malta
         :avocado: tags=cpu:I6400
         :avocado: tags=mips:smp
+        :avocado: tags=flaky
         """
         self.do_test_i6400_framebuffer_logo(7)
 
@@ -120,6 +121,7 @@ def test_mips_malta_i6400_framebuffer_logo_8cores(self):
         :avocado: tags=machine:malta
         :avocado: tags=cpu:I6400
         :avocado: tags=mips:smp
+        :avocado: tags=flaky
         """
         self.do_test_i6400_framebuffer_logo(8)
 
diff --git a/tests/avocado/machine_rx_gdbsim.py b/tests/avocado/machine_rx_gdbsim.py
index 350a73fbbb..412a7a5089 100644
--- a/tests/avocado/machine_rx_gdbsim.py
+++ b/tests/avocado/machine_rx_gdbsim.py
@@ -31,6 +31,7 @@ def test_uboot(self):
         :avocado: tags=arch:rx
         :avocado: tags=machine:gdbsim-r5f562n8
         :avocado: tags=endian:little
+        :avocado: tags=flaky
         """
         uboot_url = ('https://acc.dl.osdn.jp/users/23/23888/u-boot.bin.gz')
         uboot_hash = '9b78dbd43b40b2526848c0b1ce9de02c24f4dcdb'
@@ -56,6 +57,7 @@ def test_linux_sash(self):
         :avocado: tags=arch:rx
         :avocado: tags=machine:gdbsim-r5f562n7
         :avocado: tags=endian:little
+        :avocado: tags=flaky
         """
         dtb_url = ('https://acc.dl.osdn.jp/users/23/23887/rx-virt.dtb')
         dtb_hash = '7b4e4e2c71905da44e86ce47adee2210b026ac18'
diff --git a/tests/avocado/machine_s390_ccw_virtio.py b/tests/avocado/machine_s390_ccw_virtio.py
index 61e75d8f9e..26e938c9e9 100644
--- a/tests/avocado/machine_s390_ccw_virtio.py
+++ b/tests/avocado/machine_s390_ccw_virtio.py
@@ -167,6 +167,7 @@ def test_s390x_fedora(self):
         :avocado: tags=device:virtio-gpu
         :avocado: tags=device:virtio-crypto
         :avocado: tags=device:virtio-net
+        :avocado: tags=flaky
         """
 
         kernel_url = ('https://archives.fedoraproject.org/pub/archive'
diff --git a/tests/avocado/replay_kernel.py b/tests/avocado/replay_kernel.py
index 0d32cc280e..af086eab08 100644
--- a/tests/avocado/replay_kernel.py
+++ b/tests/avocado/replay_kernel.py
@@ -88,6 +88,7 @@ def test_x86_64_pc(self):
         """
         :avocado: tags=arch:x86_64
         :avocado: tags=machine:pc
+        :avocado: tags=flaky
         """
         kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
                       '/linux/releases/29/Everything/x86_64/os/images/pxeboot'
@@ -186,6 +187,7 @@ def test_arm_cubieboard_initrd(self):
         """
         :avocado: tags=arch:arm
         :avocado: tags=machine:cubieboard
+        :avocado: tags=flaky
         """
         deb_url = ('https://apt.armbian.com/pool/main/l/'
                    'linux-5.10.16-sunxi/linux-image-current-sunxi_21.02.2_armhf.deb')
diff --git a/tests/avocado/reverse_debugging.py b/tests/avocado/reverse_debugging.py
index 9a468321e5..4cce5a5598 100644
--- a/tests/avocado/reverse_debugging.py
+++ b/tests/avocado/reverse_debugging.py
@@ -255,6 +255,7 @@ def test_ppc64_pseries(self):
         """
         :avocado: tags=arch:ppc64
         :avocado: tags=machine:pseries
+        :avocado: tags=flaky
         """
         # SLOF branches back to its entry point, which causes this test
         # to take the 'hit a breakpoint again' path. That's not a problem,
@@ -269,6 +270,7 @@ def test_ppc64_powernv(self):
         """
         :avocado: tags=arch:ppc64
         :avocado: tags=machine:powernv
+        :avocado: tags=flaky
         """
         self.endian_is_le = False
         self.reverse_debugging()
diff --git a/tests/avocado/smmu.py b/tests/avocado/smmu.py
index 05b34418a5..21ff030ca7 100644
--- a/tests/avocado/smmu.py
+++ b/tests/avocado/smmu.py
@@ -22,6 +22,7 @@ class SMMU(LinuxTest):
     :avocado: tags=machine:virt
     :avocado: tags=distro:fedora
     :avocado: tags=smmu
+    :avocado: tags=flaky
     """
 
     IOMMU_ADDON = ',iommu_platform=on,disable-modern=off,disable-legacy=on'
diff --git a/tests/avocado/tuxrun_baselines.py b/tests/avocado/tuxrun_baselines.py
index 5f859f4e6f..a936a3b780 100644
--- a/tests/avocado/tuxrun_baselines.py
+++ b/tests/avocado/tuxrun_baselines.py
@@ -561,6 +561,7 @@ def test_sh4(self):
         :avocado: tags=image:zImage
         :avocado: tags=root:sda
         :avocado: tags=console:ttySC1
+        :avocado: tags=flaky
         """
         sums = { "rootfs.ext4.zst" :
                  "3592a7a3d5a641e8b9821449e77bc43c9904a56c30d45da0694349cfd86743fd",
-- 
2.39.2
