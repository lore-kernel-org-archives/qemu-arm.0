Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id o9-20020a5d58c9000000b00332e1c46dddsm3662260wrf.98.2023.12.01.01.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 01:36:34 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 51E915FB67;
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 4/7] tests/avocado: drop malta yamon tests
Date: Fri,  1 Dec 2023 09:36:30 +0000
Message-Id: <20231201093633.2551497-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231201093633.2551497-1-alex.bennee@linaro.org>
References: <20231201093633.2551497-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: R66bVVGEp/fX

The assets are no longer available on the website so these are
blocking CI.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/avocado/machine_mips_malta.py | 37 -----------------------------
 1 file changed, 37 deletions(-)

diff --git a/tests/avocado/machine_mips_malta.py b/tests/avocado/machine_mips_malta.py
index 959dcf5602..3a1ec85c20 100644
--- a/tests/avocado/machine_mips_malta.py
+++ b/tests/avocado/machine_mips_malta.py
@@ -122,40 +122,3 @@ def test_mips_malta_i6400_framebuffer_logo_8cores(self):
         :avocado: tags=mips:smp
         """
         self.do_test_i6400_framebuffer_logo(8)
-
-class MaltaMachine(QemuSystemTest):
-
-    def do_test_yamon(self):
-        rom_url = ('http://www.imgtec.com/tools/mips-tools/downloads/'
-                   'yamon/yamon-bin-02.22.zip')
-        rom_hash = '8da7ecddbc5312704b8b324341ee238189bde480'
-        zip_path = self.fetch_asset(rom_url, asset_hash=rom_hash)
-
-        archive.extract(zip_path, self.workdir)
-        yamon_path = os.path.join(self.workdir, 'yamon-02.22.bin')
-
-        self.vm.set_console()
-        self.vm.add_args('-bios', yamon_path)
-        self.vm.launch()
-
-        prompt =  'YAMON>'
-        pattern = 'YAMON ROM Monitor'
-        interrupt_interactive_console_until_pattern(self, pattern, prompt)
-        wait_for_console_pattern(self, prompt)
-        self.vm.shutdown()
-
-    def test_mipsel_malta_yamon(self):
-        """
-        :avocado: tags=arch:mipsel
-        :avocado: tags=machine:malta
-        :avocado: tags=endian:little
-        """
-        self.do_test_yamon()
-
-    def test_mips64el_malta_yamon(self):
-        """
-        :avocado: tags=arch:mips64el
-        :avocado: tags=machine:malta
-        :avocado: tags=endian:little
-        """
-        self.do_test_yamon()
-- 
2.39.2
