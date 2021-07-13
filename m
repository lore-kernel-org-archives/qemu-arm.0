Received: by 2002:a0c:fe44:0:0:0:0:0 with SMTP id u4csp1027597qvs;
        Tue, 13 Jul 2021 14:21:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBTKvKK8GzXPzhadc0sAcLT8oZAVlthWAjDWASIL+ceT9H4Lek2ym4ziCshN9lLY0Mq5Sq
X-Received: by 2002:a17:906:3948:: with SMTP id g8mr7862631eje.282.1626211303079;
        Tue, 13 Jul 2021 14:21:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626211303; cv=none;
        d=google.com; s=arc-20160816;
        b=ci3ZORdm1Qtwe0R5GWHfoxn2pFfJM1bCU/ax0e/VZzO4PYjBBQt9e8em6HQLf5B+F2
         QsZiEG7bu8pjwwCcJ6GWu/aKYxE++MiruLGgDlbN0fewvqyRWwLD5tUW4f0tRADde0ny
         gRT18mpvjQMqsDZTkpUrE52AZVhpNvzqBKZjzf0EdAEjlYHojSqHFKGyoJBEcGwRFqZ5
         aKHYsom9VlXgMFv5OJli4IdScDXFdLYwZEeKtkjx6yFp3ERbcXxiJLfJujcXGSK0XX3l
         HR5B/pJKCnqXHuLanvGOfrHSFufLnxiPn0gTce2V7kS1CgP9Ci15Ym5hgk3rpl7AEb/q
         fbTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=jIPqrucXgCQLRwS3ADnW9VQVQAYQkQWhk23O+X1mY7w=;
        b=Xx456i33WBC7iaR2KCVLAhcrb04LT5oe5Y4S/7DnDr92yENIm8g0snpQGkgB37ec+d
         APAg00M8G55uJZCCVEQPHcRtM7bRbx/JOMfk8wW3CiJHCPcGoBe9IdYT2k5jDE9oDb4Z
         9cIHaVQMg90keMeczZZJjVuP1HiyDUb93AF0N0p/XJ7UrTVdAfN81FN7D810CBnRv+Vs
         eq+vwiv1qXD234zre9X3wqlHBcnF9TJdJ1iRKVmMm0widUmiDDO0GZPhuwnoq1ftawV0
         KG5Tl9pLnjTkdmRFPNKViYp5lm4qmD3DQnXztcVQtfmRgo/Lsw/V8Tp1MrP3NjzO17R9
         fUuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QUqhxcgP;
       spf=pass (google.com: domain of crosa@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id 13si21614949ejg.731.2021.07.13.14.21.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Jul 2021 14:21:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QUqhxcgP;
       spf=pass (google.com: domain of crosa@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626211302;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jIPqrucXgCQLRwS3ADnW9VQVQAYQkQWhk23O+X1mY7w=;
	b=QUqhxcgPqpnMTPUlQRXJ9XosCWXgZenl9l0kKgWKcd6PpUnxq8fI+gs27M1kkZ4h2UT0/6
	OZKhQQgLE8cWczDwpxCrZt5wOraQps4JOJDFFEe/c189klVvnQFNOoAGu2f+t03ZzlApcJ
	MAPlrt7N7KI8OVUI5YxPTAX4DGXG7XQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-PV9AiBsxPZG7R1dC6e0p4A-1; Tue, 13 Jul 2021 17:21:39 -0400
X-MC-Unique: PV9AiBsxPZG7R1dC6e0p4A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0936802C80;
	Tue, 13 Jul 2021 21:21:36 +0000 (UTC)
Received: from p50.localhost.net (ovpn-117-22.rdu2.redhat.com [10.10.117.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F0DD19C44;
	Tue, 13 Jul 2021 21:21:34 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Ryo ONODERA <ryoon@netbsd.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Willian Rampazzo <willianr@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	John Snow <jsnow@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Willian Rampazzo <wrampazz@redhat.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Beraldo Leal <bleal@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	qemu-arm@nongnu.org,
	Eric Auger <eric.auger@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-ppc@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	Thomas Huth <thuth@redhat.com>,
	Kamil Rytarowski <kamil@netbsd.org>,
	Cleber Rosa <crosa@redhat.com>
Subject: [PULL 15/23] tests/acceptance: Let the framework handle "cpu:VALUE" tagged tests
Date: Tue, 13 Jul 2021 17:19:15 -0400
Message-Id: <20210713211923.3809241-16-crosa@redhat.com>
In-Reply-To: <20210713211923.3809241-1-crosa@redhat.com>
References: <20210713211923.3809241-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
X-TUID: qM4yHlwlqnQm

From: Wainer dos Santos Moschetta <wainersm@redhat.com>

The tests that are already tagged with "cpu:VALUE" don't need to add
"-cpu VALUE" to the list of arguments of the vm object because the avocado_qemu
framework is able to handle it automatically.

Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20210430133414.39905-4-wainersm@redhat.com>
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/boot_linux.py         | 3 ---
 tests/acceptance/boot_xen.py           | 1 -
 tests/acceptance/machine_mips_malta.py | 1 -
 tests/acceptance/replay_kernel.py      | 8 +++-----
 tests/acceptance/reverse_debugging.py  | 2 +-
 tests/acceptance/tcg_plugins.py        | 9 ++++-----
 6 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/tests/acceptance/boot_linux.py b/tests/acceptance/boot_linux.py
index 34c4366366..ab19146d1e 100644
--- a/tests/acceptance/boot_linux.py
+++ b/tests/acceptance/boot_linux.py
@@ -79,7 +79,6 @@ def test_virt_tcg_gicv2(self):
         """
         self.require_accelerator("tcg")
         self.vm.add_args("-accel", "tcg")
-        self.vm.add_args("-cpu", "max")
         self.vm.add_args("-machine", "virt,gic-version=2")
         self.add_common_args()
         self.launch_and_wait(set_up_ssh_connection=False)
@@ -92,7 +91,6 @@ def test_virt_tcg_gicv3(self):
         """
         self.require_accelerator("tcg")
         self.vm.add_args("-accel", "tcg")
-        self.vm.add_args("-cpu", "max")
         self.vm.add_args("-machine", "virt,gic-version=3")
         self.add_common_args()
         self.launch_and_wait(set_up_ssh_connection=False)
@@ -104,7 +102,6 @@ def test_virt_kvm(self):
         """
         self.require_accelerator("kvm")
         self.vm.add_args("-accel", "kvm")
-        self.vm.add_args("-cpu", "host")
         self.vm.add_args("-machine", "virt,gic-version=host")
         self.add_common_args()
         self.launch_and_wait(set_up_ssh_connection=False)
diff --git a/tests/acceptance/boot_xen.py b/tests/acceptance/boot_xen.py
index 75c2d44492..3479b5233b 100644
--- a/tests/acceptance/boot_xen.py
+++ b/tests/acceptance/boot_xen.py
@@ -48,7 +48,6 @@ def launch_xen(self, xen_path):
 
         xen_command_line = self.XEN_COMMON_COMMAND_LINE
         self.vm.add_args('-machine', 'virtualization=on',
-                         '-cpu', 'cortex-a57',
                          '-m', '768',
                          '-kernel', xen_path,
                          '-append', xen_command_line,
diff --git a/tests/acceptance/machine_mips_malta.py b/tests/acceptance/machine_mips_malta.py
index b1fd075f51..b67d8cb141 100644
--- a/tests/acceptance/machine_mips_malta.py
+++ b/tests/acceptance/machine_mips_malta.py
@@ -62,7 +62,6 @@ def do_test_i6400_framebuffer_logo(self, cpu_cores_count):
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
                                'clocksource=GIC console=tty0 console=ttyS0')
         self.vm.add_args('-kernel', kernel_path,
-                         '-cpu', 'I6400',
                          '-smp', '%u' % cpu_cores_count,
                          '-vga', 'std',
                          '-append', kernel_command_line)
diff --git a/tests/acceptance/replay_kernel.py b/tests/acceptance/replay_kernel.py
index 71facdaa75..75f80506c1 100644
--- a/tests/acceptance/replay_kernel.py
+++ b/tests/acceptance/replay_kernel.py
@@ -156,8 +156,7 @@ def test_aarch64_virt(self):
                                'console=ttyAMA0')
         console_pattern = 'VFS: Cannot open root device'
 
-        self.run_rr(kernel_path, kernel_command_line, console_pattern,
-                    args=('-cpu', 'cortex-a53'))
+        self.run_rr(kernel_path, kernel_command_line, console_pattern)
 
     def test_arm_virt(self):
         """
@@ -301,7 +300,7 @@ def test_ppc64_e500(self):
         tar_url = ('https://www.qemu-advent-calendar.org'
                    '/2018/download/day19.tar.xz')
         file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
-        self.do_test_advcal_2018(file_path, 'uImage', ('-cpu', 'e5500'))
+        self.do_test_advcal_2018(file_path, 'uImage')
 
     def test_ppc_g3beige(self):
         """
@@ -348,8 +347,7 @@ def test_xtensa_lx60(self):
         tar_url = ('https://www.qemu-advent-calendar.org'
                    '/2018/download/day02.tar.xz')
         file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
-        self.do_test_advcal_2018(file_path, 'santas-sleigh-ride.elf',
-                                 args=('-cpu', 'dc233c'))
+        self.do_test_advcal_2018(file_path, 'santas-sleigh-ride.elf')
 
 @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout')
 class ReplayKernelSlow(ReplayKernelBase):
diff --git a/tests/acceptance/reverse_debugging.py b/tests/acceptance/reverse_debugging.py
index be01aca217..d2921e70c3 100644
--- a/tests/acceptance/reverse_debugging.py
+++ b/tests/acceptance/reverse_debugging.py
@@ -207,4 +207,4 @@ def test_aarch64_virt(self):
         kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
 
         self.reverse_debugging(
-            args=('-kernel', kernel_path, '-cpu', 'cortex-a53'))
+            args=('-kernel', kernel_path))
diff --git a/tests/acceptance/tcg_plugins.py b/tests/acceptance/tcg_plugins.py
index aa6e18b62d..9ca1515c3b 100644
--- a/tests/acceptance/tcg_plugins.py
+++ b/tests/acceptance/tcg_plugins.py
@@ -25,7 +25,7 @@ class PluginKernelBase(LinuxKernelTest):
     KERNEL_COMMON_COMMAND_LINE = 'printk.time=1 panic=-1 '
 
     def run_vm(self, kernel_path, kernel_command_line,
-               plugin, plugin_log, console_pattern, args):
+               plugin, plugin_log, console_pattern, args=None):
 
         vm = self.get_vm()
         vm.set_console()
@@ -80,8 +80,7 @@ def test_aarch64_virt_insn(self):
 
         self.run_vm(kernel_path, kernel_command_line,
                     "tests/plugin/libinsn.so", plugin_log.name,
-                    console_pattern,
-                    args=('-cpu', 'cortex-a53'))
+                    console_pattern)
 
         with plugin_log as lf, \
              mmap.mmap(lf.fileno(), 0, access=mmap.ACCESS_READ) as s:
@@ -108,7 +107,7 @@ def test_aarch64_virt_insn_icount(self):
         self.run_vm(kernel_path, kernel_command_line,
                     "tests/plugin/libinsn.so", plugin_log.name,
                     console_pattern,
-                    args=('-cpu', 'cortex-a53', '-icount', 'shift=1'))
+                    args=('-icount', 'shift=1'))
 
         with plugin_log as lf, \
              mmap.mmap(lf.fileno(), 0, access=mmap.ACCESS_READ) as s:
@@ -134,7 +133,7 @@ def test_aarch64_virt_mem_icount(self):
         self.run_vm(kernel_path, kernel_command_line,
                     "tests/plugin/libmem.so,arg=both", plugin_log.name,
                     console_pattern,
-                    args=('-cpu', 'cortex-a53', '-icount', 'shift=1'))
+                    args=('-icount', 'shift=1'))
 
         with plugin_log as lf, \
              mmap.mmap(lf.fileno(), 0, access=mmap.ACCESS_READ) as s:
-- 
2.31.1
