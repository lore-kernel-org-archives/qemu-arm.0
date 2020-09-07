Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp3445278lfc;
        Sun, 6 Sep 2020 21:20:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxA/mBPwNrsFE0R8k/SbCdIwwIDyA+OI+pxdfSCZMBpKm9WXq30ECTjGLEqaKrZ8Me5KFkg
X-Received: by 2002:a25:61c2:: with SMTP id v185mr21775851ybb.314.1599452422958;
        Sun, 06 Sep 2020 21:20:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599452422; cv=none;
        d=google.com; s=arc-20160816;
        b=z8o5jYkTyV3nJpt8YMy+jfGEGxE5sFTHHpi0yS/dmmM3yzaaIQgIaRvhJKgq2xjN37
         FbGFBdyMFiuu69+r8gKO29AESlFkONPiiCZZ0fX9JcgvBBeeidOY+ePh/CF7i0SNk97A
         L0hyDPibX1bm3uCRivEeOBKSLqxkdGKP6s+xJ6Eo5ePNBEGnqtCw0UabxjNuujHxjT67
         49tXftDU48ez4db5bz1xN/6uqgej+JezfjXgqXvru+C3Jm6Oe1M618KDR0KXRVfzy3YV
         ziA3aCKOCJy1NnqFf1o0f16W7ES/JWS0Au77PJj70sAoKBlPxQFI5O/zKIBbfUcrscU8
         KWCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=1sO/F9TedgAcWLmV1eWEgoBI98exY9YnRjP3JaWCDl0=;
        b=E9yPXTyHq6vOyzJZSfJwqAgmaJIVMVNsIObvIGimuQbVtEhqnDcWSptczN6dIrofdu
         GaOxEz/3DrVF1rF+BwjU+vjv3R9YC8Vg2DX/tofAQwgdXPpNEu7VBf26YNlbyqxS6mwA
         lM/R470F9zwKQJ/cgNl2RyB9i1q4PRNd1yvuf/4yGu91f3Tl/htIjH69RLgk4NL3sQQG
         iy1JFwSus2QANok4Uh4Bf5+WuqpgNeziPnG9M35V9r8n3jGIKrbta6hpeXJAdJiV/BvE
         c5NQR3o8AmfWNiPG4bEwf01fhi2lWFGpIu+MD0lDJkjtNvpsSQwSy21DPDsfoDFAOm+Z
         UDJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QN4eR40K;
       spf=pass (google.com: domain of crosa@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id i84si13080330yba.443.2020.09.06.21.20.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 06 Sep 2020 21:20:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 205.139.110.120 as permitted sender) client-ip=205.139.110.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QN4eR40K;
       spf=pass (google.com: domain of crosa@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599452422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1sO/F9TedgAcWLmV1eWEgoBI98exY9YnRjP3JaWCDl0=;
	b=QN4eR40KjuGRw3s/noBKsHm7vRdqhO7SUhiD1NGLkTIzSIGqMuhkmbOYgLu55luqGQlst9
	QL+LAXQfQc5qDTBbHk/hw/uAtA+dWkwTCgm94JR6hMQN3gnrq6d3XK5iPLWvuIlmhrGsLN
	loNnNGSWnitiQ2FEjh4zIu2UZ5lgwAw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-VvGfPN2DNMS6gq778xRX0Q-1; Mon, 07 Sep 2020 00:20:16 -0400
X-MC-Unique: VvGfPN2DNMS6gq778xRX0Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0134E1009443;
	Mon,  7 Sep 2020 04:20:14 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-120-166.rdu2.redhat.com [10.10.120.166])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 354F21002D49;
	Mon,  7 Sep 2020 04:20:10 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Cc: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Fabien Chouteau <chouteau@adacore.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Cleber Rosa <crosa@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Beraldo Leal <bleal@redhat.com>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Willian Rampazzo <wrampazz@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Sarah Harris <S.E.Harris@kent.ac.uk>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 1/4] Acceptance tests: use an available kernel image package for arm
Date: Mon,  7 Sep 2020 00:19:57 -0400
Message-Id: <20200907042000.415931-2-crosa@redhat.com>
In-Reply-To: <20200907042000.415931-1-crosa@redhat.com>
References: <20200907042000.415931-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TUID: CQeCxoEszsIy

Which means a newer kernel version.  Expected output was changed
to match the new kernel too.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/boot_linux_console.py | 44 +++++++++++++-------------
 tests/acceptance/replay_kernel.py      |  8 ++---
 2 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index aaa781a581..751b47b8fd 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -490,12 +490,12 @@ class BootLinuxConsole(LinuxKernelTest):
         :avocado: tags=arch:arm
         :avocado: tags=machine:cubieboard
         """
-        deb_url = ('https://apt.armbian.com/pool/main/l/'
-                   'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb')
-        deb_hash = '1334c29c44d984ffa05ed10de8c3361f33d78315'
+        deb_url = ('https://apt.armbian.com/pool/main/l/linux-5.8.0-sunxi/'
+                   'linux-image-dev-sunxi_20.08_armhf.deb')
+        deb_hash = 'ae553a9f7d43b18abfa8f3e64bf2d31878b9be89'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
         kernel_path = self.extract_from_deb(deb_path,
-                                            '/boot/vmlinuz-4.20.7-sunxi')
+                                            '/boot/vmlinuz-5.8.0-sunxi')
         dtb_path = '/usr/lib/linux-image-dev-sunxi/sun4i-a10-cubieboard.dtb'
         dtb_path = self.extract_from_deb(deb_path, dtb_path)
         initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
@@ -522,7 +522,7 @@ class BootLinuxConsole(LinuxKernelTest):
         exec_command_and_wait_for_pattern(self, 'cat /proc/cpuinfo',
                                                 'Allwinner sun4i/sun5i')
         exec_command_and_wait_for_pattern(self, 'cat /proc/iomem',
-                                                'system-control@1c00000')
+                                                '1c00000.system-control')
         # cubieboard's reboot is not functioning; omit reboot test.
 
     def test_arm_cubieboard_sata(self):
@@ -530,12 +530,12 @@ class BootLinuxConsole(LinuxKernelTest):
         :avocado: tags=arch:arm
         :avocado: tags=machine:cubieboard
         """
-        deb_url = ('https://apt.armbian.com/pool/main/l/'
-                   'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb')
-        deb_hash = '1334c29c44d984ffa05ed10de8c3361f33d78315'
+        deb_url = ('https://apt.armbian.com/pool/main/l/linux-5.8.0-sunxi/'
+                   'linux-image-dev-sunxi_20.08_armhf.deb')
+        deb_hash = 'ae553a9f7d43b18abfa8f3e64bf2d31878b9be89'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
         kernel_path = self.extract_from_deb(deb_path,
-                                            '/boot/vmlinuz-4.20.7-sunxi')
+                                            '/boot/vmlinuz-5.8.0-sunxi')
         dtb_path = '/usr/lib/linux-image-dev-sunxi/sun4i-a10-cubieboard.dtb'
         dtb_path = self.extract_from_deb(deb_path, dtb_path)
         rootfs_url = ('https://github.com/groeck/linux-build-test/raw/'
@@ -573,12 +573,12 @@ class BootLinuxConsole(LinuxKernelTest):
         :avocado: tags=arch:arm
         :avocado: tags=machine:orangepi-pc
         """
-        deb_url = ('https://apt.armbian.com/pool/main/l/'
-                   'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb')
-        deb_hash = '1334c29c44d984ffa05ed10de8c3361f33d78315'
+        deb_url = ('https://apt.armbian.com/pool/main/l/linux-5.8.0-sunxi/'
+                   'linux-image-dev-sunxi_20.08_armhf.deb')
+        deb_hash = 'ae553a9f7d43b18abfa8f3e64bf2d31878b9be89'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
         kernel_path = self.extract_from_deb(deb_path,
-                                            '/boot/vmlinuz-4.20.7-sunxi')
+                                            '/boot/vmlinuz-5.8.0-sunxi')
         dtb_path = '/usr/lib/linux-image-dev-sunxi/sun8i-h3-orangepi-pc.dtb'
         dtb_path = self.extract_from_deb(deb_path, dtb_path)
 
@@ -598,12 +598,12 @@ class BootLinuxConsole(LinuxKernelTest):
         :avocado: tags=arch:arm
         :avocado: tags=machine:orangepi-pc
         """
-        deb_url = ('https://apt.armbian.com/pool/main/l/'
-                   'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb')
-        deb_hash = '1334c29c44d984ffa05ed10de8c3361f33d78315'
+        deb_url = ('https://apt.armbian.com/pool/main/l/linux-5.8.0-sunxi/'
+                   'linux-image-dev-sunxi_20.08_armhf.deb')
+        deb_hash = 'ae553a9f7d43b18abfa8f3e64bf2d31878b9be89'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
         kernel_path = self.extract_from_deb(deb_path,
-                                            '/boot/vmlinuz-4.20.7-sunxi')
+                                            '/boot/vmlinuz-5.8.0-sunxi')
         dtb_path = '/usr/lib/linux-image-dev-sunxi/sun8i-h3-orangepi-pc.dtb'
         dtb_path = self.extract_from_deb(deb_path, dtb_path)
         initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
@@ -629,7 +629,7 @@ class BootLinuxConsole(LinuxKernelTest):
         exec_command_and_wait_for_pattern(self, 'cat /proc/cpuinfo',
                                                 'Allwinner sun8i Family')
         exec_command_and_wait_for_pattern(self, 'cat /proc/iomem',
-                                                'system-control@1c00000')
+                                                '1c00000.system-control')
         exec_command_and_wait_for_pattern(self, 'reboot',
                                                 'reboot: Restarting system')
         # Wait for VM to shut down gracefully
@@ -641,12 +641,12 @@ class BootLinuxConsole(LinuxKernelTest):
         :avocado: tags=machine:orangepi-pc
         :avocado: tags=device:sd
         """
-        deb_url = ('https://apt.armbian.com/pool/main/l/'
-                   'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb')
-        deb_hash = '1334c29c44d984ffa05ed10de8c3361f33d78315'
+        deb_url = ('https://apt.armbian.com/pool/main/l/linux-5.8.0-sunxi/'
+                   'linux-image-dev-sunxi_20.08_armhf.deb')
+        deb_hash = 'ae553a9f7d43b18abfa8f3e64bf2d31878b9be89'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
         kernel_path = self.extract_from_deb(deb_path,
-                                            '/boot/vmlinuz-4.20.7-sunxi')
+                                            '/boot/vmlinuz-5.8.0-sunxi')
         dtb_path = '/usr/lib/linux-image-dev-sunxi/sun8i-h3-orangepi-pc.dtb'
         dtb_path = self.extract_from_deb(deb_path, dtb_path)
         rootfs_url = ('http://storage.kernelci.org/images/rootfs/buildroot/'
diff --git a/tests/acceptance/replay_kernel.py b/tests/acceptance/replay_kernel.py
index b79fc8daf8..80a460814f 100644
--- a/tests/acceptance/replay_kernel.py
+++ b/tests/acceptance/replay_kernel.py
@@ -132,12 +132,12 @@ class ReplayKernel(LinuxKernelTest):
         :avocado: tags=arch:arm
         :avocado: tags=machine:cubieboard
         """
-        deb_url = ('https://apt.armbian.com/pool/main/l/'
-                   'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb')
-        deb_hash = '1334c29c44d984ffa05ed10de8c3361f33d78315'
+        deb_url = ('https://apt.armbian.com/pool/main/l/linux-5.8.0-sunxi/'
+                   'linux-image-dev-sunxi_20.08_armhf.deb')
+        deb_hash = 'ae553a9f7d43b18abfa8f3e64bf2d31878b9be89'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
         kernel_path = self.extract_from_deb(deb_path,
-                                            '/boot/vmlinuz-4.20.7-sunxi')
+                                            '/boot/vmlinuz-5.8.0-sunxi')
         dtb_path = '/usr/lib/linux-image-dev-sunxi/sun4i-a10-cubieboard.dtb'
         dtb_path = self.extract_from_deb(deb_path, dtb_path)
         initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
-- 
2.25.4
