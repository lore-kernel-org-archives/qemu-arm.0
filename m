Received: by 2002:a0c:fe44:0:0:0:0:0 with SMTP id u4csp1027630qvs;
        Tue, 13 Jul 2021 14:21:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfGVV9f3yaxOQyzvVPNQxrU9ckgf7pKwT7Bc0azaKIU4TvO8AhQyk1n5yXMvdfgdpDrcDg
X-Received: by 2002:a17:907:7708:: with SMTP id kw8mr8253208ejc.111.1626211305482;
        Tue, 13 Jul 2021 14:21:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626211305; cv=none;
        d=google.com; s=arc-20160816;
        b=GpmEoGJtQz9tyyhw/yoEvz6gAYuilQ2n8B4ywxCyBp4z2MQxGDz2autp59oOmDlcIj
         Ja6CkAFylADDweOqkj47uk+V2bDCWeCqx2BNSYYWR00C/7kvTom7ztZrxXbmMkMEsXnV
         cGik3goT5p4OjZJ3OD2Al4d76nLZTe9vw1PrjwbnlWoodLg6Ust1BspjcpDtC/sLgtPd
         rTFIglPuvDk/eD2xdxBpoZEKgEatNFnz/wNr8OG1aBuHXhkm6PhJ5YnGJzHsdz9jYpQK
         9jY0IgQfPLVVPQWA5W7vy/6vMT4E1A/3hOH9T+TTAodKYJANK7PlKNFdh+mgXp09LB0s
         z6dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=snt2gY+1Tn6roJs4CdC0FTTEVPWvkwPrgfRH/7pXsGU=;
        b=ucRfy0X1Hu2yCqWzBvkLMoGZuCewqyQIWMjapeSpfxzVRzD+a2xoQMH1PzjIsb/x+/
         FsxY5G9NAduYELEid6Ce5bcY/wGH3xlBv7W06+LPsarqHqa8pjtYPHskyWIdauMUnXiS
         T7ZhrbYWG3dG7fuh8EtHx+XSy8xZx/uuDjiMxf8zJm1Sc0cFOS0HG7v2AWGH54t7CV6B
         urNvVDifoIJH96oZp/3SZCvAyjwvJ4nSpRWm6k58ccvsyOPL3P1jQidVdHK2ngiEs5pn
         IB48NJympU6NvsmO7uYslKqtYBzP7bcIfKb+N06J693JGJu4pzNmJRo0amE7WQ2mh4fn
         YHaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="XqFgw/HC";
       spf=pass (google.com: domain of crosa@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id d26si1266735edp.396.2021.07.13.14.21.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Jul 2021 14:21:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="XqFgw/HC";
       spf=pass (google.com: domain of crosa@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626211304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=snt2gY+1Tn6roJs4CdC0FTTEVPWvkwPrgfRH/7pXsGU=;
	b=XqFgw/HCjcrWcgpRx+nMJ1FOsQPZEIHbkZCQW+yYdaui1li3J6euYpUfvZLw1QxGEf650M
	7ixGVplDcLshbqj1wGppMWsSf7gAaX82DAHQXWGY2hAsJ3rNhHFKNHluK2Vl/RUixov40S
	nc8pZAZXncvmNUt5whEAvX794sSXmSM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-vbfEFe9dOHaQ3kP_vUmGFQ-1; Tue, 13 Jul 2021 17:21:41 -0400
X-MC-Unique: vbfEFe9dOHaQ3kP_vUmGFQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7694B343CD;
	Tue, 13 Jul 2021 21:21:39 +0000 (UTC)
Received: from p50.localhost.net (ovpn-117-22.rdu2.redhat.com [10.10.117.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CFC519C44;
	Tue, 13 Jul 2021 21:21:36 +0000 (UTC)
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
Subject: [PULL 16/23] tests/acceptance: Tagging tests with "cpu:VALUE"
Date: Tue, 13 Jul 2021 17:19:16 -0400
Message-Id: <20210713211923.3809241-17-crosa@redhat.com>
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
X-TUID: 28Fbq0x3ls/9

From: Wainer dos Santos Moschetta <wainersm@redhat.com>

The existing tests which are passing "-cpu VALUE" argument to the vm object
are now properly "cpu:VALUE" tagged, so letting the avocado_qemu framework to
handle that automatically.

Reviewed-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20210430133414.39905-5-wainersm@redhat.com>
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/boot_linux_console.py   | 13 ++++++++-----
 tests/acceptance/pc_cpu_hotplug_props.py |  2 +-
 tests/acceptance/replay_kernel.py        |  9 ++++++---
 tests/acceptance/virtio-gpu.py           |  4 ++--
 4 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 0a8222f17d..5248c8097d 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -239,6 +239,7 @@ def test_mips64el_malta_5KEc_cpio(self):
         :avocado: tags=arch:mips64el
         :avocado: tags=machine:malta
         :avocado: tags=endian:little
+        :avocado: tags=cpu:5KEc
         """
         kernel_url = ('https://github.com/philmd/qemu-testing-blob/'
                       'raw/9ad2df38/mips/malta/mips64el/'
@@ -258,8 +259,7 @@ def test_mips64el_malta_5KEc_cpio(self):
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE
                                + 'console=ttyS0 console=tty '
                                + 'rdinit=/sbin/init noreboot')
-        self.vm.add_args('-cpu', '5KEc',
-                         '-kernel', kernel_path,
+        self.vm.add_args('-kernel', kernel_path,
                          '-initrd', initrd_path,
                          '-append', kernel_command_line,
                          '-no-reboot')
@@ -287,7 +287,6 @@ def do_test_mips_malta32el_nanomips(self, kernel_url, kernel_hash):
                                + 'mem=256m@@0x0 '
                                + 'console=ttyS0')
         self.vm.add_args('-no-reboot',
-                         '-cpu', 'I7200',
                          '-kernel', kernel_path,
                          '-append', kernel_command_line)
         self.vm.launch()
@@ -299,6 +298,7 @@ def test_mips_malta32el_nanomips_4k(self):
         :avocado: tags=arch:mipsel
         :avocado: tags=machine:malta
         :avocado: tags=endian:little
+        :avocado: tags=cpu:I7200
         """
         kernel_url = ('https://mipsdistros.mips.com/LinuxDistro/nanomips/'
                       'kernels/v4.15.18-432-gb2eb9a8b07a1-20180627102142/'
@@ -311,6 +311,7 @@ def test_mips_malta32el_nanomips_16k_up(self):
         :avocado: tags=arch:mipsel
         :avocado: tags=machine:malta
         :avocado: tags=endian:little
+        :avocado: tags=cpu:I7200
         """
         kernel_url = ('https://mipsdistros.mips.com/LinuxDistro/nanomips/'
                       'kernels/v4.15.18-432-gb2eb9a8b07a1-20180627102142/'
@@ -323,6 +324,7 @@ def test_mips_malta32el_nanomips_64k_dbg(self):
         :avocado: tags=arch:mipsel
         :avocado: tags=machine:malta
         :avocado: tags=endian:little
+        :avocado: tags=cpu:I7200
         """
         kernel_url = ('https://mipsdistros.mips.com/LinuxDistro/nanomips/'
                       'kernels/v4.15.18-432-gb2eb9a8b07a1-20180627102142/'
@@ -335,6 +337,7 @@ def test_aarch64_virt(self):
         :avocado: tags=arch:aarch64
         :avocado: tags=machine:virt
         :avocado: tags=accel:tcg
+        :avocado: tags=cpu:cortex-a53
         """
         kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
                       '/linux/releases/29/Everything/aarch64/os/images/pxeboot'
@@ -1168,9 +1171,9 @@ def test_ppc64_e500(self):
         """
         :avocado: tags=arch:ppc64
         :avocado: tags=machine:ppce500
+        :avocado: tags=cpu:e5500
         """
         tar_hash = '6951d86d644b302898da2fd701739c9406527fe1'
-        self.vm.add_args('-cpu', 'e5500')
         self.do_test_advcal_2018('19', tar_hash, 'uImage')
 
     def test_ppc_g3beige(self):
@@ -1212,7 +1215,7 @@ def test_xtensa_lx60(self):
         """
         :avocado: tags=arch:xtensa
         :avocado: tags=machine:lx60
+        :avocado: tags=cpu:dc233c
         """
         tar_hash = '49e88d9933742f0164b60839886c9739cb7a0d34'
-        self.vm.add_args('-cpu', 'dc233c')
         self.do_test_advcal_2018('02', tar_hash, 'santas-sleigh-ride.elf')
diff --git a/tests/acceptance/pc_cpu_hotplug_props.py b/tests/acceptance/pc_cpu_hotplug_props.py
index f48f68fc6b..2e86d5017a 100644
--- a/tests/acceptance/pc_cpu_hotplug_props.py
+++ b/tests/acceptance/pc_cpu_hotplug_props.py
@@ -25,11 +25,11 @@
 class OmittedCPUProps(Test):
     """
     :avocado: tags=arch:x86_64
+    :avocado: tags=cpu:qemu64
     """
     def test_no_die_id(self):
         self.vm.add_args('-nodefaults', '-S')
         self.vm.add_args('-smp', '1,sockets=2,cores=2,threads=2,maxcpus=8')
-        self.vm.add_args('-cpu', 'qemu64')
         self.vm.add_args('-device', 'qemu64-x86_64-cpu,socket-id=1,core-id=0,thread-id=0')
         self.vm.launch()
         self.assertEquals(len(self.vm.command('query-cpus-fast')), 2)
diff --git a/tests/acceptance/replay_kernel.py b/tests/acceptance/replay_kernel.py
index 75f80506c1..bb32b31240 100644
--- a/tests/acceptance/replay_kernel.py
+++ b/tests/acceptance/replay_kernel.py
@@ -392,6 +392,7 @@ def test_mips64el_malta_5KEc_cpio(self):
         :avocado: tags=machine:malta
         :avocado: tags=endian:little
         :avocado: tags=slowness:high
+        :avocado: tags=cpu:5KEc
         """
         kernel_url = ('https://github.com/philmd/qemu-testing-blob/'
                       'raw/9ad2df38/mips/malta/mips64el/'
@@ -412,7 +413,7 @@ def test_mips64el_malta_5KEc_cpio(self):
                                'rdinit=/sbin/init noreboot')
         console_pattern = 'Boot successful.'
         self.run_rr(kernel_path, kernel_command_line, console_pattern, shift=5,
-                    args=('-initrd', initrd_path, '-cpu', '5KEc'))
+                    args=('-initrd', initrd_path))
 
     def do_test_mips_malta32el_nanomips(self, kernel_path_xz):
         kernel_path = self.workdir + "kernel"
@@ -424,14 +425,14 @@ def do_test_mips_malta32el_nanomips(self, kernel_path_xz):
                                'mem=256m@@0x0 '
                                'console=ttyS0')
         console_pattern = 'Kernel command line: %s' % kernel_command_line
-        self.run_rr(kernel_path, kernel_command_line, console_pattern, shift=5,
-                    args=('-cpu', 'I7200'))
+        self.run_rr(kernel_path, kernel_command_line, console_pattern, shift=5)
 
     def test_mips_malta32el_nanomips_4k(self):
         """
         :avocado: tags=arch:mipsel
         :avocado: tags=machine:malta
         :avocado: tags=endian:little
+        :avocado: tags=cpu:I7200
         """
         kernel_url = ('https://mipsdistros.mips.com/LinuxDistro/nanomips/'
                       'kernels/v4.15.18-432-gb2eb9a8b07a1-20180627102142/'
@@ -445,6 +446,7 @@ def test_mips_malta32el_nanomips_16k_up(self):
         :avocado: tags=arch:mipsel
         :avocado: tags=machine:malta
         :avocado: tags=endian:little
+        :avocado: tags=cpu:I7200
         """
         kernel_url = ('https://mipsdistros.mips.com/LinuxDistro/nanomips/'
                       'kernels/v4.15.18-432-gb2eb9a8b07a1-20180627102142/'
@@ -458,6 +460,7 @@ def test_mips_malta32el_nanomips_64k_dbg(self):
         :avocado: tags=arch:mipsel
         :avocado: tags=machine:malta
         :avocado: tags=endian:little
+        :avocado: tags=cpu:I7200
         """
         kernel_url = ('https://mipsdistros.mips.com/LinuxDistro/nanomips/'
                       'kernels/v4.15.18-432-gb2eb9a8b07a1-20180627102142/'
diff --git a/tests/acceptance/virtio-gpu.py b/tests/acceptance/virtio-gpu.py
index e7979343e9..589332c1b7 100644
--- a/tests/acceptance/virtio-gpu.py
+++ b/tests/acceptance/virtio-gpu.py
@@ -60,6 +60,7 @@ def test_virtio_vga_virgl(self):
         """
         :avocado: tags=arch:x86_64
         :avocado: tags=device:virtio-vga
+        :avocado: tags=cpu:host
         """
         kernel_command_line = (
             self.KERNEL_COMMON_COMMAND_LINE + "console=ttyS0 rdinit=/bin/bash"
@@ -72,7 +73,6 @@ def test_virtio_vga_virgl(self):
         initrd_path = self.fetch_asset(self.INITRD_URL)
 
         self.vm.set_console()
-        self.vm.add_args("-cpu", "host")
         self.vm.add_args("-m", "2G")
         self.vm.add_args("-machine", "pc,accel=kvm")
         self.vm.add_args("-device", "virtio-vga,virgl=on")
@@ -101,6 +101,7 @@ def test_vhost_user_vga_virgl(self):
         """
         :avocado: tags=arch:x86_64
         :avocado: tags=device:vhost-user-vga
+        :avocado: tags=cpu:host
         """
         kernel_command_line = (
             self.KERNEL_COMMON_COMMAND_LINE + "console=ttyS0 rdinit=/bin/bash"
@@ -140,7 +141,6 @@ def test_vhost_user_vga_virgl(self):
         )
 
         self.vm.set_console()
-        self.vm.add_args("-cpu", "host")
         self.vm.add_args("-m", "2G")
         self.vm.add_args("-object", "memory-backend-memfd,id=mem,size=2G")
         self.vm.add_args("-machine", "pc,memory-backend=mem,accel=kvm")
-- 
2.31.1
