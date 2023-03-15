Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id o19-20020a05600c059300b003eb68bb61c8sm2680607wmd.3.2023.03.15.10.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 10:49:19 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 62FEE1FFC1;
	Wed, 15 Mar 2023 17:43:32 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-riscv@nongnu.org,
	Riku Voipio <riku.voipio@iki.fi>,
	Igor Mammedov <imammedo@redhat.com>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Hao Wu <wuhaotsh@google.com>,
	Cleber Rosa <crosa@redhat.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Jan Kiszka <jan.kiszka@web.de>,
	Aurelien Jarno <aurelien@aurel32.net>,
	qemu-arm@nongnu.org,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	qemu-ppc@nongnu.org,
	Juan Quintela <quintela@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Darren Kenny <darren.kenny@oracle.com>,
	kvm@vger.kernel.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Stafford Horne <shorne@gmail.com>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Thomas Huth <huth@tuxfamily.org>,
	Vijai Kumar K <vijai@behindbytes.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Song Gao <gaosong@loongson.cn>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	Greg Kurz <groug@kaod.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Alexander Bulekov <alxndr@bu.edu>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	qemu-block@nongnu.org,
	Yanan Wang <wangyanan55@huawei.com>,
	David Woodhouse <dwmw2@infradead.org>,
	qemu-s390x@nongnu.org,
	Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
	Bandan Das <bsd@redhat.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Tyrone Ting <kfting@nuvoton.com>,
	Kevin Wolf <kwolf@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Beniamino Galvani <b.galvani@gmail.com>,
	Paul Durrant <paul@xen.org>,
	Bin Meng <bin.meng@windriver.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH v2 10/32] tests/avocado: don't use tags to define drive
Date: Wed, 15 Mar 2023 17:43:09 +0000
Message-Id: <20230315174331.2959-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315174331.2959-1-alex.bennee@linaro.org>
References: <20230315174331.2959-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: j5F7eyNucngF

We are abusing the avocado tags which are intended to provide test
selection metadata to provide parameters to our test. This works OK up
until the point you need to have ,'s in the field as this is the tag
separator character which is the case for a number of the drive
parameters. Fix this by making drive a parameter to the common helper
function.

Fixes: 267fe57c23 (tests: add tuxrun baseline test to avocado)
Message-Id: <20230310103123.2118519-12-alex.bennee@linaro.org>
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/avocado/tuxrun_baselines.py | 60 +++++++++++++------------------
 1 file changed, 24 insertions(+), 36 deletions(-)

diff --git a/tests/avocado/tuxrun_baselines.py b/tests/avocado/tuxrun_baselines.py
index 30aaefc1d3..c3fb67f5dc 100644
--- a/tests/avocado/tuxrun_baselines.py
+++ b/tests/avocado/tuxrun_baselines.py
@@ -67,9 +67,6 @@ def setUp(self):
         # The name of the kernel Image file
         self.image = self.get_tag('image', "Image")
 
-        # The block device drive type
-        self.drive = self.get_tag('drive', "virtio-blk-device")
-
         self.root = self.get_tag('root', "vda")
 
         # Occasionally we need extra devices to hook things up
@@ -99,7 +96,7 @@ def fetch_tuxrun_assets(self, dt=None):
 
         return (kernel_image, self.workdir + "/rootfs.ext4", dtb)
 
-    def prepare_run(self, kernel, disk, dtb=None, console_index=0):
+    def prepare_run(self, kernel, disk, drive, dtb=None, console_index=0):
         """
         Setup to run and add the common parameters to the system
         """
@@ -121,10 +118,8 @@ def prepare_run(self, kernel, disk, dtb=None, console_index=0):
         if self.extradev:
             self.vm.add_args('-device', self.extradev)
 
-        # Some machines already define a drive device
-        if self.drive != "none":
-            self.vm.add_args('-device',
-                             f"{self.drive},drive=hd0")
+        self.vm.add_args('-device',
+                         f"{drive},drive=hd0")
 
         # Some machines need an explicit DTB
         if dtb:
@@ -154,7 +149,9 @@ def run_tuxtest_tests(self, haltmsg):
         else:
             self.vm.wait()
 
-    def common_tuxrun(self, dt=None, haltmsg="reboot: System halted",
+    def common_tuxrun(self, dt=None,
+                      drive="virtio-blk-device",
+                      haltmsg="reboot: System halted",
                       console_index=0):
         """
         Common path for LKFT tests. Unless we need to do something
@@ -163,7 +160,7 @@ def common_tuxrun(self, dt=None, haltmsg="reboot: System halted",
         """
         (kernel, disk, dtb) = self.fetch_tuxrun_assets(dt)
 
-        self.prepare_run(kernel, disk, dtb, console_index)
+        self.prepare_run(kernel, disk, drive, dtb, console_index)
         self.vm.launch()
         self.run_tuxtest_tests(haltmsg)
 
@@ -206,11 +203,11 @@ def test_armv5(self):
         :avocado: tags=machine:versatilepb
         :avocado: tags=tuxboot:armv5
         :avocado: tags=image:zImage
-        :avocado: tags=drive:virtio-blk-pci
         :avocado: tags=console:ttyAMA0
         :avocado: tags=shutdown:nowait
         """
-        self.common_tuxrun(dt="versatile-pb.dtb")
+        self.common_tuxrun(drive="virtio-blk-pci",
+                           dt="versatile-pb.dtb")
 
     def test_armv7(self):
         """
@@ -244,10 +241,9 @@ def test_i386(self):
         :avocado: tags=machine:q35
         :avocado: tags=tuxboot:i386
         :avocado: tags=image:bzImage
-        :avocado: tags=drive:virtio-blk-pci
         :avocado: tags=shutdown:nowait
         """
-        self.common_tuxrun()
+        self.common_tuxrun(drive="virtio-blk-pci")
 
     def test_mips32(self):
         """
@@ -257,11 +253,10 @@ def test_mips32(self):
         :avocado: tags=endian:big
         :avocado: tags=tuxboot:mips32
         :avocado: tags=image:vmlinux
-        :avocado: tags=drive:driver=ide-hd,bus=ide.0,unit=0
         :avocado: tags=root:sda
         :avocado: tags=shutdown:nowait
         """
-        self.common_tuxrun()
+        self.common_tuxrun(drive="driver=ide-hd,bus=ide.0,unit=0")
 
     def test_mips32el(self):
         """
@@ -270,11 +265,10 @@ def test_mips32el(self):
         :avocado: tags=cpu:mips32r6-generic
         :avocado: tags=tuxboot:mips32el
         :avocado: tags=image:vmlinux
-        :avocado: tags=drive:driver=ide-hd,bus=ide.0,unit=0
         :avocado: tags=root:sda
         :avocado: tags=shutdown:nowait
         """
-        self.common_tuxrun()
+        self.common_tuxrun(drive="driver=ide-hd,bus=ide.0,unit=0")
 
     @skip("QEMU currently broken") # regression against stable QEMU
     def test_mips64(self):
@@ -284,11 +278,10 @@ def test_mips64(self):
         :avocado: tags=tuxboot:mips64
         :avocado: tags=endian:big
         :avocado: tags=image:vmlinux
-        :avocado: tags=drive:driver=ide-hd,bus=ide.0,unit=0
         :avocado: tags=root:sda
         :avocado: tags=shutdown:nowait
         """
-        self.common_tuxrun()
+        self.common_tuxrun(drive="driver=ide-hd,bus=ide.0,unit=0")
 
     def test_mips64el(self):
         """
@@ -296,11 +289,10 @@ def test_mips64el(self):
         :avocado: tags=machine:malta
         :avocado: tags=tuxboot:mips64el
         :avocado: tags=image:vmlinux
-        :avocado: tags=drive:driver=ide-hd,bus=ide.0,unit=0
         :avocado: tags=root:sda
         :avocado: tags=shutdown:nowait
         """
-        self.common_tuxrun()
+        self.common_tuxrun(drive="driver=ide-hd,bus=ide.0,unit=0")
 
     def test_ppc32(self):
         """
@@ -309,10 +301,9 @@ def test_ppc32(self):
         :avocado: tags=cpu:e500mc
         :avocado: tags=tuxboot:ppc32
         :avocado: tags=image:uImage
-        :avocado: tags=drive:virtio-blk-pci
         :avocado: tags=shutdown:nowait
         """
-        self.common_tuxrun()
+        self.common_tuxrun(drive="virtio-blk-pci")
 
     def test_ppc64(self):
         """
@@ -324,10 +315,9 @@ def test_ppc64(self):
         :avocado: tags=tuxboot:ppc64
         :avocado: tags=image:vmlinux
         :avocado: tags=extradev:driver=spapr-vscsi
-        :avocado: tags=drive:scsi-hd
         :avocado: tags=root:sda
         """
-        self.common_tuxrun()
+        self.common_tuxrun(drive="scsi-hd")
 
     def test_ppc64le(self):
         """
@@ -338,10 +328,9 @@ def test_ppc64le(self):
         :avocado: tags=tuxboot:ppc64le
         :avocado: tags=image:vmlinux
         :avocado: tags=extradev:driver=spapr-vscsi
-        :avocado: tags=drive:scsi-hd
         :avocado: tags=root:sda
         """
-        self.common_tuxrun()
+        self.common_tuxrun(drive="scsi-hd")
 
     def test_riscv32(self):
         """
@@ -365,10 +354,10 @@ def test_s390(self):
         :avocado: tags=endian:big
         :avocado: tags=tuxboot:s390
         :avocado: tags=image:bzImage
-        :avocado: tags=drive:virtio-blk-ccw
         :avocado: tags=shutdown:nowait
         """
-        self.common_tuxrun(haltmsg="Requesting system halt")
+        self.common_tuxrun(drive="virtio-blk-ccw",
+                           haltmsg="Requesting system halt")
 
     # Note: some segfaults caused by unaligned userspace access
     @skipIf(os.getenv('GITLAB_CI'), 'Skipping unstable test on GitLab')
@@ -380,7 +369,6 @@ def test_sh4(self):
         :avocado: tags=tuxboot:sh4
         :avocado: tags=image:zImage
         :avocado: tags=root:sda
-        :avocado: tags=drive:driver=ide-hd,bus=ide.0,unit=0
         :avocado: tags=console:ttySC1
         """
         # The test is currently too unstable to do much in userspace
@@ -388,7 +376,9 @@ def test_sh4(self):
         (kernel, disk, dtb) = self.fetch_tuxrun_assets()
 
         # the console comes on the second serial port
-        self.prepare_run(kernel, disk, console_index=1)
+        self.prepare_run(kernel, disk,
+                         "driver=ide-hd,bus=ide.0,unit=0",
+                         console_index=1)
         self.vm.launch()
 
         self.wait_for_console_pattern("Welcome to TuxTest")
@@ -404,10 +394,9 @@ def test_sparc64(self):
         :avocado: tags=tuxboot:sparc64
         :avocado: tags=image:vmlinux
         :avocado: tags=root:sda
-        :avocado: tags=drive:driver=ide-hd,bus=ide.0,unit=0
         :avocado: tags=shutdown:nowait
         """
-        self.common_tuxrun()
+        self.common_tuxrun(drive="driver=ide-hd,bus=ide.0,unit=0")
 
     def test_x86_64(self):
         """
@@ -417,7 +406,6 @@ def test_x86_64(self):
         :avocado: tags=tuxboot:x86_64
         :avocado: tags=image:bzImage
         :avocado: tags=root:sda
-        :avocado: tags=drive:driver=ide-hd,bus=ide.0,unit=0
         :avocado: tags=shutdown:nowait
         """
-        self.common_tuxrun()
+        self.common_tuxrun(drive="driver=ide-hd,bus=ide.0,unit=0")
-- 
2.39.2
