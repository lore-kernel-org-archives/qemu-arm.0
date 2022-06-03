Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5541500lfh;
        Fri, 3 Jun 2022 04:18:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz37DWq89pO8Hj7N5gmgFekw9RaZtmaXb0xmWeHne6tRMmp2mNew7smSmQgSh3l0qXNrTB7
X-Received: by 2002:a17:907:6d15:b0:6fd:d985:889b with SMTP id sa21-20020a1709076d1500b006fdd985889bmr8294072ejc.753.1654255136800;
        Fri, 03 Jun 2022 04:18:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654255136; cv=none;
        d=google.com; s=arc-20160816;
        b=ZAWOk/Zt0h7fwIhRGaPEPerezbgQta95oQoJ2XOEdLo8S/UKGnFV2kn1CjjAHiBKRV
         QPVbwGzKhid13Xulq355LdCGNrPcbzKv/0+jKjGPl14U9Rnhl1FZiUR/rTFWy7rXwC4O
         WtNfu+92t7rZGYUERnHTW6Y4eMxMlTLmCMeRIiOS3tGST4V5ppp1/m51xItWfvV2D5T4
         lyI5ZIewJWXo4+NxJIInVlin1o4eypPQCOKnCKFvNfC6bbzU3GwievnuKkTOGqcfMuLE
         wp5vUBIcnqJD49b44xkTV/FoUXTcmQWp7o9wrj+WIBgVp4OlDldgV0NXdf/b/Wm0sFNz
         O9dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=KrgGtwwePF8sETGt2Mh/1UR9FcfHsk1Wt8hAxX8m0Ck=;
        b=gtEd9fcpiN+m6Zhq627IAMPeEeoG2UZCR6yOfG0VXOqrt+qSxJh/ANXNLRerjlK8Ya
         Anr0rU1wS2RBEr3nvyOnV2L7mowmugE3hG7ClbrfnZ5GuQ89IU2fRjoaGFJeu5SDujVW
         UbcyhDMTXG1ihtqZkkMubKU+HtflBQ0PRUfDFKjTkMzR/t0XSguKl3HW0wn5kADdckbA
         89gIcipuCbP06PpX+Mrbp1MlYjGt7zmjH/z1YVBnf2B+JfxEI7VhEtIdvR4a7qrAKbfz
         BmuhXWnJQ4qY1Ra2dwlAKdb8bPUi8ag0QvJo6iXhf/wvmYA945iSnHoXf6iNLPFx4yKC
         AcVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BNXNPwLi;
       spf=pass (google.com: domain of drjones@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id hq24-20020a1709073f1800b0070fee8ebc61si23548ejc.493.2022.06.03.04.18.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Jun 2022 04:18:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BNXNPwLi;
       spf=pass (google.com: domain of drjones@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654255135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KrgGtwwePF8sETGt2Mh/1UR9FcfHsk1Wt8hAxX8m0Ck=;
	b=BNXNPwLiQdOh3ravvIBsmThpyh+UexAQLHTuoj8njAeBNMSRjBfAgp2BqSj0poPkBpYrFh
	SQiK0ickSi5t2wXW1wM1+xyyZipNWRDXS1J8WHy0if/cvFeV7x7nZ70Zj49FDKAgbC/PrS
	rtcaiu5psqY6tvpbNmx+RBAE3G0mI6E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-SwVrakS_MgiCwrFHaTzpCg-1; Fri, 03 Jun 2022 07:18:52 -0400
X-MC-Unique: SwVrakS_MgiCwrFHaTzpCg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F199811E75;
	Fri,  3 Jun 2022 11:18:52 +0000 (UTC)
Received: from gator.home (unknown [10.40.194.13])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F347210725;
	Fri,  3 Jun 2022 11:18:50 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: f4bug@amsat.org,
	alex.bennee@linaro.org,
	cohuck@redhat.com
Subject: [PATCH v2] tests: Prefer max cpu type when using AArch64 virt machine
Date: Fri,  3 Jun 2022 13:18:49 +0200
Message-Id: <20220603111849.1481100-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-TUID: haUA4tjClKsK

The max cpu type is the best default cpu type for tests to use
when specifying the cpu type for AArch64 mach-virt. Switch all
tests to it.

Cc: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 tests/avocado/boot_xen.py          |  6 +++---
 tests/avocado/replay_kernel.py     |  2 +-
 tests/avocado/reverse_debugging.py |  2 +-
 tests/avocado/tcg_plugins.py       |  6 +++---
 tests/qtest/bios-tables-test.c     | 12 ++++++------
 tests/qtest/machine-none-test.c    |  4 ++--
 tests/vm/aarch64vm.py              |  2 +-
 tests/vm/ubuntu.aarch64            |  2 +-
 8 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/tests/avocado/boot_xen.py b/tests/avocado/boot_xen.py
index fc2faeedb559..899c396bd55c 100644
--- a/tests/avocado/boot_xen.py
+++ b/tests/avocado/boot_xen.py
@@ -66,7 +66,7 @@ def test_arm64_xen_411_and_dom0(self):
         """
         :avocado: tags=arch:aarch64
         :avocado: tags=accel:tcg
-        :avocado: tags=cpu:cortex-a57
+        :avocado: tags=cpu:max
         :avocado: tags=machine:virt
         """
 
@@ -84,7 +84,7 @@ def test_arm64_xen_414_and_dom0(self):
         """
         :avocado: tags=arch:aarch64
         :avocado: tags=accel:tcg
-        :avocado: tags=cpu:cortex-a57
+        :avocado: tags=cpu:max
         :avocado: tags=machine:virt
         """
 
@@ -102,7 +102,7 @@ def test_arm64_xen_415_and_dom0(self):
         """
         :avocado: tags=arch:aarch64
         :avocado: tags=accel:tcg
-        :avocado: tags=cpu:cortex-a57
+        :avocado: tags=cpu:max
         :avocado: tags=machine:virt
         """
 
diff --git a/tests/avocado/replay_kernel.py b/tests/avocado/replay_kernel.py
index 0b2b0dc692b1..c19022ea977d 100644
--- a/tests/avocado/replay_kernel.py
+++ b/tests/avocado/replay_kernel.py
@@ -147,7 +147,7 @@ def test_aarch64_virt(self):
         """
         :avocado: tags=arch:aarch64
         :avocado: tags=machine:virt
-        :avocado: tags=cpu:cortex-a53
+        :avocado: tags=cpu:max
         """
         kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
                       '/linux/releases/29/Everything/aarch64/os/images/pxeboot'
diff --git a/tests/avocado/reverse_debugging.py b/tests/avocado/reverse_debugging.py
index d2921e70c3b4..d6a6d7277235 100644
--- a/tests/avocado/reverse_debugging.py
+++ b/tests/avocado/reverse_debugging.py
@@ -198,7 +198,7 @@ def test_aarch64_virt(self):
         """
         :avocado: tags=arch:aarch64
         :avocado: tags=machine:virt
-        :avocado: tags=cpu:cortex-a53
+        :avocado: tags=cpu:max
         """
         kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
                       '/linux/releases/29/Everything/aarch64/os/images/pxeboot'
diff --git a/tests/avocado/tcg_plugins.py b/tests/avocado/tcg_plugins.py
index 642d2e49e305..2bbf62f5036e 100644
--- a/tests/avocado/tcg_plugins.py
+++ b/tests/avocado/tcg_plugins.py
@@ -68,7 +68,7 @@ def test_aarch64_virt_insn(self):
         :avocado: tags=accel:tcg
         :avocado: tags=arch:aarch64
         :avocado: tags=machine:virt
-        :avocado: tags=cpu:cortex-a53
+        :avocado: tags=cpu:max
         """
         kernel_path = self._grab_aarch64_kernel()
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
@@ -94,7 +94,7 @@ def test_aarch64_virt_insn_icount(self):
         :avocado: tags=accel:tcg
         :avocado: tags=arch:aarch64
         :avocado: tags=machine:virt
-        :avocado: tags=cpu:cortex-a53
+        :avocado: tags=cpu:max
         """
         kernel_path = self._grab_aarch64_kernel()
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
@@ -120,7 +120,7 @@ def test_aarch64_virt_mem_icount(self):
         :avocado: tags=accel:tcg
         :avocado: tags=arch:aarch64
         :avocado: tags=machine:virt
-        :avocado: tags=cpu:cortex-a53
+        :avocado: tags=cpu:max
         """
         kernel_path = self._grab_aarch64_kernel()
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index a4a46e97f0b8..7c3a58a97460 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1270,7 +1270,7 @@ static void test_acpi_virt_tcg_memhp(void)
 
     data.variant = ".memhp";
     test_acpi_one(" -machine nvdimm=on"
-                  " -cpu cortex-a57"
+                  " -cpu max"
                   " -m 256M,slots=3,maxmem=1G"
                   " -object memory-backend-ram,id=ram0,size=128M"
                   " -object memory-backend-ram,id=ram1,size=128M"
@@ -1363,7 +1363,7 @@ static void test_acpi_virt_tcg_numamem(void)
     };
 
     data.variant = ".numamem";
-    test_acpi_one(" -cpu cortex-a57"
+    test_acpi_one(" -cpu max"
                   " -object memory-backend-ram,id=ram0,size=128M"
                   " -numa node,memdev=ram0",
                   &data);
@@ -1397,7 +1397,7 @@ static void test_acpi_virt_tcg_pxb(void)
                   "if=none,media=cdrom,id=drive-scsi0-0-0-1,readonly=on"
                   " -device scsi-cd,bus=scsi0.0,scsi-id=0,"
                   "drive=drive-scsi0-0-0-1,id=scsi0-0-0-1,bootindex=1"
-                  " -cpu cortex-a57"
+                  " -cpu max"
                   " -device pxb-pcie,bus_nr=128",
                   &data);
 
@@ -1511,7 +1511,7 @@ static void test_acpi_virt_tcg(void)
 
     data.smbios_cpu_max_speed = 2900;
     data.smbios_cpu_curr_speed = 2700;
-    test_acpi_one("-cpu cortex-a57 "
+    test_acpi_one("-cpu max "
                   "-smbios type=4,max-speed=2900,current-speed=2700", &data);
     free_test_data(&data);
 }
@@ -1591,7 +1591,7 @@ static void test_acpi_virt_viot(void)
         .scan_len = 128ULL * 1024 * 1024,
     };
 
-    test_acpi_one("-cpu cortex-a57 "
+    test_acpi_one("-cpu max "
                   "-device virtio-iommu-pci", &data);
     free_test_data(&data);
 }
@@ -1699,7 +1699,7 @@ static void test_acpi_oem_fields_virt(void)
     char *args;
 
     args = test_acpi_create_args(&data,
-                                 "-cpu cortex-a57 "OEM_TEST_ARGS, true);
+                                 "-cpu max "OEM_TEST_ARGS, true);
     data.qts = qtest_init(args);
     test_acpi_load_tables(&data, true);
     test_oem_fields(&data);
diff --git a/tests/qtest/machine-none-test.c b/tests/qtest/machine-none-test.c
index d0f8cd990245..d47533a835b7 100644
--- a/tests/qtest/machine-none-test.c
+++ b/tests/qtest/machine-none-test.c
@@ -24,8 +24,8 @@ struct arch2cpu {
 
 static struct arch2cpu cpus_map[] = {
     /* tested targets list */
-    { "arm", "cortex-a15" },
-    { "aarch64", "cortex-a57" },
+    { "arm", "max" },
+    { "aarch64", "max" },
     { "avr", "avr6-avr-cpu" },
     { "x86_64", "qemu64,apic-id=0" },
     { "i386", "qemu32,apic-id=0" },
diff --git a/tests/vm/aarch64vm.py b/tests/vm/aarch64vm.py
index b00cce07eb81..a82b4dd7a91a 100644
--- a/tests/vm/aarch64vm.py
+++ b/tests/vm/aarch64vm.py
@@ -31,7 +31,7 @@
 # parameters that works for backwards compatibility.
 DEFAULT_CONFIG = {'kvm' : {'cpu'          : "host",
                            'machine'      : "virt,gic-version=host"},
-                  'tcg' : {'cpu'          : "cortex-a57",
+                  'tcg' : {'cpu'          : "max",
                            'machine'      : "virt"},
 }
 
diff --git a/tests/vm/ubuntu.aarch64 b/tests/vm/ubuntu.aarch64
index b291945a7e9d..e2958ccd2a44 100755
--- a/tests/vm/ubuntu.aarch64
+++ b/tests/vm/ubuntu.aarch64
@@ -18,7 +18,7 @@ import aarch64vm
 import ubuntuvm
 
 DEFAULT_CONFIG = {
-    'cpu'          : "cortex-a57",
+    'cpu'          : "max",
     'machine'      : "virt,gic-version=3",
     'install_cmds' : "apt-get update,"\
                      "apt-get build-dep -y --arch-only qemu,"\
-- 
2.34.3
