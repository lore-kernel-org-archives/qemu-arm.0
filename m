Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id f17-20020a05600c155100b004083729fc14sm8491006wmg.20.2023.12.01.01.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 01:36:34 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 3D5945FB65;
	Fri,  1 Dec 2023 09:36:34 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eric Farman <farman@linux.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Beraldo Leal <bleal@redhat.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Radoslaw Biernacki <rad@semihalf.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Eric Auger <eric.auger@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	qemu-s390x@nongnu.org,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Cleber Rosa <crosa@redhat.com>,
	Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH v2 3/7] tests/avocado: drop BootLinuxConsole.test_mips_malta_cpio test
Date: Fri,  1 Dec 2023 09:36:29 +0000
Message-Id: <20231201093633.2551497-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231201093633.2551497-1-alex.bennee@linaro.org>
References: <20231201093633.2551497-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: DAVpohPH5ILx

The assets are no longer archived by Debian so we can't run this on
CI. While some people may still have the test in their cache we do
have more recent images from tuxrun so this isn't a great loss.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/avocado/boot_linux_console.py | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index 231b4f68e5..5d978f6dd0 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -116,28 +116,6 @@ def test_x86_64_pc(self):
         console_pattern = 'Kernel command line: %s' % kernel_command_line
         self.wait_for_console_pattern(console_pattern)
 
-    def test_mips_malta(self):
-        """
-        :avocado: tags=arch:mips
-        :avocado: tags=machine:malta
-        :avocado: tags=endian:big
-        """
-        deb_url = ('http://snapshot.debian.org/archive/debian/'
-                   '20130217T032700Z/pool/main/l/linux-2.6/'
-                   'linux-image-2.6.32-5-4kc-malta_2.6.32-48_mips.deb')
-        deb_hash = 'a8cfc28ad8f45f54811fc6cf74fc43ffcfe0ba04'
-        deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
-        kernel_path = self.extract_from_deb(deb_path,
-                                            '/boot/vmlinux-2.6.32-5-4kc-malta')
-
-        self.vm.set_console()
-        kernel_command_line = self.KERNEL_COMMON_COMMAND_LINE + 'console=ttyS0'
-        self.vm.add_args('-kernel', kernel_path,
-                         '-append', kernel_command_line)
-        self.vm.launch()
-        console_pattern = 'Kernel command line: %s' % kernel_command_line
-        self.wait_for_console_pattern(console_pattern)
-
     def test_mips64el_malta(self):
         """
         This test requires the ar tool to extract "data.tar.gz" from
-- 
2.39.2
